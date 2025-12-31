Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38EFEE6458
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 11:47:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83905.1767181666334114938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 03:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=OIbmlTcD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2025123111474395ade3e369000207d5-ujxjdi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025123111474395ade3e369000207d5
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 12:47:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cM6ChC1SB9juDKJdV2HYQPi+YHcHqccAC+KE/OBboAY=;
 b=OIbmlTcDIIlP3+mPd0qJ8TXQ3HCuKWdUYfu6AxO+0P2UvrrJUD/K6EKvYxwk5wEgCBOpoQ
 5D1axJm3Hv6fCwZmPw4Jq3WnAXcFlwpofeh7AXet/MX8IFr3GnGrBsUvme9CKwheAeV8MUIJ
 CHBf7ZKihuzUDpnuB61KUcMQS2f8AwtOWMYc2DTqnnrLZMKPk2HVCB63Y9150mgLe4bY4am9
 GDTSM45OsKwyva7Rodsfq/z6U2kJZNyvpeKlNsRZOX1DLC2G98lz1OTaup8RspimI0Uy2/XR
 j6dqIh/zxDc3ZjkBKra2V0GBUtHQDQ41smIreSysU9sOhG/mELfTOVSA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 03/14] cpp-example: run as a service
Date: Wed, 31 Dec 2025 12:46:33 +0100
Message-ID: <20251231114718.4031606-4-adrian.freihofer@siemens.com>
In-Reply-To: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228734

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend the C++ example to run as systemd/SysV services

This change adds service capability to the existing C++ example without
modifying its original behavior. The example can now run either as:
- One-shot executables (existing behavior)
- Long-running services via systemd or SysV init

The service runs as an unprivileged user/group, demonstrating security
best practices for service development. This introduces additional
complexity to the build process, particularly around proper pseudo usage
in development builds. The implementation includes:
- Service configuration files (systemd .service and SysV init script)
- Dedicated user/group creation with appropriate permissions
- JSON configuration file for runtime customization, owned by the
  service user
- Command-line --endless flag to enable service mode
- Full support for both CMake and Meson build systems

This enhancement enables testing debugger configurations that attach to
running processes, expanding the examples' utility for development tools.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/cpp/cpp-example.inc          | 52 +++++++++++-
 .../recipes-test/cpp/files/CMakeLists.txt     | 14 +++-
 .../recipes-test/cpp/files/config.h.in        | 10 +++
 .../cpp/files/cpp-example-lib.cpp             | 29 +++++++
 .../cpp/files/cpp-example-lib.hpp             |  3 +
 .../recipes-test/cpp/files/cpp-example.conf   |  3 +
 .../recipes-test/cpp/files/cpp-example.cpp    | 38 ++++++++-
 .../recipes-test/cpp/files/cpp-example.init   | 84 +++++++++++++++++++
 .../cpp/files/cpp-example.service             | 12 +++
 .../recipes-test/cpp/files/meson.build        | 18 +++-
 .../cpp/files/test-cpp-example.cpp            |  2 +
 .../recipes-test/cpp/meson-example.bb         |  2 +
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
 13 files changed, 264 insertions(+), 7 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/config.h.in
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.conf
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.init
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.service

diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index 76ff64e87f..2653f45e90 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -16,9 +16,59 @@ SRC_URI = "\
     file://cpp-example-lib.hpp \
     file://cpp-example-lib.cpp \
     file://test-cpp-example.cpp \
+    file://cpp-example.conf \
+    file://config.h.in \
+    file://cpp-example.service \
+    file://cpp-example.init \
     file://run-ptest \
 "
 
 S = "${UNPACKDIR}"
 
