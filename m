Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010D3C88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:43:46 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24924.1789483420953708150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=NU03kO5+;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1x6UNn-0003Pv-NB; Tue, 15 Sep 2026 10:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:References:In-Reply-To:Date:Subject:To:
	From; bh=aitt6olvumyxIu/S8S+bcKgxJ2618STwyyaJpm/ebIY=; b=NU03kO5+SE+RamIr+di4
	cTjgRYIBTwPBgmUsJV0I5C4TS/eXtLowJYJzoecT7F51+8oZ4F4OKOBXl76ii40qbJ8SvhJP+FczL
	akJA7Td90HBBDTLd6I7gTdCmapYa+dvKIr5R9VSnL5oDlJ3GCUxVxeLmIdrYfF+Jn/sixVbaO+B/z
	TIL7MixhbMSU5RubYUu5l0fEQVmsBvm0eLKDBr7dmWszmcLHsflJpqYEKO5gIc9ADoQnw8dDYblEY
	VyAR9uUb83hjwDmNY+NA8hY+8OPcPHeX96rRXCiuW3VzwXT3NLOwOinDGR5QjK1bBvPRdvahlitk8
	DW41AZ0EOa07OA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 1/1] lib/oe/package: Add strip keep-section support
Date: Tue, 15 Sep 2026 16:43:22 +0200
Message-ID: <20260915144322.7480-2-othacehe@gnu.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915144322.7480-1-othacehe@gnu.org>
References: <20260915144322.7480-1-othacehe@gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245852

On 32-bit Arm, the .ARM.extab and .ARM.exidx unwinding sections do not
always provide enough information to get a full backtrace on C++
exceptions:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117941

In addition to those unwinding sections, GCC also emits unwinding
instructions in DWARF format under the .debug_frame section. By
instructing 'strip' not to remove that section, libunwind can use it
to produce a full backtrace, for example when an unhandled C++
exception is thrown.

Add a PACKAGE_KEEP_SECTIONS variable, listing space separated ELF
section names that should be kept around instead of stripped, for
example:

  PACKAGE_KEEP_SECTIONS:pn-myrecipe = ".debug_frame"

This variable is never applied to kernel modules, which are covered
by CONFIG_UNWINDER_* instead.

Add a oe-selftest case building core-image-minimal for qemuarm, and
checking with readelf that busybox loses its .debug_frame section by
default, but keeps it once PACKAGE_KEEP_SECTIONS is set.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 meta/classes-global/staging.bbclass     |  4 +-
 meta/lib/oe/package.py                  | 19 +++++++--
 meta/lib/oeqa/selftest/cases/package.py | 53 ++++++++++++++++++++++++-
 3 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 5833abebc8..9ea4c644db 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -91,10 +91,12 @@ python sysroot_strip () {
     base_libdir = d.getVar("base_libdir")
     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP:' + pn) or "").split()
     strip_cmd = d.getVar("STRIP")
+    keep_sections = d.getVar('PACKAGE_KEEP_SECTIONS') or ""
 
     max_process = oe.utils.get_bb_number_threads(d)
     oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process,
-                           qa_already_stripped=qa_already_stripped)
+                           qa_already_stripped=qa_already_stripped,
+                           keep_sections=keep_sections)
 }
 
 do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b7030643d2..620f9fefc8 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -19,7 +19,7 @@ import shutil
 import bb.parse
 import oe.cachedpath
 
-def runstrip(file, elftype, strip, extra_strip_sections=''):
+def runstrip(file, elftype, strip, extra_strip_sections='', keep_sections=''):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
     #
@@ -49,6 +49,10 @@ def runstrip(file, elftype, strip, extra_strip_sections=''):
             for section in extra_strip_sections.split():
                 stripcmd.extend(["--remove-section=" + section])
 
+    if keep_sections != '' and not elftype & 16:
+        for section in keep_sections.split():
+            stripcmd.extend(["--keep-section=" + section])
+
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
@@ -96,7 +100,8 @@ def is_static_lib(path):
             return start == magic
     return False
 
