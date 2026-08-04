Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDA8C56207
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:53 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14706.1785844843949944663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=OOuE4lxF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202608041200382d0bb286f800020768-kxfs6v@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608041200382d0bb286f800020768
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=k4UPVtFk3W2QlwLQPTx1kP5ShJN+VdbGJTbwMCsrWQk=;
 b=OOuE4lxFmSV/c//ou3ahwH94DqExH5I/AP6RbbrU6QezJZWbckrvRGP17xNyGGm5AL0khz
 wEBOR1NyvfrzriNkue6I2o0OiYdTWHBIHh8S6B2szA0YABwFHNX2uQN343yjwauVAH47qEmi
 /OSQgy9J0/Wk3z5CQLu5RzBz/we3ImnMIIzC/yJpT+Y1X/vGhBv8AUX8I6V8wrR3pORA2xqa
 CMenH3A7op4Vi3BrxpBB9M2c5M0w/1wYhYu4XrVqZltWc7M4ku5Hlz7UYxiMJ5vru6KabGiB
 yF2pqSJBcM5G6uNnUeiSxOFwUeQGj1ZHnEBkmHOAqmixQkZpZ5SQ6HEQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 06/14] oe-selftest: devtool ide-sdk: cover breakpoints in exe, header and library
Date: Tue,  4 Aug 2026 13:59:30 +0200
Message-ID: <20260804120034.378787-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242720

From: Adrian Freihofer <adrian.freihofer@siemens.com>

_gdb_debug_cpp_example() already set breakpoints in the executable
(cpp-example.cpp, by file:line) and the library (CppExample::print_json()
in cpp-example-lib.cpp, by symbol), plus a 'list' (not a breakpoint) of
the test_string declaration in the shared header cpp-example-lib.hpp.
There was no actual breakpoint set on code that lives in the header
itself, and no file:line breakpoint set inside the library's own .cpp
file.

Add CppExample::scale_number(), a trivial inline function defined
directly in cpp-example-lib.hpp (not in a .cpp file), and call it from
cpp-example.cpp's std::vector traversal loop. Set a breakpoint on it by
file:line (cpp-example-lib.hpp, conditioned on n == 1 since the loop
calls it once per vector element) and verify it is hit with the
expected value.

Also set a second, file:line breakpoint directly inside the library's
own print_json() body (cpp-example-lib.cpp), in addition to the
existing symbol breakpoint on print_json() itself. A symbol breakpoint
only needs the function's entry address and resolves the same whether
the debugger picks up stale or freshly rebuilt debug info for the
library, since it doesn't rely on the library's own line-to-address
mapping being fresh; a file:line breakpoint does, making it the only
breakpoint in this test that actually exercises solib-search-path debug
info resolution for the library.

The second _gdb_cross_debugging_multi() call (after the code
change/recompile/redeploy cycle) originally reused the exact same
file:line breakpoints as the first call. A stale/incorrect
line-to-address mapping left over from the previous build could in
principle still resolve to a plausible address at the same line
number, without that being noticed. To close that gap, parameterize
the exe, header and library file:line breakpoints
(exe_break_line/exe_list_line/hpp_break_line/lib_break_line) through
_gdb_debug_cpp_example(), _gdb_debug_cpp_example_check() and
_gdb_cross_debugging_multi(). Insert LINE_SHIFT (3) extra lines right
before the targeted statements in cpp-example.cpp,
cpp-example-lib.hpp and cpp-example-lib.cpp as part of the existing
code-change step, and use the shifted line numbers for the second
debug session.

Together, this exercises breakpoint resolution for header-only debug
info, the executable's own file:line breakpoint, the library's symbol
breakpoint and the library's own file:line breakpoint as distinct code
paths, and proves all of them are resolved against the freshly rebuilt
debug info after a recompile/redeploy, rather than a stale/cached
mapping from the previous build.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../cpp/files/cpp-example-lib.hpp             |  10 +
 .../recipes-test/cpp/files/cpp-example.cpp    |   4 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 171 ++++++++++++++----
 3 files changed, 153 insertions(+), 32 deletions(-)

diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
index 24dd0defb6..d1c9bca416 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
@@ -6,6 +6,7 @@
 
 #pragma once
 
+#include <iostream>
 #include <string>
 #include "config.h"
 
@@ -13,6 +14,15 @@ struct CppExample
 {
     inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
 
+    /* Header-only function, to exercise breakpoint resolution against
+     * header-only debug info. */
+    inline static int scale_number(int n)
+    {
+        int scaled = n * 7;
+        std::cout << "scale_number(" << n << ") = " << scaled << std::endl;
+        return scaled;
+    }
+
     /* Retrieve a constant string */
     const std::string &get_string();
     /* Retrieve a constant string from a library */
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
index 23d7169092..ad1abae257 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -58,5 +58,9 @@ int main(int argc, char* argv[])
         std::cout << "numbers[" << i << "] = " << numbers[i] << std::endl;
     }
 
