Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA0E60722
	for <openembedded-core@openembedded.org>;
	Thu, 21 Jul 2016 20:03:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2016 13:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,400,1464678000"; d="scan'208";a="1026595597"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2016 13:03:36 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu, 21 Jul 2016 12:02:05 +0000
Message-Id: <1469102526-48920-2-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1469102526-48920-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1469102526-48920-1-git-send-email-benjamin.esquivel@linux.intel.com>
Subject: [PATCH 1/2] oe-selftest: export test results via xmlrunner
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
X-List-Received-Date: Thu, 21 Jul 2016 20:03:42 -0000

if available, use the xmlrunner for exporting the test results to a
dir named the same than the log where the text results are stored.
this means creating a dir with the name of the log (without the .log)
and dumping there the xml files that indicate the results of each of
the tests.

if xmlrunner is not available then it will behave the same as before,
no xml exports.

[YOCTO#9682]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 scripts/oe-selftest | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 303b1d5..3188a41 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -48,8 +48,19 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
 from oeqa.selftest.base import oeSelfTest, get_available_machines
 
+try:
+    import xmlrunner
+    from xmlrunner.result import _XMLTestResult as TestResult
+    from xmlrunner import XMLTestRunner as _TestRunner
+except ImportError:
+    # use the base runner instead
+    from unittest import TextTestResult as TestResult
+    from unittest import TextTestRunner as _TestRunner
+
+log_prefix = "oe-selftest-" + t.strftime("%Y-%m-%d_%H:%M:%S")
+
 def logger_create():
-    log_file = "oe-selftest-" + t.strftime("%Y-%m-%d_%H:%M:%S") + ".log"
+    log_file = log_prefix + ".log"
     if os.path.exists("oe-selftest.log"): os.remove("oe-selftest.log")
     os.symlink(log_file, "oe-selftest.log")
 
@@ -520,7 +531,8 @@ def main():
         suite = unittest.TestSuite()
         loader = unittest.TestLoader()
         loader.sortTestMethodsUsing = None
-        runner = unittest.TextTestRunner(verbosity=2, resultclass=buildResultClass(args))
+        runner = TestRunner(verbosity=2,
+                resultclass=buildResultClass(args))
         # we need to do this here, otherwise just loading the tests
         # will take 2 minutes (bitbake -e calls)
         oeSelfTest.testlayer_path = get_test_layer()
@@ -561,7 +573,7 @@ def buildResultClass(args):
     """Build a Result Class to use in the testcase execution"""
     import site
 
-    class StampedResult(unittest.TextTestResult):
+    class StampedResult(TestResult):
         """
         Custom TestResult that prints the time when a test starts.  As oe-selftest
         can take a long time (ie a few hours) to run, timestamps help us understand
@@ -631,6 +643,21 @@ def buildResultClass(args):
 
     return StampedResult
 
+class TestRunner(_TestRunner):
+    """Test runner class aware of exporting tests."""
+    def __init__(self, *args, **kwargs):
+        try:
+            exportdir = os.path.join(os.getcwd(), log_prefix)
+            kwargsx = dict(**kwargs)
+            # argument specific to XMLTestRunner, if adding a new runner then
+            # also add logic to use other runner's args.
+            kwargsx['output'] = exportdir
+            kwargsx['descriptions'] = False
+            # done for the case where telling the runner where to export
+            super(TestRunner, self).__init__(*args, **kwargsx)
+        except TypeError:
+            log.info("test runner init'ed like unittest")
+            super(TestRunner, self).__init__(*args, **kwargs)
 
 if __name__ == "__main__":
     try:
-- 
2.5.1


