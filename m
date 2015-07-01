Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 885DA65C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:25:04 +0000 (UTC)
Received: by igcsj18 with SMTP id sj18so141896930igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=0raSrft1ZC+hLw9Hk6kZY9j3TYydIJ/KzhQyBbw+8gU=;
	b=UFMVTcCsAhYZpOTblAdkrXerpbP+gOlPV8p5jRdcLmEDMW7LCYew8RKvY4cIAvgYFC
	MRtaTe8bYqZXG00f+XlZN7WCkXtJPurBPsl9NVjurUeP5OUGzxVyPYpL81ySuOK766GV
	teuV+RFGfoj1XRK5QLckZ8/0IYmPmv/SK4L6/EfAWb/c5OIyv395/kZAu0tzka9tl1fx
	ZDCevgWPPWDyyidvRdaNf8s7K6bZMAr4+Cdl0lheC/K2qWRr6m8DKr2FUDxZPUAVYW8W
	35BUysaEXfAoFj3celYiKhloR/yU1vXT51K1+qY+3V7kS/1olmLmBpgHCwbMsV/Z5SFC
	w3Yw==
X-Received: by 10.50.66.234 with SMTP id i10mr34791079igt.46.1435775104369;
	Wed, 01 Jul 2015 11:25:04 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id p4sm2229179igg.20.2015.07.01.11.25.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 11:25:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 11:24:54 -0700
Message-Id: <efc583454a3f6cce0b15d122320258aa8636b92c.1435774899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
References: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
In-Reply-To: <cover.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] weston: Upgrade weston_1.6.0.bb -> weston_1.8.0.bb
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
X-List-Received-Date: Wed, 01 Jul 2015 18:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make error() portable, Fix build on musl

Use git for repo for SRC_URI

copyright year changed for weston compositor.c

- * Copyright © 2012 Collabora, Ltd.
+ * Copyright © 2012-2015 Collabora, Ltd.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wayland/weston/0001-make-error-portable.patch  | 80 ++++++++++++++++++++++
 .../weston/disable-wayland-scanner-pkg-check.patch | 20 +++---
 .../wayland/{weston_1.6.0.bb => weston_1.8.0.bb}   | 22 +++---
 3 files changed, 105 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 rename meta/recipes-graphics/wayland/{weston_1.6.0.bb => weston_1.8.0.bb} (84%)

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
index 74ad816..ac6bd97 100644
--- a/meta/recipes-graphics/wayland/weston_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -3,34 +3,38 @@ DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
-                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+                    file://src/compositor.c;endline=23;md5=a9793f1edc8d1a4c344ca8ae252352fb"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://disable-wayland-scanner-pkg-check.patch \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
+           file://0001-make-error-portable.patch \
 "
-SRC_URI[md5sum] = "c60ce9dde99a089db0539d8f6b557827"
-SRC_URI[sha256sum] = "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b8c4d1d4acaaa614d"
+SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
+SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"
 
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
@@ -60,8 +64,8 @@ PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
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


