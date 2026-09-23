Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75175C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:52:17 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5433.1790196731681709503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 13:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Ca2L6yCt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202609232052097f3455293600020782-2uz7fb@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202609232052097f3455293600020782
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Sep 2026 22:52:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BQWxSEVNUwmQ+aHd7b2NE+hv4NHumizUfZgtpbdBpiQ=;
 b=Ca2L6yCtgWGGXwV6ouzoIP1MmWA7bEExPo/xFsTFDHsiVhiaDi0opcPvbC2pd9G715nNOz
 Oes1Zy97SYUK1nI4oeQxDIFWGWhm4Akk93Ha1lZrl/jFHjsBRO2Vp79Pw9KSA6/MsHj3412x
 sMJwPM0bVMXxF5567T0wOn/HdAfXBAjcveKkWudUsfegG3aIxYnvyQnVwyEUL/hg7FVQxmi2
 HfseP3OGqcfxG8CmhAGUHSQj6u2rvSeu1ERsCM8gA9O9fW6qzK8Dzb1SzFwN1CAHsfrFGe3E
 DitB//daLE8JiRTxKMR1lRKiheBFEQHm5t6Yrp08XEiB8DcQ368IL7TQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/3] oe/package.py: copydebugsources: add all kernel source files
Date: Wed, 23 Sep 2026 22:51:55 +0200
Message-ID: <20260923205206.1102615-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
References: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 20:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246557

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add all kernel source files to the linux-yocto-src package, not only
the sources from STAGING_KERNEL_DIR.

KERNEL_CC (kernel-arch.bbclass) remaps STAGING_KERNEL_DIR and
STAGING_KERNEL_BUILDDIR to KERNEL_SRC_PATH, overriding CFLAGS own
-ffile-prefix-map for the kernel. copydebugsources() only looks at
CFLAGS to build its prefixmap, so kernel source files recorded under
KERNEL_SRC_PATH were silently dropped. Add prefixmap entries for both
kernel dirs, still destined for TARGET_DBGSRC_DIR.

Also fix oeqa FakeDataStore, which did not support the getVar(name,
expand) signature used by bb.data.inherits_class(), and add a test
covering the kernel-arch recovery path.

Verified by building linux-yocto for qemux86-64: without this fix,
linux-yocto-src only contains 545 files (510 auto-generated *.mod.c
module stubs plus 35 misc .c/.h files compiled outside KERNEL_CC's
remap); with the fix, all 8356 real kernel .c/.h sources recorded
under KERNEL_SRC_PATH are recovered too, for 8901 files total,
including files that only exist under STAGING_KERNEL_BUILDDIR (e.g.
arch/x86/include/generated/asm/syscalls_32.h).

Having all kernel files available is useful for example when debugging
a user space application with the Lauterbach debugger which supports
seamless stepping between user space and kernel space.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oe/package.py                        | 25 ++++++-
 meta/lib/oeqa/selftest/cases/oelib/package.py | 74 ++++++++++++++++++-
 2 files changed, 93 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b7030643d2..477fa5d5a7 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -979,6 +979,10 @@ def copydebugsources(debugsrcdir, sources, d):
         sdir = d.getVar("S")
         cflags = d.expand("${CFLAGS}")
 
+        # prefixmap maps a host directory to a (match, dest) pair: "match" is
+        # the DWARF-recorded path prefix to select from debugsources.list,
+        # "dest" is the subdirectory under PKGD to copy matches to. For plain
+        # ${CFLAGS}-derived entries these are the same string.
         prefixmap = {}
         for flag in cflags.split():
             if not flag.startswith("-ffile-prefix-map"):
@@ -986,7 +990,20 @@ def copydebugsources(debugsrcdir, sources, d):
             if "recipe-sysroot" in flag:
                 continue
             flag = flag.split("=")
-            prefixmap[flag[1]] = flag[2]
+            prefixmap[flag[1]] = (flag[2], flag[2])
+
+        # kernel-arch.bbclass's KERNEL_CC remaps STAGING_KERNEL_DIR and
+        # STAGING_KERNEL_BUILDDIR to KERNEL_SRC_PATH ("/usr/src/kernel"),
+        # overriding CFLAGS' own mapping for the kernel, so its source files
+        # need a dedicated prefixmap entry to be found, still destined for
+        # TARGET_DBGSRC_DIR like everything else.
+        if bb.data.inherits_class('kernel-arch', d):
+            kernel_src_path = d.getVar('KERNEL_SRC_PATH')
+            target_dbgsrc_dir = d.getVar('TARGET_DBGSRC_DIR')
+            for kernel_dir_var in ('STAGING_KERNEL_DIR', 'STAGING_KERNEL_BUILDDIR'):
+                kernel_dir = d.getVar(kernel_dir_var)
+                if kernel_dir and kernel_src_path and target_dbgsrc_dir:
+                    prefixmap[kernel_dir] = (kernel_src_path, target_dbgsrc_dir)
 
         nosuchdir = []
         basepath = dvar
