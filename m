Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1196 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Feb 2019 09:51:21 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id EC9596010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 09:51:21 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x1C9VQUE016539
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 10:31:26 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.77])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x1C9VQKr025149;
	Tue, 12 Feb 2019 10:31:26 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D761E10D47AA;
	Tue, 12 Feb 2019 10:31:25 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 10:30:48 +0100
Message-Id: <20190212093048.25238-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake: update to 3.13.4
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
X-List-Received-Date: Tue, 12 Feb 2019 09:51:22 -0000

All patches have been rebased on top of the 3.13.4 release.

I successfully built all CMake recipes in oe-core and meta-oe.


Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...ake-native_3.12.2.bb => cmake-native_3.13.4.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  4 ++--
 ...ineSystem-use-oe-environment-vars-to-load.patch |  7 +++---
 .../0002-cmake-Prevent-the-detection-of-Qt5.patch  | 27 +++++++++++-----------
 ...upport-OpenEmbedded-Qt4-tool-binary-names.patch |  7 +++---
 ...ently-if-system-Qt-installation-is-broken.patch |  7 +++---
 ...-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch |  9 ++++----
 .../cmake/{cmake_3.12.2.bb => cmake_3.13.4.bb}     |  0
 8 files changed, 28 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.12.2.bb => cmake-native_3.13.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.12.2.bb => cmake_3.13.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.13.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.13.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 09e28b73dd..68a71e9139 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "6e7c550cfa1c2e216b35903dc70d80af"
-SRC_URI[sha256sum] = "0f97485799e51a7070cc11494f3e02349b0fc3a24cc12b082e737bf67a0581a4"
+SRC_URI[md5sum] = "b5a544ffc73f6922a6cf371fcb6bae22"
+SRC_URI[sha256sum] = "fdd928fee35f472920071d1c7f1a6a2b72c9b25e04f7a37b409349aef3f20e9b"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index f690720870..13234240bf 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,9 +1,8 @@
-From 71085723f8028b3e1c4029fc1abe1243ac49ffc6 Mon Sep 17 00:00:00 2001
+From a072ad261b717b054c2deeb3eba1b206370e088e Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH 1/5] CMakeDetermineSystem: use oe environment vars to load
  default toolchain file in sdk
-Organization: O.S. Systems Software LTDA.
 
 Passing the toolchain by:
 
@@ -25,7 +24,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index 600d5580e..32d7f1945 100644
+index 600d5580e1..32d7f19459 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
 @@ -82,6 +82,13 @@ else()
@@ -43,5 +42,5 @@ index 600d5580e..32d7f1945 100644
  # in this case read the toolchain file and keep the CMAKE_HOST_SYSTEM_*
  # variables around so they can be used in CMakeLists.txt.
 -- 
-2.18.0
+2.11.0
 
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index 6f788ada00..aa21aa54a2 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -1,8 +1,7 @@
-From 7a1f4e724f9c68498f401244c2938e784a2e6fbd Mon Sep 17 00:00:00 2001
+From 1df23cf04e19be465cc25b0bc068fbccd4e92d5b Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 17 Jan 2018 10:02:14 -0200
 Subject: [PATCH 2/5] cmake: Prevent the detection of Qt5
-Organization: O.S. Systems Software LTDA.
 
 CMake doesn't have dependency on qt4/qt5, so these tests usually fail
 but still can cause undeterministic results or build failures (when
@@ -23,7 +22,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  7 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
-index 330b74729..e7709dee6 100644
+index 330b747290..e7709dee67 100644
 --- a/Source/QtDialog/CMakeLists.txt
 +++ b/Source/QtDialog/CMakeLists.txt
 @@ -6,7 +6,7 @@ if(POLICY CMP0020)
@@ -36,10 +35,10 @@ index 330b74729..e7709dee6 100644
    include_directories(${Qt5Widgets_INCLUDE_DIRS})
    add_definitions(${Qt5Widgets_DEFINITONS})
 diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index b8b724ed8..63f6bb6d2 100644
+index 0de6c416e5..6a37ffa02c 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
-@@ -1322,7 +1322,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
+@@ -1297,7 +1297,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
      set(CMake_TEST_Qt5 1)
    endif()
    if(CMake_TEST_Qt5)
@@ -49,7 +48,7 @@ index b8b724ed8..63f6bb6d2 100644
    if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
      add_subdirectory(Qt5Autogen)
 diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
-index ad74961d9..a9dd74b15 100644
+index ad74961d9f..a9dd74b151 100644
 --- a/Tests/Qt4And5Automoc/CMakeLists.txt
 +++ b/Tests/Qt4And5Automoc/CMakeLists.txt
 @@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12)
@@ -67,20 +66,20 @@ index ad74961d9..a9dd74b15 100644
  
  set(CMAKE_AUTOMOC ON)
 diff --git a/Tests/QtAutogen/AutogenTest.cmake b/Tests/QtAutogen/AutogenTest.cmake
-index 8c0a14fca..e9923b21a 100644
+index 3969a89314..c5343f912c 100644
 --- a/Tests/QtAutogen/AutogenTest.cmake
 +++ b/Tests/QtAutogen/AutogenTest.cmake
