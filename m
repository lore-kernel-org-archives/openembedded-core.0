Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 50D4771A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 20:01:00 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Sep 2017 13:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,459,1498546800"; d="scan'208";a="144600986"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by orsmga005.jf.intel.com with ESMTP; 01 Sep 2017 13:00:54 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 13:00:52 -0700
Message-Id: <20170901200052.116574-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] oeqa/selftest: Add missing IDs to various test cases
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
X-List-Received-Date: Fri, 01 Sep 2017 20:01:01 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Add decorator @OETestID() with Tesopia TC-ID to the test cases
that did not have it properly set.

[YOCTO #11873]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py      |  3 ++-
 meta/lib/oeqa/selftest/cases/distrodata.py    |  2 ++
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  3 +++
 meta/lib/oeqa/selftest/cases/runcmd.py        | 17 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           |  1 +
 5 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 72026d573c..f61a522017 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -40,7 +40,7 @@ class Archiver(OESelftestTestCase):
         excluded_present = len(glob.glob(src_path + '/%s-*' % exclude_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % exclude_recipe)
 
-
+    @OETestID(1900)
     def test_archiver_filters_by_type(self):
         """
         Summary:     The archiver is documented to filter on the recipe type.
@@ -73,6 +73,7 @@ class Archiver(OESelftestTestCase):
         excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipe)
 
+    @OETestID(1901)
     def test_archiver_filters_by_type_and_name(self):
         """
         Summary:     Test that the archiver archives by recipe type, taking the
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index d5d286d5cc..bcbcfb4f63 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -2,6 +2,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.utils.decorators import testcase
 from oeqa.utils.ftools import write_file
+from oeqa.core.decorator.oeid import OETestID
 
 class Distrodata(OESelftestTestCase):
 
@@ -10,6 +11,7 @@ class Distrodata(OESelftestTestCase):
         super(Distrodata, cls).setUpClass()
         cls.exceptions_path = os.path.join(cls.testlayer_path, 'files', 'distrodata', "checkpkg_exceptions")
 
+    @OETestID(1902)
     def test_checkpkg(self):
         """
         Summary:     Test that upstream version checks do not regress
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index bb2e0dba4c..1a850008ef 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -131,6 +131,7 @@ class ImageFeatures(OESelftestTestCase):
         # check if the resulting gzip is valid
         self.assertTrue(runCmd('gzip -t %s' % gzip_path))
 
+    @OETestID(1903)
     def test_hypervisor_fmts(self):
         """
         Summary:     Check various hypervisor formats
@@ -165,6 +166,7 @@ class ImageFeatures(OESelftestTestCase):
                             native_sysroot=sysroot)
             self.assertTrue(json.loads(result.output).get('format') == itype)
 
+    @OETestID(1905)
     def test_long_chain_conversion(self):
         """
         Summary:     Check for chaining many CONVERSION_CMDs together
@@ -196,6 +198,7 @@ class ImageFeatures(OESelftestTestCase):
         self.assertTrue(runCmd('cd %s;sha256sum -c %s.%s.sha256sum' %
                                (deploy_dir_image, link_name, conv)))
 
+    @OETestID(1904)
     def test_image_fstypes(self):
         """
         Summary:     Check if image of supported image fstypes can be built
diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index 6c785caadc..d76d7063c6 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -1,6 +1,7 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd
 from oeqa.utils import CommandError
+from oeqa.core.decorator.oeid import OETestID
 
 import subprocess
 import threading
@@ -26,49 +27,60 @@ class RunCmdTests(OESelftestTestCase):
     TIMEOUT = 2
     DELTA = 1
 
+    @OETestID(1916)
     def test_result_okay(self):
         result = runCmd("true")
         self.assertEqual(result.status, 0)
 
+    @OETestID(1915)
     def test_result_false(self):
         result = runCmd("false", ignore_status=True)
         self.assertEqual(result.status, 1)
 
+    @OETestID(1917)
     def test_shell(self):
         # A shell is used for all string commands.
         result = runCmd("false; true", ignore_status=True)
         self.assertEqual(result.status, 0)
 
+    @OETestID(1910)
     def test_no_shell(self):
         self.assertRaises(FileNotFoundError,
                           runCmd, "false; true", shell=False)
 
+    @OETestID(1906)
     def test_list_not_found(self):
         self.assertRaises(FileNotFoundError,
                           runCmd, ["false; true"])
 
+    @OETestID(1907)
     def test_list_okay(self):
         result = runCmd(["true"])
         self.assertEqual(result.status, 0)
 
+    @OETestID(1913)
     def test_result_assertion(self):
         self.assertRaisesRegexp(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
                                 runCmd, "echo foobar >&2; false", shell=True)
 
+    @OETestID(1914)
     def test_result_exception(self):
         self.assertRaisesRegexp(CommandError, "Command 'echo .* false' returned non-zero exit status 1 with output: foobar",
                                 runCmd, "echo foobar >&2; false", shell=True, assert_error=False)
 
+    @OETestID(1911)
     def test_output(self):
         result = runCmd("echo stdout; echo stderr >&2", shell=True)
         self.assertEqual("stdout\nstderr", result.output)
         self.assertEqual("", result.error)
 
+    @OETestID(1912)
     def test_output_split(self):
         result = runCmd("echo stdout; echo stderr >&2", shell=True, stderr=subprocess.PIPE)
         self.assertEqual("stdout", result.output)
         self.assertEqual("stderr", result.error)
 
+    @OETestID(1920)
     def test_timeout(self):
         numthreads = threading.active_count()
         start = time.time()
@@ -79,6 +91,7 @@ class RunCmdTests(OESelftestTestCase):
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count())
 
+    @OETestID(1921)
     def test_timeout_split(self):
         numthreads = threading.active_count()
         start = time.time()
@@ -89,12 +102,14 @@ class RunCmdTests(OESelftestTestCase):
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count())
 
+    @OETestID(1918)
     def test_stdin(self):
         numthreads = threading.active_count()
         result = runCmd("cat", data=b"hello world", timeout=self.TIMEOUT)
         self.assertEqual("hello world", result.output)
         self.assertEqual(numthreads, threading.active_count())
 
+    @OETestID(1919)
     def test_stdin_timeout(self):
         numthreads = threading.active_count()
         start = time.time()
@@ -104,12 +119,14 @@ class RunCmdTests(OESelftestTestCase):
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count())
 
+    @OETestID(1908)
     def test_log(self):
         log = MemLogger()
         result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log)
         self.assertEqual(["Running: echo stdout; echo stderr >&2", "stdout", "stderr"], log.info_msgs)
         self.assertEqual([], log.error_msgs)
 
+    @OETestID(1909)
     def test_log_split(self):
         log = MemLogger()
         result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log, stderr=subprocess.PIPE)
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index aaefd4fde5..e7423781e1 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -920,6 +920,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertNotIn('\nBZIMAGE        ', result.output)
         self.assertNotIn('\nEFI          <DIR>     ', result.output)
 
+    @OETestID(1922)
     def test_mkfs_extraopts(self):
         """Test wks option --mkfs-extraopts for empty and not empty partitions"""
         img = 'core-image-minimal'
-- 
2.12.3


