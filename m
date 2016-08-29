Return-Path: <markus.lehtonen@linux.intel.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Aug 2016 19:58:35 UTC
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5996B6072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:58:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 29 Aug 2016 12:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304318"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:49:02 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:30 +0300
Message-Id: <1472500111-12358-12-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 11/12] oeqa.buildperf: include buildstats file name in results.json
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
X-List-Received-Date: Mon, 29 Aug 2016 19:58:35 -0000

No need to do lsdir magic for finding buildstats when reading results.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py       | 18 ++++++++++++++----
 meta/lib/oeqa/buildperf/test_basic.py |  7 +++----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 49da8f6..0b2c0f8 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -141,7 +141,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
 
     def startTest(self, test):
         """Pre-test hook"""
-        test.out_dir = os.path.join(self.out_dir, test.name)
+        test.base_dir = self.out_dir
         os.mkdir(test.out_dir)
         log.info("Executing test %s: %s", test.name, test.shortDescription())
         self.stream.write(datetime.now().strftime("[%Y-%m-%d %H:%M:%S] "))
@@ -298,7 +298,7 @@ class BuildPerfTestCase(unittest.TestCase):
     def __init__(self, *args, **kwargs):
         super(BuildPerfTestCase, self).__init__(*args, **kwargs)
         self.name = self._testMethodName
-        self.out_dir = None
+        self.base_dir = None
         self.start_time = None
         self.elapsed_time = None
         self.measurements = []
@@ -308,6 +308,10 @@ class BuildPerfTestCase(unittest.TestCase):
         self.times = []
         self.sizes = []
 
+    @property
+    def out_dir(self):
+        return os.path.join(self.base_dir, self.name)
+
     def setUp(self):
         """Set-up fixture for each test"""
         if self.build_target:
@@ -332,7 +336,7 @@ class BuildPerfTestCase(unittest.TestCase):
             log.error("Command failed: %s", err.retcode)
             raise
 
-    def measure_cmd_resources(self, cmd, name, legend):
+    def measure_cmd_resources(self, cmd, name, legend, save_bs=False):
         """Measure system resource usage of a command"""
         def _worker(data_q, cmd, **kwargs):
             """Worker process for measuring resources"""
@@ -387,6 +391,11 @@ class BuildPerfTestCase(unittest.TestCase):
                                  'elapsed_time': etime,
                                  'rusage': data['rusage'],
                                  'iostat': data['iostat']}
+        if save_bs:
+            bs_file = self.save_buildstats(legend)
+            measurement['values']['buildstats_file'] = \
+                    os.path.relpath(bs_file, self.base_dir)
+
         self.measurements.append(measurement)
 
         # Append to 'times' array for globalres log
@@ -474,12 +483,13 @@ class BuildPerfTestCase(unittest.TestCase):
             buildstats.append(recipe_bs)
 
         # Write buildstats into json file
-        postfix = '.' + label if label else ''
+        postfix = '.' + str_to_fn(label) if label else ''
         postfix += '.json'
         outfile = os.path.join(self.out_dir, 'buildstats' + postfix)
         with open(outfile, 'w') as fobj:
             json.dump(buildstats, fobj, indent=4, sort_keys=True,
                       cls=ResultsJsonEncoder)
+        return outfile
 
     def rm_tmp(self):
         """Cleanup temporary/intermediate files and directories"""
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 25dbfb0..e448ed1 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -28,9 +28,8 @@ class Test1P1(BuildPerfTestCase):
         self.rm_cache()
         self.sync()
         self.measure_cmd_resources(['bitbake', self.build_target], 'build',
-                                   'bitbake ' + self.build_target)
+                                   'bitbake ' + self.build_target, save_bs=True)
         self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
-        self.save_buildstats()
 
 
 class Test1P2(BuildPerfTestCase):
@@ -62,11 +61,11 @@ class Test1P3(BuildPerfTestCase):
             self.sync()
             cmd = ['bitbake', '-R', postfile, self.build_target]
             self.measure_cmd_resources(cmd, 'build',
-                                       'bitbake' + self.build_target)
+                                       'bitbake' + self.build_target,
+                                       save_bs=True)
             self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
         finally:
             os.unlink(postfile)
-        self.save_buildstats()
 
 
 class Test2(BuildPerfTestCase):
-- 
2.6.6


