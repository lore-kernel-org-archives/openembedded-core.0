Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEFC6C0C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:40:05 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id n9so42760698pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2019 23:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=cFLXCWtlXtBepeemQNDWawXs8gTOqzrx2MwgpLmLmuQ=;
	b=E2UdDTPofnPrZFbOMVwJLMVfrfHQrs84HiDDZM3oj6jz/OG6nf4Xjar2N514dOpj8N
	qkRaSQr9+Y3aWloZlyDPhDL7aQJvIGbnrLvp9W7uvMMcPUk5Sd1SlPP7bxp1p3kCSfCk
	EV20yPOuVSsx0PS+4yucO9ontT7SYzqU3nx8usz248Ocab8vFsWGLjTDOH0/9XR5Qk0M
	ImTnBlBdOzU+1r08Gvow/9ytvGjaC1v7CbvbRVSNY3gk7x6MJvolBiRnpQuewA16jfmG
	2vfvOiwcjxG2Izco2jQ21XUmQSUoPHpOTNn9y7KwLQ3R5Zr7cq0Q9LAo1kASCtO3V0Hz
	fOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=cFLXCWtlXtBepeemQNDWawXs8gTOqzrx2MwgpLmLmuQ=;
	b=mimqkuv0F/yaWOVvyZe6KTaKyXmMBsFncN8xISeaAexKLXeUXRp4wG2C9QSnqDuNm/
	MDSy8PrmaeiL7/+l/FRKJCeJwxKbfEMNFXyDKmCCItrSptoeD+HfyyUP3EOuESnVbVKs
	Aep71LS76srsEpteu3jWP7J6TdIQcyF18/+/mAMAD3pwqH6OQ/ZhEg+0K6SRbjEWH5yV
	H8zUuwrYUafD1gyNTPEnaqRig92RZCGNFeu7r+G5S3AqASY8PqgNdyf9gFuP8gvwrMH0
	GjNf7zAdQg6QnUvRTkpa5o/08eSZfz8Of6Xp7WQE3Bfi6ZfxxsEVxAOrTtPBKrUua0Ky
	7fZw==
X-Gm-Message-State: APjAAAUjydiBKMsQY6qXgU8u3bV1UIjGJFPDWgNGEboMiKF6xch7hPh8
	TpbYCWc8QPE7Z4J0v42RmhamuQ==
X-Google-Smtp-Source: APXvYqy1oTM8+115+5et3kit0O6ORxTni+pwya1yN+eOyv5F6afan+/sm597eodUD+0IgXs0lS0Y6Q==
X-Received: by 2002:a62:642:: with SMTP id 63mr34465679pfg.257.1565592005585; 
	Sun, 11 Aug 2019 23:40:05 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.0.244])
	by smtp.gmail.com with UTF8SMTPSA id
	ay7sm7038963pjb.4.2019.08.11.23.40.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 23:40:04 -0700 (PDT)
Date: Mon, 12 Aug 2019 06:39:47 +0000
Message-Id: <20190812063947.11001-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC PATCH v2] WIP: Add gnu testsuite execution for OEQA
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
X-List-Received-Date: Mon, 12 Aug 2019 06:40:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This patch is an RFC for adding support to execute the gnu test suites
for binutils, gcc and glibc. With the intention for enabling automated
test running of these test suites within the OEQA framework such that
they can be executed by the Yocto Autobuilder.

Please note that this patch is a work in progress. For ease of reference
and review the entire changeset is currently provided as a single commit
including work in progress patches for gcc.

The test suites covered need significant resources or build artifacts
such that running them on the target is undesirable which rules out the
use of ptest. Because of this the test suites can be run on the build
host and call out to the target for execution (via ssh or using qemu
usermode).

The following implementation adds a do_check task to binutils-cross,
gcc-cross and gcc-runtime in order to execute the test suite on the
build host. For glibc, a second recipe is created which includes the
base glibc recipe. The reason for this is due to the libgcc -> glibc
-> libgcc-initial dependency chain and the requirements of the test
suite to have libgcc for compilation and execution testing.

Target execution is another important issue specifically since target
execution is slow to extremely slow depending on the physical or
emulated target performance. In order to provide faster execution
performance qemu linux-user is implemented alongside qemu system
emulation (via ssh+nfs). In initial testing qemu linux user vs qemu
system emulation provided performance gains of between 10x to 60x whilst
initially having small pass/fail differences. Further work as covered in
this patch reduces the pass/fail differences for gcc/gcc-runtime to
almost 0 (with filtering of the small amount of known qemu user
failures).

However glibc is more strict with its expectations of CPU implementation
as well as syscall behaviour. Additionally glibc expects to be able to
execute OS tools such as 'sh' and 'echo' of which is not easy to provide
in the recipe-sysroot (bindir is not populated into the sysroot). As
such correct test results for glibc rely on execution with qemu system
emulation or on a physical target. This patch however still includes
qemu user execution for glibc with a large set of filtered tests that
are known to fail specifically under qemu user execution.

(failed tests / total tests / filtered test failures)
           | binutils      | gas           | gold         | ld           | libiberty
aarch64    |    0/  201/ 0 |    0/  443/ 0 |   0/    9/ 0 |   0/ 1601/ 0 |   0/   28/ 0
arm        |    0/  202/ 0 |    0/  873/ 0 |   0/   26/ 0 |   0/ 1603/ 1 |   0/   28/ 0
i686       |    0/  207/ 0 |    0/ 1257/ 0 |   0/    6/ 0 |   0/ 1715/ 0 |   0/   28/ 0
mips       |    0/  225/ 0 |    0/ 7222/ 0 |   0/    5/ 1 |   0/ 1804/21 |   0/   28/ 0
mips64     |    0/  224/ 0 |    0/ 7246/ 0 |   0/    5/ 1 | 646/ 1750/15 |   0/   28/ 0
powerpc    |    0/  198/ 0 |    0/  266/ 1 |   0/    5/ 0 |   0/ 1503/ 0 |   0/   28/ 0
riscv64    |    0/  196/ 0 |    0/  258/ 0 |              |   0/ 1150/ 4 |   0/   28/ 0
x86_64     |    0/  247/ 0 |    0/ 1257/ 0 |   0/   11/ 0 |   0/ 2138/ 0 |   0/   28/ 0

           | gcc           | g++           | libatomic    | libgomp      | libitm       | libstdc++-v3
aarch64    |   6/130911/ 1 |   0/129010/ 0 |   0/   54/ 0 |   0/ 2515/ 0 |   0/   46/ 0 |   1/12787/ 0
arm        |   0/122468/ 3 |   1/128403/ 0 |   0/   49/ 0 |   0/ 2515/ 0 |   0/   46/ 0 |   0/12786/19
i686       |   1/133589/39 |   0/130255/ 0 |   0/   49/ 0 |   0/ 2522/ 0 |   0/   46/ 0 |   1/13006/17
mips       | 117/132171/ 1 |  20/128150/ 0 |   4/   49/ 0 |   2/ 2515/ 0 |              |  14/12778/17
mips64     | 169/134736/ 5 |  49/130221/ 0 |   1/   54/ 0 |   0/ 2515/ 0 |              |   8/12778/ 0
powerpc    | 341/119777/ 5 |  19/129082/ 0 |   0/   49/ 0 |   2/ 2515/ 0 |   0/   46/ 0 |  16/12994/17
riscv64    |  10/106406/ 2 |  24/128453/ 0 |   0/   54/ 0 |   4/ 2512/ 0 |              |   1/12746/ 0
x86_64     |   0/135180/24 |   0/131939/ 0 |   0/   54/ 0 |   0/ 2522/ 0 |   0/   46/ 0 |   2/13006/ 0
x86_64-kvm |   3/135420/ 4 |   0/131939/ 0 |   0/   54/ 0 |   1/ 2522/ 0 |  18/   46/ 0 |  54/13008/ 0

           | glibc         | glibc-2.30
