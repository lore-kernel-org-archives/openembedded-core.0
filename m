Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id A9DDB6BCDC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 11:39:20 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id g15so5397878pgi.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2019 04:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=T9M3E/wZF7Phz2XrVM6L20C7vgw3h2YeDIoebhlL78A=;
	b=ScyPvtsj+Io6Wdf0f7+LKjreGzyGR3g3yDYcfVenhKr2t2UT0uGobdkYqE8DuXyumh
	aY6fdU3HjZ6kSWXOPfGwPLpoHo+FDPJSrSFxAaacrryKzVmaj7zi7DXqUEHUT3nM0eY5
	xAPSyoSR1UplFBANeNKpf0dtw6r5ITZ0gDgI2RgOK9Z7h4WilT4FSPI5ZU9plJ5oJXEu
	DDyv/dN6M4uXrgMi8CEY399GgLsSKpFhrUGqR4T0Lyb5VhlvEQ/pUCwjTQm0INipkBww
	0aI7UujwdPYYthBHk8W796UvdpMoF3fcW7LfItujYApuwKtpKzmy2yVs3NIIq2UdGr5Q
	DfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=T9M3E/wZF7Phz2XrVM6L20C7vgw3h2YeDIoebhlL78A=;
	b=KM81Ookv0IBOdSGKIUNwVTrXC3vwUJHnTBReb+PUSlJL5adMTwdNhN7gdD5LDvLE2I
	Uw3IEknAVUlIWZ2wuRxWI6YTSv4tXEn58GP7LC9pmKlyZPIOLWrdZMfJiDw3jMBOksJ8
	TFuK40FrReHv2EsYq2Cg0Yb+Yh6n6GBu/NgoM30vItvz6uXV7WAwCFvkspp/cFwUofSe
	Oqy26emPL2Wkwek6qCuyD27Sr+uFtd0gCZxJ+Z6U5wALdIoCnSuKesZKMO6Jlv876MC+
	i3UQ2pC3PNskUPMQ8JFbmaMBOQTY/6gl2YXwt4rvlQ+q3VDhjIdRB+W1WVw/qO6ocll8
	Po6w==
X-Gm-Message-State: APjAAAUqxJLJGTdeyG+VSe1LlYEQtod7jCPAgTtWZcAhx29uf16NYpbc
	6Tb0TucSTGgD78ZUQHzovsABuwJDrKs=
X-Google-Smtp-Source: APXvYqwTRCug+eyoL4e0B+DyfEqTHRotuy7ij7mT6OZOBN3eN8QRoskNmFTItdeWEmHzNAWnLefdZQ==
X-Received: by 2002:a17:90a:20a2:: with SMTP id
	f31mr11139393pjg.90.1562413160988; 
	Sat, 06 Jul 2019 04:39:20 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.122.165])
	by smtp.gmail.com with UTF8SMTPSA id
	g66sm11983967pfb.44.2019.07.06.04.39.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 06 Jul 2019 04:39:20 -0700 (PDT)
Date: Sat, 06 Jul 2019 11:39:09 +0000
Message-Id: <20190706113909.11836-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC PATCH] Add gnu testsuite execution for OEQA
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Jul 2019 11:39:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This patch is an RFC for adding support to execute the gnu test suites for
binutils, gcc and glibc. With the intention for enabling automated test running
of these test suites within the OEQA framework such that they can be executed by
the Yocto Autobuilder.

Please note that this patch is not a complete implementation and needs
additional work as well as changes based on comments and feedback from this RFC.

The test suites covered need significant resources or build artifacts such
that running them on the target is undesirable which rules out the use of ptest.
Because of this the test suites can be run on the build host and if necessary
call out to the target.

The following implementation creates a number of recipes that are used to
build/execute the test suites for the different components. The reason for
creating separate recipes is primarily due to dependencies and the need for
components in the sysroot. For example binutils has tests that use the C
compiler however binutils is a dependency for the C compiler and thus would
cause a dependency loop. The issue with sysroots occurs with dependence on
`*-initial` recipes and the test suites needing the non-initial version.