@@ -1008,9 +1025,9 @@ def copydebugsources(debugsrcdir, sources, d):
                        and not path.endswith((b"<internal>", b"<built-in>"))
                        and b"recipe-sysroot" not in os.path.dirname(path)}
 
-        for pmap, prefix in prefixmap.items():
-            dstroot = dvar + prefix
-            prefix_slash = os.fsencode(prefix) + b"/"
+        for pmap, (match, dest) in prefixmap.items():
+            dstroot = dvar + dest
+            prefix_slash = os.fsencode(match) + b"/"
             relpaths = [path.removeprefix(prefix_slash) for path in sourcepaths
                         if path.startswith(prefix_slash)]
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/selftest/cases/oelib/package.py
index 16e13aece9..e78320e6d0 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/package.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -17,12 +17,13 @@ class FakeDataStore:
     def __init__(self, values):
         self.values = values
 
-    def getVar(self, name):
+    def getVar(self, name, expand=True):
         return self.values.get(name)
 
     def expand(self, value):
         for name, replacement in self.values.items():
-            value = value.replace("${%s}" % name, replacement)
+            if isinstance(replacement, str):
+                value = value.replace("${%s}" % name, replacement)
         return value
 
 
@@ -270,3 +271,72 @@ class TestCopyDebugSources(TestCase):
             with open(copied_source) as f:
                 self.assertEqual(f.read(), "real\n")
             self.assertFalse(os.path.exists(relocation))
+
+    def test_copydebugsources_recovers_kernel_source_files(self):
+        """Recovers kernel-arch source files recorded outside debugsrcdir.
+
+        kernel-arch recipes remap STAGING_KERNEL_DIR/BUILDDIR to
+        KERNEL_SRC_PATH (typically "/usr/src/kernel") via KERNEL_CC, bypassing
+        CFLAGS entirely, so debugsources.list records kernel files under
+        KERNEL_SRC_PATH rather than under debugsrcdir (typically
+        "/usr/src/debug/...") like every other CFLAGS-derived entry.
+
+        Simulates a kernel-arch recipe with one file coming from each of the
+        two remapped directories (a source file under STAGING_KERNEL_DIR and a
+        generated header under STAGING_KERNEL_BUILDDIR) and asserts
+        copydebugsources() recovers both into the normal debugsrcdir, proving
+        the dedicated kernel-arch prefixmap entries are used instead of (or in
+        addition to) the plain CFLAGS-derived ones.
+        """
+        with tempfile.TemporaryDirectory(prefix="oe-test-package-") as tmpdir:
+            kernel_src_dir = os.path.join(tmpdir, "kernel-source")
+            kernel_build_dir = os.path.join(tmpdir, "kernel-build-artifacts")
+            workdir = os.path.join(tmpdir, "work")
+            pkgd = os.path.join(tmpdir, "pkgd")
+            debugsrcdir = "/usr/src/debug/kernel/1.0"
+            kernel_src_path = "/usr/src/kernel"
+
+            src_rel = os.path.join("arch", "main.c")
+            build_rel = os.path.join("include", "generated", "autoconf.h")
+
+            os.makedirs(os.path.dirname(os.path.join(kernel_src_dir, src_rel)))
+            os.makedirs(os.path.dirname(os.path.join(kernel_build_dir, build_rel)))
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            src_file = os.path.join(kernel_src_dir, src_rel)
+            build_file = os.path.join(kernel_build_dir, build_rel)
+            with open(src_file, "w") as f:
+                f.write("main\n")
+            with open(build_file, "w") as f:
+                f.write("autoconf\n")
+
+            sources = [
+                os.path.join(kernel_src_path, src_rel),
+                os.path.join(kernel_src_path, build_rel),
+            ]
+            d = FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": kernel_src_dir,
+                # KERNEL_CC's own -ffile-prefix-map overrides this for the
+                # kernel, so CFLAGS carries no entry for kernel_src_path.
+                "CFLAGS": "",
+                "__inherit_cache": ["/layer/classes-recipe/kernel-arch.bbclass"],
+                "STAGING_KERNEL_DIR": kernel_src_dir,
+                "STAGING_KERNEL_BUILDDIR": kernel_build_dir,
+                "KERNEL_SRC_PATH": kernel_src_path,
+                "TARGET_DBGSRC_DIR": debugsrcdir,
+            })
+
+            copydebugsources(debugsrcdir, sources, d)
+
+            copied_src = oe.path.join(pkgd, debugsrcdir, src_rel)
+            copied_build = oe.path.join(pkgd, debugsrcdir, build_rel)
+
+            with open(copied_src) as f:
+                self.assertEqual(f.read(), "main\n")
+            with open(copied_build) as f:
+                self.assertEqual(f.read(), "autoconf\n")
-- 
2.55.0


