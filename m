Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1B02C77D45
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:26:24 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id D27AB46E05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:26:23 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 13:26:11 +0200
Message-Id: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/9] gstreamer1.0: upgrade to version 1.12.0
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
X-List-Received-Date: Tue, 16 May 2017 11:26:25 -0000

* Version 1.12 introduces support for libdw (provided by elfutils)
  libdw adds source lines & numbers to backtraces
  new dw packageconfig added for enabling/disabling this feature
* Leftover docbook cruft was removed

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  2 +-
 ...tection-of-libunwind-and-libdw-determinis.patch | 56 ++++++++++++++++++++++
 .../gstreamer1.0/deterministic-unwind.patch        | 24 ----------
 ...treamer1.0_1.10.4.bb => gstreamer1.0_1.12.0.bb} |  6 +--
 4 files changed, 60 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.4.bb => gstreamer1.0_1.12.0.bb} (59%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 72d7ce6..3291934 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -25,10 +25,10 @@ PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
 PACKAGECONFIG[unwind] = "--with-unwind,--without-unwind,libunwind"
+PACKAGECONFIG[dw] = "--with-dw,--without-dw,elfutils"
 
 EXTRA_OECONF = " \
     --disable-dependency-tracking \
-    --disable-docbook \
     --disable-examples \
 "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch
new file mode 100644
index 0000000..11ce5e9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch
@@ -0,0 +1,56 @@
+From fa2344e1a0ffed7e648e36ac72c8871d817e40e0 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Mon, 8 May 2017 01:38:57 +0200
+Subject: [PATCH] Make the detection of libunwind and libdw deterministic
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ configure.ac | 28 ++++++++++++++++++++--------
+ 1 file changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b151208..b7922ac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -821,16 +821,28 @@ fi
+ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
+ 
+ dnl libunwind is optionally used by the leaks tracer
+-PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
+-if test "x$HAVE_UNWIND" = "xyes"; then
+-  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
+-fi
++AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind],[use libunwind])],
++            [], [with_unwind=yes])
++AS_IF([test "x$with_unwind" = xyes],
++      [PKG_CHECK_MODULES(UNWIND, libunwind)
++       HAVE_UNWIND=yes
++       AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
++      ], [
++       HAVE_UNWIND="no"
++      ]
++)
+ 
+ dnl libdw is optionally used to add source lines and numbers to backtraces
+-PKG_CHECK_MODULES(DW, libdw, HAVE_DW=yes, HAVE_DW=no)
+-if test "x$HAVE_DW" = "xyes"; then
+-  AC_DEFINE(HAVE_DW, 1, [libdw available])
+-fi
++AC_ARG_WITH([dw],[AS_HELP_STRING([--with-dw],[use libdw])],
++            [], [with_dw=yes])
++AS_IF([test "x$with_dw" = xyes],
++      [PKG_CHECK_MODULES(DW, libdw)
++       HAVE_DW=yes
++       AC_DEFINE(HAVE_DW, 1, [libdw available])
++      ], [
++       HAVE_DW=no
++      ]
++)
+ 
+ dnl Check for backtrace() from libc
+ AC_CHECK_FUNC(backtrace, [
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
deleted file mode 100644
index e39e6ca..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Make the detection of libunwind deterministic.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index ac88fb2..182c19a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -829,3 +828,0 @@ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
--dnl libunwind is optionally used by the leaks tracer
--PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
--
-@@ -839,3 +836,7 @@ AC_CHECK_FUNC(backtrace, [
--if test "x$HAVE_UNWIND" = "xyes"; then
--  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
--fi
-+dnl libunwind is optionally used by the leaks tracer
-+AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind],[use libunwind])],
-+            [], [with_unwind=yes])
-+AS_IF([test "$with_unwind" = yes],
-+      [PKG_CHECK_MODULES(UNWIND, libunwind)
-+       AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])]
-+)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.0.bb
similarity index 59%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.0.bb
index 2a67993..84fc321 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://deterministic-unwind.patch \
+    file://0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch \
 "
-SRC_URI[md5sum] = "7c91a97e4a2dc81eafd59d0a2f8b0d6e"
-SRC_URI[sha256sum] = "50c2f5af50a6cc6c0a3f3ed43bdd8b5e2bff00bacfb766d4be139ec06d8b5218"
+SRC_URI[md5sum] = "8f76b6b5e4b3307e505bd6ab9304dd03"
+SRC_URI[sha256sum] = "14d5eef8297d2bf2a728d38fa43cd92cc267a0ad260cf83d770215212aff4302"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.7.4


