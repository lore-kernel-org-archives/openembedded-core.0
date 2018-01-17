Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF467870F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:03:35 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id 33so23124746qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=Pcyf4avNsNavSS/L7PZa8hxYYYzX/QereHaD0jgwT5s=;
	b=aOc+fHR/UC7oIf/9Tg6jS2APLvBTD1ITEgCxEObacHf9KOAqb0xOiZRSRXwHeu4KAX
	gSYZAKmAEQRiv6d69w6rxvtdczS1L/MAHG9Ux0Q06cEqicaMc5GSU88DJt7FFy4WuRAH
	G8jBeIx/6rFsjc8Km5EZiehjXbNu5RDGJ1gFzRgGpbL2KV72of4RCsOTKJM9vTqP0fm0
	7XmsGXar6ctg8S23g/sLf/wo5c/o8SJpSbnawpS5fHL7DurKEwpmJb4S2eIpSmldOHaD
	hQq7JKGFfInjVtomXjfJOhVjEujf0DLVWm0ccX4CfrDaE9RsG92+tmjtvVV25mwetfpx
	WFPQ==
X-Gm-Message-State: AKwxytfEEa03/vk+4qkbyN1zjS8q5/CWe61lt5XERjUlvCTLMIWkOo+d
	mcRa30x8WzYZ1xbt2Zcbcb2lRQ==
X-Google-Smtp-Source: ACJfBot2k8CVR9wPux13hCf8347ePvg5u1Gy1d0XFNZxLs+FQKC86gczoB0bUQ3jGitAPXa7XO9ekQ==
X-Received: by 10.237.40.5 with SMTP id r5mr17096725qtd.238.1516205016328;
	Wed, 17 Jan 2018 08:03:36 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u55sm3310095qtk.18.2018.01.17.08.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 08:03:35 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 14:03:30 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 14:03:30 -0200
Message-Id: <20180117160330.30173-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 16:03:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 3.10.1 version has been in Dec 13, 2017, and has a great set of
features and improvements since the last upgrade.

The release notes of 3.10 release is available at:

https://cmake.org/cmake/help/v3.10/release/3.10.html

Patches updates:

 - cmake-Prevent-the-detection-of-Qt5.patch: so it replaces the sed
   command calls inside the cmake.inc

 - 0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch:
   merged upstream, so it has been removed.

 - support-oe-qt4-tools-names.patch: rebased.

License-checksum-change: added new contributors
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
 - avoid the explicit dependency of make (use host)

Changes in v3:
 - add make-native dependency (for real)

