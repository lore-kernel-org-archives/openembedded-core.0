Return-Path: <moritz.blume@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id E9BE473905
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:50:56 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:50182
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Moritz.Blume@bmw-carit.de>)
	id 1Z7QTP-0005Ke-1f for openembedded-core@lists.openembedded.org;
	Tue, 23 Jun 2015 17:50:55 +0200
Received: from localhost (192.168.101.32) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Tue, 23 Jun 2015 17:50:54 +0200
X-CTCH-RefID: str=0001.0A0C0205.5589805F.017E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Moritz Blume <moritz.blume@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 17:50:51 +0200
Message-ID: <f75cbf2497950870071faf02a2385f7f3eb8c8b3.1435073627.git.moritz.blume@bmw-carit.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435073627.git.moritz.blume@bmw-carit.de>
References: <cover.1435073627.git.moritz.blume@bmw-carit.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.101.32]
Subject: [PATCH v5 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Tue, 23 Jun 2015 15:50:57 -0000
Content-Type: text/plain

Patches "qt4-fail-silent.patch" and "support-oe-qt4-tools-names.patch"
were adapted in order to fit to CMake 3.2.2 (refer to the commit
message in the respective patch for details).
Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it was
rejected upstream and its functionality otherwise implemented in the
meantime.

Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
---
 .../cmake/cmake-native_2.8.12.2.bb                 | 19 ------
 meta/recipes-devtools/cmake/cmake-native_3.2.2.bb  | 19 ++++++
 meta/recipes-devtools/cmake/cmake.inc              | 12 ++--
 .../cmake/cmake/cmake-2.8.11.2-FindFreetype.patch  | 47 ---------------
 .../cmake/cmake/qt4-fail-silent.patch              | 30 ++++++++--
 .../cmake/cmake/support-oe-qt4-tools-names.patch   | 70 ++++++++++------------
 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb      | 52 ----------------
 meta/recipes-devtools/cmake/cmake_3.2.2.bb         | 56 +++++++++++++++++
 8 files changed, 139 insertions(+), 166 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake_3.2.2.bb

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
deleted file mode 100644
index e40dfdd..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require cmake.inc
-inherit native
-
-# Using cmake's internal libarchive, so some dependencies are needed
-DEPENDS += "bzip2-native zlib-native"
-
-SRC_URI += "\
-    file://cmlibarchive-disable-ext2fs.patch \
-"
-
-SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
-SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
-
-# Disable ccmake since we don't depend on ncurses
-CMAKE_EXTRACONF = "\
-    -DBUILD_CursesDialog=0 \
-    -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
-    -DHAVE_SYS_ACL_H=0 \
-"
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
new file mode 100644
index 0000000..17e9e2c
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
@@ -0,0 +1,19 @@
+require cmake.inc
+inherit native
+
+# Using cmake's internal libarchive, so some dependencies are needed
+DEPENDS += "bzip2-native zlib-native"
+
+SRC_URI += "\
+    file://cmlibarchive-disable-ext2fs.patch \
+"
+
+SRC_URI[md5sum] = "2da57308071ea98b10253a87d2419281"
+SRC_URI[sha256sum] = "ade94e6e36038774565f2aed8866415443444fb7a362eb0ea5096e40d5407c78"
+
+# Disable ccmake since we don't depend on ncurses
+CMAKE_EXTRACONF = "\
+    -DBUILD_CursesDialog=0 \
+    -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
+    -DHAVE_SYS_ACL_H=0 \
+"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 28b7f2d..d1cb7ab 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=bb2fa3a08736b842556f6171bb9e8ae1 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=3ba5a6c34481652ce573e5c4e1d707e4 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
@@ -14,11 +14,8 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
-           file://cmake-2.8.11.2-FindFreetype.patch \
            "
 
-PR = "r1"
-
 inherit autotools
 
 # Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
@@ -36,11 +33,12 @@ inherit autotools
 
 do_configure_prepend() {
 	sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
-	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
-	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
+	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
 	sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
 	sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
+	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutoUicInterface/CMakeLists.txt
+	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutogen/CMakeLists.txt
+	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/autorcc_depends/CMakeLists.txt
 }
 
 # Extra flags to pass to cmake invoked by bootstrap
diff --git a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
deleted file mode 100644
index 1b523c0..0000000
--- a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From: Julian Ospald <hasufell@gentoo.org>
-Date: Sun Dec  8 13:38:06 UTC 2013
-Subject: fix check for freetype-2.5.1
-
-Upstream-Status: Submitted http://www.cmake.org/Bug/view.php?id=14601
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- old/Modules/FindFreetype.cmake
-+++ new/Modules/FindFreetype.cmake
-@@ -64,6 +64,19 @@
-   PATH_SUFFIXES include/freetype2 include
- )
- 
-+if(NOT FREETYPE_INCLUDE_DIR_freetype2)
-+  find_path(FREETYPE_INCLUDE_DIR_freetype2 config/ftheader.h
-+    HINTS
-+      ENV FREETYPE_DIR
-+    PATHS
-+      /usr/X11R6
-+      /usr/local/X11R6
-+      /usr/local/X11
-+      /usr/freeware
-+    PATH_SUFFIXES include/freetype2 include
-+  )
-+endif()
-+
- find_library(FREETYPE_LIBRARY
-   NAMES freetype libfreetype freetype219
-   HINTS
-@@ -82,8 +95,14 @@
- endif()
- set(FREETYPE_LIBRARIES "${FREETYPE_LIBRARY}")
- 
--if(FREETYPE_INCLUDE_DIR_freetype2 AND EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
--    file(STRINGS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h" freetype_version_str
-+if(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
-+  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
-+elseif(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
-+  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
-+endif()
-+
-+if(FREETYPE_INCLUDE_DIR_freetype2 AND FREETYPE_H)
-+    file(STRINGS "${FREETYPE_H}" freetype_version_str
-          REGEX "^#[\t ]*define[\t ]+FREETYPE_(MAJOR|MINOR|PATCH)[\t ]+[0-9]+$")
- 
-     unset(FREETYPE_VERSION_STRING)
diff --git a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
index fd39f3f..80fc277 100644
--- a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
+++ b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
@@ -13,10 +13,21 @@ Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
---- cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:20:42.092848274 +0100
-+++ cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:52:15.693380555 +0100
-@@ -1025,21 +1025,22 @@
-     set(_configs)
+The patch was slightly adapted in order to match cmake 3.2.2:
+Another set_property was introduced which had to be included
+within the if(QT_QTCORE_FOUND) statement.
+
+Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
+---
+ Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------
+ 1 file changed, 20 insertions(+), 19 deletions(-)
+
+diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
+index 6704769..9048e35 100644
+--- a/Modules/FindQt4.cmake
++++ b/Modules/FindQt4.cmake
+@@ -1000,25 +1000,26 @@ if (QT_QMAKE_EXECUTABLE AND
+     endif()
    endmacro()
  
 -
@@ -28,6 +39,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 -      "${QT_MKSPECS_DIR}/default"
 -      ${QT_INCLUDE_DIR}
 -  )
+-  set_property(TARGET Qt4::QtCore APPEND PROPERTY
+-    INTERFACE_COMPILE_DEFINITIONS
+-      $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
+-  )
 -  set_property(TARGET Qt4::QtCore PROPERTY
 -    INTERFACE_QT_MAJOR_VERSION 4
 -  )
@@ -43,6 +58,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 +        "${QT_MKSPECS_DIR}/default"
 +        ${QT_INCLUDE_DIR}
 +    )
++    set_property(TARGET Qt4::QtCore APPEND PROPERTY
++      INTERFACE_COMPILE_DEFINITIONS
++        $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
++    )
 +    set_property(TARGET Qt4::QtCore PROPERTY
 +      INTERFACE_QT_MAJOR_VERSION 4
 +    )
@@ -53,3 +72,6 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  
    foreach(QT_MODULE ${QT_MODULES})
      _QT4_ADJUST_LIB_VARS(${QT_MODULE})
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
index 0e311f7..15cbca8 100644
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -11,11 +11,19 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 
-Index: cmake-2.8.11/Modules/FindQt4.cmake
-===================================================================
---- cmake-2.8.11.orig/Modules/FindQt4.cmake
-+++ cmake-2.8.11/Modules/FindQt4.cmake
-@@ -569,7 +569,7 @@ endfunction()
+The patch was slightly adapted in order to match cmake 3.2.2:
+Instead of find_program, _find_qt4_program is now used.
+
+Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
+---
+ Modules/FindQt4.cmake | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
+index 11091b5..6704769 100644
+--- a/Modules/FindQt4.cmake
++++ b/Modules/FindQt4.cmake
+@@ -522,7 +522,7 @@ endfunction()
  
  set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
  
@@ -23,36 +31,24 @@ Index: cmake-2.8.11/Modules/FindQt4.cmake
 +set(_QT4_QMAKE_NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac)
  _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
  
- if (QT_QMAKE_EXECUTABLE AND QTVERSION)
-@@ -1157,19 +1157,19 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
-     )
- 
-   find_program(QT_RCC_EXECUTABLE
--    NAMES rcc
-+    NAMES rcc4 rcc
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
+ if (QT_QMAKE_EXECUTABLE AND
+@@ -1148,12 +1148,12 @@ if (QT_QMAKE_EXECUTABLE AND
+   _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
+   _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
+   _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
+-  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc)
+-  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbuscpp2xml)
+-  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbusxml2cpp)
++  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc4 rcc)
++  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbuscpp2xml4 qdbuscpp2xml)
++  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbusxml2cpp4 qdbusxml2cpp)
+   _find_qt4_program(QT_LUPDATE_EXECUTABLE Qt4::lupdate lupdate-qt4 lupdate4 lupdate)
+   _find_qt4_program(QT_LRELEASE_EXECUTABLE Qt4::lrelease lrelease-qt4 lrelease4 lrelease)
+-  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollectiongenerator qcollectiongenerator-qt4 qcollectiongenerator)
++  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollectiongenerator qcollectiongenerator-qt4 qcollectiongenerator qcollectiongenerator4)
+   _find_qt4_program(QT_DESIGNER_EXECUTABLE Qt4::designer designer-qt4 designer4 designer)
+   _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4 linguist4 linguist)
  
