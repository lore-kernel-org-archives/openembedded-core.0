Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73C2676FB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84MBpfj024800; Fri, 4 Sep 2015 23:11:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uvnAeJD4wFyt; Fri,  4 Sep 2015 23:11:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84MBaDf024796
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Sep 2015 23:11:47 +0100
Message-ID: <1441404696.24871.201.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Date: Fri, 04 Sep 2015 23:11:36 +0100
In-Reply-To: <73dacaee8b4314edec63ee5b383d2fa1d4cdfc87.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
	<73dacaee8b4314edec63ee5b383d2fa1d4cdfc87.1441374016.git.joshua.lock@collabora.co.uk>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/9] kmod: fix link creation when base_bindir != /bin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Sep 2015 22:11:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-04 at 15:59 +0100, Joshua Lock wrote:
> If base_bindir is not a direct child of / the link creation in
> do_install_append creates incorrect relative links.
> 
> Instead pass a full path to the link source and use the -r flag
> to ln to ensure the link is relative.
> 
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-kernel/kmod/kmod_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
> index ba4d85e..120fd87 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -21,9 +21,9 @@ do_install_append () {
>          install -dm755 ${D}${base_bindir}
>          install -dm755 ${D}${base_sbindir}
>          # add symlinks to kmod
> -        ln -s ..${base_bindir}/kmod ${D}${base_bindir}/lsmod
> +        ln -sr ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
>          for tool in insmod rmmod depmod modinfo modprobe; do
> -                ln -s ..${base_bindir}/kmod ${D}${base_sbindir}/${tool}
> +                ln -sr ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
>          done
>          # configuration directories
>          install -dm755 ${D}${base_libdir}/depmod.d

Not all our build machines appear to support ln -r, e.g.:

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/479/steps/BuildImages/logs/stdio

(debian7)

We do however have a python script called "lnr" in scripts which might
help...

Cheers,

Richard


