Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAD7C83F2B
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 07:22:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11411.1693466533158862680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 00:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=gm1 header.b=AHx3p7KV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA0AAC000C;
	Thu, 31 Aug 2023 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693466531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8cHyuJ6CyHR3le13HvdnMsSC9GvyLY21vTHq3iPPY8=;
	b=AHx3p7KVy9CokS+b2JDRQPEuccDIXnk6Wn0RgaMc7PAJia4cEycSLUOgnFaOD24nqEyBJI
	5yuXlysF/8OuuB8lGNksdDoXX7o3VLJdBdwo+ZeKg3fA8WvsXvgVMJtZid3KHl43OOE87b
	BYPNc05ObtFfKvDkgXddyW/uCZeRkwbWaqbtPtJU0z7PAGfZapfY9LrAqgTvjAav7Nz1bw
	lYicXkdyUMKYFKuZ9xCYRv3t/AQwdqBQLtHXh089plxJFg4WfP78tx6lzZ8YF1Jqf0ncfv
	0rKJGQNwnS5DC/P6MimWMGuYRXNZcJ9Foybo/Y1IbmGcNG/6iXv5/OV9KuyyCQ==
Date: Thu, 31 Aug 2023 09:22:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH v2 1/3] inetutils: don't guess target paths
Message-ID: <202308310722108152e2de@mail.local>
References: <20230830102039.166372-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830102039.166372-1-ross.burton@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186961

Hello Ross,

I think this causes failures with musl:
ERROR: inetutils-2.4-r0 do_configure: Default path values used, these must be set explicitly

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7684/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7706/steps/12/logs/stdio

On 30/08/2023 11:20:37+0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> inetutils guesses a lot of target paths in cross builds, and warns that
> some of them are known to be wrong (for example, whether /proc/net/dev
> exists is guessed as 'no').
> 
> Add a post-configure function to check for these warnings, and pass
> --with-path-* as appropriate to set the paths explicitly.
> 
> This means we can remove the patch which was setting PATH_PROCNET_DEV,
> and the autoconf cache value inetutils_cv_path_login.
> 
> The downside is that these --with-path-* options are not real autoconf
> options, so the "unknown options" warning is emitted.  Losing those is
> an acceptable compromise, so disable it.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../inetutils-1.9-PATH_PROCNET_DEV.patch      | 37 -------------------
>  .../inetutils/inetutils_2.4.bb                | 19 ++++++++--
>  2 files changed, 16 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
> 
> diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
> deleted file mode 100644
> index 460ddf98300..00000000000
> --- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 101130f422dd5c01a1459645d7b2a5b8d19720ab Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Wed, 6 Mar 2019 09:36:11 -0500
> -Subject: [PATCH] inetutils: define PATH_PROCNET_DEV if not already defined
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -this prevents the following compilation error :
> -system/linux.c:401:15: error: 'PATH_PROCNET_DEV' undeclared (first use in this function)
> -
> -this patch comes from :
> - http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/
> -
> -Upstream-Status: Inappropriate [not author]
> -
> -Signed-of-by: Eric B�nard <eric@eukrea.com>
> -
> ----
> - ifconfig/system/linux.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/ifconfig/system/linux.c b/ifconfig/system/linux.c
> -index e453b46..4268ca9 100644
> ---- a/ifconfig/system/linux.c
> -+++ b/ifconfig/system/linux.c
> -@@ -53,6 +53,10 @@
> - #include "../ifconfig.h"
> - 
> - 
> -+#ifndef PATH_PROCNET_DEV
> -+  #define PATH_PROCNET_DEV "/proc/net/dev"
> -+#endif
> -+
> - /* ARPHRD stuff.  */
> - 
> - static void
> diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
> index 85e9f642b30..fdbcbb53369 100644
> --- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
> +++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
> @@ -20,7 +20,6 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
>             file://rsh.xinetd.inetutils \
>             file://telnet.xinetd.inetutils \
>             file://tftpd.xinetd.inetutils \
> -           file://inetutils-1.9-PATH_PROCNET_DEV.patch \
>             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
>             file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
>             file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
> @@ -42,15 +41,29 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6 gl_cv_socket_ipv6=no,"
>  PACKAGECONFIG[ping6] = "--enable-ping6,--disable-ping6,"
>  
>  EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
> -        inetutils_cv_path_login=${base_bindir}/login \
>          --with-libreadline-prefix=${STAGING_LIBDIR} \
>          --enable-rpath=no \
> -"
> +        --with-path-login=${base_bindir}/login \
> +        --with-path-cp=${base_bindir}/cp \
> +        --with-path-uucico=${libexecdir}/uuico \
> +        --with-path-procnet-dev=/proc/net/dev \
> +        "
>  
>  # These are horrible for security, disable them
>  EXTRA_OECONF:append = " --disable-rsh --disable-rshd --disable-rcp \
>          --disable-rlogin --disable-rlogind --disable-rexec --disable-rexecd"
>  
> +# The configure script guesses many paths in cross builds, check for this happening
> +do_configure_cross_check() {
> +    if grep "may be incorrect because of cross-compilation" ${B}/config.log; then
> +        bberror Default path values used, these must be set explicitly
> +    fi
> +}
> +do_configure[postfuncs] += "do_configure_cross_check"
> +
> +# The --with-path options are not actually options, so this check needs to be silenced
> +ERROR_QA:remove = "unknown-configure-option"
> +
>  do_configure:prepend () {
>      export HELP2MAN='true'
>      cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186880): https://lists.openembedded.org/g/openembedded-core/message/186880
> Mute This Topic: https://lists.openembedded.org/mt/101049210/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

