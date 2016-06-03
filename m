Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4759C774F9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440174"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:44 +0300
Message-Id: <41895640b8aac08303b5aeaf5fce2ed394c6b12d.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/25] boost: update to 1.61.0
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:15 -0000

0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch has been merged upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...bjam-native_1.60.0.bb => bjam-native_1.61.0.bb} |  0
 .../boost/{boost-1.60.0.inc => boost-1.61.0.inc}   |  4 +-
 ...qualify-fenv.h-names-that-might-be-macros.patch | 45 ----------------------
 .../boost/{boost_1.60.0.bb => boost_1.61.0.bb}     |  1 -
 4 files changed, 2 insertions(+), 48 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.60.0.bb => bjam-native_1.61.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.60.0.inc => boost-1.61.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch
 rename meta/recipes-support/boost/{boost_1.60.0.bb => boost_1.61.0.bb} (59%)

diff --git a/meta/recipes-support/boost/bjam-native_1.60.0.bb b/meta/recipes-support/boost/bjam-native_1.61.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.60.0.bb
rename to meta/recipes-support/boost/bjam-native_1.61.0.bb
diff --git a/meta/recipes-support/boost/boost-1.60.0.inc b/meta/recipes-support/boost/boost-1.61.0.inc
similarity index 83%
rename from meta/recipes-support/boost/boost-1.60.0.inc
rename to meta/recipes-support/boost/boost-1.61.0.inc
index a38693e..4553677 100644
--- a/meta/recipes-support/boost/boost-1.60.0.inc
+++ b/meta/recipes-support/boost/boost-1.61.0.inc
@@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "65a840e1a0b13a558ff19eeb2c4f0cbe"
-SRC_URI[sha256sum] = "686affff989ac2488f79a97b9479efb9f2abae035b5ed4d8226de6857933fd3b"
+SRC_URI[md5sum] = "6095876341956f65f9d35939ccea1a9f"
+SRC_URI[sha256sum] = "a547bd06c2fd9a71ba1d169d9cf0339da7ebf4753849a8f7d6fdb8feee99b640"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch b/meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch
deleted file mode 100644
index df7e71f..0000000
--- a/meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f50e7bc9fed323c5705c0ed992c03e80eeec1dd6 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <jwakely@redhat.com>
-Date: Mon, 14 Sep 2015 15:05:24 +0100
-Subject: [PATCH] Do not qualify <fenv.h> names that might be macros.
-
-The patch was imported from the boost-test git repository
-(https://github.com/boostorg/test) as of commit id
-f50e7bc9fed323c5705c0ed992c03e80eeec1dd6.
-  
-Upstream-Status: Accepted [commit f50e7bc9fed in develop branch]
-
-Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
----
- include/boost/test/impl/execution_monitor.ipp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/boost/test/impl/execution_monitor.ipp b/include/boost/test/impl/execution_monitor.ipp
-index b3e873e..a7bdce2 100644
---- a/include/boost/test/impl/execution_monitor.ipp
-+++ b/include/boost/test/impl/execution_monitor.ipp
-@@ -1380,8 +1380,8 @@ enable( unsigned mask )
- 
-     return ~old_cw & BOOST_FPE_ALL;
- #elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
--    ::feclearexcept(BOOST_FPE_ALL);
--    int res = ::feenableexcept( mask );
-+    feclearexcept(BOOST_FPE_ALL);
-+    int res = feenableexcept( mask );
-     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
- #else
-     /* Not Implemented  */
-@@ -1417,8 +1417,8 @@ disable( unsigned mask )
- 
-     return ~old_cw & BOOST_FPE_ALL;
- #elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
--    ::feclearexcept(BOOST_FPE_ALL);
--    int res = ::fedisableexcept( mask );
-+    feclearexcept(BOOST_FPE_ALL);
-+    int res = fedisableexcept( mask );
-     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
- #else
-     /* Not Implemented */
--- 
-1.9.1
-
diff --git a/meta/recipes-support/boost/boost_1.60.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
similarity index 59%
rename from meta/recipes-support/boost/boost_1.60.0.bb
rename to meta/recipes-support/boost/boost_1.61.0.bb
index 4d824c8..d8b14fe 100644
--- a/meta/recipes-support/boost/boost_1.60.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -3,6 +3,5 @@ include boost.inc
 
 SRC_URI += "\
     file://arm-intrinsics.patch \
-    file://0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch;striplevel=2 \
     file://consider-hardfp.patch \
 "
-- 
2.8.1


