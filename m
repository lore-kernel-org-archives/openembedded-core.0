Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8CA73212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 07:33:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 00:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,580,1464678000"; d="scan'208";a="1020615516"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2016 00:33:15 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 10:33:09 +0300
Message-Id: <1472196791-24336-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/4] oeqa.buildperf: make tests independent
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
X-List-Received-Date: Fri, 26 Aug 2016 07:33:14 -0000

Add test set-up functionality so that the individual tests do not depend
on each other. This should make sure that a failure in one test does not
affect the results of another test. The patch also makes it reasonable
to run only a subset of the tests by using the --run-tests option.

The increase in total execution time of the full suite - caused by the
additional set-up steps - is insignificant because normally no
additional tasks need to be run. The previous test has already done all
set-up work.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py       |  7 +++++++
 meta/lib/oeqa/buildperf/test_basic.py | 10 +++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index e4a7948..83439f1 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -257,6 +257,7 @@ class BuildPerfTestCase(unittest.TestCase):
     """Base class for build performance tests"""
     SYSRES = 'sysres'
     DISKUSAGE = 'diskusage'
+    build_target = None
 
     def __init__(self, *args, **kwargs):
         super(BuildPerfTestCase, self).__init__(*args, **kwargs)
@@ -271,6 +272,12 @@ class BuildPerfTestCase(unittest.TestCase):
         self.times = []
         self.sizes = []
 
+    def setUp(self):
+        """Set-up fixture for each test"""
+        if self.build_target:
+            self.log_cmd_output(['bitbake', self.build_target,
+                                 '-c', 'fetchall'])
+
     def run(self, *args, **kwargs):
         """Run test"""
         self.start_time = datetime.now()
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 9310f3d..25dbfb0 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -23,7 +23,6 @@ class Test1P1(BuildPerfTestCase):
 
     def test1(self):
         """Measure wall clock of bitbake core-image-sato and size of tmp dir"""
-        self.log_cmd_output("bitbake {} -c fetchall".format(self.build_target))
         self.rm_tmp()
         self.rm_sstate()
         self.rm_cache()
@@ -39,8 +38,10 @@ class Test1P2(BuildPerfTestCase):
 
     def test12(self):
         """Measure bitbake virtual/kernel"""
-        self.log_cmd_output("bitbake {} -c cleansstate".format(
-            self.build_target))
+        # Build and cleans state in order to get all dependencies pre-built
+        self.log_cmd_output(['bitbake', self.build_target])
+        self.log_cmd_output(['bitbake', self.build_target, '-c', 'cleansstate'])
+
         self.sync()
         self.measure_cmd_resources(['bitbake', self.build_target], 'build',
                                    'bitbake ' + self.build_target)
@@ -73,6 +74,9 @@ class Test2(BuildPerfTestCase):
 
     def test2(self):
         """Measure bitbake core-image-sato -c rootfs with sstate"""
+        # Build once in order to populate sstate cache
+        self.log_cmd_output(['bitbake', self.build_target])
+
         self.rm_tmp()
         self.rm_cache()
         self.sync()
-- 
2.6.6


