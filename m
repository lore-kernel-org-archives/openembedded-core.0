Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86E1D7724B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239491"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:34 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:21 +0300
Message-Id: <1470993086-23718-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/9] oeqa.buildperf: add BuildPerfTestResult class
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
X-List-Received-Date: Fri, 12 Aug 2016 09:11:46 -0000

The new class is derived from unittest.TextTestResult class. It is
actually implemented by modifying the old BuildPerfTestRunner class
which, in turn, is replaced by a totally new simple implementation
derived from unittest.TestRunner.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py |   4 +-
 meta/lib/oeqa/buildperf/base.py     | 150 +++++++++++++++++++-----------------
 scripts/oe-build-perf-test          |  10 +++
 3 files changed, 90 insertions(+), 74 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index 7e51726..85abf3a 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -10,9 +10,9 @@
 # more details.
 #
 """Build performance tests"""
-from .base import (perf_test_case,
-                   BuildPerfTestCase,
+from .base import (BuildPerfTestCase,
                    BuildPerfTestLoader,
+                   BuildPerfTestResult,
                    BuildPerfTestRunner,
                    KernelDropCaches)
 from .test_basic import *
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 5049ba9..9711a6a 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -76,25 +76,26 @@ def time_cmd(cmd, **kwargs):
     return ret, timedata
 
 
-class BuildPerfTestRunner(object):
+class BuildPerfTestResult(unittest.TextTestResult):
     """Runner class for executing the individual tests"""
     # List of test cases to run
     test_run_queue = []
 
-    def __init__(self, out_dir):
-        self.results = {}
-        self.out_dir = os.path.abspath(out_dir)
-        if not os.path.exists(self.out_dir):
-            os.makedirs(self.out_dir)
+    def __init__(self, out_dir, *args, **kwargs):
+        super(BuildPerfTestResult, self).__init__(*args, **kwargs)
 
+        self.out_dir = out_dir
         # Get Git parameters
         try:
             self.repo = GitRepo('.')
         except GitError:
             self.repo = None
-        self.git_rev, self.git_branch = self.get_git_revision()
+        self.git_revision, self.git_branch = self.get_git_revision()
+        self.hostname = socket.gethostname()
+        self.start_time = self.elapsed_time = None
+        self.successes = []
         log.info("Using Git branch:revision %s:%s", self.git_branch,
-                 self.git_rev)
+                 self.git_revision)
 
     def get_git_revision(self):
         """Get git branch and revision under testing"""
@@ -117,79 +118,71 @@ class BuildPerfTestRunner(object):
                     branch = None
         return str(rev), str(branch)
 
-    def run_tests(self):
-        """Method that actually runs the tests"""
-        self.results['schema_version'] = 1
-        self.results['git_revision'] = self.git_rev
-        self.results['git_branch'] = self.git_branch
-        self.results['tester_host'] = socket.gethostname()
-        start_time = datetime.utcnow()
-        self.results['start_time'] = start_time
-        self.results['tests'] = {}
-
-        self.archive_build_conf()
-        for test_class in self.test_run_queue:
-            log.info("Executing test %s: %s", test_class.name,
-                     test_class.description)
-
-            test = test_class(self.out_dir)
-            try:
-                test.run()
-            except Exception:
-                # Catch all exceptions. This way e.g buggy tests won't scrap
-                # the whole test run
-                sep = '-' * 5 + ' TRACEBACK ' + '-' * 60 + '\n'
-                tb_msg = sep + traceback.format_exc() + sep
-                log.error("Test execution failed with:\n" + tb_msg)
-            self.results['tests'][test.name] = test.results
-
-        self.results['elapsed_time'] = datetime.utcnow() - start_time
-        return 0
-
-    def archive_build_conf(self):
-        """Archive build/conf to test results"""
-        src_dir = os.path.join(os.environ['BUILDDIR'], 'conf')
-        tgt_dir = os.path.join(self.out_dir, 'build', 'conf')
-        os.makedirs(os.path.dirname(tgt_dir))
-        shutil.copytree(src_dir, tgt_dir)
+    def addSuccess(self, test):
+        """Record results from successful tests"""
+        super(BuildPerfTestResult, self).addSuccess(test)
+        self.successes.append((test, None))
+
+    def startTest(self, test):
+        """Pre-test hook"""
+        test.out_dir = self.out_dir
+        log.info("Executing test %s: %s", test.name, test.shortDescription())
+        self.stream.write(datetime.now().strftime("[%Y-%m-%d %H:%M:%S] "))
+        super(BuildPerfTestResult, self).startTest(test)
+
+    def startTestRun(self):
+        """Pre-run hook"""
+        self.start_time = datetime.utcnow()
+
+    def stopTestRun(self):
+        """Pre-run hook"""
+        self.elapsed_time = datetime.utcnow() - self.start_time
+
+    def all_results(self):
+        result_map = {'SUCCESS': self.successes,
+                      'FAIL': self.failures,
+                      'ERROR': self.errors,
+                      'EXP_FAIL': self.expectedFailures,
+                      'UNEXP_SUCCESS': self.unexpectedSuccesses}
+        for status, tests in result_map.items():
+            for test in tests:
+                yield (status, test)
+
 
     def update_globalres_file(self, filename):
         """Write results to globalres csv file"""
