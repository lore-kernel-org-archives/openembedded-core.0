Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 152F27F2BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:00:53 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x78F0sTl008447
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 17:00:54 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.15.45])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x78F0rHL009516;
	Thu, 8 Aug 2019 17:00:53 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 909D01083602;
	Thu,  8 Aug 2019 17:00:53 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 17:00:51 +0200
Message-Id: <20190808150051.13009-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake: 3.14.5 -> 3.15.2
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
X-List-Received-Date: Thu, 08 Aug 2019 15:00:54 -0000

The patches were refreshed with devtool.

I rebuilt all cmake recipes from poky and meta-oe without issue.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...ake-native_3.14.5.bb => cmake-native_3.15.2.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  4 +--
 ...ineSystem-use-oe-environment-vars-to-load.patch | 13 ++++-----
 .../0002-cmake-Prevent-the-detection-of-Qt5.patch  | 33 +++++++++++-----------
 ...upport-OpenEmbedded-Qt4-tool-binary-names.patch | 11 +++-----
 ...ently-if-system-Qt-installation-is-broken.patch | 11 +++-----
 .../cmake/{cmake_3.14.5.bb => cmake_3.15.2.bb}     |  0
 7 files changed, 31 insertions(+), 41 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.14.5.bb => cmake-native_3.15.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.14.5.bb => cmake_3.15.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.15.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.14.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.15.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index da3aadcc0a..4cbe26ed60 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "a8cbfc3510b95ea686b4059d8b1f765c"
-SRC_URI[sha256sum] = "505ae49ebe3c63c595fa5f814975d8b72848447ee13b6613b0f8b96ebda18c06"
+SRC_URI[md5sum] = "9ecf167edadb87e2d75cc89fded7aadb"
+SRC_URI[sha256sum] = "539088cb29a68e6d6a8fba5c00951e5e5b1a92c68fa38a83e1ed2f355933f768"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index cdeea647fe..3720833d3e 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,9 +1,8 @@
-From 71085723f8028b3e1c4029fc1abe1243ac49ffc6 Mon Sep 17 00:00:00 2001
+From 1e67c3fe52c6c51c00cf1ebb0bfc30c7a5ef9fdb Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
-Subject: [PATCH 1/5] CMakeDetermineSystem: use oe environment vars to load
- default toolchain file in sdk
-Organization: O.S. Systems Software LTDA.
+Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
+ toolchain file in sdk
 
 Passing the toolchain by:
 
@@ -20,12 +19,13 @@ because '-D' options are cache entries themselves.
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Cody P Schafer <dev@codyps.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 ---
  Modules/CMakeDetermineSystem.cmake | 7 +++++++
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index 600d5580e..32d7f1945 100644
+index dc208c6..e0af4ca 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
 @@ -81,6 +81,13 @@ else()
@@ -42,6 +42,3 @@ index 600d5580e..32d7f1945 100644
  # if a toolchain file is used, the user wants to cross compile.
  # in this case read the toolchain file and keep the CMAKE_HOST_SYSTEM_*
  # variables around so they can be used in CMakeLists.txt.
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index 8d2dc10ce5..db229e63e2 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -1,7 +1,8 @@
-From b4b6e9b1be33213ede3f612e87840c0045824d9e Mon Sep 17 00:00:00 2001
+From 5cb6c86696f842274043e7d406f84b3ead1c36e0 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 17 Jan 2018 10:02:14 -0200
-Subject: [PATCH 2/5] cmake: Prevent the detection of Qt5
+Subject: [PATCH] cmake: Prevent the detection of Qt5
+
 Organization: O.S. Systems Software LTDA.
 
 CMake doesn't have dependency on qt4/qt5, so these tests usually fail
@@ -12,6 +13,7 @@ while running the test in cmake)
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 ---
  Source/QtDialog/CMakeLists.txt                     | 2 +-
  Tests/CMakeLists.txt                               | 2 +-
@@ -23,12 +25,12 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  7 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
-index 9ce0323844..06c86d63eb 100644
+index cb89d19..9e68981 100644
 --- a/Source/QtDialog/CMakeLists.txt
 +++ b/Source/QtDialog/CMakeLists.txt
-@@ -6,7 +6,7 @@ if(POLICY CMP0020)
-   cmake_policy(SET CMP0020 NEW) # Drop when CMake >= 2.8.11 required
- endif()
+@@ -3,7 +3,7 @@
+ 
+ project(QtDialog)
  CMake_OPTIONAL_COMPONENT(cmake-gui)
 -find_package(Qt5Widgets QUIET)
 +#find_package(Qt5Widgets QUIET)
@@ -36,10 +38,10 @@ index 9ce0323844..06c86d63eb 100644
    include_directories(${Qt5Widgets_INCLUDE_DIRS})
    add_definitions(${Qt5Widgets_DEFINITONS})
 diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index ed98d974b0..7adfbc301b 100644
+index e73b277..91b8b67 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
-@@ -1342,7 +1342,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
+@@ -1348,7 +1348,7 @@ ${CMake_SOURCE_DIR}/Utilities/Release/push.bash --dir dev -- '${CMake_BUILD_NIGH
      set(CMake_TEST_Qt5 1)
    endif()
    if(CMake_TEST_Qt5)
