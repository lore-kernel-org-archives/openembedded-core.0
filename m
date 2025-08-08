Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F61AC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 10:25:28 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.19029.1754648727145680880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 03:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZkQ362S5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250808102524854cc026261e047644-a3biog@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250808102524854cc026261e047644
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 Aug 2025 12:25:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zhrhP1bvoSsxzrJ9GFYwLyIvxXtAnC/VmWjBFWY7KvA=;
 b=ZkQ362S5PjH5w3SXhOEj1CPeVTtOF/GSHo7k+rvFT5qoGHjVPG8YLqUBhaV0L5YgU1ozt3
 f3UQWLZ2KMO3NPku3CgHA04PsjXi2S851mVauKhwHbiTZxMf32BNfDBm+1fWB7F1TQntmIoq
 Yz5ePBzWEIG7G7+EMc3RJCLs6vorqCjiOQLXWBs8fFoxr/tgMjl+OpbY67+OR74VrrUYZy4b
 LInUFgSJJTAdvoW+245TIs69JPhsTYHOZM2FdiIDYHVBdNdmCtbluZLxzDPmHBm8c9aIP7T/
 w57sjkE5f2if7aNLJqEGHzfbmf+X6AbOMFnyOvm/gYvYFSig7FpwJ2pA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 3/3] oeqa: fix parallel make settings
Date: Fri,  8 Aug 2025 12:24:13 +0200
Message-Id: <20250808102413.10446-3-peter.marko@siemens.com>
In-Reply-To: <20250808102413.10446-1-peter.marko@siemens.com>
References: <20250808055059.8851-1-peter.marko@siemens.com>
 <20250808102413.10446-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 10:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221649

From: Peter Marko <peter.marko@siemens.com>

These testcases are running with make or cmake "-j" without number,
which means that the build will spawn unlimited number of compiler
processes which may lead to oomkills and general build machine cpu
overload.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/cases/stap.py  | 6 +++++-
 meta/lib/oeqa/sdk/cases/autotools.py | 6 +++++-
 meta/lib/oeqa/sdk/cases/cmake.py     | 6 +++++-
 meta/lib/oeqa/sdk/cases/kmod.py      | 6 +++++-
 meta/lib/oeqa/sdk/cases/makefile.py  | 6 +++++-
 5 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 6b55e7de50..d83cb0b2b8 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -16,8 +16,12 @@ class StapTest(OERuntimeTestCase):
     @OEHasPackage(['gcc-symlinks'])
     @OEHasPackage(['kernel-devsrc'])
     def test_stap(self):
+        from oe.utils import parallel_make_value
+        pmv = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
+        parallel_make = "-j %d" % (pmv) if pmv else ""
+
         try:
-            cmd = 'make -j -C /usr/src/kernel scripts prepare'
+            cmd = 'make %s -C /usr/src/kernel scripts prepare' % (parallel_make)
             status, output = self.target.run(cmd, 900)
             self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
 
diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cases/autotools.py
index f641d66015..3f51854e3d 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -23,6 +23,9 @@ class AutotoolsTest(OESDKTestCase):
             raise unittest.SkipTest("AutotoolsTest class: SDK doesn't contain a supported C library")
 
     def test_cpio(self):
+        from oe.utils import parallel_make_value
+        pmv = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
+
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
 
@@ -30,6 +33,7 @@ class AutotoolsTest(OESDKTestCase):
             opts["source"] = os.path.join(testdir, "cpio-2.15")
             opts["build"] = os.path.join(testdir, "build")
             opts["install"] = os.path.join(testdir, "install")
+            opts["parallel_make"] = "-j %d" % (pmv) if pmv else ""
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(opts["source"]))
@@ -42,7 +46,7 @@ class AutotoolsTest(OESDKTestCase):
                 host_sys = self.td["HOST_SYS"]
                 self.assertIn(f"host_alias='{host_sys}'\n", f.readlines())
 