aarch64    |   56/ 5882/19 |   58/ 5994/19
arm        |   49/ 5130/18 |   51/ 5240/19
i686       | 1464/ 5900/ 9 | 1466/ 6010/10
mips       |   63/ 5094/19 |   63/ 5199/19
mips64     | 2014/ 5847/19 | 2017/ 5952/18
powerpc    | 1202/ 5110/19 | 1207/ 5254/19
riscv64    |   68/ 5847/19 |   68/ 5952/18
x86_64     | 1417/ 5991/38 | 1421/ 6101/39
x86_64-kvm |   26/ 5982/ 0 |   46/ 6092/ 0

This patch also introduces some OEQA test cases which cover running the
test suites. The test cases are split into binutils, gcc and glibc.
Individual test cases provide execution of the sub-suites of tests
within each target. For example binutils has binutils, gas, gold, ld and
libiberty suites which can each be executed independently.

The OEQA test cases implement execution on qemu linux user by default.
Subclasses implement qemu system emulation setup and configuration for
running the tests.

Changes in v2:
- Moved gcc/binutils test suite recipes into tasks on
  binutils-cross/gcc-cross/gcc-runtime
- Split selftest module into separate classes for binutils/gcc/glibc
- Split selftest test cases into associated testsuites
  (e.g. gcc -> gcc, g++)
- Added test result parsing into pass/fail/etc.
- Added system emulation test cases into selftest module (including unfs
  setup)
- Added test case filtering and asserting failure to selftest module
- Fixes and improvements to resolve test case failures (primarily for
  binutils/gcc)
- GCC patches to mark specific warnings as acceptable output
- GCC patches to fix specific tests
- Fix for OE specific binutils patch
- Testing against glibc 2.30
---
 meta/lib/oeqa/selftest/cases/toolchain.py          | 573 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc-testsuite_2.30.bb    | 134 +++++
 meta/recipes-devtools/binutils/binutils-cross.inc  |  28 +
 ...Change-default-emulation-for-mips64-linux.patch |  14 +-
 meta/recipes-devtools/gcc/gcc-9.1.inc              |   1 +
 meta/recipes-devtools/gcc/gcc-9.1/WIP.patch        |  95 ++++
 meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            |  41 ++
 meta/recipes-devtools/gcc/gcc-runtime.inc          |  37 ++
 meta/recipes-devtools/gcc/gcc-testsuite.inc        | 106 ++++
 10 files changed, 1023 insertions(+), 8 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/toolchain.py
 create mode 100644 meta/recipes-core/glibc/glibc-testsuite_2.30.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/WIP.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-testsuite.inc

