Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7638F605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:33:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Dec 2015 06:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="840816595"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2015 06:33:02 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 28B036A4007;
	Mon, 14 Dec 2015 07:21:03 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 16:34:10 +0200
Message-Id: <1450103652-30181-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450103652-30181-1-git-send-email-maxin.john@intel.com>
References: <1450103652-30181-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH v3 2/4] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Mon, 14 Dec 2015 14:33:03 -0000

* Build system changed to cmake
* Patch build system to not check for perl (we use host
  perl which won't be found)
* Patch build system to not break on parallel builds

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../Depend-on-headers-to-fix-parallel-build.patch  | 46 ++++++++++++++++++++++
 .../libical/libical/Fix-x32-ABI-build.patch        | 38 ++++++++++++++++++
 .../libical/Remove-cmake-check-for-Perl.patch      | 33 ++++++++++++++++
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb} | 14 ++++---
 4 files changed, 126 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
 create mode 100644 meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch
 create mode 100644 meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (53%)

diff --git a/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
new file mode 100644
index 0000000..4d65c81
--- /dev/null
+++ b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
@@ -0,0 +1,46 @@
+From 56a10a14c0a544df99c97ce279801ddf40b0df52 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 14 Sep 2015 13:35:42 +0300
+Subject: [PATCH] WIP: Depend on headers to fix parallel build
+
+Parallel builds occasionally fail because generated headers are only
+half built when they're being used.
+
+This fix is extracted
+from https://github.com/libical/libical/commit/dcc40c7ae2d337a0d83c077bf9d8f283499c6717
+
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+---
+ examples/CMakeLists.txt    | 1 +
+ src/libical/CMakeLists.txt | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 3379ffd..514956b 100644
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -16,6 +16,7 @@ set(doesnothing_SRCS
+ )
+ 
+ add_executable(doesnothing ${doesnothing_SRCS})
++add_dependencies(doesnothing ical icalss icalvcal)
+ 
+ target_link_libraries(doesnothing ical icalss icalvcal ical icalss icalvcal)
+ 
+diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt
+index 6774352..468a7d9 100644
+--- a/src/libical/CMakeLists.txt
++++ b/src/libical/CMakeLists.txt
+@@ -261,6 +261,7 @@ add_library(ical ${LIBRARY_TYPE} ${ical_LIB_SRCS})
+ add_library(ical-static STATIC ${ical_LIB_SRCS})
+ 
+ add_dependencies(ical ical-header)
++add_dependencies(ical-static ical-header)
+ 
+ target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})
+ 
+-- 
+2.1.4
+
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
diff --git a/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
new file mode 100644
index 0000000..c5c0cb0
--- /dev/null
+++ b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
@@ -0,0 +1,33 @@
+From 918cd8764a845a9d25918a444fbaa5070d2be609 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 21 Aug 2015 16:38:05 +0300
+Subject: [PATCH] Remove cmake check for Perl
+
+We set "CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY" in cmake bbclass to
+make sure cmake does not find host programs. In this case we actually
+are fine with host perl: remove the check.
+
+Upstream-Status: Inappropriate [workaround]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d5aad80..5cc9863 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -91,8 +91,7 @@ if(SHARED_ONLY)
+   set(LIBRARY_TYPE SHARED)
+ endif()
+ 
+-# must have Perl to create the derived stuff
+-find_package(Perl REQUIRED)
++set(PERL_EXECUTABLE perl)
+ 
+ # MSVC specific definitions
+ if(WIN32)
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.1.bb
similarity index 53%
rename from meta/recipes-support/libical/libical_1.0.0.bb
rename to meta/recipes-support/libical/libical_1.0.1.bb
index 026e7f1..e18b803 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -6,10 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
-SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
+           file://Remove-cmake-check-for-Perl.patch \
+           file://Fix-x32-ABI-build.patch \
+           file://Depend-on-headers-to-fix-parallel-build.patch \
+           "
+SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
+SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
 
-UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases/"
+inherit cmake
 
-inherit autotools
+FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.4.0


