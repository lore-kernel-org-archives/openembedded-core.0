Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66160EE49B7
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:43 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.2560.1693002462633881376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YCyikAdh;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so1939165a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002461; x=1693607261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaWuuIUtmaan9OQ7nZXD7CNTUSo25dmTfn2Y4hW5+Sg=;
        b=YCyikAdhpNL5eDxjbOcOJofiCAgoP0gxQaqqtAy9gX8ld4Y9Thwg77ppxbZfNSj72E
         TiHyUQPaZJX86WFbHjff0R/asUa4t5hb8nzIXSnJZx1yqMCkVxCJR/i2f20lRemzFoCv
         OMdiJB+saMCSgIWwd50DASYbY7gvoKvGMNj3KzVN6ARETfP0BZpsCYm41kjLH+Q8u5Ks
         yw3tBlfOuSaqJgtlbAyFgl5tBn2n6AnMbB2ShwlxybDnJZtAyP2DpLA9ZuxfOXWFVZQk
         8NFQ7YW9Rn49+MgSi6njwa87hYOzT751ap2iX/y9YSg+zRL7IxFrAAk9QcZ16+K576KI
         m66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002461; x=1693607261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaWuuIUtmaan9OQ7nZXD7CNTUSo25dmTfn2Y4hW5+Sg=;
        b=M6QHKZCF2IBtF03QVldVkn7E8eQxypOJ2qP/kbm8UW0OSxsggJyXFykMvqYfVo6n5t
         u5o4Urnk5lcM3mPUiYJlwh48uS8sEgLaJKeiWSEWBqNwXejkATALJbHQDCkXqJ2wE/ph
         AfA4LiHGm2EKSyqRU/nZLdfZpQivxWnx6TJnmoxhTtrYJTX8B1KEzP9kVI852oX77WgP
         +V7S0+yKFLF1F3CuwkqWplxsQrjemuoRg43prZ7MEcSNnFY89+DlJFNmHcBQOi4vkYf0
         5j4xlz3/sCqcX2gSymd7Vp3EWoWb1yWDS74LP++RrDPT9xoE6d1RV+435nAmrx1OZjvC
         qC0g==
X-Gm-Message-State: AOJu0YxAuIDZNFp0vJFU3zrGSTP6109ghrLILC5jV+tj9z/C3jNnuo5Z
	CqkTSLL6ZNFqp8cDeO9P+n4J0nIaLZg=
X-Google-Smtp-Source: AGHT+IElVM/J3qYdb67SLRfIydVMNEdvtzY0nPDKtyrackaN32/HWDeVlRmqf0fIM75a0ZadzxD0AQ==
X-Received: by 2002:aa7:d4cc:0:b0:523:d8bf:3298 with SMTP id t12-20020aa7d4cc000000b00523d8bf3298mr14879403edr.17.1693002460689;
        Fri, 25 Aug 2023 15:27:40 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:40 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 06/13] tests: add a C++ example recipe
Date: Sat, 26 Aug 2023 00:25:46 +0200
Message-ID: <20230825222711.2735745-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186733