-   find_program(QT_DBUSCPP2XML_EXECUTABLE
--    NAMES qdbuscpp2xml
-+    NAMES qdbuscpp2xml4 qdbuscpp2xml
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
- 
-   find_program(QT_DBUSXML2CPP_EXECUTABLE
--    NAMES qdbusxml2cpp
-+    NAMES qdbusxml2cp4 qdbusxml2cpp
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
-@@ -1187,7 +1187,7 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
-     )
- 
-   find_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
--    NAMES qcollectiongenerator-qt4 qcollectiongenerator
-+    NAMES qcollectiongenerator-qt4 qcollectiongenerator qcollectiongenerator4
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
deleted file mode 100644
index 66a6af6..0000000
--- a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-require cmake.inc
-
-inherit cmake
-
-DEPENDS += "curl expat zlib libarchive"
-
-SRC_URI += "file://dont-run-cross-binaries.patch"
-
-SRC_URI_append_class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://environment.d-cmake.sh"
-
-SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
-SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
-
-# Strip ${prefix} from ${docdir}, set result into docdir_stripped
-python () {
-    prefix=d.getVar("prefix", True)
-    docdir=d.getVar("docdir", True)
-
-    if not docdir.startswith(prefix):
-        raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
-
-    docdir_stripped = docdir[len(prefix):]
-    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
-        docdir_stripped = docdir_stripped[1:]
-
-    d.setVar("docdir_stripped", docdir_stripped)
-}
-
-EXTRA_OECMAKE=" \
-    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
-    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
-    -DKWSYS_CHAR_IS_SIGNED=1 \
-    -DBUILD_CursesDialog=0 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
-"
-
-do_install_append_class-nativesdk() {
-    mkdir -p ${D}${datadir}/cmake
-    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
-
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-    install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
-}
-
-FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}"
-
-FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
-FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/cmake/cmake_3.2.2.bb b/meta/recipes-devtools/cmake/cmake_3.2.2.bb
new file mode 100644
index 0000000..4765f6c
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake_3.2.2.bb
@@ -0,0 +1,56 @@
+require cmake.inc
+
+inherit cmake
+
+DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
+
+SRC_URI_append_class-nativesdk = " \
+    file://OEToolchainConfig.cmake \
+    file://environment.d-cmake.sh"
+
+SRC_URI[md5sum] = "2da57308071ea98b10253a87d2419281"
+SRC_URI[sha256sum] = "ade94e6e36038774565f2aed8866415443444fb7a362eb0ea5096e40d5407c78"
+
+# Strip ${prefix} from ${docdir}, set result into docdir_stripped
+python () {
+    prefix=d.getVar("prefix", True)
+    docdir=d.getVar("docdir", True)
+
+    if not docdir.startswith(prefix):
+        raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+
+    docdir_stripped = docdir[len(prefix):]
+    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
+        docdir_stripped = docdir_stripped[1:]
+
+    d.setVar("docdir_stripped", docdir_stripped)
+}
+
+EXTRA_OECMAKE=" \
+    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
+    -DCMAKE_USE_SYSTEM_LIBRARY_BZIP2=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_CURL=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_FORM=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_LIBLZMA=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_ZLIB=1 \
+    -DKWSYS_CHAR_IS_SIGNED=1 \
+    -DBUILD_CursesDialog=0 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
+"
+
+do_install_append_class-nativesdk() {
+    mkdir -p ${D}${datadir}/cmake
+    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
+
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
+}
+
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}"
+
+FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
+FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.9.1