diff --git a/meta/lib/oeqa/selftest/cases/toolchain.py b/meta/lib/oeqa/selftest/cases/toolchain.py
new file mode 100644
index 0000000000..4075e5b535
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/toolchain.py
@@ -0,0 +1,573 @@
+# SPDX-License-Identifier: MIT
+import os
+import sys
+import time
+import datetime
+import tempfile
+import contextlib
+import re
+import logging
+import socket
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
+
+class Results:
+    _dejagnu_test_results = [
+        ("PASS", "passed"), ("FAIL", "failed"),
+        ("XPASS", "epassed"), ("XFAIL", "efailed"),
+        ("UNRESOLVED", "unresolved"), ("UNSUPPORTED", "unsupported"), ("UNTESTED", "untested"),
+        ("ERROR", "error"), ("WARNING", "warning"),
+        ]
+
+    def __init__(self, filtered = None):
+        self.filtered = filtered or []
+        self.ignored = []
+        for v, f in self._dejagnu_test_results:
+            setattr(self, f, [])
+
+    def filter(self, tests):
+        self.filtered += tests
+
+    def parse_file(self, path, **kwargs):
+        with open(path, "r") as f:
+            self.parse_values(f, **kwargs)
+
+    def parse_values(self, content, arch = None, gold = False):
+        suffix = ": " if not gold else " "
+        for i in content:
+            for v, f in self._dejagnu_test_results:
+                if i.startswith(v + suffix):
+                    name = i[len(v) + len(suffix):].strip()
+                    if self.filtered is not None and f == "failed":
+                        if gold:
+                            name = name.split(" (exit status:")[0]
+                        if self.check_filtered(name, arch = arch):
+                            self.ignored.append(name)
+                            break
+                    getattr(self, f).append(name)
+                    break
+
+    def check_filtered(self, name, arch = None):
+        for i in self.filtered:
+            iname, iarch = i, None
+            if isinstance(i, (list, tuple)):
+                iname, iarch = i
+
+            if iname != name:
+                continue
+            if iarch is None or arch is None:
+                return True
+
+            # match arch pattern
+            if re.match(iarch, arch, re.IGNORECASE):
+                return True
+        return False
+
+    def __repr__(self):
+        return "P:{} F:{} XP:{} XF:{} UR:{} US:{} UT:{} E:{} W:{} I:{}".format(
+                len(self.passed), len(self.failed), len(self.epassed), len(self.efailed),
+                len(self.unresolved), len(self.unsupported), len(self.untested),
+                len(self.error), len(self.warning), len(self.ignored))
+
+class OEToolchainSelfTestCase(OESelftestTestCase):
+    default_installed_packages = []
+
+    def setUp(self):
+        super().setUp()
+        self.results = Results()
+
+    @contextlib.contextmanager
+    def prepare_qemu(self, packages = None):
+        tune_arch = get_bb_var("TUNE_ARCH")
+
+        # build core-image-minimal with required packages
+        features = []
+        features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+        features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(packages or self.default_installed_packages)))
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+        params = ["nographic"]
+        qemuparams = []
+        if "x86_64" in tune_arch:
+            params += ["kvm", "kvm-vhost"]
+            # qemuparams += ["-smp", "4"]
+
+        with runqemu("core-image-minimal", runqemuparams = " ".join(params), qemuparams = " ".join(qemuparams)) as qemu:
+            # validate that SSH is working
+            status, _ = qemu.run("uname")
+            self.assertEqual(status, 0)
+
+            yield qemu
+
+class BinutilsSelfTest(OEToolchainSelfTestCase):
+    """
+    Test cases for binutils
+    """
+    def test_cross_binutils(self):
+        self.run_cross_binutils("binutils")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_cross_binutils_gas(self):
+        self.results.filter([
+            ("POWER9 tests", "powerpc"),
+            ])
+        self.run_cross_binutils("gas")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_cross_binutils_ld(self):
+        self.results.filter([
+            "Dump pr21978.so",
+            ("Build pr22263-1", "arm|riscv64"),
+
+            # TODO: verify
+            ("indirect5c dynsym", "riscv64"),
+            ("indirect5d dynsym", "riscv64"),
+            ("ld-scripts/size-1", "riscv64"),
+
+            # TODO: these failures are due to an issue with how mips sets up relocs/dynamic symbols
+            ("indirect5a dynsym", "mips"),
+            ("indirect5b dynsym", "mips"),
+            ("indirect5c dynsym", "mips"),
+            ("indirect5d dynsym", "mips"),
+            ("indirect6c dynsym", "mips"),
+            ("indirect6d dynsym", "mips"),
+            ("Build libpr16496b.so", "mips"),
+            ("vers24a", "mips"),
+            ("vers24b", "mips"),
+            ("vers24c", "mips"),
+            ("--gc-sections with --defsym", "mips"),
+            ("--gc-sections with KEEP", "mips"),
+            ("--gc-sections with __start_SECTIONNAME", "mips"),
+            ("PR ld/13229", "mips"),
+            ("ld-plugin/lto-3r", "mips"),
+            ("ld-plugin/lto-5r", "mips"),
+            ("PR ld/19317 (2)", "mips"),
+            ("PR ld/15323 (4)", "mips"),
+            ("PR ld/19317 (3)", "mips"),
+            ("shared (non PIC)", "mips"),
+            ("shared (PIC main, non PIC so)", "mips"),
+            ])
+        self.run_cross_binutils("ld")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_cross_binutils_gold(self):
+        self.results.filter([
+            ("script_test_10.sh", "mips"), # (abi sections break ordering)
+            ])
+        self.run_cross_binutils("gold")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_cross_binutils_libiberty(self):
+        self.run_cross_binutils("libiberty")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def run_cross_binutils(self, suite):
+        # configure ssh target
+        features = []
+        features.append('MAKE_CHECK_TARGETS = "check-{0}"'.format(suite))
+        self.write_config("\n".join(features))
+
+        recipe = "binutils-cross-{0}".format(get_bb_var("TUNE_ARCH"))
+        bitbake("{0} -c check".format(recipe))
+
+        bb_vars = get_bb_vars(["TUNE_ARCH", "B", "TARGET_SYS", "T"], recipe)
+        tune_arch, builddir, target_sys, tdir = bb_vars["TUNE_ARCH"], bb_vars["B"], bb_vars["TARGET_SYS"], bb_vars["T"]
+
+        if suite in ["binutils", "gas", "ld"]:
+            sumspath = os.path.join(builddir, suite, "{0}.sum".format(suite))
+            if not os.path.exists(sumspath):
+                sumspath = os.path.join(builddir, suite, "testsuite", "{0}.sum".format(suite))
+            self.results.parse_file(sumspath, arch = tune_arch)
+        elif suite in ["gold"]:
+            # gold tests are not dejagnu, so no sums file
+            logspath = os.path.join(builddir, suite, "testsuite")
+            if os.path.exists(logspath):
+                for t in os.listdir(logspath):
+                    if t.endswith(".log") and t != "test-suite.log":
+                        self.results.parse_file(os.path.join(logspath, t), arch = tune_arch, gold = True)
+            else:
+                self.skipTest("Target does not use {0}".format(suite))
+        elif suite in ["libiberty"]:
+            # libiberty tests are not dejagnu, no sums or log files
+            logpath = os.path.join(tdir, "log.do_check")
+            lines = ""
+            if os.path.exists(logpath):
+                with open(logpath, "r") as f:
+                    m = re.search(r"entering directory\s+'[^\r\n]+?libiberty/testsuite'.*?$(.*?)" +
+                        "^[^\r\n]+?leaving directory\s+'[^\r\n]+?libiberty/testsuite'.*?$",
+                        f.read(), re.DOTALL | re.MULTILINE | re.IGNORECASE)
+                    if m is not None:
+                        lines = m.group(1).splitlines()
+            self.results.parse_values(lines, arch = tune_arch)
+        self.logger.info("{} - {} summary {}".format(tune_arch, suite, repr(self.results)))
+
+class GccSelfTest(OEToolchainSelfTestCase):
+    """
+    Test cases for gcc and gcc-runtime.
+    """
+    def test_cross_gcc(self):
+        self.results.filter([
+            # posion options are not listed in --help of gcc
+            'compiler driver --help=warnings option(s): "^ +-.*[^:.]$" absent from output: "  -Wpoison-system-directories Warn for -I and -L options using system directories if cross compiling"',
+
+            # known failures (reported by other distros/users)
+            ("gcc.target/arm/polytypes.c  (test for warnings, line 30)", "arm"), # test has incorrect pattern for warning
+            ("gcc.target/arm/pr43920-2.c scan-assembler-times pop 2", "arm"),
+            (r"gcc.target/arm/addr-modes-float.c scan-assembler vst3.8\t{d[02468], d[02468], d[02468]}, \\[r[0-9]+\\]!", "arm"),
+            ("gcc.target/i386/pr57193.c scan-assembler-times movdqa 2", "i686|x86_64"),
+            (r"gcc.target/i386/pr81563.c scan-assembler-times movl[\\t ]*-4\\(%ebp\\),[\\t ]*%edi 1", "i686"),
+            (r"gcc.target/i386/pr81563.c scan-assembler-times movl[\\t ]*-8\\(%ebp\\),[\\t ]*%esi 1", "i686"),
+            (r"gcc.target/i386/pr90178.c scan-assembler-times xorl[\\t ]*\\%eax,[\\t ]*%eax 1", "i686|x86_64"),
+
+            # fail on arm due to march flag conflicts (gcc patch skipping for -march=armv7ve)
+            # (r"gcc.target/arm/atomic_loaddi_1.c scan-assembler-times ldrexd\tr[0-9]+, r[0-9]+, \\[r[0-9]+\\] 1", "arm"),
+            # (r"gcc.target/arm/atomic_loaddi_4.c scan-assembler-times ldrexd\tr[0-9]+, r[0-9]+, \\[r[0-9]+\\] 1", "arm"),
+            # (r"gcc.target/arm/atomic_loaddi_7.c scan-assembler-times ldrexd\tr[0-9]+, r[0-9]+, \\[r[0-9]+\\] 1", "arm"),
+
+            # TODO:
+            ("gcc.target/i386/pr57275.c execution test", "i686|x86_64"),
+
+            # TODO: these fail sometimes due to timing?
+            "gcc.dg/tree-prof/time-profiler-2.c scan-ipa-dump-times profile \"Read tp_first_run: 0\" 2",
+            "gcc.dg/tree-prof/time-profiler-2.c scan-ipa-dump-times profile \"Read tp_first_run: 2\" 1",
+            "gcc.dg/tree-prof/time-profiler-2.c scan-ipa-dump-times profile \"Read tp_first_run: 3\" 1",
+            # TODO: this one fails sometimes due to large output data which gets truncated
+            "c-c++-common/builtins.c  -Wc++-compat  (test for excess errors)",
+            ])
+
+        self.results.filter([
+            # i686/x86_64 usermode failures
+            ("gcc.c-torture/execute/loop-2f.c   -O0  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2f.c   -O1  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2f.c   -O2  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2f.c   -O2 -flto -fno-use-linker-plugin -flto-partition=none  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2f.c   -O2 -flto -fuse-linker-plugin -fno-fat-lto-objects  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2f.c   -O3 -fomit-frame-pointer -funroll-loops -fpeel-loops -ftracer -finline-functions  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2f.c   -O3 -g  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2f.c   -Os  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -O0  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -O1  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -O2  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -O2 -flto -fno-use-linker-plugin -flto-partition=none  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -O2 -flto -fuse-linker-plugin -fno-fat-lto-objects  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -O3 -fomit-frame-pointer -funroll-loops -fpeel-loops -ftracer -finline-functions  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -O3 -g  execution test", "i686"),
+            ("gcc.c-torture/execute/loop-2g.c   -Os  execution test", "i686"),
+            ("gcc.dg/pr59833.c execution test", "i686"),
+            ("gcc.dg/pr61441.c execution test", "i686"),
+            ("gcc.target/i386/bmi2-pdep32-1.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/bmi2-pdep64-1.c execution test", "x86_64"),
+            ("gcc.target/i386/bmi2-pext32-1.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/bmi2-pext64-1.c execution test", "x86_64"),
+            ("gcc.target/i386/sse4_1-ceil-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_1-ceilf-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_1-floor-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_1-floorf-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_1-rint-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_1-rintf-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_1-round-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_1-roundf-sfix-vec.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_2-pcmpistri-1.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_2-pcmpistri-2.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_2-pcmpistrm-1.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4_2-pcmpistrm-2.c execution test", "i686|x86_64"),
+            ("gcc.target/i386/sse4a-insert.c execution test", "i686|x86_64"),
+            ])
+
+        self.gcc_cross_run_check("gcc")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_cross_gxx(self):
+        self.gcc_cross_run_check("g++")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_gcc_runtime_libatomic(self):
+        self.gcc_runtime_run_check("libatomic")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_gcc_runtime_libgomp(self):
+        self.gcc_runtime_run_check("libgomp")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_gcc_runtime_libstdcxx(self):
+        common_32_pattern = "arm|i686|powerpc|mips"
+        self.results.filter([
+            # common - 32bit - usermode issue
+            ("27_io/filesystem/iterators/caching.cc execution test", common_32_pattern),
+            ("27_io/filesystem/iterators/directory_iterator.cc execution test", common_32_pattern),
+            ("27_io/filesystem/iterators/pop.cc execution test", common_32_pattern),
+            ("27_io/filesystem/iterators/recursion_pending.cc execution test", common_32_pattern),
+            ("27_io/filesystem/iterators/recursive_directory_iterator.cc execution test", common_32_pattern),
+            ("27_io/filesystem/operations/canonical.cc execution test", common_32_pattern),
+            ("27_io/filesystem/operations/copy.cc execution test", common_32_pattern),
+            ("27_io/filesystem/operations/create_directories.cc execution test", common_32_pattern),
+            ("27_io/filesystem/operations/is_empty.cc execution test", common_32_pattern),
+            ("27_io/filesystem/operations/remove_all.cc execution test", common_32_pattern),
+            ("experimental/filesystem/iterators/directory_iterator.cc execution test", common_32_pattern),
+            ("experimental/filesystem/iterators/pop.cc execution test", common_32_pattern),
+            ("experimental/filesystem/iterators/recursive_directory_iterator.cc execution test", common_32_pattern),
+            ("experimental/filesystem/operations/copy.cc execution test", common_32_pattern),
+            ("experimental/filesystem/operations/create_directories.cc execution test", common_32_pattern),
+            ("experimental/filesystem/operations/is_empty.cc execution test", common_32_pattern),
+            ("experimental/filesystem/operations/remove_all.cc execution test", common_32_pattern),
+
+            ("30_threads/condition_variable/54185.cc execution test", "arm"), # memory leak
+            ("ext/rope/pthread7-rope.cc execution test", "arm"), # memory leak
+            ])
+        self.gcc_runtime_run_check("libstdc++-v3")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_gcc_runtime_libssp(self):
+        self.gcc_runtime_check_skip("libssp")
+        self.gcc_runtime_run_check("libssp")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def test_gcc_runtime_libitm(self):
+        self.gcc_runtime_check_skip("libitm")
+        self.gcc_runtime_run_check("libitm")
+        self.assertEqual(len(self.results.failed), 0)
+
+    def gcc_run_check(self, recipe, suite, target_prefix = "check-", ssh = None):
+        targets = [target_prefix + s.replace("gcc", "gcc").replace("g++", "c++") for s in suites]
+
+        # configure ssh target
+        features = []
+        features.append('MAKE_CHECK_TARGETS = "{0}"'.format(" ".join(targets)))
+        if ssh is not None:
+            features.append('BUILD_TEST_TARGET = "ssh"')
+            features.append('BUILD_TEST_HOST = "{0}"'.format(ssh))
+            features.append('BUILD_TEST_HOST_USER = "root"')
+            features.append('BUILD_TEST_HOST_PORT = "22"')
+        self.write_config("\n".join(features))
+
+        bitbake("{0} -c check".format(recipe))
+
+        bb_vars = get_bb_vars(["TUNE_ARCH", "B", "TARGET_SYS"], recipe)
+        tune_arch, builddir, target_sys = bb_vars["TUNE_ARCH"], bb_vars["B"], bb_vars["TARGET_SYS"]
+
+        sumspath = os.path.join(builddir, "gcc", "testsuite", suite, "{0}.sum".format(suite))
+        if not os.path.exists(sumspath): # check in target dirs
+            sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite))
+        if not os.path.exists(sumspath): # handle libstdc++-v3 -> libstdc++
+            sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite.split("-")[0]))
+        self.results.parse_file(sumspath, arch = tune_arch)
+
+        self.logger.info("{} - {} {} summary {}".format(tune_arch, recipe, suite, repr(self.results)))
+        for i in self.results.failed:
+            self.logger.info("{} - {} {} failed {}".format(tune_arch, recipe, suite, i))
+
+    def gcc_cross_run_check(self, suite):
+        return self.gcc_run_check("gcc-cross-{0}".format(get_bb_var("TUNE_ARCH")), suite)
+
+    def gcc_runtime_check_skip(self, suite):
+        targets = get_bb_var("RUNTIMETARGET", "gcc-runtime").split()
+        if suite not in targets:
+            self.skipTest("Target does not use {0}".format(suite))
+
+    def gcc_runtime_run_check(self, suite):
+        return self.gcc_run_check("gcc-runtime", suite, target_prefix = "check-target-")
+
+class GccSelfTestSystemEmulated(GccSelfTest):
+    """
+    Test cases for gcc and gcc-runtime. With target execution run on a QEMU
+    system emulated target (via runqemu).
+    """
+    default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+
+    def gcc_run_check(self, *args, **kwargs):
+        # wrap the execution with a qemu instance
+        with self.prepare_qemu() as qemu:
+            return super().gcc_run_check(*args, **kwargs, ssh = qemu.ip)
+
+class GlibcSelfTest(OEToolchainSelfTestCase):
+    """
+    Test cases for glibc
+    """
+    _expected_fail_usermode = [
+        "elf/tst-dlopenrpath", # relies on "cp"
+        "elf/tst-ptrguard1", # relies on system()
+        "elf/tst-ptrguard1-static", # relies on system()
+        "elf/tst-stackguard1", # relies on system()
+        "elf/tst-stackguard1-static", # relies on system()
+        "libio/bug-mmap-fflush", # relies on system()
+        "nptl/tst-cancel21-static", # ??
+        "nptl/tst-cancel7", # relies on system()
+        "nptl/tst-cancelx7", # relies on system()
+        "nptl/tst-exec2", # relies on shell
+        "nptl/tst-exec3", # relies on shell
+        "nptl/tst-oddstacklimit", # relies on system
+        "nptl/tst-popen1", # relies on "echo"
+        "nptl/tst-stack4", # ??
+        "nptl/tst-stackguard1", # relies on system()
+        "nptl/tst-stackguard1-static", # relies on system()
+        "posix/tst-execl2", # relies on "cp", "chmod", system()
+        "posix/tst-execle2", # relies on "cp", "chmod", system()
+        "posix/tst-execlp2", # relies on "cp", "chmod", system()
+        "posix/tst-execv2", # relies on "cp", "chmod", system()
+        "posix/tst-execve2", # relies on "cp", "chmod", system()
+        "posix/tst-execvp2", # relies on "cp", "chmod", system()
+        "posix/tst-execvp3", # relies on shell, "echo"
+        "posix/tst-execvpe2", # relies on "cp", "chmod", system()
+        "posix/tst-fexecve", # relies on /bin/sh
+        "posix/tst-vfork3", # relies on /bin/sh, and "echo"
+        "posix/wordexp-test", # relies on shell
+        "stdio-common/tst-popen", # relies on "echo"
+        "stdio-common/tst-popen2", # same
+        "stdlib/tst-system", # relies on shell (system())
+        "nptl/test-cond-printers", # relies on python3
+        "nptl/test-condattr-printers", # relies on python3
+        "nptl/test-mutex-printers", # relies on python3
+        "nptl/test-mutexattr-printers", # relies on python3
+        "nptl/test-rwlock-printers", # relies on python3
+        "nptl/test-rwlockattr-printers", # relies on python3
+        "gmon/tst-gmon-gprof", # requires gprof
+        "gmon/tst-gmon-pie-gprof", # requires gprof
+        "gmon/tst-gmon-static-gprof", # requires gprof
+        ]
+
+    _expected_fail_usermode_unchecked = [
+        "dirent/list", # ??
+        "dirent/tst-scandir", # ??
+        "elf/check-localplt", # ??
+        "elf/tst-env-setuid", # requires root?
+        "elf/tst-env-setuid-tunables", # requires root?
+        "inet/test_ifindex", # ??
+        "io/tst-fts", # ?? (same as dirent/list?)
+        "io/tst-fts-lfs", # ?? (same as dirent/list?)
+        "libio/tst-vtables", # qemu generates error message which is tested against known values and fails
+        "localedata/bug-setlocale1", # ??
+        "localedata/bug-setlocale1-static", # ??
+        "malloc/tst-dynarray-at-fail", # qemu generates error message which is tested against known values and fails
+        "malloc/tst-dynarray-fail", # ??
+        "malloc/tst-malloc-tcache-leak", # timeout too low
+        "malloc/tst-malloc-thread-fail", # ??
+        "malloc/tst-malloc-usable-tunables", # ??
+        "misc/check-installed-headers-c", # kernel headers expected fail
+        "misc/test-errno-linux", # ??
+        "misc/tst-clone2", # ??
+        "misc/tst-clone3", # ??
+        "nptl/tst-align-clone", # ??
+        "nptl/tst-basic7", # ?? - memory?
+        "nptl/tst-cond-except", # ?? - not supported
+        "nptl/tst-cond24", # arm known fail
+        "nptl/tst-cond25", # ?? - not supported
+        "nptl/tst-create-detached", # ?? - memory?
+        "nptl/tst-exec4", # ??
+        "nptl/tst-getpid1", # ??
+        "nptl/tst-robust-fork", # ?? - not supported
+        "nptl/tst-setuid3", # ??
+        "posix/test-errno", # ?? - syscall differences
+        "posix/tst-exec", # ?? - something with exec format error??
+        "posix/tst-exec-static", # ?? - something with exec format error??
+        "posix/tst-execvpe5", # ?? - something with exec format error??
+        "posix/tst-posix_spawn-setsid", # ??
+        "posix/tst-regcomp-truncated", # timeout
+        "posix/tst-spawn", # ??
+        "posix/tst-spawn-static", # ??
+        "posix/tst-spawn2", # ??
+        "posix/tst-spawn4", # ??
+        "rt/tst-mqueue3", # ??
+        "rt/tst-mqueue5", # ??
+        "rt/tst-mqueue6", # ??
+        "rt/tst-mqueue7", # ??
+        "stdlib/bug-fmtmsg1", # bug in check-test-wrapper
+        "stdlib/tst-secure-getenv", # ??
+        "timezone/tst-tzset", # creates 4GB file!
+        ]
+
+    def test_glibc(self):
+        self.results.filter(self._expected_fail_usermode)
+        self.glibc_run_check()
+
+    def glibc_run_check(self, ssh = None):
+        # configure ssh target
+        features = []
+        if ssh is not None:
+            features.append('BUILD_TEST_TARGET = "ssh"')
+            features.append('BUILD_TEST_HOST = "{0}"'.format(ssh))
+            features.append('BUILD_TEST_HOST_USER = "root"')
+            features.append('BUILD_TEST_HOST_PORT = "22"')
+        self.write_config("\n".join(features))
+
+        bitbake("glibc-testsuite -c check")
+
+        tune_arch = get_bb_var("TUNE_ARCH")
+        builddir = get_bb_var("B", "glibc-testsuite")
+        self.results.parse_file(os.path.join(builddir, "tests.sum"), arch = tune_arch)
+        self.logger.info("{} - glibc summary {}".format(tune_arch, repr(self.results)))
+
+@contextlib.contextmanager
+def unfs_server(directory, logger = None):
+    def find_port(tcp = True):
+        s = None
+        try:
+            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM if tcp else socket.SOCK_DGRAM)
+            s.bind(("", 0))
+            port = s.getsockname()[1]
+        finally:
+            if s is not None:
+                s.close()
+        return port
+
+    unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
+    if not os.path.exists(os.path.join(unfs_sysroot, "usr", "bin", "unfsd")):
+        # build native tool
+        bitbake("unfs3-native -c addto_recipe_sysroot")
+
+    exports = None
+    cmd = None
+    try:
+        # create the exports file
+        with tempfile.NamedTemporaryFile(delete = False) as exports:
+            exports.write("{0} (rw,no_root_squash,no_all_squash,insecure)\n".format(directory).encode())
+
+        # find some ports for the server
+        nfsport, mountport = find_port(False), find_port(False)
+
+        nenv = dict(os.environ)
+        nenv['PATH'] = "{0}/sbin:{0}/usr/sbin:{0}/usr/bin:".format(unfs_sysroot) + nenv.get('PATH', '')
+        cmd = Command(["unfsd", "-d", "-p", "-N", "-e", exports.name, "-n", str(nfsport), "-m", str(mountport)],
+                bg = True, env = nenv, output_log = logger)
+        cmd.run()
+        yield nfsport, mountport
+    finally:
+        if cmd is not None:
+            cmd.stop()
+        if exports is not None:
+            # clean up exports file
+            os.unlink(exports.name)
+
+class GlibcSelfTestSystemEmulated(GlibcSelfTest):
+    default_installed_packages = [
+        "glibc-charmaps",
+        "libgcc",
+        "libstdc++",
+        "libatomic",
+        "libgomp",
+        "python3",
+        "python3-pexpect",
+        "nfs-utils",
+        ]
+
+    # clear all usermode filters
+    _expected_fail_usermode = []
+
+    def glibc_run_check(self):
+        # use the base work dir, as the nfs mount, since the recipe directory may not exist
+        tmpdir = get_bb_var("BASE_WORKDIR")
+        # setup nfs
+        with unfs_server(tmpdir) as (nfsport, mountport):
+            self.logger.info("Got unfs up, ports = %d - %d", nfsport, mountport)
+            with self.prepare_qemu() as qemu:
+                # setup nfs mount
+                if qemu.run("mkdir -p \"{0}\"".format(tmpdir))[0] != 0:
+                    raise Exception("Failed to setup NFS mount directory on target")
+
+                mountcmd = "mount -o noac,nfsvers=3,port={0},udp,mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
+                status, output = qemu.run(mountcmd)
+                if status != 0:
+                    raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))
+
+                super().glibc_run_check(ssh = qemu.ip)
+
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
new file mode 100644
index 0000000000..b680b8fa4a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
@@ -0,0 +1,134 @@
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
+DEPENDS += "${@'qemu-native' if d.getVar('BUILD_TEST_TARGET') == 'user' else ''}"
+
+BUILD_TEST_TARGET ??= "user"
+BUILD_TEST_SINGLE ??= ""
+BUILD_TEST_HOST ??= "localhost"
+BUILD_TEST_HOST_USER ??= "root"
+BUILD_TEST_HOST_PORT ??= "2222"
+
+generate_test_wrapper_user[dirs] += "${WORKDIR}"
+python generate_test_wrapper_user() {
+    sysroot = d.getVar("RECIPE_SYSROOT")
+    qemu_binary = qemu_target_binary(d)
+    if not qemu_binary:
+        bb.fatal("Missing target qemu linux-user binary")
+
+    args = [qemu_binary]
+    args += (d.getVar("QEMU_OPTIONS") or "").split()
+    #args += ["-E", "LD_DEBUG=all"]
+    formattedargs = " ".join("\"{0}\"".format(i) if (" " in i) else i for i in args)
+    testwrapper = os.path.join(d.getVar("WORKDIR"), "check-test-wrapper")
+    with open(testwrapper, "w") as f:
+        f.write("#!/usr/bin/env python3\n")
+        f.write("sysroot = \"{0}\"\n".format(sysroot))
+        f.write("qemuargs = [\n")
+        for i in args:
+            if "\"" in i:
+                i = i.replace("\"", "\\\"")
+            f.write("    \"{0}\",\n".format(i))
+        f.write("    ]\n")
+
+        script = r"""
+import sys
+import os
+import subprocess
+
+args = sys.argv[1:]
+libpaths = [sysroot + "/usr/lib", sysroot + "/lib"]
+
+if args[0] == "env":
+    args.pop(0)
+    while "=" in args[0]:
+        key, val = args.pop(0).split("=", 1)
+        if key == "LD_LIBRARY_PATH":
+            libpaths += val.split(":")
+        else:
+            os.environ[key] = val
+if args[0] == "cp":
+    # ignore copies, the filesystem is the same
+    sys.exit(0)
+
+qemuargs += ["-L", sysroot]
+qemuargs += ["-E", "LD_LIBRARY_PATH={}".format(":".join(libpaths))]
+r = subprocess.run(qemuargs + args)
+sys.exit(r.returncode)
+"""
+        for i in script.splitlines():
+            f.write(i + "\n")
+
+    os.chmod(testwrapper, 0o755)
+}
+
+generate_test_wrapper_ssh[dirs] += "${WORKDIR}"
+python generate_test_wrapper_ssh() {
+    testwrapper = os.path.join(d.getVar("WORKDIR"), "check-test-wrapper")
+    with open(testwrapper, "w") as f:
+        f.write("%s\n" % "#!/usr/bin/env python3")
+        f.write("host = \"{0}\"\n".format(d.getVar("BUILD_TEST_HOST")))
+        f.write("user = \"{0}\"\n".format(d.getVar("BUILD_TEST_HOST_USER")))
+        f.write("port = \"{0}\"\n".format(d.getVar("BUILD_TEST_HOST_PORT")))
+
+        script = r"""
+import sys
+import os
+import subprocess
+
+args = ["ssh", "-p", port, "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no", "{0}@{1}".format(user, host), "sh", "-c"]
+
+command = ""
+#command += "export TIMEOUTFACTOR=10000; "
+command += " ".join(["'%s'" % i.replace("'", r"'\''") for i in ["cd", os.getcwd()]]) + "; "
+command += " ".join(["'%s'" % i.replace("'", r"'\''") for i in sys.argv[1:]])
+args.append("\"%s\"" % command)
+
+r = subprocess.run(args)
+sys.exit(r.returncode)
+"""
+        for i in script.splitlines():
+            f.write(i + "\n")
+    os.chmod(testwrapper, 0o755)
+}
+
+python () {
+    if "ssh" in d.getVar("BUILD_TEST_TARGET") or d.getVar("BUILD_TEST_SINGLE") == "1":
+        # limit ssh to single job execution
+        d.setVar("EGLIBCPARALLELISM_task-check", "PARALLELMFLAGS=\"-j1\"")
+}
+
+do_check[dirs] += "${B}"
+do_check[prefuncs] += "generate_test_wrapper_${BUILD_TEST_TARGET}"
+do_check[nostamp] = "1"
+do_check () {
+    # clean out previous test results
+    oe_runmake tests-clean
+    # makefiles don't clean entirely (and also sometimes fails due to too many args)
+    find ${B} -type f -name "*.out" -delete
+    find ${B} -type f -name "*.test-result" -delete
+    find ${B}/catgets -name "*.cat" -delete
+    find ${B}/conform -name "symlist-*" -delete
+    [ ! -e ${B}/timezone/testdata ] || rm -rf ${B}/timezone/testdata
+
+    oe_runmake -i test-wrapper='${WORKDIR}/check-test-wrapper' check
+}
+addtask do_check after do_compile
+
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 02ec891606..76eb453f0e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -36,3 +36,31 @@ do_install () {
 	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64 || :
 	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${prefix} || :
 }
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+MAKE_CHECK_TARGETS ??= "check-binutils check-gas check-gold check-ld check-libiberty"
+
+python () {
+    # crosssdk deps have different virtual targets
+    if bb.data.inherits_class('crosssdk', d):
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}gcc-crosssdk:do_populate_sysroot")
+        d.appendVarFlag("do_check", "depends", " virtual/nativesdk-${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+    else:
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}gcc:do_populate_sysroot")
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+}
+
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+do_check[dirs] = "${B}"
+do_check[nostamp] = "1"
+do_check() {
+    # need to inject CC and CXX as the target CC and CXX with sysroot
+    oe_runmake -i ${MAKE_CHECK_TARGETS} \
+        RUNTESTFLAGS=" \
+            CC='${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}' \
+            CXX='${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}' \
+            "
+}
+addtask check after do_compile
+
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
index ba5e4c2ce5..723d2b200f 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
@@ -1,6 +1,6 @@
-From d540e95d05cd7c4b8924ac7b257c14ae0105d0ab Mon Sep 17 00:00:00 2001
+From 958a49749b772660d3bafb80748829cba6bed065 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:44:14 +0000
+Date: Fri, 9 Aug 2019 01:23:17 +1000
 Subject: [PATCH 10/15] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