This simple C++ project supports compilation with cmake and with meson.
It's supposed to be used with oe-selftest for the devtool ide plugin.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/.gitignore     |  1 +
 .../recipes-test/cpp/cmake-example.bb         | 17 ++++++
 .../recipes-test/cpp/cmake-example/run-ptest  | 10 ++++
 .../recipes-test/cpp/cpp-example.inc          | 24 ++++++++
 .../recipes-test/cpp/files/CMakeLists.txt     | 60 +++++++++++++++++++
 .../cpp/files/cpp-example-lib.cpp             | 17 ++++++
 .../cpp/files/cpp-example-lib.hpp             | 16 +++++
 .../recipes-test/cpp/files/cpp-example.cpp    | 16 +++++
 .../recipes-test/cpp/files/meson.build        | 34 +++++++++++
 .../cpp/files/test-cpp-example.cpp            | 19 ++++++
 .../recipes-test/cpp/meson-example.bb         | 17 ++++++
 .../recipes-test/cpp/meson-example/run-ptest  | 10 ++++
 12 files changed, 241 insertions(+)
 create mode 100644 meta-selftest/recipes-test/cpp/.gitignore
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 create mode 100644 meta-selftest/recipes-test/cpp/cpp-example.inc
 create mode 100644 meta-selftest/recipes-test/cpp/files/CMakeLists.txt
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/meson.build
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
index 00000000000..96d543180b4
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/cmake-example.bb
@@ -0,0 +1,17 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A C++ example compiled with cmake."
+
+inherit cmake
+
+require cpp-example.inc
+
+SRC_URI += "\
+    file://CMakeLists.txt \
+"
+
+FILES:${PN}-ptest += "${bindir}/test-cmake-example"
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
index 00000000000..39c61cf4ceb
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
+inherit ptest
+
+DEPENDS += "json-c"
+
+PV = "1.0"
+
+S = "${WORKDIR}"
+
+SRC_URI = "\
+    file://cpp-example.cpp \
+    file://cpp-example-lib.hpp \
+    file://cpp-example-lib.cpp \
+    file://test-cpp-example.cpp \
+    file://run-ptest \
+"
diff --git a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
new file mode 100644
index 00000000000..839aa59b5e3
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
@@ -0,0 +1,60 @@
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
+
+set(CMAKE_CXX_STANDARD 17)
+set(CMAKE_CXX_STANDARD_REQUIRED On)
+set(CMAKE_CXX_EXTENSIONS Off)
+
+include(GNUInstallDirs)
+
+# Find json-c
+# find_package(PkgConfig REQUIRED)
+# pkg_check_modules(JSONC REQUIRED json-c)
+find_package(json-c)
+
+# A simple library linking json-c library found by pkgconfig
+add_library(cmake-example-lib cpp-example-lib.cpp cpp-example-lib.hpp)
+set_target_properties(cmake-example-lib PROPERTIES 
+    VERSION ${PROJECT_VERSION}
+    SOVERSION ${PROJECT_VERSION_MAJOR}
+)
+target_link_libraries(cmake-example-lib PRIVATE json-c::json-c)
+# target_link_libraries(cmake-example-lib ${JSONC_LIBRARIES})
+# target_include_directories(cmake-example-lib PUBLIC ${JSONC_INCLUDE_DIRS})
+# target_compile_options(cmake-example-lib PUBLIC ${JSONC_CFLAGS_OTHER})
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
+install(TARGETS test-cmake-example
+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+)
+
+include(CTest)
+add_test(NAME test-cmake-example COMMAND test-cmake-example)
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
new file mode 100644
index 00000000000..29fd10fb7e1
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
@@ -0,0 +1,17 @@
+/*
+* Copyright OpenEmbedded Contributors
+*
+* SPDX-License-Identifier: MIT
+*/
+
+#include <string>
+#include <json-c/json.h>
+#include "cpp-example-lib.hpp"
+
+const std::string& CppExample::get_string() {
+    return test_string;
+}
+
+const char* CppExample::get_json_c_version() {
+    return json_c_version();
+}
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
new file mode 100644
index 00000000000..8a87e6b510a
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
@@ -0,0 +1,16 @@
+/*
+* Copyright OpenEmbedded Contributors
+*
+* SPDX-License-Identifier: MIT
+*/
+
+#pragma once
+
+#include <string>
+
+struct CppExample {
+    inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
+
+    const std::string& get_string();
+    const char* get_json_c_version();
+};
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
new file mode 100644
index 00000000000..de7f2106dec
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -0,0 +1,16 @@
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
+int main() {
+    auto cpp_example = CppExample();
+    std::cout << "C++ example linking " << cpp_example.get_string() << std::endl;
+    std::cout << "Linking json-c version " << cpp_example.get_json_c_version() << std::endl;
+    return 0;
+}
diff --git a/meta-selftest/recipes-test/cpp/files/meson.build b/meta-selftest/recipes-test/cpp/files/meson.build
new file mode 100644
index 00000000000..7753da69721
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/meson.build
@@ -0,0 +1,34 @@
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
+
+jsoncdep = dependency('json-c')
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
+test('meson example test', test_mesonex)
diff --git a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
new file mode 100644
index 00000000000..ca72e11a9c4
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
@@ -0,0 +1,19 @@
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
+int main() {
+    auto cpp_example = CppExample();
+    auto ret_string = cpp_example.get_string();
+    if(0 == ret_string.compare(CppExample::test_string)) {
+        std::cout << "PASS: " << ret_string << " = " << CppExample::test_string << std::endl;
+    } else {
+        std::cout << "FAIL: " << ret_string << " != " << CppExample::test_string << std::endl;
+    }
+}
diff --git a/meta-selftest/recipes-test/cpp/meson-example.bb b/meta-selftest/recipes-test/cpp/meson-example.bb
new file mode 100644
index 00000000000..f15dbb50731
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/meson-example.bb
@@ -0,0 +1,17 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A C++ example compiled with meson."
+
+inherit pkgconfig meson
+
+require cpp-example.inc
+
+SRC_URI += "\
+    file://meson.build \
+"
+
+FILES:${PN}-ptest += "${bindir}/test-mesonex"
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
2.41.0


