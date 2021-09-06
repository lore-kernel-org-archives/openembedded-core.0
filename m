Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web12.24285.1630946196970751128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 09:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=SNUBmUhv;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id NHbfmbgt01q2pNHbhmpfeF; Mon, 06 Sep 2021 17:36:34 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=E/5WWZVl c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=7QKq2e-ADPsA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=k7Ncw-rvucPuCjS-EZwA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=jSzbMn1vNk7I1Zpe7KkUPsMMIw2cwZZOqorV2Otrtgc=; b=SNUBm
	Uhv75JD1dnmpiEeTnVVr++n6hFa7Lbok3L4ZY/z8uFFr/4rU9geZ1XYN+SWFgG2/7nZIkEpKtX96P
	lOPb6ASkY6pZCgIFyzc/qxilTgmYbWRo2FNIi8X2mdxC4UFRx4tcnzUFDimB9OZe2FtTV0rZfugDm
	hjRpcOzJAGT43sL/qI6N8CqAEmBDKU095ZZ0ptc+MnU79iZ22VZzOI8HnR0hA3xxnatf9tFx9520a
	2XDlgYQ3rnjQAdI5oDPfq3xSuVocax1BcK0Ph0uqdr/pkhmyBX4C71KZRvYsoSXmqc13hNrUWhhwe
	nqjHsXiLCKN/n0p3Hz/W/EWLtTyrA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mNHbf-00GSGd-6n
	for openembedded-core@lists.openembedded.org; Mon, 06 Sep 2021 17:36:27 +0100
Date: Mon, 6 Sep 2021 17:36:27 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] test-openat: Consider device as well as inode number
Message-ID: <YTZDi+62lXYaMFnP@mcrowe.com>
References: <169A4FE272BB166C.28384@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <169A4FE272BB166C.28384@lists.openembedded.org>
X-CMAE-Envelope: MS4wfD4y2LX/yKsySJpch1V5+g7zvKUb/BK+d0kbMXIxY51i/dlfDFjhPpqv91UyzhgWivF3U4tEpxdNtQLcK65uRVrSPzCQyod0+r/sYSn1VOD2u+MeQeHu
 iwyEo6F5Ht+w9PPgRdADFjZNmItkAHSKvQXJwFtzZ8aezBfET0xdhrT+0FjvsEPVH6DlBtORN7RncQ==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 11 August 2021 at 18:13:54 +0100, Mike Crowe via lists.openembedded.org wrote:
> It just so happens that my /home/mac and /home directories have the same
> inode number but on different filesystems.
> 
> This means that test-openat fails with "Recursion failed!" even when run
> without pseudo.
> 
> Let's consider both the device number and the inode number before
> assuming that we've found the same directory again.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  test/test-openat.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/test/test-openat.c b/test/test-openat.c
> index b710285..df6655a 100644
> --- a/test/test-openat.c
> +++ b/test/test-openat.c
> @@ -25,11 +25,13 @@ int main () {
>      int fd, dir_fd;
>      struct stat st;
>      ino_t ino;
> +    dev_t dev;
>      char *path;
>  
>      fd = openat(AT_FDCWD, ".", O_DIRECTORY, 0);
>      fstat(fd, &st);
>      ino = st.st_ino;
> +    dev = st.st_dev;
>  
>      while (1) {
>          path = path_of(fd);
> @@ -37,7 +39,7 @@ int main () {
>  
>          dir_fd = openat(fd, "../", O_DIRECTORY, 0);
>          fstat(dir_fd, &st);
> -        if (st.st_ino == ino) {
> +        if (st.st_ino == ino && st.st_dev == dev) {
>              if (strcmp(path, "/") == 0) {
>                  //puts("Reached top of tree");
>                  return 0;
> @@ -49,6 +51,7 @@ int main () {
>  
>          free (path);
>          ino = st.st_ino;
> +        dev = st.st_dev;
>          fd = dir_fd;
>      }
>      return 0;
> -- 
> 2.30.2
> 

Ping!

Mike.
