Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BA01088E4C
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:38:33 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27342.1773873511005143877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=PiAfP/cT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202603182238285d9556a18a000207bf-n4olkx@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202603182238285d9556a18a000207bf
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Mar 2026 23:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LLhmi74+3+9OdxR3EDIbH2tSUAjiOkmRa6t6XFZAXco=;
 b=PiAfP/cT88xYifjuVeWVjZFzBjdhTq5hXnZZpR29cfOhqahX+QEuo2mpOExRSS1ukkFWTL
 26cDo86y9J9Yt7aQ04sic3DyjxZhOXIAFVUG6W1VHaaUdtgfB5ug2ZPtJseA9cocyRLzW+Tv
 h7mUv2ecQ1P8C+piB2wZiwBEC9WbwFuACcJQad/WHcusGdrHbthGFLUH1C2LMOf5gmhead2t
 KbHR3Je8uzOsTu+G49AFn0XR2zUWyKj/aIo4NDfrRmNny6mhpriAh2fhS/x12zQVuwwSHo0q
 aLU+wfODbV1LTzUmXIj/4MpgyJGhE6grF2ToBdRZ8b5RRRZgSECSc79Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 8/9] meta-selftest: refactor cpp examples into .inc files and add clang variants
Date: Wed, 18 Mar 2026 23:36:16 +0100
Message-ID: <20260318223736.3414885-9-adrian.freihofer@siemens.com>
In-Reply-To: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233444

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Refactor cmake-example.bb and meson-example.bb to extract common
build logic into separate .inc files. Add clang variants of both
examples to enable testing with alternative toolchains.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/cpp/cmake-example-clang.bb   | 13 +++++++
 .../recipes-test/cpp/cmake-example.bb         | 20 ++---------
 .../recipes-test/cpp/cmake-example.inc        | 29 +++++++++++++++
 .../recipes-test/cpp/cmake-example/run-ptest  | 10 ------
 .../recipes-test/cpp/cpp-example.inc          | 20 +++++++----
 .../recipes-test/cpp/files/CMakeLists.txt     | 35 +++++++++---------
 .../recipes-test/cpp/files/meson.build        | 17 +++++----
 .../recipes-test/cpp/files/meson.options      |  6 ++++
 .../cpp/{meson-example => files}/run-ptest    |  4 +--
 .../recipes-test/cpp/meson-example-clang.bb   | 13 +++++++
 .../recipes-test/cpp/meson-example.bb         | 24 ++-----------
 .../recipes-test/cpp/meson-example.inc        | 36 +++++++++++++++++++
 12 files changed, 147 insertions(+), 80 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.inc
 delete mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 rename meta-selftest/recipes-test/cpp/{meson-example => files}/run-ptest (51%)
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example.inc

diff --git a/meta-selftest/recipes-test/cpp/cmake-example-clang.bb b/meta-selftest/recipes-test/cpp/cmake-example-clang.bb
new file mode 100644
index 0000000000..bf20b94e14
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/cmake-example-clang.bb
@@ -0,0 +1,13 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A C++ example compiled with cmake and clang."
+
+require cmake-example.inc
+
+TOOLCHAIN = "clang"
+EX_BINARY_NAME = "${BPN}"
+EX_SERVICE_USER = "cmake-example"
diff --git a/meta-selftest/recipes-test/cpp/cmake-example.bb b/meta-selftest/recipes-test/cpp/cmake-example.bb
index aecfcf780a..19d056fdd8 100644
--- a/meta-selftest/recipes-test/cpp/cmake-example.bb
+++ b/meta-selftest/recipes-test/cpp/cmake-example.bb
@@ -4,22 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-SUMMARY = "A C++ example compiled with cmake."
+SUMMARY = "A C++ example compiled with cmake and GCC."
 
-require cpp-example.inc
+require cmake-example.inc
 
