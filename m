Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA47CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 06:44:56 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web11.68914.1755499494126123125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 23:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=OkSklIc5;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=3181d8914=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755499494; x=1787035494;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CZkwzwAoaZ73SiNaWim0oj5tElw9XL8q550ErHaL6bo=;
  b=OkSklIc5QoUjQUWFN26UrxcxgdGxGsZwtBQd2OjAa4DAgr5WZuDm7Qv3
   sIaRnym9di/xUMXPMmuZnvLD6KbHWu6zNJuXnrdaHEwguMJPQ6l73oa53
   itiwoTmRfTa7FEzOuDDKBmSpSIJ8fb2REo0rpBZiSpeyuy7iiPVztc4Ss
   g=;
X-CSE-ConnectionGUID: dsCKViymTUiTW7yfZhYg3g==
X-CSE-MsgGUID: TZOxJSzPSDGKlJ6QUNdmzw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 18 Aug 2025 08:44:50 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw6.muc with
 ESMTP/TLS; 18 Aug 2025 08:44:49 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb3.muc with ESMTP/TLS; 18 Aug 2025 08:44:50 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.203) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 18 Aug 2025 08:44:49 +0200
X-CSE-ConnectionGUID: TcV+3vjjRDinLxCYDWGdAA==
X-CSE-MsgGUID: t4YKGeSdQuSf4e9LtQXkKA==
X-CSE-ConnectionGUID: M5aj7MIsTLOar/uM7/FnWg==
X-CSE-MsgGUID: gD35p4PKQ0GKeVoldzIL5Q==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] libcomps: upgrade 0.1.21 -> 0.1.22
Date: Mon, 18 Aug 2025 08:44:13 +0200
Message-ID: <20250818064412.1161123-2-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17d.europe.bmw.corp (2a03:1e80:a15:58f::1:66) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 06:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222031

The project did not publish release notes, but the list of changes is available
at [0]. The new release brings a fix for [1] and ships the patch to build with
CMake 4+.

[0]: https://github.com/rpm-software-management/libcomps/compare/0.1.21...0.1.22
[1]: https://bugzilla.redhat.com/show_bug.cgi?id=2331665

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...YTHON_INSTALL_DIR-by-running-python.patch} |   9 +-
 ...libcomps-Support-builds-with-CMake-4.patch | 132 ------------------
 ...{libcomps_0.1.21.bb => libcomps_0.1.22.bb} |   7 +-
 3 files changed, 6 insertions(+), 142 deletions(-)
 rename meta/recipes-devtools/libcomps/libcomps/{0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch => 0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch} (87%)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Support-builds-with-CMake-4.patch
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.21.bb => libcomps_0.1.22.bb} (78%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
similarity index 87%
rename from meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
rename to meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 6cd052889a..6fc0a4177f 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,7 +1,7 @@
-From 32447a79e24f8e7e9e0150eb747f34116d63ef38 Mon Sep 17 00:00:00 2001
+From 159ad0e19f4c5d7fe357378c00db19c1106e62c4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH 2/2] Do not set PYTHON_INSTALL_DIR by running python.
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index f813af4..9eebb6c 100644
+index d22b84e..ad67309 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
 @@ -85,7 +85,7 @@ IF (SKBUILD)
@@ -22,6 +22,3 @@ index f813af4..9eebb6c 100644
  
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
      #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Support-builds-with-CMake-4.patch b/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Support-builds-with-CMake-4.patch
