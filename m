Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F47DCAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 07:46:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.10829.1758267954606383873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 00:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=raBuR0eg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B396B1A0F04
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:45:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 843AA606A8;
	Fri, 19 Sep 2025 07:45:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E24A102F1CD5;
	Fri, 19 Sep 2025 09:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758267952; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MGC2UiYIGkm4OTBY8smaLgXYia1JG/a55/Awgen2Sw0=;
	b=raBuR0egoWSA0EZ09OsfBez0BP1b+aLaNknqAEcsxdwmj5ewfem6ySkBMAU03QAW6AGATe
	d4wTgyCNLTtF+g/5tPRiAf5wKAESvb8igZiT7EdeGQv5P17XuPZI7F21ckSnweC4AmIqBx
	1Mfelld5bPxYn9y5Y4gB4yWoTAzHd5F0wgkwsKuzzK0qQRaXZP1tUbU2cSx/aHcUAya5pB
	dGpcV9Rkr5MzlrQ4F92NUEFYnRtN8HdOEQFfEzd6tIx5gczzE7HkuIFQza9MgdcEv9fAAu
	3yvCmVqtYEeACY7ks4wTTe5bOkts1AEKTV/mxK3oFy3LSlzNUpj681ylpyXRIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Sep 2025 09:45:49 +0200
Message-Id: <DCWLYWUK8G7M.3O4CV1EP8CAGP@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/19] fedora_essential.sh: add
 util-linux-script package
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
 <20250918210754.477049-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-2-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223725

On Thu Sep 18, 2025 at 11:07 PM CEST, Adrian Freihofer via lists.openembedd=
ed.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> The util-linux-script package provides the 'script' command which is
> required by devtool for terminal session recording functionality.
>
> Without this package this error can occur on Fedora 42:
>
> /bin/sh: line 1: script: command not found
> Traceback (most recent call last):
>   File "/home/adrian/projets/oss/poky/scripts/devtool", line 352, in <mod=
ule>
>     ret =3D main()
>   File "/home/adrian/projets/oss/poky/scripts/devtool", line 338, in main
>     ret =3D args.func(args, config, basepath, workspace)
>   File "/home/adrian/projets/oss/poky/scripts/lib/devtool/ide_sdk.py", li=
ne 980, in ide_setup
>     exec_build_env_command(
>     ~~~~~~~~~~~~~~~~~~~~~~^
>         config.init_path, basepath, bb_cmd_early, watch=3DTrue)
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/adrian/projets/oss/poky/scripts/lib/devtool/__init__.py", l=
ine 47, in exec_build_env_command
>     return exec_watch('%s%s' % (init_prefix, cmd), **options)
>   File "/home/adrian/projets/oss/poky/scripts/lib/devtool/__init__.py", l=
ine 73, in exec_watch
>     raise bb.process.ExecutionError(cmd, process.returncode, buf, None)
> bb.process.ExecutionError: Execution of 'script -e -q -c "bitbake oe-self=
test-image:do_build \
>   cmake-example:do_install gdb-cross-x86_64:do_addto_recipe_sysroot meson=
-example:do_install" =C2=AB
>   /dev/null' failed with exit code 127:
> /bin/sh: line 1: script: command not found
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/tools/host_packages_scripts/fedora_essential.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/tools/host_packages_scripts/fedora_essential.s=
h b/documentation/tools/host_packages_scripts/fedora_essential.sh
> index ea14134398b..f65b0494e85 100644
> --- a/documentation/tools/host_packages_scripts/fedora_essential.sh
> +++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
> @@ -1 +1 @@
> -sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file f=
indutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname l=
ibacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy per=
l-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale py=
thon python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip r=
pcgen socat tar texinfo unzip wget which xz zstd
> +sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file f=
indutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname l=
ibacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy per=
l-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale py=
thon python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip r=
pcgen socat tar texinfo unzip util-linux-script wget which xz zstd

Hi Adrian,

Thanks for the patch. Can you Cc docs@lists.yoctoproject.org next time so I
there's no chance I miss it?

This is probably needed on other distros as well, c.f.
https://pkgs.org/search/?q=3D%2Fusr%2Fbin%2Fscript.=20

Can you take the time to send patches for other distros?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


