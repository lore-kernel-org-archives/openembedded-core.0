Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D27B7741B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 26 Feb 2016 06:37:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="924525605"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2016 06:37:02 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 217A36A4002;
	Fri, 26 Feb 2016 07:24:50 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:44 +0200
Message-Id: <1456497651-23161-2-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 2/9] selftest: Moved coverage functionality from oe-selftest to oeqa/runner.py
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:03 -0000

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/runner.py | 108 +++++++++++++++++++++++++++++++++++++++++++++++-
 scripts/oe-selftest     | 106 +----------------------------------------------
 2 files changed, 108 insertions(+), 106 deletions(-)

diff --git a/meta/lib/oeqa/runner.py b/meta/lib/oeqa/runner.py
index ccb1e3b..5bfd4d1 100644
--- a/meta/lib/oeqa/runner.py
+++ b/meta/lib/oeqa/runner.py
@@ -2,6 +2,7 @@ import os
 import logging
 import sys
 import time
+import unittest
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import bitbake, get_bb_var, get_test_layer
 
@@ -35,7 +36,8 @@ class Runner:
         self.log = self.logger_create(self.caller)
         self.builddir = os.environ.get("BUILDDIR")
 
-    def logger_create(self, log_name):
+    @staticmethod
+    def logger_create(log_name):
         """ Create logger obj with logging file as <log_name-date.log> and symlink to it as <log_name.log> """
 
         log_link = '%s.log' % log_name
@@ -342,3 +344,107 @@ class Runner:
         print 'Looking for:\t %s' % ', '.join(str(x) for x in keyword)
         print 'Total found:\t %s' % len(ts)
 
+    @staticmethod
+    def coverage_setup(run_tests, run_all_tests):
+        """ Set up the coverage measurement for the testcases to be run """
+        builddir = os.environ.get("BUILDDIR")
+        coveragerc = "%s/.coveragerc" % builddir
+        data_file = "%s/.coverage." % builddir
+        data_file += ((run_tests and '.'.join(run_tests)) or (run_all_tests and "all_tests") or "")
+        if os.path.isfile(data_file):
+            os.remove(data_file)
+        with open(coveragerc, 'w') as cps:
+            cps.write("[run]\n")
+            cps.write("data_file = %s\n" % data_file)
+            cps.write("branch = True\n")
+            # Measure just BBLAYERS, scripts and bitbake folders
+            cps.write("source = \n")
+            for layer in get_bb_var('BBLAYERS').split():
+                cps.write("    %s\n" % layer)
+            corebase = get_bb_var('COREBASE')
+            cps.write("    %s\n" % os.path.join(corebase, 'scripts'))
+            cps.write("    %s\n" % os.path.join(corebase, 'bitbake'))
+
+            return coveragerc
+
+    @staticmethod
+    def coverage_report():
+        """ Loads the coverage data gathered and reports it back """
+        try:
+            # Coverage4 uses coverage.Coverage
+            from coverage import Coverage
+        except:
+            # Coverage under version 4 uses coverage.coverage
+            from coverage import coverage as Coverage
+
+        import cStringIO as StringIO
+        from coverage.misc import CoverageException
+
+        cov_output = StringIO.StringIO()
+        # Creating the coverage data with the setting from the configuration file
+        cov = Coverage(config_file=os.environ.get('COVERAGE_PROCESS_START'))
+        try:
+            # Load data from the data file specified in the configuration
+            cov.load()
+            # Store report data in a StringIO variable
+            cov.report(file = cov_output, show_missing=False)
+            print "\n%s" % cov_output.getvalue()
+        except CoverageException as e:
+            # Show problems with the reporting. Since Coverage4 not finding  any data to report raises an exception
+            print "%s" % str(e)
+        finally:
+            cov_output.close()
+
+    @classmethod
+    def buildResultClass(cls, args):
+        """Build a Result Class to use in the testcase execution"""
+
+        class StampedResult(unittest.TextTestResult):
+            """
+            Custom TestResult that prints the time when a test starts.  As oe-selftest
+            can take a long time (ie a few hours) to run, timestamps help us understand
+            what tests are taking a long time to execute.
+            If coverage is required, this class executes the coverage setup and reporting.
+            """
+            def startTest(self, test):
+                import time
+                self.stream.write(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + " - ")
+                super(StampedResult, self).startTest(test)
+
+            def startTestRun(self):
+                """ Setup coverage before running any testcase """
+                if args.coverage:
+                    try:
+                        # check if user can do coverage
+                        import coverage
+                        print "Coverage is enabled"
+
+                        # In case the user has not set the variable COVERAGE_PROCESS_START,
+                        # create a default one and export it. The COVERAGE_PROCESS_START
+                        # value indicates where the coverage configuration file resides
+                        # More info on https://pypi.python.org/pypi/coverage
+                        if not os.environ.get('COVERAGE_PROCESS_START'):
+                            os.environ['COVERAGE_PROCESS_START'] = cls.coverage_setup(args.run_tests, args.run_all_tests)
+
+                        self.coverage_installed = True
+                    except:
+                        print '\n'.join(["python coverage is not installed",
+                                         "Make sure your coverage takes into account sub-process",
+                                         "More info on https://pypi.python.org/pypi/coverage"])
+                        self.coverage_installed = False
+
+            def stopTestRun(self):
+                """ Report coverage data after the testcases are run """
+
+                if args.coverage and self.coverage_installed:
+                    with open(os.environ['COVERAGE_PROCESS_START']) as ccf:
+                        print "Coverage configuration file (%s)" % os.environ.get('COVERAGE_PROCESS_START')
+                        print "==========================="
+                        print "\n%s" % "".join(ccf.readlines())
+
+                    print "Coverage Report"
+                    print "==============="
+
+                    cls.coverage_report()
+
+        return StampedResult
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index b592511..9f71154 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -72,56 +72,6 @@ def get_args_parser():
     return parser
 
 