@@ -49,7 +51,7 @@ index ed98d974b0..7adfbc301b 100644
    if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
      add_subdirectory(Qt5Autogen)
 diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
-index ad74961d9f..a9dd74b151 100644
+index ad74961..a9dd74b 100644
 --- a/Tests/Qt4And5Automoc/CMakeLists.txt
 +++ b/Tests/Qt4And5Automoc/CMakeLists.txt
 @@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12)
@@ -67,7 +69,7 @@ index ad74961d9f..a9dd74b151 100644
  
  set(CMAKE_AUTOMOC ON)
 diff --git a/Tests/QtAutogen/AutogenGuiTest.cmake b/Tests/QtAutogen/AutogenGuiTest.cmake
-index b76d341a45..a6e0acbafa 100644
+index b76d341..a6e0acb 100644
 --- a/Tests/QtAutogen/AutogenGuiTest.cmake
 +++ b/Tests/QtAutogen/AutogenGuiTest.cmake
 @@ -22,8 +22,7 @@ if (QT_TEST_VERSION EQUAL 4)
@@ -81,7 +83,7 @@ index b76d341a45..a6e0acbafa 100644
    set(QT_QTCORE_TARGET Qt5::Core)
    set(QT_LIBRARIES Qt5::Widgets)
 diff --git a/Tests/QtAutogen/MacOsFW/CMakeLists.txt b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
-index c08efc47a2..87e25d9391 100644
+index c08efc4..87e25d9 100644
 --- a/Tests/QtAutogen/MacOsFW/CMakeLists.txt
 +++ b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
 @@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.10)
@@ -94,10 +96,10 @@ index c08efc47a2..87e25d9391 100644
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
 diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index 1f3e5c3006..8ed8d6ac54 100644
+index 69f8162..f389523 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -326,7 +326,7 @@ add_RunCMake_test(configure_file)
+@@ -334,7 +334,7 @@ add_RunCMake_test(configure_file)
  add_RunCMake_test(CTestTimeoutAfterMatch)
  
  find_package(Qt4 QUIET)
@@ -107,7 +109,7 @@ index 1f3e5c3006..8ed8d6ac54 100644
    add_RunCMake_test(IncompatibleQt)
  endif()
 diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-index 4fccdc418f..b76e1e5313 100644
+index 4fccdc4..b76e1e5 100644
 --- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
 +++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
 @@ -1,6 +1,6 @@
@@ -118,6 +120,3 @@ index 4fccdc418f..b76e1e5313 100644
  
  add_executable(mainexe main.cpp)
  target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
index 4f2e84337e..d7d87a5256 100644
--- a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
@@ -1,8 +1,7 @@
-From c783ceeef485c23e13c3d9f0418719cb0e0b86ee Mon Sep 17 00:00:00 2001
+From b003857d3481105c473e2e75bad4e9e2c6e70004 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 12 May 2011 15:36:03 +0000
-Subject: [PATCH 3/5] cmake: support OpenEmbedded Qt4 tool binary names
-Organization: O.S. Systems Software LTDA.
+Subject: [PATCH] cmake: support OpenEmbedded Qt4 tool binary names
 
 The FindQt4 module looks for Qt4 binaries to be able to gather the
 paths used for compilation and also to be using during other processes
@@ -20,12 +19,13 @@ Instead of find_program, _find_qt4_program is now used.
 
 Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 ---
  Modules/FindQt4.cmake | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 847a798af..7ad981879 100644
+index a145b46..7e18243 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
 @@ -518,7 +518,7 @@ endfunction()
@@ -54,6 +54,3 @@ index 847a798af..7ad981879 100644
    _find_qt4_program(QT_DESIGNER_EXECUTABLE Qt4::designer designer-qt4 designer4 designer)
    _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4 linguist4 linguist)
  
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
index 6c67dcf104..676e2857d7 100644
--- a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
+++ b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
@@ -1,8 +1,7 @@
-From 9516fc4260f701c6d9db0c341bb36480362e1747 Mon Sep 17 00:00:00 2001
+From d4a78e8739e845c2963666f7ef6a6c7a89827988 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:26:48 -0300
-Subject: [PATCH 4/5] Fail silently if system Qt installation is broken
-Organization: O.S. Systems Software LTDA.
+Subject: [PATCH] Fail silently if system Qt installation is broken
 
 Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
 following error if the system Qt installation is broken:
@@ -23,12 +22,13 @@ within the if(QT_QTCORE_FOUND) statement.
 
 Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 ---
  Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------
  1 file changed, 20 insertions(+), 19 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 7ad981879..8b6f43cda 100644
+index 7e18243..497d5c3 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
 @@ -988,25 +988,26 @@ if (QT_QMAKE_EXECUTABLE AND
@@ -77,6 +77,3 @@ index 7ad981879..8b6f43cda 100644
  
    foreach(QT_MODULE ${QT_MODULES})
      _QT4_ADJUST_LIB_VARS(${QT_MODULE})
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/cmake/cmake_3.14.5.bb b/meta/recipes-devtools/cmake/cmake_3.15.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.14.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.15.2.bb
-- 
2.11.0


