Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACB9C10DCE
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 20:53:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.103260.1701982412777181830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 12:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOxqdHim;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c07ed92fdso14350755e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701982411; x=1702587211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6YXLAuf6RMChsFeAlVFpcjgzmBAUL2Y+E7aa24iWto=;
        b=dOxqdHim8nL832Pdb4dNfpVanS1PkRdIG63fPknVME//QcDQWAmBficB5vhGdk66CN
         PmvszkcG04Dl4xEMO/isWABox4arD99YqTalB7lTOZvl3ZcqwK3GqY3nQkHT0VIz+1Oi
         UukfYIWoDXGA/6MeSyPFgSpoT2horNaksophUZSRE447D3YU5f/UnT9Aiw6ATer6Nvr1
         pl44X35PB077jN3vg8TgPECMgTgMwlJlw6Euv5S4/UVWfXqvMjwkPP0hB+xkkS9m/Naa
         n4m1phMPFP4RfG8mGmIjeOA8bgj9LAqYv8VTI4rXpHRyTasKTOG6LwMusv7ZeEGuGlSQ
         ndQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701982411; x=1702587211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6YXLAuf6RMChsFeAlVFpcjgzmBAUL2Y+E7aa24iWto=;
        b=rraWskvriDDlmM3q9JP/hLWSeq7vmFl1EyHGJbW3kGF1Lnph7SpPYPIp4GRgb9vCZJ
         rBOZbCKvglP8dnhuHss6DtWKjXHdHolV7scPg+Irt+Auy4auAvN6IfMVPUB99SMsgzIu
         JweWMQchZcgJGeXJcDWjfA3RVp3L9upznXPxrBkSu6RRDvyhN696KbS1tl59NS51c5am
         w21Kyr1u4m3OjLAE2vb0t4EPoK1xlKzMEIAK/qsT7lK5zn3MXNXdzvFq7yMQqq1Ut0RY
         oSBXetWN9iTkwHC5hzuGZozS0/ZBz3z1M73d0c2jEeG04YxnJ4jBSHi4TNRcJXWy5o4E
         etgg==
X-Gm-Message-State: AOJu0YwbfmVVN6kOvPPA2pHZR+8+HTGz9jsZBPG5238rvm5sS8x6CpJ7
	5fdR8/HDoplPrrvoKjdZ/rnAVLeay0Q=
X-Google-Smtp-Source: AGHT+IEmyTO9SBvFdHaNb/btvJ+gAzq2Po+aY3nAYPeR0u00AM/OqZ/uZR4RwW9O/pHDJHeVaJWF0A==
X-Received: by 2002:a05:600c:5388:b0:40c:d4d:68ec with SMTP id hg8-20020a05600c538800b0040c0d4d68ecmr1886707wmb.183.1701982410691;
        Thu, 07 Dec 2023 12:53:30 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b004063cd8105csm3032484wmb.22.2023.12.07.12.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:53:30 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/4] oe-selftest: add a cpp-example recipe
Date: Thu,  7 Dec 2023 21:52:49 +0100
Message-ID: <20231207205251.4152034-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
References: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 20:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191974

This simple C++ project supports compilation with CMake and Meson.
(Autotool support could be added later on.)
It's supposed to be used with oe-selftest.

An artificial project has several advantages over compiling a normal
CMake or Meson based project for testing purposes:
- It is much faster because it can be kept minimalistic
- It can cover multiple odd corner cases
- No one will change it in an unpredictable way
- It can support multiple build tools with only one C++ codebase

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/.gitignore     |  1 +
 .../recipes-test/cpp/cmake-example.bb         | 25 ++++++++
 .../recipes-test/cpp/cmake-example/run-ptest  | 10 +++
 .../recipes-test/cpp/cpp-example.inc          | 24 ++++++++
 .../recipes-test/cpp/files/CMakeLists.txt     | 61 +++++++++++++++++++
 .../cpp/files/cpp-example-lib.cpp             | 33 ++++++++++
 .../cpp/files/cpp-example-lib.hpp             | 21 +++++++
 .../recipes-test/cpp/files/cpp-example.cpp    | 18 ++++++
 .../recipes-test/cpp/files/meson.build        | 38 ++++++++++++
 .../recipes-test/cpp/files/meson.options      |  3 +
 .../cpp/files/test-cpp-example.cpp            | 25 ++++++++
 .../recipes-test/cpp/meson-example.bb         | 27 ++++++++
 .../recipes-test/cpp/meson-example/run-ptest  | 10 +++
 13 files changed, 296 insertions(+)
 create mode 100644 meta-selftest/recipes-test/cpp/.gitignore
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 create mode 100644 meta-selftest/recipes-test/cpp/cpp-example.inc
 create mode 100644 meta-selftest/recipes-test/cpp/files/CMakeLists.txt
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/meson.build
 create mode 100644 meta-selftest/recipes-test/cpp/files/meson.options
 create mode 100644 meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example/run-ptest