-def coverage_setup(run_tests, run_all_tests):
-    """ Set up the coverage measurement for the testcases to be run """
-    builddir = os.environ.get("BUILDDIR")
-    coveragerc = "%s/.coveragerc" % builddir
-    data_file = "%s/.coverage." % builddir
-    data_file += ((run_tests and '.'.join(run_tests)) or
-        (run_all_tests and "all_tests") or "")
-    if os.path.isfile(data_file):
-        os.remove(data_file)
-    with open(coveragerc, 'w') as cps:
-        cps.write("[run]\n")
-        cps.write("data_file = %s\n" % data_file)
-        cps.write("branch = True\n")
-        # Measure just BBLAYERS, scripts and bitbake folders
-        cps.write("source = \n")
-        for layer in get_bb_var('BBLAYERS').split():
-            cps.write("    %s\n" % layer)
-        cps.write("    %s\n" % os.path.dirname(os.path.realpath(__file__)))
-        cps.write("    %s\n" % os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))),'bitbake'))
-
-        return coveragerc
-
-def coverage_report():
-    """ Loads the coverage data gathered and reports it back """
-    try:
-        # Coverage4 uses coverage.Coverage
-        from coverage import Coverage
-    except:
-        # Coverage under version 4 uses coverage.coverage
-        from coverage import coverage as Coverage
-
-    import cStringIO as StringIO
-    from coverage.misc import CoverageException
-
-    cov_output = StringIO.StringIO()
-    # Creating the coverage data with the setting from the configuration file
-    cov = Coverage(config_file = os.environ.get('COVERAGE_PROCESS_START'))
-    try:
-        # Load data from the data file specified in the configuration
-        cov.load()
-        # Store report data in a StringIO variable
-        cov.report(file = cov_output, show_missing=False)
-        log.info("\n%s" % cov_output.getvalue())
-    except CoverageException as e:
-        # Show problems with the reporting. Since Coverage4 not finding  any data to report raises an exception
-        log.warn("%s" % str(e))
-    finally:
-        cov_output.close()
-
-
 def main():
     parser = get_args_parser()
     args = parser.parse_args()
@@ -199,7 +149,7 @@ def main():
         suite = unittest.TestSuite()
         loader = unittest.TestLoader()
         loader.sortTestMethodsUsing = None
-        runner = unittest.TextTestRunner(verbosity=2, resultclass=buildResultClass(args))
+        runner = unittest.TextTestRunner(verbosity=2, resultclass=test_runner.buildResultClass(args))
         # we need to do this here, otherwise just loading the tests
         # will take 2 minutes (bitbake -e calls)
         oeSelfTest.testlayer_path = get_test_layer()
@@ -237,60 +187,6 @@ def main():
         else:
             return 1
 
-def buildResultClass(args):
-    """Build a Result Class to use in the testcase execution"""
-
-    class StampedResult(unittest.TextTestResult):
-        """
-        Custom TestResult that prints the time when a test starts.  As oe-selftest
-        can take a long time (ie a few hours) to run, timestamps help us understand
-        what tests are taking a long time to execute.
-        If coverage is required, this class executes the coverage setup and reporting.
-        """
-        def startTest(self, test):
-            import time
-            self.stream.write(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + " - ")
-            super(StampedResult, self).startTest(test)
-
-        def startTestRun(self):
-            """ Setup coverage before running any testcase """
-            if args.coverage:
-                try:
-                    # check if user can do coverage
-                    import coverage
-                    log.info("Coverage is enabled")
-
-                    # In case the user has not set the variable COVERAGE_PROCESS_START,
-                    # create a default one and export it. The COVERAGE_PROCESS_START
-                    # value indicates where the coverage configuration file resides
-                    # More info on https://pypi.python.org/pypi/coverage
-                    if not os.environ.get('COVERAGE_PROCESS_START'):
-                        os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests)
-
-                    self.coverage_installed = True
-                except:
-                    log.warn('\n'.join(["python coverage is not installed",
-                        "Make sure your coverage takes into account sub-process",
-                        "More info on https://pypi.python.org/pypi/coverage"]))
-                    self.coverage_installed = False
-
-        def stopTestRun(self):
-            """ Report coverage data after the testcases are run """
-
-            if args.coverage and self.coverage_installed:
-                with open(os.environ['COVERAGE_PROCESS_START']) as ccf:
-                    log.info("Coverage configuration file (%s)" % os.environ.get('COVERAGE_PROCESS_START'))
-                    log.info("===========================")
-                    log.info("\n%s" % "".join(ccf.readlines()))
-
-                log.info("Coverage Report")
-                log.info("===============")
-
-                coverage_report()
-
-    return StampedResult
-
-
 if __name__ == "__main__":
     try:
         ret = main()
-- 
2.1.0


