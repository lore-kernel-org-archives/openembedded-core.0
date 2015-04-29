Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C53487169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:33:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2015 06:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="487181612"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Apr 2015 06:33:42 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 16:33:20 +0300
Message-Id: <1430314400-21537-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mesa: Upgrade 10.4.4 -> 10.5.4
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
X-List-Received-Date: Wed, 29 Apr 2015 13:33:44 -0000

* Remove patches that are no longer needed
* git build depends on python module mako. Inherit pythonnative
  for this
* source directory changed: default S is now correct in mesa recipe,
  but still needs to be set in mesa-gl

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

I've run the piglit quick tests on mesa on a NUC (D54250WYK):
pass rate > 95%.


 meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb       | 11 -----
 meta/recipes-graphics/mesa/mesa-gl_10.5.4.bb       | 13 ++++++
 ...D_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch | 29 ------------
 ...002-mesa-simplify-detection-of-fpclassify.patch | 53 ----------------------
 meta/recipes-graphics/mesa/mesa_10.4.4.bb          | 19 --------
 meta/recipes-graphics/mesa/mesa_10.5.4.bb          | 14 ++++++
 meta/recipes-graphics/mesa/mesa_git.bb             | 10 ++--
 7 files changed, 34 insertions(+), 115 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-gl_10.5.4.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa_10.4.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_10.5.4.bb

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb b/meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb
deleted file mode 100644
index 2acc21d..0000000
--- a/meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require mesa_${PV}.bb
-
-SUMMARY += " (OpenGL only, no EGL/GLES)"
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/mesa:"
-
-PROVIDES = "virtual/libgl virtual/mesa"
-
-PACKAGECONFIG ??= "dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-
-EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.5.4.bb b/meta/recipes-graphics/mesa/mesa-gl_10.5.4.bb
new file mode 100644
index 0000000..fc2bca9
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-gl_10.5.4.bb
@@ -0,0 +1,13 @@
+require mesa_${PV}.bb
+
+SUMMARY += " (OpenGL only, no EGL/GLES)"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/mesa:"
+
+PROVIDES = "virtual/libgl virtual/mesa"
+
+S = "${WORKDIR}/mesa-${PV}"
+
+PACKAGECONFIG ??= "dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch b/meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch
deleted file mode 100644
index 52443d8..0000000
--- a/meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 46cdd464efbada13478f5e39a50aef85599ff91b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 4 Apr 2015 15:50:53 -0700
-Subject: [PATCH 1/2] PTHREAD_MUTEX_RECURSIVE_NP is specific to glibc
-
-use glibc guard around it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- include/c11/threads_posix.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/c11/threads_posix.h b/include/c11/threads_posix.h
-index f9c165d..c641de4 100644
---- a/include/c11/threads_posix.h
-+++ b/include/c11/threads_posix.h
-@@ -178,7 +178,7 @@ mtx_init(mtx_t *mtx, int type)
-         return thrd_error;
-     pthread_mutexattr_init(&attr);
-     if ((type & mtx_recursive) != 0) {
--#if defined(__linux__) || defined(__linux)
-+#if defined __GLIBC__ && (defined(__linux__) || defined(__linux))
-         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
- #else
-         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch b/meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch
deleted file mode 100644
index dd7a188..0000000
--- a/meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From c09606093c6b8e47d7cb6745eff192184eaaae07 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Fri, 23 Jan 2015 17:57:15 +0100
-Subject: [PATCH 2/2] mesa: simplify detection of fpclassify
-
-Fixes compilation with musl libc.
-
-Reviewed-by: Ian Romanick <ian.d.romanick@intel.com>
-Upstream-Status: Backport
----
- src/mesa/main/querymatrix.c | 18 +++++++-----------
- 1 file changed, 7 insertions(+), 11 deletions(-)
-
-diff --git a/src/mesa/main/querymatrix.c b/src/mesa/main/querymatrix.c
-index eb36c76..ef85175 100644
---- a/src/mesa/main/querymatrix.c
-+++ b/src/mesa/main/querymatrix.c
-@@ -37,8 +37,12 @@
- #define INT_TO_FIXED(x) ((GLfixed) ((x) << 16))
- #define FLOAT_TO_FIXED(x) ((GLfixed) ((x) * 65536.0))
- 
--#if defined(_MSC_VER)
--#if _MSC_VER < 1800  /* Not required on VS2013 and above. */
-+#if defined(fpclassify)
-+/* ISO C99 says that fpclassify is a macro.  Assume that any implementation
-+ * of fpclassify, whether it's in a C99 compiler or not, will be a macro.
-+ */
-+#elif defined(_MSC_VER)
-+/* Not required on VS2013 and above. */
- /* Oddly, the fpclassify() function doesn't exist in such a form
-  * on MSVC.  This is an implementation using slightly different
-  * lower-level Windows functions.
-@@ -71,16 +75,8 @@ fpclassify(double x)
-             return FP_NAN;
-     }
- }
--#endif  /* _MSC_VER < 1800 */
--
--#elif defined(__APPLE__) || defined(__CYGWIN__) || defined(__FreeBSD__) || \
--     defined(__OpenBSD__) || defined(__NetBSD__) || defined(__DragonFly__) || \
--     (defined(__sun) && defined(__C99FEATURES__)) || defined(__MINGW32__) || \
--     (defined(__sun) && defined(__GNUC__)) || defined(ANDROID) || defined(__HAIKU__)
--
--/* fpclassify is available. */
- 
--#elif !defined(_XOPEN_SOURCE) || _XOPEN_SOURCE < 600
-+#else
- 
- enum {FP_NAN, FP_INFINITE, FP_ZERO, FP_SUBNORMAL, FP_NORMAL}
- fpclassify(double x)
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
deleted file mode 100644
index 7b22bb0..0000000
--- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch \
-	   file://0002-mesa-simplify-detection-of-fpclassify.patch \
-          "
-
-SRC_URI[md5sum] = "62faf98ac79c5587f8e917e187419e6c"
-SRC_URI[sha256sum] = "f18a967e9c4d80e054b2fdff8c130ce6e6d1f8eecfc42c9f354f8628d8b4df1c"
-
-S = "${WORKDIR}/Mesa-${PV}"
-
-#because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
-}
diff --git a/meta/recipes-graphics/mesa/mesa_10.5.4.bb b/meta/recipes-graphics/mesa/mesa_10.5.4.bb
new file mode 100644
index 0000000..150c664
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_10.5.4.bb
@@ -0,0 +1,14 @@
+require ${BPN}.inc
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "26644437b6447fb3dbae50714a019797"
+SRC_URI[sha256sum] = "b51e723f3a20d842c88a92d809435b229fc4744ca0dbec0317d9d4a3ac4c6803"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index a6d2880..0260617 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -2,13 +2,17 @@ require ${BPN}.inc
 
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "62eb27ac8bbd979796f50e253f6c786d7d791242"
-PV = "10.4.4+git${SRCPV}"
+SRCREV = "ea0d1f575c214c09ba3df12644a960e86e031766"
+PV = "10.5.4+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.4"
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.5"
 
 S = "${WORKDIR}/git"
 
+DEPENDS += "python-mako-native"
+
+inherit pythonnative
+
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
-- 
2.1.4


