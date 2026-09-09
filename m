Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D6C88E4F
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94.1788990824703066965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=fVfm2/xm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202609092153425b0f44b7890002079c-wccjll@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202609092153425b0f44b7890002079c
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=swIIop4HE5gLWTFBh/A5sjz/Y/KPx3eNHSMKyyvqnXU=;
 b=fVfm2/xmPWTnSziFamxGTB6CovLnldDiWmTZvEd4QgZDbwRGK3m+kfE9VUQBdWcelxAtr+
 6fue2QMYuZpHoO3azXT2702lyegcbGfKgnWknzQD2JWwsqWAgV/8RQ+YLNZMwDiBioLkitFV
 mYKQP3DHw3PFdEtaIKBW9gGhsvDXaxfyH5D6DSRxISiZganSBed2RahGpTT8HqjI/tcxFaEL
 3E8Ncd94hugNyeKeeaFUHLTR0aP6WqmN+3XPrmNdMxU3MX80dB/dPasA1W0dKAK0PVMZiq5g
 pr+O99VNSlmPtjc9jJjUhultoV32B7BiIraeWi59rjuwTxgb4vLfOgQw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 09/15] cpp-example: fix clang-tidy warnings
Date: Wed,  9 Sep 2026 23:53:09 +0200
Message-ID: <20260909215337.89106-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245513

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Just run clang-tidy, fixing warnings and applying the configured checks.
Add also the .clang-tidy configuration file.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

cmake-example: add .clang-tidy configuration file

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/cpp/cpp-example.inc          |  1 +
 .../recipes-test/cpp/files/.clang-tidy        | 33 +++++++++++++++++++
 .../cpp/files/cpp-example-lib.hpp             |  3 +-
 .../recipes-test/cpp/files/cpp-example.cpp    |  1 +
 .../cpp/files/test-cpp-example.cpp            |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 20 +++++------
 6 files changed, 48 insertions(+), 12 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/.clang-tidy

diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index 603040d123..5800f804e1 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -23,6 +23,7 @@ SRC_URI = "\
     file://cpp-example.service \
     file://cpp-example.init \
     file://.clang-format \
+    file://.clang-tidy \
     file://run-ptest \
 "
 