Some issues with splitting the recipes:
 - Rebuilds the recipe
   - Like gcc-cross-testsuite in this patch, could use a stashed builddir
 - Source is duplicated
   - gcc gets around this with shared source
 - Requires having the recipe files and maintaining them
   - Multiple versions of recipes
   - Multiple variants of recipes (-cross, -crosssdk, -native if desired)

Target execution is another issue with the test suites. Note that binutils
however does not require any target execution. In this patch both
qemu-linux-user and ssh target execution solutions are provided. For the
purposes of OE, qemu-linux-user may suffice as it has great success at executing
gcc and gcc-runtime tests with acceptable success at executing the glibc tests.

The glibc test suite can be problematic to execute for a few reasons:
 - Requires access to the exact same filesystem as the build host
   - On physical targets and QEMU this requires NFS mounts
 - Relies on exact syscall behaviour
   - Causes some issues where there are differences between qemu-linux-user and
     the target architectures kernel
 - Can consume significant resources (e.g. OOM, or worse trigger bugs/panics in
   kernel drivers)
 - Slow to execute
   - With QEMU system emulation it can take many hours
   - With some physical target architectures it can take days (e.g. microblaze)

The significantly increased execution speed of qemu-linux-user vs qemu system
with glibc, and the ability for qemu-linux-user to be executed in parallel with
the gcc test suite makes it a strong solution for continuous integration
testing.

The following table shows results for the major test suite components running
with qemu-linux-user execution. The numbers represent 'failed tests'/'total
tests'. The machines used to run the tests are the `qemu*` machine for the
associated architecture, not all qemu machines available in oe-core were tested.
It is important to note that these results are only indicative of
qemu-linux-user behaviour and that there are a number of test failures that are
due to issues not specific to qemu-linux-user.

        | gcc          | g++          | libstdc++   | binutils    | gas         | ld          | glibc
x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |     0/ 1256 |   166/ 1975 |  1423/ 5991
arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |     0/  872 |   155/ 1479 |    64/ 5130
aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |     0/  442 |   157/ 1474 |    76/ 5882
powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |     1/  265 |   157/ 1352 |  1218/ 5110
mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |    43/ 7245 |   803/ 1634 |  2032/ 5847
riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |     0/  257 |   152/ 1062 |    88/ 5847

This patch also introduces some OEQA test cases which cover running the test
suites. However in this specific patch it does not include any implementation
for the automated setup of qemu system emulation testing with runqemu and NFS
mounting for glibc tests. Also not included in these test cases is any known
test failure filtering.

I would also be interested in the opinion with regards to whether these test
suites should be executed as part of the existing Yocto Autobuilder instance.
---
 meta/lib/oeqa/selftest/cases/toolchain.py          |  24 +++++
 meta/recipes-core/glibc/glibc-testsuite_2.29.bb    | 120 +++++++++++++++++++++
 .../binutils/binutils-cross-testsuite_2.32.bb      |  25 +++++
 meta/recipes-devtools/gcc/gcc-common.inc           |   3 +-
 .../gcc/gcc-cross-testsuite_9.1.bb                 |  37 +++++++
 .../gcc/gcc-runtime-testsuite_9.1.bb               |  37 +++++++
 meta/recipes-devtools/gcc/gcc-testsuite.inc        |  65 +++++++++++
 7 files changed, 310 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/toolchain.py
 create mode 100644 meta/recipes-core/glibc/glibc-testsuite_2.29.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-testsuite_9.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime-testsuite_9.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-testsuite.inc

