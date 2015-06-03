Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 05C5F7582D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 16:42:08 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so116000304igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=yfGE6WKCHJFSD9knb7MjtpWr36RfL1RBn2PwyQwagFE=;
	b=b5qgUwALLhe5SEidEVUlTi9epDIGMao7qavArvQhL8ZXJpIUCnyTQcTRZasGev5YyX
	W/SU+/QfCe15ulmwgIDJXzcWxrhpECinrn1Vo8ugDqKIzkTH2KpnM/V7bCZxKBrDKuFr
	wTeFOxcpqWQ6XJ743Was1TjMxySCSezFkkyM3PigxTFHZ9yn0M5p2KDdWN50hzyc2X9T
	yFTVDk3CMWuKg9O6J6R4om/2OTEGESocSBKm8nWz0O30Av2aArpb4FOAmElZwgemE2Y7
	uSyAEI0GgI0KwfAX0o3DA9Dp9oYvE6S8yuSqTjHgLeYbcCWzw2ywKss2fRjN1fEyFE9R
	ETLw==
X-Received: by 10.50.50.210 with SMTP id e18mr28163017igo.0.1433349729621;
	Wed, 03 Jun 2015 09:42:09 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id d4sm15059595iod.17.2015.06.03.09.42.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 09:42:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 09:41:59 -0700
Message-Id: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433349512.git.raj.khem@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 03 Jun 2015 16:42:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use git for repo for SRC_URI

copyright year changed for weston compositor.c

- * Copyright © 2012 Collabora, Ltd.
+ * Copyright © 2012-2014 Collabora, Ltd.

libinput license changes are
- COPYING: note that having linux/input.h in the tree does not make libinput GPL
- Updated to 2015 where appropriate, added where missing.
- filter: add Simon's copyright
  This code was largely lifted from the X server in
  bb25b2ad297891430606c367bfabc but didn't take the copyright messages
  that applied to that code.

upgrade libinput to > 0.8.0 (0.16.0) which is needed for 1.7.0+ wayland
For x86 emulators use fbdev backend

Change-Id: I49c12853699a3a764d86869ec4d43b10ecda3379
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wayland/{libinput_0.7.0.bb => libinput_git.bb} | 15 ++--
 .../wayland/{wayland_1.6.0.bb => wayland_1.8.0.bb} |  9 ++-
 .../wayland/weston/0001-make-error-portable.patch  | 80 ++++++++++++++++++++++
 .../weston/disable-wayland-scanner-pkg-check.patch | 20 +++---
 .../wayland/{weston_1.6.0.bb => weston_1.8.0.bb}   | 25 ++++---
 5 files changed, 124 insertions(+), 25 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_0.7.0.bb => libinput_git.bb} (42%)
 rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.8.0.bb} (87%)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 rename meta/recipes-graphics/wayland/{weston_1.6.0.bb => weston_1.8.0.bb} (84%)

diff --git a/meta/recipes-graphics/wayland/libinput_0.7.0.bb b/meta/recipes-graphics/wayland/libinput_git.bb
similarity index 42%
rename from meta/recipes-graphics/wayland/libinput_0.7.0.bb
rename to meta/recipes-graphics/wayland/libinput_git.bb
index 98d2942..dcaf7d3 100644
--- a/meta/recipes-graphics/wayland/libinput_0.7.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_git.bb
@@ -3,12 +3,19 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=277a6eaa986f26fa040fc3cfa4ae44b3"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "381b61396de28c12716ef7a5475fea50"
-SRC_URI[sha256sum] = "129f485afe5e4a9394641293991c97cb99f5f3338340d0d65b704ff463d1579e"
+SRCREV = "078421808179baa22af5cd35ad5e0aee86dffb41"
+PV = "0.16.0+git${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/wayland/libinput \
+"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/udev/"
+FILES_${PN}-dbg += "${libdir}/udev/.debug"
diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipes-graphics/wayland/wayland_1.8.0.bb
similarity index 87%
rename from meta/recipes-graphics/wayland/wayland_1.6.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.8.0.bb
index 00713bf..b468277 100644
--- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.8.0.bb
@@ -10,9 +10,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d34c141c975084e4fb668e77b38f840e"
-SRC_URI[sha256sum] = "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb6737a20d0d86ba6fc7f"
+SRCREV = "60024af597b68974c451c89f960a7c11de11c33a"
+
+SRC_URI = "git://anongit.freedesktop.org/wayland/wayland"
+
+S = "${WORKDIR}/git"
+
 SRC_URI_append_class-native = " \
     file://disable-macro-checks-not-used-for-scanner.patch \
     "
diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
new file mode 100644
index 0000000..148848d
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -0,0 +1,80 @@
+From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 May 2015 20:56:00 -0700
+Subject: [PATCH weston] make error() portable
+
+error() is not posix but gnu extension so may not be available on all
+kind of systemsi e.g. musl.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ configure.ac        |  2 ++
+ src/weston-error.h  | 20 ++++++++++++++++++++
+ src/weston-launch.c |  2 +-
+ 3 files changed, 23 insertions(+), 1 deletion(-)
+ create mode 100644 src/weston-error.h
+
+diff --git a/configure.ac b/configure.ac
+index 263fc22..f52cd62 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,6 +57,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+ 	      [[#include <time.h>]])
+ AC_CHECK_HEADERS([execinfo.h])
+ 
++AC_CHECK_HEADERS([error.h])
++
+ AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
+ 
+ COMPOSITOR_MODULES="wayland-server >= 1.7.93 pixman-1 >= 0.25.2"
+diff --git a/src/weston-error.h b/src/weston-error.h
+new file mode 100644
+index 0000000..2089d02
+--- /dev/null
++++ b/src/weston-error.h
+@@ -0,0 +1,20 @@
++#ifndef _WESTON_ERROR_H
++#define _WESTON_ERROR_H
++
++#if defined(HAVE_ERROR_H)
++#include <error.h>
++#else
++#include <err.h>
++#include <string.h>
++#define _weston_error(S, E, F, ...) do { \
++	if (E) \
++		err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
++	else \
++		err(S, F, ##__VA_ARGS__); \
++} while(0)
++
++#define error _weston_error
++#endif
++
++#endif
++
+diff --git a/src/weston-launch.c b/src/weston-launch.c
+index 10c66de..3e6d30a 100644
+--- a/src/weston-launch.c
++++ b/src/weston-launch.c
+@@ -30,7 +30,6 @@
+ #include <poll.h>
+ #include <errno.h>
+ 
+-#include <error.h>
+ #include <getopt.h>
+ 
+ #include <sys/types.h>
+@@ -56,6 +55,7 @@
+ #endif
+ 
+ #include "weston-launch.h"
++#include "weston-error.h"
+ 
+ #define DRM_MAJOR 226
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch b/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
index 062da5c..68ba38b 100644
--- a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
+++ b/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
@@ -1,13 +1,17 @@
-Index: weston-1.5.0/configure.ac
+Index: git/configure.ac
 ===================================================================
---- weston-1.5.0.orig/configure.ac
-+++ weston-1.5.0/configure.ac
-@@ -503,7 +503,7 @@ if test x$wayland_scanner = x; then
- 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -501,12 +501,6 @@ if test "x$have_lcms" = xyes; then
  fi
+ AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
  
--PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
-+#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
- 
+-AC_PATH_PROG([wayland_scanner], [wayland-scanner])
+-if test x$wayland_scanner = x; then
+-	PKG_CHECK_MODULES(WAYLAND_SCANNER, [wayland-scanner])
+-	wayland_scanner=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
+-fi
+-
  AC_CONFIG_FILES([Makefile src/version.h src/weston.pc])
  
+ AM_CONDITIONAL([HAVE_GIT_REPO], [test -f $srcdir/.git/logs/HEAD])
diff --git a/meta/recipes-graphics/wayland/weston_1.6.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
similarity index 84%
rename from meta/recipes-graphics/wayland/weston_1.6.0.bb
rename to meta/recipes-graphics/wayland/weston_1.8.0.bb
index d30e48b..732dca4 100644
--- a/meta/recipes-graphics/wayland/weston_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -3,34 +3,39 @@ DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
-                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+                    file://src/compositor.c;endline=23;md5=a9793f1edc8d1a4c344ca8ae252352fb"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRCREV = "2567c93f81309c91c7c9b247ea04122563f34de1"
+SRC_URI = "git://anongit.freedesktop.org/wayland/weston \
            file://weston.png \
            file://weston.desktop \
-           file://disable-wayland-scanner-pkg-check.patch \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
+           file://0001-make-error-portable.patch \
 "
-SRC_URI[md5sum] = "c60ce9dde99a089db0539d8f6b557827"
-SRC_URI[sha256sum] = "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b8c4d1d4acaaa614d"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig useradd
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland virtual/egl pango"
+DEPENDS += "wayland libinput virtual/egl pango"
 
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
                 --enable-demo-clients-install \
-                --disable-libunwind \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor \
                 "
 
-
+EXTRA_OECONF_append_qemux86 = "\
+		WESTON_NATIVE_BACKEND=fbdev-backend.so \
+		"
+EXTRA_OECONF_append_qemux86-64 = "\
+		WESTON_NATIVE_BACKEND=fbdev-backend.so \
+		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
@@ -60,8 +65,8 @@ PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 # Weston with webp support
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
-# Weston with libinput backend
-PACKAGECONFIG[libinput] = "--enable-libinput-backend,--disable-libinput-backend,libinput"
+# Weston with unwinding support
+PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.1.4


