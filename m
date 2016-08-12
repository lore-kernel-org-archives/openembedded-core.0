Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E71F7724B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239497"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:37 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:23 +0300
Message-Id: <1470993086-23718-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 6/9] oe-build-perf-test: use new unittest based framework
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

Convert scripts/oe-build-perf-test to be compatible with the new Python
unittest based buildperf test framework.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 8142b03..786c715 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -21,12 +21,15 @@ import logging
 import os
 import shutil
 import sys
+import unittest
 from datetime import datetime
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
 scriptpath.add_oe_lib_path()
-from oeqa.buildperf import BuildPerfTestRunner, KernelDropCaches
+import oeqa.buildperf
+from oeqa.buildperf import (BuildPerfTestLoader, BuildPerfTestResult,
+                            BuildPerfTestRunner, KernelDropCaches)
 from oeqa.utils.commands import runCmd
 
 
@@ -123,19 +126,23 @@ def main(argv=None):
     # Check our capability to drop caches and ask pass if needed
     KernelDropCaches.check()
 
+    # Load build perf tests
+    loader = BuildPerfTestLoader()
+    suite = loader.discover(start_dir=os.path.dirname(oeqa.buildperf.__file__))
     # Set-up log file
     out_dir = args.out_dir.format(date=datetime.now().strftime('%Y%m%d%H%M%S'))
     setup_file_logging(os.path.join(out_dir, 'output.log'))
 
     # Run actual tests
-    runner = BuildPerfTestRunner(out_dir)
     archive_build_conf(out_dir)
-    ret = runner.run_tests()
-    if not ret:
+    runner = BuildPerfTestRunner(out_dir, verbosity=2)
+    result = runner.run(suite)
+    if result.wasSuccessful():
         if args.globalres_file:
-            runner.update_globalres_file(args.globalres_file)
+            result.update_globalres_file(args.globalres_file)
+        return 0
 
-    return ret
+    return 1
 
 
 if __name__ == '__main__':
-- 
2.6.6


