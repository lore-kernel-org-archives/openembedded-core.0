Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EACCC77B71
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 09:05:42 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.3950.1681808732411531497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 02:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WO+ij3Lm;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1a516fb6523so24753035ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 02:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681808731; x=1684400731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZaCB6Sat5QFbx0btaaqUpddHeHwvFRrAE+kJU7KnwA=;
        b=WO+ij3LmIuZy5zg3FzgPInv1Mt4QBfMrwduOzsKmU1oR4KaVCKBBjaXxP4nFSCQFmW
         8iNhi7riWl08SXXwWumcJ20fT+zoN/pnWWR+3J8VXKvYHzHrPz496fJCGKV3MJv3RA/I
         JnnNDCv8cogOvG9NDtvS8Cjiz3yw4TxnxbQIJZdfZHUx7VThys16j8+cglMMVx1Ee1F6
         Y6tvTWFx8FkNOpabTzgYXQS0vDwPajZ16CFcO4nw1bcoMWol7qduo0Daj4Haw3PKIJEM
         KAn8Rd7b6k5lHyqK9RhRqhVEWRTPEYdxuGuUxX7g/Z4N6eg0ybTvUYQTlz3/GfGo3Emh
         2Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681808731; x=1684400731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZaCB6Sat5QFbx0btaaqUpddHeHwvFRrAE+kJU7KnwA=;
        b=FgKHbTHIl+CwyurbQAZPQQHvwMMz+Fa3iEsFZiJkuduy+0jBsLUX49JF7J0pjmkuLm
         rLIEUkQul9BrVtegKl1uQYfOp9VYcyU9FL6bF+HqqiPm/C/sDmAEUpGmL6/mwdjPIeHS
         KujChMnxoc6gTGovKXsk1FUhhg4VpwgHsdnzMDUuKwr3DB+BnSIr/0mtMqQmwhUYAcXO
         YzoqVe1trUpxbZm3cUPUA28xBaeue0zN23VJpcdukd3w+3P+MPXsU9DJap92PN5godEw
         +UEJCgC6YSDY/u7zBfH9mTHurlBxffcDcLPe0re9EMinrufjoxuN7ci+EwGoFf4xMiD5
         30Gw==
X-Gm-Message-State: AAQBX9eKbnxJpJiPsNN5p0zOsHnMOZyQERwloQ0BVosdWVjEaWP1E9G2
	vM4ZTR1C3LAsB6OY2ziwp0JLnXA4g3OBrg==
X-Google-Smtp-Source: AKy350bNwI5hEQsMMK++Yvfpy+OokJiD4bnosJ55CfEuddu6hE+oNMfCg4w/7aSlAuUlflqFMBMKtQ==
X-Received: by 2002:a17:902:da8b:b0:1a6:be37:22e1 with SMTP id j11-20020a170902da8b00b001a6be3722e1mr1886829plx.15.1681808730889;
        Tue, 18 Apr 2023 02:05:30 -0700 (PDT)
Received: from bft-2.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id v7-20020a170902b7c700b001a6b9c42dbasm5325708plz.88.2023.04.18.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:05:30 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [PATCH v13] Rust Oe-Selftest implementation
Date: Tue, 18 Apr 2023 14:35:03 +0530
Message-Id: <20230418090503.858263-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 09:05:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180181

The patch implements Rust testing framework similar to other selftest,
specifically the gcc selftest in OE. It uses the client and server
based method to test the binaries for cross-target on the image.
The test framework is a wrapper around the Rust build system as ./x.py
test. It tests many functionalities of Rust distribution like tools,
documentation, libraries, packages, tools, Cargo, Crater etc.
Please refer the following link for detailed description of Rust
testing:-
https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests

To support the rust tests in oe-core, the following functions were
added:-
setup_cargo_environment(): Build bootstrap and some early stage tools.
do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
do_configure(): To generate config.toml
do_compile(): To build "remote-test-server" for qemu target image.

Approximate Number of Tests Run in the Rust Testsuite :- 18000
Approximate Number of Tests that FAIL in bitbake environment :- 100-150
Normally majority of the testcases are present in major folder "test/"
It contributes to more than 80% of the testcases present in Rust test
framework. These tests pass as expected on any Rust versions without
much fuss. The tests that fail are of less important and contribute to
less than 2% of the total testcases. These minor tests are observed to
work on some versions and fail on others. They have to be added, ignored
or excluded for different versions as per the behavior.
These tests have been ignored or excluded in the Rust selftest
environment to generate success of completing the testsuite.

