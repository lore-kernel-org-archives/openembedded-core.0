Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306FDCA0FFF
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.27272.1693933177169931341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=le+hygce;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so25750025e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933175; x=1694537975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaWuuIUtmaan9OQ7nZXD7CNTUSo25dmTfn2Y4hW5+Sg=;
        b=le+hygceUVI26cHTAzULqENEjVX2EuayqbNE+pdvUwAiTCahgS3kh1H4IcFvr3MhGR
         Dv7d2roSk1USIpzIFGd9g1hu0qtxcJy9FlEuuJHNTi/2rlh1GaD+MYNYtjXCeZl4yb+b
         UdeYDfK7v+pgHVPtfY+cHzkT2InjsLVGR2+6yQu0vE7NyK+1fGFNwDmvgmot0ypww3PO
         +q38QRtKHVdivH9HBKB1E/1a9OOnbgPuhH40duw5RKqUGppjDC8M/QA0KOiivLyzcpdr
         c/8rSx1PkzB2T5j1OIW6c/22SFCz7A7rJRs5xzXkKmKcWiO05h8Gx4++h11bwRazv5xx
         WDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933175; x=1694537975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaWuuIUtmaan9OQ7nZXD7CNTUSo25dmTfn2Y4hW5+Sg=;
        b=Gw+5/Ug7VJ70+rTYw/pe8V/7ARUPPDmo1ootqWnIGInLKE857V661wJVSwxOvowH3o
         FE4p8TP6/9E8eiWk/1367nNzLO1r275lC9DZjCqEHRDQiqb4RCGbfedenPK+StG2pfy8
         7UFaJO3vgzBrDTypkuvoELbFTiuZ9GIiJxBeGCAnSbMROt0czGmbwcYfoDaMiacOolUY
         cPONnZssNTebMnPfd8kj5bdLNnc/LyFwOQr6HcFDUhsO8lObjYW+Fz6T1lXB4YjwTQ+n
         /MWdiOZ+ndksre70JGb89+LD9koozuMQWrSjeONcsMnhZQGoDBRe9NiuJWH4A+e61a/K
         1kCA==
X-Gm-Message-State: AOJu0YwMnFNDZV0Xc0yeDc9rNKo/y4aNVByomluFfwuR4kcFHdhrqplq
	wI0x2agQSgUiXFUCB/KmBiuNmhyYs8Q=
X-Google-Smtp-Source: AGHT+IHL4cuoo1U4coqC3IfGtFw3fqqOX+4hFirCk81+qGBX1EOkV1YlWg7zwzkPs2G1LKhxom5hDw==
X-Received: by 2002:a05:6000:12cc:b0:318:8b5:4159 with SMTP id l12-20020a05600012cc00b0031808b54159mr337580wrx.24.1693933175355;
        Tue, 05 Sep 2023 09:59:35 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 06/14] tests: add a C++ example recipe
Date: Tue,  5 Sep 2023 18:51:15 +0200
Message-ID: <20230905165913.2560907-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187238

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