-            self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' -j".format(**opts))
+            self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' {parallel_make}".format(**opts))
             self._run("cd {build} && make install DESTDIR={install}".format(**opts))
 
             self.check_elf(os.path.join(opts["install"], "usr", "local", "bin", "cpio"))
diff --git a/meta/lib/oeqa/sdk/cases/cmake.py b/meta/lib/oeqa/sdk/cases/cmake.py
index 32b951c0f8..81fd327ca3 100644
--- a/meta/lib/oeqa/sdk/cases/cmake.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -26,6 +26,9 @@ class CMakeTest(OESDKTestCase):
         self.ensure_host_package("cmake")
 
     def test_assimp(self):
+        from oe.utils import parallel_make_value
+        pmv = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
+
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.4.1.tar.gz")
 
@@ -33,6 +36,7 @@ class CMakeTest(OESDKTestCase):
             opts["source"] = os.path.join(testdir, "assimp-5.4.1")
             opts["build"] = os.path.join(testdir, "build")
             opts["install"] = os.path.join(testdir, "install")
+            opts["parallel_make"] = "-j %d" % (pmv) if pmv else ""
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(opts["source"]))
@@ -42,6 +46,6 @@ class CMakeTest(OESDKTestCase):
             os.makedirs(opts["build"])
 
             self._run("cd {build} && cmake -DASSIMP_WARNINGS_AS_ERRORS=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DASSIMP_BUILD_ZLIB=ON {source}".format(**opts))
-            self._run("cmake --build {build} -- -j".format(**opts))
+            self._run("cmake --build {build} -- {parallel_make}".format(**opts))
             self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**opts))
             self.check_elf(os.path.join(opts["install"], "usr", "local", "lib", "libassimp.so.5.4.1"))
diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
index 0aa6f702e4..0c4d8ddb54 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -21,9 +21,13 @@ class KernelModuleTest(OESDKTestCase):
         if isinstance(self.tc, OESDKExtTestContext):
             self.skipTest(f"{self.id()} does not support eSDK (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15850)")
 
+        from oe.utils import parallel_make_value
+        pmv = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
+        parallel_make = "-j %d" % (pmv) if pmv else ""
+
         self.ensure_target_package("kernel-devsrc")
         # These targets need to be built before kernel modules can be built.
-        self._run("make -j -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts")
+        self._run("make %s -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts" % (parallel_make))
 
         with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
             git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
diff --git a/meta/lib/oeqa/sdk/cases/makefile.py b/meta/lib/oeqa/sdk/cases/makefile.py
index 0dcf94c6d7..fc041ca8d8 100644
--- a/meta/lib/oeqa/sdk/cases/makefile.py
+++ b/meta/lib/oeqa/sdk/cases/makefile.py
@@ -20,6 +20,9 @@ class MakefileTest(OESDKTestCase):
             raise unittest.SkipTest("MakefileTest class: SDK doesn't contain a supported C library")
 
     def test_lzip(self):
+        from oe.utils import parallel_make_value
+        pmv = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
+
         with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
 
@@ -27,6 +30,7 @@ class MakefileTest(OESDKTestCase):
             opts["source"] = os.path.join(testdir, "lzip-1.19")
             opts["build"] = os.path.join(testdir, "build")
             opts["install"] = os.path.join(testdir, "install")
+            opts["parallel_make"] = "-j %d" % (pmv) if pmv else ""
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(opts["source"]))
@@ -40,6 +44,6 @@ class MakefileTest(OESDKTestCase):
                      LDFLAGS="$LDFLAGS" \
                   """
             self._run(cmd.format(**opts))
-            self._run("cd {build} && make -j".format(**opts))
+            self._run("cd {build} && make {parallel_make}".format(**opts))
             self._run("cd {build} && make install DESTDIR={install}".format(**opts))
             self.check_elf(os.path.join(opts["install"], "usr", "local", "bin", "lzip"))

