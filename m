Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE32C624C2
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:26 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17274.1788126560348866703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=SL6/8ZpM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260830214917502b0ff7930002077a-zhenek@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260830214917502b0ff7930002077a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=GvtcMGv1+qUfYqMYpWxrxcwFlDgtWUWmABpeChZgvws=;
 b=SL6/8ZpMkciyqGTCRKCTy+hhB1iUp1poOWuwz3sXlwTkAgWhDfnPsfYAT6Hw9DnLVTMeTI
 H/gl5zzxLQt6zW5aqc5Er7PrqFi5dl3bZJR9eRtl/niIqKrb2netuiZqrNKZZJcp9jAEELyZ
 piwTUeBcpK0GoIKa5wxBuufn7WlPxml/GiLCRU44zhwlGLS9YiiQOGyuPBB43Qzo8qoCZvUq
 bs+psEWJqzlFNXdWMrLzDbwwzAqH2jc1OpK4po0vKIMcUnV7Vyo4siDvE4TqiXQSI/JDekYu
 ph107SAh1x/88AOYTF6luihO0DMpxNZZzRygK4tVzyXMJowRzPcgj0KQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 04/25] cpp-example: fix stuck breakpoints when attaching and daemonize properly
Date: Sun, 30 Aug 2026 23:48:26 +0200
Message-ID: <20260830214912.1346063-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244713

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Attaching gdbserver to the already-running SysV-init-started instance
and then adding a breakpoint left it unbound (grey/hollow) forever,
even though setting the same breakpoint before starting the debugger
worked fine.

Root cause: cpp-example.init started the daemon via
`start-stop-daemon --background`, which double-forks to detach from
the terminal. That leaves the final daemon process in a process group
whose leader has already exited, i.e. its pgid no longer equals its
own pid. gdbserver's remote-interrupt mechanism pauses a running
inferior with `kill(-pid, SIGINT)` (signal the whole process group);
with a mismatched pgid this fails silently (ESRCH), GDB's
`-exec-interrupt` never actually stops the target, and MIEngine's
pending-breakpoint bind times out and reports it as unbound.

Fix by dropping the double-fork daemonization we inherited from
`start-stop-daemon`/SysV-init cargo culting in favor of the classic,
correct Unix daemon recipe: a single fork() + setsid(), which makes
the process its own session AND process-group leader (pgid == pid)
and keeps gdbserver's SIGINT-to-process-group interrupt working. As
part of doing this properly:

- cpp-example itself now daemonizes (--daemonize), writes its own
  pidfile (--pidfile), and drops root privileges (--uid/--gid)
  instead of depending on start-stop-daemon/su for that.
- stdio is redirected to /dev/null after setsid() so the service
  actually releases the console instead of holding it open forever.
- Since stdio is gone once daemonized, log through syslog instead so
  the service's messages aren't silently discarded.
- All of this legacy SysV-init-only behavior lives in a new
  daemonize.cpp/.hpp, compiled in only when WITH_SYSTEMD is off;
  under systemd (Type=simple) none of it is needed since systemd
  already daemonizes, drops privileges, and tracks the pid itself.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/cpp/cmake-example.inc        |  1 +
 .../recipes-test/cpp/cpp-example.inc          |  4 +
 .../recipes-test/cpp/files/CMakeLists.txt     |  6 ++
 .../recipes-test/cpp/files/cpp-example.cpp    | 91 +++++++++++++++++--
 .../recipes-test/cpp/files/cpp-example.init   | 10 +-
 .../recipes-test/cpp/files/daemonize.cpp      | 57 ++++++++++++
 .../recipes-test/cpp/files/daemonize.hpp      | 27 ++++++
 .../recipes-test/cpp/files/meson.build        |  9 +-
 .../recipes-test/cpp/files/meson.options      |  2 +
 .../recipes-test/cpp/meson-example.inc        |  1 +
 meta/lib/oeqa/selftest/cases/devtool.py       |  8 +-
 11 files changed, 198 insertions(+), 18 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/daemonize.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/daemonize.hpp