diff --git a/meta/lib/oeqa/selftest/cases/toolchain.py b/meta/lib/oeqa/selftest/cases/toolchain.py
new file mode 100644
index 0000000000..723bded98f
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/toolchain.py
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: MIT
+import os
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+class OEToolchainSelfTest(OESelftestTestCase):
+    """
+    Test cases for OE's toolchain: binutils, gcc and glibc
+    """
+
+    def test_binutils_cross(self):
+        cross_pn = "binutils-cross-testsuite-{0}".format(get_bb_var("TUNE_ARCH"))
+        bitbake("{0} -c check".format(cross_pn))
+
+    def test_gcc_cross(self):
+        cross_pn = "gcc-cross-testsuite-{0}".format(get_bb_var("TUNE_ARCH"))
+        bitbake("{0} -c check".format(cross_pn))
+
+    def test_gcc_runtime(self):
+        bitbake("gcc-runtime-testsuite -c check")
+
+    def test_glibc(self):
+        bitbake("glibc-testsuite -c check")
+
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.29.bb b/meta/recipes-core/glibc/glibc-testsuite_2.29.bb
new file mode 100644
index 0000000000..bab5eb834a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.29.bb
@@ -0,0 +1,120 @@
+require glibc_${PV}.bb
+
+# handle PN differences
+FILESEXTRAPATHS_prepend := "${THISDIR}/glibc:"
+
+# strip provides
+PROVIDES = ""
+# setup depends
+INHIBIT_DEFAULT_DEPS = ""
+
+DEPENDS += "glibc-locale libgcc gcc-runtime"
+
+# remove the initial depends
+DEPENDS_remove = "libgcc-initial"
+DEPENDS_remove = "linux-libc-headers"
+DEPENDS_remove = "virtual/${TARGET_PREFIX}libc-initial"
+DEPENDS_remove = "virtual/${TARGET_PREFIX}gcc-initial"
+
+inherit qemu
+
+DEPENDS += "qemu-native"
+
+# Add CFLAGS for GCC warnings that are new
+CFLAGS_append = " -Wno-error=alloc-size-larger-than="
+
+python dummy_test_wrapper_content() {
+    import sys
+    import os
+    import subprocess
+
+    args = sys.argv[1:]
+
+    if args[0] == "env":
+        args.pop(0)
+        while "=" in args[0]:
+            env = args.pop(0)
+            qemuargs.append("-E")
+            qemuargs.append(env)
+    if args[0] == "cp":
+        # ignore copies, the filesystem is the same
+        sys.exit(0)
+
+    r = subprocess.run(qemuargs + args)
+    sys.exit(r.returncode)
+}
+
+generate_test_wrapper_user[dirs] += "${WORKDIR}"
+python generate_test_wrapper_user() {
+    qemu_binary = qemu_target_binary(d)
+    qemu_binary = bb.utils.which(d.getVar("PATH"), qemu_binary)
+
+    if qemu_binary is None:
+        bb.fatal("Missing target qemu linux-user binary")
+
+    args = [qemu_binary]
+    args += (d.getVar("QEMU_OPTIONS") or "").split()
+    args += ["-L", d.getVar("RECIPE_SYSROOT")]
+    #args += ["-E", "LD_DEBUG=all"]
+    args += ["-E", "LD_LIBRARY_PATH=%s" % ":".join(["/usr/lib", "/lib"])]
+
+    formattedargs = " ".join("\"{0}\"".format(i) if (" " in i) else i for i in args)
+    testwrapper = os.path.join(d.getVar("WORKDIR"), "check-test-wrapper")
+    with open(testwrapper, "w") as f:
+        f.write("#!/usr/bin/env python3\n")
+        f.write("qemuargs = [\n")
+        for i in args:
+            if "\"" in i:
+                i = i.replace("\"", "\\\"")
+            f.write("    \"{0}\",\n".format(i))
+        f.write("    ]\n")
+
+        for i in d.getVar("dummy_test_wrapper_content").splitlines():
+            f.write("%s\n" % i[4:])
+    os.chmod(testwrapper, 0o755)
+}
+
+python dummy_test_wrapper_content_ssh() {
+    import sys
+    import os
+    import subprocess
+
+    args = ["ssh", "-p", port, "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no", "{0}@{1}".format(user, host), "sh", "-c"]
+
+    command = ""
+    #command += "export TIMEOUTFACTOR=10000; "
+    command += " ".join(["'%s'" % i.replace("'", r"'\''") for i in ["cd", os.getcwd()]]) + "; "
+    command += " ".join(["'%s'" % i.replace("'", r"'\''") for i in sys.argv[1:]])
+    args.append("\"%s\"" % command)
+
+    r = subprocess.run(args)
+    sys.exit(r.returncode)
+}
+
+BUILD_TEST_HOST ??= "localhost"
+BUILD_TEST_HOST_USER ??= "root"
+BUILD_TEST_HOST_PORT ??= "2222"
+
+generate_test_wrapper_ssh[dirs] += "${WORKDIR}"
+generate_test_wrapper_ssh[vardeps] += "dummy_test_wrapper_content_ssh"
+python generate_test_wrapper_ssh() {
+    testwrapper = os.path.join(d.getVar("WORKDIR"), "check-test-wrapper")
+    with open(testwrapper, "w") as f:
+        f.write("%s\n" % "#!/usr/bin/env python3")
+        f.write("host = \"{0}\"\n".format(d.getVar("BUILD_TEST_HOST")))
+        f.write("user = \"{0}\"\n".format(d.getVar("BUILD_TEST_HOST_USER")))
+        f.write("port = \"{0}\"\n".format(d.getVar("BUILD_TEST_HOST_PORT")))
+        for i in d.getVar("dummy_test_wrapper_content_ssh").splitlines():
+            f.write("%s\n" % i[4:])
+    os.chmod(testwrapper, 0o755)
+}
+
+do_check[dirs] += "${B}"
+do_check[nostamp] = "1"
+do_check[prefuncs] += "generate_test_wrapper_user"
+addtask do_check after do_compile
+do_check () {
+    #oe_runmake test-wrapper='${WORKDIR}/check-test-wrapper' PARALLELMFLAGS="-j1" check
+    oe_runmake test-wrapper='${WORKDIR}/check-test-wrapper' check
+}
+
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb
new file mode 100644
index 0000000000..233d981af2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb
@@ -0,0 +1,25 @@
+require binutils-cross_${PV}.bb
+
+PN = "binutils-cross-testsuite-${TARGET_ARCH}"
+
+PROVIDES = ""
+
+DEPENDS += "dejagnu-native expect-native"
+
+DEPENDS += "virtual/${TARGET_PREFIX}gcc"
+DEPENDS += "virtual/${TARGET_PREFIX}compilerlibs"
+DEPENDS += "virtual/libc"
+
+# these are needed for testsuite
+export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
+export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
+export GCC_FOR_TARGET = "${TARGET_PREFIX}gcc"
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+do_check[dirs] = "${B}"
+do_check() {
+    oe_runmake check
+}
+addtask check before do_build after do_compile
+
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 96334e54b4..617e1b5f53 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -17,7 +17,8 @@ python extract_stashed_builddir () {
     src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}")
     dest = d.getVar("B")
     oe.path.copyhardlinktree(src, dest)