+    // Example: call a header-only function once, to exercise breakpoint
+    // resolution against header-only debug info.
+    CppExample::scale_number(6);
+
     return 0;
 }
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 2e91c2be97..dbcb05022a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2868,11 +2868,31 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertExists(i_and_d_script_path)
 
     def _devtool_ide_sdk_qemu(self, tempdir, qemu, recipe_name, example_exe, compile_cmd):
-        """Verify deployment and execution in Qemu system work for one recipe.
+        """Verify deployment, execution and remote debugging in Qemu system work for one recipe.
 
-        This function checks the entire SDK workflow: changing the code, recompiling
-        it and deploying it back to Qemu, and checking that the changes have been
-        incorporated into the provided binaries. It also runs the tests of the recipe.
+        This function checks the entire SDK workflow twice, before and after a code
+        change:
+        - Deploying the example and its ptests to Qemu and running them.
+        - Remote debugging with gdb-cross, hitting breakpoints in the executable
+          (by file:line), the library (by symbol and by file:line) and a
+          header-only function (by file:line), see _gdb_cross_debugging_multi().
+
+        Between the two passes, it changes the magic string printed by the example
+        and inserts LINE_SHIFT extra lines right before the statements the file:line
+        breakpoints target, then recompiles and redeploys. This proves the second
+        pass's breakpoints resolve against the freshly rebuilt debug info (now at
+        shifted line numbers), rather than a stale/cached line-to-address mapping
+        left over from the first pass.
+
+        The library's own cpp-example-lib.cpp is shifted too, and a breakpoint is
+        set there by file:line (in addition to the existing symbol breakpoint on
+        print_json()). Only install_deploy_cmd (do_install + deploy-target) runs
+        between the two passes, not a full image rebuild, so rootfs/rootfs-dbg
+        keep whatever debug symbols the initial bootstrap image build produced.
+        A file:line breakpoint at a line that only exists after the shift can
+        therefore only resolve correctly if solib-search-path prefers the
+        library's freshly rebuilt debug info in the image folder (D) over a
+        stale rootfs-dbg copy.
         """
         recipe_id, _ = self._get_recipe_ids(recipe_name)
         i_and_d_script = "install_and_deploy_" + recipe_id
@@ -2905,13 +2925,55 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self._gdb_cross_debugging_multi(
             qemu, recipe_name, example_exe, DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
 
-        # Replace the Magic String in the code, compile and deploy to Qemu
+        # Replace the Magic String in the code, compile and deploy to Qemu.
+        # Also insert LINE_SHIFT extra lines right before the statements the
+        # gdb file:line breakpoints target in the executable (cpp-example.cpp),
+        # the library (cpp-example-lib.cpp) and the header (cpp-example-lib.hpp),
+        # so those breakpoints land on different line numbers after the
+        # recompile/redeploy below. This proves the breakpoints are resolved
+        # against the freshly rebuilt debug info, rather than happening to
+        # still work against a stale, cached line-to-address mapping from the
+        # previous build.
+        LINE_SHIFT = 3
+        extra_lines = "".join(
+            "    // extra line %d inserted by the test to shift subsequent line numbers\n" % i
+            for i in range(LINE_SHIFT))
+
         cpp_example_lib_hpp = os.path.join(tempdir, 'cpp-example-lib.hpp')
         with open(cpp_example_lib_hpp, 'r') as file:
             cpp_code = file.read()
             cpp_code = cpp_code.replace(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
+            cpp_code = cpp_code.replace(
+                "    inline static int scale_number(int n)",
+                extra_lines + "    inline static int scale_number(int n)")
         with open(cpp_example_lib_hpp, 'w') as file:
             file.write(cpp_code)
+
+        cpp_example_cpp = os.path.join(tempdir, 'cpp-example.cpp')
+        with open(cpp_example_cpp, 'r') as file:
+            cpp_code = file.read()
+            cpp_code = cpp_code.replace(
+                "    std::vector<int> numbers = {1, 2, 3};",
+                extra_lines + "    std::vector<int> numbers = {1, 2, 3};")
+        with open(cpp_example_cpp, 'w') as file:
+            file.write(cpp_code)
+
+        # Shift a line inside the library's own .cpp file (not the header, not
+        # the executable). This is the only file:line breakpoint target that
+        # actually resolves through solib-search-path for the rebuilt shared
+        # library, so it is the one that would fail to resolve (or resolve to
+        # the wrong/stale line) if solib-search-path preferred a stale
+        # rootfs-dbg copy of the library's debug info over the freshly
+        # rebuilt one in the image folder (D).
+        cpp_example_lib_cpp = os.path.join(tempdir, 'cpp-example-lib.cpp')
+        with open(cpp_example_lib_cpp, 'r') as file:
+            cpp_code = file.read()
+            cpp_code = cpp_code.replace(
+                "    std::cout << json_object_to_json_string_ext(jobj, flag) << std::endl;",
+                extra_lines + "    std::cout << json_object_to_json_string_ext(jobj, flag) << std::endl;")
+        with open(cpp_example_lib_cpp, 'w') as file:
+            file.write(cpp_code)
+
         runCmd(compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
         runCmd(install_deploy_cmd, cwd=tempdir, output_log=self._cmd_logger)
 
@@ -2927,9 +2989,13 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(status, 0, msg="%s failed: %s" % (ptest_cmd, output))
         self.assertIn("PASS: cpp-example-lib", output)
 
-        # Verify remote debugging works wit the modified magic string
+        # Verify remote debugging works with the modified magic string, with
+        # the file:line breakpoints shifted by LINE_SHIFT lines compared to
+        # the first _gdb_cross_debugging_multi call above.
         self._gdb_cross_debugging_multi(
-            qemu, recipe_name, example_exe, MAGIC_STRING_NEW)
+            qemu, recipe_name, example_exe, MAGIC_STRING_NEW,
+            exe_break_line=56 + LINE_SHIFT, exe_list_line=55 + LINE_SHIFT,
+            hpp_break_line=21 + LINE_SHIFT, lib_break_line=31 + LINE_SHIFT)
 
     def _gdb_cross(self):
         """Verify gdb-cross is provided by devtool ide-sdk"""
@@ -2944,53 +3010,91 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
 
-    def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run"):
+    def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run",
+                              exe_break_line=56, exe_list_line=55, hpp_break_line=21,
+                              lib_break_line=31):
         """Get a series of gdb commands to debug the cpp-example-lib example"""
         gdb_batch_cmd = " -ex 'break main' -ex '%s'" % gdb_start_cmd
         gdb_batch_cmd += " -ex 'break CppExample::print_json()' -ex 'continue'"
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
-        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:14,14'"
+        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:15,15'"
+
+        # Break inside the library's own .cpp file by file:line (not by
+        # symbol), while still inside the print_json() call reached above.
+        # Unlike the symbol breakpoint above, resolving a file:line breakpoint
+        # requires the line-to-address mapping from the library's debug info
+        # that matches the currently deployed build. lib_break_line shifts
+        # after the test edits and recompiles cpp-example-lib.cpp, to prove
+        # this breakpoint resolves via the freshly rebuilt library debug info
+        # found through solib-search-path, rather than a stale rootfs-dbg
+        # copy left over from the last full image build.
+        gdb_batch_cmd += " -ex 'break cpp-example-lib.cpp:%d'" % lib_break_line
+        gdb_batch_cmd += " -ex 'continue'"
+        gdb_batch_cmd += " -ex 'list cpp-example-lib.cpp:%d,%d'" % (lib_break_line, lib_break_line)
 
         # check if resolving std::vector works with python scripts
-        gdb_batch_cmd += " -ex 'list cpp-example.cpp:55,55'"
-        # Break on line 56 (the std::cout after the declaration) so the vector
-        # constructor on line 55 has already run when GDB stops.
-        gdb_batch_cmd += " -ex 'break cpp-example.cpp:56'"
+        gdb_batch_cmd += " -ex 'list cpp-example.cpp:%d,%d'" % (exe_list_line, exe_list_line)
+        # Break on exe_break_line (the std::cout after the declaration) so the
+        # vector constructor on exe_list_line has already run when GDB stops.
+        # These line numbers shift after the test inserts extra lines and
+        # recompiles, proving the breakpoint resolves via the freshly rebuilt
+        # debug info rather than a stale, cached line-to-address mapping.
+        gdb_batch_cmd += " -ex 'break cpp-example.cpp:%d'" % exe_break_line
         gdb_batch_cmd += " -ex 'continue'"
         gdb_batch_cmd += " -ex 'print numbers'"
+
+        # Break on scale_number(), an inline function defined directly in the
+        # header (cpp-example-lib.hpp), to exercise breakpoint resolution for
+        # header-only debug info, separately from the executable's own
+        # cpp-example.cpp (file:line breakpoint above) and the library's
+        # cpp-example-lib.cpp (CppExample::print_json() breakpoint above).
+        # hpp_break_line shifts for the same reason as exe_break_line above.
+        gdb_batch_cmd += " -ex 'break cpp-example-lib.hpp:%d'" % hpp_break_line
+        gdb_batch_cmd += " -ex 'continue'"
+        gdb_batch_cmd += " -ex 'print n'"
         gdb_batch_cmd += " -ex 'continue'"
         return gdb_batch_cmd
 
-    def _gdb_debug_cpp_example_check(self, gdb_output, magic_string):
+    def _gdb_debug_cpp_example_check(self, gdb_output, magic_string, exe_list_line=55, lib_break_line=31):
         self.assertIn("Breakpoint 1, main", gdb_output)
         self.assertIn("$1 = 0", gdb_output)  # test.string.compare equal
         self.assertIn("$2 = -3", gdb_output)  # test.string.compare longer
         self.assertIn(
             'inline static const std::string test_string = "cpp-example-lib %s";' % magic_string, gdb_output)
 
+        # check that the file:line breakpoint set directly in the library's
+        # own .cpp file actually resolved and was hit at the expected
+        # (possibly shifted) line, i.e. against the freshly rebuilt library
+        # debug info rather than a stale rootfs-dbg copy
+        self.assertIn("cpp-example-lib.cpp:%d" % lib_break_line, gdb_output)
+        self.assertRegex(
+            gdb_output, r"%d\s+std::cout << json_object_to_json_string_ext\(jobj, flag\) << std::endl;" % lib_break_line)
+
         # check if resolving std::vector works with python scripts
-        self.assertRegex(gdb_output, r"55\s+std::vector<int> numbers = \{1, 2, 3\};")
+        self.assertRegex(
+            gdb_output, r"%d\s+std::vector<int> numbers = \{1, 2, 3\};" % exe_list_line)
         self.assertIn("$3 = std::vector of length 3, capacity 3 = {1, 2, 3}", gdb_output)
 
+        # check that a breakpoint in an inline function defined directly in
+        # the header (cpp-example-lib.hpp) is resolved and hit
+        self.assertIn("scale_number", gdb_output)
+        self.assertIn("$4 = 6", gdb_output)  # n == 6, the call argument
+
         self.assertIn("exited normally", gdb_output)
 
-    def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string):
+    def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string,
+                                   exe_break_line=56, exe_list_line=55, hpp_break_line=21,
+                                   lib_break_line=31):
         """Verify gdb-cross is working
 
