Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C11DC77D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:59:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jul 2017 03:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,322,1496127600"; d="scan'208";a="122342011"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 07 Jul 2017 03:59:13 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 9556A580562;
	Fri,  7 Jul 2017 03:59:12 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jul 2017 13:59:08 +0300
Message-Id: <1499425148-34196-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] piglit: Update to current git master
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
X-List-Received-Date: Fri, 07 Jul 2017 10:59:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update, remove backported patches.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

For reference for next graphics stack update Current results on a
NUC715BNH (Intel Iris plus 640, "gen 9.5") with mesa 17.1.3 look
like this:

$ PIGLIT_NO_WINDOW=1 piglit tests/quick results/
$ piglit summary console results/
...
       name: results
       ----  -------
       pass:   48315
       fail:     304
      crash:       2
       skip:    3467
       warn:       4
      total:   52092

Thanks,
  Jussi


 ...fine-GBM_BO_MAP-only-when-symbol-is-found.patch | 49 --------------
 ...nour-Surfaceless-MESA-in-get_default_disp.patch | 49 --------------
 ...atform_surfaceless-Don-t-use-eglGetPlatfo.patch | 31 ---------
 ...atform_surfaceless-Use-EXT-functions-for-.patch | 76 ----------------------
 meta/recipes-graphics/piglit/piglit_git.bb         |  8 +--
 5 files changed, 2 insertions(+), 211 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch b/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
