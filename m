Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 892177F62D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 06:29:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBD6TCZK024590
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 12 Dec 2019 22:29:12 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 12 Dec 2019 22:28:59 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 13 Dec 2019 14:28:58 +0800
Message-ID: <1576218538-14217-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] assimp: fix search library failed on multilib
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
X-List-Received-Date: Fri, 13 Dec 2019 06:29:12 -0000
Content-Type: text/plain

While multilib enabled, it builds vulkan-demos failed
...
|CMake Error at tmp-glibc/work/aarch64-wrs-linux/vulkan-demos/git-r0/
recipe-sysroot/usr/lib64/cmake/assimp-5.0/assimpTargets.cmake:85 (message):
|  The imported target "assimp::assimp" references the file
|     "tmp-glibc/work/aarch64-wrs-linux/vulkan-demos/git-r0/recipe-sysroot/usr/lib/libassimp.so.5"
|  but this file does not exist.  Possible reasons include:
...

Since oe-core set ASSIMP_LIB_INSTALL_DIR to baselib, use it rather than
hardcoded `/lib' to search library

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...MP_LIB_INSTALL_DIR-to-search-library.patch | 70 +++++++++++++++++++
 meta/recipes-graphics/vulkan/assimp_5.0.0.bb  |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch

diff --git a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
new file mode 100644
index 0000000000..3e9fbec701
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
@@ -0,0 +1,70 @@
+From dd5c10f660716a2fab513714245be1932003306b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 12 Dec 2019 22:16:15 -0800
+Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library
+
+Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search library
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ assimpTargets-release.cmake.in | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
+index b09b881f..5c6999fe 100644
+--- a/assimpTargets-release.cmake.in
++++ b/assimpTargets-release.cmake.in
+@@ -42,11 +42,11 @@ if(MSVC)
+     # Import target "assimp::assimp" for configuration "Release"
+     set_property(TARGET assimp::assimp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
+     set_target_properties(assimp::assimp PROPERTIES
+-      IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/${importLibraryName}"
++      IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}"
+       IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${importLibraryName}")
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}")
+     list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
+   else()
+     set(staticLibraryName "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
+@@ -54,10 +54,10 @@ if(MSVC)
+     # Import target "assimp::assimp" for configuration "Release"
+     set_property(TARGET assimp::assimp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
+     set_target_properties(assimp::assimp PROPERTIES
+-      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
++      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}")
+   endif()
+ 
+ else()
+@@ -66,17 +66,17 @@ else()
+     set(sharedLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@")
+     set_target_properties(assimp::assimp PROPERTIES
+       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
+-      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
++      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}" )
+   else()
+     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
+     set_target_properties(assimp::assimp PROPERTIES
+-      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
++      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}" )
+   endif()
+ endif()
+ 
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.0.bb b/meta/recipes-graphics/vulkan/assimp_5.0.0.bb
index 77e3651e45..a42494a920 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.0.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.0.bb
@@ -10,6 +10,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "git://github.com/assimp/assimp.git \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
+           file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.21.0


