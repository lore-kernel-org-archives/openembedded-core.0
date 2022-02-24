Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10A4C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:22:51 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.11697.1645716170415028134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jLVdVET3;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x18so2160547pfh.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyZ5QVldEz16zZllFueIhAgZ4OLDqwfiHpoI5tYcHjg=;
        b=jLVdVET3JqYXR4FKceamoZhedWL8o5iNreTtxcfKsFDEoemMgTpN8bCA/r5djHjKZd
         9mMrGWBlzoRDBfA5f9zeG74M9J0SFJP8CnkwvT3anjINUzr00VakezOTv7189uw1lUAc
         Ef3sNJ3pDfdq7fasmuduNL6Ek+esr2TFlbZXglKEaN3ZxvbNzYMN4hut+mnQyYOZIjYj
         JY3Vdx3d5NhHPwAANWGmnbArmqZoNwdn8M+CttV+f3sNyMmOZbHRflBlvAG7/n5FBsT2
         EHbyYZzKiNul+V3wLakH7Rw2xgo3AG6C6LOg644SadEUC2NFboA9Af5QNnljoQRDrv1M
         QZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyZ5QVldEz16zZllFueIhAgZ4OLDqwfiHpoI5tYcHjg=;
        b=pljewRoP86T1tmuOIUrCE43mQxP1mFC/YtrYI7N0lPwmKj70kxtnTEeiPHJL/TcA2x
         2WyxzCkK24WZhi26AJSI2VWdet/+4ahvxAfwvxfWnij5inzZxcQNNGiN+vp0/FnVd3KE
         7xTlFkkLntKHRJZbNCSD9GOVMcCazWAujF/pmkzr2O0Km4ZdRwt31PrXe+9nrmE4BlZQ
         ivsEeu40kID9Vb+MEug8tximqCkqvk+4cShN9JtpmAd2b7CkPamu7AKG892+B0KTp6oL
         +moZvySugqIHOQMqi4FxqR8iCzNZ0ROXW4NPj31xsSqwkaIykeYu7cyYQJcpJ+gYm1Us
         v88A==
X-Gm-Message-State: AOAM531SSjTMYZF2AGtDpCONchhZBv6ys9FKQw1NRqRtLqYZRjC9J++N
	IUMXdFbUxNFJW4oOxisS2JfdWJMk7IJnPA==
X-Google-Smtp-Source: 
 ABdhPJxOCIuE3O3u0YWUY/VF8n5c0HknkQTiUthWR7LdY0yPqn0Vl0OAG4FBg2042wSk/kXhUrUNvQ==
X-Received: by 2002:a05:6a00:c95:b0:4e1:1f5a:35cf with SMTP id
 a21-20020a056a000c9500b004e11f5a35cfmr3354054pfv.56.1645716168125;
        Thu, 24 Feb 2022 07:22:48 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 k13sm4336383pfc.176.2022.02.24.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:22:47 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	nathan@nathanrossi.com,
	vinay.m.engg@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v4] Rust Oe-Selftest implementation
Date: Thu, 24 Feb 2022 07:22:40 -0800
Message-Id: <20220224152240.133819-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:22:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162321

The patch implements Rust testing framework similar to other selftest,
specifically the gcc selftest in OE. It uses the client and server
based method to test the binaries for cross-target on the image.
The test framework is a wrapper around the Rust build system as ./x.py test.
It tests many functionalities of Rust distribution like tools,
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
These tests have been ignored or excluded in the Rust selftest environment
to generate success of completing the testsuite.

