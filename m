Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DC8037725C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239493"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:36 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:22 +0300
Message-Id: <1470993086-23718-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/9] oeqa.buildperf: convert test cases to unittest
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
X-List-Received-Date: Fri, 12 Aug 2016 09:11:47 -0000

This commit converts the actual tests to be compatible with the new
Python unittest based framework.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/test_basic.py | 50 +++++++++++++----------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index ada5aba..b8bec6d 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -13,17 +13,15 @@
 import os
 import shutil
 
-from . import BuildPerfTest, perf_test_case
+from oeqa.buildperf import BuildPerfTestCase
 from oeqa.utils.commands import get_bb_vars
 
 
-@perf_test_case
-class Test1P1(BuildPerfTest):
-    name = "test1"
+class Test1P1(BuildPerfTestCase):
     build_target = 'core-image-sato'
-    description = "Measure wall clock of bitbake {} and size of tmp dir".format(build_target)
 
-    def _run(self):
+    def test1(self):
+        """Measure wall clock of bitbake core-image-sato and size of tmp dir"""
         self.log_cmd_output("bitbake {} -c fetchall".format(self.build_target))
         self.rm_tmp()
         self.rm_sstate()
@@ -35,13 +33,11 @@ class Test1P1(BuildPerfTest):
         self.save_buildstats()
 
 
-@perf_test_case
-class Test1P2(BuildPerfTest):
-    name = "test12"
+class Test1P2(BuildPerfTestCase):
     build_target = 'virtual/kernel'
-    description = "Measure bitbake {}".format(build_target)
 
-    def _run(self):
+    def test12(self):
+        """Measure bitbake virtual/kernel"""
         self.log_cmd_output("bitbake {} -c cleansstate".format(
             self.build_target))
         self.sync()
@@ -49,13 +45,11 @@ class Test1P2(BuildPerfTest):
                                    'bitbake ' + self.build_target)
 
 
-@perf_test_case
-class Test1P3(BuildPerfTest):
-    name = "test13"
+class Test1P3(BuildPerfTestCase):
     build_target = 'core-image-sato'
-    description = "Build {} with rm_work enabled".format(build_target)
 
-    def _run(self):
+    def test13(self):
+        """Build core-image-sato with rm_work enabled"""
         postfile = os.path.join(self.out_dir, 'postfile.conf')
         with open(postfile, 'w') as fobj:
             fobj.write('INHERIT += "rm_work"\n')
@@ -73,13 +67,11 @@ class Test1P3(BuildPerfTest):
         self.save_buildstats()
 
 
-@perf_test_case
-class Test2(BuildPerfTest):
-    name = "test2"
+class Test2(BuildPerfTestCase):
     build_target = 'core-image-sato'
-    description = "Measure bitbake {} -c rootfs with sstate".format(build_target)
 
-    def _run(self):
+    def test2(self):
+        """Measure bitbake core-image-sato -c rootfs with sstate"""
         self.rm_tmp()
         self.rm_cache()
         self.sync()
@@ -87,12 +79,10 @@ class Test2(BuildPerfTest):
         self.measure_cmd_resources(cmd, 'do_rootfs', 'bitbake do_rootfs')
 
 
-@perf_test_case
-class Test3(BuildPerfTest):
-    name = "test3"
-    description = "Parsing time metrics (bitbake -p)"
+class Test3(BuildPerfTestCase):
 
-    def _run(self):
+    def test3(self):
+        """Parsing time metrics (bitbake -p)"""
         # Drop all caches and parse
         self.rm_cache()
         self.force_rm(os.path.join(self.bb_vars['TMPDIR'], 'cache'))
@@ -107,13 +97,11 @@ class Test3(BuildPerfTest):
                                    'bitbake -p (cached)')
 
 
-@perf_test_case
-class Test4(BuildPerfTest):
-    name = "test4"
+class Test4(BuildPerfTestCase):
     build_target = 'core-image-sato'
-    description = "eSDK metrics"
 
-    def _run(self):
+    def test4(self):
+        """eSDK metrics"""
         self.log_cmd_output("bitbake {} -c do_populate_sdk_ext".format(
             self.build_target))
         self.bb_vars = get_bb_vars(None, self.build_target)
-- 
2.6.6


