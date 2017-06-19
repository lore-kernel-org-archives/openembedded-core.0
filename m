Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7806A7808D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:39:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 19 Jun 2017 07:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,361,1493708400"; d="scan'208";a="99411697"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 19 Jun 2017 07:39:39 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 07:39:36 -0700
Message-Id: <20170619143936.20912-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] selftest/cases: use stderr data when querying for errors
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
X-List-Received-Date: Mon, 19 Jun 2017 14:39:40 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Error data is now placed on the result.error variable, thus
change relevant test cases to query the latter (instead of
stdout). Also a bit of refactor with a new file created on
with single function used by the selftest modules.

[YOCTO #9693]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py      | 24 +++++++++++-------------
 meta/lib/oeqa/selftest/cases/buildhistory.py |  6 +++---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 21 +++++++++------------
 meta/lib/oeqa/selftest/cases/lic_checksum.py |  4 ++--
 meta/lib/oeqa/selftest/cases/pkgdata.py      | 16 ++++++++--------
 meta/lib/oeqa/selftest/cases/signing.py      |  2 +-
 meta/lib/oeqa/utils/commands.py              |  8 ++++----
 meta/lib/oeqa/utils/misc.py                  | 11 +++++++++++
 8 files changed, 49 insertions(+), 43 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/misc.py

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 4c82049032..f377de4996 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -3,17 +3,13 @@ import re
 
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.misc import getline
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
 
 class BitbakeTests(OESelftestTestCase):
 
-    def getline(self, res, line):
-        for l in res.output.split('\n'):
-            if line in l:
-                return l
-
     @OETestID(789)
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
@@ -46,13 +42,15 @@ class BitbakeTests(OESelftestTestCase):
 
     @OETestID(105)
     def test_bitbake_invalid_recipe(self):
-        result = bitbake('-b asdf', ignore_status=True)
-        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        invalid = 'asdf'
+        result = bitbake('-b %s' % invalid, ignore_status=True)
+        self.assertTrue("ERROR: Unable to find any recipe file matching '%s'" % invalid in result.error, msg = "Though %s recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % (invalid, result.error))
 
     @OETestID(107)
     def test_bitbake_invalid_target(self):
-        result = bitbake('asdf', ignore_status=True)
-        self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output, msg = "Though no 'asdf' target exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        invalid = 'asdf'
+        result = bitbake(invalid, ignore_status=True)
+        self.assertTrue("ERROR: Nothing PROVIDES '%s'" % invalid in result.error, msg = "Though no '%s' target exists, bitbake didn't output any err. message. bitbake output: %s" % (invalid, result.error))
 
     @OETestID(106)
     def test_warnings_errors(self):
@@ -71,8 +69,8 @@ class BitbakeTests(OESelftestTestCase):
         result = bitbake('man -c patch', ignore_status=True)
         self.delete_recipeinc('man')
         bitbake('-cclean man')
-        line = self.getline(result, "Function failed: patch_do_patch")
-        self.assertTrue(line and line.startswith("ERROR:"), msg = "Repeated patch application didn't fail. bitbake output: %s" % result.output)
+        line = getline(result.error, "Function failed: patch_do_patch")
+        self.assertTrue(line and line.startswith("ERROR:"), msg = "Repeated patch application didn't fail. bitbake output: %s" % result.error)
 
     @OETestID(1354)
     def test_force_task_1(self):
@@ -144,9 +142,9 @@ INHERIT_remove = \"report-error\"
         bitbake('-ccleanall man')
         self.delete_recipeinc('man')
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
-        self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output, msg = "\"invalid\" file \
+        self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.error, msg = "\"invalid\" file \
 doesn't exist, yet no error message encountered. bitbake output: %s" % result.output)
-        line = self.getline(result, 'Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
+        line = getline(result.error, 'Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
         self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
 doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index 06792d9146..2d28cefdcb 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -37,10 +37,10 @@ class BuildhistoryBase(OESelftestTestCase):
 
         if expect_error:
             self.assertEqual(result.status, 1, msg="Error expected for global config '%s' and target config '%s'" % (global_config, target_config))
-            search_for_error = re.search(error_regex, result.output)
-            self.assertTrue(search_for_error, msg="Could not find desired error in output: %s (%s)" % (error_regex, result.output))
+            search_for_error = re.search(error_regex, result.error)
+            self.assertTrue(search_for_error, msg="Could not find desired error in output: %s (%s)" % (error_regex, result.error))
         else:
-            self.assertEqual(result.status, 0, msg="Command 'bitbake %s' has failed unexpectedly: %s" % (target, result.output))
+            self.assertEqual(result.status, 0, msg="Command 'bitbake %s' has failed unexpectedly: %s" % (target, result.error))
 
     # No tests should be added to the base class.
     # Please create a new class that inherit this one, or use one of those already available for adding tests.
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 1f1bb7ae63..bfb6ba339a 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -6,6 +6,7 @@ import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.misc import getline
 import oeqa.utils.ftools as ftools
 from oeqa.core.decorator.oeid import OETestID
 
@@ -58,21 +59,17 @@ class DiskMonTest(OESelftestTestCase):
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
-        self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
-        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
+        self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.error, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.error)
+        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.error))
         self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
-        self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
-        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
+        self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.error, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.error)
+        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.error))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
         res = bitbake("m4")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
 class SanityOptionsTest(OESelftestTestCase):
-    def getline(self, res, line):
-        for l in res.output.split('\n'):
-            if line in l:
-                return l
 
     @OETestID(927)
     def test_options_warnqa_errorqa_switch(self):