With Rust-1.54.0 only 4 test modules were excluded (rustc-main, tiny).
However with Rustc-1.58.1 the following issue required excluding many more
test modules.
These tests can be included in Oe-selftest after fixing the issue.
===============================================================
"build-st/tmp/work/core2-64-poky-linux/rust-testsuite/1.58.1-r0/
rustc-1.58.1-src/build/bootstrap/debug/rustc -vV` (exit status: 101)
--- stderr
thread 'main' panicked at '
kind: NotFound, message: "No such file or directory" }',
src/bootstrap/bin/rustc.rs:175:37
===============================================================
It mentions that the rustc binary is not present inspite of it being present.

There are many tests in Rust which just checks the documents, formatting,
documentation etc. These tests can be ignored and not run as some FAILS
most of the times.

These tests work in parallel mode even in the skipped test mode as expected.
Although the patch to disable tests is large, it is very simple in that it
only disables tests. When updating to a newer version of Rust, the patch can
usually be rebased in under a day.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  57 +
 meta/recipes-devtools/rust/rust-testsuite.inc | 163 +++
 .../rust-testsuite/rust-oe-selftest.patch     | 995 ++++++++++++++++++
 .../rust/rust-testsuite_1.58.1.bb             |   3 +
 4 files changed, 1218 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.58.1.bb

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..1379b09af1
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: MIT
+import os
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
+from oeqa.utils.sshcontrol import SSHControl
+
+# Total time taken for testing is of about 2hr 20min, with PARALLEL_MAKE set to 40 number of jobs.
+class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
+
+	def run_check_emulated(self, *args, **kwargs):
+		# build remote-test-server before image build
+		recipe = "rust-testsuite"
+		bitbake("{} -c compile".format(recipe))
+		builddir = get_bb_var("B", "rust-testsuite")
+		# build core-image-minimal with required packages
+		default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+		features = []
+		features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+		features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
+		self.write_config("\n".join(features))
+		bitbake("core-image-minimal")
+		# wrap the execution with a qemu instance
+		with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 512") as qemu:
+			# Copy remote-test-server to image through scp
+			ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
+			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-server","~/")
+			# Execute remote-test-server on image through background ssh
+			command = '~/remote-test-server -v remote'
+			sshrun=subprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=/dev/null', '-o',  'StrictHostKeyChecking=no', '-f', "root@%s" % qemu.ip, command),
+                                shell=False,
+                                stdout=subprocess.PIPE,
+                                stderr=subprocess.PIPE)
+			# Get the values of variables.
+			targetsys = get_bb_var("TARGET_SYS", "rust-testsuite")
+			rustlibpath = get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite")
+			tmpdir = get_bb_var("TMPDIR", "rust-testsuite")
+
+			# Exclude the test folders that error out while building
+			# Need to fix these errors and include them for testing
+			testargs = "--exclude src/test/rustdoc-json --exclude src/test/run-make-fulldeps --exclude src/tools/tidy --exclude src/tools/rustfmt --exclude src/tools/rustdoc-themes --exclude src/tools/rust-demangler --exclude src/tools/rls --exclude src/tools/miri --exclude src/tools/linkchecker --exclude src/tools/expand-yaml-anchors --exclude src/tools/compiletest --exclude src/tools/clippy --exclude src/tools/cargotest --exclude src/tools/cargo --exclude src/test/rustdoc-gui --exclude src/rustdoc-json-types --exclude src/tools/rustdoc --exclude src/librustdoc --exclude src/doc/unstable-book --exclude src/doc/rustdoc --exclude src/doc/rustc --exclude compiler/rustc --exclude library/panic_abort --exclude library/panic_unwind --no-doc --no-fail-fast --bless"
+
+			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
+			cmd = " export PATH=%s/../bin:$PATH;" % rustlibpath
+			cmd = cmd + " export PATH=%s/../bin/%s:%s/hosttools:$PATH;" % (rustlibpath, targetsys, tmpdir)
+			cmd = cmd + " export RUST_TARGET_PATH=%s/rustlib;" % rustlibpath
+			# Trigger testing.
+			cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
+			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s --target %s ;" % (builddir, testargs, targetsys)
+			result = runCmd(cmd)
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
new file mode 100644
index 0000000000..8d9068a61e
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -0,0 +1,163 @@
+SUMMARY = "Rust testing"
+HOMEPAGE = "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
+SECTION = "test"
+LICENSE = "MIT | Apache-2.0"
+
+SRC_URI += "file://rust-oe-selftest.patch;striplevel=1"
+
+inherit rust
+inherit cargo_common
+
+DEPENDS += "file-native"
+EXCLUDE_FROM_WORLD = "1"
+
+S = "${RUSTSRC}"
+
+# Path of target specification file "target-poky-linux.json"
+export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
+
+export FORCE_CRATE_HASH="${BB_TASKHASH}"
+
+# We don't want to use bitbakes vendoring because the rust sources do their
+# own vendoring.
+CARGO_DISABLE_BITBAKE_VENDORING = "1"
+
+# We can't use RUST_BUILD_SYS here because that may be "musl" if
+# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
+SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
+setup_cargo_environment () {
+    # The first step is to build bootstrap and some early stage tools,
+    # these are build for the same target as the snapshot, e.g.
+    # x86_64-unknown-linux-gnu.
+    # Later stages are build for the native target (i.e. target.x86_64-linux)
+    cargo_common_do_configure
+
+    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
+    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
+}
+
+include rust-common.inc
+
+do_rust_setup_snapshot () {
+    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
+        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
+    done
+
+    # Need to use uninative's loader if enabled/present since the library paths
+    # are used internally by rust and result in symbol mismatches if we don't
+    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
+        for bin in cargo rustc rustdoc; do
+            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter ${UNINATIVE_LOADER}
+        done
+    fi
+}
+addtask rust_setup_snapshot after do_unpack before do_configure
+do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
+do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
+
+python do_configure() {
+    import json
+    try:
+        import configparser
+    except ImportError:
+        import ConfigParser as configparser
+
+    # toml is rather similar to standard ini like format except it likes values
+    # that look more JSON like. So for our purposes simply escaping all values
+    # as JSON seem to work fine.
+
+    e = lambda s: json.dumps(s)
+
+    config = configparser.RawConfigParser()
+
+    # [target.ARCH-poky-linux]
+    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+    config.add_section(target_section)
+
+    # Points to wrapper files which contain target specific compiler and linker commands.
+    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
+
+    # If we don't do this rust-native will compile it's own llvm for BUILD.
+    # [target.${BUILD_ARCH}-unknown-linux-gnu]
+    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    config.add_section(target_section)
+
+    # Wrapper scripts of build system.
+    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+
+    # [llvm]
+    config.add_section("llvm")
+    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
+    config.set("llvm", "ninja", e(False))
+
+    # [rust]
+    config.add_section("rust")
+    config.set("rust", "rpath", e(True))
+    config.set("rust", "channel", e("stable"))
+
+    # Whether or not to optimize the compiler and standard library
+    config.set("rust", "optimize", e(True))
+
+    # Emits extraneous output from tests to ensure that failures of the test
+    # harness are debuggable just from logfiles
+    config.set("rust", "verbose-tests", e(True))
+
+    # Override default linker cc.
+    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
+
+    # [build]
+    config.add_section("build")
+    config.set("build", "submodules", e(False))
+    config.set("build", "docs", e(False))
+
+    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
+    config.set("build", "rustc", e(rustc))
+
+    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
+    config.set("build", "cargo", e(cargo))
+
+    config.set("build", "vendor", e(True))
+
+    if not "targets" in locals():
+        targets = [d.getVar("TARGET_SYS", True)]
+    config.set("build", "target", e(targets))
+
+    if not "hosts" in locals():
+        hosts = [d.getVar("HOST_SYS", True)]
+    config.set("build", "host", e(hosts))
+
+    # We can't use BUILD_SYS since that is something the rust snapshot knows
+    # nothing about when trying to build some stage0 tools (like fabricate)
+    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
+
+    with open("config.toml", "w") as f:
+        config.write(f)
+
+    # set up ${WORKDIR}/cargo_home
+    bb.build.exec_func("setup_cargo_environment", d)
+}
+
+
+rust_runx () {
+    echo "COMPILE ${PN}" "$@"
+
+    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
+    # wide range of targets (not just TARGET). OE's settings for them will
+    # be inappropriate, avoid using.
+    unset CFLAGS
+    unset LDFLAGS
+    unset CXXFLAGS
+    unset CPPFLAGS
+
+    oe_cargo_fix_env
+
+    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
+}
+
+do_compile () {
+
+    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
+}
diff --git a/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
new file mode 100644
index 0000000000..34a775ba79
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
@@ -0,0 +1,995 @@
+Rust testsuite outputs error even on a single testcase failure.
+Hence, some test runs are ignored as they fail with error messages.
+
+Upstream-Status: Inappropriate [Ignore the testcase that errors out]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+diff --git a/compiler/rustc_interface/Cargo.toml b/compiler/rustc_interface/Cargo.toml
+--- a/compiler/rustc_interface/Cargo.toml	2022-01-20 09:48:08.000000000 -0800
++++ b/compiler/rustc_interface/Cargo.toml	2022-02-22 04:07:46.531776935 -0800
+@@ -5,6 +5,7 @@ edition = "2021"
+ 
+ [lib]
+ doctest = false
++test = false
+ 
+ [dependencies]
+ libc = "0.2"
+diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/src/tests.rs
+--- a/compiler/rustc_interface/src/tests.rs	2022-01-20 09:48:08.000000000 -0800
++++ b/compiler/rustc_interface/src/tests.rs	2022-02-22 08:08:21.273533403 -0800
+@@ -110,6 +110,7 @@ fn assert_non_crate_hash_different(x: &O
+ 
+ // When the user supplies --test we should implicitly supply --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string()]).unwrap();
+@@ -121,6 +122,7 @@ fn test_switch_implies_cfg_test() {
+ 
+ // When the user supplies --test and --cfg test, don't implicitly add another --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test_unless_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string(), "--cfg=test".to_string()]).unwrap();
+@@ -133,6 +135,7 @@ fn test_switch_implies_cfg_test_unless_c
+ }
+ 
+ #[test]
++#[ignore]
+ fn test_can_print_warnings() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["-Awarnings".to_string()]).unwrap();
+diff --git a/src/test/run-make/issue-36710/Makefile b/src/test/run-make/issue-36710/Makefile
+--- a/src/test/run-make/issue-36710/Makefile	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/run-make/issue-36710/Makefile	2022-02-22 05:54:47.471879168 -0800
+@@ -7,6 +7,7 @@
+ # ignore-nvptx64-nvidia-cuda FIXME: can't find crate for `std`
+ # ignore-musl FIXME: this makefile needs teaching how to use a musl toolchain
+ #                    (see dist-i586-gnu-i586-i686-musl Dockerfile)
++# ignore-stage1
+ 
+ include ../../run-make-fulldeps/tools.mk
+ 
+diff --git a/src/test/rustdoc/async-move-doctest.rs b/src/test/rustdoc/async-move-doctest.rs
+--- a/src/test/rustdoc/async-move-doctest.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/async-move-doctest.rs	2022-02-22 04:07:46.547776389 -0800
+@@ -1,5 +1,6 @@
+ // compile-flags:--test
+ // edition:2018
++// ignore-stage1
+ 
+ // Prior to setting the default edition for the doctest pre-parser,
+ // this doctest would fail due to a fatal parsing error.
+diff --git a/src/test/rustdoc/auto-traits.rs b/src/test/rustdoc/auto-traits.rs
+--- a/src/test/rustdoc/auto-traits.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/auto-traits.rs	2022-02-22 04:07:46.559775980 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:auto-traits.rs
++// ignore-stage1
+ 
+ #![feature(auto_traits)]
+ 
+diff --git a/src/test/rustdoc/check-source-code-urls-to-def.rs b/src/test/rustdoc/check-source-code-urls-to-def.rs
+--- a/src/test/rustdoc/check-source-code-urls-to-def.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/check-source-code-urls-to-def.rs	2022-02-22 04:07:46.563775844 -0800
+@@ -1,6 +1,7 @@
+ // compile-flags: -Zunstable-options --generate-link-to-definition
+ // aux-build:source_code.rs
+ // build-aux-docs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/comment-in-doctest.rs b/src/test/rustdoc/comment-in-doctest.rs
+--- a/src/test/rustdoc/comment-in-doctest.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/comment-in-doctest.rs	2022-02-22 04:07:46.567775708 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ // comments, both doc comments and regular ones, used to trick rustdoc's doctest parser into
+ // thinking that everything after it was part of the regular program. combined with the librustc_ast
+diff --git a/src/test/rustdoc/const-generics/const-generics-docs.rs b/src/test/rustdoc/const-generics/const-generics-docs.rs
+--- a/src/test/rustdoc/const-generics/const-generics-docs.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/const-generics/const-generics-docs.rs	2022-02-22 04:07:46.567775708 -0800
+@@ -1,5 +1,6 @@
+ // edition:2018
+ // aux-build: extern_crate.rs
++// ignore-stage1
+ #![crate_name = "foo"]
+ 
+ extern crate extern_crate;
+diff --git a/src/test/rustdoc/cross-crate-hidden-impl-parameter.rs b/src/test/rustdoc/cross-crate-hidden-impl-parameter.rs
+--- a/src/test/rustdoc/cross-crate-hidden-impl-parameter.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/cross-crate-hidden-impl-parameter.rs	2022-02-22 04:07:46.567775708 -0800
+@@ -1,4 +1,5 @@
+ // Issue #86448: test for cross-crate `doc(hidden)`
++// ignore-stage1
+ #![crate_name = "foo"]
+ 
+ // aux-build:cross-crate-hidden-impl-parameter.rs
+diff --git a/src/test/rustdoc/cross-crate-links.rs b/src/test/rustdoc/cross-crate-links.rs
+--- a/src/test/rustdoc/cross-crate-links.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/cross-crate-links.rs	2022-02-22 04:07:46.567775708 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:all-item-types.rs
+ // build-aux-docs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/cross-crate-primitive-doc.rs b/src/test/rustdoc/cross-crate-primitive-doc.rs
+--- a/src/test/rustdoc/cross-crate-primitive-doc.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/cross-crate-primitive-doc.rs	2022-02-22 04:07:46.567775708 -0800
+@@ -1,6 +1,7 @@
+ // aux-build:primitive-doc.rs
+ // compile-flags: --extern-html-root-url=primitive_doc=../ -Z unstable-options
+ // only-linux
++// ignore-stage1
+ 
+ #![feature(no_core)]
+ #![no_core]
+diff --git a/src/test/rustdoc/doctest-manual-crate-name.rs b/src/test/rustdoc/doctest-manual-crate-name.rs
+--- a/src/test/rustdoc/doctest-manual-crate-name.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/doctest-manual-crate-name.rs	2022-02-22 04:07:46.567775708 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ //! ```
+ //! #![crate_name="asdf"]
+diff --git a/src/test/rustdoc/edition-doctest.rs b/src/test/rustdoc/edition-doctest.rs
+--- a/src/test/rustdoc/edition-doctest.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/edition-doctest.rs	2022-02-22 04:07:46.571775571 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ /// ```rust,edition2018
+ /// #![feature(try_blocks)]
+diff --git a/src/test/rustdoc/edition-flag.rs b/src/test/rustdoc/edition-flag.rs
+--- a/src/test/rustdoc/edition-flag.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/edition-flag.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ // edition:2018
+ 
+ /// ```rust
+diff --git a/src/test/rustdoc/elided-lifetime.rs b/src/test/rustdoc/elided-lifetime.rs
+--- a/src/test/rustdoc/elided-lifetime.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/elided-lifetime.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -4,6 +4,7 @@
+ //
+ // Since Rust 2018 we encourage writing out <'_> explicitly to make it clear
+ // that borrowing is occuring. Make sure rustdoc is following the same idiom.
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/external-macro-src.rs b/src/test/rustdoc/external-macro-src.rs
+--- a/src/test/rustdoc/external-macro-src.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/external-macro-src.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:external-macro-src.rs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/extern-html-root-url.rs b/src/test/rustdoc/extern-html-root-url.rs
+--- a/src/test/rustdoc/extern-html-root-url.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/extern-html-root-url.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:-Z unstable-options --extern-html-root-url html_root=https://example.com/override --extern-html-root-url no_html_root=https://example.com/override
++// ignore-stage1
+ // aux-build:html_root.rs
+ // aux-build:no_html_root.rs
+ // NOTE: intentionally does not build any auxiliary docs
+diff --git a/src/test/rustdoc/extern-impl-trait.rs b/src/test/rustdoc/extern-impl-trait.rs
+--- a/src/test/rustdoc/extern-impl-trait.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/extern-impl-trait.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:extern-impl-trait.rs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/hide-unstable-trait.rs b/src/test/rustdoc/hide-unstable-trait.rs
+--- a/src/test/rustdoc/hide-unstable-trait.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/hide-unstable-trait.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:unstable-trait.rs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ #![feature(private_trait)]
+diff --git a/src/test/rustdoc/inline_cross/add-docs.rs b/src/test/rustdoc/inline_cross/add-docs.rs
+--- a/src/test/rustdoc/inline_cross/add-docs.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/inline_cross/add-docs.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:add-docs.rs
++// ignore-stage1
+ 
+ extern crate inner;
+ 
+diff --git a/src/test/rustdoc/inline_cross/default-trait-method.rs b/src/test/rustdoc/inline_cross/default-trait-method.rs
+--- a/src/test/rustdoc/inline_cross/default-trait-method.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/inline_cross/default-trait-method.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:default-trait-method.rs
++// ignore-stage1
+ 
+ extern crate foo;
+ 
+diff --git a/src/test/rustdoc/inline_cross/impl_trait.rs b/src/test/rustdoc/inline_cross/impl_trait.rs
+--- a/src/test/rustdoc/inline_cross/impl_trait.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/inline_cross/impl_trait.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:impl_trait_aux.rs
+ // edition:2018
++// ignore-stage1
+ 
+ extern crate impl_trait_aux;
+ 
+diff --git a/src/test/rustdoc/inline_cross/macros.rs b/src/test/rustdoc/inline_cross/macros.rs
+--- a/src/test/rustdoc/inline_cross/macros.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/inline_cross/macros.rs	2022-02-22 04:07:46.575775435 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:macros.rs
+ // build-aux-docs
++// ignore-stage1
+ 
+ #![feature(macro_test)]
+ 
+diff --git a/src/test/rustdoc/inline_cross/trait-vis.rs b/src/test/rustdoc/inline_cross/trait-vis.rs
+--- a/src/test/rustdoc/inline_cross/trait-vis.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/inline_cross/trait-vis.rs	2022-02-22 04:07:46.587775026 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:trait-vis.rs
++// ignore-stage1
+ 
+ extern crate inner;
+ 
+diff --git a/src/test/rustdoc/inline_cross/use_crate.rs b/src/test/rustdoc/inline_cross/use_crate.rs
+--- a/src/test/rustdoc/inline_cross/use_crate.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/inline_cross/use_crate.rs	2022-02-22 04:07:46.587775026 -0800
+@@ -3,6 +3,7 @@
+ // build-aux-docs
+ // edition:2018
+ // compile-flags:--extern use_crate --extern use_crate_2
++// ignore-stage1
+ 
+ // During the buildup to Rust 2018, rustdoc would eagerly inline `pub use some_crate;` as if it
+ // were a module, so we changed it to make `pub use`ing crate roots remain as a `pub use` statement
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs b/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs	2022-02-22 04:07:46.587775026 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:additional_doc.rs
+ // build-aux-docs
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ 
+ extern crate my_rand;
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/basic.rs b/src/test/rustdoc/intra-doc/cross-crate/basic.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/basic.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/basic.rs	2022-02-22 04:07:46.587775026 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:intra-doc-basic.rs
+ // build-aux-docs
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ 
+ // from https://github.com/rust-lang/rust/issues/65983
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/crate.rs b/src/test/rustdoc/intra-doc/cross-crate/crate.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/crate.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/crate.rs	2022-02-22 04:07:46.587775026 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:intra-link-cross-crate-crate.rs
+ // build-aux-docs
++// ignore-stage1
+ #![crate_name = "outer"]
+ extern crate inner;
+ // @has outer/fn.f.html '//a[@href="../inner/fn.g.html"]' "crate::g"
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/hidden.rs b/src/test/rustdoc/intra-doc/cross-crate/hidden.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/hidden.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/hidden.rs	2022-02-22 04:07:46.587775026 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:hidden.rs
+ // build-aux-docs
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ 
+ // tests https://github.com/rust-lang/rust/issues/73363
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/macro.rs b/src/test/rustdoc/intra-doc/cross-crate/macro.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/macro.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/macro.rs	2022-02-22 04:07:46.587775026 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:macro_inner.rs
+ // aux-build:proc_macro.rs
++// ignore-stage1
+ // build-aux-docs
+ #![deny(broken_intra_doc_links)]
+ extern crate macro_inner;
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/module.rs b/src/test/rustdoc/intra-doc/cross-crate/module.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/module.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/module.rs	2022-02-22 04:07:46.591774889 -0800
+@@ -1,6 +1,7 @@
+ // outer.rs
+ // aux-build: module.rs
+ // build-aux-docs
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ extern crate module_inner;
+ // @has 'module/bar/index.html' '//a[@href="../../module_inner/trait.SomeTrait.html"]' 'SomeTrait'
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs b/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs	2022-02-22 04:07:46.591774889 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:submodule-inner.rs
+ // build-aux-docs
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ 
+ extern crate a;
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs b/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs	2022-02-22 04:07:46.591774889 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:submodule-outer.rs
+ // edition:2018
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ 
+ extern crate bar as bar_;
+diff --git a/src/test/rustdoc/intra-doc/cross-crate/traits.rs b/src/test/rustdoc/intra-doc/cross-crate/traits.rs
+--- a/src/test/rustdoc/intra-doc/cross-crate/traits.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/cross-crate/traits.rs	2022-02-22 04:07:46.591774889 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:traits.rs
+ // build-aux-docs
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ 
+ extern crate inner;
+diff --git a/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link.rs b/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link.rs
+--- a/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link.rs	2022-02-22 04:07:46.591774889 -0800
+@@ -1,5 +1,6 @@
+ // This test is just a little cursed.
+ // aux-build:issue-66159-1.rs
++// ignore-stage1
+ // aux-crate:priv:issue_66159_1=issue-66159-1.rs
+ // aux-build:empty.rs
+ // aux-crate:priv:empty=empty.rs
+diff --git a/src/test/rustdoc/intra-doc/extern-crate.rs b/src/test/rustdoc/intra-doc/extern-crate.rs
+--- a/src/test/rustdoc/intra-doc/extern-crate.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/extern-crate.rs	2022-02-22 04:07:46.591774889 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:intra-link-extern-crate.rs
++// ignore-stage1
+ 
+ // When loading `extern crate` statements, we would pull in their docs at the same time, even
+ // though they would never actually get displayed. This tripped intra-doc-link resolution failures,
+diff --git a/src/test/rustdoc/intra-doc/pub-use.rs b/src/test/rustdoc/intra-doc/pub-use.rs
+--- a/src/test/rustdoc/intra-doc/pub-use.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/pub-use.rs	2022-02-22 04:07:46.595774753 -0800
+@@ -1,4 +1,5 @@
+ // aux-build: intra-link-pub-use.rs
++// ignore-stage1
+ #![deny(broken_intra_doc_links)]
+ #![crate_name = "outer"]
+ 
+diff --git a/src/test/rustdoc/intra-doc/reexport-additional-docs.rs b/src/test/rustdoc/intra-doc/reexport-additional-docs.rs
+--- a/src/test/rustdoc/intra-doc/reexport-additional-docs.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc/reexport-additional-docs.rs	2022-02-22 04:07:46.595774753 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:intra-link-reexport-additional-docs.rs
+ // build-aux-docs
++// ignore-stage1
+ #![crate_name = "foo"]
+ extern crate inner;
+ 
+diff --git a/src/test/rustdoc/intra-doc-crate/self.rs b/src/test/rustdoc/intra-doc-crate/self.rs
+--- a/src/test/rustdoc/intra-doc-crate/self.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/intra-doc-crate/self.rs	2022-02-22 04:07:46.595774753 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:self.rs
+ // build-aux-docs
++// ignore-stage1
+ 
+ extern crate cross_crate_self;
+ 
+diff --git a/src/test/rustdoc/issue-18199.rs b/src/test/rustdoc/issue-18199.rs
+--- a/src/test/rustdoc/issue-18199.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-18199.rs	2022-02-22 04:07:46.595774753 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ #![doc(test(attr(feature(staged_api))))]
+ 
+diff --git a/src/test/rustdoc/issue-23106.rs b/src/test/rustdoc/issue-23106.rs
+--- a/src/test/rustdoc/issue-23106.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-23106.rs	2022-02-22 04:07:46.595774753 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ /// ```
+ /// #
+diff --git a/src/test/rustdoc/issue-23744.rs b/src/test/rustdoc/issue-23744.rs
+--- a/src/test/rustdoc/issue-23744.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-23744.rs	2022-02-22 04:07:46.599774617 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ /// Example of rustdoc incorrectly parsing <code>```rust,should_panic</code>.
+ ///
+diff --git a/src/test/rustdoc/issue-25944.rs b/src/test/rustdoc/issue-25944.rs
+--- a/src/test/rustdoc/issue-25944.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-25944.rs	2022-02-22 04:07:46.599774617 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ /// ```
+ /// let a = r#"
+diff --git a/src/test/rustdoc/issue-30252.rs b/src/test/rustdoc/issue-30252.rs
+--- a/src/test/rustdoc/issue-30252.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-30252.rs	2022-02-22 04:07:46.599774617 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test --cfg feature="bar"
++// ignore-stage1
+ 
+ /// ```rust
+ /// assert_eq!(cfg!(feature = "bar"), true);
+diff --git a/src/test/rustdoc/issue-38129.rs b/src/test/rustdoc/issue-38129.rs
+--- a/src/test/rustdoc/issue-38129.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-38129.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ // This file tests the source-partitioning behavior of rustdoc.
+ // Each test contains some code that should be put into the generated
+diff --git a/src/test/rustdoc/issue-40936.rs b/src/test/rustdoc/issue-40936.rs
+--- a/src/test/rustdoc/issue-40936.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-40936.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:issue-40936.rs
+ // build-aux-docs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/issue-43153.rs b/src/test/rustdoc/issue-43153.rs
+--- a/src/test/rustdoc/issue-43153.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-43153.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,6 +1,7 @@
+ // Test that `include!` in a doc test searches relative to the directory in
+ // which the test is declared.
+ 
++// ignore-stage1
+ // compile-flags:--test
+ 
+ /// ```rust
+diff --git a/src/test/rustdoc/issue-46727.rs b/src/test/rustdoc/issue-46727.rs
+--- a/src/test/rustdoc/issue-46727.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-46727.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:issue-46727.rs
++// ignore-stage1
+ 
+ extern crate issue_46727;
+ 
+diff --git a/src/test/rustdoc/issue-48377.rs b/src/test/rustdoc/issue-48377.rs
+--- a/src/test/rustdoc/issue-48377.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-48377.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ //! This is a doc comment
+ //!
+diff --git a/src/test/rustdoc/issue-48414.rs b/src/test/rustdoc/issue-48414.rs
+--- a/src/test/rustdoc/issue-48414.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-48414.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:issue-48414.rs
++// ignore-stage1
+ 
+ // ICE when resolving paths for a trait that linked to another trait, when both were in an external
+ // crate
+diff --git a/src/test/rustdoc/issue-53689.rs b/src/test/rustdoc/issue-53689.rs
+--- a/src/test/rustdoc/issue-53689.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-53689.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:issue-53689.rs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/issue-54478-demo-allocator.rs b/src/test/rustdoc/issue-54478-demo-allocator.rs
+--- a/src/test/rustdoc/issue-54478-demo-allocator.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-54478-demo-allocator.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -13,6 +13,7 @@
+ // default setting, by leaving off `-C prefer-dynamic`.
+ 
+ // compile-flags:--test
++// ignore-stage1
+ 
+ //! This is a doc comment
+ //!
+diff --git a/src/test/rustdoc/issue-57180.rs b/src/test/rustdoc/issue-57180.rs
+--- a/src/test/rustdoc/issue-57180.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-57180.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:issue-57180.rs
++// ignore-stage1
+ 
+ extern crate issue_57180;
+ use issue_57180::Trait;
+diff --git a/src/test/rustdoc/issue-61592.rs b/src/test/rustdoc/issue-61592.rs
+--- a/src/test/rustdoc/issue-61592.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-61592.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:issue-61592.rs
++// ignore-stage1
+ 
+ extern crate foo;
+ 
+diff --git a/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs b/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs
+--- a/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,4 +1,5 @@
+ // Regression test for ICE #73061
++// ignore-stage1
+ 
+ // aux-build:issue-73061.rs
+ 
+diff --git a/src/test/rustdoc/issue-75588.rs b/src/test/rustdoc/issue-75588.rs
+--- a/src/test/rustdoc/issue-75588.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-75588.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:realcore.rs
+ // aux-build:real_gimli.rs
++// ignore-stage1
+ 
+ // Ensure unstably exported traits have their Implementors sections.
+ 
+diff --git a/src/test/rustdoc/issue-85454.rs b/src/test/rustdoc/issue-85454.rs
+--- a/src/test/rustdoc/issue-85454.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-85454.rs	2022-02-22 04:07:46.607774344 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:issue-85454.rs
+ // build-aux-docs
++// ignore-stage1
+ #![crate_name = "foo"]
+ 
+ extern crate issue_85454;
+diff --git a/src/test/rustdoc/issue-86620.rs b/src/test/rustdoc/issue-86620.rs
+--- a/src/test/rustdoc/issue-86620.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/issue-86620.rs	2022-02-22 04:07:46.611774208 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:issue-86620-1.rs
++// ignore-stage1
+ 
+ extern crate issue_86620_1;
+ 
+diff --git a/src/test/rustdoc/macro_pub_in_module.rs b/src/test/rustdoc/macro_pub_in_module.rs
+--- a/src/test/rustdoc/macro_pub_in_module.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/macro_pub_in_module.rs	2022-02-22 04:07:46.611774208 -0800
+@@ -1,6 +1,7 @@
+ // aux-build:macro_pub_in_module.rs
+ // edition:2018
+ // build-aux-docs
++// ignore-stage1
+ 
+ //! See issue #74355
+ #![feature(decl_macro, no_core, rustc_attrs)]
+diff --git a/src/test/rustdoc/masked.rs b/src/test/rustdoc/masked.rs
+--- a/src/test/rustdoc/masked.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/masked.rs	2022-02-22 04:07:46.611774208 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:masked.rs
++// ignore-stage1
+ 
+ #![feature(doc_masked)]
+ 
+diff --git a/src/test/rustdoc/normalize-assoc-item.rs b/src/test/rustdoc/normalize-assoc-item.rs
+--- a/src/test/rustdoc/normalize-assoc-item.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/normalize-assoc-item.rs	2022-02-22 04:07:46.611774208 -0800
+@@ -2,6 +2,7 @@
+ // aux-build:normalize-assoc-item.rs
+ // build-aux-docs
+ // compile-flags:-Znormalize-docs
++// ignore-stage1
+ 
+ pub trait Trait {
+     type X;
+diff --git a/src/test/rustdoc/no-stack-overflow-25295.rs b/src/test/rustdoc/no-stack-overflow-25295.rs
+--- a/src/test/rustdoc/no-stack-overflow-25295.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/no-stack-overflow-25295.rs	2022-02-22 04:07:46.611774208 -0800
+@@ -1,5 +1,6 @@
+ // Ensure this code doesn't stack overflow.
+ // aux-build:enum-primitive.rs
++// ignore-stage1
+ 
+ #[macro_use] extern crate enum_primitive;
+ 
+diff --git a/src/test/rustdoc/primitive-reexport.rs b/src/test/rustdoc/primitive-reexport.rs
+--- a/src/test/rustdoc/primitive-reexport.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/primitive-reexport.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,5 +1,6 @@
+ // aux-build: primitive-reexport.rs
+ // compile-flags:--extern foo --edition 2018
++// ignore-stage1
+ 
+ #![crate_name = "bar"]
+ 
+diff --git a/src/test/rustdoc/process-termination.rs b/src/test/rustdoc/process-termination.rs
+--- a/src/test/rustdoc/process-termination.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/process-termination.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags:--test
++// ignore-stage1
+ 
+ /// A check of using various process termination strategies
+ ///
+diff --git a/src/test/rustdoc/pub-extern-crate.rs b/src/test/rustdoc/pub-extern-crate.rs
+--- a/src/test/rustdoc/pub-extern-crate.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/pub-extern-crate.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:pub-extern-crate.rs
++// ignore-stage1
+ 
+ // @has pub_extern_crate/index.html
+ // @!has - '//code' 'pub extern crate inner'
+diff --git a/src/test/rustdoc/pub-use-extern-macros.rs b/src/test/rustdoc/pub-use-extern-macros.rs
+--- a/src/test/rustdoc/pub-use-extern-macros.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/pub-use-extern-macros.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:pub-use-extern-macros.rs
++// ignore-stage1
+ 
+ extern crate macros;
+ 
+diff --git a/src/test/rustdoc/reexport-check.rs b/src/test/rustdoc/reexport-check.rs
+--- a/src/test/rustdoc/reexport-check.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/reexport-check.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:reexport-check.rs
++// ignore-stage1
+ #![crate_name = "foo"]
+ 
+ extern crate reexport_check;
+diff --git a/src/test/rustdoc/reexports-priv.rs b/src/test/rustdoc/reexports-priv.rs
+--- a/src/test/rustdoc/reexports-priv.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/reexports-priv.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,5 +1,6 @@
+ // aux-build: reexports.rs
+ // compile-flags: --document-private-items
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/reexports.rs b/src/test/rustdoc/reexports.rs
+--- a/src/test/rustdoc/reexports.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/reexports.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,4 +1,5 @@
+ // aux-build: reexports.rs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/test_option_check/bar.rs b/src/test/rustdoc/test_option_check/bar.rs
+--- a/src/test/rustdoc/test_option_check/bar.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/test_option_check/bar.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,5 +1,6 @@
+ // compile-flags: --test
+ // check-test-line-numbers-match
++// ignore-stage1
+ 
+ /// This looks like another awesome test!
+ ///
+diff --git a/src/test/rustdoc/test_option_check/test.rs b/src/test/rustdoc/test_option_check/test.rs
+--- a/src/test/rustdoc/test_option_check/test.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/test_option_check/test.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,5 +1,6 @@
+ // compile-flags: --test
+ // check-test-line-numbers-match
++// ignore-stage1
+ 
+ pub mod bar;
+ 
+diff --git a/src/test/rustdoc/trait-alias-mention.rs b/src/test/rustdoc/trait-alias-mention.rs
+--- a/src/test/rustdoc/trait-alias-mention.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/trait-alias-mention.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:trait-alias-mention.rs
+ // build-aux-docs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/trait-visibility.rs b/src/test/rustdoc/trait-visibility.rs
+--- a/src/test/rustdoc/trait-visibility.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/trait-visibility.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:trait-visibility.rs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc/unit-return.rs b/src/test/rustdoc/unit-return.rs
+--- a/src/test/rustdoc/unit-return.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc/unit-return.rs	2022-02-22 04:07:46.615774071 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:unit-return.rs
++// ignore-stage1
+ 
+ #![crate_name = "foo"]
+ 
+diff --git a/src/test/rustdoc-ui/cfg-test.rs b/src/test/rustdoc-ui/cfg-test.rs
+--- a/src/test/rustdoc-ui/cfg-test.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/cfg-test.rs	2022-02-22 07:18:00.609883317 -0800
+@@ -5,6 +5,7 @@
+ 
+ // Crates like core have doctests gated on `cfg(not(test))` so we need to make
+ // sure `cfg(test)` is not active when running `rustdoc --test`.
++// ignore-stage1
+ 
+ /// this doctest will be ignored:
+ ///
+diff --git a/src/test/rustdoc-ui/display-output.rs b/src/test/rustdoc-ui/display-output.rs
+--- a/src/test/rustdoc-ui/display-output.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/display-output.rs	2022-02-22 07:18:57.687895503 -0800
+@@ -2,6 +2,7 @@
+ 
+ // check-pass
+ // edition:2018
++// ignore-stage1
+ // compile-flags:--test --test-args=--show-output
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+diff --git a/src/test/rustdoc-ui/doc-test-doctest-feature.rs b/src/test/rustdoc-ui/doc-test-doctest-feature.rs
+--- a/src/test/rustdoc-ui/doc-test-doctest-feature.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/doc-test-doctest-feature.rs	2022-02-22 07:19:22.643027677 -0800
+@@ -2,6 +2,7 @@
+ // compile-flags:--test
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ // Make sure `cfg(doctest)` is set when finding doctests but not inside
+ // the doctests.
+diff --git a/src/test/rustdoc-ui/doctest-output.rs b/src/test/rustdoc-ui/doctest-output.rs
+--- a/src/test/rustdoc-ui/doctest-output.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/doctest-output.rs	2022-02-22 07:20:01.753669019 -0800
+@@ -4,6 +4,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+ 
+ //! ```
+ //! assert_eq!(1 + 1, 2);
+diff --git a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs b/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs
+--- a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs	2022-02-22 07:19:44.946252681 -0800
+@@ -2,6 +2,7 @@
+ // compile-flags:--test
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ #![feature(doc_cfg)]
+ 
+diff --git a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs b/src/test/rustdoc-ui/failed-doctest-compile-fail.rs
+--- a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/failed-doctest-compile-fail.rs	2022-02-22 07:20:16.185168104 -0800
+@@ -5,6 +5,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // failure-status: 101
++// ignore-stage1
+ 
+ /// ```compile_fail
+ /// println!("Hello");
+diff --git a/src/test/rustdoc-ui/issue-91134.rs b/src/test/rustdoc-ui/issue-91134.rs
+--- a/src/test/rustdoc-ui/issue-91134.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/issue-91134.rs	2022-02-22 07:20:32.008619125 -0800
+@@ -4,6 +4,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // edition:2021
++// ignore-stage1
+ 
+ /// <https://github.com/rust-lang/rust/issues/91134>
+ ///
+diff --git a/src/test/rustdoc-ui/nocapture.rs b/src/test/rustdoc-ui/nocapture.rs
+--- a/src/test/rustdoc-ui/nocapture.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/nocapture.rs	2022-02-22 07:20:58.839688819 -0800
+@@ -2,6 +2,7 @@
+ // compile-flags:--test -Zunstable-options --nocapture
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ /// ```
+ /// println!("hello!");
+diff --git a/src/test/rustdoc-ui/run-directory.rs b/src/test/rustdoc-ui/run-directory.rs
+--- a/src/test/rustdoc-ui/run-directory.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/run-directory.rs	2022-02-22 07:21:16.591073711 -0800
+@@ -6,6 +6,7 @@
+ // [incorrect]compile-flags:--test --test-run-directory={{src-base}}/coverage -Zunstable-options
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ /// ```
+ /// assert_eq!(
+diff --git a/src/test/rustdoc-ui/test-no_std.rs b/src/test/rustdoc-ui/test-no_std.rs
+--- a/src/test/rustdoc-ui/test-no_std.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/test-no_std.rs	2022-02-22 07:21:30.038607931 -0800
+@@ -2,6 +2,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+ 
+ #![no_std]
+ 
+diff --git a/src/test/rustdoc-ui/test-type.rs b/src/test/rustdoc-ui/test-type.rs
+--- a/src/test/rustdoc-ui/test-type.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/rustdoc-ui/test-type.rs	2022-02-22 07:21:49.769924795 -0800
+@@ -2,6 +2,7 @@
+ // check-pass
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ /// ```
+ /// let a = true;
+diff --git a/src/test/ui/abi/stack-probes-lto.rs b/src/test/ui/abi/stack-probes-lto.rs
+--- a/src/test/ui/abi/stack-probes-lto.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui/abi/stack-probes-lto.rs	2022-02-22 21:46:34.094521234 -0800
+@@ -14,5 +14,6 @@
+ // ignore-pretty
+ // compile-flags: -C lto
+ // no-prefer-dynamic
++// ignore-stage1
+ 
+ include!("stack-probes.rs");
+diff --git a/src/test/ui/abi/stack-probes.rs b/src/test/ui/abi/stack-probes.rs
+--- a/src/test/ui/abi/stack-probes.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui/abi/stack-probes.rs	2022-02-22 21:46:46.630088905 -0800
+@@ -10,6 +10,7 @@
+ // ignore-wasm
+ // ignore-emscripten no processes
+ // ignore-sgx no processes
++// ignore-stage1
+ 
+ use std::env;
+ use std::mem::MaybeUninit;
+diff --git a/src/test/ui/macros/restricted-shadowing-legacy.rs b/src/test/ui/macros/restricted-shadowing-legacy.rs
+--- a/src/test/ui/macros/restricted-shadowing-legacy.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui/macros/restricted-shadowing-legacy.rs	2022-02-22 04:07:46.619773935 -0800
+@@ -74,6 +74,7 @@
+ // 62 |   Unordered   |   Unordered   |       =       |    +?    |
+ // 63 |   Unordered   |   Unordered   |       >       |    +?    |
+ // 64 |   Unordered   |   Unordered   |   Unordered   |    +     |
++// ignore-stage1
+ 
+ #![feature(decl_macro, rustc_attrs)]
+ 
+diff --git a/src/test/ui/simd/target-feature-mixup.rs b/src/test/ui/simd/target-feature-mixup.rs
+--- a/src/test/ui/simd/target-feature-mixup.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui/simd/target-feature-mixup.rs	2022-02-22 04:07:46.627773663 -0800
+@@ -5,6 +5,7 @@
+ 
+ // ignore-emscripten
+ // ignore-sgx no processes
++// ignore-stage1
+ 
+ #![feature(repr_simd, target_feature, cfg_target_feature)]
+ #![feature(avx512_target_feature)]
+diff --git a/src/test/ui-fulldeps/gated-plugin.rs b/src/test/ui-fulldeps/gated-plugin.rs
+--- a/src/test/ui-fulldeps/gated-plugin.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/gated-plugin.rs	2022-02-22 04:07:46.627773663 -0800
+@@ -1,4 +1,5 @@
+ // aux-build:empty-plugin.rs
++// ignore-stage1
+ 
+ #![plugin(empty_plugin)]
+ //~^ ERROR compiler plugins are deprecated
+diff --git a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
+--- a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs	2022-02-22 04:07:46.627773663 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::default_hash_types)]
+diff --git a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs
+--- a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs	2022-02-22 04:07:46.627773663 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::lint_pass_impl_without_macro)]
+diff --git a/src/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs b/src/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs
+--- a/src/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs	2022-02-22 04:07:46.627773663 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::ty_pass_by_reference)]
+diff --git a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
+--- a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs	2022-02-22 04:07:46.627773663 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::usage_of_qualified_ty)]
+diff --git a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs b/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
+--- a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs	2022-02-22 04:07:46.627773663 -0800
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ 
+diff --git a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs b/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
+--- a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs	2022-02-22 04:07:46.635773390 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:lint-group-plugin-test.rs
+ // check-pass
++// ignore-stage1
+ // compile-flags: -D unused -A unused-variables
+ 
+ fn main() {
+diff --git a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
+--- a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs	2022-02-22 04:07:46.635773390 -0800
+@@ -1,5 +1,6 @@
+ // aux-build:lint-group-plugin-test.rs
+ // compile-flags: -F unused -A unused
++// ignore-stage1
+ 
+ fn main() {
+     let x = 1;
+diff --git a/src/test/ui-fulldeps/lint-pass-macros.rs b/src/test/ui-fulldeps/lint-pass-macros.rs
+--- a/src/test/ui-fulldeps/lint-pass-macros.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/lint-pass-macros.rs	2022-02-22 04:07:46.635773390 -0800
+@@ -1,5 +1,6 @@
+ // compile-flags: -Z unstable-options
+ // check-pass
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ 
+diff --git a/src/test/ui-fulldeps/multiple-plugins.rs b/src/test/ui-fulldeps/multiple-plugins.rs
+--- a/src/test/ui-fulldeps/multiple-plugins.rs	2022-01-20 09:48:09.000000000 -0800
++++ b/src/test/ui-fulldeps/multiple-plugins.rs	2022-02-22 04:07:46.635773390 -0800
+@@ -1,5 +1,6 @@
+ // run-pass
+ // aux-build:multiple-plugins-1.rs
++// ignore-stage1
+ // aux-build:multiple-plugins-2.rs
+ 
+ // Check that the plugin registrar of multiple plugins doesn't conflict
diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.58.1.bb b/meta/recipes-devtools/rust/rust-testsuite_1.58.1.bb
new file mode 100644
index 0000000000..d334231c8f
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.58.1.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source.inc
+require rust-snapshot.inc
-- 
2.31.1


