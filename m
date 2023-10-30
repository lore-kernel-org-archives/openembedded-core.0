Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4798C4167B
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:32:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.171475.1698701534399499878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5IHkxi4;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40842752c6eso39010645e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698701532; x=1699306332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0qtTiiTupyyGMOCWyNE3lQftOrjLeNFlTAfbjafvsE=;
        b=M5IHkxi4CLq1hBUnk30YfKxsk7etsYMxv+zO7qB+M8GAStIelZB859Pe8iw5JXaLBn
         xkaunFWG2IUXVlDp5M6bnLzgGG9NXHIpGKY6DDoq7jbBFWFU9fnyW4mjZQ81cDG3MXTq
         d/lUV1c2rEjD0OYrQWD0tQGMsZtSns+vD6AgXju4z8K6HxptCrPzB6s5t/6RQiCR1ILE
         wAK0+2MSiucHSnk5z45mFTZFgjyIodMZ8ncEXoZ+r2P2EkMcGwqYdmO/dyuLGARcdjY+
         a3rtY7gNNrVrngXQei4Jh79kp09IbH7kOj5y03+4n0el2TJwFh6C+HL3M7f2I3Tt4E9C
         Sivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701532; x=1699306332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0qtTiiTupyyGMOCWyNE3lQftOrjLeNFlTAfbjafvsE=;
        b=HWZRDiiVrrxb8JO9itWI3PGX3hiT7g64x99y7PirFoG8jlMH+f1ZXCqNNSpa9DHXCy
         FX0u+rOFFzD/KOX7POt7csyWSVw6x+DxogbJ5ho/h/t7XRFUOmGTC3TBToKuS+Dkltn8
         1iBA4w2cqsztGEcFfWGVd//AH2XrRXq45cO4t3QGUNzAgZMXHPxzwdXFjN4XuO2WWWhA
         2488CGWpLEG44e4yJZWkV+aE5X+Z6aHrkH+8M9/PJGGVArfhb3QKUUN8lutPaBDRRQ/7
         fqcoRssCVPrAv4CBcuXfbHsdHjA838nx7cASTTEOpxFWrtsgGugslFVhTsWVteB1wtbU
         vBJA==
X-Gm-Message-State: AOJu0Yw9xXKWhD2tlARill6I+h9NOu2T97wpiJrQpjLjni6X0ROcLJeT
	lAkfQVo99Kx89ApBdYkx9pIkRUtxy0k=
X-Google-Smtp-Source: AGHT+IG36kZozEq+5GpDHqXmOBYQegxkukC75dcaezRP0roreQN1+C8BkKHe9lAeY0eB7Wv7py+rcQ==
X-Received: by 2002:a05:600c:1992:b0:406:53c0:3c71 with SMTP id t18-20020a05600c199200b0040653c03c71mr9351380wmq.37.1698701532502;
        Mon, 30 Oct 2023 14:32:12 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003fc0505be19sm304811wmq.37.2023.10.30.14.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:32:12 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 4/8] tests: add a C++ example recipe
Date: Mon, 30 Oct 2023 22:32:01 +0100
Message-ID: <20231030213205.2824790-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
References: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189816

This simple C++ project supports compilation with cmake, meson and
autotools.
It's supposed to be used with oe-selftest for the devtool ide plugin.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/.gitignore     |  1 +
 .../recipes-test/cpp/autotools-example.bb     | 18 ++++++
 .../cpp/autotools-example/run-ptest           | 10 ++++
 .../recipes-test/cpp/cmake-example.bb         | 17 ++++++
 .../recipes-test/cpp/cmake-example/run-ptest  | 10 ++++
 .../recipes-test/cpp/cpp-example.inc          | 24 ++++++++
 .../recipes-test/cpp/files/CMakeLists.txt     | 60 +++++++++++++++++++
 .../recipes-test/cpp/files/Makefile.am        | 13 ++++
 .../recipes-test/cpp/files/configure.ac       | 11 ++++
 .../cpp/files/cpp-example-lib.cpp             | 17 ++++++
 .../cpp/files/cpp-example-lib.hpp             | 16 +++++
 .../recipes-test/cpp/files/cpp-example.cpp    | 16 +++++
 .../recipes-test/cpp/files/meson.build        | 34 +++++++++++
 .../cpp/files/test-cpp-example.cpp            | 20 +++++++
 .../recipes-test/cpp/meson-example.bb         | 17 ++++++
 .../recipes-test/cpp/meson-example/run-ptest  | 10 ++++
 16 files changed, 294 insertions(+)
 create mode 100644 meta-selftest/recipes-test/cpp/.gitignore
 create mode 100644 meta-selftest/recipes-test/cpp/autotools-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/autotools-example/run-ptest
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 create mode 100644 meta-selftest/recipes-test/cpp/cpp-example.inc
 create mode 100644 meta-selftest/recipes-test/cpp/files/CMakeLists.txt
 create mode 100644 meta-selftest/recipes-test/cpp/files/Makefile.am
 create mode 100644 meta-selftest/recipes-test/cpp/files/configure.ac
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
diff --git a/meta-selftest/recipes-test/cpp/autotools-example.bb b/meta-selftest/recipes-test/cpp/autotools-example.bb
new file mode 100644
index 00000000000..f5d8aa48154
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/autotools-example.bb
@@ -0,0 +1,18 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A C++ example compiled with autotools."
+
+inherit autotools
+
+require cpp-example.inc
+
+SRC_URI += "\
+    file://configure.ac \
+    file://Makefile.am \
+"
+
+FILES:${PN}-ptest += "${bindir}/test-autotools-example"
diff --git a/meta-selftest/recipes-test/cpp/autotools-example/run-ptest b/meta-selftest/recipes-test/cpp/autotools-example/run-ptest
new file mode 100644
index 00000000000..51548259886
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/autotools-example/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+testautoexample
+
+# Note: run-ptests exits with exit value from test-cmake-example
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
diff --git a/meta-selftest/recipes-test/cpp/files/Makefile.am b/meta-selftest/recipes-test/cpp/files/Makefile.am
new file mode 100644
index 00000000000..39cff91d2ac
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/Makefile.am
@@ -0,0 +1,13 @@
+noinst_LIBRARIES = libautoexample.a
+libautoexample_a_SOURCES = cpp-example-lib.cpp
+
+bin_PROGRAMS = autoexample testautoexample
+
+autoexample_SOURCES = cpp-example.cpp
+autoexample_LDADD = libautoexample.a
+
+testautoexample_SOURCES = test-cpp-example.cpp
+testautoexample_LDADD = libautoexample.a
+TESTS=testautoexample
+
+AM_LDFLAGS = -ljson-c
diff --git a/meta-selftest/recipes-test/cpp/files/configure.ac b/meta-selftest/recipes-test/cpp/files/configure.ac
new file mode 100644
index 00000000000..29c6d1ca6fc
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/configure.ac
@@ -0,0 +1,11 @@
+
+AC_INIT([autoexample], [1.0])
+AM_INIT_AUTOMAKE([-Wall -Werror foreign])
+AC_PROG_CXX
+AX_CXX_COMPILE_STDCXX_17
+AC_PROG_RANLIB
+AM_PROG_AR
+AC_CONFIG_FILES([
+    Makefile
+])
+AC_OUTPUT
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
index 00000000000..f9257e1aa2f
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
@@ -0,0 +1,20 @@
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
+        return 1;
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


