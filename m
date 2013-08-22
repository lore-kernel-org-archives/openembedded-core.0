Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F04D461DDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:53:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2013 03:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,933,1367996400"; d="scan'208";a="384861911"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 03:53:51 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 13:53:05 +0300
Message-Id: <4902bfc23fbc37b22cdd055312bb5a951dc1aa77.1377164191.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377164191.git.mihai.prica@intel.com>
References: <cover.1377164191.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377164191.git.mihai.prica@intel.com>
References: <cover.1377164191.git.mihai.prica@intel.com>
Subject: [PATCH 1/1] harfbuzz: upgrade to v0.9.19
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
X-List-Received-Date: Thu, 22 Aug 2013 10:53:59 -0000

Remove the disable_graphite.patch because the --without-graphite2
configure option can be used instead.

Split package into harfbuzz and harfbuzz-icu. The ICU support is
now built into a separate library that will be shipped in a
different package.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../harfbuzz-0.9.17/disable_graphite.patch         |   15 ---------------
 .../{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb}     |   18 +++++++++++++-----
 2 files changed, 13 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb} (61%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch b/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
deleted file mode 100644
index 49938ba..0000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd harfbuzz-0.9.10/configure.ac harfbuzz-0.9.10/configure.ac
---- harfbuzz-0.9.10/configure.ac	2013-01-03 08:08:51.000000000 +0200
-+++ harfbuzz-0.9.10/configure.ac	2013-01-09 08:18:04.812529418 +0200
-@@ -185,7 +185,7 @@
-
- dnl ==========================================================================
-
--PKG_CHECK_MODULES(GRAPHITE2, graphite2, have_graphite=true, have_graphite=false)
-+have_graphite=false
- if $have_graphite; then
-     AC_DEFINE(HAVE_GRAPHITE2, 1, [Have Graphite library])
- fi
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.17.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
similarity index 61%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.17.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
index 968d8a2..daf7273 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.17.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
@@ -13,17 +13,25 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 
 SECTION = "libs"
 
-PR = "r0"
-
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2 \
-           file://disable_graphite.patch \
 "
 
-SRC_URI[md5sum] = "c48827713e93539dc7285f9e86ffbdc5"
-SRC_URI[sha256sum] = "a4773003512035cb5c559de23e1d53f292bcb0212f023b540c4dc695b39690ed"
+SRC_URI[md5sum] = "9782581ee6ef972554772e84ca448131"
+SRC_URI[sha256sum] = "d2da0f060d47f6ad9de8c8781bb21fa4b9eae8ea1cd1e956b814095baa002f35"
 
 inherit autotools pkgconfig
 
 DEPENDS = "icu glib-2.0 cairo freetype"
 
 BBCLASSEXTEND = "native"
+
+EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --with-icu --without-graphite2"
+
+PACKAGES =+ "${PN}-icu ${PN}-icu-dbg ${PN}-icu-dev"
+
+FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
+FILES_${PN}-icu-dbg = "${libdir}/.debug/libharfbuzz-icu.so*"
+FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
+                       ${libdir}/libharfbuzz-icu.so \
+                       ${libdir}/pkgconfig/harfbuzz-icu.pc \
+"
-- 
1.7.9.5


