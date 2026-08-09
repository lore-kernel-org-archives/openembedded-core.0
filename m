Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AB7C5AE49
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:50 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6420.1786268196862820655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=OWhwGUa8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260809093634f6624418e7000207dd-eyjg3t@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260809093634f6624418e7000207dd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9pbURKpOlQRQWcG1YRXrd/UGgghwHAKuKmbAVeC6bLQ=;
 b=OWhwGUa8an7dZxC4U1aYiYeKxLFBgh3vwE+9y9enW1OShPc2+1gEDUYmr7beaKGwD7JYSl
 mi67DYcdqIUfxOVRVaWKdPZBP6KtJ7DJ2lb7G9H9b0MVEq7NqPMIKUJBypEWwAha1iRnNRpm
 kSrrdH7RF9tcvW3mQe+lVimjA+rzINirODf2qZ6Mq4pg+qzinmEFu3qfdx2jruzdLZZU3r8Z
 Jgwww7sondh56dnWjkMsFqK3AWJKS50Cvi/kObEbWbEMvt4+dDPWeduqBH1P/77mb6QJKdw0
 BM1k8utVWywlGasDeP1q1/OHFrUAwJMnjPJUbSDU/bx0SpdBNO/bo6iQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 8/8] cpp-example: prevent compiler from eliminating debugger test code
Date: Sun,  9 Aug 2026 11:35:59 +0200
Message-ID: <20260809093629.3457107-9-adrian.freihofer@siemens.com>
In-Reply-To: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
References: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 09:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243072

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Be more paranoid about compiler optimizations that can eliminate code
that is only used for debugger inspection.

scale_number() in cpp-example-lib.hpp: use 'volatile int scaled' to
prevent the compiler from inlining the function body away entirely,
which left no out-of-line address for a breakpoint.

cpp-example.cpp: initialize the std::vector from volatile variables so
the compiler cannot constant-fold the values and eliminate the for-loop
body.  Pass numbers[0]+numbers[1]+numbers[2] (= 6) as the scale_number
argument to keep the vector live at the call site (exe_break_line=63);
the test assertion '$4 = 6' is unchanged since 1+2+3 == 6.

Update the test accordingly: exe_break_line moves from 56 to 63, the
LINE_SHIFT anchor changes to the volatile declaration line, and the
list-output assertion matches '{n1, n2, n3}'.

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
index 06be7ef2df..7338b85d7f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2975,8 +2975,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
         with open(cpp_example_cpp, 'r') as file:
             cpp_code = file.read()
             cpp_code = cpp_code.replace(
-                "    std::vector<int> numbers = {1, 2, 3};",
-                extra_lines + "    std::vector<int> numbers = {1, 2, 3};")
+                "    volatile int n1 = 1, n2 = 2, n3 = 3;",
+                extra_lines + "    volatile int n1 = 1, n2 = 2, n3 = 3;")
         with open(cpp_example_cpp, 'w') as file:
             file.write(cpp_code)
 
@@ -3016,7 +3016,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         # the first _gdb_cross_debugging_multi call above.
         self._gdb_cross_debugging_multi(
             qemu, recipe_name, example_exe, MAGIC_STRING_NEW,
-            exe_break_line=56 + LINE_SHIFT, exe_list_line=55 + LINE_SHIFT,
+            exe_break_line=63 + LINE_SHIFT, exe_list_line=55 + LINE_SHIFT,
             hpp_break_line=21 + LINE_SHIFT, lib_break_line=31 + LINE_SHIFT)
 
     def _gdb_cross(self):
@@ -3033,7 +3033,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("GNU gdb", r.output)
 
     def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run",
-                              exe_break_line=56, exe_list_line=55, hpp_break_line=21,
+                              exe_break_line=63, exe_list_line=55, hpp_break_line=21,
                               lib_break_line=31):
         """Get a series of gdb commands to debug the cpp-example-lib example"""
         gdb_batch_cmd = " -ex 'break main' -ex '%s'" % gdb_start_cmd
@@ -3057,8 +3057,9 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
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
@@ -3095,7 +3096,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         # check if resolving std::vector works with python scripts
         self.assertRegex(
-            gdb_output, r"%d\s+std::vector<int> numbers = \{1, 2, 3\};" % exe_list_line)
+            gdb_output, r"%d\s+std::vector<int> numbers = \{n1, n2, n3\};" % exe_list_line)
         self.assertIn("$3 = std::vector of length 3, capacity 3 = {1, 2, 3}", gdb_output)
 
         # check that a breakpoint in an inline function defined directly in
@@ -3106,7 +3107,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("exited normally", gdb_output)
 
     def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string,
-                                   exe_break_line=56, exe_list_line=55, hpp_break_line=21,
+                                   exe_break_line=63, exe_list_line=55, hpp_break_line=21,
                                    lib_break_line=31):
         """Verify gdb-cross is working
 
-- 
2.55.0