-inherit ptest
+inherit ptest useradd systemd update-rc.d
+
+# Systemd and SysV init support
+SYSTEMD_SERVICE:${PN} = "${BPN}.service"
+
+INITSCRIPT_NAME = "${BPN}"
+INITSCRIPT_PARAMS = "defaults 99"
+
+# Create cpp-example user and group
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system ${BPN}"
+USERADD_PARAM:${PN} = "--system --home /var/lib/${BPN} --no-create-home --shell /bin/false --gid ${BPN} ${BPN}"
+
+EX_BINARY_NAME ?= "${BPN}"
+
+do_install:append() {
+    # Install configuration file owned by unprivileged user
+    install -d ${D}${sysconfdir}
+    install -m 0644 -g ${BPN} -o ${BPN} ${S}/cpp-example.conf ${D}${sysconfdir}/${BPN}.conf
+    sed -i -e 's|@BINARY_NAME@|${BPN}|g' ${D}${sysconfdir}/${BPN}.conf
+
+    # Install service files or init scripts and substitute placeholders in service files
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${S}/cpp-example.service ${D}${systemd_system_unitdir}/${BPN}.service
+        sed -i \
+            -e 's|@BINDIR@|${bindir}|g' \
+            -e 's|@BINARY_NAME@|${EX_BINARY_NAME}|g' \
+            -e 's|@USER@|${BPN}|g' \
+            -e 's|@GROUP@|${BPN}|g' \
+            ${D}${systemd_system_unitdir}/${BPN}.service
+    else
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${S}/cpp-example.init ${D}${sysconfdir}/init.d/${BPN}
+        sed -i \
+            -e 's|@BINDIR@|${bindir}|g' \
+            -e 's|@BINARY_NAME@|${EX_BINARY_NAME}|g' \
+            -e 's|@USER@|${BPN}|g' \
+            -e 's|@GROUP@|${BPN}|g' \
+            ${D}${sysconfdir}/init.d/${BPN}
+    fi
+}
+
+FILES:${PN} += " \
+    ${systemd_system_unitdir}/${BPN}.service \
+    ${sysconfdir}/${BPN}.conf \
+"
diff --git a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
index 6fa6917d89..e363f31af2 100644
--- a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
+++ b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
@@ -20,15 +20,25 @@ set(CMAKE_CXX_EXTENSIONS Off)
 
 include(GNUInstallDirs)
 
+# Define the config file path as a constant
+set(CPP_EXAMPLE_CONFIG_PATH "${CMAKE_INSTALL_FULL_SYSCONFDIR}/cmake-example.conf")
+
+# Generate config.h from config.h.in
+configure_file(config.h.in config.h @ONLY)
+
 # Linking a small library makes the example more useful for testing.
 find_package(json-c)
 
 # A simple library linking json-c library found by pkgconfig
 add_library(cmake-example-lib cpp-example-lib.cpp cpp-example-lib.hpp)