diff --git a/meta-selftest/recipes-test/cpp/files/.clang-tidy b/meta-selftest/recipes-test/cpp/files/.clang-tidy
new file mode 100644
index 0000000000..d1cafb1fe6
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/.clang-tidy
@@ -0,0 +1,33 @@
+---
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+Checks: >
+  -*,
+  bugprone-*,
+  -bugprone-easily-swappable-parameters,
+  clang-analyzer-*,
+  modernize-*,
+  -modernize-use-trailing-return-type,
+  performance-*,
+  -performance-avoid-endl,
+  readability-*,
+  -readability-magic-numbers,
+  -readability-identifier-length,
+  -readability-implicit-bool-conversion,
+  -readability-convert-member-functions-to-static,
+  -readability-isolate-declaration
+
+WarningsAsErrors: ''
+HeaderFilterRegex: '.*'
+FormatStyle: file
+
+CheckOptions:
+  - key: readability-identifier-naming.VariableCase
+    value: lower_case
+  - key: readability-identifier-naming.FunctionCase
+    value: lower_case
+  - key: readability-identifier-naming.StructCase
+    value: CamelCase
+  - key: readability-identifier-naming.ClassCase
+    value: CamelCase
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
index 5af30e2a79..7318d4db84 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
@@ -12,13 +12,14 @@
 
 struct CppExample
 {
+    // NOLINTNEXTLINE(bugprone-throwing-static-initialization) -- exercises debugger handling of a lazy-init static member, see devtool ide-sdk tests
     inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
 
     /* Header-only function, to exercise breakpoint resolution against
      * header-only debug info. volatile prevents compiler optimization from
      * eliminating the function body, ensuring a concrete code location exists
      * for debugger breakpoints. */
-    inline static int scale_number(int n)
+    static int scale_number(int n)
     {
         volatile int scaled = n * 7;
         std::cout << "scale_number(" << n << ") = " << scaled << std::endl;
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
index af7a8c2d73..c14def288c 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -113,6 +113,7 @@ int main(int argc, char *argv[])
     log_info(std::string("Linking json-c version ") + cpp_example.get_json_c_version());
     cpp_example.print_json();
 
+    // NOLINTNEXTLINE(bugprone-infinite-loop) -- intentionally endless when requested; stopped externally (e.g. systemd stop/SIGTERM)
     do {
         // Read and print message from config file
         std::string config_message = cpp_example.read_config_message();
diff --git a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
index d8f2547e88..69dc2fe6d5 100644
--- a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
@@ -17,7 +17,7 @@ int main()
 {
     auto cpp_example = CppExample();
     auto ret_string = cpp_example.get_string();
-    if (0 == ret_string.compare(CppExample::test_string + FAIL_COMPARISON_STR)) {
+    if (ret_string == CppExample::test_string + FAIL_COMPARISON_STR) {
         std::cout << "PASS: " << ret_string << " = " << CppExample::test_string << std::endl;
     } else {
         std::cout << "FAIL: " << ret_string << " != " << CppExample::test_string << std::endl;
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 38eb9b3905..1cc9843a72 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3312,8 +3312,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             cpp_code = file.read()
             cpp_code = cpp_code.replace(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
             cpp_code = cpp_code.replace(
-                "    inline static int scale_number(int n)",
-                extra_lines + "    inline static int scale_number(int n)")
+                "    static int scale_number(int n)",
+                extra_lines + "    static int scale_number(int n)")
         with open(cpp_example_lib_hpp, 'w') as file:
             file.write(cpp_code)
 
@@ -3362,8 +3362,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
         # the first _gdb_cross_debugging_multi call above.
         self._gdb_cross_debugging_multi(
             qemu, recipe_name, example_exe, MAGIC_STRING_NEW,
-            exe_break_line=136 + LINE_SHIFT, exe_list_line=128 + LINE_SHIFT,
-            hpp_break_line=21 + LINE_SHIFT, lib_break_line=31 + LINE_SHIFT)
+            exe_break_line=136 + LINE_SHIFT, exe_list_line=129 + LINE_SHIFT,
+            hpp_break_line=24 + LINE_SHIFT, lib_break_line=31 + LINE_SHIFT)
 
     def _verify_cmake_preset(self, tempdir):
         """Verify the generated cmake preset works as expected
@@ -3532,14 +3532,14 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertIn("GNU gdb", r.output)
 
     def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run",
-                              exe_break_line=136, exe_list_line=128, hpp_break_line=21,
+                              exe_break_line=136, exe_list_line=129, hpp_break_line=24,
                               lib_break_line=31):
         """Get a series of gdb commands to debug the cpp-example-lib example"""
         gdb_batch_cmd = " -ex 'break main' -ex '%s'" % gdb_start_cmd
         gdb_batch_cmd += " -ex 'break CppExample::print_json()' -ex 'continue'"
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
-        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:15,15'"
+        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:16,16'"
 
         # Break inside the library's own .cpp file by file:line (not by
         # symbol), while still inside the print_json() call reached above.
@@ -3578,7 +3578,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         gdb_batch_cmd += " -ex 'continue'"
         return gdb_batch_cmd
 
-    def _gdb_debug_cpp_example_check(self, gdb_output, magic_string, exe_list_line=128, lib_break_line=31):
+    def _gdb_debug_cpp_example_check(self, gdb_output, magic_string, exe_list_line=129, lib_break_line=31):
         self.assertIn("Breakpoint 1, main", gdb_output)
         self.assertIn("$1 = 0", gdb_output)  # test.string.compare equal
         self.assertIn("$2 = -3", gdb_output)  # test.string.compare longer
@@ -3606,7 +3606,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertIn("exited normally", gdb_output)
 
     def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string,
-                                   exe_break_line=136, exe_list_line=128, hpp_break_line=21,
+                                   exe_break_line=136, exe_list_line=129, hpp_break_line=24,
                                    lib_break_line=31):
         """Verify gdb-cross is working
 
@@ -4814,8 +4814,8 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
             cpp_code = file.read()
         cpp_code = cpp_code.replace(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, magic_string_new)
         cpp_code = cpp_code.replace(
-            "    inline static int scale_number(int n)",
-            extra_lines + "    inline static int scale_number(int n)")
+            "    static int scale_number(int n)",
+            extra_lines + "    static int scale_number(int n)")
         with open(cpp_example_lib_hpp, 'w') as file:
             file.write(cpp_code)
 
-- 
2.55.0


