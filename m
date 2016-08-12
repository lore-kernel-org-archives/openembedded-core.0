Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2025E7724B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239482"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:32 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:19 +0300
Message-Id: <1470993086-23718-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/9] oeqa.buildperf: derive BuildPerfTestCase class from unitest.TestCase
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

Rename BuildPerfTest to BuildPerfTestCase and convert it to be derived
from TestCase class from the unittest framework of the Python standard
library. This doesn't work with our existing testcases or test runner
class and these need to be modified, too.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py |  4 ++-
 meta/lib/oeqa/buildperf/base.py     | 67 +++++++++++++++++--------------------
 2 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index c816bd2..add3be2 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -10,6 +10,8 @@
 # more details.
 #
 """Build performance tests"""
-from .base import (perf_test_case, BuildPerfTest, BuildPerfTestRunner,
+from .base import (perf_test_case,
+                   BuildPerfTestCase,
+                   BuildPerfTestRunner,
                    KernelDropCaches)
 from .test_basic import *
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 527563b..5b4c37c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -19,6 +19,7 @@ import socket
 import tempfile
 import time
 import traceback
+import unittest
 from datetime import datetime, timedelta
 
 from oeqa.utils.commands import runCmd, get_bb_vars
@@ -191,50 +192,34 @@ def perf_test_case(obj):
     return obj
 
 
-class BuildPerfTest(object):
+class BuildPerfTestCase(unittest.TestCase):
     """Base class for build performance tests"""
     SYSRES = 'sysres'
     DISKUSAGE = 'diskusage'
 
-    name = None
-    description = None
-
-    def __init__(self, out_dir):
-        self.out_dir = out_dir
-        self.results = {'name':self.name,
-                        'description': self.description,
-                        'status': 'NOTRUN',
-                        'start_time': None,
-                        'elapsed_time': None,
-                        'measurements': []}
-        if not os.path.exists(self.out_dir):
-            os.makedirs(self.out_dir)
-        if not self.name:
-            self.name = self.__class__.__name__
+    def __init__(self, *args, **kwargs):
+        super(BuildPerfTestCase, self).__init__(*args, **kwargs)
+        self.name = self._testMethodName
+        self.out_dir = None
+        self.start_time = None
+        self.elapsed_time = None
+        self.measurements = []
         self.bb_vars = get_bb_vars()
-        # TODO: remove the _failed flag when globalres.log is ditched as all
-        # failures should raise an exception
-        self._failed = False
-        self.cmd_log = os.path.join(self.out_dir, 'commands.log')
+        # TODO: remove 'times' and 'sizes' arrays when globalres support is
+        # removed
+        self.times = []
+        self.sizes = []
 
-    def run(self):
+    def run(self, *args, **kwargs):
         """Run test"""
-        self.results['status'] = 'FAILED'
-        self.results['start_time'] = datetime.now()
-        self._run()
-        self.results['elapsed_time'] = (datetime.now() -
-                                        self.results['start_time'])
-        # Test is regarded as completed if it doesn't raise an exception
-        if not self._failed:
-            self.results['status'] = 'COMPLETED'
-
-    def _run(self):
-        """Actual test payload"""
-        raise NotImplementedError
+        self.start_time = datetime.now()
+        super(BuildPerfTestCase, self).run(*args, **kwargs)
+        self.elapsed_time = datetime.now() - self.start_time
 
     def log_cmd_output(self, cmd):
         """Run a command and log it's output"""
-        with open(self.cmd_log, 'a') as fobj:
+        cmd_log = os.path.join(self.out_dir, 'commands.log')
+        with open(cmd_log, 'a') as fobj:
             runCmd(cmd, stdout=fobj)
 
     def measure_cmd_resources(self, cmd, name, legend):
@@ -251,7 +236,8 @@ class BuildPerfTest(object):
 
         cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
         log.info("Timing command: %s", cmd_str)
-        with open(self.cmd_log, 'a') as fobj:
+        cmd_log = os.path.join(self.out_dir, 'commands.log')
+        with open(cmd_log, 'a') as fobj:
             ret, timedata = time_cmd(cmd, stdout=fobj)
         if ret.status:
             log.error("Time will be reported as 0. Command failed: %s",
@@ -266,12 +252,17 @@ class BuildPerfTest(object):
                        'name': name,
                        'legend': legend}
         measurement['values'] = {'elapsed_time': etime}
-        self.results['measurements'].append(measurement)
+        self.measurements.append(measurement)
+        e_sec = etime.total_seconds()
         nlogs = len(glob.glob(self.out_dir + '/results.log*'))
         results_log = os.path.join(self.out_dir,
                                    'results.log.{}'.format(nlogs + 1))
         with open(results_log, 'w') as fobj:
             fobj.write(timedata)
+        # Append to 'times' array for globalres log
+        self.times.append('{:d}:{:02d}:{:.2f}'.format(int(e_sec / 3600),
+                                                      int((e_sec % 3600) / 60),
+                                                       e_sec % 60))
 
     def measure_disk_usage(self, path, name, legend):
         """Estimate disk usage of a file or directory"""
@@ -289,7 +280,9 @@ class BuildPerfTest(object):
                        'name': name,
                        'legend': legend}
         measurement['values'] = {'size': size}
-        self.results['measurements'].append(measurement)
+        self.measurements.append(measurement)
+        # Append to 'sizes' array for globalres log
+        self.sizes.append(str(size))
 
     def save_buildstats(self):
         """Save buildstats"""
-- 
2.6.6


