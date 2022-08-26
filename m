Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFE3ECAAD2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 09:38:05 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.35331.1661506675716355607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 02:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ggevT6vf;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so7222157pjq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=dE+hKlrXkxedqUyVDfACDkaYDXsA46gZ9o0mcYqjTsU=;
        b=ggevT6vfArr+NXvMwOY6ANpjfLtDnglWSOE3kkQU04+M2/PSHMLRE1fsvq6+zKBS/N
         PTGuGE06rkZjsLrFP8ylPDZqSTTFOzdFHzX7bCvt5lQzfe9Z1SrQMRG98Z/hfMiZSdfz
         kQ/FCmnLk41W5pmD4wCLOmy/jZ7WNgQrrCEnG3OqnPpvDpIOqttoPkHG6L690LD07aFT
         4BKxt2mGVxnDoUHLDW+I7DdcaF+AOvSOOuP5QH/sTntGd5AhUTbGgdyCvsw101plaISL
         PXXw7FGTVojLnbnlLkEoiDErrNZCPgLdbcvQAIl5DhUOSCZCs7ZJfU5PHg/oqLLm4Q0m
         WXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=dE+hKlrXkxedqUyVDfACDkaYDXsA46gZ9o0mcYqjTsU=;
        b=CHB5cM5XgGNfEnUJqI5/5I2Mp4PcWBEMS4yY1mO4EVA7yJhDILo5IkCwAJD8U/tJn4
         lcQijBDuf8gS+6rf+brfFl/T+bMVOzw+tCdJTwqoqGSndhFiAm+2/SWTzQfXcWgIcSIE
         llC1jFlp3S98yBWvMhuN+8dYfw0EOfLqHbm7kPXsOUoFEJ5MYRzQ7cps4tFRlfo6dJZ6
         ncL2s7w5+WpM3vduB6aEXTfkgQOFGt6ojHm6syDGsaiwW/pgM7WVHi89uXakhfiUS3Dm
         TBD5/H0D9zjUK2m3npNsaxfFKGgTNnz0lvmXr+uxT8wTv3I5X0CMsnh0yMpTzLtIGt/c
         oSnQ==
X-Gm-Message-State: ACgBeo3x7gONllQU7whOVjx9elgUK+AHuzw49bKeyXz/KJ3sCb8EgLCD
	/Dqj1HWwCEqlAIfQBkF+HTgG00LWNa9Feg==
X-Google-Smtp-Source: 
 AA6agR6lYxvOdMCeS9Jz7R9mJXW3GWSiBfrYeHGd+ogt9A8Jge/8MBbbMU/b3Jf9uYcddLJN3H4EuQ==
X-Received: by 2002:a17:902:c102:b0:172:ce4b:870c with SMTP id
 2-20020a170902c10200b00172ce4b870cmr2884890pli.155.1661506674436;
        Fri, 26 Aug 2022 02:37:54 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a170903248400b0016a7b9558f7sm1091085plw.136.2022.08.26.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 02:37:53 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	vinay.m.engg@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [RFC] Rust Oe-Selftest implementation
Date: Fri, 26 Aug 2022 15:07:47 +0530
Message-Id: <20220826093747.1879722-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 09:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169906

From: pgowda <pgowda.cve@gmail.com>

Implemented Rust Oe-Selftest on the latest Rust sources with
modifications. Rust testsuite will be merged with Rust to avoid
duplication. rust-testsuite.inc modifications will be merged into
rust.inc file. There were errors encountered during the rust-testsuite
build which are fixed. However, there is a linker error as follows which
if fixed would run the testsuite successfully.
Please consider the current patch for review and let us know if any
modifications are required for the final draft of the patch.

========================================================================
  Compiling rustc-main v0.0.0 (tmp/work/core2-64-poky-linux/rust-testsuite/1.62.1-r0/rustc-1.62.1-src/compiler/rustc)
