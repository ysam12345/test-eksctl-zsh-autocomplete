FROM ubuntu:latest
MAINTAINER ysam12345

# install nessary packages
RUN apt-get update
RUN apt-get install -y curl zsh
# install latest eksctl
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin
# apply zsh autocomplete
RUN mkdir -p ~/.zsh/completion/
RUN eksctl completion zsh > ~/.zsh/completion/_eksctl
RUN printf 'fpath=($fpath ~/.zsh/completion)\nautoload -U compinit\ncompinit\n' > ~/.zshrc
CMD ["zsh"]