deleted file mode 100644
index 9d6eaaa..0000000
--- a/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 6b6acee8841d092e5066b1bec2ba1c49cce4f91f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Thu, 4 May 2017 00:57:39 -0500
-Subject: [PATCH 1/4] CMake: define GBM_BO_MAP only when symbol is found
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gbm_bo_map() and _unmap() have been added recently to Mesa,
-and this update may not have reached all implementations of
-GBM, such as the one provided by Mali r6, where said
-definitions can be found in the header file but not in the
-library itself. This leads to errors like the following when
-linking:
-  ../../../../lib/libpiglitutil_gl.so.0: undefined reference to `gbm_bo_unmap'
-  ../../../../lib/libpiglitutil_gl.so.0: undefined reference to `gbm_bo_map'
-  collect2: error: ld returned 1 exit status
-  make[2]: *** [bin/point-sprite] Error 1
-
-Instead of relying on the header file, actually try to link
-using that symbol to determine if PIGLIT_HAS_GBM_BO_MAP
-should be defined.
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Reviewed-by: Jan Vesely <jan.vesely@rutgers.edu>
-Upstream-Status: Backport
----
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a4ff99e..cc26fa8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -141,8 +141,9 @@ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
- 	if(GBM_FOUND)
- 		set(PIGLIT_HAS_GBM True)
- 		add_definitions(-DPIGLIT_HAS_GBM)
--		if (GBM_VERSION VERSION_EQUAL "12.1" OR GBM_VERSION VERSION_GREATER "12.1")
--			set(PIGLIT_HAS_GBM_BO_MAP True)
-+		set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${GBM_LIBRARIES})
-+		CHECK_FUNCTION_EXISTS(gbm_bo_map PIGLIT_HAS_GBM_BO_MAP)
-+		if (PIGLIT_HAS_GBM_BO_MAP)
- 			add_definitions(-DPIGLIT_HAS_GBM_BO_MAP)
- 		endif()
- 	endif(GBM_FOUND)
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch b/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
deleted file mode 100644
index 39f0d86..0000000
--- a/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From aa6728cc4941a87e3933c2aa770ab8ae3080b870 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Tue, 16 May 2017 12:37:07 -0500
-Subject: [PATCH 2/4] util/egl: Honour Surfaceless MESA in get_default_display
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Upstream-Status: Pending
----
- tests/util/piglit-util-egl.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/tests/util/piglit-util-egl.c b/tests/util/piglit-util-egl.c
-index 106c735..389fe12 100644
---- a/tests/util/piglit-util-egl.c
-+++ b/tests/util/piglit-util-egl.c
-@@ -85,6 +85,7 @@ piglit_egl_get_default_display(EGLenum platform)
- 	static bool has_x11 = false;
- 	static bool has_wayland = false;
- 	static bool has_gbm = false;
-+	static bool has_surfaceless_mesa = false;
- 
- 	static EGLDisplay (*peglGetPlatformDisplayEXT)(EGLenum platform, void *native_display, const EGLint *attrib_list);
- 
-@@ -99,6 +100,7 @@ piglit_egl_get_default_display(EGLenum platform)
- 		has_x11 = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_EXT_platform_x11");
- 		has_wayland = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_EXT_platform_wayland");
- 		has_gbm = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_EXT_platform_gbm");
-+		has_surfaceless_mesa = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_MESA_platform_surfaceless");
- 
- 		peglGetPlatformDisplayEXT = (void*) eglGetProcAddress("eglGetPlatformDisplayEXT");
- 	}
-@@ -123,6 +125,11 @@ piglit_egl_get_default_display(EGLenum platform)
- 			return EGL_NO_DISPLAY;
- 		}
- 		break;
-+	case EGL_PLATFORM_SURFACELESS_MESA:
-+		if (!has_surfaceless_mesa) {
-+			return EGL_NO_DISPLAY;
-+		}
-+		break;
- 	default:
- 		fprintf(stderr, "%s: unrecognized platform %#x\n", __func__, platform);
- 		return EGL_NO_DISPLAY;
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch b/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
deleted file mode 100644
index ee64415..0000000
--- a/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b02bdbfdba3464ce47f87c04bcd1d35a8fef3f54 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Wed, 17 May 2017 17:53:10 -0500
-Subject: [PATCH 3/4] egl_mesa_platform_surfaceless: Don't use
- eglGetPlatformDisplay directly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Upstream-Status: Pending
----
- .../spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c  | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
-index 3bbd6aa..81a3919 100644
---- a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
-+++ b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
-@@ -31,7 +31,7 @@ test_setup(EGLDisplay *dpy)
- 
- 	piglit_require_egl_extension(EGL_NO_DISPLAY, "EGL_MESA_platform_surfaceless");
- 
--	*dpy = eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA, NULL, NULL);
-+	*dpy = piglit_egl_get_default_display(EGL_PLATFORM_SURFACELESS_MESA);
- 	if (*dpy == EGL_NO_DISPLAY) {
- 		printf("failed to get EGLDisplay\n");
- 		piglit_report_result(PIGLIT_SKIP);
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch b/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
deleted file mode 100644
index 8b4fd34..0000000
--- a/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From f3bb10947a87cc3a59619847f53d47708e10fbb7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Wed, 17 May 2017 10:51:48 -0500
-Subject: [PATCH 4/4] egl_mesa_platform_surfaceless: Use EXT functions for
- surfaces
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-These EXT symbols are guaranteed to exist since they require
-EGL_EXT_platform_base.
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Upstream-Status: Pending
----
- .../egl_mesa_platform_surfaceless.c                | 23 ++++++++++++++++++++--
- 1 file changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
-index 81a3919..264ed71 100644
---- a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
-+++ b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
-@@ -24,6 +24,24 @@
- #include "piglit-util.h"
- #include "piglit-util-egl.h"
- 
-+/* Extension function pointers.
-+ *
-+ * Use prefix 'pegl' (piglit egl) instead of 'egl' to avoid collisions with
-+ * prototypes in eglext.h. */
-+EGLSurface (*peglCreatePlatformPixmapSurfaceEXT)(EGLDisplay display, EGLConfig config,
-+	    NativePixmapType native_pixmap, const EGLint *attrib_list);
-+EGLSurface (*peglCreatePlatformWindowSurfaceEXT)(EGLDisplay display, EGLConfig config,
-+	    NativeWindowType native_window, const EGLint *attrib_list);
-+
-+static void
-+init_egl_extension_funcs(void)
-+{
-+	peglCreatePlatformPixmapSurfaceEXT = (void*)
-+		eglGetProcAddress("eglCreatePlatformPixmapSurfaceEXT");
-+	peglCreatePlatformWindowSurfaceEXT = (void*)
-+		eglGetProcAddress("eglCreatePlatformWindowSurfaceEXT");
-+}
-+
- static void
- test_setup(EGLDisplay *dpy)
- {
-@@ -72,7 +90,7 @@ test_create_window(void *test_data)
- 
- 	test_setup(&dpy);
- 
--	surf = eglCreatePlatformWindowSurface(dpy, EGL_NO_CONFIG_KHR,
-+	surf = peglCreatePlatformWindowSurfaceEXT(dpy, EGL_NO_CONFIG_KHR,
- 					      /*native_window*/ NULL,
- 					      /*attrib_list*/ NULL);
- 	if (surf) {
-@@ -103,7 +121,7 @@ test_create_pixmap(void *test_data)
- 
- 	test_setup(&dpy);
- 
--	surf = eglCreatePlatformPixmapSurface(dpy, EGL_NO_CONFIG_KHR,
-+	surf = peglCreatePlatformPixmapSurfaceEXT(dpy, EGL_NO_CONFIG_KHR,
- 					      /*native_window*/ NULL,
- 					      /*attrib_list*/ NULL);
- 	if (surf) {
-@@ -205,6 +223,7 @@ main(int argc, char **argv)
- 		piglit_report_result(PIGLIT_FAIL);
- 	}
- 
-+	init_egl_extension_funcs();
- 	result = piglit_run_selected_subtests(subtests, selected_names,
- 					      num_selected, result);
- 	piglit_report_result(result);
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 2ea5779..3f43798 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,14 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
-           file://0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch \
-           file://0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch \
-           file://0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch \
-           file://0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch \
            "
 
-# From 2017-02-06
-SRCREV = "ca58eec0b965655c7eba592a634cbf4aadfbc675"
+# From 2017-07-03
+SRCREV = "c8f4fd9eeb298a2ef0855927f22634f794ef3eff"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.1.4


