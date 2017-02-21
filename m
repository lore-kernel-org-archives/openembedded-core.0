Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 41F7E72F1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875683"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:30 +0200
Message-Id: <6aea951bd8db05c2ae3a2a567fb4f12c28d4e00a.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 13/39] libdnf: add a recipe
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:52 -0000

libdnf is required by dnf.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...cmake-drop-the-requirement-for-GTKDOC_SCA.patch | 31 +++++++++++++++++++
 ...ers-for-both-libsolv-and-libsolvext-libdn.patch | 28 +++++++++++++++++
 ...-sysroot-path-to-introspection-tools-path.patch | 36 ++++++++++++++++++++++
 ...-library-installation-directory-correctly.patch | 29 +++++++++++++++++
 ...-variables-with-pkg-config-cmake-s-own-mo.patch | 29 +++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_git.bb         | 36 ++++++++++++++++++++++
 6 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf_git.bb

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
new file mode 100644
index 00000000000..73acda6af8a
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -0,0 +1,31 @@
+From 9bb7630915c3e787732463a3e2064fe0e177101b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 24 Nov 2016 14:33:07 +0200
+Subject: [PATCH 1/4] FindGtkDoc.cmake: drop the requirement for
+ GTKDOC_SCANGOBJ_WRAPPER
+
+For some reason cmake is not able to find it when building in openembedded,
+and it's bundled with the source code anyway.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ cmake/modules/FindGtkDoc.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/modules/FindGtkDoc.cmake b/cmake/modules/FindGtkDoc.cmake
+index 92b2cc7..39f34bd 100644
+--- a/cmake/modules/FindGtkDoc.cmake
++++ b/cmake/modules/FindGtkDoc.cmake
+@@ -52,7 +52,7 @@ find_program(GTKDOC_MKHTML_EXE gtkdoc-mkhtml PATH "${GLIB_PREFIX}/bin")
+ find_program(GTKDOC_FIXXREF_EXE gtkdoc-fixxref PATH "${GLIB_PREFIX}/bin")
+ 
+ find_package_handle_standard_args(GtkDoc
+-    REQUIRED_VARS GTKDOC_SCAN_EXE GTKDOC_SCANGOBJ_EXE GTKDOC_SCANGOBJ_WRAPPER GTKDOC_MKDB_EXE GTKDOC_MKHTML_EXE GTKDOC_FIXXREF_EXE
++    REQUIRED_VARS GTKDOC_SCAN_EXE GTKDOC_SCANGOBJ_EXE GTKDOC_MKDB_EXE GTKDOC_MKHTML_EXE GTKDOC_FIXXREF_EXE
+     VERSION_VAR GtkDoc_VERSION)
+ 
+ # ::
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
new file mode 100644
index 00000000000..954add6e738
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -0,0 +1,28 @@
+From 5958b151a4dbb89114e90c971a34b74f873b7beb Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 7 Feb 2017 12:16:03 +0200
+Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
+ using both)
+
+Upstream-Status: Pending [depends on whether https://github.com/openSUSE/libsolv/pull/177 is accepted]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b531da1..e512da0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -28,7 +28,7 @@ find_package (PkgConfig REQUIRED)
+ SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
+ PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.44.0 REQUIRED)
+ FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
+-PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
++PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
+ set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
+ pkg_check_modules (CHECK REQUIRED check)
+ pkg_check_modules (REPO REQUIRED librepo)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch b/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
new file mode 100644
index 00000000000..3d772a5f8a3
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
@@ -0,0 +1,36 @@
+From c8211ad99ccaa4af4a75e0ba639527267fcfd69e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:17:19 +0200
+Subject: [PATCH 2/4] Prefix sysroot path to introspection tools path.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libdnf/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libdnf/CMakeLists.txt b/libdnf/CMakeLists.txt
+index 63f07bf..837792b 100644
+--- a/libdnf/CMakeLists.txt
++++ b/libdnf/CMakeLists.txt
+@@ -133,7 +133,7 @@ if (GOBJECT_INTROSPECTION_FOUND)
+         set(GIR_TYPELIB "${GIR_PREFIX}.typelib")
+ 
+         add_custom_command(OUTPUT ${GIR_XML}
+-            COMMAND env CFLAGS=${CMAKE_C_FLAGS} ${GOBJECT_INTROSPECTION_1.0_G_IR_SCANNER}
++            COMMAND env CFLAGS=${CMAKE_C_FLAGS} $ENV{PKG_CONFIG_SYSROOT_DIR}${GOBJECT_INTROSPECTION_1.0_G_IR_SCANNER}
+                     --namespace=Dnf
+                     --nsversion=${DNF_SO_VERSION}.0
+                     --library-path=${CMAKE_CURRENT_BINARY_DIR}
+@@ -153,7 +153,7 @@ if (GOBJECT_INTROSPECTION_FOUND)
+             WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
+ 
+         add_custom_command(OUTPUT ${GIR_TYPELIB}
+-            COMMAND ${GOBJECT_INTROSPECTION_1.0_G_IR_COMPILER}
++            COMMAND $ENV{PKG_CONFIG_SYSROOT_DIR}${GOBJECT_INTROSPECTION_1.0_G_IR_COMPILER}
+                     -o ${GIR_TYPELIB}
+                     ${GIR_XML}
+             DEPENDS ${GIR_XML}
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch b/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
new file mode 100644
index 00000000000..d7e59d8333a
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
@@ -0,0 +1,29 @@
+From 8d29879fe3606c78769c1bcdddf0bcfc7191c710 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:20:01 +0200
+Subject: [PATCH 3/4] Set the library installation directory correctly.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d35f0d7..8edb627 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -62,7 +62,9 @@ ADD_DEFINITIONS(-DPACKAGE_VERSION=\\"${LIBDNF_VERSION}\\")
+ IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+   SET (LIB_SUFFIX "64")
+ ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+-SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
++#SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
++SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
++
+ 
+ ADD_SUBDIRECTORY (libdnf)
+ ENABLE_TESTING()
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
new file mode 100644
index 00000000000..931959b5f38
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -0,0 +1,29 @@
+From 6d2718b925453f9a6915001f489606eb8e4086c8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:24:50 +0200
+Subject: [PATCH 4/4] Set libsolv variables with pkg-config (cmake's own module
+ doesn't work properly).
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8edb627..b531da1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -28,7 +28,8 @@ find_package (PkgConfig REQUIRED)
+ SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
+ PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.44.0 REQUIRED)
+ FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
+-find_package (LibSolv 0.6.21 REQUIRED COMPONENTS ext)
++PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
++set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
+ pkg_check_modules (CHECK REQUIRED check)
+ pkg_check_modules (REPO REQUIRED librepo)
+ FIND_PROGRAM (VALGRIND_PROGRAM NAMES valgrind PATH /usr/bin /usr/local/bin)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_git.bb b/meta/recipes-devtools/libdnf/libdnf_git.bb
new file mode 100644
index 00000000000..6875401301e
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Library providing simplified C and Python API to libsolv"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://github.com/rpm-software-management/libdnf \
+           file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
+           file://0002-Prefix-sysroot-path-to-introspection-tools-path.patch \
+           file://0003-Set-the-library-installation-directory-correctly.patch \
+           file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
+           file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
+           "
+
+PV = "0.2.3+git${SRCPV}"
+SRCREV = "367545629cc01a8e622890d89bd13d062ce60d7b"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc"
+
+inherit gtk-doc gobject-introspection cmake pkgconfig
+
+# We cannot inherit pythonnative (or descendant classes like distutils etc.) 
+# because that would conflict with inheriting python3native
+# (which is done by inheriting gobject-introspection). 
+# But libdnf only needs the path to native Python 2.x binary
+# so we simply set it explicitly here.
+#
+# These lines can be dropped when dnf stack is moved to python 3.x
+EXTRANATIVEPATH += "python-native"
+FILES_${PN} += " ${libdir}/python2.7/*"
+DEPENDS += "python-native"
+
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF"
+
+BBCLASSEXTEND = "native"
+
-- 
2.11.0