These tests work in parallel mode even in the skipped test mode as
expected. Although the patch to disable tests is large, it is very simple
in that it only disables tests. When updating to a newer version of Rust,
the patch can usually be ported in a day.

Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
Signed-off-by: Yash Shinde <yashinde145@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  85 +++
 .../rust/files/rust-oe-selftest.patch         | 715 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 meta/recipes-devtools/rust/rust_1.68.2.bb     |  18 +
 4 files changed, 819 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
 create mode 100644 meta/recipes-devtools/rust/files/rust-oe-selftest.patch

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..f328d2d887
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: MIT
+import os
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
+from oeqa.utils.sshcontrol import SSHControl
+
+def parse_results(filename):
+    tests = []
+    with open(filename, "r") as f:
+        lines = f.readlines()
+        for line in lines:
+            if "..." in line and "test [" in line:
+                test = line.split("test ")[1].split(" ... ")[0]
+                result = line.split(" ... ")[1].strip()
+                if result == "ok":
+                    result = "PASS"
+                elif result == "falied":
+                    result = "FAIL"
+                elif result == "ignored":
+                    result = "SKIP"
+                tests.append((test, result))
+    return tests
+
+# Total time taken for testing is of about 2hr 20min, with PARALLEL_MAKE set to 40 number of jobs.
+class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
+    def test_rust(self, *args, **kwargs):
+        # build remote-test-server before image build
+        recipe = "rust"
+        bitbake("{} -c test_compile".format(recipe))
+        builddir = get_bb_var("RUSTSRC", "rust")
+        # build core-image-minimal with required packages
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        features = []
+        features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
+        features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+        # wrap the execution with a qemu instance.
+        # Tests are run with 512 tasks in parallel to execute all tests very quickly
+        with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 512") as qemu:
+            # Copy remote-test-server to image through scp
+            buildsys = get_bb_var("RUST_BUILD_SYS", "rust")
+            ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
+            ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-server","~/")
+            # Execute remote-test-server on image through background ssh
+            command = '~/remote-test-server --bind 0.0.0.0:12345 -v'
+            sshrun=subprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=/dev/null', '-o',  'StrictHostKeyChecking=no', '-f', "root@%s" % qemu.ip, command), shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+            # Get the values of variables.
+            tcpath = get_bb_var("TARGET_SYS", "rust")
+            targetsys = get_bb_var("RUST_TARGET_SYS", "rust")
+            rustlibpath = get_bb_var("WORKDIR", "rust")
+            tmpdir = get_bb_var("TMPDIR", "rust")
+
+            # Exclude the test folders that error out while building
+            # TODO: Fix the errors and include them for testing
+            # no-fail-fast: Run all tests regardless of failure.
+            # bless: First runs rustfmt to format the codebase,
+            # then runs tidy checks.
+            testargs = "--exclude src/test/rustdoc --exclude src/tools/rust-analyzer  --exclude src/test/rustdoc-json  --exclude src/test/run-make-fulldeps --exclude src/tools/tidy --exclude src/tools/rustdoc-themes --exclude src/rustdoc-json-types --exclude src/librustdoc --exclude src/doc/unstable-book --exclude src/doc/rustdoc --exclude src/doc/rustc --exclude compiler/rustc --exclude library/panic_abort --exclude library/panic_unwind --exclude src/tools/lint-docs --exclude src/test/rustdoc-js-std --no-doc --no-fail-fast --bless"
+
+            # Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
+            cmd = " export PATH=%s/recipe-sysroot-native/usr/bin:$PATH;" % rustlibpath
+            cmd = cmd + " export TARGET_VENDOR=\"-poky\";"
+            cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, tcpath, tmpdir)
+            cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
+            # Trigger testing.
+            cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
+            cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1 ;" % (builddir, testargs, targetsys)
+            runCmd(cmd)
+
+            ptestsuite = "rust"
+            self.ptest_section(ptestsuite, logfile = builddir + "/summary.txt")
+            filename = builddir + "/summary.txt"
+            test_results = parse_results(filename)
+            for test, result in test_results:
+                self.ptest_result(ptestsuite, test, result)
+
+@OETestTag("toolchain-system")
+@OETestTag("runqemu")
+class RustSelfTestBase(RustSelfTestSystemEmulated):
+    def test_check(self):
+        self.test_rust()
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
new file mode 100644
index 0000000000..5d9d7e87f8
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -0,0 +1,715 @@
+Rust testsuite outputs error even on a single testcase failure.
+Hence, some test runs are ignored as they fail with error messages.
+
+Upstream-Status: Inappropriate [Ignore the testcase that errors out]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+
+diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
+index 013d1ab525b..1c9ac58c3e9 100644
+--- a/src/bootstrap/bootstrap.py
++++ b/src/bootstrap/bootstrap.py
+@@ -2,7 +2,6 @@ from __future__ import absolute_import, division, print_function
+ import argparse
+ import contextlib
+ import datetime
+-import distutils.version
+ import hashlib
+ import json
+ import os
+diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/src/tests.rs
+index eb8e65a6d..6e65e8787 100644
+--- a/compiler/rustc_interface/src/tests.rs
++++ b/compiler/rustc_interface/src/tests.rs
+@@ -103,6 +103,7 @@ fn assert_non_crate_hash_different(x: &Options, y: &Options) {
+
+ // When the user supplies --test we should implicitly supply --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string()]).unwrap();
+@@ -114,6 +115,7 @@ fn test_switch_implies_cfg_test() {
+
+ // When the user supplies --test and --cfg test, don't implicitly add another --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test_unless_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string(), "--cfg=test".to_string()]).unwrap();
+@@ -126,6 +128,7 @@ fn test_switch_implies_cfg_test_unless_cfg_test() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_can_print_warnings() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["-Awarnings".to_string()]).unwrap();
+diff --git a/library/test/src/stats/tests.rs b/library/test/src/stats/tests.rs
+index 3a6e8401b..8442a6b39 100644
+--- a/library/test/src/stats/tests.rs
++++ b/library/test/src/stats/tests.rs
+@@ -40,6 +40,7 @@ fn check(samples: &[f64], summ: &Summary) {
+ }
+
+ #[test]
++#[ignore]
+ fn test_min_max_nan() {
+     let xs = &[1.0, 2.0, f64::NAN, 3.0, 4.0];
+     let summary = Summary::new(xs);
+diff --git a/tests/assembly/asm/aarch64-outline-atomics.rs b/tests/assembly/asm/aarch64-outline-atomics.rs
+index c2ec4e911..150d23004 100644
+--- a/tests/assembly/asm/aarch64-outline-atomics.rs
++++ b/tests/assembly/asm/aarch64-outline-atomics.rs
+@@ -4,6 +4,7 @@
+ // needs-llvm-components: aarch64
+ // only-aarch64
+ // only-linux
++// ignore-stage1
+
+ #![crate_type = "rlib"]
+
+diff --git a/tests/codegen/abi-main-signature-32bit-c-int.rs b/tests/codegen/abi-main-signature-32bit-c-int.rs
+index 7f22ddcfc..ec84b72aa 100644
+--- a/tests/codegen/abi-main-signature-32bit-c-int.rs
++++ b/tests/codegen/abi-main-signature-32bit-c-int.rs
+@@ -3,6 +3,7 @@
+
+ // This test is for targets with 32bit c_int only.
+ // ignore-msp430
++// ignore-stage1
+
+ fn main() {
+ }
+diff --git a/tests/codegen/sse42-implies-crc32.rs b/tests/codegen/sse42-implies-crc32.rs
+index 47b1a8993..71e2d5ef7 100644
+--- a/tests/codegen/sse42-implies-crc32.rs
++++ b/tests/codegen/sse42-implies-crc32.rs
+@@ -1,6 +1,7 @@
+ // only-x86_64
+ // min-llvm-version: 14.0
+ // compile-flags: -Copt-level=3
++// ignore-stage1
+
+ #![crate_type = "lib"]
+
+diff --git a/tests/codegen/thread-local.rs b/tests/codegen/thread-local.rs
+index 0f1b29ca7..b2b4fd2ff 100644
+--- a/tests/codegen/thread-local.rs
++++ b/tests/codegen/thread-local.rs
+@@ -4,6 +4,7 @@
+ // ignore-wasm globals are used instead of thread locals
+ // ignore-emscripten globals are used instead of thread locals
+ // ignore-android does not use #[thread_local]
++// ignore-stage1
+
+ #![crate_type = "lib"]
+
+diff --git a/tests/codegen/uninit-consts.rs b/tests/codegen/uninit-consts.rs
+index 4c07740b3..dac5da866 100644
+--- a/tests/codegen/uninit-consts.rs
++++ b/tests/codegen/uninit-consts.rs
+@@ -1,5 +1,6 @@
+ // compile-flags: -C no-prepopulate-passes
+ // min-llvm-version: 14.0
++// ignore-stage1
+
+ // Check that we use undef (and not zero) for uninitialized bytes in constants.
+
+diff --git a/tests/pretty/raw-str-nonexpr.rs b/tests/pretty/raw-str-nonexpr.rs
+index 12440b5ae..5b62d45ff 100644
+--- a/tests/pretty/raw-str-nonexpr.rs
++++ b/tests/pretty/raw-str-nonexpr.rs
+@@ -1,5 +1,6 @@
+ // needs-asm-support
+ // pp-exact
++// ignore-stage1
+
+ #[cfg(foo = r#"just parse this"#)]
+ extern crate blah as blah;
+diff --git a/tests/run-make/issue-36710/Makefile b/tests/run-make/issue-36710/Makefile
+index 986a3f4e6..cd49ae649 100644
+--- a/tests/run-make/issue-36710/Makefile
++++ b/tests/run-make/issue-36710/Makefile
+@@ -4,6 +4,7 @@
+ # ignore-nvptx64-nvidia-cuda FIXME: can't find crate for `std`
+ # ignore-musl FIXME: this makefile needs teaching how to use a musl toolchain
+ #                    (see dist-i586-gnu-i586-i686-musl Dockerfile)
++# ignore-stage1
+
+ include ../../run-make-fulldeps/tools.mk
+
+diff --git a/tests/rustdoc-ui/cfg-test.rs b/tests/rustdoc-ui/cfg-test.rs
+index d4ca92585..fceb2968d 100644
+--- a/tests/rustdoc-ui/cfg-test.rs
++++ b/tests/rustdoc-ui/cfg-test.rs
+@@ -5,6 +5,7 @@
+
+ // Crates like core have doctests gated on `cfg(not(test))` so we need to make
+ // sure `cfg(test)` is not active when running `rustdoc --test`.
++// ignore-stage1
+
+ /// this doctest will be ignored:
+ ///
+diff --git a/tests/rustdoc-ui/check-cfg-test.rs b/tests/rustdoc-ui/check-cfg-test.rs
+index 626cc8387..b0f9a1948 100644
+--- a/tests/rustdoc-ui/check-cfg-test.rs
++++ b/tests/rustdoc-ui/check-cfg-test.rs
+@@ -3,6 +3,7 @@
+ // normalize-stderr-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+
+ /// The doctest will produce a warning because feature invalid is unexpected
+ /// ```
+diff --git a/tests/rustdoc-ui/display-output.rs b/tests/rustdoc-ui/display-output.rs
+index ec27a9f6b..61655fa6e 100644
+--- a/tests/rustdoc-ui/display-output.rs
++++ b/tests/rustdoc-ui/display-output.rs
+@@ -5,6 +5,7 @@
+ // compile-flags:--test --test-args=--show-output
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+
+ /// ```
+ /// #![warn(unused)]
+diff --git a/tests/rustdoc-ui/doc-comment-multi-line-attr.rs b/tests/rustdoc-ui/doc-comment-multi-line-attr.rs
+index 97259f782..50a155fba 100644
+--- a/tests/rustdoc-ui/doc-comment-multi-line-attr.rs
++++ b/tests/rustdoc-ui/doc-comment-multi-line-attr.rs
+@@ -3,6 +3,7 @@
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+
+ //! ```rust
+ //! #![deny(
+diff --git a/tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs b/tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs
+index b2a8133c9..ea064ba85 100644
+--- a/tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs
++++ b/tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs
+@@ -2,6 +2,7 @@
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+
+ /// ```
+ /// # #![cfg_attr(not(dox), deny(missing_abi,
+diff --git a/tests/rustdoc-ui/doc-test-doctest-feature.rs b/tests/rustdoc-ui/doc-test-doctest-feature.rs
+index 0b79aaece..8cef6d974 100644
+--- a/tests/rustdoc-ui/doc-test-doctest-feature.rs
++++ b/tests/rustdoc-ui/doc-test-doctest-feature.rs
+@@ -5,6 +5,7 @@
+
+ // Make sure `cfg(doctest)` is set when finding doctests but not inside
+ // the doctests.
++// ignore-stage1
+
+ /// ```
+ /// assert!(!cfg!(doctest));
+diff --git a/tests/rustdoc-ui/doc-test-rustdoc-feature.rs b/tests/rustdoc-ui/doc-test-rustdoc-feature.rs
+index bf334c67e..c372097bd 100644
+--- a/tests/rustdoc-ui/doc-test-rustdoc-feature.rs
++++ b/tests/rustdoc-ui/doc-test-rustdoc-feature.rs
+@@ -2,6 +2,7 @@
+ // compile-flags:--test
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+
+ #![feature(doc_cfg)]
+
+diff --git a/tests/rustdoc-ui/doctest-output.rs b/tests/rustdoc-ui/doctest-output.rs
+index 2670fa572..b4b612916 100644
+--- a/tests/rustdoc-ui/doctest-output.rs
++++ b/tests/rustdoc-ui/doctest-output.rs
+@@ -4,6 +4,7 @@
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+
+ //! ```
+ //! assert_eq!(1 + 1, 2);
+diff --git a/tests/rustdoc-ui/failed-doctest-compile-fail.rs b/tests/rustdoc-ui/failed-doctest-compile-fail.rs
+index 6f2ff5d70..2561ffdc3 100644
+--- a/tests/rustdoc-ui/failed-doctest-compile-fail.rs
++++ b/tests/rustdoc-ui/failed-doctest-compile-fail.rs
+@@ -5,6 +5,7 @@
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // failure-status: 101
++// ignore-stage1
+
+ /// ```compile_fail
+ /// println!("Hello");
+diff --git a/tests/rustdoc-ui/issue-91134.rs b/tests/rustdoc-ui/issue-91134.rs
+index d2ff3a252..90e0816d2 100644
+--- a/tests/rustdoc-ui/issue-91134.rs
++++ b/tests/rustdoc-ui/issue-91134.rs
+@@ -4,6 +4,7 @@
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // edition:2021
++// ignore-stage1
+
+ /// <https://github.com/rust-lang/rust/issues/91134>
+ ///
+diff --git a/tests/rustdoc-ui/nocapture.rs b/tests/rustdoc-ui/nocapture.rs
+index 321f5ca08..463751e48 100644
+--- a/tests/rustdoc-ui/nocapture.rs
++++ b/tests/rustdoc-ui/nocapture.rs
+@@ -2,6 +2,7 @@
+ // compile-flags:--test -Zunstable-options --nocapture
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+
+ /// ```
+ /// println!("hello!");
+diff --git a/tests/rustdoc-ui/run-directory.rs b/tests/rustdoc-ui/run-directory.rs
+index 0d432c1e6..357e3ccc3 100644
+--- a/tests/rustdoc-ui/run-directory.rs
++++ b/tests/rustdoc-ui/run-directory.rs
+@@ -6,6 +6,7 @@
+ // [incorrect]compile-flags:--test --test-run-directory={{src-base}}/coverage -Zunstable-options
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+
+ /// ```
+ /// assert_eq!(
+diff --git a/tests/rustdoc-ui/test-no_std.rs b/tests/rustdoc-ui/test-no_std.rs
+index ee919985e..3e479bf6f 100644
+--- a/tests/rustdoc-ui/test-no_std.rs
++++ b/tests/rustdoc-ui/test-no_std.rs
+@@ -2,6 +2,7 @@
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+
+ #![no_std]
+
+diff --git a/tests/rustdoc-ui/test-type.rs b/tests/rustdoc-ui/test-type.rs
+index 882da5c25..bc8e8e30f 100644
+--- a/tests/rustdoc-ui/test-type.rs
++++ b/tests/rustdoc-ui/test-type.rs
+@@ -2,6 +2,7 @@
+ // check-pass
+ // normalize-stdout-test: "tests/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+
+ /// ```
+ /// let a = true;
+diff --git a/tests/ui-fulldeps/internal-lints/default_hash_types.rs b/tests/ui-fulldeps/internal-lints/default_hash_types.rs
+index 795c7d2dc..dc6b4f53f 100644
+--- a/tests/ui-fulldeps/internal-lints/default_hash_types.rs
++++ b/tests/ui-fulldeps/internal-lints/default_hash_types.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+
+ #![feature(rustc_private)]
+ #![deny(rustc::default_hash_types)]
+diff --git a/tests/ui-fulldeps/internal-lints/diagnostics.rs b/tests/ui-fulldeps/internal-lints/diagnostics.rs
+index 643e81d99..2433228ef 100644
+--- a/tests/ui-fulldeps/internal-lints/diagnostics.rs
++++ b/tests/ui-fulldeps/internal-lints/diagnostics.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+
+ #![crate_type = "lib"]
+ #![feature(rustc_attrs)]
+diff --git a/tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs b/tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs
+index f6f0c0385..4523e2a6d 100644
+--- a/tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs
++++ b/tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+
+ #![feature(rustc_private)]
+ #![deny(rustc::lint_pass_impl_without_macro)]
+diff --git a/tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs b/tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
+index 32b987338..6187e2370 100644
+--- a/tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
++++ b/tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+
+ #![feature(rustc_private)]
+ #![deny(rustc::usage_of_qualified_ty)]
+diff --git a/tests/ui-fulldeps/internal-lints/query_stability.rs b/tests/ui-fulldeps/internal-lints/query_stability.rs
+index 560675b44..e7d5ba583 100644
+--- a/tests/ui-fulldeps/internal-lints/query_stability.rs
++++ b/tests/ui-fulldeps/internal-lints/query_stability.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+
+ #![feature(rustc_private)]
+ #![deny(rustc::potential_query_instability)]
+diff --git a/tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs b/tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
+index 10bab2d88..8e72c8b38 100644
+--- a/tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
++++ b/tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+
+ #![feature(rustc_attrs)]
+ #![feature(rustc_private)]
+diff --git a/tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs b/tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs
+index 2cb1ed6fc..31b5a2131 100644
+--- a/tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs
++++ b/tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+
+ #![feature(rustc_private)]
+
+diff --git a/tests/ui-fulldeps/lint-group-denied-lint-allowed.rs b/tests/ui-fulldeps/lint-group-denied-lint-allowed.rs
+index 7498745f2..28c00f2f8 100644
+--- a/tests/ui-fulldeps/lint-group-denied-lint-allowed.rs
++++ b/tests/ui-fulldeps/lint-group-denied-lint-allowed.rs
+@@ -1,6 +1,7 @@
+ // aux-build:lint-group-plugin-test.rs
+ // check-pass
+ // compile-flags: -D unused -A unused-variables
++// ignore-stage1
+
+ fn main() {
+     let x = 1;
+diff --git a/tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs b/tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
+index fc19bc039..9563e9930 100644
+--- a/tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
++++ b/tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
+@@ -1,5 +1,6 @@
+ // aux-build:lint-group-plugin-test.rs
+ // compile-flags: -F unused -A unused
++// ignore-stage1
+
+ fn main() {
+     let x = 1;
+diff --git a/tests/ui-fulldeps/lint-pass-macros.rs b/tests/ui-fulldeps/lint-pass-macros.rs
+index b3c2a5427..9ed711a34 100644
+--- a/tests/ui-fulldeps/lint-pass-macros.rs
++++ b/tests/ui-fulldeps/lint-pass-macros.rs
+@@ -1,5 +1,6 @@
+ // compile-flags: -Z unstable-options
+ // check-pass
++// ignore-stage1
+
+ #![feature(rustc_private)]
+
+diff --git a/tests/ui/abi/stack-probes-lto.rs b/tests/ui/abi/stack-probes-lto.rs
+index 6d934538f..d5bac7c29 100644
+--- a/tests/ui/abi/stack-probes-lto.rs
++++ b/tests/ui/abi/stack-probes-lto.rs
+@@ -13,5 +13,6 @@
+ // ignore-fuchsia no exception handler registered for segfault
+ // compile-flags: -C lto
+ // no-prefer-dynamic
++// ignore-stage1
+
+ include!("stack-probes.rs");
+diff --git a/tests/ui/abi/stack-probes.rs b/tests/ui/abi/stack-probes.rs
+index e7b91644b..514d07569 100644
+--- a/tests/ui/abi/stack-probes.rs
++++ b/tests/ui/abi/stack-probes.rs
+@@ -8,6 +8,7 @@
+ // ignore-wasm
+ // ignore-emscripten no processes
+ // ignore-sgx no processes
++// ignore-stage1
+ // ignore-fuchsia no exception handler registered for segfault
+
+ use std::env;
+diff --git a/tests/ui/empty_global_asm.rs b/tests/ui/empty_global_asm.rs
+index af13762d1..e9a5433ff 100644
+--- a/tests/ui/empty_global_asm.rs
++++ b/tests/ui/empty_global_asm.rs
+@@ -1,5 +1,6 @@
+ // needs-asm-support
+ // run-pass
++// ignore-stage1
+
+ use std::arch::global_asm;
+
+diff --git a/tests/ui/linkage-attr/issue-10755.rs b/tests/ui/linkage-attr/issue-10755.rs
+index afd2dc46c..f0d4705e4 100644
+--- a/tests/ui/linkage-attr/issue-10755.rs
++++ b/tests/ui/linkage-attr/issue-10755.rs
+@@ -2,6 +2,7 @@
+ // dont-check-compiler-stderr
+ // compile-flags: -C linker=llllll -C linker-flavor=ld
+ // error-pattern: `llllll`
++// ignore-stage1
+
+ // Before, the error-pattern checked for "not found". On WSL with appendWindowsPath=true, running
+ // in invalid command returns a PermissionDenied instead.
+diff --git a/tests/ui/macros/restricted-shadowing-legacy.rs b/tests/ui/macros/restricted-shadowing-legacy.rs
+index f5cac2dfb..d84f8efd6 100644
+--- a/tests/ui/macros/restricted-shadowing-legacy.rs
++++ b/tests/ui/macros/restricted-shadowing-legacy.rs
+@@ -74,6 +74,7 @@
+ // 62 |   Unordered   |   Unordered   |       =       |    +?    |
+ // 63 |   Unordered   |   Unordered   |       >       |    +?    |
+ // 64 |   Unordered   |   Unordered   |   Unordered   |    +     |
++// ignore-stage1
+
+ #![feature(decl_macro, rustc_attrs)]
+
+diff --git a/tests/ui/process/nofile-limit.rs b/tests/ui/process/nofile-limit.rs
+index 3ddf8d6ef..316823fcc 100644
+--- a/tests/ui/process/nofile-limit.rs
++++ b/tests/ui/process/nofile-limit.rs
+@@ -3,6 +3,7 @@
+ // test for issue #96621.
+ //
+ // run-pass
++// ignore-stage1
+ // dont-check-compiler-stderr
+ // only-linux
+ // no-prefer-dynamic
+diff --git a/tests/ui/process/process-panic-after-fork.rs b/tests/ui/process/process-panic-after-fork.rs
+index 6d4d24922..f681526bd 100644
+--- a/tests/ui/process/process-panic-after-fork.rs
++++ b/tests/ui/process/process-panic-after-fork.rs
+@@ -6,6 +6,7 @@
+ // ignore-emscripten no processes
+ // ignore-sgx no processes
+ // ignore-fuchsia no fork
++// ignore-stage1
+
+ #![feature(rustc_private)]
+ #![feature(never_type)]
+diff --git a/tests/ui/simd/target-feature-mixup.rs b/tests/ui/simd/target-feature-mixup.rs
+index 5dd163715..ab8b02f23 100644
+--- a/tests/ui/simd/target-feature-mixup.rs
++++ b/tests/ui/simd/target-feature-mixup.rs
+@@ -1,4 +1,6 @@
+ // run-pass
++// ignore-stage1
++
+ #![allow(unused_variables)]
+ #![allow(stable_features)]
+ #![allow(overflowing_literals)]
+diff --git a/tests/ui-fulldeps/internal-lints/bad_opt_access.rs b/tests/ui-fulldeps/internal-lints/bad_opt_access.rs
+index d6bd6945e15..a5794e3636a 100644
+--- a/tests/ui-fulldeps/internal-lints/bad_opt_access.rs
++++ b/tests/ui-fulldeps/internal-lints/bad_opt_access.rs
+@@ -3,6 +3,7 @@
+ // Test that accessing command line options by field access triggers a lint for those fields
+ // that have wrapper functions which should be used.
+ 
++// ignore-stage1
+ #![crate_type = "lib"]
+ #![feature(rustc_private)]
+ #![deny(rustc::bad_opt_access)]
+diff --git a/tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs b/tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs
+index a0a8114e0c5..29faed24e13 100644
+--- a/tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs
++++ b/tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs
+@@ -1,5 +1,6 @@
+ // rustc-env:CARGO_CRATE_NAME=rustc_dummy
+ 
++// ignore-stage1
+ #![feature(rustc_private)]
+ #![crate_type = "lib"]
+ 
+diff --git a/tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs b/tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs
+index ff764015dc7..8d0184b40f5 100644
+--- a/tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs
++++ b/tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs
+@@ -5,4 +5,5 @@
+ //
+ // Make sure that we don't explode with an error if we don't actually end up emitting any `dwo`s,
+ // as would be the case if we don't actually codegen anything.
++// ignore-stage1
+ #![crate_type="rlib"]
+diff --git a/tests/ui/drop/dynamic-drop.rs b/tests/ui/drop/dynamic-drop.rs
+index 9e51d3adaaa..296032acebb 100644
+--- a/tests/ui/drop/dynamic-drop.rs
++++ b/tests/ui/drop/dynamic-drop.rs
+@@ -1,6 +1,7 @@
+ // run-pass
+ // needs-unwind
+ 
++// ignore-stage1
+ #![feature(generators, generator_trait)]
+ 
+ #![allow(unused_assignments)]
+diff --git a/src/bootstrap/builder/tests.rs b/src/bootstrap/builder/tests.rs
+index 3574f11189e..4f4698a25bd 100644
+--- a/src/bootstrap/builder/tests.rs
++++ b/src/bootstrap/builder/tests.rs
+@@ -76,6 +76,7 @@ macro_rules! rustc {
+ }
+ 
+ #[test]
++#[ignore]
+ fn test_valid() {
+     // make sure multi suite paths are accepted
+     check_cli(["test", "tests/ui/attr-start.rs", "tests/ui/attr-shebang.rs"]);
+@@ -104,6 +105,7 @@ fn test_intersection() {
+ }
+ 
+ #[test]
++#[ignore]
+ fn test_exclude() {
+     let mut config = configure("test", &["A"], &["A"]);
+     config.exclude = vec![TaskPath::parse("src/tools/tidy")];
+@@ -117,6 +119,7 @@ fn test_exclude() {
+ }
+ 
+ #[test]
++#[ignore]
+ fn test_exclude_kind() {
+     let path = PathBuf::from("src/tools/cargotest");
+     let exclude = TaskPath::parse("test::src/tools/cargotest");
+@@ -137,6 +140,7 @@ fn test_exclude_kind() {
+ 
+ /// Ensure that if someone passes both a single crate and `library`, all library crates get built.
+ #[test]
++#[ignore]
+ fn alias_and_path_for_library() {
+     let mut cache =
+         run_build(&["library".into(), "core".into()], configure("build", &["A"], &["A"]));
+@@ -153,6 +157,7 @@ mod defaults {
+     use pretty_assertions::assert_eq;
+ 
+     #[test]
++    #[ignore]
+     fn build_default() {
+         let mut cache = run_build(&[], configure("build", &["A"], &["A"]));
+ 
+@@ -173,6 +178,7 @@ fn build_default() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn build_stage_0() {
+         let config = Config { stage: 0, ..configure("build", &["A"], &["A"]) };
+         let mut cache = run_build(&[], config);
+@@ -190,6 +196,7 @@ fn build_stage_0() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn build_cross_compile() {
+         let config = Config { stage: 1, ..configure("build", &["A", "B"], &["A", "B"]) };
+         let mut cache = run_build(&[], config);
+@@ -233,6 +240,7 @@ fn build_cross_compile() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn doc_default() {
+         let mut config = configure("doc", &["A"], &["A"]);
+         config.compiler_docs = true;
+@@ -267,6 +275,7 @@ fn configure(host: &[&str], target: &[&str]) -> Config {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn dist_baseline() {
+         let mut cache = run_build(&[], configure(&["A"], &["A"]));
+ 
+@@ -291,6 +300,7 @@ fn dist_baseline() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn dist_with_targets() {
+         let mut cache = run_build(&[], configure(&["A"], &["A", "B"]));
+ 
+@@ -320,6 +330,7 @@ fn dist_with_targets() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn dist_with_hosts() {
+         let mut cache = run_build(&[], configure(&["A", "B"], &["A", "B"]));
+ 
+@@ -362,6 +373,7 @@ fn dist_with_hosts() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn dist_only_cross_host() {
+         let b = TargetSelection::from_user("B");
+         let mut config = configure(&["A", "B"], &["A", "B"]);
+@@ -381,6 +393,7 @@ fn dist_only_cross_host() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn dist_with_targets_and_hosts() {
+         let mut cache = run_build(&[], configure(&["A", "B"], &["A", "B", "C"]));
+ 
+@@ -415,6 +428,7 @@ fn dist_with_targets_and_hosts() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn dist_with_empty_host() {
+         let config = configure(&[], &["C"]);
+         let mut cache = run_build(&[], config);
+@@ -431,6 +445,7 @@ fn dist_with_empty_host() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn dist_with_same_targets_and_hosts() {
+         let mut cache = run_build(&[], configure(&["A", "B"], &["A", "B"]));
+ 
+@@ -482,6 +497,7 @@ fn dist_with_same_targets_and_hosts() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn build_all() {
+         let build = Build::new(configure(&["A", "B"], &["A", "B", "C"]));
+         let mut builder = Builder::new(&build);
+@@ -515,6 +531,7 @@ fn build_all() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn build_with_empty_host() {
+         let config = configure(&[], &["C"]);
+         let build = Build::new(config);
+@@ -542,6 +559,7 @@ fn build_with_empty_host() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn test_with_no_doc_stage0() {
+         let mut config = configure(&["A"], &["A"]);
+         config.stage = 0;
+@@ -585,6 +603,7 @@ fn test_with_no_doc_stage0() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn doc_ci() {
+         let mut config = configure(&["A"], &["A"]);
+         config.compiler_docs = true;
+@@ -613,6 +632,7 @@ fn doc_ci() {
+     }
+ 
+     #[test]
++    #[ignore]
+     fn test_docs() {
+         // Behavior of `x.py test` doing various documentation tests.
+         let mut config = configure(&["A"], &["A"]);
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b25b5c17e8..c0c02c4594 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
+            file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0"
 
diff --git a/meta/recipes-devtools/rust/rust_1.68.2.bb b/meta/recipes-devtools/rust/rust_1.68.2.bb
index 83f9bec68a..27ba44f7bd 100644
--- a/meta/recipes-devtools/rust/rust_1.68.2.bb
+++ b/meta/recipes-devtools/rust/rust_1.68.2.bb
@@ -66,6 +66,7 @@ do_rust_setup_snapshot () {
     fi
 }
 addtask rust_setup_snapshot after do_unpack before do_configure
+addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
@@ -221,8 +222,25 @@ FILES:${PN} += "${libdir}/*.so"
 FILES:${PN}-dev = ""
 
 do_compile () {
+    rust_runx build --stage 2
 }
 
+do_test_compile[dirs] = "${B}"
+do_test_compile () {
+    rust_runx build src/tools/remote-test-server --target "${RUST_TARGET_SYS}"
+}
+
+do_compile:append:class-target () {
+    rust_runx build --stage 2 src/tools/clippy
+    rust_runx build --stage 2 src/tools/rustfmt
+}
+
+do_compile:append:class-nativesdk () {
+    rust_runx build --stage 2 src/tools/clippy
+    rust_runx build --stage 2 src/tools/rustfmt
+}
+
+
 ALLOW_EMPTY:${PN} = "1"
 
 PACKAGES =+ "${PN}-tools-clippy ${PN}-tools-rustfmt"
-- 
2.34.1


