Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1F3C5DF7F
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:43 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15972.1786909295039451254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=R93DKiEO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202608161941326a0282231b0002070f-81p7oe@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202608161941326a0282231b0002070f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7ooL3TjiP+EQUjZTswbaLch11E/e2v5SPkVxkoOC7Dg=;
 b=R93DKiEO8bPOs0/QoLrEgVWyeYfgJRNJSP8oqZW4KDHRNfcg8k2u1Al6eTJChQijcXP8zG
 MI7r+PfPd/68wadK2ayFf0TiEao+fULgytgqQEKLDbeqi9z6VC+u5/OxlWYe/wpgubluSaz3
 JMyTSxP/ME2zwHB1zuvSvASoyJgI9HV/b++vbrCb5YQdnDTU6PMuGVRbMJWsctwisFhUXJW9
 bem9phQDy5/nOnUoKdYR89FXiWkLzYfCph4GAA36vOIXXP8diKzDmJg8BwRTh2ov7KivtzsE
 ukMJpICvzC7vH0Rhl3XR0m/ROVS9F3cN4/NBxqjlESl8pzjWJ3+o56Pw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/14] cpp-example: prevent compiler from eliminating debugger test code
Date: Sun, 16 Aug 2026 21:40:48 +0200
Message-ID: <20260816194127.86607-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243552

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Be more paranoid about compiler optimizations that can eliminate code
that is only used for debugger inspection and update the test
accordingly.

Note: the test was originally written to also check that the compiler
uses e.g. -O0 to avoid eliminating e.g. the vector, but that should
probably be tested separately. Changing this ide-sdk test to use
volatile variables is a more robust way to ensure the vector is not
eliminated, regardless of compiler flags.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/cpp/files/cpp-example-lib.hpp  |  6 ++++--
 .../recipes-test/cpp/files/cpp-example.cpp      | 10 +++++-----
 meta/lib/oeqa/selftest/cases/devtool.py         | 17 +++++++++--------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
index d1c9bca416..5af30e2a79 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
@@ -15,10 +15,12 @@ struct CppExample
     inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
 
     /* Header-only function, to exercise breakpoint resolution against
-     * header-only debug info. */
+     * header-only debug info. volatile prevents compiler optimization from
+     * eliminating the function body, ensuring a concrete code location exists
+     * for debugger breakpoints. */
     inline static int scale_number(int n)
     {
-        int scaled = n * 7;
+        volatile int scaled = n * 7;
         std::cout << "scale_number(" << n << ") = " << scaled << std::endl;
         return scaled;
     }
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
index ad1abae257..a376419c13 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -50,17 +50,17 @@ int main(int argc, char* argv[])
             sleep(1);
         }
     } while (endless_mode);
-
+    volatile int n1 = 1, n2 = 2, n3 = 3;
     // Example: Demonstrate std::vector traversal for debugger inspection
-    std::vector<int> numbers = {1, 2, 3};
+    std::vector<int> numbers = {n1, n2, n3};
     std::cout << "Traversing std::vector<int> numbers:" << std::endl;
     for (size_t i = 0; i < numbers.size(); ++i) {
         std::cout << "numbers[" << i << "] = " << numbers[i] << std::endl;
     }
 
-    // Example: call a header-only function once, to exercise breakpoint
-    // resolution against header-only debug info.
-    CppExample::scale_number(6);
+    // Pass numbers elements as the argument so the compiler cannot eliminate
+    // the vector; 1+2+3 == 6, so the scale_number(n) check is unchanged.
+    CppExample::scale_number(numbers[0] + numbers[1] + numbers[2]);
 
     return 0;
 }
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b1539c342c..1be727d96f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2961,8 +2961,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
         with open(cpp_example_cpp, 'r') as file:
             cpp_code = file.read()
             cpp_code = cpp_code.replace(
-                "    std::vector<int> numbers = {1, 2, 3};",
-                extra_lines + "    std::vector<int> numbers = {1, 2, 3};")
+                "    volatile int n1 = 1, n2 = 2, n3 = 3;",
+                extra_lines + "    volatile int n1 = 1, n2 = 2, n3 = 3;")
         with open(cpp_example_cpp, 'w') as file:
             file.write(cpp_code)
 
@@ -3002,7 +3002,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         # the first _gdb_cross_debugging_multi call above.
         self._gdb_cross_debugging_multi(
             qemu, recipe_name, example_exe, MAGIC_STRING_NEW,
-            exe_break_line=56 + LINE_SHIFT, exe_list_line=55 + LINE_SHIFT,
+            exe_break_line=63 + LINE_SHIFT, exe_list_line=55 + LINE_SHIFT,
             hpp_break_line=21 + LINE_SHIFT, lib_break_line=31 + LINE_SHIFT)
 
     def _verify_cmake_preset(self, tempdir):
@@ -3118,7 +3118,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertIn("GNU gdb", r.output)
 
     def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run",
-                              exe_break_line=56, exe_list_line=55, hpp_break_line=21,
+                              exe_break_line=63, exe_list_line=55, hpp_break_line=21,
                               lib_break_line=31):
         """Get a series of gdb commands to debug the cpp-example-lib example"""
         gdb_batch_cmd = " -ex 'break main' -ex '%s'" % gdb_start_cmd
@@ -3142,8 +3142,9 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
         # check if resolving std::vector works with python scripts
         gdb_batch_cmd += " -ex 'list cpp-example.cpp:%d,%d'" % (exe_list_line, exe_list_line)
-        # Break on exe_break_line (the std::cout after the declaration) so the
-        # vector constructor on exe_list_line has already run when GDB stops.
+        # Break on exe_break_line (the scale_number call) so the vector on
+        # exe_list_line is both constructed and referenced; the compiler cannot
+        # eliminate the vector because its elements are passed as the argument.
         # These line numbers shift after the test inserts extra lines and
         # recompiles, proving the breakpoint resolves via the freshly rebuilt
         # debug info rather than a stale, cached line-to-address mapping.
@@ -3180,7 +3181,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
         # check if resolving std::vector works with python scripts
         self.assertRegex(
-            gdb_output, r"%d\s+std::vector<int> numbers = \{1, 2, 3\};" % exe_list_line)
+            gdb_output, r"%d\s+std::vector<int> numbers = \{n1, n2, n3\};" % exe_list_line)
         self.assertIn("$3 = std::vector of length 3, capacity 3 = {1, 2, 3}", gdb_output)
 
         # check that a breakpoint in an inline function defined directly in
@@ -3191,7 +3192,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertIn("exited normally", gdb_output)
 
     def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string,
-                                   exe_break_line=56, exe_list_line=55, hpp_break_line=21,
+                                   exe_break_line=63, exe_list_line=55, hpp_break_line=21,
                                    lib_break_line=31):
         """Verify gdb-cross is working
 
-- 
2.55.0