Changes in v2:
 - add make-native dependency

 meta/classes/cmake.bbclass                         |   1 +
 ...make-native_3.9.5.bb => cmake-native_3.10.1.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc              |  38 +---
 ...e-find_program-if-find_host_program-is-no.patch |  40 ----
 .../cmake/cmake-Prevent-the-detection-of-Qt5.patch | 215 +++++++++++++++++++++
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |  14 +-
 .../cmake/{cmake_3.9.5.bb => cmake_3.10.1.bb}      |   0
 7 files changed, 231 insertions(+), 77 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.9.5.bb => cmake-native_3.10.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch
 rename meta/recipes-devtools/cmake/{cmake_3.9.5.bb => cmake_3.10.1.bb} (100%)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index a4079dab0d..73328ad72e 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -120,6 +120,7 @@ cmake_do_configure() {
 	cmake \
 	  $oecmake_sitefile \
 	  ${OECMAKE_SOURCEPATH} \
+	  -DCMAKE_MAKE_PROGRAM=${MAKE} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
 	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix'))} \
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.9.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.10.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.9.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.10.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 8d65ac5690..045cce3fd0 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,45 +6,19 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=24600643e5d1d2b8f7478ae5c9074949 \
-                    file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=79b5b78197c74d5c5f9c7ccadeee4e8c \
+                    file://Source/cmake.h;md5=4494dee184212fc89c469c3acd555a14;beginline=1;endline=3 \
+                    "
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
-           file://0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch \
+           file://cmake-Prevent-the-detection-of-Qt5.patch \
            "
 
-SRC_URI[md5sum] = "0922130d0e0c142a88e58c6e4fef4d7d"
-SRC_URI[sha256sum] = "6220c1683b4e6bb8f38688fa3ffb17a7cf39f36317c2ddfdc3f12f09d086c166"
+SRC_URI[md5sum] = "9a726e5ec69618b172aa4b06d18c3998"
+SRC_URI[sha256sum] = "7be36ee24b0f5928251b644d29f5ff268330a916944ef4a75e23ba01e7573284"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
-
-# Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
-# and possibly missing qmake binary (qtbase-native can be removed from sysroot
-# e.g. in order to upgrade it, even when there is target qtbase)
-
-# Fixes errors like this in cmake(-native).do_configure:
-#| -- Performing Test run_pic_test - Success
-#| CMake Error at tmp-eglibc/sysroots/qemuarm/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:27 (message):
-#|   The imported target "Qt5::Core" references the file
-#|
-#|      "/qmake"
-#|
-#|   but this file does not exist.  Possible reasons include:
-
-do_configure_prepend() {
-	sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
-	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
-	sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
-	sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
-	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutoUicInterface/CMakeLists.txt
-	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutogen/CMakeLists.txt
-	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/mocRerun/CMakeLists.txt
-	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/rccDepends/CMakeLists.txt
-	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/mocDepends/CMakeLists.txt
-	sed -i 's/^find_package(Qt5Widgets REQUIRED)/#find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutogen/mocPlugin/CMakeLists.txt
-}
diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch b/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
deleted file mode 100644
index 9b820db009..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 46d25e782ebd9b6c50771b6f30433c58fae03a51 Mon Sep 17 00:00:00 2001
-From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
-Date: Mon, 26 Jun 2017 11:30:07 -0400
-Subject: [PATCH] cmake: Use find_program if find_host_program is not
- available
-
-CMake does not define the `find_host_program` command we've been using
-in the cross-compiling code path.  It was provided by a widely used
-Android toolchain file.  For compatibility, continue to use
-`find_host_program` if available, but otherwise use just `find_program`.
-
-Upstream-Status: Accepted
-[https://gitlab.kitware.com/cmake/cmake/merge_requests/1009]
-        - Will be in 3.10
-
-Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
----
- Modules/FindCUDA.cmake | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Modules/FindCUDA.cmake b/Modules/FindCUDA.cmake
-index a4dca54..77ca351 100644
---- a/Modules/FindCUDA.cmake
-+++ b/Modules/FindCUDA.cmake
-@@ -679,7 +679,11 @@ if(CMAKE_CROSSCOMPILING)
-   # add known CUDA targetr root path to the set of directories we search for programs, libraries and headers
-   set( CMAKE_FIND_ROOT_PATH "${CUDA_TOOLKIT_TARGET_DIR};${CMAKE_FIND_ROOT_PATH}")
-   macro( cuda_find_host_program )
--    find_host_program( ${ARGN} )
-+    if (COMMAND find_host_program)
-+      find_host_program( ${ARGN} )
-+    else()
-+      find_program( ${ARGN} )
-+    endif()
-   endmacro()
- else()
-   # for non-cross-compile, find_host_program == find_program and CUDA_TOOLKIT_TARGET_DIR == CUDA_TOOLKIT_ROOT_DIR
---
-2.1.4
-
diff --git a/meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch
new file mode 100644
index 0000000000..88b7e94741
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch
@@ -0,0 +1,215 @@
+From 875c11dbf87d1258ad7d3697a40d605d503e5673 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 17 Jan 2018 10:02:14 -0200
+Subject: [PATCH] cmake: Prevent the detection of Qt5
+Organization: O.S. Systems Software LTDA.
+
+CMake doesn't have dependency on qt4/qt5, so these tests usually fail
+but still can cause undeterministic results or build failures (when
+OE_QMAKE_PATH_EXTERNAL_HOST_BINS is undefined or native qmake removed
+while running the test in cmake)
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Source/QtDialog/CMakeLists.txt                     | 2 +-
+ Tests/CMakeLists.txt                               | 2 +-
+ Tests/Qt4And5Automoc/CMakeLists.txt                | 4 ++--
+ Tests/QtAutoUicInterface/CMakeLists.txt            | 2 +-
+ Tests/QtAutogen/CMakeLists.txt                     | 2 +-
+ Tests/QtAutogen/macosFW/CMakeLists.txt             | 2 +-
+ Tests/QtAutogen/mocDepends/CMakeLists.txt          | 2 +-
+ Tests/QtAutogenRerun/CMakeLists.txt                | 4 ++--
+ Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt      | 2 +-
+ Tests/QtAutogenRerun/mocRerun/CMakeLists.txt       | 2 +-
+ Tests/QtAutogenRerun/rccDepends/CMakeLists.txt     | 2 +-
+ Tests/RunCMake/CMakeLists.txt                      | 2 +-
+ Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake | 2 +-
+ 13 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
+index b38797bca..b5fbfc5fa 100644
+--- a/Source/QtDialog/CMakeLists.txt
++++ b/Source/QtDialog/CMakeLists.txt
+@@ -6,7 +6,7 @@ if(POLICY CMP0020)
+   cmake_policy(SET CMP0020 NEW) # Drop when CMake >= 2.8.11 required
+ endif()
+ CMake_OPTIONAL_COMPONENT(cmake-gui)
+-find_package(Qt5Widgets QUIET)
++#find_package(Qt5Widgets QUIET)
+ if (Qt5Widgets_FOUND)
+   include_directories(${Qt5Widgets_INCLUDE_DIRS})
+   add_definitions(${Qt5Widgets_DEFINITONS})
+diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
+index 533788a44..32ef03c55 100644
+--- a/Tests/CMakeLists.txt
++++ b/Tests/CMakeLists.txt
+@@ -1260,7 +1260,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
+     set(CMake_TEST_Qt5 1)
+   endif()
+   if(CMake_TEST_Qt5)
+-    find_package(Qt5Widgets QUIET NO_MODULE)
++    #find_package(Qt5Widgets QUIET NO_MODULE)
+   endif()
+   if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
+     add_test(NAME Qt5Autogen COMMAND ${CMAKE_CTEST_COMMAND}
+diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
+index ad74961d9..a9dd74b15 100644
+--- a/Tests/Qt4And5Automoc/CMakeLists.txt
++++ b/Tests/Qt4And5Automoc/CMakeLists.txt
+@@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12)
+ project(Qt4And5Automoc)
+ 
+ if (QT_REVERSE_FIND_ORDER)
+-  find_package(Qt5Core REQUIRED)
++  #find_package(Qt5Core REQUIRED)
+   find_package(Qt4 REQUIRED)
+ else()
+   find_package(Qt4 REQUIRED)
+-  find_package(Qt5Core REQUIRED)
++  #find_package(Qt5Core REQUIRED)
+ endif()
+ 
+ set(CMAKE_AUTOMOC ON)
+diff --git a/Tests/QtAutoUicInterface/CMakeLists.txt b/Tests/QtAutoUicInterface/CMakeLists.txt
+index a5c2d99b2..2d640e4a3 100644
+--- a/Tests/QtAutoUicInterface/CMakeLists.txt
++++ b/Tests/QtAutoUicInterface/CMakeLists.txt
+@@ -14,7 +14,7 @@ else()
+   if (NOT QT_TEST_VERSION STREQUAL 5)
+     message(SEND_ERROR "Invalid Qt version specified.")
+   endif()
+-  find_package(Qt5Widgets REQUIRED)
++  #find_package(Qt5Widgets REQUIRED)
+ 
+   set(QT_CORE_TARGET Qt5::Core)
+   set(QT_GUI_TARGET Qt5::Widgets)
+diff --git a/Tests/QtAutogen/CMakeLists.txt b/Tests/QtAutogen/CMakeLists.txt
+index dff9d0c66..c6e8fc3f5 100644
+--- a/Tests/QtAutogen/CMakeLists.txt
++++ b/Tests/QtAutogen/CMakeLists.txt
+@@ -23,7 +23,7 @@ else()
+   if (NOT QT_TEST_VERSION STREQUAL 5)
+     message(SEND_ERROR "Invalid Qt version specified.")
+   endif()
+-  find_package(Qt5Widgets REQUIRED)
++  #find_package(Qt5Widgets REQUIRED)
+ 
+   set(QT_QTCORE_TARGET Qt5::Core)
+ 
+diff --git a/Tests/QtAutogen/macosFW/CMakeLists.txt b/Tests/QtAutogen/macosFW/CMakeLists.txt
+index 114d9bac0..157fe0aaa 100644
+--- a/Tests/QtAutogen/macosFW/CMakeLists.txt
++++ b/Tests/QtAutogen/macosFW/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ cmake_minimum_required(VERSION 3.8)
+ project(macos-fw-test)
+ 
+-find_package(Qt5Test REQUIRED)
++#find_package(Qt5Test REQUIRED)
+ 
+ set(CMAKE_CXX_STANDARD 11)
+ set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
+diff --git a/Tests/QtAutogen/mocDepends/CMakeLists.txt b/Tests/QtAutogen/mocDepends/CMakeLists.txt
+index 8217b8dbf..86bb7bc7f 100644
+--- a/Tests/QtAutogen/mocDepends/CMakeLists.txt
++++ b/Tests/QtAutogen/mocDepends/CMakeLists.txt
+@@ -10,7 +10,7 @@ else()
+     message(SEND_ERROR "Invalid Qt version specified.")
+   endif()
+ 
+-  find_package(Qt5Core REQUIRED)
++  #find_package(Qt5Core REQUIRED)
+   set(QT_CORE_TARGET Qt5::Core)
+ endif()
+ 
+diff --git a/Tests/QtAutogenRerun/CMakeLists.txt b/Tests/QtAutogenRerun/CMakeLists.txt
+index e72c1912e..d7e6884ce 100644
+--- a/Tests/QtAutogenRerun/CMakeLists.txt
++++ b/Tests/QtAutogenRerun/CMakeLists.txt
+@@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.9)
+ cmake_policy(SET CMP0071 NEW)
+ project(QtAutogenRerun)
+ 
+-# Tell find_package(Qt5) where to find Qt.
++# Tell #find_package(Qt5) where to find Qt.
+ if(QT_QMAKE_EXECUTABLE)
+   get_filename_component(Qt_BIN_DIR "${QT_QMAKE_EXECUTABLE}" PATH)
+   get_filename_component(Qt_PREFIX_DIR "${Qt_BIN_DIR}" PATH)
+@@ -23,7 +23,7 @@ else()
+   if (NOT QT_TEST_VERSION STREQUAL 5)
+     message(SEND_ERROR "Invalid Qt version specified.")
+   endif()
+-  find_package(Qt5Widgets REQUIRED)
++  #find_package(Qt5Widgets REQUIRED)
+ 
+   set(QT_QTCORE_TARGET Qt5::Core)
+ 
+diff --git a/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt b/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt
+index b7cc5e9ff..e1d109953 100644
+--- a/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt
++++ b/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt
+@@ -9,7 +9,7 @@ set(CMAKE_AUTOMOC_DEPEND_FILTERS
+ if (NOT QT_TEST_VERSION STREQUAL 5)
+   message(SEND_ERROR "Invalid Qt version specified.")
+ endif()
+-find_package(Qt5Widgets REQUIRED)
++#find_package(Qt5Widgets REQUIRED)
+ 
+ if(Qt5_POSITION_INDEPENDENT_CODE AND CMAKE_CXX_COMPILE_OPTIONS_PIC)
+   add_definitions(${CMAKE_CXX_COMPILE_OPTIONS_PIC})
+diff --git a/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt b/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt
+index bafd9cf48..43ec933d2 100644
+--- a/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt
++++ b/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt
+@@ -10,7 +10,7 @@ else()
+     message(SEND_ERROR "Invalid Qt version specified.")
+   endif()
+ 
+-  find_package(Qt5Core REQUIRED)
++  #find_package(Qt5Core REQUIRED)
+   set(QT_CORE_TARGET Qt5::Core)
+ endif()
+ 
+diff --git a/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt b/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt
+index 291592e7d..40cd52868 100644
+--- a/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt
++++ b/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt
+@@ -9,7 +9,7 @@ else()
+     message(SEND_ERROR "Invalid Qt version specified.")
+   endif()
+ 
+-  find_package(Qt5Core REQUIRED)
++  #find_package(Qt5Core REQUIRED)
+   set(QT_CORE_TARGET Qt5::Core)
+ endif()
+ 
+diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
+index 29325ff0a..d30d01e78 100644
+--- a/Tests/RunCMake/CMakeLists.txt
++++ b/Tests/RunCMake/CMakeLists.txt
+@@ -274,7 +274,7 @@ add_RunCMake_test(configure_file)
+ add_RunCMake_test(CTestTimeoutAfterMatch)
+ 
+ find_package(Qt4 QUIET)
+-find_package(Qt5Core QUIET)
++#find_package(Qt5Core QUIET)
+ if (QT4_FOUND AND Qt5Core_FOUND AND NOT Qt5Core_VERSION VERSION_LESS 5.1.0)
+   add_RunCMake_test(IncompatibleQt)
+ endif()
+diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
+index 4fccdc418..b76e1e531 100644
+--- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
++++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
+@@ -1,6 +1,6 @@
+ 
+ find_package(Qt4 REQUIRED)
+-find_package(Qt5Core REQUIRED)
++#find_package(Qt5Core REQUIRED)
+ 
+ add_executable(mainexe main.cpp)
+ target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
+-- 
+2.15.1
+
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
index 15cbca89d8..6841554763 100644
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -1,4 +1,7 @@
-cmake: support OpenEmbedded Qt4 tool binary names
+From 10b8b523869124d2fc8cd98d9e028c0bcffd61b1 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Thu, 12 May 2011 15:36:03 +0000
+Subject: [PATCH 1/2] cmake: support OpenEmbedded Qt4 tool binary names
 
 The FindQt4 module looks for Qt4 binaries to be able to gather the
 paths used for compilation and also to be using during other processes
@@ -15,15 +18,16 @@ The patch was slightly adapted in order to match cmake 3.2.2:
 Instead of find_program, _find_qt4_program is now used.
 
 Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
+
 ---
  Modules/FindQt4.cmake | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 11091b5..6704769 100644
+index c67d0be..0cf169b 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
-@@ -522,7 +522,7 @@ endfunction()
+@@ -516,7 +516,7 @@ endfunction()
  
  set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
  
@@ -32,7 +36,7 @@ index 11091b5..6704769 100644
  _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
  
  if (QT_QMAKE_EXECUTABLE AND
-@@ -1148,12 +1148,12 @@ if (QT_QMAKE_EXECUTABLE AND
+@@ -1142,12 +1142,12 @@ if (QT_QMAKE_EXECUTABLE AND
    _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
    _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
    _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
@@ -50,5 +54,5 @@ index 11091b5..6704769 100644
    _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4 linguist4 linguist)
  
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.9.5.bb b/meta/recipes-devtools/cmake/cmake_3.10.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.9.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.10.1.bb
-- 
2.15.1


