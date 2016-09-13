Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0F008771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:46:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2016 01:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,327,1470726000"; d="scan'208";a="1055231368"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2016 01:46:51 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 11:46:40 +0300
Message-Id: <c80aadf2f46f6339d8aa9f7b95a2ca40d84650e1.1473755500.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473755500.git.jussi.kukkonen@intel.com>
References: <cover.1473755500.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] piglit: Backport linker flag patch
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
X-List-Received-Date: Tue, 13 Sep 2016 08:46:55 -0000

Use the correct build system patch instead of adding linker flags
in recipe. Also update upstream status for the other build patch.

Fixes [YOCTO #9851].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-cmake-Link-test-utils-with-ldl.patch      | 41 ++++++++++++++++++++++
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |  3 +-
 3 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
new file mode 100644
index 0000000..2e1c947
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
@@ -0,0 +1,41 @@
+Backport patch to fix build with gold linker.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Backport
+
+
+
+From 93a7113485cf1c55fd7076116faf5b3a690706b2 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 30 Aug 2016 17:17:28 +0300
+Subject: [PATCH] cmake: Link test utils with "-ldl"
+
+Without this linking CXX executables (e.g. fbo-blit-stretch) fails
+with gold linker:
+
+| libpiglitutil_gl.so.0: error: undefined reference to 'dlsym'
+| libpiglitutil_gl.so.0: error: undefined reference to 'dlerror'
+| libpiglitutil_gl.so.0: error: undefined reference to 'dlopen'
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+---
+ tests/util/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
+index e1f8073..3d5bef5 100644
+--- a/tests/util/CMakeLists.txt
++++ b/tests/util/CMakeLists.txt
+@@ -11,6 +11,8 @@ set_source_files_properties(
+ 	PROPERTIES GENERATED 1
+ 	)
+ 
++link_libraries(${CMAKE_DL_LIBS})
++
+ if(HAVE_LIBCACA)
+     link_libraries(caca)
+ endif()
+-- 
+2.9.3
+
diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
index d591da5..845804d 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
@@ -13,7 +13,7 @@ This may have appeared now because xcb-dri2 used to overlink publicly
 but now does not.
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Pending
+Upstream-Status: Accepted
 ---
  CMakeLists.txt            | 1 +
  tests/util/CMakeLists.txt | 2 ++
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index b2ca553..82adcde 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
            file://0001-cmake-Link-utils-with-xcb-explicitly.patch \
+           file://0001-cmake-Link-test-utils-with-ldl.patch \
            "
 
 # From 2016-07-07
@@ -30,8 +31,6 @@ do_compile[dirs] =+ "${B}/temp/"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 
-LDFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-ldl', '', d)}"
-
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
         sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit/glut_wrap.h
-- 
2.1.4