deleted file mode 100644
index 9a90e05888..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Support-builds-with-CMake-4.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 702ec1423fb9b53244b902923fd87ef19b63a7f5 Mon Sep 17 00:00:00 2001
-From: Moritz Haase <Moritz.Haase@bmw.de>
-Date: Mon, 23 Jun 2025 08:32:18 +0200
-Subject: [PATCH] libcomps: Support builds with CMake 4+
-
-- Bump minimum required version to 3.10, the lowest one CMake 4+ don't complain
-  about. It's also possible to use 3.5, but that results in a deprecation
-  warning. The 'cmake_minimum_required()' invocation has been moved before the
-  initial 'project()' call as CMake complained about the wrong order.
-
-- Set policy CMP0148 [0] to OLD to unblock build without additional changes.
-  Eventually, the usage of the 'PythonInterp' and 'PythonLibs' find modules will
-  be need to be updated to use 'Python3' instead.
-
-- Set policy CMP0175 [1] to NEW and fix warnings.
-
-- Fix the 'No TARGET ... has been created in this directory' error in
-  'src/python'.
-
-- Fix 'Utility target <foo> must not be used as the target of a
-  target_link_libraries call' errors (see [2]).
-
-- Mark the 'check' library as required when tests are enabled to prevent test
-  targets from linking a non-existing library in case it's not installed.
-
-[0]: https://cmake.org/cmake/help/latest/policy/CMP0148.html
-[1]: https://cmake.org/cmake/help/latest/policy/CMP0175.html
-[2]: https://cmake.org/cmake/help/latest/policy/CMP0039.html
-
-Upstream-Status: Backport [702ec1423fb9b53244b902923fd87ef19b63a7f5]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- README.md                               | 3 +--
- libcomps/CMakeLists.txt                 | 7 +++++--
- libcomps/src/python/docs/CMakeLists.txt | 3 ++-
- libcomps/src/python/pycopy.cmake        | 7 ++++---
- libcomps/tests/CMakeLists.txt           | 2 --
- 5 files changed, 12 insertions(+), 10 deletions(-)
-
-diff --git a/README.md b/README.md
-index 7f8314dd3f70d131c4d399f069d3d7bb77dcff02..24bf8a226d50b7b9b5372f98b52650ff4467c3d6 100644
---- a/README.md
-+++ b/README.md
-@@ -27,7 +27,7 @@ for python bindings:
-
- for C library tests:
-
--*   check http://check.sourceforge.net/
-+*   check https://github.com/libcheck/check
-
- for documentation build:
-
-@@ -128,4 +128,3 @@ Here's the most direct way to get your work merged into the project.
-
- 1. Push the branch to your fork
- 1. Send a pull request for your branch
--
-diff --git a/libcomps/CMakeLists.txt b/libcomps/CMakeLists.txt
-index d8d628af1a8b863b6173ff11615a59aa58d8235e..3957e63a311fc42c85516c0e66fc6f598194cb8f 100644
---- a/libcomps/CMakeLists.txt
-+++ b/libcomps/CMakeLists.txt
-@@ -1,5 +1,8 @@
-+cmake_minimum_required (VERSION 3.10)
- project(libcomps C)
--cmake_minimum_required (VERSION 2.8.10)
-+
-+cmake_policy(SET CMP0148 OLD)
-+cmake_policy(SET CMP0175 NEW)
-
- include (GNUInstallDirs)
- include (${CMAKE_ROOT}/Modules/CheckFunctionExists.cmake)
-@@ -32,7 +35,7 @@ include_directories("${PROJECT_SOURCE_DIR}/src")
- #include_directories("${PROJECT_SOURCE_DIR}/src/libcomps")
-
- if (ENABLE_TESTS)
--  find_library(CHECK_LIBRARY NAMES check)
-+  find_library(CHECK_LIBRARY REQUIRED NAMES check)
- endif()
- find_library(EXPAT_LIBRARY NAMES expat)
-
-diff --git a/libcomps/src/python/docs/CMakeLists.txt b/libcomps/src/python/docs/CMakeLists.txt
-index c4b388cb4a4bb2d962a625a448efcfee14ef71b3..9c92b2dacf4a2cb76f461b8038217cc8e895a369 100644
---- a/libcomps/src/python/docs/CMakeLists.txt
-+++ b/libcomps/src/python/docs/CMakeLists.txt
-@@ -26,7 +26,8 @@ add_dependencies(pydocs pycomps)
- include(../pycopy.cmake)
- add_custom_command(TARGET pydocs PRE_BUILD COMMAND set -E $ENV{LD_LIBRARY_PATH} "${LIBCOMPS_OUT}:$ENV{LD_LIBRARY_PATH}")
-
--add_custom_command(TARGET pydocs COMMAND ${PYTHON_EXECUTABLE} ${SPHINX_EXECUTABLE} -E -b html
-+add_custom_command(TARGET pydocs POST_BUILD
-+                                 COMMAND ${PYTHON_EXECUTABLE} ${SPHINX_EXECUTABLE} -E -b html
-                                   "${CMAKE_CURRENT_SOURCE_DIR}/doc-sources/"
-                                   "${CMAKE_CURRENT_BINARY_DIR}/html/"
-                                  COMMENT "LDLP $ENV{LD_LIBRARY_PATH}")
-diff --git a/libcomps/src/python/pycopy.cmake b/libcomps/src/python/pycopy.cmake
-index b22f83595c09b4af8f1c2e49ddbd7755f4c97f0b..0e99e38d791ffd13496bd8fbbf61cd7701e543b7 100644
---- a/libcomps/src/python/pycopy.cmake
-+++ b/libcomps/src/python/pycopy.cmake
-@@ -6,9 +6,10 @@ math (EXPR len "${len} - 1")
-
- #set(pycopy "py${pversion}-copy")
-
--#if (NOT TARGET ${pycopy})
-+if (NOT TARGET ${pycopy})
-+    add_custom_target(${pycopy} DEPENDS pycomps)
-+endif()
-
--#add_custom_target(${pycopy} DEPENDS pycomps)
- set (pycomps_SRCDIR "${PROJECT_SOURCE_DIR}/src/python/src/")
- set (pycomps_TESTDIR "${PROJECT_SOURCE_DIR}/src/python/tests/")
- set (pycomps_LIBPATH ${PYCOMPS_LIB_PATH})#"${PROJECT_BINARY_DIR}/src/python/src/python${pversion}")
-@@ -16,7 +17,7 @@ set (pycomps_LIBPATH ${PYCOMPS_LIB_PATH})#"${PROJECT_BINARY_DIR}/src/python/src/
- #add_custom_command(TARGET pycopy PRE_BUILD COMMAND ${CMAKE_COMMAND} -E
- #                    make_directory "${CP_DST}")
-
--add_custom_command(TARGET ${pycopy} COMMAND ${CMAKE_COMMAND} -E
-+add_custom_command(TARGET ${pycopy} POST_BUILD COMMAND ${CMAKE_COMMAND} -E
-                     make_directory ${pycomps_LIBPATH}/libcomps/comps/)
-
- foreach(x RANGE 0 ${len})
-diff --git a/libcomps/tests/CMakeLists.txt b/libcomps/tests/CMakeLists.txt
-index 23ced7450afa02977c63f9374a4fee33ae596d98..9d6e428e18d5a234c7be74d957c25961dea30050 100644
---- a/libcomps/tests/CMakeLists.txt
-+++ b/libcomps/tests/CMakeLists.txt
-@@ -87,7 +87,5 @@ add_custom_target(test_parse_run
-                    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
-                    DEPENDS test_parse
-                    COMMENT "Running comps_parse test")
--target_link_libraries(test_parse_run libcomps)
--target_link_libraries(test_comps_run libcomps)
-
- add_dependencies(ctest test_comps_run test_parse_run)
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.22.bb
similarity index 78%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.22.bb
index 9429c703e1..796b78ef65 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.22.bb
@@ -4,12 +4,11 @@ DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pu
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
-           file://0001-libcomps-Support-builds-with-CMake-4.patch \
-           file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;tag=${PV};protocol=https \
+           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "2e973ce22698dd64f472180e3a689755268fb06b"
+SRCREV = "3f0d19b3c3273db4bf0497f08f22317835c1d426"
 
 inherit cmake setuptools3-base
 