diff --git a/meta-selftest/recipes-test/cpp/.gitignore b/meta-selftest/recipes-test/cpp/.gitignore
new file mode 100644
index 00000000000..30d388a12b7
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/.gitignore
@@ -0,0 +1 @@
+build*
\ No newline at end of file
diff --git a/meta-selftest/recipes-test/cpp/cmake-example.bb b/meta-selftest/recipes-test/cpp/cmake-example.bb
new file mode 100644
index 00000000000..aecfcf780a3
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/cmake-example.bb
@@ -0,0 +1,25 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A C++ example compiled with cmake."
+
+require cpp-example.inc
+
+SRC_URI += "file://CMakeLists.txt"
+
+inherit cmake-qemu
+
+PACKAGECONFIG[failing_test] = "-DFAILING_TEST=ON"
+
+FILES:${PN}-ptest += "${bindir}/test-cmake-example"
+
+do_run_tests () {
+    bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' --target test -- ${EXTRA_OECMAKE_BUILD}
+    eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' --target test -- ${EXTRA_OECMAKE_BUILD}
+}
+do_run_tests[doc] = "Run cmake --target=test using qemu-user"
+
+addtask do_run_tests after do_compile
diff --git a/meta-selftest/recipes-test/cpp/cmake-example/run-ptest b/meta-selftest/recipes-test/cpp/cmake-example/run-ptest
new file mode 100644
index 00000000000..94b620a1984
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/cmake-example/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+test-cmake-example
+
+# Note: run-ptests exits with exit value from test-cmake-example
diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
new file mode 100644
index 00000000000..ad374be9d08
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -0,0 +1,24 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+DEPENDS += "json-c"
+
+PV = "1.0"
+
+SRC_URI = "\
+    file://cpp-example.cpp \
+    file://cpp-example-lib.hpp \
+    file://cpp-example-lib.cpp \
+    file://test-cpp-example.cpp \
+    file://run-ptest \
+"
+
+S = "${WORKDIR}"
+
+inherit ptest
diff --git a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
new file mode 100644
index 00000000000..6fa6917d89b
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
@@ -0,0 +1,61 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+cmake_minimum_required(VERSION 3.22)
+
+project(cmake-example
+  VERSION 1.0.0
+  LANGUAGES CXX
+)
+
+option(BUILD_SHARED_LIBS "Build using shared libraries" ON)
+option(FAILING_TEST "Compile a failing unit test to test the test infrastructure" OFF)
+
+set(CMAKE_CXX_STANDARD 17)
+set(CMAKE_CXX_STANDARD_REQUIRED On)
+set(CMAKE_CXX_EXTENSIONS Off)
+
+include(GNUInstallDirs)
+
+# Linking a small library makes the example more useful for testing.
+find_package(json-c)
+
+# A simple library linking json-c library found by pkgconfig
+add_library(cmake-example-lib cpp-example-lib.cpp cpp-example-lib.hpp)
+set_target_properties(cmake-example-lib PROPERTIES 
+    VERSION ${PROJECT_VERSION}
+    SOVERSION ${PROJECT_VERSION_MAJOR}
+)
+target_link_libraries(cmake-example-lib PRIVATE json-c::json-c)
+
+install(TARGETS cmake-example-lib
+    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
+    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+)
+
+# A simple executable linking the library
+add_executable(cmake-example cpp-example.cpp)
+target_link_libraries(cmake-example PRIVATE cmake-example-lib)
+
+install(TARGETS cmake-example
+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+)
+
+# A simple test executable for testing the library
+add_executable(test-cmake-example test-cpp-example.cpp)
+target_link_libraries(test-cmake-example PRIVATE cmake-example-lib)
+
+if (FAILING_TEST)
+    target_compile_definitions(test-cmake-example PRIVATE FAIL_COMPARISON_STR="foo")
+endif(FAILING_TEST)
+
+install(TARGETS test-cmake-example
+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+)
+
+include(CTest)
+add_test(NAME test-cmake-example COMMAND test-cmake-example)
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
new file mode 100644
index 00000000000..d3dc976864b
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
@@ -0,0 +1,33 @@
+/*
+ * Copyright OpenEmbedded Contributors
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include <iostream>
+#include <string>
+#include <json-c/json.h>
+#include "cpp-example-lib.hpp"
+
+const std::string &CppExample::get_string()
+{
+    return test_string;
+}
+
+const char *CppExample::get_json_c_version()
+{
+    return json_c_version();
+}
+
+void CppExample::print_json()
+{
+    struct json_object *jobj;
+    const int flag = JSON_C_TO_STRING_SPACED | JSON_C_TO_STRING_PRETTY;
+
+    jobj = json_object_new_object();
+    json_object_object_add(jobj, "test_string", json_object_new_string(test_string.c_str()));
+
+    std::cout << json_object_to_json_string_ext(jobj, flag) << std::endl;
+
+    json_object_put(jobj); // Delete the json object
+}
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
new file mode 100644
index 00000000000..0ad9e7b7b2d
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
@@ -0,0 +1,21 @@
+/*
+ * Copyright OpenEmbedded Contributors
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#pragma once
+
+#include <string>
+
+struct CppExample
+{
+    inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
+
+    /* Retrieve a constant string */
+    const std::string &get_string();
+    /* Retrieve a constant string from a library */
+    const char *get_json_c_version();
+    /* Call a more advanced function from a library */
+    void print_json();
+};
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
new file mode 100644
index 00000000000..9889554e0cb
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -0,0 +1,18 @@
+/*
+ * Copyright OpenEmbedded Contributors
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include "cpp-example-lib.hpp"
+
+#include <iostream>
+
+int main()
+{
+    auto cpp_example = CppExample();
+    std::cout << "C++ example linking " << cpp_example.get_string() << std::endl;
+    std::cout << "Linking json-c version " << cpp_example.get_json_c_version() << std::endl;
+    cpp_example.print_json();
+    return 0;
+}
diff --git a/meta-selftest/recipes-test/cpp/files/meson.build b/meta-selftest/recipes-test/cpp/files/meson.build
new file mode 100644
index 00000000000..0e2b55f3a2b
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/meson.build
@@ -0,0 +1,38 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+project('meson-example', 'cpp',
+    version: '1.0.0',
+    default_options: ['cpp_std=c++17']
+    )
+
+jsoncdep = dependency('json-c')
+
+if get_option('FAILING_TEST').enabled()
+    add_project_arguments('-DFAIL_COMPARISON_STR=foo', language: 'cpp')
+endif
+
+mesonexlib = shared_library('mesonexlib',
+    'cpp-example-lib.cpp', 'cpp-example-lib.hpp',
+	version: meson.project_version(),
+	soversion: meson.project_version().split('.')[0],
+    dependencies : jsoncdep,
+    install : true
+    )
+
+executable('mesonex',
+    'cpp-example.cpp',
+    link_with : mesonexlib,
+    install : true
+    )
+
+test_mesonex = executable('test-mesonex',
+    'test-cpp-example.cpp',
+    link_with : mesonexlib,
+    install : true
+)
+
+test('meson example test', test_mesonex)
diff --git a/meta-selftest/recipes-test/cpp/files/meson.options b/meta-selftest/recipes-test/cpp/files/meson.options
new file mode 100644
index 00000000000..58a0bf9e611
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/meson.options
@@ -0,0 +1,3 @@
+
+option('FAILING_TEST', type : 'feature', value : 'disabled',
+    description : 'Compile a failing unit test to test the test infrastructure')
diff --git a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
new file mode 100644
index 00000000000..83c9bfa8444
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
@@ -0,0 +1,25 @@
+/*
+* Copyright OpenEmbedded Contributors
+*
+* SPDX-License-Identifier: MIT
+*/
+
+#include "cpp-example-lib.hpp"
+
+#include <iostream>
+
+/* This is for creating a failing test for testing the test infrastructure */
+#ifndef FAIL_COMPARISON_STR
+#define FAIL_COMPARISON_STR ""
+#endif
+
+int main() {
+    auto cpp_example = CppExample();
+    auto ret_string = cpp_example.get_string();
+    if(0 == ret_string.compare(CppExample::test_string + FAIL_COMPARISON_STR)) {
+        std::cout << "PASS: " << ret_string << " = " << CppExample::test_string << std::endl;
+    } else {
+        std::cout << "FAIL: " << ret_string << " != " << CppExample::test_string << std::endl;
+        return 1;
+    }
+}
diff --git a/meta-selftest/recipes-test/cpp/meson-example.bb b/meta-selftest/recipes-test/cpp/meson-example.bb
new file mode 100644
index 00000000000..14a7ca8dc91
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/meson-example.bb
@@ -0,0 +1,27 @@
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
+FILES:${PN}-ptest += "${bindir}/test-mesonex"
+
+do_run_tests () {
+    meson test -C "${B}" --no-rebuild
+}
+do_run_tests[doc] = "Run meson test using qemu-user"
+
+addtask do_run_tests after do_compile
diff --git a/meta-selftest/recipes-test/cpp/meson-example/run-ptest b/meta-selftest/recipes-test/cpp/meson-example/run-ptest
new file mode 100644
index 00000000000..b1804f00961
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/meson-example/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+test-mesonex
+
+# Note: run-ptests exits with exit value from test-mesonex
-- 
2.43.0


