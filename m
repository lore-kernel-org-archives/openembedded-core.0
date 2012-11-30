Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeEGS-0007iy-Ow
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 01:15:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2012 16:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,188,1355126400"; d="scan'208";a="224515796"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2012 16:00:46 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 16:00:40 -0800
Message-Id: <1354233643-3385-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
References: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/4] cmake: Update to 2.8.10.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 00:15:33 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cmake/cmake-native_2.8.10.1.bb                 |  4 ++
 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb  |  8 ----
 meta/recipes-devtools/cmake/cmake.inc              |  3 ++
 .../cmake/cmake/dont-run-cross-binaries.patch      | 19 ++++-----
 .../cmake/cmake/support-oe-qt4-tools-names.patch   | 46 +++++++++++-----------
 .../cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb}    |  3 --
 6 files changed, 40 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
new file mode 100644
index 0000000..ca81810
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
@@ -0,0 +1,4 @@
+require cmake.inc
+inherit native
+
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
deleted file mode 100644
index 03d57d1..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require cmake.inc
-inherit native
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
-SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
-
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 6dc319c..97059aa 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -16,6 +16,9 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch"
 
+SRC_URI[md5sum] = "aabf16d8e957f99921a0095885381373"
+SRC_URI[sha256sum] = "dbfb9d609e8fdb6f0947993246c11e2ee5d47944d6e7bd9314463b31e420e6e0"
+
 inherit autotools
 
 do_configure () {
diff --git a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
index 4eb1794..0c059f1 100644
--- a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
+++ b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
@@ -7,16 +7,17 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 
-diff -ru cmake-2.8.2.orig/CMakeLists.txt cmake-2.8.2/CMakeLists.txt
---- cmake-2.8.2.orig/CMakeLists.txt	2010-07-28 00:48:42.000000000 +0200
-+++ cmake-2.8.2/CMakeLists.txt	2010-07-28 01:05:17.000000000 +0200
-@@ -518,7 +518,8 @@
+Index: cmake-2.8.10.1/CMakeLists.txt
+===================================================================
+--- cmake-2.8.10.1.orig/CMakeLists.txt
++++ cmake-2.8.10.1/CMakeLists.txt
+@@ -588,7 +588,8 @@ mark_as_advanced(CMAKE_STRICT)
  
  # build the remaining subdirectories
- ADD_SUBDIRECTORY(Source)
--ADD_SUBDIRECTORY(Utilities)
+ add_subdirectory(Source)
+-add_subdirectory(Utilities)
 +# Come on! Running the cross-binaries on host is not a good idea.
-+#ADD_SUBDIRECTORY(Utilities)
- ADD_SUBDIRECTORY(Tests)
++#add_subdirectory(Utilities)
+ add_subdirectory(Tests)
  
- # add a test
+ if(BUILD_TESTING)
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
index 147c249..258971b 100644
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -11,88 +11,88 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 
-Index: cmake-2.8.5-rc3/Modules/FindQt4.cmake
+Index: cmake-2.8.10.1/Modules/FindQt4.cmake
 ===================================================================
---- cmake-2.8.5-rc3.orig/Modules/FindQt4.cmake	2011-06-27 14:41:05.000000000 +0000
-+++ cmake-2.8.5-rc3/Modules/FindQt4.cmake	2011-07-08 15:31:58.057170949 +0000
-@@ -473,7 +473,7 @@
+--- cmake-2.8.10.1.orig/Modules/FindQt4.cmake
++++ cmake-2.8.10.1/Modules/FindQt4.cmake
+@@ -497,7 +497,7 @@ get_filename_component(qt_install_versio
  # check for qmake
  # Debian uses qmake-qt4
  # macports' Qt uses qmake-mac
--FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 qmake-mac PATHS
-+FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac PATHS
-   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Qt3Versions\\4.0.0;InstallDir]/bin"
-   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\4.0.0;InstallDir]/bin"
-   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\${qt_install_version};InstallDir]/bin"
-@@ -944,13 +944,13 @@
-   ENDIF(QT_QMAKE_CHANGED)
-   
-   FIND_PROGRAM(QT_MOC_EXECUTABLE
+-find_program(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 qmake-mac
++find_program(QT_QMAKE_EXECUTABLE NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac
+   PATHS
+     ENV QTDIR
+     "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\${qt_install_version};InstallDir]"
+@@ -982,13 +982,13 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
+   endif()
+ 
+   find_program(QT_MOC_EXECUTABLE
 -    NAMES moc-qt4 moc
 +    NAMES moc-qt4 moc4 moc
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_UIC_EXECUTABLE
+   find_program(QT_UIC_EXECUTABLE
 -    NAMES uic-qt4 uic
 +    NAMES uic-qt4 uic4 uic
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
-@@ -962,49 +962,49 @@
+@@ -1000,49 +1000,49 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
      )
  
-   FIND_PROGRAM(QT_RCC_EXECUTABLE 
+   find_program(QT_RCC_EXECUTABLE
 -    NAMES rcc
 +    NAMES rcc4 rcc
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_DBUSCPP2XML_EXECUTABLE 
+   find_program(QT_DBUSCPP2XML_EXECUTABLE
 -    NAMES qdbuscpp2xml
 +    NAMES qdbuscpp2xml4 qdbuscpp2xml
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_DBUSXML2CPP_EXECUTABLE 
+   find_program(QT_DBUSXML2CPP_EXECUTABLE
 -    NAMES qdbusxml2cpp
 +    NAMES qdbusxml2cpp4 qdbusxml2cpp
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_LUPDATE_EXECUTABLE
+   find_program(QT_LUPDATE_EXECUTABLE
 -    NAMES lupdate-qt4 lupdate
 +    NAMES lupdate-qt4 lupdate4 lupdate
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_LRELEASE_EXECUTABLE
+   find_program(QT_LRELEASE_EXECUTABLE
 -    NAMES lrelease-qt4 lrelease
 +    NAMES lrelease-qt4 lrelease4 lrelease
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_QCOLLECTIONGENERATOR_EXECUTABLE
+   find_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
 -    NAMES qcollectiongenerator-qt4 qcollectiongenerator
 +    NAMES qcollectiongenerator-qt4 qcollectiongenerator4 qcollectiongenerator
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_DESIGNER_EXECUTABLE
+   find_program(QT_DESIGNER_EXECUTABLE
 -    NAMES designer-qt4 designer
 +    NAMES designer-qt4 designer4 designer
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_LINGUIST_EXECUTABLE
+   find_program(QT_LINGUIST_EXECUTABLE
 -    NAMES linguist-qt4 linguist
 +    NAMES linguist-qt4 linguist4 linguist
      PATHS ${QT_BINARY_DIR}
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.8.bb b/meta/recipes-devtools/cmake/cmake_2.8.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/cmake/cmake_2.8.8.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.10.1.bb
index 8665dc3..9e1b802 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.8.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.10.1.bb
@@ -8,9 +8,6 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
-SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
-
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
     prefix=d.getVar("prefix", True)
-- 
1.8.0