-SRC_URI += "file://CMakeLists.txt"
-
-inherit cmake-qemu
-
-PACKAGECONFIG[failing_test] = "-DFAILING_TEST=ON"
-
-FILES:${PN}-ptest += "${bindir}/test-cmake-example"
-
-do_run_tests () {
-    bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' --target test -- ${EXTRA_OECMAKE_BUILD}
-    eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' --target test -- ${EXTRA_OECMAKE_BUILD}
-}
-do_run_tests[doc] = "Run cmake --target=test using qemu-user"
-
-addtask do_run_tests after do_compile
+TOOLCHAIN = "gcc"
diff --git a/meta-selftest/recipes-test/cpp/cmake-example.inc b/meta-selftest/recipes-test/cpp/cmake-example.inc
new file mode 100644
index 0000000000..eb023d389a
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/cmake-example.inc
@@ -0,0 +1,29 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+require cpp-example.inc
+
+SRC_URI += "file://CMakeLists.txt"
+
+inherit cmake-qemu
+
+PACKAGECONFIG[failing_test] = "-DFAILING_TEST=ON"
+
+# Support installing all recipe variants in parallel
+EXTRA_OECMAKE += "\
+    -DBINARY_NAME=${EX_BINARY_NAME} \
+    -DTEST_BINARY_NAME=${EX_TEST_BINARY_NAME} \
+"
+
+FILES:${PN}-ptest += "${bindir}/${EX_TEST_BINARY_NAME}"
+
+do_run_tests () {
+    bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' --target test -- ${EXTRA_OECMAKE_BUILD}
+    eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' --target test -- ${EXTRA_OECMAKE_BUILD}
+}
+do_run_tests[doc] = "Run cmake --target=test using qemu-user"
+
+addtask do_run_tests after do_compile
diff --git a/meta-selftest/recipes-test/cpp/cmake-example/run-ptest b/meta-selftest/recipes-test/cpp/cmake-example/run-ptest
deleted file mode 100644
index 94b620a198..0000000000
--- a/meta-selftest/recipes-test/cpp/cmake-example/run-ptest
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-test-cmake-example
-
-# Note: run-ptests exits with exit value from test-cmake-example
diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index 0671824d1c..0070d17201 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -35,10 +35,16 @@ INITSCRIPT_PARAMS = "defaults 99"
 
 # Create cpp-example user and group
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system ${BPN}"
-USERADD_PARAM:${PN} = "--system --home /var/lib/${BPN} --no-create-home --shell /bin/false --gid ${BPN} ${BPN}"
+GROUPADD_PARAM:${PN} = "--system ${EX_SERVICE_USER}"
+USERADD_PARAM:${PN} = "--system --home /var/lib/${EX_SERVICE_USER} --no-create-home --shell /bin/false --gid ${EX_SERVICE_USER} ${EX_SERVICE_USER}"
 
+EX_SERVICE_USER ?= "${BPN}"
 EX_BINARY_NAME ?= "${BPN}"
