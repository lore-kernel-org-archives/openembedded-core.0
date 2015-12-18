Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB81731C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:43:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2015 07:43:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710464821"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 07:43:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:40:58 +0200
Message-Id: <0c46525078a04b5d04abf9dc94c7434fce4b7e20.1450453089.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/6] webkitgtk: update to 2.10.4
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
X-List-Received-Date: Fri, 18 Dec 2015 15:43:43 -0000

Drop backported patches (which means, all the patches).

Replace a few hardcoded dependencies with PACKAGECONFIG entries.
Add a PACKAGECONFIG entry for libhyphen.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...fixes-a-command-line-that-is-too-long-ove.patch | 91 ----------------------
 ...ailure-with-ACCELERATED_2D_CANVAS-when-ca.patch | 35 ---------
 meta/recipes-sato/webkit/webkitgtk/gcc5.patch      | 26 -------
 .../{webkitgtk_2.8.5.bb => webkitgtk_2.10.4.bb}    | 20 ++---
 4 files changed, 11 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
 delete mode 100644 meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc5.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.8.5.bb => webkitgtk_2.10.4.bb} (83%)

diff --git a/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch b/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
deleted file mode 100644
index 28b3420..0000000
--- a/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 22d5063c551d3c08c0a4ad8b80e08b793d53093d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 10 Sep 2015 16:23:27 +0300
-Subject: [PATCH] This patch fixes a command line that is too long (over 100K!)
- and is rejected by /bin/sh.
-
-Upstream-Status: Backport [should appear in 2.10, http://trac.webkit.org/changeset/184856]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Source/WebKit2/PlatformGTK.cmake                   | 11 ++++++-----
- Tools/gtk/generate-inspector-gresource-manifest.py | 16 ++++++++++++----
- 2 files changed, 18 insertions(+), 9 deletions(-)
-
-diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
-index a13af7c..058c241 100644
---- a/Source/WebKit2/PlatformGTK.cmake
-+++ b/Source/WebKit2/PlatformGTK.cmake
-@@ -408,7 +408,7 @@ set(WebKit2WebExtension_INSTALLED_HEADERS
-     ${WEBKIT2_DIR}/WebProcess/InjectedBundle/API/gtk/webkit-web-extension.h
- )
- 
--file(GLOB InspectorFiles
-+set(InspectorFiles
-     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/*.html
-     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Base/*.js
-     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Controllers/*.css
-@@ -423,13 +423,14 @@ file(GLOB InspectorFiles
-     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Views/*.js
-     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Images/gtk/*.png
-     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Images/gtk/*.svg
--)
--
--list(APPEND InspectorFiles
-     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/Localizations/en.lproj/localizedStrings.js
-     ${DERIVED_SOURCES_WEBINSPECTORUI_DIR}/UserInterface/Protocol/InspectorBackendCommands.js
- )
- 
-+file(GLOB InspectorFilesDependencies
-+    ${InspectorFiles}
-+)
-+
- # This is necessary because of a conflict between the GTK+ API WebKitVersion.h and one generated by WebCore.
- list(INSERT WebKit2_INCLUDE_DIRECTORIES 0
-     "${FORWARDING_HEADERS_WEBKIT2GTK_DIR}"
-@@ -564,7 +565,7 @@ add_custom_command(
- 
- add_custom_command(
-     OUTPUT ${DERIVED_SOURCES_WEBKIT2GTK_DIR}/InspectorGResourceBundle.xml
--    DEPENDS ${InspectorFiles}
-+    DEPENDS ${InspectorFilesDependencies}
-             ${TOOLS_DIR}/gtk/generate-inspector-gresource-manifest.py
-     COMMAND ${TOOLS_DIR}/gtk/generate-inspector-gresource-manifest.py --output=${DERIVED_SOURCES_WEBKIT2GTK_DIR}/InspectorGResourceBundle.xml ${InspectorFiles}
-     VERBATIM
-diff --git a/Tools/gtk/generate-inspector-gresource-manifest.py b/Tools/gtk/generate-inspector-gresource-manifest.py
-index 0687c4c..03060cf 100755
---- a/Tools/gtk/generate-inspector-gresource-manifest.py
-+++ b/Tools/gtk/generate-inspector-gresource-manifest.py
-@@ -16,6 +16,7 @@
- # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
- 
- import argparse
-+import glob
- import os
- import sys
- 
-@@ -26,10 +27,17 @@ BASE_DIR = 'WebInspectorUI/'
- def get_filenames(args):
-     filenames = []
- 
--    for filename in args:
--        base_dir_index = filename.rfind(BASE_DIR)
--        if base_dir_index != -1:
--            filenames.append(filename[base_dir_index + len(BASE_DIR):])
-+    for pattern in args:
-+        paths = glob.glob(pattern)
-+        for filename in paths:
-+            base_dir_index = filename.rfind(BASE_DIR)
-+            if base_dir_index != -1:
-+                name = filename[base_dir_index + len(BASE_DIR):]
-+                # The result should use forward slashes, thus make sure any os-specific
-+                # separator, added by the glob.glob() call, is properly replaced
-+                if os.sep != '/':
-+                    name = name.replace(os.sep, '/')
-+                filenames.append(name)
-     return filenames
- 
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch b/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
deleted file mode 100644
index e95c0e4..0000000
--- a/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6ea42d4fa6f3f6dd18c37cb7b6e1faea6afefba4 Mon Sep 17 00:00:00 2001
-From: "clopez@igalia.com" <clopez@igalia.com>
-Date: Tue, 15 Sep 2015 21:50:18 +0000
-Subject: [PATCH] [GTK] Build failure with ACCELERATED_2D_CANVAS when cairo-gl has
- built with OpenGLESv2 support only.
-
-When cairo-gl is built with GLX and ACCELERATED_2D_CANVAS if cairo-gl was only
-built with OpenGLESv2, cairo-glx is not enabled causing
-Source/WebCore/platform/graphics/glx/GLContextGLX.cpp to reference an undeclared
-function and cause a compliation error. Adding an extra check resolves this
-build failure.
-
-Upstream-Status: Backport [webkit-2.10.0]
-
-Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
----
- Source/WebCore/platform/graphics/glx/GLContextGLX.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
-index 7890d8d..4ed3a43 100644
---- a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
-+++ b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
-@@ -266,7 +266,7 @@ cairo_device_t* GLContextGLX::cairoDevice()
-     if (m_cairoDevice)
-         return m_cairoDevice;
- 
--#if ENABLE(ACCELERATED_2D_CANVAS)
-+#if ENABLE(ACCELERATED_2D_CANVAS) && CAIRO_HAS_GLX_FUNCTIONS
-     m_cairoDevice = cairo_glx_device_create(sharedX11Display(), m_context);
- #endif
- 
--- 
-2.6.2
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/gcc5.patch b/meta/recipes-sato/webkit/webkitgtk/gcc5.patch
deleted file mode 100644
index 5951a81..0000000
--- a/meta/recipes-sato/webkit/webkitgtk/gcc5.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-JSObject: Create explicit instantiation of putByIndexBeyondVectorLengthWithoutAttributes
-
-Reason for change: newer gcc might optimize away the templates
-and they wont be available for other .cpp files to use as these
-are used in a different .cpp we need to tell compiler to explicitly
-instantiate them.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: webkitgtk-2.8.5/Source/JavaScriptCore/runtime/JSObject.cpp
-===================================================================
---- webkitgtk-2.8.5.orig/Source/JavaScriptCore/runtime/JSObject.cpp
-+++ webkitgtk-2.8.5/Source/JavaScriptCore/runtime/JSObject.cpp
-@@ -1965,6 +1965,10 @@ void JSObject::putByIndexBeyondVectorLen
-     }
- }
- 
-+template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<Int32Shape>(ExecState* exec, unsigned i, JSValue value);
-+template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<DoubleShape>(ExecState* exec, unsigned i, JSValue value);
-+template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<ContiguousShape>(ExecState* exec, unsigned i, JSValue value);
-+
- void JSObject::putByIndexBeyondVectorLengthWithArrayStorage(ExecState* exec, unsigned i, JSValue value, bool shouldThrow, ArrayStorage* storage)
- {
-     VM& vm = exec->vm();
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
similarity index 83%
rename from meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
index aa5e6c9..4d5aeb4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
@@ -12,27 +12,28 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
-  file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch \
-  file://0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch \
-  file://gcc5.patch \
   "
-SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
-SRC_URI[sha256sum] = "3d1f0c534935f43fd74df90f2648fcee672d60f1f57a30fa557a77891ae04d20"
+SRC_URI[md5sum] = "fb010031c6f61c3a1a00793b112badb5"
+SRC_URI[sha256sum] = "dbf8260da5cac0c74de2d3cce1fe7c519da3cd816a2c769cb6c6d56addd2f055"
 
 inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even
 
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
 
-DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
-           gtk+ gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
+DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
+           gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gnome-common gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
-	   ruby-native libsecret libnotify gstreamer1.0-plugins-bad \
+	   ruby-native libnotify gstreamer1.0-plugins-bad \
           "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'opengl', 'webgl', '' ,d)}"
+                   ${@base_contains('DISTRO_FEATURES', 'opengl', 'webgl', '' ,d)} \
+                   enchant \
+                   gtk2 \
+                   libsecret \
+                  "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
@@ -42,6 +43,7 @@ PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_G
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
 PACKAGECONFIG[libsecret] = "-DENABLE_CREDENTIAL_STORAGE=ON,-DENABLE_CREDENTIAL_STORAGE=OFF,libsecret"
+PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
-- 
2.6.2


