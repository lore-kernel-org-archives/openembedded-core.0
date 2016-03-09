Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CA6556FF7F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2016 07:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083820"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:02:06 +0200
Message-Id: <56858e0fc0d0a366054737f45d55a7ae25317fbc.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/24] webkitgtk: enable gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Introspection.cmake-prefix-variables-obta.patch | 27 +++++++++++++++
 ...cmake-drop-the-hardcoded-introspection-gt.patch | 35 +++++++++++++++++++
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch | 40 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb       | 14 ++++++--
 4 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
 create mode 100644 meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
 create mode 100644 meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch

diff --git a/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
new file mode 100644
index 0000000..fae3b0b
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -0,0 +1,27 @@
+From 317a5ac120c44987219bc03486cd2f2d1842c9b9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Oct 2015 16:02:19 +0200
+Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
+ from pkg-config with PKG_CONFIG_SYSROOT_DIR
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/cmake/FindGObjectIntrospection.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/cmake/FindGObjectIntrospection.cmake b/Source/cmake/FindGObjectIntrospection.cmake
+index e1f49b4..03a4446 100644
+--- a/Source/cmake/FindGObjectIntrospection.cmake
++++ b/Source/cmake/FindGObjectIntrospection.cmake
+@@ -26,6 +26,7 @@ macro(_GIR_GET_PKGCONFIG_VAR _outvar _varname _extra_args)
+     else ()
+         string(REGEX REPLACE "[\r\n]" " " _result "${_result}")
+         string(REGEX REPLACE " +$" ""  _result "${_result}")
++        string(CONCAT _result $ENV{PKG_CONFIG_SYSROOT_DIR} "${_result}")
+         separate_arguments(_result)
+         set(${_outvar} ${_result} CACHE INTERNAL "")
+     endif ()
+-- 
+2.1.4
+
diff --git a/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
new file mode 100644
index 0000000..3d004db
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
@@ -0,0 +1,35 @@
+From 48648570e449cf7f84a26dc03c1e3f620fa69757 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 29 Feb 2016 18:13:39 +0200
+Subject: [PATCH] OptionsGTK.cmake: drop the hardcoded introspection/gtkdoc
+ disabling when cross-compiling
+
+This was not possible to override from the command line and in OpenEmbedded
+(one of the most prominent cross-compilation frameworks) introspection does work fine,
+through the use of qemu target emulation.
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/cmake/OptionsGTK.cmake | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
+index e5f1f5b..4698036 100644
+--- a/Source/cmake/OptionsGTK.cmake
++++ b/Source/cmake/OptionsGTK.cmake
+@@ -443,12 +443,6 @@ if (USE_LIBHYPHEN)
+     endif ()
+ endif ()
+ 
+-# Override the cached variables, gtk-doc and gobject-introspection do not really work when cross-building.
+-if (CMAKE_CROSSCOMPILING)
+-    set(ENABLE_GTKDOC OFF)
+-    set(ENABLE_INTROSPECTION OFF)
+-endif ()
+-
+ set(DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR ${DERIVED_SOURCES_DIR}/webkitdom)
+ set(DERIVED_SOURCES_WEBKITGTK_DIR ${DERIVED_SOURCES_DIR}/webkitgtk)
+ set(DERIVED_SOURCES_WEBKITGTK_API_DIR ${DERIVED_SOURCES_WEBKITGTK_DIR}/webkit)
+-- 
+2.7.0
+
diff --git a/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
new file mode 100644
index 0000000..44b43cd
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -0,0 +1,40 @@
+From bae9f73b2c693b5aa156fed717d6481b60682786 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 28 Oct 2015 14:18:57 +0200
+Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
+ compiler flags.
+
+g-ir-compiler is using a C compiler internally, so it needs to set
+the proper flags for it.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/WebKit2/PlatformGTK.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
+index 706f1e8..14a1c3b 100644
+--- a/Source/WebKit2/PlatformGTK.cmake
++++ b/Source/WebKit2/PlatformGTK.cmake
+@@ -884,7 +884,7 @@ add_custom_command(
+     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
+     DEPENDS WebKit2
+     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+-    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
++    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
+         LD_LIBRARY_PATH="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+         ${INTROSPECTION_SCANNER}
+         --quiet
+@@ -930,7 +930,7 @@ add_custom_command(
+     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
+     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+     DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
+-    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations
++    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
+         LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
+         LD_LIBRARY_PATH="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+         ${INTROSPECTION_SCANNER}
+-- 
+2.6.4
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index 8812967..849a33a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -15,11 +15,14 @@ SRC_URI = "\
   file://clang.patch \
   file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
   file://0001-Fix-build-with-non-glibc-libraries-on-linux.patch \
+  file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
+  file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
+  file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
   "
 SRC_URI[md5sum] = "84832b9d8329413b4f1d87df5f7e8efe"
 SRC_URI[sha256sum] = "990d62c82ed6dede31a6ff0a82d847f16b812842ff3e1093d17113627652864e"
 
-inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even
+inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even gobject-introspection
 
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -51,7 +54,7 @@ PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		-DCMAKE_BUILD_TYPE=Release \
-		-DENABLE_INTROSPECTION=OFF \
+		${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 		-DENABLE_GTKDOC=OFF \
 		-DENABLE_MINIBROWSER=ON \
 		"
@@ -76,3 +79,10 @@ FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbu
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET = "arm"
+
+# Invalid data memory access: 0x00000000
+# ...
+# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
+# Segmentation fault
+EXTRA_OECMAKE_append_powerpc = " -DENABLE_INTROSPECTION=OFF "
+
-- 
2.7.0


