Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DC8F977199
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917699"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:46 +0200
Message-Id: <8d2b670642b94f0d06b3152ca4daec3adc9f2b15.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/29] webkitgtk: enable gobject introspection
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:20 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Introspection.cmake-prefix-variables-obta.patch | 27 +++++++++++++++
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch | 40 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |  6 ++--
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
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
diff --git a/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
new file mode 100644
index 0000000..c4584c6
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -0,0 +1,40 @@
+From f42434706e2686b28ac7c2d0362665c51d26faad Mon Sep 17 00:00:00 2001
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
+index 058c241..37d7412 100644
+--- a/Source/WebKit2/PlatformGTK.cmake
++++ b/Source/WebKit2/PlatformGTK.cmake
+@@ -823,7 +823,7 @@ add_custom_command(
+     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
+     DEPENDS WebKit2
+     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+-    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
++    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
+         LD_LIBRARY_PATH="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+         ${INTROSPECTION_SCANNER}
+         --quiet
+@@ -863,7 +863,7 @@ add_custom_command(
+     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
+     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+     DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
+-    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
++    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
+         LD_LIBRARY_PATH="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+         ${INTROSPECTION_SCANNER}
+         --quiet
+-- 
+2.1.4
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index e29666a..f21dc4b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -14,11 +14,13 @@ SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
   file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch \
   file://gcc5.patch \
+  file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
+  file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
   "
 SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
 SRC_URI[sha256sum] = "3d1f0c534935f43fd74df90f2648fcee672d60f1f57a30fa557a77891ae04d20"
 
-inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check
+inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check gobject-introspection
 
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -45,7 +47,7 @@ PACKAGECONFIG[libsecret] = "-DENABLE_CREDENTIAL_STORAGE=ON,-DENABLE_CREDENTIAL_S
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		-DCMAKE_BUILD_TYPE=Release \
-		-DENABLE_INTROSPECTION=OFF \
+		-DENABLE_INTROSPECTION=ON \
 		-DENABLE_GTKDOC=OFF \
 		-DENABLE_MINIBROWSER=ON \
 		"
-- 
2.1.4


