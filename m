Return-Path: <ticotimo@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0E13F6AD05
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 20:06:21 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id db12so1977702veb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jul 2014 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=agd7krcpzYipIXgZeB/XAGUDyGk5NHHNEr/i8rAwqOo=;
	b=rRXYhnDZBgXpfIiMnnY3P+lFkB3ayINk+2H0z/GKdxa1n+moxCckZyd2uWBBhEempn
	zBxAd8uvkl4tB1RPAvhSFnG6F5cBzBXqIRiM0Di5gF5bTKbYjNXoxF4KMk4TJ2z9+MeM
	vbR6fRAt606NmKSgLe0skj7ljKMRG4zKuA2l/qAowsHmKr6YI+Lj55vKMDeH0nIzqRxm
	C/rVpDN40KZ+/p93AdhXxp0ah+COm44ihbx5B0KhVUHHonEBM5T9ZKbsQTfHa5A2xVWr
	EzAwsTOTX/f7nhiizKtJu6gX3ZLbpY5S1EGSJlQlo6snoY23gCTnQBdIjji/IZ7ldLVG
	vG9w==
X-Received: by 10.58.8.12 with SMTP id n12mr11196247vea.28.1404504382446;
	Fri, 04 Jul 2014 13:06:22 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id
	xp10sm59609886vdb.13.2014.07.04.13.06.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jul 2014 13:06:21 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jul 2014 13:06:16 -0700
Message-Id: <1404504376-19891-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] weston: make webp explicitly configurable
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
X-List-Received-Date: Fri, 04 Jul 2014 20:06:29 -0000

This patch fixes:
    weston/weston/latest lost dependency on  libwebp
    weston/weston-examples/latest lost dependency on  libwebp
from:
http://lists.openembedded.org/pipermail/openembedded-core/2014-June/093704.html

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../make-libwebp-explicitly-configurable.patch     | 37 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.5.0.bb      |  6 +++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch

diff --git a/meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch b/meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
new file mode 100644
index 0000000..ad07d4f
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
@@ -0,0 +1,37 @@
+
+The libwebp package is outside of openembedded-core, so make it
+explicitly configurable. Make it deterministic, so that if libwebp 
+dependencies are missing, autoconf throws a fatal error.
+
+Upstream-Status: Pending
+
+Index: weston-1.5.0/configure.ac
+===================================================================
+--- weston-1.5.0.orig/configure.ac
++++ weston-1.5.0/configure.ac
+@@ -268,9 +268,22 @@ fi
+ 
+ PKG_CHECK_MODULES(PIXMAN, [pixman-1])
+ PKG_CHECK_MODULES(PNG, [libpng])
+-PKG_CHECK_MODULES(WEBP, [libwebp], [have_webp=yes], [have_webp=no])
+-AS_IF([test "x$have_webp" = "xyes"],
+-      [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
++AC_ARG_ENABLE(webp,
++              AS_HELP_STRING([--disable-webp],
++                             [Disable libwebp support]),,
++              enable_webp=auto)
++AM_CONDITIONAL(HAVE_WEBP, [test "x$enable_webp" = xyes])
++AS_IF([test "x$enable_webp" != "xno"],
++    PKG_CHECK_MODULES(WEBP,
++                     [libwebp],
++                     [have_webp=yes],
++                     [have_webp=no])
++    AS_IF([test "x$have_webp" = "xno" -a "x$enable_webp" = "xyes"],
++        AC_MSG_ERROR([libwebp support explicitly request, but lipwebp could not be found]))
++    AS_IF([test "x$have_webp" = "xyes"],
++        [enable_webp=yes]
++        [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
++)
+ 
+ AC_ARG_ENABLE(vaapi-recorder, [  --enable-vaapi-recorder],,
+ 	      enable_vaapi_recorder=auto)
diff --git a/meta/recipes-graphics/wayland/weston_1.5.0.bb b/meta/recipes-graphics/wayland/weston_1.5.0.bb
index 5573a06..4a8584f 100644
--- a/meta/recipes-graphics/wayland/weston_1.5.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.5.0.bb
@@ -9,7 +9,9 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://disable-wayland-scanner-pkg-check.patch \
-           file://make-lcms-explicitly-configurable.patch"
+           file://make-lcms-explicitly-configurable.patch \
+           file://make-libwebp-explicitly-configurable.patch \
+"
 SRC_URI[md5sum] = "8eb40d230efc2411f083c20656534780"
 SRC_URI[sha256sum] = "06388ba04ac79aa72d685cc1a8e646ddb2b8cfe11fcc742294f9addac48b7684"
 
@@ -56,6 +58,8 @@ PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --d
 PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 # Weston with lcms support
 PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
+# Weston with webp support
+PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
1.9.3


