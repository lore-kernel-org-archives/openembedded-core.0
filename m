Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BFDC48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 16:20:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.45579.1707927604277522447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 08:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PaWW3ZPI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8822B6000E;
	Wed, 14 Feb 2024 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707927601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkXk3bp50K8AOxI5iZEoCHmD0dAACNXRss2EmzB7eQk=;
	b=PaWW3ZPIN5W82USXfF1HazmCrXIgEAm+p38Cjz1pimZ5HBWVvv84IIUCzC30rWwuEHeAyw
	IdcCdpajPExbxKs2WtKNg/fwIItl7EOwBv+3v7TQrMw7iBvDSbTPw4UGmbHK0TXRI5WRF0
	bpiDMEyjawWrZJcqbK0nLoPGt8rR4/V3h9Vgj4B+4dZxkWyBaDRrageQrIl49KZQsZwvwo
	HfgNRzjjbmfwSDgDaGJp9N6Xy9OOLWPywr0kCtdXVYCVAK0CfcFPoBoiVhx6M66u+uCd3d
	wM7QUF1D02oBdXwGgTjtJEcymVnTxTMlf1N+dEjYsHCpKDX5v5uEA0CvvELiqg==
Date: Wed, 14 Feb 2024 17:20:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V5] rxvt-unicode: install terminfo on target env
Message-ID: <20240214162000da6873c0@mail.local>
References: <20240207084341.2196110-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207084341.2196110-1-changqing.li@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 16:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195484

Hello,

This causes the following failure:

FAIL: buildoptions.ImageOptionsTests.test_read_only_image (subunit.RemotedTestCase)

ERROR: core-image-sato-1.0-r0 do_rootfs: The following packages could not be configured offline and rootfs is read-only: ['100-rxvt-unicode']
NOTE: Pressure status changed to CPU: True, IO: False, Mem: None (CPU: 159586.0/20000.0, IO: 18717.0/20000.0, Mem: 0.0/None) - using 1/16 bitbake threads
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-4135593/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.3644854
NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 9655 tasks of which 9620 didn't need to be rerun and 1 failed.
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-4135593/tmp/log/error-report/error_report_20240213234815.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-4135593/tmp/log/error-report/error_report_20240213234815.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.


On 07/02/2024 16:43:41+0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> For cross compile, TIC will be native tic in recipe-sysroot-native, and
> the terminfo path will be native path, the rxvt-unicode terminfo will be
> installed to native path.
> 
> disable the terminfo installation by setting TIC to :, and install
> terminfo on target env to make sure ncurses on target env use the
> correct terminfo
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../rxvt-unicode/rxvt-unicode.inc             | 16 +++++++-
>  ...ble-the-terminfo-installation-by-set.patch | 37 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch
> 
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> index e7d520ebef..988e8c7404 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -11,7 +11,9 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
>  SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
>  	   file://xwc.patch \
>  	   file://rxvt.desktop \
> -	   file://rxvt.png"
> +	   file://rxvt.png \
> +	   file://0001-Makefile.in-disable-the-terminfo-installation-by-set.patch \
> +"
>  
>  inherit autotools pkgconfig update-alternatives
>  
> @@ -53,6 +55,18 @@ do_install:append () {
>  
>  	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
>  	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
> +
> +	install -d ${D}/${sysconfdir}
> +	install -m 0644 ${S}/doc/etc/rxvt-unicode.terminfo ${D}/${sysconfdir}/rxvt-unicode.terminfo
> +}
> +
> +RDEPENDS:${PN} = "ncurses-tools"
> +
> +pkg_postinst_ontarget:${PN} () {
> +	if test -x ${bindir}/tic
> +	then
> +		${bindir}/tic -x ${sysconfdir}/rxvt-unicode.terminfo
> +	fi
>  }
>  
>  FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch
> new file mode 100644
> index 0000000000..6bdbedb3c4
> --- /dev/null
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch
> @@ -0,0 +1,37 @@
> +From ff5c75995485ee9c5331e52bb9bf3aa5db6d8837 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 7 Feb 2024 10:35:23 +0800
> +Subject: [PATCH] Makefile.in: disable the terminfo installation by setting TIC
> + to :
> +
> +For cross compile, TIC will be native tic in recipe-sysroot-native, and
> +the terminfo path will be native path, the rxvt-unicode terminfo will be
> +installed to native path.
> +
> +disable the terminfo installation by setting TIC to :
> +
> +Upstream-Status: Inappropriate [ oe specific ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + doc/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/doc/Makefile.in b/doc/Makefile.in
> +index e3d1fe8..1961c93 100644
> +--- a/doc/Makefile.in
> ++++ b/doc/Makefile.in
> +@@ -100,8 +100,8 @@ install: all
> + 	$(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
> + 	$(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
> + 	$(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
> +-	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
> +-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
> ++	: -x $(srcdir)/etc/rxvt-unicode.terminfo || \
> ++           : $(srcdir)/etc/rxvt-unicode.terminfo
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
> View/Reply Online (#195044): https://lists.openembedded.org/g/openembedded-core/message/195044
> Mute This Topic: https://lists.openembedded.org/mt/104215096/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