+EX_TEST_BINARY_NAME ?= "test-${EX_BINARY_NAME}"
+
+do_install_ptest() {
+    sed -i -e 's|@TEST_BINARY_NAME@|${EX_TEST_BINARY_NAME}|g' ${D}${PTEST_PATH}/run-ptest
+}
 
 do_install:append() {
     # Install configuration file owned by the recipe's unprivileged user.
@@ -47,7 +53,7 @@ do_install:append() {
     # in the final image. devtool deploy-target is a raw file copy and does not run
     # pkg_postinst, so the UID in ${D} must already be correct.
     install -d ${D}${sysconfdir}
-    install -m 0644 -g ${BPN} -o ${BPN} ${S}/cpp-example.conf ${D}${sysconfdir}/${BPN}.conf
+    install -m 0644 -g ${EX_SERVICE_USER} -o ${EX_SERVICE_USER} ${S}/cpp-example.conf ${D}${sysconfdir}/${BPN}.conf
     sed -i -e 's|@BINARY_NAME@|${BPN}|g' ${D}${sysconfdir}/${BPN}.conf
 
     # Install service files or init scripts and substitute placeholders in service files
@@ -57,8 +63,8 @@ do_install:append() {
         sed -i \
             -e 's|@BINDIR@|${bindir}|g' \
             -e 's|@BINARY_NAME@|${EX_BINARY_NAME}|g' \
-            -e 's|@USER@|${BPN}|g' \
-            -e 's|@GROUP@|${BPN}|g' \
+            -e 's|@USER@|${EX_SERVICE_USER}|g' \
+            -e 's|@GROUP@|${EX_SERVICE_USER}|g' \
             ${D}${systemd_system_unitdir}/${BPN}.service
     else
         install -d ${D}${sysconfdir}/init.d
@@ -66,8 +72,8 @@ do_install:append() {
         sed -i \
             -e 's|@BINDIR@|${bindir}|g' \
             -e 's|@BINARY_NAME@|${EX_BINARY_NAME}|g' \
-            -e 's|@USER@|${BPN}|g' \
-            -e 's|@GROUP@|${BPN}|g' \
+            -e 's|@USER@|${EX_SERVICE_USER}|g' \
+            -e 's|@GROUP@|${EX_SERVICE_USER}|g' \
             ${D}${sysconfdir}/init.d/${BPN}
     fi
 }
diff --git a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
index e363f31af2..8802839702 100644
--- a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
+++ b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
@@ -14,6 +14,9 @@ project(cmake-example
 option(BUILD_SHARED_LIBS "Build using shared libraries" ON)
 option(FAILING_TEST "Compile a failing unit test to test the test infrastructure" OFF)
 
+set(BINARY_NAME "cmake-example" CACHE STRING "Name of the installed executable and library prefix")
+set(TEST_BINARY_NAME "test-cmake-example" CACHE STRING "Name of the installed test executable")
+
 set(CMAKE_CXX_STANDARD 17)
 set(CMAKE_CXX_STANDARD_REQUIRED On)
 set(CMAKE_CXX_EXTENSIONS Off)
@@ -21,7 +24,7 @@ set(CMAKE_CXX_EXTENSIONS Off)
 include(GNUInstallDirs)
 
 # Define the config file path as a constant
-set(CPP_EXAMPLE_CONFIG_PATH "${CMAKE_INSTALL_FULL_SYSCONFDIR}/cmake-example.conf")
+set(CPP_EXAMPLE_CONFIG_PATH "${CMAKE_INSTALL_FULL_SYSCONFDIR}/${BINARY_NAME}.conf")
 
 # Generate config.h from config.h.in
 configure_file(config.h.in config.h @ONLY)
@@ -30,44 +33,44 @@ configure_file(config.h.in config.h @ONLY)
 find_package(json-c)
 
 # A simple library linking json-c library found by pkgconfig
-add_library(cmake-example-lib cpp-example-lib.cpp cpp-example-lib.hpp)
-set_target_properties(cmake-example-lib PROPERTIES
+add_library(${BINARY_NAME}-lib cpp-example-lib.cpp cpp-example-lib.hpp)
+set_target_properties(${BINARY_NAME}-lib PROPERTIES
     VERSION ${PROJECT_VERSION}
     SOVERSION ${PROJECT_VERSION_MAJOR}
 )
 
 # Add the build directory to include path for config.h
-target_include_directories(cmake-example-lib PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
+target_include_directories(${BINARY_NAME}-lib PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
 
-target_link_libraries(cmake-example-lib PRIVATE json-c::json-c)
+target_link_libraries(${BINARY_NAME}-lib PRIVATE json-c::json-c)
 
-install(TARGETS cmake-example-lib
+install(TARGETS ${BINARY_NAME}-lib
     INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
     ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
 )
 
 # A simple executable linking the library
-add_executable(cmake-example cpp-example.cpp)
-target_include_directories(cmake-example PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
-target_link_libraries(cmake-example PRIVATE cmake-example-lib)
+add_executable(${BINARY_NAME} cpp-example.cpp)
+target_include_directories(${BINARY_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
+target_link_libraries(${BINARY_NAME} PRIVATE ${BINARY_NAME}-lib)
 
-install(TARGETS cmake-example
+install(TARGETS ${BINARY_NAME}
     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
 )
 
 # A simple test executable for testing the library
-add_executable(test-cmake-example test-cpp-example.cpp)
-target_include_directories(test-cmake-example PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
-target_link_libraries(test-cmake-example PRIVATE cmake-example-lib)
+add_executable(${TEST_BINARY_NAME} test-cpp-example.cpp)
+target_include_directories(${TEST_BINARY_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
+target_link_libraries(${TEST_BINARY_NAME} PRIVATE ${BINARY_NAME}-lib)
 
 if (FAILING_TEST)
-    target_compile_definitions(test-cmake-example PRIVATE FAIL_COMPARISON_STR="foo")
+    target_compile_definitions(${TEST_BINARY_NAME} PRIVATE FAIL_COMPARISON_STR="foo")
 endif(FAILING_TEST)
 
-install(TARGETS test-cmake-example
+install(TARGETS ${TEST_BINARY_NAME}
     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
 )
 
 include(CTest)
-add_test(NAME test-cmake-example COMMAND test-cmake-example)
+add_test(NAME ${TEST_BINARY_NAME} COMMAND ${TEST_BINARY_NAME})
diff --git a/meta-selftest/recipes-test/cpp/files/meson.build b/meta-selftest/recipes-test/cpp/files/meson.build
index 53248c4380..3cb4669dfa 100644
--- a/meta-selftest/recipes-test/cpp/files/meson.build
+++ b/meta-selftest/recipes-test/cpp/files/meson.build
@@ -16,8 +16,11 @@ if get_option('FAILING_TEST').enabled()
     add_project_arguments('-DFAIL_COMPARISON_STR=foo', language: 'cpp')
 endif
 
+binary_name = get_option('BINARY_NAME')
+test_binary_name = get_option('TEST_BINARY_NAME')
+
 # Generate config.h from config.h.in
-config_path = get_option('sysconfdir') / 'meson-example.conf'
+config_path = get_option('sysconfdir') / get_option('CONFIG_FILE_NAME')
 conf_data = configuration_data()
 conf_data.set('CPP_EXAMPLE_CONFIG_PATH', config_path)
 configure_file(input : 'config.h.in',
@@ -27,7 +30,7 @@ configure_file(input : 'config.h.in',
 # Include the build directory for config.h
 inc_dir = include_directories('.')
 
-mesonexlib = shared_library('mesonexlib',
+exlib = shared_library(binary_name + 'lib',
     'cpp-example-lib.cpp', 'cpp-example-lib.hpp',
     version: meson.project_version(),
     soversion: meson.project_version().split('.')[0],
@@ -36,18 +39,18 @@ mesonexlib = shared_library('mesonexlib',
     install : true
     )
 
-executable('mesonex',
+executable(binary_name,
     'cpp-example.cpp',
-    link_with : mesonexlib,
+    link_with : exlib,
     include_directories : inc_dir,
     install : true
     )
 
-test_mesonex = executable('test-mesonex',
+test_exe = executable(test_binary_name,
     'test-cpp-example.cpp',
-    link_with : mesonexlib,
+    link_with : exlib,
     include_directories : inc_dir,
     install : true
 )
 
-test('meson example test', test_mesonex)
+test('meson example test', test_exe)
diff --git a/meta-selftest/recipes-test/cpp/files/meson.options b/meta-selftest/recipes-test/cpp/files/meson.options
index 58a0bf9e61..374e346197 100644
--- a/meta-selftest/recipes-test/cpp/files/meson.options
+++ b/meta-selftest/recipes-test/cpp/files/meson.options
@@ -1,3 +1,9 @@
 
 option('FAILING_TEST', type : 'feature', value : 'disabled',
     description : 'Compile a failing unit test to test the test infrastructure')
+option('BINARY_NAME', type : 'string', value : 'mesonex',
+    description : 'Name of the installed executable')
+option('TEST_BINARY_NAME', type : 'string', value : 'test-mesonex',
+    description : 'Name of the installed test executable')
+option('CONFIG_FILE_NAME', type : 'string', value : 'meson-example.conf',
+    description : 'Configuration file name in sysconfdir')
diff --git a/meta-selftest/recipes-test/cpp/meson-example/run-ptest b/meta-selftest/recipes-test/cpp/files/run-ptest
similarity index 51%
rename from meta-selftest/recipes-test/cpp/meson-example/run-ptest
rename to meta-selftest/recipes-test/cpp/files/run-ptest
index b1804f0096..62c24db04f 100644
--- a/meta-selftest/recipes-test/cpp/meson-example/run-ptest
+++ b/meta-selftest/recipes-test/cpp/files/run-ptest
@@ -5,6 +5,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-test-mesonex
+@TEST_BINARY_NAME@
 
-# Note: run-ptests exits with exit value from test-mesonex
+# Note: run-ptest exits with exit value from @TEST_BINARY_NAME@
diff --git a/meta-selftest/recipes-test/cpp/meson-example-clang.bb b/meta-selftest/recipes-test/cpp/meson-example-clang.bb
new file mode 100644
index 0000000000..341ade21f9
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/meson-example-clang.bb
@@ -0,0 +1,13 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A C++ example compiled with meson and clang."
+
+require meson-example.inc
+
+TOOLCHAIN = "clang"
+EX_BINARY_NAME = "mesonex-clang"
+EX_SERVICE_USER = "meson-example"
diff --git a/meta-selftest/recipes-test/cpp/meson-example.bb b/meta-selftest/recipes-test/cpp/meson-example.bb
index da0ea18376..b2335f5c26 100644
--- a/meta-selftest/recipes-test/cpp/meson-example.bb
+++ b/meta-selftest/recipes-test/cpp/meson-example.bb
@@ -4,26 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-SUMMARY = "A C++ example compiled with meson."
+SUMMARY = "A C++ example compiled with meson and GCC."
 
-require cpp-example.inc
+require meson-example.inc
 
-SRC_URI += "\
-    file://meson.build \
-    file://meson.options \
-"
-
-inherit pkgconfig meson
-
-PACKAGECONFIG[failing_test] = "-DFAILING_TEST=enabled"
-
-FILES:${PN}-ptest += "${bindir}/test-mesonex"
-
-do_run_tests () {
-    meson test -C "${B}" --no-rebuild
-}
-do_run_tests[doc] = "Run meson test using qemu-user"
-
-addtask do_run_tests after do_compile
-
-EX_BINARY_NAME = "mesonex"
+TOOLCHAIN = "gcc"
diff --git a/meta-selftest/recipes-test/cpp/meson-example.inc b/meta-selftest/recipes-test/cpp/meson-example.inc
new file mode 100644
index 0000000000..2937be27f8
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/meson-example.inc
@@ -0,0 +1,36 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A C++ example compiled with meson."
+
+require cpp-example.inc
+
+SRC_URI += "\
+    file://meson.build \
+    file://meson.options \
+"
+
+inherit pkgconfig meson
+
+PACKAGECONFIG[failing_test] = "-DFAILING_TEST=enabled"
+
+# Support installing all recipes variants in parallel
+EXTRA_OEMESON += "\
+    -DBINARY_NAME=${EX_BINARY_NAME} \
+    -DTEST_BINARY_NAME=${EX_TEST_BINARY_NAME} \
+    -DCONFIG_FILE_NAME=${BPN}.conf \
+"
+
+FILES:${PN}-ptest += "${bindir}/${EX_TEST_BINARY_NAME}"
+
+do_run_tests () {
+    meson test -C "${B}" --no-rebuild
+}
+do_run_tests[doc] = "Run meson test using qemu-user"
+
+addtask do_run_tests after do_compile
+
+EX_BINARY_NAME = "mesonex"
-- 
2.53.0