-set_target_properties(cmake-example-lib PROPERTIES 
+set_target_properties(cmake-example-lib PROPERTIES
     VERSION ${PROJECT_VERSION}
     SOVERSION ${PROJECT_VERSION_MAJOR}
 )
+
+# Add the build directory to include path for config.h
+target_include_directories(cmake-example-lib PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
+
 target_link_libraries(cmake-example-lib PRIVATE json-c::json-c)
 
 install(TARGETS cmake-example-lib
@@ -39,6 +49,7 @@ install(TARGETS cmake-example-lib
 
 # A simple executable linking the library
 add_executable(cmake-example cpp-example.cpp)
+target_include_directories(cmake-example PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
 target_link_libraries(cmake-example PRIVATE cmake-example-lib)
 
 install(TARGETS cmake-example
@@ -47,6 +58,7 @@ install(TARGETS cmake-example
 
 # A simple test executable for testing the library
 add_executable(test-cmake-example test-cpp-example.cpp)
+target_include_directories(test-cmake-example PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
 target_link_libraries(test-cmake-example PRIVATE cmake-example-lib)
 
 if (FAILING_TEST)
diff --git a/meta-selftest/recipes-test/cpp/files/config.h.in b/meta-selftest/recipes-test/cpp/files/config.h.in
new file mode 100644
index 0000000000..174e266847
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/config.h.in
@@ -0,0 +1,10 @@
+/*
+ * Copyright OpenEmbedded Contributors
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#pragma once
+
+/* Configuration file path */
+#define EXAMPLE_CONFIG_PATH "@CPP_EXAMPLE_CONFIG_PATH@"
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
index d3dc976864..c510a13893 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
@@ -6,6 +6,7 @@
 
 #include <iostream>
 #include <string>
+#include <fstream>
 #include <json-c/json.h>
 #include "cpp-example-lib.hpp"
 
@@ -31,3 +32,31 @@ void CppExample::print_json()
 
     json_object_put(jobj); // Delete the json object
 }
+
+std::string CppExample::read_config_message(const std::string &config_path)
+{
+    std::ifstream config_file(config_path);
+    if (!config_file.is_open()) {
+        return "Error: Could not open config file: " + config_path;
+    }
+
+    std::string config_content((std::istreambuf_iterator<char>(config_file)),
+                               std::istreambuf_iterator<char>());
+    config_file.close();
+
+    struct json_object *jobj = json_tokener_parse(config_content.c_str());
+    if (!jobj) {
+        return "Error: Invalid JSON in config file";
+    }
+
+    struct json_object *message_obj;
+    if (json_object_object_get_ex(jobj, "hello_world_message", &message_obj)) {
+        const char *message = json_object_get_string(message_obj);
+        std::string result = message ? message : "Error: Invalid message format";
+        json_object_put(jobj);
+        return result;
+    }
+
+    json_object_put(jobj);
+    return "Error: 'hello_world_message' not found in config file";
+}
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
index 0ad9e7b7b2..24dd0defb6 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
@@ -7,6 +7,7 @@
 #pragma once
 
 #include <string>
+#include "config.h"
 
 struct CppExample
 {
@@ -18,4 +19,6 @@ struct CppExample
     const char *get_json_c_version();
     /* Call a more advanced function from a library */
     void print_json();
+    /* Read hello world message from config file */
+    std::string read_config_message(const std::string &config_path = EXAMPLE_CONFIG_PATH);
 };
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.conf b/meta-selftest/recipes-test/cpp/files/cpp-example.conf
new file mode 100644
index 0000000000..4a666e5cdd
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.conf
@@ -0,0 +1,3 @@
+{
+  "hello_world_message": "Hello World from @BINARY_NAME@ example config file!"
+}
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
index 9889554e0c..dbf82f15d9 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -7,12 +7,48 @@
 #include "cpp-example-lib.hpp"
 
 #include <iostream>
+#include <unistd.h>
+#include <string>
 
-int main()
+int main(int argc, char* argv[])
 {
+    bool endless_mode = false;
+
+    // Parse command line arguments
+    for (int i = 1; i < argc; i++) {
+        if (std::string(argv[i]) == "--endless") {
+            endless_mode = true;
+        } else if (std::string(argv[i]) == "--help" || std::string(argv[i]) == "-h") {
+            std::cout << "Usage: " << argv[0] << " [OPTIONS]" << std::endl;
+            std::cout << "Options:" << std::endl;
+            std::cout << "  --endless    Run in endless loop mode (for service)" << std::endl;
+            std::cout << "  --help, -h   Show this help message" << std::endl;
+            return 0;
+        }
+    }
+
     auto cpp_example = CppExample();
+
+    if (endless_mode) {
+        std::cout << "Starting cpp-example service in endless mode..." << std::endl;
+    } else {
+        std::cout << "Running cpp-example once..." << std::endl;
+    }
+
     std::cout << "C++ example linking " << cpp_example.get_string() << std::endl;
     std::cout << "Linking json-c version " << cpp_example.get_json_c_version() << std::endl;
     cpp_example.print_json();
+
+    do {
+        // Read and print message from config file
+        std::string config_message = cpp_example.read_config_message();
+        std::cout << "Config file message: " << config_message << std::endl;
+
+        if (endless_mode) {
+            // Sleep for 1 second
+            sleep(1);
+        }
+    } while (endless_mode);
+
     return 0;
 }
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.init b/meta-selftest/recipes-test/cpp/files/cpp-example.init
new file mode 100644
index 0000000000..c154fd1126
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.init
@@ -0,0 +1,84 @@
+#!/bin/sh
+#
+# cpp-example        C++ Example Service
+#
+# chkconfig: 35 99 99
+# description: C++ Example Service daemon
+#
+
+USER="@USER@"
+DAEMON="@BINARY_NAME@"
+DAEMON_PATH="@BINDIR@/$DAEMON"
+DAEMON_ARGS="--endless"
+PIDFILE="/var/run/$DAEMON.pid"
+LOCK_FILE="/var/lock/subsys/$DAEMON"
+
+start() {
+    if [ -f $PIDFILE ]; then
+        echo "$DAEMON is already running."
+        return 1
+    fi
+
+    echo -n "Starting $DAEMON: "
+    start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile \
+        --background --chuid $USER --exec $DAEMON_PATH -- $DAEMON_ARGS
+    RETVAL=$?
+    if [ $RETVAL -eq 0 ]; then
+        echo "OK"
+        touch $LOCK_FILE
+    else
+        echo "FAILED"
+    fi
+    return $RETVAL
+}
+
+stop() {
+    echo -n "Stopping $DAEMON: "
+    start-stop-daemon --stop --quiet --pidfile $PIDFILE
+    RETVAL=$?
+    if [ $RETVAL -eq 0 ]; then
+        echo "OK"
+        rm -f $PIDFILE $LOCK_FILE
+    else
+        echo "FAILED"
+    fi
+    return $RETVAL
+}
+
+status() {
+    if [ -f $PIDFILE ]; then
+        PID=$(cat $PIDFILE)
+        if ps -p $PID > /dev/null 2>&1; then
+            echo "$DAEMON is running (PID: $PID)"
+            return 0
+        else
+            echo "$DAEMON is not running (stale PID file)"
+            return 1
+        fi
+    else
+        echo "$DAEMON is not running"
+        return 1
+    fi
+}
+
+case "$1" in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    restart)
+        stop
+        start
+        ;;
+    status)
+        status
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|status}"
+        exit 1
+        ;;
+esac
+
+exit $?
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.service b/meta-selftest/recipes-test/cpp/files/cpp-example.service
new file mode 100644
index 0000000000..4022fa291a
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=C++ Example Service
+After=network.target
+
+[Service]
+Type=simple
+User=@USER@
+Group=@GROUP@
+ExecStart=@BINDIR@/@BINARY_NAME@ --endless
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-selftest/recipes-test/cpp/files/meson.build b/meta-selftest/recipes-test/cpp/files/meson.build
index 74a0e0173c..53248c4380 100644
--- a/meta-selftest/recipes-test/cpp/files/meson.build
+++ b/meta-selftest/recipes-test/cpp/files/meson.build
@@ -16,23 +16,37 @@ if get_option('FAILING_TEST').enabled()
     add_project_arguments('-DFAIL_COMPARISON_STR=foo', language: 'cpp')
 endif
 
+# Generate config.h from config.h.in
+config_path = get_option('sysconfdir') / 'meson-example.conf'
+conf_data = configuration_data()
+conf_data.set('CPP_EXAMPLE_CONFIG_PATH', config_path)
+configure_file(input : 'config.h.in',
+               output : 'config.h',
+               configuration : conf_data)
+
+# Include the build directory for config.h
+inc_dir = include_directories('.')
+
 mesonexlib = shared_library('mesonexlib',
     'cpp-example-lib.cpp', 'cpp-example-lib.hpp',
-	version: meson.project_version(),
-	soversion: meson.project_version().split('.')[0],
+    version: meson.project_version(),
+    soversion: meson.project_version().split('.')[0],
     dependencies : jsoncdep,
+    include_directories : inc_dir,
     install : true
     )
 
 executable('mesonex',
     'cpp-example.cpp',
     link_with : mesonexlib,
+    include_directories : inc_dir,
     install : true
     )
 
 test_mesonex = executable('test-mesonex',
     'test-cpp-example.cpp',
     link_with : mesonexlib,
+    include_directories : inc_dir,
     install : true
 )
 
diff --git a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
index 83c9bfa844..e1909c3168 100644
--- a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
@@ -22,4 +22,6 @@ int main() {
         std::cout << "FAIL: " << ret_string << " != " << CppExample::test_string << std::endl;
         return 1;
     }
+
+    return 0;
 }
diff --git a/meta-selftest/recipes-test/cpp/meson-example.bb b/meta-selftest/recipes-test/cpp/meson-example.bb
index 14a7ca8dc9..da0ea18376 100644
--- a/meta-selftest/recipes-test/cpp/meson-example.bb
+++ b/meta-selftest/recipes-test/cpp/meson-example.bb
@@ -25,3 +25,5 @@ do_run_tests () {
 do_run_tests[doc] = "Run meson test using qemu-user"
 
 addtask do_run_tests after do_compile
+
+EX_BINARY_NAME = "mesonex"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 9bbba2ec89..681dcee08c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2714,7 +2714,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         $1 = 0
         print CppExample::test_string.compare("cpp-example-lib Magic: 123456789aaa")
         $2 = -3
-        list cpp-example-lib.hpp:13,13
+        list cpp-example-lib.hpp:14,14
         13	    inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
         continue
         """
@@ -2745,7 +2745,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         gdb_batch_cmd += " -ex 'break CppExample::print_json()' -ex 'continue'"
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
-        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:13,13'"
+        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:14,14'"
         gdb_batch_cmd += " -ex 'continue'"
         r = runCmd(gdb_script + gdb_batch_cmd, output_log=self._cmd_logger)
         self.logger.debug("%s %s returned: %s", gdb_script,
-- 
2.52.0


