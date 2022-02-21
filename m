Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476B3C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 07:24:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.8197.1645428294721416255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 23:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vexq21CG;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id q11so2362699pln.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 23:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hbVPtPI9lgOH0MuFWlZZayeoKBsknwvidW4UxQBb3/o=;
        b=Vexq21CGTXMO8tFHlKtHWGk9p8CcXb7A+Y/RVNqJcRBUbuh2RkbLv41tDRpjLosDmk
         skvdHIfLBPIqVSmlienhGivzb5bp6A3ApijlaLpcItIyJ/eQJbfnLelmA/xFaJalz6Li
         mHH3saIwjUVAg3P8pqCP480ZQCKpgSFU49az6hBoXbIhIuhzdI2ppKbFsiosY6HnESgc
         2PZO8cIJKWt2CinEAOR1oWHOd5AWU+pbescNWjICYg4WPw9X+x2CvUgd5SKBPnaYPX4V
         5+36FsmhiTNNGY5WOjdY6DRcsz7Vafg1mUariBSRRjqYXHGXa5ROj9vpVf8Y3+2ypqGG
         7hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hbVPtPI9lgOH0MuFWlZZayeoKBsknwvidW4UxQBb3/o=;
        b=GfqB/XndstGg9cyioSE1W/JeO3xjUIIUPoqFW0wWCTaadRx1+ZjD69pGmeROrxKpr8
         eYSQpQwFxHciTyfVGESXG979e4Nf4i4oCgpWXiBvI6OWzZSZVXCKFfwzXEYN1H5WsNHs
         X0hty8hdoWtlcjM/fBOEOQgrSskQglNCD0ADU/05uKLWCq15Swe5XhGhIkl/TXA1qbZN
         ITsvV0BZcxFE54VCiXLu2p135TN0SlJENTIPx3LvItOhaj8B9gxBmUlU1gjHNHS+XVKe
         DBPzrX5s1RryldCcmzPMzjr4Jj+BiZ7M7At1lKptk03Mw0WIEKSJuQpHW+eceQZrvpuZ
         QgVw==
X-Gm-Message-State: AOAM530D7v/tREvVwrmjHMomlDDCG73meUB83hIAI1fofAe8/XBAaxND
	Fb4ZDrJ0thhpZjUugiZH+2rdDHElkEE=
X-Google-Smtp-Source: 
 ABdhPJynEsjT5V/49zR66zumW9w0wejv1JdYvCg8mUiBDEsw7sys6LTnxhJyMNLi53yQone04SNubg==
X-Received: by 2002:a17:90b:4cce:b0:1b9:86dc:8b69 with SMTP id
 nd14-20020a17090b4cce00b001b986dc8b69mr20171563pjb.56.1645428293135;
        Sun, 20 Feb 2022 23:24:53 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 w8sm9097803pgr.93.2022.02.20.23.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 23:24:52 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [honister][PATCH V4] Rust Oe-Selftest implementation
Date: Sun, 20 Feb 2022 23:24:46 -0800
Message-Id: <20220221072446.74483-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 07:24:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162015

The patch implements Oe-selftest framework for Rust test.
Some of the functions are as follows:-
setup_cargo_environment(): Build bootstrap and some early stage tools.
do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
do_configure(): To generate config.toml
do_compile(): To build "remote-test-server" for qemutarget image.

The python file builds remote-test-server and executes rust testing
remotely using background ssh. It adds the necessary test environment
and variables to run the rust oe-selftest.
Print the results in case of failure of runCmd().