+        # Map test names to time and size columns in globalres
+        # The tuples represent index and length of times and sizes
+        # respectively
+        gr_map = {'test1': ((0, 1), (8, 1)),
+                  'test12': ((1, 1), (None, None)),
+                  'test13': ((2, 1), (9, 1)),
+                  'test2': ((3, 1), (None, None)),
+                  'test3': ((4, 3), (None, None)),
+                  'test4': ((7, 1), (10, 2))}
+
         if self.repo:
-            git_tag_rev = self.repo.run_cmd(['describe', self.git_rev])
+            git_tag_rev = self.repo.run_cmd(['describe', self.git_revision])
         else:
-            git_tag_rev = self.git_rev
-        times = []
-        sizes = []
-        for test in self.results['tests'].values():
-            for measurement in test['measurements']:
-                res_type = measurement['type']
-                values = measurement['values']
-                if res_type == BuildPerfTest.SYSRES:
-                    e_sec = values['elapsed_time'].total_seconds()
-                    times.append('{:d}:{:02d}:{:.2f}'.format(
-                        int(e_sec / 3600),
-                        int((e_sec % 3600) / 60),
-                        e_sec % 60))
-                elif res_type == BuildPerfTest.DISKUSAGE:
-                    sizes.append(str(values['size']))
-                else:
-                    log.warning("Unable to handle '%s' values in "
-                                "globalres.log", res_type)
+            git_tag_rev = self.git_revision
+
+        values = ['0'] * 12
+        for status, test in self.all_results():
+            if status not in ['SUCCESS', 'FAILURE', 'EXP_SUCCESS']:
+                continue
+            (t_ind, t_len), (s_ind, s_len) = gr_map[test.name]
+            if t_ind is not None:
+                values[t_ind:t_ind + t_len] = test.times
+            if s_ind is not None:
+                values[s_ind:s_ind + s_len] = test.sizes
 
         log.debug("Writing globalres log to %s", filename)
         with open(filename, 'a') as fobj:
-            fobj.write('{},{}:{},{},'.format(self.results['tester_host'],
-                                             self.results['git_branch'],
-                                             self.results['git_revision'],
+            fobj.write('{},{}:{},{},'.format(self.hostname,
+                                             self.git_branch,
+                                             self.git_revision,
                                              git_tag_rev))
-            fobj.write(','.join(times + sizes) + '\n')
-
-
-def perf_test_case(obj):
-    """Decorator for adding test classes"""
-    BuildPerfTestRunner.test_run_queue.append(obj)
-    return obj
+            fobj.write(','.join(values) + '\n')
 
 
 class BuildPerfTestCase(unittest.TestCase):
@@ -326,3 +319,16 @@ class BuildPerfTestCase(unittest.TestCase):
 class BuildPerfTestLoader(unittest.TestLoader):
     """Test loader for build performance tests"""
     sortTestMethodsUsing = None
+
+
+class BuildPerfTestRunner(unittest.TextTestRunner):
+    """Test loader for build performance tests"""
+    sortTestMethodsUsing = None
+
+    def __init__(self, out_dir, *args, **kwargs):
+        super(BuildPerfTestRunner, self).__init__(*args, **kwargs)
+        self.out_dir = out_dir
+
+    def _makeResult(self):
+       return BuildPerfTestResult(self.out_dir, self.stream, self.descriptions,
+                                  self.verbosity)
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 996996b..8142b03 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -19,6 +19,7 @@ import errno
 import fcntl
 import logging
 import os
+import shutil
 import sys
 from datetime import datetime
 
@@ -78,6 +79,14 @@ def setup_file_logging(log_file):
     log.addHandler(handler)
 
 
+def archive_build_conf(out_dir):
+    """Archive build/conf to test results"""
+    src_dir = os.path.join(os.environ['BUILDDIR'], 'conf')
+    tgt_dir = os.path.join(out_dir, 'build', 'conf')
+    os.makedirs(os.path.dirname(tgt_dir))
+    shutil.copytree(src_dir, tgt_dir)
+
+
 def parse_args(argv):
     """Parse command line arguments"""
     parser = argparse.ArgumentParser(
@@ -120,6 +129,7 @@ def main(argv=None):
 
     # Run actual tests
     runner = BuildPerfTestRunner(out_dir)
+    archive_build_conf(out_dir)
     ret = runner.run_tests()
     if not ret:
         if args.globalres_file:
-- 
2.6.6


