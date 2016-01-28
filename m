Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA9A7719B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 12:34:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2016 04:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,358,1449561600"; d="scan'208";a="870689857"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2016 04:34:48 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F36EA2C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 05:22:41 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2016 14:37:20 +0200
Message-Id: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libical: update to 2.0.0
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
X-List-Received-Date: Thu, 28 Jan 2016 12:34:48 -0000

1.0.1 -> 2.0.0

1. New version is not Binary Compatible with Older Versions
2. Removed two backported patches
        a. Fix-x32-ABI-build.patch
        b. Depend-on-headers-to-fix-parallel-build.patch

3. New RSCALE support requires icu

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../Depend-on-headers-to-fix-parallel-build.patch  | 46 ----------------------
 .../libical/libical/Fix-x32-ABI-build.patch        | 38 ------------------
 .../libical/{libical_1.0.1.bb => libical_2.0.0.bb} |  9 +++--
 3 files changed, 5 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch
 rename meta/recipes-support/libical/{libical_1.0.1.bb => libical_2.0.0.bb} (71%)

diff --git a/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
deleted file mode 100644
index 4d65c81..0000000
--- a/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 56a10a14c0a544df99c97ce279801ddf40b0df52 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 14 Sep 2015 13:35:42 +0300
-Subject: [PATCH] WIP: Depend on headers to fix parallel build
-
-Parallel builds occasionally fail because generated headers are only
-half built when they're being used.
-
-This fix is extracted
-from https://github.com/libical/libical/commit/dcc40c7ae2d337a0d83c077bf9d8f283499c6717
-
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- examples/CMakeLists.txt    | 1 +
- src/libical/CMakeLists.txt | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 3379ffd..514956b 100644
---- a/examples/CMakeLists.txt
-+++ b/examples/CMakeLists.txt
-@@ -16,6 +16,7 @@ set(doesnothing_SRCS
- )
- 
- add_executable(doesnothing ${doesnothing_SRCS})
-+add_dependencies(doesnothing ical icalss icalvcal)
- 
- target_link_libraries(doesnothing ical icalss icalvcal ical icalss icalvcal)
- 
-diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt
-index 6774352..468a7d9 100644
---- a/src/libical/CMakeLists.txt
-+++ b/src/libical/CMakeLists.txt
-@@ -261,6 +261,7 @@ add_library(ical ${LIBRARY_TYPE} ${ical_LIB_SRCS})
- add_library(ical-static STATIC ${ical_LIB_SRCS})
- 
- add_dependencies(ical ical-header)
-+add_dependencies(ical-static ical-header)
- 
- target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch b/meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch
deleted file mode 100644
index 12186e2..0000000
--- a/meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Subject: [PATCH] Use GNUInstallDirs.
-
-x32 ABI build fails because of improper library path. Use
-GNUInstallDirs to fix it.
-
-Upstream-Status: Backport
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur libical-1.0.1-orig/CMakeLists.txt libical-1.0.1/CMakeLists.txt
---- libical-1.0.1-orig/CMakeLists.txt	2015-12-07 18:13:58.311503974 +0200
-+++ libical-1.0.1/CMakeLists.txt	2015-12-07 18:17:18.362002998 +0200
-@@ -92,6 +92,10 @@
- endif()
- 
- set(PERL_EXECUTABLE perl)
-+# Ensure finding 64bit libs when using 64-bit compilers
-+if(CMAKE_CL_64)
-+  set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS True)
-+endif()
- 
- # MSVC specific definitions
- if(WIN32)
-@@ -104,10 +108,10 @@
-   add_definitions(-DBIG_ENDIAN=0 -DLITTLE_ENDIAN=1 -DBYTE_ORDER=BIG_ENDIAN)
- endif()
- 
--set(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)")
--set(LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}" CACHE STRING "Library directory name" FORCE)
--set(INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE STRING "Include directory name" FORCE)
--set(SHARE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share" CACHE STRING "Share directory name" FORCE)
-+include(GNUInstallDirs)
-+set(LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR} CACHE STRING "Library directory name" FORCE)
-+set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR} CACHE STRING "Include directory name" FORCE)
-+set(SHARE_INSTALL_DIR ${CMAKE_INSTALL_DATAROOTDIR} CACHE STRING "Share directory name")
- 
- # set the output paths
- set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
diff --git a/meta/recipes-support/libical/libical_1.0.1.bb b/meta/recipes-support/libical/libical_2.0.0.bb
similarity index 71%
rename from meta/recipes-support/libical/libical_1.0.1.bb
rename to meta/recipes-support/libical/libical_2.0.0.bb
index 838e788..1735cf5 100644
--- a/meta/recipes-support/libical/libical_1.0.1.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -8,11 +8,12 @@ SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
            file://Remove-cmake-check-for-Perl.patch \
-           file://Fix-x32-ABI-build.patch \
-           file://Depend-on-headers-to-fix-parallel-build.patch \
            "
-SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
-SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
+DEPENDS = "icu"
+RDEPENDS_${PN} = "libicuuc libicui18n libicudata"
+
+SRC_URI[md5sum] = "ab743a66927284ccf42ee28847550144"
+SRC_URI[sha256sum] = "20f4a98475052e1200d2691ba50b27969e4bedc6e50bffd5e2fa81f4ac90de9a"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake
-- 
2.4.0


