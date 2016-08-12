Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 330CD7723F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239504"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:38 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:24 +0300
Message-Id: <1470993086-23718-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 7/9] oeqa.buildperf: introduce runCmd2()
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
X-List-Received-Date: Fri, 12 Aug 2016 09:11:48 -0000

Special runCmd() for build perf tests which doesn't raise an
AssertionError when the command fails. This causes command failures to
be detected as test errors instead of test failures. This way "failed"
state of tests is reserved for future making it possible to set e.g.
thresholds for certain measurement results.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py |  3 ++-
 meta/lib/oeqa/buildperf/base.py     | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index 85abf3a..605f429 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -14,5 +14,6 @@ from .base import (BuildPerfTestCase,
                    BuildPerfTestLoader,
                    BuildPerfTestResult,
                    BuildPerfTestRunner,
-                   KernelDropCaches)
+                   KernelDropCaches,
+                   runCmd2)
 from .test_basic import *
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 9711a6a..7ea3183 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -21,6 +21,7 @@ import time
 import traceback
 import unittest
 from datetime import datetime, timedelta
+from functools import partial
 
 from oeqa.utils.commands import runCmd, get_bb_vars
 from oeqa.utils.git import GitError, GitRepo
@@ -28,6 +29,10 @@ from oeqa.utils.git import GitError, GitRepo
 # Get logger for this module
 log = logging.getLogger('build-perf')
 
+# Our own version of runCmd which does not raise AssertErrors which would cause
+# errors to interpreted as failures
+runCmd2 = partial(runCmd, assert_error=False)
+
 
 class KernelDropCaches(object):
     """Container of the functions for dropping kernel caches"""
@@ -39,7 +44,7 @@ class KernelDropCaches(object):
         from getpass import getpass
         from locale import getdefaultlocale
         cmd = ['sudo', '-k', '-n', 'tee', '/proc/sys/vm/drop_caches']
-        ret = runCmd(cmd, ignore_status=True, data=b'0')
+        ret = runCmd2(cmd, ignore_status=True, data=b'0')
         if ret.output.startswith('sudo:'):
             pass_str = getpass(
                 "\nThe script requires sudo access to drop caches between "
@@ -59,7 +64,7 @@ class KernelDropCaches(object):
             input_data = b''
         cmd += ['tee', '/proc/sys/vm/drop_caches']
         input_data += b'3'
-        runCmd(cmd, data=input_data)
+        runCmd2(cmd, data=input_data)
 
 
 def time_cmd(cmd, **kwargs):
@@ -71,7 +76,7 @@ def time_cmd(cmd, **kwargs):
         timecmd += cmd
         # TODO: 'ignore_status' could/should be removed when globalres.log is
         # deprecated. The function would just raise an exception, instead
-        ret = runCmd(timecmd, ignore_status=True, **kwargs)
+        ret = runCmd2(timecmd, ignore_status=True, **kwargs)
         timedata = tmpf.file.read()
     return ret, timedata
 
@@ -213,7 +218,7 @@ class BuildPerfTestCase(unittest.TestCase):
         """Run a command and log it's output"""
         cmd_log = os.path.join(self.out_dir, 'commands.log')
         with open(cmd_log, 'a') as fobj:
-            runCmd(cmd, stdout=fobj)
+            runCmd2(cmd, stdout=fobj)
 
     def measure_cmd_resources(self, cmd, name, legend):
         """Measure system resource usage of a command"""
@@ -261,7 +266,7 @@ class BuildPerfTestCase(unittest.TestCase):
         """Estimate disk usage of a file or directory"""
         # TODO: 'ignore_status' could/should be removed when globalres.log is
         # deprecated. The function would just raise an exception, instead
-        ret = runCmd(['du', '-s', path], ignore_status=True)
+        ret = runCmd2(['du', '-s', path], ignore_status=True)
         if ret.status:
             log.error("du failed, disk usage will be reported as 0")
             size = 0
-- 
2.6.6


