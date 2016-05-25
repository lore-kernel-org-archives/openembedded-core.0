Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 51B0565CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:29:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 06:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="988474024"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2016 06:29:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 16:29:34 +0300
Message-Id: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464176988.git.jussi.kukkonen@intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/7] clutter-1.0: Upgrade 1.24.2 -> 1.26.0
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
X-List-Received-Date: Wed, 25 May 2016 13:29:47 -0000

Remove a backported patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-build-Use-AC_COMPILE_IFELSE.patch         | 105 ---------------------
 ...clutter-1.0_1.24.2.bb => clutter-1.0_1.26.0.bb} |   5 +-
 2 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.24.2.bb => clutter-1.0_1.26.0.bb} (52%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch b/meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch
deleted file mode 100644
index c4edff3..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 483a4bb00e7dd2f14d86e167c8013c8638723c33 Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Thu, 18 Feb 2016 17:19:09 +0000
-Subject: [PATCH] build: Use AC_COMPILE_IFELSE
-
-Instead of AC_TRY_COMPILE, which has been deprecated by newer autoconf.
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- configure.ac | 66 ++++++++++++++++++++++++++++++------------------------------
- 1 file changed, 33 insertions(+), 33 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4d72e0c..8ca3f94 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -348,24 +348,25 @@ AS_IF([test "x$enable_wayland" != xno],
-         # We need to manually check for Wayland support in Cogl because
-         # the windowing systems are not exposed in the pkg-config file
-         saved_CFLAGS="${CFLAGS}"
--        CFLAGS="`$PKG_CONFIG --cflags $CLUTTER_BASE_PC_FILES`"
-+        CFLAGS="`$PKG_CONFIG --cflags cogl-1.0`"
- 
-         AC_MSG_CHECKING([for Wayland Cogl backend])
--        AC_TRY_COMPILE([#include <cogl/cogl.h>],
--                       [
--                         #ifndef COGL_HAS_EGL_PLATFORM_WAYLAND_SUPPORT
--                         #error "No Wayland support in Cogl"
--                         #endif
--                         int main (void) { return 0; }
--                       ],
--                       [
--                         AC_MSG_RESULT(yes)
--                         have_cogl_wayland=yes
--                       ],
--                       [
--                         AC_MSG_RESULT(no)
--                         have_cogl_wayland=no
--                       ])
-+
-+        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-+#include <cogl/cogl.h>
-+]],
-+[[
-+#ifndef COGL_HAS_EGL_PLATFORM_WAYLAND_SUPPORT
-+#error Cogl compiled without Wayland support
-+#endif
-+]])], [
-+          AC_MSG_RESULT(yes)
-+          have_cogl_wayland=yes
-+        ], [
-+          AC_MSG_RESULT(no)
-+          have_cogl_wayland=no
-+        ])
-+
-         CFLAGS="${saved_CFLAGS}"
-         AS_IF([test "x$have_cogl_wayland" = xyes],
-               [
-@@ -499,26 +500,25 @@ AS_IF([test "x$enable_mir" = "xyes"],
-         # We need to manually check for Mir support in Cogl because
-         # the windowing systems are not exposed in the pkg-config file
-         saved_CFLAGS="${CFLAGS}"
--        CFLAGS="`$PKG_CONFIG --cflags $CLUTTER_BASE_PC_FILES`"
-+        CFLAGS="`$PKG_CONFIG --cflags cogl-1.0`"
- 
-         AC_MSG_CHECKING([for Mir Cogl backend])
--        AC_TRY_COMPILE([#include <cogl/cogl.h>],
--                       [
--                        #ifndef COGL_HAS_EGL_PLATFORM_MIR_SUPPORT
--                        #error "No Mir support in Cogl"
--                        #endif
--                        int main (void) { return 0; }
--                       ],
--                       [
--                         AC_MSG_RESULT(yes)
--                         have_cogl_mir=yes
--                       ],
--                       [
--                         AC_MSG_RESULT(no)
--                         have_cogl_mir=no
--                       ])
- 
--        CFLAGS="${saved_CFLAGS}"
-+        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-+#include <cogl/cogl.h>
-+]],
-+[[
-+#ifndef COGL_HAS_EGL_PLATFORM_MIR_SUPPORT
-+#error Cogl compiled without Mir support
-+#endif
-+]])], [
-+          AC_MSG_RESULT(yes)
-+          have_cogl_mir=yes
-+        ], [
-+          AC_MSG_RESULT(no)
-+          have_cogl_mir=no
-+        ])
-+
-         AS_IF([test "x$have_cogl_mir" = xno], [AC_MSG_ERROR("*** Cogl is missing Mir support.")])
- 
-         PKG_CHECK_EXISTS([mirclient],
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
similarity index 52%
rename from meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
rename to meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
index c53b3e7..fba9959 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
@@ -2,9 +2,8 @@ require clutter-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "3b98e1b33719982a5736ae42cbf7183e"
-SRC_URI[archive.sha256sum] = "9631c98cb4bcbfec15e1bbe9eaa6eef0f127201552fce40d7d28f2133803cd63"
+SRC_URI[archive.md5sum] = "b065e9ca53d1f6bc1ec26aeb27338bb7"
+SRC_URI[archive.sha256sum] = "67514e7824b3feb4723164084b36d6ce1ae41cb3a9897e9f1a56c8334993ce06"
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
-            file://0001-build-Use-AC_COMPILE_IFELSE.patch \
             file://run-ptest"
-- 
2.1.4