-        Test remote debugging:
-        break main
-        run
-        continue
-        break CppExample::print_json()
-        continue
-        print CppExample::test_string.compare("cpp-example-lib Magic: 123456789")
-        $1 = 0
-        print CppExample::test_string.compare("cpp-example-lib Magic: 123456789aaa")
-        $2 = -3
-        list cpp-example-lib.hpp:14,14
-        13	    inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
-        continue
+        Test remote debugging with breakpoints in the executable
+        (cpp-example.cpp), the library (cpp-example-lib.cpp, by symbol and by
+        file:line) and a header defined directly in cpp-example-lib.hpp.
+        exe_break_line, exe_list_line, hpp_break_line and lib_break_line are
+        parameterized because the caller shifts them to different line
+        numbers after recompiling, to prove the breakpoints resolve via the
+        freshly rebuilt debug info.
         """
         sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         gdbserver_script = os.path.join(self._workspace_scripts_dir(
@@ -3017,12 +3121,15 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("1234", r.output)
 
         # Test remote debugging works
-        gdb_batch_cmd = " --batch " + self._gdb_debug_cpp_example(magic_string)
+        gdb_batch_cmd = " --batch " + self._gdb_debug_cpp_example(
+            magic_string, exe_break_line=exe_break_line, exe_list_line=exe_list_line,
+            hpp_break_line=hpp_break_line, lib_break_line=lib_break_line)
         r = runCmd(gdb_script + gdb_batch_cmd, output_log=self._cmd_logger)
         self.logger.debug("%s %s returned: %s", gdb_script,
                           gdb_batch_cmd, r.output)
         self.assertEqual(r.status, 0)
-        self._gdb_debug_cpp_example_check(r.output, magic_string=magic_string)
+        self._gdb_debug_cpp_example_check(
+            r.output, magic_string=magic_string, exe_list_line=exe_list_line, lib_break_line=lib_break_line)
 
         # Stop the gdbserver
         r = runCmd(gdbserver_script + ' stop', output_log=self._cmd_logger)
@@ -3314,7 +3421,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             -ex 'continue'  \
             -ex 'print CppExample::test_string.compare("cpp-example-lib Magic: 123456789")'  \
             -ex 'print CppExample::test_string.compare("cpp-example-lib Magic: 123456789aaa")'  \
-            -ex 'list cpp-example-lib.hpp:14,14'  \
+            -ex 'list cpp-example-lib.hpp:15,15'  \
             -ex 'continue'
         3. Verifying debug output and stopping gdbserver
         """
-- 
2.55.0


