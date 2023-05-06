Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4265C77B7F
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 08:43:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.30428.1683362583814128999
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 01:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NoKjFev0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7F0AD1BF206;
	Sat,  6 May 2023 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683362581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=//2KSv1/zLOH+PihzXiKUAlOniq20nUcuMNSsbUZJ+w=;
	b=NoKjFev0u895SX0iI0M4HnduylfPfc/HLL8uij+UMN8ML8ZGu7KvGjpFTNrbcBcV/4xKT0
	YQ5eeix6A17f5Oayv9rvApWBSRV4VX2vg0fQ2zZqOdeqQhQ4zJH0T4QJo6WDgCuUUwTi9z
	D9VqhuYTVCxHCJM+LMOxQD/AZLYA8oaYszIAmvDoCnLZVdRxu7Fto9hpNH3FlPvrhCDEJ4
	JHmnitu3YCGsYQp0+9CjNkbr72NMpWY16T2q0QdKMWMZJa+A6RrludbPyDWCpRnEaaKGAh
	AdfAJazEXcdkoRuNJYNpL7Bzbch9bUmuyNpqinHs2u2JAWMvRD7uWCOqD103Wg==
Date: Sat, 6 May 2023 10:43:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH v2] ghostscript: upgrade to 10.01.1
Message-ID: <20230506084301af2b30bb@mail.local>
References: <20230503164729.1869687-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503164729.1869687-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180980

Hello Ross,

This doesn't apply because of 8a70d6935afa ghostscript: fix CVE-2023-28879

From the commit message, I believe cve-2023-28879.patch is still needed.

On 03/05/2023 17:47:29+0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Fixes CVE-2023-28879.
> 
> Drop an upstreamed patch.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../ghostscript/cross-compile.patch           | 40 -------------------
>  ...cript_10.0.0.bb => ghostscript_10.01.1.bb} |  3 +-
>  2 files changed, 1 insertion(+), 42 deletions(-)
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
>  rename meta/recipes-extended/ghostscript/{ghostscript_10.0.0.bb => ghostscript_10.01.1.bb} (97%)
> 
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch b/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
> deleted file mode 100644
> index ba62820df1e..00000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 4c3575346b9c7d394ebc73b4e5fabebadd8877ec Mon Sep 17 00:00:00 2001
> -From: Chris Liddell <chris.liddell@artifex.com>
> -Date: Thu, 24 Nov 2022 16:33:47 +0000
> -Subject: [PATCH] Fix a little bitrot in the cross-compiling logic
> -
> -Removing the option to disable FAPI meant configuring for cross compiling would
> -fail because the option being passed to the sub-call to configure would include
> -an unknown command line option.
> -
> -Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=patch;f=configure.ac;h=4c3575346b9c7d394ebc73b4e5fabebadd8877ec]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - configure.ac | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index d5c68c4b3..738eb10a9 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -138,7 +138,7 @@ if test x"$host" != x"$build" ; then
> -   echo $AUXFLAGS_MAK_LINE07 >> $AUXFLAGS_MAK.in
> - 
> -   AC_MSG_NOTICE([Begin recursive call to configure script (for auxiliary tools)])
> --  "$absolute_source_path/configure" CC="$CCAUX" CFLAGS="$CFLAGSAUX" CPPFLAGS="$CPPFLAGSAUX" LDFLAGS="$LDFLAGSAUX" CCAUX= CFLAGSAUX= CFLAGSAUX= MAKEFILE=$AUXFLAGS_MAK --host=$build --build=$build --enable-auxtools_only --disable-hidden-visibility --with-local-zlib --without-libtiff --disable-contrib --disable-fontconfig --disable-dbus --disable-freetype --disable-fapi --disable-cups --disable-openjpeg --disable-gtk --with-libiconv=no --without-libidn --without-libpaper --without-pdftoraster --without-ijs --without-jbig2dec --without-x --with-drivers=""
> -+  "$absolute_source_path/configure" CC="$CCAUX" CFLAGS="$CFLAGSAUX" CPPFLAGS="$CPPFLAGSAUX" LDFLAGS="$LDFLAGSAUX" CCAUX= CFLAGSAUX= CFLAGSAUX= MAKEFILE=$AUXFLAGS_MAK --host=$build --build=$build --enable-auxtools_only --disable-hidden-visibility --with-local-zlib --without-libtiff --disable-contrib --disable-fontconfig --disable-dbus --disable-freetype --disable-cups --disable-openjpeg --disable-gtk --with-libiconv=no --without-libidn --without-libpaper --without-pdftoraster --without-ijs --without-jbig2dec --without-x --with-drivers=""
> -   status=$?
> -   cp config.log "$olddir/configaux.log"
> -   if test $status -eq 0 ; then
> -@@ -2530,7 +2530,7 @@ PDF=
> - PDF_MAK="\$(GLSRCDIR)\$(D)stub.mak"
> - PDFROMFS_MAK="\$(GLSRCDIR)\$(D)stub.mak"
> - 
> --if test x"$with_pdf" != x"no" ; then
> -+if test x"$with_pdf" != x"no" -a x"$enable_auxtools_only" != x"yes" ; then
> - 
> -   if test x"$JBIG2_DECODER" = x""; then
> -       AC_MSG_ERROR([No JBIG2 decoder available, required for PDF support])
> --- 
> -2.25.1
> -
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
> similarity index 97%
> rename from meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
> rename to meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
> index 56a93632e29..5d4b8cdc913 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
> @@ -33,7 +33,6 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
>                  file://do-not-check-local-libpng-source.patch \
>                  file://avoid-host-contamination.patch \
>                  file://mkdir-p.patch \
> -                file://cross-compile.patch \
>  "
>  
>  SRC_URI = "${SRC_URI_BASE} \
> @@ -45,7 +44,7 @@ SRC_URI:class-native = "${SRC_URI_BASE} \
>                          file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
>                          "
>  
> -SRC_URI[sha256sum] = "a57764d70caf85e2fc0b0f59b83b92e25775631714dcdb97cc6e0cea414bb5a3"
> +SRC_URI[sha256sum] = "4df18a808cd4369f25e02dbcec2f133cb6d674627b2c6b1502020e58d43e32ce"
>  
>  # Put something like
>  #
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180833): https://lists.openembedded.org/g/openembedded-core/message/180833
> Mute This Topic: https://lists.openembedded.org/mt/98666289/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

