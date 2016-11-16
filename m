Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CE74E71A08
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 13:15:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 05:15:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,500,1473145200"; 
   d="scan'208";a="5015854"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2016 05:15:09 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id DD00B6A4080;
	Wed, 16 Nov 2016 05:14:29 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:15:02 +0200
Message-Id: <c9e9ba4dd173b48bdd1c9dd374f3a53de811b1b2.1479301275.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <21d8313a85d99df758d09cacc1926c109b1e1adc.1479301275.git.jussi.kukkonen@intel.com>
References: <21d8313a85d99df758d09cacc1926c109b1e1adc.1479301275.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1479301275.git.jussi.kukkonen@intel.com>
References: <cover.1479301275.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] piglit: Upgrade to current master head
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
X-List-Received-Date: Wed, 16 Nov 2016 13:15:11 -0000

Remove upstreamed patches.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-cmake-Link-test-utils-with-ldl.patch      | 41 ----------------
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch | 54 ----------------------
 meta/recipes-graphics/piglit/piglit_git.bb         |  6 +--
 3 files changed, 2 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
deleted file mode 100644
index 2e1c947..0000000
--- a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Backport patch to fix build with gold linker.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport
-
-
-
-From 93a7113485cf1c55fd7076116faf5b3a690706b2 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 30 Aug 2016 17:17:28 +0300
-Subject: [PATCH] cmake: Link test utils with "-ldl"
-
-Without this linking CXX executables (e.g. fbo-blit-stretch) fails
-with gold linker:
-
-| libpiglitutil_gl.so.0: error: undefined reference to 'dlsym'
-| libpiglitutil_gl.so.0: error: undefined reference to 'dlerror'
-| libpiglitutil_gl.so.0: error: undefined reference to 'dlopen'
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
----
- tests/util/CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index e1f8073..3d5bef5 100644
---- a/tests/util/CMakeLists.txt
-+++ b/tests/util/CMakeLists.txt
-@@ -11,6 +11,8 @@ set_source_files_properties(
- 	PROPERTIES GENERATED 1
- 	)
- 
-+link_libraries(${CMAKE_DL_LIBS})
-+
- if(HAVE_LIBCACA)
-     link_libraries(caca)
- endif()
--- 
-2.9.3
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
deleted file mode 100644
index 845804d..0000000
--- a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 73e4fbc5777eddd89bb0fb16e90343551fe3e0ef Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 5 Jul 2016 10:56:23 +0300
-Subject: [PATCH] cmake: Link utils with xcb explicitly
-
-Linking with g++ can reportedly lead to:
-
-libpiglitutil_gl.so.0: error: undefined reference to 'xcb_connect'
-libpiglitutil_gl.so.0: error: undefined reference to 'xcb_get_setup'
-libpiglitutil_gl.so.0: error: undefined reference to 'xcb_setup_roots_iterator'
-
-This may have appeared now because xcb-dri2 used to overlink publicly
-but now does not.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Accepted
----
- CMakeLists.txt            | 1 +
- tests/util/CMakeLists.txt | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8e2abba..2e1a473 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -151,6 +151,7 @@ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
- 
- 	pkg_check_modules(LIBDRM QUIET libdrm)
- 	pkg_check_modules(LIBDRM_INTEL QUIET libdrm_intel)
-+	pkg_check_modules(XCB QUIET xcb)
- 	pkg_check_modules(XCB_DRI2 QUIET xcb-dri2)
- 	pkg_check_modules(GLPROTO QUIET glproto)
- ELSEIF(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
-diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index fb22ffa..e1f8073 100644
---- a/tests/util/CMakeLists.txt
-+++ b/tests/util/CMakeLists.txt
-@@ -121,11 +121,13 @@ if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
- 
- 		list(APPEND UTIL_GL_LIBS
- 			${LIBDRM_LDFLAGS}
-+			${XCB_LDFLAGS}
- 			${XCB_DRI2_LDFLAGS}
- 		)
- 
- 		list(APPEND UTIL_GL_INCLUDES
- 			${LIBDRM_INCLUDE_DIRS}
-+			${XCB_INCLUDE_DIRS}
- 			${XCB_DRI2_INCLUDE_DIRS}
- 		)
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 916154a..6533855 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,13 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
-           file://0001-cmake-Link-utils-with-xcb-explicitly.patch \
-           file://0001-cmake-Link-test-utils-with-ldl.patch \
            file://piglit.sh \
            "
 
-# From 2016-07-07
-SRCREV = "c39e41a86551eb390b8da23232dc8577639403d0"
+# Head of master 2016-11-16
+SRCREV = "1619c37a88770c9c0d8467939e34ffd337241c14"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.1.4


