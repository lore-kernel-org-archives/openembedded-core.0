Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1E3755C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:55:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 14 Feb 2017 01:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="820700658"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2017 01:55:22 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 682C16A4080;
	Tue, 14 Feb 2017 01:54:20 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:55:06 +0200
Message-Id: <f5f7d9d8c31977e6ba0d86ca59ccf1cb59a98754.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487065337.git.jussi.kukkonen@intel.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/11] piglit: Upgrade to current master
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:22 -0000

Remove backported patches. Add runtime dependency for netserver
(as socketserver was recently moved there) and depend on
libxkbcommon (this is really only needed for wayland support
which could be made configurable).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-cmake-Link-test-utils-with-ldl.patch      | 41 ----------------
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch | 54 ----------------------
 meta/recipes-graphics/piglit/piglit_git.bb         | 10 ++--
 3 files changed, 4 insertions(+), 101 deletions(-)
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
index b9cdce8..d6bfb14 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,18 +5,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
-           file://0001-cmake-Link-utils-with-xcb-explicitly.patch \
-           file://0001-cmake-Link-test-utils-with-ldl.patch \
            "
 
-# From 2016-07-07
-SRCREV = "c39e41a86551eb390b8da23232dc8577639403d0"
+# From 2017-02-06
+SRCREV = "ca58eec0b965655c7eba592a634cbf4aadfbc675"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libpng virtual/libx11 libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native"
+DEPENDS = "libpng virtual/libx11 libxkbcommon libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native"
 
 inherit cmake python3native distro_features_check bash-completion
 # depends on virtual/libx11
@@ -49,7 +47,7 @@ RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
 	python3-subprocess python3-misc python3-importlib \
 	python3-unixadmin python3-xml python3-multiprocessing \
 	python3-six python3-shell python3-io python3-argparse \
-	mesa-demos bash \
+	python3-netserver mesa-demos bash \
 	"
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
-- 
2.1.4


