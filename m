Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE5CC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 05:52:26 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.15092.1754632336056881864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 22:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=abDPB2fT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250808055213af8171fc18f5b57359-gtnezx@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250808055213af8171fc18f5b57359
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 Aug 2025 07:52:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MN34qtDzCOopankh1T5UGSQGbr5t6x2H4YOrX4gejyE=;
 b=abDPB2fThVBQtTYiKBd+qEEDCZaJesi2WsdFu3KBsJWKrDiv7SFggV9wn4qgWOBYxwM0uU
 DEnodnliBx0H/LEq9taQDNbFiD4RZe4u5BTrSOn/QkZzfoDCDP/GdB7/CJq95OuAW1+buf1u
 PylCzLc5y62EzfBYvJk+0S7Fy6HfcviuTY0Rdzd08ST0Ypcneu+buu8xNJQdGPDLPxjt/ckr
 ECGBEp4vyYEGaV13AJO2wMHrRpqBA/hXybicpPqKnDC63IzoMuj46pyKUMmm1AAx6RcCPeHP
 8t0phLPHjJDqaNT8+/M/z8Tx0CiJ6nRYbvyb5AmWJVdZ81keM18N4QNA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/3] oeqa: fix parallel make setting for sdk cmake case
Date: Fri,  8 Aug 2025 07:50:59 +0200
Message-Id: <20250808055059.8851-3-peter.marko@siemens.com>
In-Reply-To: <20250808055059.8851-1-peter.marko@siemens.com>
References: <20250808055059.8851-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 05:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221593

From: Peter Marko <peter.marko@siemens.com>

These testcases are running with make or cmake "-j" without number,
which means that the build will spawn unlimited number of compiler
processes which may lead to oomkills and general build machine cpu
overload.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/cases/stap.py  | 6 +++++-
 meta/lib/oeqa/sdk/cases/autotools.py | 5 ++++-
 meta/lib/oeqa/sdk/cases/cmake.py     | 5 ++++-
 meta/lib/oeqa/sdk/cases/kmod.py      | 5 ++++-
 meta/lib/oeqa/sdk/cases/makefile.py  | 5 ++++-
 5 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 6b55e7de50..d6f225580c 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -16,8 +16,12 @@ class StapTest(OERuntimeTestCase):
     @OEHasPackage(['gcc-symlinks'])
     @OEHasPackage(['kernel-devsrc'])
     def test_stap(self):
+        from oe.utils import parallel_make_value
+
+        parallel_make = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
+
         try:
-            cmd = 'make -j -C /usr/src/kernel scripts prepare'
+            cmd = 'make %s -C /usr/src/kernel scripts prepare' % (parallel_make)
             status, output = self.target.run(cmd, 900)
             self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
 
diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cases/autotools.py
index f641d66015..042efc9f25 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -23,6 +23,8 @@ class AutotoolsTest(OESDKTestCase):
             raise unittest.SkipTest("AutotoolsTest class: SDK doesn't contain a supported C library")
 
     def test_cpio(self):
+        from oe.utils import parallel_make_value
+
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
 
@@ -30,6 +32,7 @@ class AutotoolsTest(OESDKTestCase):
             opts["source"] = os.path.join(testdir, "cpio-2.15")
             opts["build"] = os.path.join(testdir, "build")
             opts["install"] = os.path.join(testdir, "install")
+            opts["parallel_make"] = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(opts["source"]))
@@ -42,7 +45,7 @@ class AutotoolsTest(OESDKTestCase):
                 host_sys = self.td["HOST_SYS"]
                 self.assertIn(f"host_alias='{host_sys}'\n", f.readlines())
 
-            self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' -j".format(**opts))
+            self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' {parallel_make}".format(**opts))
             self._run("cd {build} && make install DESTDIR={install}".format(**opts))
 
             self.check_elf(os.path.join(opts["install"], "usr", "local", "bin", "cpio"))
diff --git a/meta/lib/oeqa/sdk/cases/cmake.py b/meta/lib/oeqa/sdk/cases/cmake.py
index 32b951c0f8..8eea55342f 100644
--- a/meta/lib/oeqa/sdk/cases/cmake.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -26,6 +26,8 @@ class CMakeTest(OESDKTestCase):
         self.ensure_host_package("cmake")
 
     def test_assimp(self):
+        from oe.utils import parallel_make_value
+
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.4.1.tar.gz")
 
@@ -33,6 +35,7 @@ class CMakeTest(OESDKTestCase):
             opts["source"] = os.path.join(testdir, "assimp-5.4.1")
             opts["build"] = os.path.join(testdir, "build")
             opts["install"] = os.path.join(testdir, "install")
+            opts["parallel_make"] = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(opts["source"]))
@@ -42,6 +45,6 @@ class CMakeTest(OESDKTestCase):
             os.makedirs(opts["build"])
 
             self._run("cd {build} && cmake -DASSIMP_WARNINGS_AS_ERRORS=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DASSIMP_BUILD_ZLIB=ON {source}".format(**opts))
-            self._run("cmake --build {build} -- -j".format(**opts))
+            self._run("cmake --build {build} -- {parallel_make}".format(**opts))
             self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**opts))
             self.check_elf(os.path.join(opts["install"], "usr", "local", "lib", "libassimp.so.5.4.1"))
diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
index 0aa6f702e4..adbee2c6ed 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -21,9 +21,12 @@ class KernelModuleTest(OESDKTestCase):
         if isinstance(self.tc, OESDKExtTestContext):
             self.skipTest(f"{self.id()} does not support eSDK (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15850)")
 
+        from oe.utils import parallel_make_value
+        parallel_make = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
+
         self.ensure_target_package("kernel-devsrc")
         # These targets need to be built before kernel modules can be built.
-        self._run("make -j -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts")
+        self._run("make %s -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts" % (parallel_make))
 
         with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
             git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
diff --git a/meta/lib/oeqa/sdk/cases/makefile.py b/meta/lib/oeqa/sdk/cases/makefile.py
index 0dcf94c6d7..f3c342d09f 100644
--- a/meta/lib/oeqa/sdk/cases/makefile.py
+++ b/meta/lib/oeqa/sdk/cases/makefile.py
@@ -20,6 +20,8 @@ class MakefileTest(OESDKTestCase):
             raise unittest.SkipTest("MakefileTest class: SDK doesn't contain a supported C library")
 
     def test_lzip(self):
+        from oe.utils import parallel_make_value
+
         with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
 
@@ -27,6 +29,7 @@ class MakefileTest(OESDKTestCase):
             opts["source"] = os.path.join(testdir, "lzip-1.19")
             opts["build"] = os.path.join(testdir, "build")
             opts["install"] = os.path.join(testdir, "install")
+            opts["parallel_make"] = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(opts["source"]))
@@ -40,6 +43,6 @@ class MakefileTest(OESDKTestCase):
                      LDFLAGS="$LDFLAGS" \
                   """
             self._run(cmd.format(**opts))
-            self._run("cd {build} && make -j".format(**opts))
+            self._run("cd {build} && make {parallel_make}".format(**opts))
             self._run("cd {build} && make install DESTDIR={install}".format(**opts))
             self.check_elf(os.path.join(opts["install"], "usr", "local", "bin", "lzip"))