The patch has been run and tested for X86 and X86_64 targets on
Ubuntu-18 successfully.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  53 ++
 meta/recipes-devtools/rust/rust-testsuite.inc | 160 ++++
 .../rust-testsuite/rust-oe-selftest.patch     | 872 ++++++++++++++++++
 .../rust/rust-testsuite_1.54.0.bb             |   3 +
 4 files changed, 1088 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..ad28f7ab26
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,53 @@
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
+			testargs = "--exclude compiler/rustc --exclude compiler/rustc_apfloat --exclude compiler/rustc_serialize --exclude src/tools/tidy --exclude src/tools/compiletest --no-fail-fast --bless"
+			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
+			cmd = " export PATH=%s/../bin:$PATH;" % rustlibpath
+			cmd = cmd + " export PATH=%s/../bin/%s:%s/hosttools:$PATH;" % (rustlibpath, targetsys, tmpdir)
+			cmd = cmd + " export RUST_TARGET_PATH=%s/rustlib;" % rustlibpath
+			# Trigger testing.
+			cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
+			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py -j 40 test %s --target %s ;" % (builddir, testargs, targetsys)
+			result = runCmd(cmd)
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
new file mode 100644
index 0000000000..149b863417
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -0,0 +1,160 @@
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
+    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux]
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
+    targets = [d.getVar("TARGET_SYS", True)]
+    config.set("build", "target", e(targets))
+
+    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
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
index 0000000000..78f061d028
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
@@ -0,0 +1,872 @@
+Rust testsuite outputs error even on a single testcase failure.
+Hence, some test runs are ignored as they fail with error messages.
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+diff -upr a/compiler/rustc_arena/Cargo.toml b/compiler/rustc_arena/Cargo.toml
+--- a/compiler/rustc_arena/Cargo.toml	2022-02-18 20:52:49.343261926 -0800
++++ b/compiler/rustc_arena/Cargo.toml	2022-02-18 20:22:40.745863059 -0800
+@@ -4,6 +4,10 @@ name = "rustc_arena"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ rustc_data_structures = { path = "../rustc_data_structures" }
+ smallvec = { version = "1.6.1", features = ["union", "may_dangle"] }
+diff -upr a/compiler/rustc_ast/Cargo.toml b/compiler/rustc_ast/Cargo.toml
+--- a/compiler/rustc_ast/Cargo.toml	2022-02-18 20:52:49.343261926 -0800
++++ b/compiler/rustc_ast/Cargo.toml	2022-02-18 20:22:40.745863059 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_ast_lowering/Cargo.toml b/compiler/rustc_ast_lowering/Cargo.toml
+--- a/compiler/rustc_ast_lowering/Cargo.toml	2022-02-18 20:52:49.343261926 -0800
++++ b/compiler/rustc_ast_lowering/Cargo.toml	2022-02-18 20:22:40.745863059 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_ast_passes/Cargo.toml b/compiler/rustc_ast_passes/Cargo.toml
+--- a/compiler/rustc_ast_passes/Cargo.toml	2022-02-18 20:52:49.343261926 -0800
++++ b/compiler/rustc_ast_passes/Cargo.toml	2022-02-18 20:22:40.745863059 -0800
+@@ -4,6 +4,10 @@ name = "rustc_ast_passes"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ itertools = "0.9"
+ tracing = "0.1"
+diff -upr a/compiler/rustc_ast_pretty/Cargo.toml b/compiler/rustc_ast_pretty/Cargo.toml
+--- a/compiler/rustc_ast_pretty/Cargo.toml	2022-02-18 20:52:49.343261926 -0800
++++ b/compiler/rustc_ast_pretty/Cargo.toml	2022-02-18 20:22:40.745863059 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_attr/Cargo.toml b/compiler/rustc_attr/Cargo.toml
+--- a/compiler/rustc_attr/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_attr/Cargo.toml	2022-02-18 20:22:40.745863059 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_builtin_macros/Cargo.toml b/compiler/rustc_builtin_macros/Cargo.toml
+--- a/compiler/rustc_builtin_macros/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_builtin_macros/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_data_structures/Cargo.toml b/compiler/rustc_data_structures/Cargo.toml
+--- a/compiler/rustc_data_structures/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_data_structures/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_driver/Cargo.toml b/compiler/rustc_driver/Cargo.toml
+--- a/compiler/rustc_driver/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_driver/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -6,6 +6,8 @@ edition = "2018"
+ 
+ [lib]
+ crate-type = ["dylib"]
++test = false
++doctest = false
+ 
+ [dependencies]
+ libc = "0.2"
+diff -upr a/compiler/rustc_error_codes/Cargo.toml b/compiler/rustc_error_codes/Cargo.toml
+--- a/compiler/rustc_error_codes/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_error_codes/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -3,3 +3,7 @@ authors = ["The Rust Project Developers"
+ name = "rustc_error_codes"
+ version = "0.0.0"
+ edition = "2018"
++
++[lib]
++test = false
++doctest = false
+diff -upr a/compiler/rustc_errors/Cargo.toml b/compiler/rustc_errors/Cargo.toml
+--- a/compiler/rustc_errors/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_errors/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_expand/Cargo.toml b/compiler/rustc_expand/Cargo.toml
+--- a/compiler/rustc_expand/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_expand/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -6,6 +6,7 @@ edition = "2018"
+ build = false
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_feature/Cargo.toml b/compiler/rustc_feature/Cargo.toml
+--- a/compiler/rustc_feature/Cargo.toml	2022-02-18 20:52:49.347261785 -0800
++++ b/compiler/rustc_feature/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_fs_util/Cargo.toml b/compiler/rustc_fs_util/Cargo.toml
+--- a/compiler/rustc_fs_util/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_fs_util/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -3,3 +3,7 @@ authors = ["The Rust Project Developers"
+ name = "rustc_fs_util"
+ version = "0.0.0"
+ edition = "2018"
++
++[lib]
++test = false
++doctest = false
+diff -upr a/compiler/rustc_graphviz/Cargo.toml b/compiler/rustc_graphviz/Cargo.toml
+--- a/compiler/rustc_graphviz/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_graphviz/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -3,3 +3,7 @@ authors = ["The Rust Project Developers"
+ name = "rustc_graphviz"
+ version = "0.0.0"
+ edition = "2018"
++
++[lib]
++test = false
++doctest = false
+diff -upr a/compiler/rustc_hir/Cargo.toml b/compiler/rustc_hir/Cargo.toml
+--- a/compiler/rustc_hir/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_hir/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_hir_pretty/Cargo.toml b/compiler/rustc_hir_pretty/Cargo.toml
+--- a/compiler/rustc_hir_pretty/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_hir_pretty/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_incremental/Cargo.toml b/compiler/rustc_incremental/Cargo.toml
+--- a/compiler/rustc_incremental/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_incremental/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_index/Cargo.toml b/compiler/rustc_index/Cargo.toml
+--- a/compiler/rustc_index/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_index/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_infer/Cargo.toml b/compiler/rustc_infer/Cargo.toml
+--- a/compiler/rustc_infer/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_infer/Cargo.toml	2022-02-18 20:22:40.749862923 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_interface/Cargo.toml b/compiler/rustc_interface/Cargo.toml
+--- a/compiler/rustc_interface/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_interface/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_lexer/Cargo.toml b/compiler/rustc_lexer/Cargo.toml
+--- a/compiler/rustc_lexer/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_lexer/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -13,6 +13,7 @@ Rust lexer used by rustc. No stability g
+ # Note: do not remove this blank `[lib]` section.
+ # This will be used when publishing this crate as `rustc-ap-rustc_lexer`.
+ [lib]
++test = false
+ doctest = false
+ 
+ # Note that this crate purposefully does not depend on other rustc crates
+diff -upr a/compiler/rustc_lint/Cargo.toml b/compiler/rustc_lint/Cargo.toml
+--- a/compiler/rustc_lint/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_lint/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -4,6 +4,10 @@ name = "rustc_lint"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ tracing = "0.1"
+ unicode-security = "0.0.5"
+diff -upr a/compiler/rustc_lint_defs/Cargo.toml b/compiler/rustc_lint_defs/Cargo.toml
+--- a/compiler/rustc_lint_defs/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_lint_defs/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -4,6 +4,10 @@ name = "rustc_lint_defs"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ log = { package = "tracing", version = "0.1" }
+ rustc_ast = { path = "../rustc_ast" }
+diff -upr a/compiler/rustc_llvm/Cargo.toml b/compiler/rustc_llvm/Cargo.toml
+--- a/compiler/rustc_llvm/Cargo.toml	2022-02-18 20:52:49.351261644 -0800
++++ b/compiler/rustc_llvm/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -4,6 +4,10 @@ name = "rustc_llvm"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [features]
+ static-libstdcpp = []
+ emscripten = []
+diff -upr a/compiler/rustc_macros/Cargo.toml b/compiler/rustc_macros/Cargo.toml
+--- a/compiler/rustc_macros/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_macros/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -6,6 +6,8 @@ edition = "2018"
+ 
+ [lib]
+ proc-macro = true
++test = false
++doctest = false
+ 
+ [dependencies]
+ synstructure = "0.12.1"
+diff -upr a/compiler/rustc_metadata/Cargo.toml b/compiler/rustc_metadata/Cargo.toml
+--- a/compiler/rustc_metadata/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_metadata/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_middle/Cargo.toml b/compiler/rustc_middle/Cargo.toml
+--- a/compiler/rustc_middle/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_middle/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_mir/Cargo.toml b/compiler/rustc_mir/Cargo.toml
+--- a/compiler/rustc_mir/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_mir/Cargo.toml	2022-02-18 20:22:40.753862788 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_mir/src/transform/coverage/test_macros/Cargo.toml b/compiler/rustc_mir/src/transform/coverage/test_macros/Cargo.toml
+--- a/compiler/rustc_mir/src/transform/coverage/test_macros/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_mir/src/transform/coverage/test_macros/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -6,4 +6,5 @@ edition = "2018"
+ 
+ [lib]
+ proc-macro = true
++test = false
+ doctest = false
+diff -upr a/compiler/rustc_mir_build/Cargo.toml b/compiler/rustc_mir_build/Cargo.toml
+--- a/compiler/rustc_mir_build/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_mir_build/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_parse/Cargo.toml b/compiler/rustc_parse/Cargo.toml
+--- a/compiler/rustc_parse/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_parse/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_parse_format/Cargo.toml b/compiler/rustc_parse_format/Cargo.toml
+--- a/compiler/rustc_parse_format/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_parse_format/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -4,6 +4,10 @@ name = "rustc_parse_format"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ rustc_span = { path = "../rustc_span" }
+ rustc_lexer = { path = "../rustc_lexer" }
+diff -upr a/compiler/rustc_passes/Cargo.toml b/compiler/rustc_passes/Cargo.toml
+--- a/compiler/rustc_passes/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_passes/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -4,6 +4,10 @@ name = "rustc_passes"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ tracing = "0.1"
+ rustc_middle = { path = "../rustc_middle" }
+diff -upr a/compiler/rustc_plugin_impl/Cargo.toml b/compiler/rustc_plugin_impl/Cargo.toml
+--- a/compiler/rustc_plugin_impl/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_plugin_impl/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -6,6 +6,7 @@ build = false
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_privacy/Cargo.toml b/compiler/rustc_privacy/Cargo.toml
+--- a/compiler/rustc_privacy/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_privacy/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -4,6 +4,10 @@ name = "rustc_privacy"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ rustc_middle = { path = "../rustc_middle" }
+ rustc_attr = { path = "../rustc_attr" }
+diff -upr a/compiler/rustc_query_impl/Cargo.toml b/compiler/rustc_query_impl/Cargo.toml
+--- a/compiler/rustc_query_impl/Cargo.toml	2022-02-18 20:52:49.355261504 -0800
++++ b/compiler/rustc_query_impl/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_query_system/Cargo.toml b/compiler/rustc_query_system/Cargo.toml
+--- a/compiler/rustc_query_system/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_query_system/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_save_analysis/Cargo.toml b/compiler/rustc_save_analysis/Cargo.toml
+--- a/compiler/rustc_save_analysis/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_save_analysis/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -4,6 +4,10 @@ name = "rustc_save_analysis"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ tracing = "0.1"
+ rustc_middle = { path = "../rustc_middle" }
+diff -upr a/compiler/rustc_session/Cargo.toml b/compiler/rustc_session/Cargo.toml
+--- a/compiler/rustc_session/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_session/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -4,6 +4,10 @@ name = "rustc_session"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ bitflags = "1.2.1"
+ getopts = "0.2"
+diff -upr a/compiler/rustc_span/Cargo.toml b/compiler/rustc_span/Cargo.toml
+--- a/compiler/rustc_span/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_span/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_symbol_mangling/Cargo.toml b/compiler/rustc_symbol_mangling/Cargo.toml
+--- a/compiler/rustc_symbol_mangling/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_symbol_mangling/Cargo.toml	2022-02-18 20:22:40.765862380 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_target/Cargo.toml b/compiler/rustc_target/Cargo.toml
+--- a/compiler/rustc_target/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_target/Cargo.toml	2022-02-18 20:22:40.769862244 -0800
+@@ -4,6 +4,10 @@ name = "rustc_target"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ bitflags = "1.2.1"
+ tracing = "0.1"
+diff -upr a/compiler/rustc_traits/Cargo.toml b/compiler/rustc_traits/Cargo.toml
+--- a/compiler/rustc_traits/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_traits/Cargo.toml	2022-02-18 20:22:40.769862244 -0800
+@@ -4,6 +4,10 @@ name = "rustc_traits"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ tracing = "0.1"
+ rustc_attr = { path = "../rustc_attr" }
+diff -upr a/compiler/rustc_trait_selection/Cargo.toml b/compiler/rustc_trait_selection/Cargo.toml
+--- a/compiler/rustc_trait_selection/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_trait_selection/Cargo.toml	2022-02-18 20:22:40.769862244 -0800
+@@ -5,6 +5,7 @@ version = "0.0.0"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_type_ir/Cargo.toml b/compiler/rustc_type_ir/Cargo.toml
+--- a/compiler/rustc_type_ir/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_type_ir/Cargo.toml	2022-02-18 20:22:40.769862244 -0800
+@@ -5,6 +5,7 @@ authors = ["The Rust Project Developers"
+ edition = "2018"
+ 
+ [lib]
++test = false
+ doctest = false
+ 
+ [dependencies]
+diff -upr a/compiler/rustc_ty_utils/Cargo.toml b/compiler/rustc_ty_utils/Cargo.toml
+--- a/compiler/rustc_ty_utils/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/compiler/rustc_ty_utils/Cargo.toml	2022-02-18 20:22:40.769862244 -0800
+@@ -4,6 +4,10 @@ name = "rustc_ty_utils"
+ version = "0.0.0"
+ edition = "2018"
+ 
++[lib]
++test = false
++doctest = false
++
+ [dependencies]
+ tracing = "0.1"
+ rustc_middle = { path = "../rustc_middle" }
+diff -upr a/library/alloc/Cargo.toml b/library/alloc/Cargo.toml
+--- a/library/alloc/Cargo.toml	2022-02-18 20:52:49.359261363 -0800
++++ b/library/alloc/Cargo.toml	2022-02-18 20:22:40.769862244 -0800
+@@ -24,7 +24,7 @@ path = "tests/lib.rs"
+ [[bench]]
+ name = "collectionsbenches"
+ path = "benches/lib.rs"
+-test = true
++test = false
+ 
+ [[bench]]
+ name = "vec_deque_append_bench"
+Only in a/: patches
+Only in a/: .pc
+diff -upr a/src/test/run-make/issue-36710/Makefile b/src/test/run-make/issue-36710/Makefile
+--- a/src/test/run-make/issue-36710/Makefile	2022-02-18 20:52:49.359261363 -0800
++++ b/src/test/run-make/issue-36710/Makefile	2022-02-18 20:22:40.769862244 -0800
+@@ -7,6 +7,8 @@
+ # ignore-nvptx64-nvidia-cuda FIXME: can't find crate for `std`
+ # ignore-musl FIXME: this makefile needs teaching how to use a musl toolchain
+ #                    (see dist-i586-gnu-i586-i686-musl Dockerfile)
++# ignore-windows-msvc
++# ignore-stage1
+ 
+ include ../../run-make-fulldeps/tools.mk
+ 
+diff -upr a/src/test/ui/abi/stack-probes-lto.rs b/src/test/ui/abi/stack-probes-lto.rs
+--- a/src/test/ui/abi/stack-probes-lto.rs	2022-02-18 20:52:49.291263757 -0800
++++ b/src/test/ui/abi/stack-probes-lto.rs	2022-02-18 20:58:59.706316652 -0800
+@@ -14,5 +14,6 @@
+ // ignore-pretty
+ // compile-flags: -C lto
+ // no-prefer-dynamic
++// ignore-stage1
+ 
+ include!("stack-probes.rs");
+diff -upr a/src/test/ui/abi/stack-probes.rs b/src/test/ui/abi/stack-probes.rs
+--- a/src/test/ui/abi/stack-probes.rs	2022-02-18 20:52:49.291263757 -0800
++++ b/src/test/ui/abi/stack-probes.rs	2022-02-18 20:59:12.777862379 -0800
+@@ -10,6 +10,7 @@
+ // ignore-wasm
+ // ignore-emscripten no processes
+ // ignore-sgx no processes
++// ignore-stage1
+ 
+ use std::env;
+ use std::mem::MaybeUninit;
+diff -upr a/src/test/ui/macros/restricted-shadowing-legacy.rs b/src/test/ui/macros/restricted-shadowing-legacy.rs
+--- a/src/test/ui/macros/restricted-shadowing-legacy.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui/macros/restricted-shadowing-legacy.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -74,6 +74,7 @@
+ // 62 |   Unordered   |   Unordered   |       =       |    +?    |
+ // 63 |   Unordered   |   Unordered   |       >       |    +?    |
+ // 64 |   Unordered   |   Unordered   |   Unordered   |    +     |
++// ignore-stage1
+ 
+ #![feature(decl_macro, rustc_attrs)]
+ 
+diff -upr a/src/test/ui/simd/simd-target-feature-mixup.rs b/src/test/ui/simd/simd-target-feature-mixup.rs
+--- a/src/test/ui/simd/simd-target-feature-mixup.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui/simd/simd-target-feature-mixup.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ #![allow(unused_variables)]
+ #![allow(stable_features)]
+ #![allow(overflowing_literals)]
+diff -upr a/src/test/ui-fulldeps/create-dir-all-bare.rs b/src/test/ui-fulldeps/create-dir-all-bare.rs
+--- a/src/test/ui-fulldeps/create-dir-all-bare.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/create-dir-all-bare.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ use std::env;
+ use std::fs;
+diff -upr a/src/test/ui-fulldeps/deriving-encodable-decodable-box.rs b/src/test/ui-fulldeps/deriving-encodable-decodable-box.rs
+--- a/src/test/ui-fulldeps/deriving-encodable-decodable-box.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/deriving-encodable-decodable-box.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_imports)]
+ #![feature(box_syntax)]
+diff -upr a/src/test/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs b/src/test/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs
+--- a/src/test/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_imports)]
+ // This briefly tests the capability of `Cell` and `RefCell` to implement the
+diff -upr a/src/test/ui-fulldeps/deriving-global.rs b/src/test/ui-fulldeps/deriving-global.rs
+--- a/src/test/ui-fulldeps/deriving-global.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/deriving-global.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ 
+diff -upr a/src/test/ui-fulldeps/deriving-hygiene.rs b/src/test/ui-fulldeps/deriving-hygiene.rs
+--- a/src/test/ui-fulldeps/deriving-hygiene.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/deriving-hygiene.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(non_upper_case_globals)]
+ #![feature(rustc_private)]
+diff -upr a/src/test/ui-fulldeps/dropck_tarena_sound_drop.rs b/src/test/ui-fulldeps/dropck_tarena_sound_drop.rs
+--- a/src/test/ui-fulldeps/dropck_tarena_sound_drop.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/dropck_tarena_sound_drop.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unknown_lints)]
+ // Check that an arena (TypedArena) can carry elements whose drop
+diff -upr a/src/test/ui-fulldeps/empty-struct-braces-derive.rs b/src/test/ui-fulldeps/empty-struct-braces-derive.rs
+--- a/src/test/ui-fulldeps/empty-struct-braces-derive.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/empty-struct-braces-derive.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // `#[derive(Trait)]` works for empty structs/variants with braces or parens.
+ 
+ #![feature(rustc_private)]
+diff -upr a/src/test/ui-fulldeps/extern-mod-syntax.rs b/src/test/ui-fulldeps/extern-mod-syntax.rs
+--- a/src/test/ui-fulldeps/extern-mod-syntax.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/extern-mod-syntax.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_imports)]
+ #![feature(rustc_private)]
+diff -upr a/src/test/ui-fulldeps/issue-11881.rs b/src/test/ui-fulldeps/issue-11881.rs
+--- a/src/test/ui-fulldeps/issue-11881.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/issue-11881.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_must_use)]
+ #![allow(dead_code)]
+diff -upr a/src/test/ui-fulldeps/issue-13560.rs b/src/test/ui-fulldeps/issue-13560.rs
+--- a/src/test/ui-fulldeps/issue-13560.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/issue-13560.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // aux-build:issue-13560-1.rs
+ // aux-build:issue-13560-2.rs
+ // aux-build:issue-13560-3.rs
+diff -upr a/src/test/ui-fulldeps/issue-14021.rs b/src/test/ui-fulldeps/issue-14021.rs
+--- a/src/test/ui-fulldeps/issue-14021.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/issue-14021.rs	2022-02-18 20:22:40.769862244 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_mut)]
+ #![allow(unused_imports)]
+diff -upr a/src/test/ui-fulldeps/issue-15149.rs b/src/test/ui-fulldeps/issue-15149.rs
+--- a/src/test/ui-fulldeps/issue-15149.rs	2022-02-18 20:52:49.363261222 -0800
++++ b/src/test/ui-fulldeps/issue-15149.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_variables)]
+ // no-prefer-dynamic
+diff -upr a/src/test/ui-fulldeps/issue-15924.rs b/src/test/ui-fulldeps/issue-15924.rs
+--- a/src/test/ui-fulldeps/issue-15924.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-15924.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_imports)]
+ #![allow(unused_must_use)]
+diff -upr a/src/test/ui-fulldeps/issue-16822.rs b/src/test/ui-fulldeps/issue-16822.rs
+--- a/src/test/ui-fulldeps/issue-16822.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-16822.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // aux-build:issue-16822.rs
+ 
+ extern crate issue_16822 as lib;
+diff -upr a/src/test/ui-fulldeps/issue-18502.rs b/src/test/ui-fulldeps/issue-18502.rs
+--- a/src/test/ui-fulldeps/issue-18502.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-18502.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // aux-build:issue-18502.rs
+ 
+ extern crate issue_18502 as fmt;
+diff -upr a/src/test/ui-fulldeps/issue-24106.rs b/src/test/ui-fulldeps/issue-24106.rs
+--- a/src/test/ui-fulldeps/issue-24106.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-24106.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // aux-build:issue-24106.rs
+ 
+ extern crate issue_24106;
+diff -upr a/src/test/ui-fulldeps/issue-24972.rs b/src/test/ui-fulldeps/issue-24972.rs
+--- a/src/test/ui-fulldeps/issue-24972.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-24972.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(dead_code)]
+ #![feature(rustc_private)]
+diff -upr a/src/test/ui-fulldeps/issue-2804.rs b/src/test/ui-fulldeps/issue-2804.rs
+--- a/src/test/ui-fulldeps/issue-2804.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-2804.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(non_camel_case_types)]
+ #![allow(dead_code)]
+diff -upr a/src/test/ui-fulldeps/issue-4016.rs b/src/test/ui-fulldeps/issue-4016.rs
+--- a/src/test/ui-fulldeps/issue-4016.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-4016.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(dead_code)]
+ #![feature(rustc_private)]
+diff -upr a/src/test/ui-fulldeps/issue-4036.rs b/src/test/ui-fulldeps/issue-4036.rs
+--- a/src/test/ui-fulldeps/issue-4036.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/issue-4036.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // Issue #4036: Test for an issue that arose around fixing up type inference
+ // byproducts in vtable records.
+ 
+diff -upr a/src/test/ui-fulldeps/myriad-closures.rs b/src/test/ui-fulldeps/myriad-closures.rs
+--- a/src/test/ui-fulldeps/myriad-closures.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/myriad-closures.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // This test case tests whether we can handle code bases that contain a high
+ // number of closures, something that needs special handling in the MingGW
+ // toolchain.
+diff -upr a/src/test/ui-fulldeps/pprust-expr-roundtrip.rs b/src/test/ui-fulldeps/pprust-expr-roundtrip.rs
+--- a/src/test/ui-fulldeps/pprust-expr-roundtrip.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/pprust-expr-roundtrip.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ // ignore-cross-compile
+ 
+ // The general idea of this test is to enumerate all "interesting" expressions and check that
+diff -upr a/src/test/ui-fulldeps/regions-mock-tcx.rs b/src/test/ui-fulldeps/regions-mock-tcx.rs
+--- a/src/test/ui-fulldeps/regions-mock-tcx.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/regions-mock-tcx.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(dead_code)]
+ #![allow(unused_imports)]
+diff -upr a/src/test/ui-fulldeps/rename-directory.rs b/src/test/ui-fulldeps/rename-directory.rs
+--- a/src/test/ui-fulldeps/rename-directory.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/rename-directory.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![allow(unused_must_use)]
+ #![allow(unused_imports)]
+diff -upr a/src/test/ui-fulldeps/rustc_encodable_hygiene.rs b/src/test/ui-fulldeps/rustc_encodable_hygiene.rs
+--- a/src/test/ui-fulldeps/rustc_encodable_hygiene.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/rustc_encodable_hygiene.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ #![feature(rustc_private)]
+ 
+diff -upr a/src/test/ui-fulldeps/stdio-from.rs b/src/test/ui-fulldeps/stdio-from.rs
+--- a/src/test/ui-fulldeps/stdio-from.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/stdio-from.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,5 +1,6 @@
+ // run-pass
+ // ignore-cross-compile
++// ignore-stage1
+ 
+ use std::env;
+ use std::fs::File;
+diff -upr a/src/test/ui-fulldeps/switch-stdout.rs b/src/test/ui-fulldeps/switch-stdout.rs
+--- a/src/test/ui-fulldeps/switch-stdout.rs	2022-02-18 20:52:49.367261081 -0800
++++ b/src/test/ui-fulldeps/switch-stdout.rs	2022-02-18 20:22:40.773862108 -0800
+@@ -1,4 +1,5 @@
+ // run-pass
++// ignore-stage1
+ 
+ use std::env;
+ use std::fs::File;
diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
new file mode 100644
index 0000000000..ad758b71f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
-- 
2.31.1


