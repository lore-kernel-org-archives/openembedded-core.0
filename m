Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2842A6E668
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 16:42:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2015 08:42:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,395,1444719600"; d="scan'208";a="836075203"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 07 Dec 2015 08:42:57 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9B0696A4087
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 08:41:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 18:43:50 +0200
Message-Id: <1449506630-31407-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1449506630-31407-1-git-send-email-maxin.john@intel.com>
References: <1449506630-31407-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] libical: Fix x32 ABI build
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
X-List-Received-Date: Mon, 07 Dec 2015 16:42:57 -0000

Fix x32 ABI build failure by using GNUInstallDirs in CMakeLists.txt

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libical/libical/Fix-x32-ABI-build.patch        | 38 ++++++++++++++++++++++
 meta/recipes-support/libical/libical_1.0.1.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch

diff --git a/meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch b/meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch
new file mode 100644
index 0000000..12186e2
--- /dev/null
+++ b/meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch
@@ -0,0 +1,38 @@
+Subject: [PATCH] Use GNUInstallDirs.
+
+x32 ABI build fails because of improper library path. Use
+GNUInstallDirs to fix it.
+
+Upstream-Status: Backport
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur libical-1.0.1-orig/CMakeLists.txt libical-1.0.1/CMakeLists.txt
+--- libical-1.0.1-orig/CMakeLists.txt	2015-12-07 18:13:58.311503974 +0200
++++ libical-1.0.1/CMakeLists.txt	2015-12-07 18:17:18.362002998 +0200
+@@ -92,6 +92,10 @@
+ endif()
+ 
+ set(PERL_EXECUTABLE perl)
++# Ensure finding 64bit libs when using 64-bit compilers
++if(CMAKE_CL_64)
++  set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS True)
++endif()
+ 
+ # MSVC specific definitions
+ if(WIN32)
+@@ -104,10 +108,10 @@
+   add_definitions(-DBIG_ENDIAN=0 -DLITTLE_ENDIAN=1 -DBYTE_ORDER=BIG_ENDIAN)
+ endif()
+ 
+-set(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)")
+-set(LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}" CACHE STRING "Library directory name" FORCE)
+-set(INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE STRING "Include directory name" FORCE)
+-set(SHARE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share" CACHE STRING "Share directory name" FORCE)
++include(GNUInstallDirs)
++set(LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR} CACHE STRING "Library directory name" FORCE)
++set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR} CACHE STRING "Include directory name" FORCE)
++set(SHARE_INSTALL_DIR ${CMAKE_INSTALL_DATAROOTDIR} CACHE STRING "Share directory name")
+ 
+ # set the output paths
+ set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
diff --git a/meta/recipes-support/libical/libical_1.0.1.bb b/meta/recipes-support/libical/libical_1.0.1.bb
index 7dcb9eb..0dcee46 100644
--- a/meta/recipes-support/libical/libical_1.0.1.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -8,6 +8,7 @@ SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
            file://Remove-cmake-check-for-Perl.patch \
+           file://Fix-x32-ABI-build.patch \
            "
 SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
 SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
-- 
2.4.0