@@ -8,13 +8,16 @@ we change the default emulations to be N64 instead of N32
 Upstream-Status: Inappropriate [ OE configuration Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Amended to fix missing 'mips_elf32_ntrad_le_vec' from mips64 in
+config.bfd
 ---
  bfd/config.bfd   | 8 ++++----
  ld/configure.tgt | 8 ++++----
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 0e1ddb659c..cc65547588 100644
+index 0e1ddb659c..d4f50f0a8d 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
 @@ -919,12 +919,12 @@ case "${targ}" in
@@ -30,7 +33,7 @@ index 0e1ddb659c..cc65547588 100644
 -    targ_defvec=mips_elf32_ntrad_be_vec
 -    targ_selvecs="mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_be_vec mips_elf64_trad_le_vec"
 +    targ_defvec=mips_elf64_trad_be_vec
-+    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_be_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
++    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
      ;;
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
@@ -54,6 +57,3 @@ index beba17ef51..917be6f8eb 100644
  			targ_extra_libpath=$targ_extra_emuls ;;
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.1.inc b/meta/recipes-devtools/gcc/gcc-9.1.inc
index 4c648a1694..2f63a72798 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.1.inc
@@ -64,6 +64,7 @@ SRC_URI = "\
            file://0035-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0036-Fix-for-testsuite-failure.patch \
            file://0037-Re-introduce-spe-commandline-options.patch \
+           file://WIP.patch \
 "
 SRC_URI[md5sum] = "6069ae3737cf02bf2cb44a391ef0e937"
 SRC_URI[sha256sum] = "79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0"
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/WIP.patch b/meta/recipes-devtools/gcc/gcc-9.1/WIP.patch
new file mode 100644
index 0000000000..42005179a4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.1/WIP.patch
@@ -0,0 +1,95 @@
+diff --git a/gcc/testsuite/gcc.c-torture/execute/fprintf-2.c b/gcc/testsuite/gcc.c-torture/execute/fprintf-2.c
+index bba4a446ee..5caae12c49 100644
+--- a/gcc/testsuite/gcc.c-torture/execute/fprintf-2.c
++++ b/gcc/testsuite/gcc.c-torture/execute/fprintf-2.c
+@@ -9,6 +9,7 @@
+ 
+ int main (void)
+ {
++// { dg-prune-output "warning: the use of .tmpnam. is dangerous" }
+   char *tmpfname = tmpnam (0);
+   FILE *f = fopen (tmpfname, "w");
+   if (!f)
+diff --git a/gcc/testsuite/gcc.c-torture/execute/printf-2.c b/gcc/testsuite/gcc.c-torture/execute/printf-2.c
+index 2e9f2a2bb7..0aa5e6d879 100644
+--- a/gcc/testsuite/gcc.c-torture/execute/printf-2.c
++++ b/gcc/testsuite/gcc.c-torture/execute/printf-2.c
+@@ -23,6 +23,7 @@ write_file (void)
+ 
+ int main (void)
+ {
++// { dg-prune-output "warning: the use of .tmpnam. is dangerous" }
+   char *tmpfname = tmpnam (0);
+   FILE *f = freopen (tmpfname, "w", stdout);
+   if (!f)
+diff --git a/gcc/testsuite/gcc.c-torture/execute/user-printf.c b/gcc/testsuite/gcc.c-torture/execute/user-printf.c
+index 11c61fa394..9f17796de5 100644
+--- a/gcc/testsuite/gcc.c-torture/execute/user-printf.c
++++ b/gcc/testsuite/gcc.c-torture/execute/user-printf.c
+@@ -20,6 +20,7 @@ user_print (const char *fmt, ...)
+ 
+ int main (void)
+ {
++// { dg-prune-output "warning: the use of .tmpnam. is dangerous" }
+   char *tmpfname = tmpnam (0);
+   FILE *f = freopen (tmpfname, "w", stdout);
+   if (!f)
+diff --git a/gcc/testsuite/gcc.target/arm/atomic_loaddi_1.c b/gcc/testsuite/gcc.target/arm/atomic_loaddi_1.c
+index 4f39971a33..8800cd60fe 100644
+--- a/gcc/testsuite/gcc.target/arm/atomic_loaddi_1.c
++++ b/gcc/testsuite/gcc.target/arm/atomic_loaddi_1.c
+@@ -1,5 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-std=c11 -O" } */
++/* { dg-skip-if "avoid conflicting multilib options" { *-*-* } { "-march=*" } { "-march=armv7-a" } } */
+ /* { dg-require-effective-target arm_arch_v7a_ok } */
+ /* { dg-add-options arm_arch_v7a } */
+ 
+diff --git a/gcc/testsuite/gcc.target/arm/atomic_loaddi_4.c b/gcc/testsuite/gcc.target/arm/atomic_loaddi_4.c
+index 8f94ba61b4..597f101071 100644
+--- a/gcc/testsuite/gcc.target/arm/atomic_loaddi_4.c
++++ b/gcc/testsuite/gcc.target/arm/atomic_loaddi_4.c
+@@ -1,5 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-std=c11 -O" } */
++/* { dg-skip-if "avoid conflicting multilib options" { *-*-* } { "-march=*" } { "-march=armv7-a" } } */
+ /* { dg-require-effective-target arm_arch_v7a_ok } */
+ /* { dg-add-options arm_arch_v7a } */
+ 
+diff --git a/gcc/testsuite/gcc.target/arm/atomic_loaddi_7.c b/gcc/testsuite/gcc.target/arm/atomic_loaddi_7.c
+index 6743663f1e..c8ac0ba4d5 100644
+--- a/gcc/testsuite/gcc.target/arm/atomic_loaddi_7.c
++++ b/gcc/testsuite/gcc.target/arm/atomic_loaddi_7.c
+@@ -1,5 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-std=c11 -O" } */
++/* { dg-skip-if "avoid conflicting multilib options" { *-*-* } { "-march=*" } { "-march=armv7-a" } } */
+ /* { dg-require-effective-target arm_arch_v7a_ok } */
+ /* { dg-add-options arm_arch_v7a } */
+ 
+diff --git a/gcc/testsuite/gcc.target/arm/polytypes.c b/gcc/testsuite/gcc.target/arm/polytypes.c
+index 110d62a879..3d49b508a8 100644
+--- a/gcc/testsuite/gcc.target/arm/polytypes.c
++++ b/gcc/testsuite/gcc.target/arm/polytypes.c
+@@ -28,7 +28,7 @@ void foo ()
+   poly8x16_t v128_8;
+   poly16x8_t v128_16;
+ 
+-  s64_8 (v64_8); /* { dg-message "use -flax-vector-conversions" } */
++  s64_8 (v64_8); /* { dg-message "use '?-flax-vector-conversions" } */
+   /* { dg-error "incompatible type for argument 1 of 's64_8'" "" { target *-*-* } .-1 } */
+   u64_8 (v64_8); /* { dg-error "incompatible type for argument 1 of 'u64_8'" } */
+   p64_8 (v64_8);
+diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
+index 4bb7da283f..58f5e9f313 100644
+--- a/gcc/testsuite/lib/target-supports.exp
++++ b/gcc/testsuite/lib/target-supports.exp
+@@ -3863,7 +3863,7 @@ proc add_options_for_arm_neon_softfp_fp16 { flags } {
+ proc check_effective_target_arm_fp16_alternative_ok_nocache { } {
+     global et_arm_neon_fp16_flags
+     set et_arm_neon_fp16_flags ""
+-    if { [check_effective_target_arm32] } {
++    if { [check_effective_target_arm32] && [check_effective_target_arm_fp16_ok] } {
+ 	foreach flags {"" "-mfloat-abi=softfp" "-mfpu=neon-fp16"
+ 		       "-mfpu=neon-fp16 -mfloat-abi=softfp"} {
+ 	    if { [check_no_compiler_messages_nocache \
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 96334e54b4..a8f4b60c32 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -17,7 +17,7 @@ python extract_stashed_builddir () {
     src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}")
     dest = d.getVar("B")
     oe.path.copyhardlinktree(src, dest)
-    staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
+    staging_processfixme([src + "/fixmepath"], dest, d.getVar("RECIPE_SYSROOT"), d.getVar("RECIPE_SYSROOT_NATIVE"), d)
 }
 
 def get_gcc_float_setting(bb, d):
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 6222c2e8c9..f9534340d2 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -221,3 +221,44 @@ python do_gcc_stash_builddir_setscene () {
     sstate_setscene(d)
 }
 addtask do_gcc_stash_builddir_setscene
+
+require gcc-testsuite.inc
+
+check_prepare_sysroot () {
+    if [ ! -s ${RECIPE_SYSROOT}${target_includedir}/limits.h ]; then
+        # this file was created by the configure task, but is replaced by the
+        # libc version when populating the sysroot for the do_check task
+        rm ${RECIPE_SYSROOT}${target_includedir}/limits.h
+    fi
+}
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+MAKE_CHECK_TARGETS ??= "check-gcc check-g++ check-lto"
+
+python () {
+    # crosssdk deps have different virtual targets
+    if bb.data.inherits_class('crosssdk', d):
+        d.appendVarFlag("do_check", "depends", " virtual/nativesdk-${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+    else:
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+}
+
+# specific host and target dependencies required for test suite running
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+# only depend on qemu if targeting linux user execution
+do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in d.getVar('BUILD_TEST_TARGET') else ''}"
+# check_prepare_sysroot is before extend in order to perform the limits.h removal
+do_check[prefuncs] += "check_prepare_sysroot"
+do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check[nostamp] = "1"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+
+    oe_runmake -i -C ${B}/gcc ${MAKE_CHECK_TARGETS} RUNTESTFLAGS="${MAKE_CHECK_BOARDARGS}"
+}
+addtask check after do_compile do_populate_sysroot
+
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index a5c2600d7f..4092b058ab 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -265,3 +265,40 @@ FILES_libitm-dev = "\
 SUMMARY_libitm-dev = "GNU transactional memory support library - development files"
 FILES_libitm-staticdev = "${libdir}/libitm.a"
 SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
+
+require gcc-testsuite.inc
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+MAKE_CHECK_TARGETS ??= "${@" ".join("check-target-" + i for i in d.getVar("RUNTIMETARGET").split())}"
+MAKE_CHECK_IGNORE ??= "prettyprinters.exp xmethods.exp"
+MAKE_CHECK_RUNTESTFLAGS ??= "${MAKE_CHECK_BOARDARGS} --ignore '${MAKE_CHECK_IGNORE}'"
+
+# specific host and target dependencies required for test suite running
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+# only depend on qemu if targeting linux user execution
+do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in d.getVar('BUILD_TEST_TARGET') else ''}"
+# extend the recipe sysroot to include the built libraries (for qemu usermode)
+do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check[nostamp] = "1"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+
+    # HACK: this works around the configure setting CXX with -nostd* args
+    sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
+
+    if [ "${BUILD_TEST_TARGET}" = "user" ]; then
+        # qemu user has issues allocating large amounts of memory
+        export G_SLICE=always-malloc
+        # no test should need more that 10G of memory, this prevents tests like pthread7-rope from leaking memory
+        ulimit -m 4194304
+        ulimit -v 10485760
+    fi
+
+    oe_runmake -i ${MAKE_CHECK_TARGETS} RUNTESTFLAGS="${MAKE_CHECK_RUNTESTFLAGS}"
+}
+addtask check after do_compile do_populate_sysroot
+
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
new file mode 100644
index 0000000000..9c27bdeaae
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -0,0 +1,106 @@
+inherit qemu
+
+BUILD_TEST_TARGET ??= "user"
+BUILD_TEST_HOST ??= "localhost"
+BUILD_TEST_HOST_USER ??= "root"
+BUILD_TEST_HOST_PORT ??= "2222"
+
+MAKE_CHECK_BOARDARGS ??= "--target_board=${BUILD_TEST_TARGET}"
+
+python () {
+    # Provide the targets compiler args via targets options. This allows dejagnu to
+    # correctly mark incompatible tests as UNSUPPORTED (e.g. needs soft-float
+    # but running on hard-float target).
+    #
+    # These options are called "multilib_flags" within the gcc test suite. Most
+    # architectures handle these options in a sensible way such that tests that
+    # are incompatible with the provided multilib are marked as UNSUPPORTED.
+    #
+    # Note: multilib flags are added to the compile command after the args
+    # provided by any test (through dg-options), CFLAGS_FOR_TARGET is always
+    # added to the compile command before any other args but is not interpted
+    # as options like multilib flags.
+    #
+    # i686/x86-64 is special, since most toolchains built for this target don't
+    # do multilib the tests do not get correctly marked as UNSUPPORTED. More
+    # importantly the test suite itself does not handle overriding the multilib
+    # flags where it could (like other archs do). As such do not pass the
+    # target compiler args for x86 targets.
+    args = d.getVar("TUNE_CCARGS").split()
+    if d.getVar("TUNE_ARCH") in ["i686", "x86_64", "aarch64"]:
+        args = []
+    runtestargs = ("/" + "/".join(args)) if len(args) != 0 else ""
+    d.setVar("MAKE_CHECK_BOARDARGS", "--target_board=${BUILD_TEST_TARGET}" + runtestargs)
+}
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
+        if not qemu_binary:
+            bb.fatal("Missing target qemu linux-user binary")
+
+        args = []
+        # QEMU_OPTIONS is not always valid due to -cross recipe
+        args += ["-r", d.getVar("OLDEST_KERNEL")]
+        # enable all valid instructions, since the test suite itself does not
+        # limit itself to the target cpu options.
+        #   - valid for x86*, powerpc, arm, arm64
+        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "ppc", "arm", "aarch64"]:
+            args += ["-cpu", "max"]
+
+        sysroot = d.getVar("RECIPE_SYSROOT")
+        args += ["-L", sysroot]
+        # lib paths are static here instead of using $libdir since this is used by a -cross recipe
+        libpaths = [sysroot + "/usr/lib", sysroot + "/lib"]
+        args += ["-E", "LD_LIBRARY_PATH={0}".format(":".join(libpaths))]
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
+        content.append("set_board_info hostname {0}".format(d.getVar("BUILD_TEST_HOST")))
+        content.append("set_board_info username {0}".format(d.getVar("BUILD_TEST_HOST_USER")))
+
+        port = d.getVar("BUILD_TEST_HOST_PORT")
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
+    with open(os.path.join(dejagnudir, "user.exp"), "w") as f:
+        f.write(generate_qemu_linux_user_config(d))
+
+    # write out target ssh board config
+    with open(os.path.join(dejagnudir, "ssh.exp"), "w") as f:
+        f.write(generate_remote_ssh_linux_config(d))
+
+    # generate site.exp to provide boards
+    with open(os.path.join(dejagnudir, "site.exp"), "w") as f:
+        f.write("lappend boards_dir {0}\n".format(dejagnudir))
+        f.write("set CFLAGS_FOR_TARGET \"{0}\"\n".format(d.getVar("TOOLCHAIN_OPTIONS")))
+}
+
---
2.20.1

