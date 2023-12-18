Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DCFC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 16:08:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.47488.1702915705026888229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 08:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ofTZGE3/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2D781C0004;
	Mon, 18 Dec 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702915703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LzFTI3i4jxFf4AYMe5wPW5Tg54BVMVRJ2PgJINGzwUs=;
	b=ofTZGE3/RCiEotsrk/GwcuMFv/hLhR8zviXaR1gnyCB9o/AFgh0vNUrVDqdsu0CiogsoaF
	6QQHyxIIv7H/aWr9+Rl+WS8Dm7j4b2uAIzIyH0cLoXdBgIHeQqxl6KqJ3lTHCcR8clNhI6
	V6mqA0cdsNIhzy5U02ceoWfU7xXzauAuXZ53/qlceoI7fm6hqPnFhkbLQ5nmm1ovhDREk7
	qmuNdc7syeXz2W7GZ1tIJMk1MdM3XHyZv55AOZvF5FzQUywAidyJungMt+++YOlEUmll/i
	PsUtXrN9aNOqPJPxxyYjJcDzcOmH7OEi3HzFZJYXVK2+zkQSMgEnV5fCrz+JvQ==
Date: Mon, 18 Dec 2023 17:08:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V2] rxvt-unicode: set correct outdir for tic
Message-ID: <20231218160822b9f35b2f@mail.local>
References: <20231214094101.3010549-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214094101.3010549-1-changqing.li@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 16:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192661

Hello,

This causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4106/steps/12/logs/stdio
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231218-s_bdlb3l/packages/diff-html/

On 14/12/2023 17:41:01+0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> tic is from ncurses-native, and set TERMINFO as
> ${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
> rxvt-unicode terminfo will be wrongly installed in there.  set the
> outdir explicitly to install them to correct dir.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../rxvt-unicode/rxvt-unicode.inc             |  5 +--
>  .../0001-Makefile.in-set-outdir-for-tic.patch | 35 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch
> 
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> index e7d520ebef..2f01f54305 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -11,7 +11,8 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
>  SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
>  	   file://xwc.patch \
>  	   file://rxvt.desktop \
> -	   file://rxvt.png"
> +	   file://rxvt.png \
> +	   file://0001-Makefile.in-set-outdir-for-tic.patch "
>  
>  inherit autotools pkgconfig update-alternatives
>  
> @@ -55,4 +56,4 @@ do_install:append () {
>  	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
>  }
>  
> -FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
> +FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png ${datadir}/terminfo"
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch
> new file mode 100644
> index 0000000000..7ba0e668dc
> --- /dev/null
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch
> @@ -0,0 +1,35 @@
> +From 1b7d547453fc57806ef86f64c86706530a23e62e Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 13 Dec 2023 11:53:18 +0800
> +Subject: [PATCH] Makefile.in: set outdir for tic
> +
> +tic is from ncurses-native, and set TERMINFO as
> +${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
> +rxvt-unicode terminfo will be wrongly installed in there.  set the
> +outdir explicitly to install them to correct dir.
> +
> +Upstream-Status: Submitted [ https://github.com/exg/rxvt-unicode/pull/4 ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + doc/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/doc/Makefile.in b/doc/Makefile.in
> +index e3d1fe8..1de56d3 100644
> +--- a/doc/Makefile.in
> ++++ b/doc/Makefile.in
> +@@ -100,8 +100,8 @@ install: all
> + 	$(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
> + 	$(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
> + 	$(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
> +-	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
> +-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
> ++	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo || \
> ++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo
> + 
> + distdepend: alldoc
> + 
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192340): https://lists.openembedded.org/g/openembedded-core/message/192340
> Mute This Topic: https://lists.openembedded.org/mt/103167118/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