-@@ -22,7 +22,7 @@ if (QT_TEST_VERSION STREQUAL 4)
+@@ -22,7 +22,7 @@ if (QT_TEST_VERSION EQUAL 4)
    endmacro()
  
- elseif(QT_TEST_VERSION STREQUAL 5)
+ elseif(QT_TEST_VERSION EQUAL 5)
 -  find_package(Qt5Widgets REQUIRED)
 +  #find_package(Qt5Widgets REQUIRED)
  
    set(QT_QTCORE_TARGET Qt5::Core)
    set(QT_QTGUI_TARGET Qt5::Widgets)
 diff --git a/Tests/QtAutogen/MacOsFW/CMakeLists.txt b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
-index 26d201926..e48e1c8de 100644
+index 26d2019265..e48e1c8de0 100644
 --- a/Tests/QtAutogen/MacOsFW/CMakeLists.txt
 +++ b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
 @@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.10)
@@ -93,10 +92,10 @@ index 26d201926..e48e1c8de 100644
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
 diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index 637c5c2cb..c0376effc 100644
+index 27413dde18..9f697c69b7 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -291,7 +291,7 @@ add_RunCMake_test(configure_file)
+@@ -310,7 +310,7 @@ add_RunCMake_test(configure_file)
  add_RunCMake_test(CTestTimeoutAfterMatch)
  
  find_package(Qt4 QUIET)
@@ -106,7 +105,7 @@ index 637c5c2cb..c0376effc 100644
    add_RunCMake_test(IncompatibleQt)
  endif()
 diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-index 4fccdc418..b76e1e531 100644
+index 4fccdc418f..b76e1e5313 100644
 --- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
 +++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
 @@ -1,6 +1,6 @@
@@ -118,5 +117,5 @@ index 4fccdc418..b76e1e531 100644
  add_executable(mainexe main.cpp)
  target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
 -- 
-2.18.0
+2.11.0
 
diff --git a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
index 55cf47188a..b347d3b149 100644
--- a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
@@ -1,8 +1,7 @@
-From c783ceeef485c23e13c3d9f0418719cb0e0b86ee Mon Sep 17 00:00:00 2001
+From 9e6fca8d0791e44fc0e9ca660c8602455ac4d66a Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 12 May 2011 15:36:03 +0000
 Subject: [PATCH 3/5] cmake: support OpenEmbedded Qt4 tool binary names
-Organization: O.S. Systems Software LTDA.
 
 The FindQt4 module looks for Qt4 binaries to be able to gather the
 paths used for compilation and also to be using during other processes
@@ -25,7 +24,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 847a798af..7ad981879 100644
+index 847a798af0..7ad9818793 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
 @@ -517,7 +517,7 @@ endfunction()
@@ -55,5 +54,5 @@ index 847a798af..7ad981879 100644
    _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4 linguist4 linguist)
  
 -- 
-2.18.0
+2.11.0
 
diff --git a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
index a59c680454..258d068cf8 100644
--- a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
+++ b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
@@ -1,8 +1,7 @@
-From 9516fc4260f701c6d9db0c341bb36480362e1747 Mon Sep 17 00:00:00 2001
+From 30a9333861b68056114e2114b6b2f5f86a4de9be Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:26:48 -0300
 Subject: [PATCH 4/5] Fail silently if system Qt installation is broken
-Organization: O.S. Systems Software LTDA.
 
 Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
 following error if the system Qt installation is broken:
@@ -28,7 +27,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 20 insertions(+), 19 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 7ad981879..8b6f43cda 100644
+index 7ad9818793..8b6f43cdac 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
 @@ -987,25 +987,26 @@ if (QT_QMAKE_EXECUTABLE AND
@@ -78,5 +77,5 @@ index 7ad981879..8b6f43cda 100644
    foreach(QT_MODULE ${QT_MODULES})
      _QT4_ADJUST_LIB_VARS(${QT_MODULE})
 -- 
-2.18.0
+2.11.0
 
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 23ce8e9e4a..024bbc2480 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,9 +1,8 @@
-From 0df8d46d14c371f21c327966a553c4c187a8acfe Mon Sep 17 00:00:00 2001
+From d6ac35a6c43940105e134af4076475ffd2e730cb Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH 5/5] Disable use of ext2fs/ext2_fs.h by cmake's internal
  libarchive copy
-Organization: O.S. Systems Software LTDA.
 
 We don't want to add a dependency on e2fsprogs-native for cmake-native,
 and we don't use CPack so just disable this functionality.
@@ -17,10 +16,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index 206f3c6a5..642fb0dd9 100644
+index d7af6e2b6b..51b4efffd3 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -400,12 +400,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -430,12 +430,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
@@ -36,5 +35,5 @@ index 206f3c6a5..642fb0dd9 100644
  LA_CHECK_INCLUDE_FILE("grp.h" HAVE_GRP_H)
  LA_CHECK_INCLUDE_FILE("inttypes.h" HAVE_INTTYPES_H)
 -- 
-2.18.0
+2.11.0
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.12.2.bb b/meta/recipes-devtools/cmake/cmake_3.13.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.12.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.13.4.bb
-- 
2.11.0