diff --git a/meta-selftest/recipes-test/cpp/cmake-example.inc b/meta-selftest/recipes-test/cpp/cmake-example.inc
index eb023d389a..38d53af7b8 100644
--- a/meta-selftest/recipes-test/cpp/cmake-example.inc
+++ b/meta-selftest/recipes-test/cpp/cmake-example.inc
@@ -11,6 +11,7 @@ SRC_URI += "file://CMakeLists.txt"
 inherit cmake-qemu
 
 PACKAGECONFIG[failing_test] = "-DFAILING_TEST=ON"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF"
 
 # Support installing all recipe variants in parallel
 EXTRA_OECMAKE += "\
diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index 0070d17201..3934345f17 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -15,6 +15,8 @@ SRC_URI = "\
     file://cpp-example.cpp \
     file://cpp-example-lib.hpp \
     file://cpp-example-lib.cpp \
+    file://daemonize.cpp \
+    file://daemonize.hpp \
     file://test-cpp-example.cpp \
     file://cpp-example.conf \
     file://config.h.in \
@@ -33,6 +35,8 @@ SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 INITSCRIPT_NAME = "${BPN}"
 INITSCRIPT_PARAMS = "defaults 99"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
 # Create cpp-example user and group
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "--system ${EX_SERVICE_USER}"
diff --git a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
index 8802839702..e063bdafb3 100644
--- a/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
+++ b/meta-selftest/recipes-test/cpp/files/CMakeLists.txt
@@ -13,6 +13,7 @@ project(cmake-example
 
 option(BUILD_SHARED_LIBS "Build using shared libraries" ON)
 option(FAILING_TEST "Compile a failing unit test to test the test infrastructure" OFF)
+option(WITH_SYSTEMD "Target is managed by systemd: skip the legacy SysV daemonize/pidfile/privilege-drop code" OFF)
 
 set(BINARY_NAME "cmake-example" CACHE STRING "Name of the installed executable and library prefix")
 set(TEST_BINARY_NAME "test-cmake-example" CACHE STRING "Name of the installed test executable")
@@ -54,6 +55,11 @@ install(TARGETS ${BINARY_NAME}-lib
 add_executable(${BINARY_NAME} cpp-example.cpp)
 target_include_directories(${BINARY_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
 target_link_libraries(${BINARY_NAME} PRIVATE ${BINARY_NAME}-lib)
+if (WITH_SYSTEMD)
+    target_compile_definitions(${BINARY_NAME} PRIVATE WITH_SYSTEMD)
+else()
+    target_sources(${BINARY_NAME} PRIVATE daemonize.cpp daemonize.hpp)
+endif(WITH_SYSTEMD)
 
 install(TARGETS ${BINARY_NAME}
     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
index a376419c13..f18911554c 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -6,44 +6,117 @@
 
 #include "cpp-example-lib.hpp"
 
+#include <cstdlib>
 #include <iostream>
 #include <unistd.h>
 #include <string>
 #include <vector>
 
+#ifndef WITH_SYSTEMD
+#include <sys/types.h>
+#include <syslog.h>
+
+#include "daemonize.hpp"
+#endif
+
+namespace {
+
+#ifndef WITH_SYSTEMD
+bool g_use_syslog = false;
+#endif
+
+// Prints an informational message. Under systemd, stdout is already captured
+// by the journal. Otherwise, use stdout until daemonized (stdio is then
+// redirected to /dev/null), and syslog afterwards so messages aren't lost.
+void log_info(const std::string& msg)
+{
+#ifndef WITH_SYSTEMD
+    if (g_use_syslog) {
+        syslog(LOG_INFO, "%s", msg.c_str());
+        return;
+    }
+#endif
+    std::cout << msg << std::endl;
+}
+
+} // namespace
+
 int main(int argc, char* argv[])
 {
     bool endless_mode = false;
+#ifndef WITH_SYSTEMD
+    bool daemonize_mode = false;
+    std::string pidfile_path;
+    bool have_uid = false;
+    bool have_gid = false;
+    uid_t target_uid = 0;
+    gid_t target_gid = 0;
+#endif
 
     // Parse command line arguments
     for (int i = 1; i < argc; i++) {
-        if (std::string(argv[i]) == "--endless") {
+        std::string arg = argv[i];
+        if (arg == "--endless") {
             endless_mode = true;
-        } else if (std::string(argv[i]) == "--help" || std::string(argv[i]) == "-h") {
+#ifndef WITH_SYSTEMD
+        } else if (arg == "--daemonize") {
+            daemonize_mode = true;
+        } else if (arg == "--pidfile" && i + 1 < argc) {
+            pidfile_path = argv[++i];
+        } else if (arg == "--uid" && i + 1 < argc) {
+            target_uid = static_cast<uid_t>(std::strtoul(argv[++i], nullptr, 10));
+            have_uid = true;
+        } else if (arg == "--gid" && i + 1 < argc) {
+            target_gid = static_cast<gid_t>(std::strtoul(argv[++i], nullptr, 10));
+            have_gid = true;
+#endif
+        } else if (arg == "--help" || arg == "-h") {
             std::cout << "Usage: " << argv[0] << " [OPTIONS]" << std::endl;
             std::cout << "Options:" << std::endl;
-            std::cout << "  --endless    Run in endless loop mode (for service)" << std::endl;
-            std::cout << "  --help, -h   Show this help message" << std::endl;
+            std::cout << "  --endless          Run in endless loop mode (for service)" << std::endl;
+#ifndef WITH_SYSTEMD
+            std::cout << "  --daemonize        Detach from the controlling terminal" << std::endl;
+            std::cout << "  --pidfile <path>   Write the daemon's PID to <path>" << std::endl;
+            std::cout << "  --uid <uid>        Drop root privileges to this user ID" << std::endl;
+            std::cout << "  --gid <gid>        Drop root privileges to this group ID" << std::endl;
+#endif
+            std::cout << "  --help, -h         Show this help message" << std::endl;
             return 0;
         }
     }
 
+#ifndef WITH_SYSTEMD
+    if (daemonize_mode) {
+        daemonize();
+        openlog(argv[0], LOG_PID, LOG_DAEMON);
+        g_use_syslog = true;
+    }
+
+    if (!pidfile_path.empty()) {
+        write_pidfile(pidfile_path);
+    }
+
+    // Drop privileges after daemonizing/writing the pidfile (both may need
+    // root, e.g. to create files under /var/run), but before doing any work.
+    drop_privileges(have_gid, target_gid, have_uid, target_uid);
+#endif
+
     auto cpp_example = CppExample();
 
     if (endless_mode) {
-        std::cout << "Starting cpp-example service in endless mode..." << std::endl;
+        log_info("Starting cpp-example service in endless mode...");
     } else {
-        std::cout << "Running cpp-example once..." << std::endl;
+        log_info("Running cpp-example once...");
     }
 
-    std::cout << "C++ example linking " << cpp_example.get_string() << std::endl;
-    std::cout << "Linking json-c version " << cpp_example.get_json_c_version() << std::endl;
+    log_info("C++ example linking " + cpp_example.get_string());
+    log_info(std::string("Linking json-c version ") + cpp_example.get_json_c_version());
     cpp_example.print_json();
 
     do {
         // Read and print message from config file
         std::string config_message = cpp_example.read_config_message();
-        std::cout << "Config file message: " << config_message << std::endl;
+        log_info("Config file message: " + config_message);
 
         if (endless_mode) {
             // Sleep for 1 second
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.init b/meta-selftest/recipes-test/cpp/files/cpp-example.init
index 30b8486eeb..6ef9aaac38 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.init
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.init
@@ -25,8 +25,7 @@ start() {
     fi
 
     echo -n "Starting $DAEMON: "
-    start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile \
-        --background --chuid $USER --exec $DAEMON_PATH -- $DAEMON_ARGS
+    $DAEMON_PATH --daemonize --pidfile "$PIDFILE" --uid "$(id -u "$USER")" --gid "$(id -g "$USER")" $DAEMON_ARGS
     RETVAL=$?
     if [ $RETVAL -eq 0 ]; then
         echo "OK"
@@ -39,8 +38,11 @@ start() {
 
 stop() {
     echo -n "Stopping $DAEMON: "
-    start-stop-daemon --stop --quiet --pidfile $PIDFILE
-    RETVAL=$?
+    if [ -f "$PIDFILE" ] && kill "$(cat "$PIDFILE")" 2>/dev/null; then
+        RETVAL=0
+    else
+        RETVAL=1
+    fi
     if [ $RETVAL -eq 0 ]; then
         echo "OK"
         rm -f $PIDFILE $LOCK_FILE
diff --git a/meta-selftest/recipes-test/cpp/files/daemonize.cpp b/meta-selftest/recipes-test/cpp/files/daemonize.cpp
new file mode 100644
index 0000000000..7d91259bfa
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/daemonize.cpp
@@ -0,0 +1,57 @@
+/*
+ * Copyright OpenEmbedded Contributors
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include "daemonize.hpp"
+
+#include <cstdlib>
+#include <fcntl.h>
+#include <fstream>
+#include <grp.h>
+#include <unistd.h>
+
+void daemonize()
+{
+    pid_t pid = fork();
+    if (pid < 0) {
+        std::perror("fork");
+        std::exit(1);
+    }
+    if (pid > 0) {
+        _exit(0);
+    }
+    setsid();
+
+    // setsid() only drops the controlling-terminal association; stdio still
+    // points at the console, so redirect it or an --endless service keeps
+    // the console open/busy with its output forever.
+    int null_fd = open("/dev/null", O_RDWR);
+    if (null_fd >= 0) {
+        dup2(null_fd, STDIN_FILENO);
+        dup2(null_fd, STDOUT_FILENO);
+        dup2(null_fd, STDERR_FILENO);
+        if (null_fd > STDERR_FILENO) {
+            close(null_fd);
+        }
+    }
+}
+
+void write_pidfile(const std::string& path)
+{
+    std::ofstream pidfile(path, std::ios::trunc);
+    pidfile << getpid() << std::endl;
+}
+
+void drop_privileges(bool have_gid, gid_t gid, bool have_uid, uid_t uid)
+{
+    if (have_gid && (setgroups(0, nullptr) != 0 || setgid(gid) != 0)) {
+        std::perror("setgid");
+        std::exit(1);
+    }
+    if (have_uid && setuid(uid) != 0) {
+        std::perror("setuid");
+        std::exit(1);
+    }
+}
diff --git a/meta-selftest/recipes-test/cpp/files/daemonize.hpp b/meta-selftest/recipes-test/cpp/files/daemonize.hpp
new file mode 100644
index 0000000000..17d85d690a
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/daemonize.hpp
@@ -0,0 +1,27 @@
+/*
+ * Copyright OpenEmbedded Contributors
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#pragma once
+
+// Legacy SysV-init daemonizing helpers. Not needed (and not built) when
+// WITH_SYSTEMD is set, since systemd already daemonizes, drops privileges,
+// and tracks the pid itself.
+
+#include <string>
+#include <sys/types.h>
+
+// Detaches from the controlling terminal. Uses a single fork (not the classic
+// double-fork) so this process becomes its own session AND process-group
+// leader (pgid == pid); a second fork would hand it off to a child with a
+// stale pgid, which breaks gdbserver's SIGINT-to-process-group interrupt.
+void daemonize();
+
+// Writes the current process's pid to the given path.
+void write_pidfile(const std::string& path);
+
+// Permanently drops from root to the given group/user. Must run gid before
+// uid: once uid is dropped, the process no longer has permission to setgid.
+void drop_privileges(bool have_gid, gid_t gid, bool have_uid, uid_t uid);
diff --git a/meta-selftest/recipes-test/cpp/files/meson.build b/meta-selftest/recipes-test/cpp/files/meson.build
index 3cb4669dfa..620c220dbd 100644
--- a/meta-selftest/recipes-test/cpp/files/meson.build
+++ b/meta-selftest/recipes-test/cpp/files/meson.build
@@ -30,6 +30,13 @@ configure_file(input : 'config.h.in',
 # Include the build directory for config.h
 inc_dir = include_directories('.')
 
+example_sources = ['cpp-example.cpp']
+if get_option('WITH_SYSTEMD').enabled()
+    add_project_arguments('-DWITH_SYSTEMD', language: 'cpp')
+else
+    example_sources += ['daemonize.cpp', 'daemonize.hpp']
+endif
+
 exlib = shared_library(binary_name + 'lib',
     'cpp-example-lib.cpp', 'cpp-example-lib.hpp',
     version: meson.project_version(),
@@ -40,7 +47,7 @@ exlib = shared_library(binary_name + 'lib',
     )
 
 executable(binary_name,
-    'cpp-example.cpp',
+    example_sources,
     link_with : exlib,
     include_directories : inc_dir,
     install : true
diff --git a/meta-selftest/recipes-test/cpp/files/meson.options b/meta-selftest/recipes-test/cpp/files/meson.options
index 374e346197..a507518990 100644
--- a/meta-selftest/recipes-test/cpp/files/meson.options
+++ b/meta-selftest/recipes-test/cpp/files/meson.options
@@ -1,6 +1,8 @@
 
 option('FAILING_TEST', type : 'feature', value : 'disabled',
     description : 'Compile a failing unit test to test the test infrastructure')
+option('WITH_SYSTEMD', type : 'feature', value : 'disabled',
+    description : 'Target is managed by systemd: skip the legacy SysV daemonize/pidfile/privilege-drop code')
 option('BINARY_NAME', type : 'string', value : 'mesonex',
     description : 'Name of the installed executable')
 option('TEST_BINARY_NAME', type : 'string', value : 'test-mesonex',
diff --git a/meta-selftest/recipes-test/cpp/meson-example.inc b/meta-selftest/recipes-test/cpp/meson-example.inc
index 2937be27f8..eb60649636 100644
--- a/meta-selftest/recipes-test/cpp/meson-example.inc
+++ b/meta-selftest/recipes-test/cpp/meson-example.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
 inherit pkgconfig meson
 
 PACKAGECONFIG[failing_test] = "-DFAILING_TEST=enabled"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=enabled,-DWITH_SYSTEMD=disabled"
 
 # Support installing all recipes variants in parallel
 EXTRA_OEMESON += "\
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c0df13b718..87efa1ee80 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3123,7 +3123,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         # the first _gdb_cross_debugging_multi call above.
         self._gdb_cross_debugging_multi(
             qemu, recipe_name, example_exe, MAGIC_STRING_NEW,
-            exe_break_line=63 + LINE_SHIFT, exe_list_line=55 + LINE_SHIFT,
+            exe_break_line=136 + LINE_SHIFT, exe_list_line=128 + LINE_SHIFT,
             hpp_break_line=21 + LINE_SHIFT, lib_break_line=31 + LINE_SHIFT)
 
     def _verify_cmake_preset(self, tempdir):
@@ -3239,7 +3239,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertIn("GNU gdb", r.output)
 
     def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run",
-                              exe_break_line=63, exe_list_line=55, hpp_break_line=21,
+                              exe_break_line=136, exe_list_line=128, hpp_break_line=21,
                               lib_break_line=31):
         """Get a series of gdb commands to debug the cpp-example-lib example"""
         gdb_batch_cmd = " -ex 'break main' -ex '%s'" % gdb_start_cmd
@@ -3285,7 +3285,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         gdb_batch_cmd += " -ex 'continue'"
         return gdb_batch_cmd
 
-    def _gdb_debug_cpp_example_check(self, gdb_output, magic_string, exe_list_line=55, lib_break_line=31):
+    def _gdb_debug_cpp_example_check(self, gdb_output, magic_string, exe_list_line=128, lib_break_line=31):
         self.assertIn("Breakpoint 1, main", gdb_output)
         self.assertIn("$1 = 0", gdb_output)  # test.string.compare equal
         self.assertIn("$2 = -3", gdb_output)  # test.string.compare longer
@@ -3313,7 +3313,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertIn("exited normally", gdb_output)
 
     def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string,
-                                   exe_break_line=63, exe_list_line=55, hpp_break_line=21,
+                                   exe_break_line=136, exe_list_line=128, hpp_break_line=21,
                                    lib_break_line=31):
         """Verify gdb-cross is working
 
-- 
2.55.0


