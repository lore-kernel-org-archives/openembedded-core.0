Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEF773163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410392"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:03 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:27 +0300
Message-Id: <1466764661-24544-15-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 14/28] oeqa.buildperf: implement BuildPerfTestRunner class
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:03 -0000

The new class is responsible for actually running the tests and
processing their results. This commit also adds a decorator function for
adding new tests. No automatic test discovery, at least yet.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py |  3 ++-
 meta/lib/oeqa/buildperf/base.py     | 47 +++++++++++++++++++++++++++++++++++++
 scripts/oe-build-perf-test          | 10 ++++++--
 3 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index 3bee5b9..d6065e8 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -10,4 +10,5 @@
 # more details.
 #
 """Build performance tests"""
-from .base import BuildPerfTest, KernelDropCaches
+from .base import (build_perf_test, BuildPerfTest, BuildPerfTestRunner,
+                   KernelDropCaches)
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index c54b70c..1bfcb71 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -15,8 +15,10 @@ import logging
 import os
 import re
 import shutil
+import socket
 import tempfile
 import time
+import traceback
 from datetime import datetime, timedelta
 
 from oeqa.utils.commands import runCmd, get_bb_vars
@@ -72,6 +74,51 @@ def time_cmd(cmd, **kwargs):
     return ret, timedata
 
 
+class BuildPerfTestRunner(object):
+    """Runner class for executing the individual tests"""
+    # List of test cases to run
+    test_run_queue = []
+
+    def __init__(self, out_dir):
+        self.results = {}
+        self.out_dir = os.path.abspath(out_dir)
+        if not os.path.exists(self.out_dir):
+            os.makedirs(self.out_dir)
+
+
+    def run_tests(self):
+        """Method that actually runs the tests"""
+        self.results['schema_version'] = 1
+        self.results['tester_host'] = socket.gethostname()
+        start_time = datetime.utcnow()
+        self.results['start_time'] = start_time
+        self.results['tests'] = {}
+
+        for test_class in self.test_run_queue:
+            log.info("Executing test %s: %s", test_class.name,
+                     test_class.description)
+
+            test = test_class(self.out_dir)
+            try:
+                test.run()
+            except Exception:
+                # Catch all exceptions. This way e.g buggy tests won't scrap
+                # the whole test run
+                sep = '-' * 5 + ' TRACEBACK ' + '-' * 60 + '\n'
+                tb_msg = sep + traceback.format_exc() + sep
+                log.error("Test execution failed with:\n" + tb_msg)
+            self.results['tests'][test.name] = test.results
+
+        self.results['elapsed_time'] = datetime.utcnow() - start_time
+        return 0
+
+
+def perf_test_case(obj):
+    """Decorator for adding test classes"""
+    BuildPerfTestRunner.test_run_queue.append(obj)
+    return obj
+
+
 class BuildPerfTest(object):
     """Base class for build performance tests"""
     SYSRES = 'sysres'
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 9589dee..0a9fc9e 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -18,11 +18,12 @@ import argparse
 import logging
 import os
 import sys
+from datetime import datetime
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
 scriptpath.add_oe_lib_path()
-from oeqa.buildperf import KernelDropCaches
+from oeqa.buildperf import BuildPerfTestRunner, KernelDropCaches
 from oeqa.utils.commands import runCmd
 
 
@@ -75,7 +76,12 @@ def main(argv=None):
     # Check our capability to drop caches and ask pass if needed
     KernelDropCaches.check()
 
-    return 0
+    # Run actual tests
+    out_dir = 'results-{}'.format(datetime.now().strftime('%Y%m%d%H%M%S'))
+    runner = BuildPerfTestRunner(out_dir)
+    ret = runner.run_tests()
+
+    return ret
 
 
 if __name__ == '__main__':
-- 
2.6.6


