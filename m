Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CE6BD78286
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 14:56:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 07:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,286,1496127600"; d="scan'208";a="1146516224"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2017 07:56:12 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9B3205801BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:56:11 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 17:56:13 +0300
Message-Id: <1498834581-12279-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 03/11] gstreamer1.0: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Fri, 30 Jun 2017 14:56:12 -0000

Remove "--disable-docbook" configure option and refresh
the following patch:
        1. deterministic-unwind.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  1 -
 .../gstreamer1.0/deterministic-unwind.patch        | 29 ++++++++++++++++------
 ...treamer1.0_1.10.4.bb => gstreamer1.0_1.12.1.bb} |  4 +--
 3 files changed, 23 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.4.bb => gstreamer1.0_1.12.1.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 72d7ce6..d174a82 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -28,7 +28,6 @@ PACKAGECONFIG[unwind] = "--with-unwind,--without-unwind,libunwind"
 
 EXTRA_OECONF = " \
     --disable-dependency-tracking \
-    --disable-docbook \
     --disable-examples \
 "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
index e39e6ca..dfca096 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
@@ -1,24 +1,37 @@
-Make the detection of libunwind deterministic.
+From 31fb9cde63f55f2610a736f390124a570c564169 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 12 May 2017 17:43:08 +0300
+Subject: [PATCH] Make the detection of libunwind deterministic.
 
 Upstream-Status: Pending
+
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ac88fb2..182c19a 100644
+index 9fa6824..fe9696f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -829,3 +828,0 @@ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
--dnl libunwind is optionally used by the leaks tracer
+@@ -821,10 +821,12 @@ fi
+ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
+ 
+ dnl libunwind is optionally used by the leaks tracer
 -PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
--
-@@ -839,3 +836,7 @@ AC_CHECK_FUNC(backtrace, [
 -if test "x$HAVE_UNWIND" = "xyes"; then
 -  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
 -fi
-+dnl libunwind is optionally used by the leaks tracer
 +AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind],[use libunwind])],
 +            [], [with_unwind=yes])
 +AS_IF([test "$with_unwind" = yes],
 +      [PKG_CHECK_MODULES(UNWIND, libunwind)
 +       AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])]
-+)
++ )
+ 
+ dnl libdw is optionally used to add source lines and numbers to backtraces
+ PKG_CHECK_MODULES(DW, libdw, HAVE_DW=yes, HAVE_DW=no)
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.1.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.1.bb
index 2a67993..f1a7001 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.1.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://deterministic-unwind.patch \
 "
-SRC_URI[md5sum] = "7c91a97e4a2dc81eafd59d0a2f8b0d6e"
-SRC_URI[sha256sum] = "50c2f5af50a6cc6c0a3f3ed43bdd8b5e2bff00bacfb766d4be139ec06d8b5218"
+SRC_URI[md5sum] = "3c9f2bc7d75daf87fb5d8d0f2158b8ea"
+SRC_URI[sha256sum] = "9044b9d8b3ff44457fa9e36faa59c56684b587b34dee449bfe15ec0c32a3a6d2"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.4.0