-def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_already_stripped=False):
+def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process,
+                qa_already_stripped=False, keep_sections=''):
     """
     Strip executable code (like executables, shared libraries) _in_place_
     - Based on sysroot_strip in staging.bbclass
@@ -107,6 +112,9 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_alre
     :param max_process: number of stripping processes started in parallel
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
     This is for proper logging and messages only.
+    :param keep_sections: Space separated list of ELF sections to keep even
+    though the file is being stripped, for example ".debug_frame" so that
+    libunwind can use it to generate backtraces.
     """
     import stat, errno, oe.path, oe.utils
 
@@ -175,7 +183,8 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_alre
         elf_file = int(elffiles[file])
         sfiles.append((file, elf_file, strip_cmd))
 
-    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process)
+    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process,
+                                    extraargs=('', keep_sections))
 
 TRANSLATE = (
     ("@", "@at@"),
@@ -1359,7 +1368,9 @@ def process_split_and_strip_files(d):
             for f in staticlibs:
                 sfiles.append((f, 16, strip))
 
-        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
+        keep_sections = d.getVar('PACKAGE_KEEP_SECTIONS') or ""
+        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d,
+                                     extraargs=('', keep_sections))
 
     # Build "minidebuginfo" and reinject it back into the stripped binaries
     if bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', True, False, d):
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 38ed7173fe..11b8b66645 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -5,10 +5,12 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqemu
+from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqemu, runCmd
 import subprocess, os
 import oe.path
 import re
+import tempfile
+import tarfile
 
 class VersionOrdering(OESelftestTestCase):
     # version1, version2, sort order
@@ -208,3 +210,52 @@ class PackageTests(OESelftestTestCase):
                           sysconfdir + "/selftest-chown/symlink",
                           sysconfdir + "/selftest-chown/fifotest/fifo"]:
                 check_ownership(qemu, "test", "test", path)
+
+class PackageKeepSections(OESelftestTestCase):
+    def test_package_keep_sections(self):
+        """
+        Verify that PACKAGE_KEEP_SECTIONS prevents 'strip' from removing the
+        listed ELF sections, and that they are removed as usual when the
+        variable isn't set.
+        """
+        # GCC only emits .debug_frame on targets that don't already rely on
+        # .eh_frame for unwinding, which in practice means 32-bit Arm: use
+        # qemuarm so the section actually exists before strip runs. Do this
+        # before querying any other variable below, as they all depend on
+        # MACHINE.
+        self.write_config("""
+MACHINE = "qemuarm"
+IMAGE_FSTYPES = "tar.bz2"
+""")
+
+        target_sys = get_bb_var("TARGET_SYS")
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME', 'READELF', 'base_bindir'], 'core-image-minimal')
+        binutils = "binutils-cross-{}".format(get_bb_var("TARGET_ARCH"))
+        bitbake("{}:do_addto_recipe_sysroot".format(binutils))
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", binutils)
+        busybox_path = os.path.join(bb_vars['base_bindir'].lstrip("/"), "busybox.nosuid")
+
+        def has_section(section):
+            with tempfile.TemporaryDirectory(prefix = "unpackfs-") as unpackedfs:
+                filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "{}.tar.bz2".format(bb_vars['IMAGE_LINK_NAME']))
+                with tarfile.open(filename) as tar:
+                    tar.extract("./" + busybox_path, path=unpackedfs)
+
+                r = runCmd([bb_vars['READELF'], "-W", "-S", os.path.join(unpackedfs, busybox_path)],
+                        native_sysroot = native_sysroot, target_sys = target_sys)
+                return section in r.output
+
+        bitbake("core-image-minimal")
+        self.assertFalse(has_section(".debug_frame"),
+                          "busybox should not carry a .debug_frame section by default")
+
+        self.write_config("""
+MACHINE = "qemuarm"
+IMAGE_FSTYPES = "tar.bz2"
+PACKAGE_KEEP_SECTIONS:pn-busybox = ".debug_frame"
+""")
+        bitbake("busybox -c package -f")
+        bitbake("core-image-minimal")
+        self.assertTrue(has_section(".debug_frame"),
+                         "busybox should carry a .debug_frame section when "
+                         "PACKAGE_KEEP_SECTIONS is set")
-- 
2.34.1