@@ -85,7 +82,7 @@ class SanityOptionsTest(OESelftestTestCase):
         self.add_command_to_tearDown('bitbake -c clean xcursor-transparent-theme')
         res = bitbake("xcursor-transparent-theme -f -c package", ignore_status=True)
         self.delete_recipeinc('xcursor-transparent-theme')
-        line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
+        line = getline(res.error, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
@@ -93,7 +90,7 @@ class SanityOptionsTest(OESelftestTestCase):
         self.append_config('WARN_QA_append = " packages-list"')
         res = bitbake("xcursor-transparent-theme -f -c package")
         self.delete_recipeinc('xcursor-transparent-theme')
-        line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
+        line = getline(res.output, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
 
     @OETestID(278)
@@ -102,7 +99,7 @@ class SanityOptionsTest(OESelftestTestCase):
 
         self.add_command_to_tearDown('bitbake -c clean gzip')
         res = bitbake("gzip -f -c package_qa")
-        line = self.getline(res, "QA Issue: gzip")
+        line = getline(res.output, "QA Issue: gzip")
         self.assertFalse(line, "WARNING: QA Issue: gzip message is present in bitbake's output and shouldn't be: %s" % res.output)
 
         self.append_config("""
@@ -111,7 +108,7 @@ do_install_append_pn-gzip () {
 }
 """)
         res = bitbake("gzip -f -c package_qa")
-        line = self.getline(res, "QA Issue: gzip")
+        line = getline(res.output, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
 
     @OETestID(1421)
diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 37407157c1..33bb47ac3a 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -31,5 +31,5 @@ SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 
         self.write_config("INHERIT_remove = \"report-error\"")
         result = bitbake(bitbake_cmd, ignore_status=True)
-        if error_msg not in result.output:
-            raise AssertionError(result.output)
+        if error_msg not in result.error:
+            raise AssertionError(result.error)
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 0b4caf1b2c..696fa7d5e2 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -23,16 +23,16 @@ class OePkgdataUtilTests(OESelftestTestCase):
         result = runCmd('oe-pkgdata-util lookup-pkg zlib-dev')
         self.assertEqual(result.output, 'libz-dev')
         result = runCmd('oe-pkgdata-util lookup-pkg nonexistentpkg', ignore_status=True)
-        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
-        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+        self.assertEqual(result.status, 1, "Status different than 1. error: %s" % result.error)
+        self.assertEqual(result.error, 'ERROR: The following packages could not be found: nonexistentpkg')
         # Reverse tests
         result = runCmd('oe-pkgdata-util lookup-pkg -r "libz1 busybox"')
         self.assertEqual(result.output, 'zlib\nbusybox')
         result = runCmd('oe-pkgdata-util lookup-pkg -r libz-dev')
         self.assertEqual(result.output, 'zlib-dev')
         result = runCmd('oe-pkgdata-util lookup-pkg -r nonexistentpkg', ignore_status=True)
-        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
-        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+        self.assertEqual(result.status, 1, "Status different than 1. error: %s" % result.error)
+        self.assertEqual(result.error, 'ERROR: The following packages could not be found: nonexistentpkg')
 
     @OETestID(1205)
     def test_read_value(self):
@@ -51,8 +51,8 @@ class OePkgdataUtilTests(OESelftestTestCase):
         result = runCmd('oe-pkgdata-util find-path /usr/bin/m4')
         self.assertEqual(result.output, 'm4: /usr/bin/m4')
         result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
-        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
-        self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
+        self.assertEqual(result.status, 1, "Status different than 1. error: %s" % result.error)
+        self.assertEqual(result.error, 'ERROR: Unable to find any package producing path /not/exist')
 
     @OETestID(1204)
     def test_lookup_recipe(self):
@@ -61,8 +61,8 @@ class OePkgdataUtilTests(OESelftestTestCase):
         result = runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
         self.assertEqual(result.output, 'zlib')
         result = runCmd('oe-pkgdata-util lookup-recipe nonexistentpkg', ignore_status=True)
-        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
-        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+        self.assertEqual(result.status, 1, "Status different than 1. error: %s" % result.error)
+        self.assertEqual(result.error, 'ERROR: The following packages could not be found: nonexistentpkg')
 
     @OETestID(1202)
     def test_list_pkgs(self):
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index edb5f653f2..cd64eb5cbf 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -133,7 +133,7 @@ class Signing(OESelftestTestCase):
         ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
         # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
         # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
-        self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
+        self.assertIn('gpg: Good signature from', ret.error, 'Package signed incorrectly.')
 
 
 class LockedSignatures(OESelftestTestCase):
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 4ef0e874ff..055a59cab1 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -70,6 +70,7 @@ class Command(object):
             self.stop()
 
     def stop(self):
+
         if self.thread.isAlive():
             self.process.terminate()
             # let's give it more time to terminate gracefully before killing it
@@ -78,10 +79,9 @@ class Command(object):
                 self.process.kill()
                 self.thread.join()
 
-        if not self.output:
-            self.output = ""
-        else:
-            self.output = self.output.decode("utf-8", errors='replace').rstrip()
+        self.output = self.output.decode("utf-8", errors='replace').rstrip() if self.output else ""
+        self.error = self.error.decode("utf-8", errors='ignore').rstrip() if self.error else ""
+
         self.status = self.process.poll()
 
         self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))
diff --git a/meta/lib/oeqa/utils/misc.py b/meta/lib/oeqa/utils/misc.py
new file mode 100644
index 0000000000..b5579e5b63
--- /dev/null
+++ b/meta/lib/oeqa/utils/misc.py
@@ -0,0 +1,11 @@
+# Copyright (C) 2013-2017 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+def getline(data, line):
+    _line = ''
+    for l in data.split('\n'):
+        if line in l:
+            _line = l
+            break
+    return _line
-- 
2.12.0


