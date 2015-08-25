Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFD671633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:31:20 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so9076537wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lzasQ31oXYb8uKpGj9ltvoDQYG/N+R9Z9nGo5C5aX3w=;
	b=SQR8j3trUOSvJQqMO5ny3mJLT0n1gVJaENyvo9CApVXCoWINEbt6HYjZSFLGfH0muZ
	eLrfJ/Op5D2E6iIXk5SyKk7Hyr3zUSPfkAmCTiG/UU+Dsq8pDPgbr3GUcA/zBh8NftLS
	eKcOWP9cavsflO9U33WmZZvgFusuJsHsbrh+F0iqQmxG0ljdVeSY+bxzKb/Ps2Lo+R6G
	rTwLAnSujX1p8mou07ojHyuNg7h8SenRAlISuSJY60Cn6HTqYJgSkvTKzXSnGphbCdUX
	qHZLUlwlmuMv+VOVwylA1+SMwFkIe9aQlDaeejkBU+rvrQu6VcOZK58S06WepznqNqNH
	nnSQ==
X-Gm-Message-State: ALoCoQmPJ9ZGfXg1bcp3e3jLf1HmDzdpSh59WApMMDNH4TZMqCLwB1rrFIGSo5AfYJxjmM78b04v
X-Received: by 10.180.106.99 with SMTP id gt3mr2976550wib.51.1440495080543;
	Tue, 25 Aug 2015 02:31:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	xs1sm27158537wjc.7.2015.08.25.02.31.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 02:31:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 10:24:54 +0100
Message-Id: <1440494694-16737-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xf86-video-intel: fix missing fstat() prototype
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
X-List-Received-Date: Tue, 25 Aug 2015 09:31:23 -0000

What I'm guessing is an updated systemd exposes less system headers, so
xf86-video-intel was using fstat() without the required includes.

Backport a patch from upstream to fix this problem.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-driver/xf86-video-intel/udev-fstat.patch  | 59 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.99.917.bb       |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch
new file mode 100644
index 0000000..0e675ee
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 12af8a575d1518d40416f83195049157c3a062a5 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Tue, 24 Feb 2015 15:25:40 +0000
+Subject: sna: udev integration depends on fstat and sys/stat.h
+
+src/sna/sna_driver.c: In function 'sna_handle_uevents':
+src/sna/sna_driver.c:759:2: error: implicit declaration of function 'fstat' [-Werror=implicit-function-declaration]
+
+Also take the opportunity to include udev support in the configure
+summary.
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+
+diff --git a/configure.ac b/configure.ac
+index 7476e2b..de3a4b3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -197,11 +197,15 @@ AC_ARG_ENABLE(udev,
+ 
+ if test "x$UDEV" != "xno"; then
+ 	PKG_CHECK_MODULES(UDEV, [libudev], [udev="yes"], [udev="no"])
++	AC_CHECK_HEADERS([sys/stat.h], [], [udev="no"])
+ 	if test "x$UDEV" = "xyes" -a "x$udev" != "xyes"; then
+ 		AC_MSG_ERROR([udev support requested but not found (libudev)])
+ 	fi
+ 	if test "x$udev" = "xyes"; then
+ 		AC_DEFINE(HAVE_UDEV,1,[Enable udev-based monitor hotplug detection])
++		udev_msg=" yes"
++	else
++		udev_msg=" no"
+ 	fi
+ fi
+ 
+@@ -911,6 +915,7 @@ echo "  Support for Kernel Mode Setting? $KMS"
+ echo "  Support for legacy User Mode Setting (for i810)? $UMS"
+ echo "  Support for Direct Rendering Infrastructure:$dri_msg"
+ echo "  Support for Xv motion compensation (XvMC and libXvMC):$xvmc_msg"
++echo "  Support for display hotplug notifications (udev):$udev_msg"
+ echo "  Build additional tools and utilities?$tools_msg"
+ if test -n "$xp_msg"; then
+ echo "  Experimental support:$xp_msg"
+diff --git a/src/sna/sna_driver.c b/src/sna/sna_driver.c
+index 8c0d0b5..bc20ef0 100644
+--- a/src/sna/sna_driver.c
++++ b/src/sna/sna_driver.c
+@@ -740,6 +740,8 @@ sna_wakeup_handler(WAKEUPHANDLER_ARGS_DECL)
+ }
+ 
+ #if HAVE_UDEV
++#include <sys/stat.h>
++
+ static void
+ sna_handle_uevents(int fd, void *closure)
+ {
+-- 
+cgit v0.10.2
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
index 5a3e06c..a2f1456 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 SRC_URI += "file://disable-x11-dri3.patch \
             file://always_include_xorg_server.h.patch \
             file://sna-Protect-against-ABI-breakage-in-recent-versions-.patch \
+            file://udev-fstat.patch \
            "
 
 SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
-- 
2.1.4


