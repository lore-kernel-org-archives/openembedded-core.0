Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id AB7E3785D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:37:10 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 520154CB55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:37:10 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:36:52 +0200
Message-Id: <1502487421-18235-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
References: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v2 01/10] gstreamer1.0: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:37:11 -0000

* Version 1.12 introduces support for libdw (provided by elfutils).
  libdw adds source lines & numbers to backtraces. A new "dw"
  packageconfig added for enabling/disabling this feature.
  In addition, the old patch for deterministic unwind configuration
  was replaced with one that also allows the same for the dw
  configuration. This new patch was also submitted to bugzilla.

* Leftover docbook cruft was removed, meaning that the
  "--disable-docbook" configure switch is gone.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  2 +-
 ...dd-switches-for-enabling-disabling-libdw-.patch | 70 ++++++++++++++++++++++
 .../gstreamer1.0/deterministic-unwind.patch        | 24 --------
 ...treamer1.0_1.10.4.bb => gstreamer1.0_1.12.2.bb} |  6 +-
 4 files changed, 74 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.4.bb => gstreamer1.0_1.12.2.bb} (59%)

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
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
new file mode 100644
index 0000000..1132fd5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
@@ -0,0 +1,70 @@
+From a0cb41ba72913eda06049d266ec43ea8f52b5bee Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Fri, 11 Aug 2017 21:21:36 +0200
+Subject: [PATCH] configure: Add switches for enabling/disabling libdw and
+ libunwind
+
+[Original patch modified to be applicable to 1.12.2]
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=778193]
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ configure.ac | 38 ++++++++++++++++++++++++++++++++------
+ 1 file changed, 32 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b6b2923..32dd827 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -821,15 +821,41 @@ fi
+ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
+ 
+ dnl libunwind is optionally used by the leaks tracer
+-PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
+-if test "x$HAVE_UNWIND" = "xyes"; then
+-  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
++AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind=yes|no|auto],[use libunwind])],
++            [], [with_unwind=auto])
++if [ test "x${with_unwind}" != "xno" ]; then
++  PKG_CHECK_MODULES(UNWIND, [libunwind],
++      [
++        HAVE_UNWIND=yes
++        AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
++      ],
++      [
++        HAVE_UNWIND=no
++        if [ test "x${with_unwind}" = "xyes" ]; then
++          AC_MSG_ERROR([could not find libunwind])
++        fi
++      ])
++else
++  HAVE_UNWIND=no
+ fi
+ 
+ dnl libdw is optionally used to add source lines and numbers to backtraces
+-PKG_CHECK_MODULES(DW, libdw, HAVE_DW=yes, HAVE_DW=no)
+-if test "x$HAVE_DW" = "xyes"; then
+-  AC_DEFINE(HAVE_DW, 1, [libdw available])
++AC_ARG_WITH([dw],[AS_HELP_STRING([--with-dw=yes|no|auto],[use libdw])],
++            [], [with_dw=auto])
++if [ test "x${with_dw}" != "xno" ]; then
++  PKG_CHECK_MODULES(DW, [libdw],
++      [
++        HAVE_DW=yes
++        AC_DEFINE(HAVE_DW, 1, [libdw available])
++      ],
++      [
++        HAVE_DW=no
++        if [ test "x${with_dw}" = "xyes" ]; then
++          AC_MSG_ERROR([could not find libdw])
++        fi
++      ])
++else
++  HAVE_DW=no
+ fi
+ 
+ dnl Check for backtrace() from libc
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.2.bb
similarity index 59%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.2.bb
index 2a67993..8d41a59 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.2.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://deterministic-unwind.patch \
+    file://0001-configure-Add-switches-for-enabling-disabling-libdw-.patch \
 "
-SRC_URI[md5sum] = "7c91a97e4a2dc81eafd59d0a2f8b0d6e"
-SRC_URI[sha256sum] = "50c2f5af50a6cc6c0a3f3ed43bdd8b5e2bff00bacfb766d4be139ec06d8b5218"
+SRC_URI[md5sum] = "4748860621607ffd96244fb79c86c238"
+SRC_URI[sha256sum] = "9fde3f39a2ea984f9e07ce09250285ce91f6e3619d186889f75b5154ecf994ba"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.7.4


