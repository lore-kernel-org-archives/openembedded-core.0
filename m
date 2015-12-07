Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DD99560124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 15:54:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2015 07:54:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,395,1444719600"; d="scan'208";a="855692327"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2015 07:54:25 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 123386A4087;
	Mon,  7 Dec 2015 07:53:14 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 17:55:14 +0200
Message-Id: <1449503714-18873-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Mon, 07 Dec 2015 15:54:36 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

* Build system changed to cmake.
* Patch build system to not check for perl (we use host
  perl which won't be found)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libical/Remove-cmake-check-for-Perl.patch      | 45 ++++++++++++++++++++++
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb} | 12 ++++--
 2 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (61%)

diff --git a/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
new file mode 100644
index 0000000..11cffbb
--- /dev/null
+++ b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
@@ -0,0 +1,45 @@
+Subject: [PATCH] Remove cmake check for Perl
+
+We set "CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY" in cmake bbclass to
+make sure cmake does not find host programs. In this case we actually
+are fine with host perl: remove the check.
+
+Also fix the x32 ABI build.
+
+Inappropriate [workaround]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur libical-1.0.1-orig/CMakeLists.txt libical-1.0.1/CMakeLists.txt
+--- libical-1.0.1-orig/CMakeLists.txt	2014-10-09 18:07:05.000000000 +0300
++++ libical-1.0.1/CMakeLists.txt	2015-12-07 17:19:52.519081963 +0200
+@@ -91,8 +91,11 @@
+   set(LIBRARY_TYPE SHARED)
+ endif()
+ 
+-# must have Perl to create the derived stuff
+-find_package(Perl REQUIRED)
++set(PERL_EXECUTABLE perl)
++# Ensure finding 64bit libs when using 64-bit compilers
++if(CMAKE_CL_64)
++  set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS True)
++endif()
+ 
+ # MSVC specific definitions
+ if(WIN32)
+@@ -105,10 +108,10 @@
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
diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.1.bb
similarity index 61%
rename from meta/recipes-support/libical/libical_1.0.0.bb
rename to meta/recipes-support/libical/libical_1.0.1.bb
index be6b635..7dcb9eb 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -6,8 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
-SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
+           file://Remove-cmake-check-for-Perl.patch \
+           "
+SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
+SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
 
-inherit autotools
+inherit cmake
+
+FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.4.0