-    staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
+    #staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
+    staging_processfixme([src + "/fixmepath"], dest, d.getVar("RECIPE_SYSROOT"), d.getVar("RECIPE_SYSROOT_NATIVE"), d)
 }
 
 def get_gcc_float_setting(bb, d):
diff --git a/meta/recipes-devtools/gcc/gcc-cross-testsuite_9.1.bb b/meta/recipes-devtools/gcc/gcc-cross-testsuite_9.1.bb
new file mode 100644
index 0000000000..e497fce746
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-testsuite_9.1.bb
@@ -0,0 +1,37 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-cross.inc
+
+PN = "gcc-cross-testsuite-${TARGET_ARCH}"
+
+PROVIDES = ""
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "dejagnu-native expect-native"
+DEPENDS += "qemu-native"
+
+DEPENDS += "virtual/libc"
+DEPENDS += "virtual/${TARGET_PREFIX}compilerlibs"
+
+require gcc-testsuite.inc
+
+EXTRACONFFUNCS += "extract_stashed_builddir"
+do_configure[depends] += "${COMPILERDEP}"
+
+do_configure() {
+}
+
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+do_package[noexec] = "1"
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+    oe_runmake check-gcc check-g++ RUNTESTFLAGS="--target_board=qemu-linux-user"
+    #oe_runmake check-gcc check-g++ RUNTESTFLAGS="--target_board=linux-ssh"
+}
+addtask check before do_build after do_configure
+
diff --git a/meta/recipes-devtools/gcc/gcc-runtime-testsuite_9.1.bb b/meta/recipes-devtools/gcc/gcc-runtime-testsuite_9.1.bb
new file mode 100644
index 0000000000..9f36649e5e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-runtime-testsuite_9.1.bb
@@ -0,0 +1,37 @@
+require gcc-runtime_${PV}.bb
+
+PROVIDES = ""
+DEPENDS += "dejagnu-native expect-native"
+DEPENDS += "qemu-native"
+
+require gcc-testsuite.inc
+
+DEPENDS += "gcc-runtime"
+
+python () {
+    check = []
+    for i in d.getVar("RUNTIMETARGET").split():
+        check.append("check-target-{0}".format(i))
+    d.setVar("RUNTIMETARGET_CHECK", " ".join(check))
+}
+
+do_configure_append() {
+    # HACK: this works around the configure setting CXX with -nostd* args
+    sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
+}
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+
+    # no test should need more that 10G of memory, this prevents tests like pthread7-rope from memory leaking
+    ulimit -Sm 10485760
+
+    oe_runmake ${RUNTIMETARGET_CHECK} RUNTESTFLAGS="--target_board=qemu-linux-user"
+    #oe_runmake ${RUNTIMETARGET_CHECK} RUNTESTFLAGS="--target_board=linux-ssh"
+}
+addtask check before do_build after do_compile
+
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
new file mode 100644
index 0000000000..1acf2c90b1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -0,0 +1,65 @@
+inherit qemu
+
+python check_prepare() {
+    def generate_qemu_linux_user_config(d):
+        content = []
+        content.append('load_generic_config "sim"')
+        content.append('load_base_board_description "basic-sim"')
+        content.append('process_multilib_options ""')
+
+        # qemu args
+        qemu_binary = qemu_target_binary(d)
+        qemu_binary = bb.utils.which(d.getVar("PATH"), qemu_binary)
+        if qemu_binary is None:
+            bb.fatal("Missing target qemu linux-user binary")
+
+        args = []
+        args += (d.getVar("QEMU_OPTIONS") or "").split()
+        args += ["-L", d.getVar("RECIPE_SYSROOT")]
+        #args += ["-E", "LD_DEBUG=all"]
+        args += ["-E", "LD_LIBRARY_PATH={0}".format(":".join(["/usr/lib", "/lib"]))]
+
+        content.append('set_board_info is_simulator 1')
+        content.append('set_board_info sim "{0}"'.format(qemu_binary))
+        content.append('set_board_info sim,options "{0}"'.format(" ".join(args)))
+
+        # target build/test config
+        content.append('set_board_info target_install {%s}' % d.getVar("TARGET_SYS"))
+        content.append('set_board_info ldscript ""')
+        #content.append('set_board_info needs_status_wrapper 1') # qemu-linux-user return codes work, and abort works fine
+        content.append('set_board_info gcc,stack_size 16834')
+        content.append('set_board_info gdb,nosignals 1')
+        content.append('set_board_info gcc,timeout 60')
+
+        return "\n".join(content)
+
+    def generate_remote_ssh_linux_config(d):
+        content = []
+        content.append('load_generic_config "unix"')
+        content.append("set_board_info hostname {0}".format("localhost"))
+        content.append("set_board_info username {0}".format("root"))
+
+        port = "2222"
+        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+
+        return "\n".join(content)
+
+    dejagnudir = d.expand("${WORKDIR}/dejagnu")
+    if not os.path.isdir(dejagnudir):
+        os.makedirs(dejagnudir)
+
+    # write out target qemu board config
+    with open(os.path.join(dejagnudir, "qemu-linux-user.exp"), "w") as f:
+        f.write(generate_qemu_linux_user_config(d))
+
+    # write out target ssh board config
+    with open(os.path.join(dejagnudir, "linux-ssh.exp"), "w") as f:
+        f.write(generate_remote_ssh_linux_config(d))
+
+    # generate site.exp to provide boards
+    with open(os.path.join(dejagnudir, "site.exp"), "w") as f:
+        f.write("lappend boards_dir {0}\n".format(dejagnudir))
+        f.write("set CFLAGS_FOR_TARGET \"{0}\"\n".format(d.getVar("TOOLCHAIN_OPTIONS") + " " + d.getVar("TUNE_CCARGS")))
+}
+
---
2.20.1