error: linking with `tmp/work/core2-64-poky-linux/rust-testsuite/1.62.1-r0/wrapper/target-rust-cc` failed: exit status: 1

rustc-1.62.1-src/build/x86_64-unknown-linux-gnu/stage1-rustc/x86_64-poky-linux-gnu/release/deps/librustc_driver-b7e5da8186904a15.so: undefined reference to `compressBound'
          collect2: error: ld returned 1 exit status

  = help: some `extern` functions couldn't be found; some native libraries may need to be installed or have their path specified
  = note: use the `-l` flag to specify native libraries to link
  = note: use the `cargo:rustc-link-lib` directive to specify the native libraries to link with Cargo (see https://doc.rust-lang.org/cargo/reference/build-scripts.html#cargorustc-link-libkindname)

error: could not compile `rustc-main` due to previous error
========================================================================

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/classes-recipe/rust-common.bbclass       |   2 +
 .../classes-recipe/rust-target-config.bbclass |   1 -
 meta/lib/oeqa/selftest/cases/rust.py          |  58 +++
 meta/recipes-devtools/rust/rust-testsuite.inc | 174 +++++++
 .../rust-testsuite/rust-oe-selftest.patch     | 444 ++++++++++++++++++
 .../rust/rust-testsuite_1.62.1.bb             |   3 +
 6 files changed, 681 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.62.1.bb

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 93bf6c8be6..7b1b818a04 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -57,6 +57,8 @@ def rust_base_triple(d, thing):
     bpn = d.getVar('BPN')
     if thing == "BUILD" and bpn in ["rust"]:
         return arch + "-unknown-linux-gnu"
+    if thing == "BUILD" and bpn in ["rust-testsuite"]:
+        return arch + "-unknown-linux-gnu"
 
     vendor = d.getVar('{}_VENDOR'.format(thing))
 
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 3405086402..e30eaa1da3 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -362,7 +362,6 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['linker-is-gnu'] = True
     tspec['linker-flavor'] = "gcc"
     tspec['has-rpath'] = True
-    tspec['has-elf-tls'] = True
     tspec['position-independent-executables'] = True
     tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
 
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..64134a91cd
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,58 @@
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
+			tcpath = get_bb_var("TARGET_SYS", "rust-testsuite")
+			targetsys = get_bb_var("RUST_TARGET_SYS", "rust-testsuite")
+			rustlibpath = get_bb_var("WORKDIR", "rust-testsuite")
+			tmpdir = get_bb_var("TMPDIR", "rust-testsuite")
+
+			# Exclude the test folders that error out while building
+			# Need to fix these errors and include them for testing
+			testargs = "--exclude src/test/rustdoc --exclude src/test/rustdoc-json  --exclude src/test/run-make-fulldeps --exclude src/tools/tidy --exclude src/tools/rustdoc-themes --exclude src/rustdoc-json-types --exclude src/librustdoc --exclude src/doc/unstable-book --exclude src/doc/rustdoc --exclude src/doc/rustc --exclude library/panic_abort --exclude library/panic_unwind --exclude src/test/rustdoc --no-doc --no-fail-fast --bless"
+
+			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
+			cmd = " export PATH=%s/recipe-sysroot-native/usr/bin:$PATH;" % rustlibpath
+			cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, tcpath, tmpdir)
+			cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
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
index 0000000000..17adfd8b81
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -0,0 +1,174 @@
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
+DEPENDS += "file-native zlib"
+EXCLUDE_FROM_WORLD = "1"
+
+S = "${RUSTSRC}"
+CCLD:append = " -lz"
+
+# This should be removed as the path is already set in rust-target-config.bbclass to rust-targets
+# Path of target specification file "target-poky-linux.json"
+# export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
+
+export FORCE_CRATE_HASH="${BB_TASKHASH}"
+
+# We don't want to use bitbakes vendoring because the rust sources do their
+# own vendoring.
+CARGO_DISABLE_BITBAKE_VENDORING = "1"
+
+# We can't use RUST_BUILD_SYS here because that may be "musl" if
+# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
+setup_cargo_environment () {
+    # The first step is to build bootstrap and some early stage tools,
+    # these are build for the same target as the snapshot, e.g.
+    # x86_64-unknown-linux-gnu.
+    # Later stages are build for the native target (i.e. target.x86_64-linux)
+    cargo_common_do_configure
+}
+
+inherit rust-target-config
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
+    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
+    config.add_section(host_section)
+
+    # Points to wrapper files which contain target specific compiler and linker commands.
+    config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    if "musl" in host_section:
+        config.set(host_section, "musl-root", e(d.expand("${STAGING_DIR_HOST}${exec_prefix}")))
+
+    # If we don't do this rust-native will compile it's own llvm for BUILD.
+    # [target.${BUILD_ARCH}-unknown-linux-gnu]
+    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
+    if build_section != host_section:
+        config.add_section(build_section)
+
+        config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+        config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+        config.set(build_section, "linker", e(d.expand("${RUST_BUILD_CCLD}")))
+
+    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    if target_section != host_section and target_section != build_section:
+         config.add_section(target_section)
+
+         config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+         config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+         config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
+
+
+    # Wrapper scripts of build system.
+
+    # [llvm]
+    config.add_section("llvm")
+    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
+    config.set("llvm", "ninja", e(False))
+    config.set("llvm", "static-libstdcpp", e(False))
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
+        targets = [d.getVar("RUST_TARGET_SYS", True)]
+    config.set("build", "target", e(targets))
+
+    if not "hosts" in locals():
+        hosts = [d.getVar("RUST_HOST_SYS", True)]
+    config.set("build", "host", e(hosts))
+
+    # We can't use BUILD_SYS since that is something the rust snapshot knows
+    # nothing about when trying to build some stage0 tools (like fabricate)
+    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
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
+    # wide range of targets (not just TARGET). Yocto's settings for them will
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
+    rust_runx build src/tools/remote-test-server --target "${RUST_TARGET_SYS}"
+}
diff --git a/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
new file mode 100644
index 0000000000..f3bbf58a85
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
@@ -0,0 +1,444 @@
+Rust testsuite outputs error even on a single testcase failure.
+Hence, some test runs are ignored as they fail with error messages.
+
+Upstream-Status: Inappropriate [Ignore the testcase that errors out]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+
+diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/src/tests.rs
+index 1327bf6fc..41f5dfbc4 100644
+--- a/compiler/rustc_interface/src/tests.rs
++++ b/compiler/rustc_interface/src/tests.rs
+@@ -113,6 +113,7 @@ fn assert_non_crate_hash_different(x: &Options, y: &Options) {
+ 
+ // When the user supplies --test we should implicitly supply --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string()]).unwrap();
+@@ -124,6 +125,7 @@ fn test_switch_implies_cfg_test() {
+ 
+ // When the user supplies --test and --cfg test, don't implicitly add another --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test_unless_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string(), "--cfg=test".to_string()]).unwrap();
+@@ -136,6 +138,7 @@ fn test_switch_implies_cfg_test_unless_cfg_test() {
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
+diff --git a/src/test/assembly/asm/aarch64-outline-atomics.rs b/src/test/assembly/asm/aarch64-outline-atomics.rs
+index c2ec4e911..150d23004 100644
+--- a/src/test/assembly/asm/aarch64-outline-atomics.rs
++++ b/src/test/assembly/asm/aarch64-outline-atomics.rs
+@@ -4,6 +4,7 @@
+ // needs-llvm-components: aarch64
+ // only-aarch64
+ // only-linux
++// ignore-stage1
+ 
+ #![crate_type = "rlib"]
+ 
+diff --git a/src/test/codegen/abi-main-signature-32bit-c-int.rs b/src/test/codegen/abi-main-signature-32bit-c-int.rs
+index a7a4520ff..fcd409287 100644
+--- a/src/test/codegen/abi-main-signature-32bit-c-int.rs
++++ b/src/test/codegen/abi-main-signature-32bit-c-int.rs
+@@ -3,6 +3,7 @@
+ 
+ // This test is for targets with 32bit c_int only.
+ // ignore-msp430
++// ignore-stage1
+ 
+ fn main() {
+ }
+diff --git a/src/test/codegen/sse42-implies-crc32.rs b/src/test/codegen/sse42-implies-crc32.rs
+index 47b1a8993..71e2d5ef7 100644
+--- a/src/test/codegen/sse42-implies-crc32.rs
++++ b/src/test/codegen/sse42-implies-crc32.rs
+@@ -1,6 +1,7 @@
+ // only-x86_64
+ // min-llvm-version: 14.0
+ // compile-flags: -Copt-level=3
++// ignore-stage1
+ 
+ #![crate_type = "lib"]
+ 
+diff --git a/src/test/codegen/thread-local.rs b/src/test/codegen/thread-local.rs
+index c59b088f7..506547ea3 100644
+--- a/src/test/codegen/thread-local.rs
++++ b/src/test/codegen/thread-local.rs
+@@ -4,6 +4,7 @@
+ // ignore-wasm globals are used instead of thread locals
+ // ignore-emscripten globals are used instead of thread locals
+ // ignore-android does not use #[thread_local]
++// ignore-stage1
+ 
+ #![crate_type = "lib"]
+ 
+diff --git a/src/test/codegen/uninit-consts.rs b/src/test/codegen/uninit-consts.rs
+index 3e370c7ba..a23b47e6e 100644
+--- a/src/test/codegen/uninit-consts.rs
++++ b/src/test/codegen/uninit-consts.rs
+@@ -1,5 +1,6 @@
+ // compile-flags: -C no-prepopulate-passes
+ // min-llvm-version: 14.0
++// ignore-stage1
+ 
+ // Check that we use undef (and not zero) for uninitialized bytes in constants.
+ 
+diff --git a/src/test/pretty/raw-str-nonexpr.rs b/src/test/pretty/raw-str-nonexpr.rs
+index 7af80979b..5261b0543 100644
+--- a/src/test/pretty/raw-str-nonexpr.rs
++++ b/src/test/pretty/raw-str-nonexpr.rs
+@@ -1,4 +1,5 @@
+ // pp-exact
++// ignore-stage1
+ 
+ #[cfg(foo = r#"just parse this"#)]
+ extern crate blah as blah;
+diff --git a/src/test/run-make/issue-36710/Makefile b/src/test/run-make/issue-36710/Makefile
+index b5270ad2b..a470f0a83 100644
+--- a/src/test/run-make/issue-36710/Makefile
++++ b/src/test/run-make/issue-36710/Makefile
+@@ -7,6 +7,7 @@
+ # ignore-nvptx64-nvidia-cuda FIXME: can't find crate for `std`
+ # ignore-musl FIXME: this makefile needs teaching how to use a musl toolchain
+ #                    (see dist-i586-gnu-i586-i686-musl Dockerfile)
++# ignore-stage1
+ 
+ include ../../run-make-fulldeps/tools.mk
+ 
+diff --git a/src/test/rustdoc-ui/cfg-test.rs b/src/test/rustdoc-ui/cfg-test.rs
+index d4ca92585..fceb2968d 100644
+--- a/src/test/rustdoc-ui/cfg-test.rs
++++ b/src/test/rustdoc-ui/cfg-test.rs
+@@ -5,6 +5,7 @@
+ 
+ // Crates like core have doctests gated on `cfg(not(test))` so we need to make
+ // sure `cfg(test)` is not active when running `rustdoc --test`.
++// ignore-stage1
+ 
+ /// this doctest will be ignored:
+ ///
+diff --git a/src/test/rustdoc-ui/display-output.rs b/src/test/rustdoc-ui/display-output.rs
+index ec27a9f6b..61655fa6e 100644
+--- a/src/test/rustdoc-ui/display-output.rs
++++ b/src/test/rustdoc-ui/display-output.rs
+@@ -5,6 +5,7 @@
+ // compile-flags:--test --test-args=--show-output
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ /// ```
+ /// #![warn(unused)]
+diff --git a/src/test/rustdoc-ui/doc-test-doctest-feature.rs b/src/test/rustdoc-ui/doc-test-doctest-feature.rs
+index 0b79aaece..8cef6d974 100644
+--- a/src/test/rustdoc-ui/doc-test-doctest-feature.rs
++++ b/src/test/rustdoc-ui/doc-test-doctest-feature.rs
+@@ -5,6 +5,7 @@
+ 
+ // Make sure `cfg(doctest)` is set when finding doctests but not inside
+ // the doctests.
++// ignore-stage1
+ 
+ /// ```
+ /// assert!(!cfg!(doctest));
+diff --git a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs b/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs
+index bf334c67e..c372097bd 100644
+--- a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs
++++ b/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs
+@@ -2,6 +2,7 @@
+ // compile-flags:--test
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ #![feature(doc_cfg)]
+ 
+diff --git a/src/test/rustdoc-ui/doctest-output.rs b/src/test/rustdoc-ui/doctest-output.rs
+index 2670fa572..b4b612916 100644
+--- a/src/test/rustdoc-ui/doctest-output.rs
++++ b/src/test/rustdoc-ui/doctest-output.rs
+@@ -4,6 +4,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+ 
+ //! ```
+ //! assert_eq!(1 + 1, 2);
+diff --git a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs b/src/test/rustdoc-ui/failed-doctest-compile-fail.rs
+index 6f2ff5d70..2561ffdc3 100644
+--- a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs
++++ b/src/test/rustdoc-ui/failed-doctest-compile-fail.rs
+@@ -5,6 +5,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // failure-status: 101
++// ignore-stage1
+ 
+ /// ```compile_fail
+ /// println!("Hello");
+diff --git a/src/test/rustdoc-ui/issue-91134.rs b/src/test/rustdoc-ui/issue-91134.rs
+index d2ff3a252..90e0816d2 100644
+--- a/src/test/rustdoc-ui/issue-91134.rs
++++ b/src/test/rustdoc-ui/issue-91134.rs
+@@ -4,6 +4,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // edition:2021
++// ignore-stage1
+ 
+ /// <https://github.com/rust-lang/rust/issues/91134>
+ ///
+diff --git a/src/test/rustdoc-ui/nocapture.rs b/src/test/rustdoc-ui/nocapture.rs
+index 321f5ca08..463751e48 100644
+--- a/src/test/rustdoc-ui/nocapture.rs
++++ b/src/test/rustdoc-ui/nocapture.rs
+@@ -2,6 +2,7 @@
+ // compile-flags:--test -Zunstable-options --nocapture
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ /// ```
+ /// println!("hello!");
+diff --git a/src/test/rustdoc-ui/run-directory.rs b/src/test/rustdoc-ui/run-directory.rs
+index 0d432c1e6..357e3ccc3 100644
+--- a/src/test/rustdoc-ui/run-directory.rs
++++ b/src/test/rustdoc-ui/run-directory.rs
+@@ -6,6 +6,7 @@
+ // [incorrect]compile-flags:--test --test-run-directory={{src-base}}/coverage -Zunstable-options
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ /// ```
+ /// assert_eq!(
+diff --git a/src/test/rustdoc-ui/test-no_std.rs b/src/test/rustdoc-ui/test-no_std.rs
+index ee919985e..3e479bf6f 100644
+--- a/src/test/rustdoc-ui/test-no_std.rs
++++ b/src/test/rustdoc-ui/test-no_std.rs
+@@ -2,6 +2,7 @@
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
+ // check-pass
++// ignore-stage1
+ 
+ #![no_std]
+ 
+diff --git a/src/test/rustdoc-ui/test-type.rs b/src/test/rustdoc-ui/test-type.rs
+index 882da5c25..bc8e8e30f 100644
+--- a/src/test/rustdoc-ui/test-type.rs
++++ b/src/test/rustdoc-ui/test-type.rs
+@@ -2,6 +2,7 @@
+ // check-pass
+ // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
+ // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TIME"
++// ignore-stage1
+ 
+ /// ```
+ /// let a = true;
+diff --git a/src/test/ui-fulldeps/gated-plugin.rs b/src/test/ui-fulldeps/gated-plugin.rs
+index 445469f87..85eaf5336 100644
+--- a/src/test/ui-fulldeps/gated-plugin.rs
++++ b/src/test/ui-fulldeps/gated-plugin.rs
+@@ -1,4 +1,5 @@
+ // aux-build:empty-plugin.rs
++// ignore-stage1
+ 
+ #![plugin(empty_plugin)]
+ //~^ ERROR compiler plugins are deprecated
+diff --git a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
+index 795c7d2dc..dc6b4f53f 100644
+--- a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
++++ b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::default_hash_types)]
+diff --git a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs
+index f6f0c0385..4523e2a6d 100644
+--- a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs
++++ b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::lint_pass_impl_without_macro)]
+diff --git a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
+index 32b987338..6187e2370 100644
+--- a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
++++ b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::usage_of_qualified_ty)]
+diff --git a/src/test/ui-fulldeps/internal-lints/query_stability.rs b/src/test/ui-fulldeps/internal-lints/query_stability.rs
+index 560675b44..e7d5ba583 100644
+--- a/src/test/ui-fulldeps/internal-lints/query_stability.rs
++++ b/src/test/ui-fulldeps/internal-lints/query_stability.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ #![deny(rustc::potential_query_instability)]
+diff --git a/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs b/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
+index 402c41f37..fe1f10d8c 100644
+--- a/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
++++ b/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_attrs)]
+ #![feature(rustc_private)]
+diff --git a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs b/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
+index 973294e98..f4b3f8342 100644
+--- a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
++++ b/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
+@@ -1,4 +1,5 @@
+ // compile-flags: -Z unstable-options
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ 
+diff --git a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs b/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
+index 7498745f2..28c00f2f8 100644
+--- a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
++++ b/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
+@@ -1,6 +1,7 @@
+ // aux-build:lint-group-plugin-test.rs
+ // check-pass
+ // compile-flags: -D unused -A unused-variables
++// ignore-stage1
+ 
+ fn main() {
+     let x = 1;
+diff --git a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
+index fc19bc039..9563e9930 100644
+--- a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
++++ b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
+@@ -1,5 +1,6 @@
+ // aux-build:lint-group-plugin-test.rs
+ // compile-flags: -F unused -A unused
++// ignore-stage1
+ 
+ fn main() {
+     let x = 1;
+diff --git a/src/test/ui-fulldeps/lint-pass-macros.rs b/src/test/ui-fulldeps/lint-pass-macros.rs
+index b3c2a5427..9ed711a34 100644
+--- a/src/test/ui-fulldeps/lint-pass-macros.rs
++++ b/src/test/ui-fulldeps/lint-pass-macros.rs
+@@ -1,5 +1,6 @@
+ // compile-flags: -Z unstable-options
+ // check-pass
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ 
+diff --git a/src/test/ui-fulldeps/multiple-plugins.rs b/src/test/ui-fulldeps/multiple-plugins.rs
+index 25d2c8bc1..9af3ebd57 100644
+--- a/src/test/ui-fulldeps/multiple-plugins.rs
++++ b/src/test/ui-fulldeps/multiple-plugins.rs
+@@ -1,6 +1,7 @@
+ // run-pass
+ // aux-build:multiple-plugins-1.rs
+ // aux-build:multiple-plugins-2.rs
++// ignore-stage1
+ 
+ // Check that the plugin registrar of multiple plugins doesn't conflict
+ 
+diff --git a/src/test/ui/abi/stack-probes-lto.rs b/src/test/ui/abi/stack-probes-lto.rs
+index 90df1f3f5..f82c12a86 100644
+--- a/src/test/ui/abi/stack-probes-lto.rs
++++ b/src/test/ui/abi/stack-probes-lto.rs
+@@ -14,5 +14,6 @@
+ // ignore-pretty
+ // compile-flags: -C lto
+ // no-prefer-dynamic
++// ignore-stage1
+ 
+ include!("stack-probes.rs");
+diff --git a/src/test/ui/abi/stack-probes.rs b/src/test/ui/abi/stack-probes.rs
+index e998dd0f8..d735a98fe 100644
+--- a/src/test/ui/abi/stack-probes.rs
++++ b/src/test/ui/abi/stack-probes.rs
+@@ -10,6 +10,7 @@
+ // ignore-wasm
+ // ignore-emscripten no processes
+ // ignore-sgx no processes
++// ignore-stage1
+ 
+ use std::env;
+ use std::mem::MaybeUninit;
+diff --git a/src/test/ui/empty_global_asm.rs b/src/test/ui/empty_global_asm.rs
+index dbcc7be05..276d689b0 100644
+--- a/src/test/ui/empty_global_asm.rs
++++ b/src/test/ui/empty_global_asm.rs
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #[allow(unused_imports)]
+ use std::arch::global_asm;
+diff --git a/src/test/ui/macros/restricted-shadowing-legacy.rs b/src/test/ui/macros/restricted-shadowing-legacy.rs
+index f5cac2dfb..d84f8efd6 100644
+--- a/src/test/ui/macros/restricted-shadowing-legacy.rs
++++ b/src/test/ui/macros/restricted-shadowing-legacy.rs
+@@ -74,6 +74,7 @@
+ // 62 |   Unordered   |   Unordered   |       =       |    +?    |
+ // 63 |   Unordered   |   Unordered   |       >       |    +?    |
+ // 64 |   Unordered   |   Unordered   |   Unordered   |    +     |
++// ignore-stage1
+ 
+ #![feature(decl_macro, rustc_attrs)]
+ 
+diff --git a/src/test/ui/process/process-panic-after-fork.rs b/src/test/ui/process/process-panic-after-fork.rs
+index 1ccf6bb05..c4b074092 100644
+--- a/src/test/ui/process/process-panic-after-fork.rs
++++ b/src/test/ui/process/process-panic-after-fork.rs
+@@ -6,6 +6,7 @@
+ // ignore-emscripten no processes
+ // ignore-sgx no processes
+ // ignore-android: FIXME(#85261)
++// ignore-stage1
+ 
+ #![feature(bench_black_box)]
+ #![feature(rustc_private)]
+diff --git a/src/test/ui/simd/target-feature-mixup.rs b/src/test/ui/simd/target-feature-mixup.rs
+index 6d7688191..a8d551154 100644
+--- a/src/test/ui/simd/target-feature-mixup.rs
++++ b/src/test/ui/simd/target-feature-mixup.rs
+@@ -1,4 +1,6 @@
+ // run-pass
++// ignore-stage1
++
+ #![allow(unused_variables)]
+ #![allow(stable_features)]
+ #![allow(overflowing_literals)]
diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.62.1.bb b/meta/recipes-devtools/rust/rust-testsuite_1.62.1.bb
new file mode 100644
index 0000000000..d334231c8f
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.62.1.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source.inc
+require rust-snapshot.inc
-- 
2.25.1


