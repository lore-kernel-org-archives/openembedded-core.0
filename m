Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6AE60796
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 23:38:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2015 15:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,471,1444719600"; d="scan'208";a="847422653"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.143])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2015 15:38:13 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 17:36:08 -0600
Message-Id: <1450913768-30308-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] scripts/oe-selftest: Remove extra coverage data added to unittests
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
X-List-Received-Date: Wed, 23 Dec 2015 23:38:15 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Coverage data tracking initiates too early, causing coverage data from the
oe-selftest environment setting to be added to each run. Even when no tests are run
oe-selftest reports around 24% of coverage due to this extra data.

Change the custom resultclass used by the TextTestRunner to one generated from the
command arguments. The generated class processes coverage when needed, running
coverage setup just before the first testcase is run and reporting after the last
one finished.

[Yocto #8846]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 172 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 103 insertions(+), 69 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index bc50b2a..0eb586c 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -342,6 +342,55 @@ def list_tags():
 
     print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
 
+def coverage_setup(run_tests, run_all_tests):
+    """ Set up the coverage measurement for the testcases to be run """
+    builddir = os.environ.get("BUILDDIR")
+    coveragerc = "%s/.coveragerc" % builddir
+    data_file = "%s/.coverage." % builddir
+    data_file += ((run_tests and '.'.join(run_tests)) or
+        (run_all_tests and "all_tests") or "")
+    if os.path.isfile(data_file):
+        os.remove(data_file)
+    with open(coveragerc, 'w') as cps:
+        cps.write("[run]\n")
+        cps.write("data_file = %s\n" % data_file)
+        cps.write("branch = True\n")
+        # Measure just BBLAYERS, scripts and bitbake folders
+        cps.write("source = \n")
+        for layer in get_bb_var('BBLAYERS').split():
+            cps.write("    %s\n" % layer)
+        cps.write("    %s\n" % os.path.dirname(os.path.realpath(__file__)))
+        cps.write("    %s\n" % os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))),'bitbake'))
+
+        return coveragerc
+
+def coverage_report():
+    """ Loads the coverage data gathered and reports it back """
+    try:
+        # Coverage4 uses coverage.Coverage
+        from coverage import Coverage
+    except:
+        # Coverage under version 4 uses coverage.coverage
+        from coverage import coverage as Coverage
+
+    import cStringIO as StringIO
+    from coverage.misc import CoverageException
+
+    cov_output = StringIO.StringIO()
+    # Creating the coverage data with the setting from the configuration file
+    cov = Coverage(config_file = os.environ.get('COVERAGE_PROCESS_START'))
+    try:
+        # Load data from the data file specified in the configuration
+        cov.load()
+        # Store report data in a StringIO variable
+        cov.report(file = cov_output, show_missing=False)
+        log.info("\n%s" % cov_output.getvalue())
+    except CoverageException as e:
+        # Show problems with the reporting. Since Coverage4 not finding  any data to report raises an exception
+        log.warn("%s" % str(e))
+    finally:
+        cov_output.close()
+
 
 def main():
     parser = get_args_parser()
@@ -409,42 +458,6 @@ def main():
         if not preflight_check():
             return 1
 
-        if args.coverage:
-            try:
-                # check if user can do coverage
-                import coverage
-                log.info("Coverage is enabled")
-            except:
-                log.warn(("python coverage is not installed\n",
-                          "Make sure you are also coverage takes into account sub-process\n",
-                          "More info on https://pypi.python.org/pypi/coverage\n"))
-
-            # In case the user has not set the variable COVERAGE_PROCESS_START,
-            # create a default one and export it. The COVERAGE_PROCESS_START
-            # value indicates where the coverage configuration file resides
-            # More info on https://pypi.python.org/pypi/coverage
-            coverage_process_start = os.environ.get('COVERAGE_PROCESS_START')
-            if not coverage_process_start:
-                builddir = os.environ.get("BUILDDIR")
-                coveragerc = "%s/.coveragerc" % builddir
-                data_file = "%s/.coverage." % builddir
-                data_file += ((args.run_tests and ".".join(args.run_tests)) or
-                                  (args.run_all_tests and ".all_tests") or '')
-                if os.path.isfile(data_file):
-                    os.remove(data_file)
-                with open(coveragerc, 'w') as cps:
-                    cps.write("[run]\n")
-                    cps.write("data_file = %s\n" % data_file)
-                    cps.write("branch = True\n")
-                    # Measure just BBLAYERS, scripts and bitbake folders
-                    cps.write("source = \n")
-                    for layer in get_bb_var('BBLAYERS').split():
-                        cps.write("    %s\n" % layer)
-                    cps.write("    %s\n" % os.path.dirname(os.path.realpath(__file__)))
-                    cps.write("    %s\n" % os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))),'bitbake'))
-
-                coverage_process_start = os.environ["COVERAGE_PROCESS_START"] = coveragerc
-
         if args.run_tests_by:
             testslist = ts
         else:
@@ -453,7 +466,7 @@ def main():
         suite = unittest.TestSuite()
         loader = unittest.TestLoader()
         loader.sortTestMethodsUsing = None
-        runner = unittest.TextTestRunner(verbosity=2, resultclass=StampedResult)
+        runner = unittest.TextTestRunner(verbosity=2, resultclass=buildResultClass(args))
         # we need to do this here, otherwise just loading the tests
         # will take 2 minutes (bitbake -e calls)
         oeSelfTest.testlayer_path = get_test_layer()
@@ -469,43 +482,64 @@ def main():
         result = runner.run(suite)
         log.info("Finished")
 
-        if args.coverage:
-            with open(coverage_process_start) as ccf:
-                log.info("Coverage configuration file (%s)" % coverage_process_start)
-                log.info("===========================")
-                log.info("\n%s" % "".join(ccf.readlines()))
-
-            try:
-                # depending on the version, coverage command is named 'python-coverage' or 'coverage',
-                # where the latter is for newer versions
-                coverage_cmd = "python-coverage"
-                subprocess.check_call(coverage_cmd, stderr=subprocess.PIPE, shell=True)
-            except subprocess.CalledProcessError:
-                coverage_cmd = "coverage"
-                pass
-
-            log.info("Coverage Report")
-            log.info("===============")
-            p = subprocess.Popen("%s report" % coverage_cmd, shell=True,
-                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE)
-            cov_output, cov_err = p.communicate()
-            log.info("\n%s" % cov_output)
-
         if result.wasSuccessful():
             return 0
         else:
             return 1
 
-class StampedResult(unittest.TextTestResult):
-    """
-    Custom TestResult that prints the time when a test starts.  As oe-selftest
-    can take a long time (ie a few hours) to run, timestamps help us understand
-    what tests are taking a long time to execute.
-    """
-    def startTest(self, test):
-        import time
-        self.stream.write(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + " - ")
-        super(StampedResult, self).startTest(test)
+def buildResultClass(args):
+    """Build a Result Class to use in the testcase execution"""
+
+    class StampedResult(unittest.TextTestResult):
+        """
+        Custom TestResult that prints the time when a test starts.  As oe-selftest
+        can take a long time (ie a few hours) to run, timestamps help us understand
+        what tests are taking a long time to execute.
+        If coverage is required, this class executes the coverage setup and reporting.
+        """
+        def startTest(self, test):
+            import time
+            self.stream.write(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + " - ")
+            super(StampedResult, self).startTest(test)
+
+        def startTestRun(self):
+            """ Setup coverage before running any testcase """
+            if args.coverage:
+                try:
+                    # check if user can do coverage
+                    import coverage
+                    log.info("Coverage is enabled")
+
+                    # In case the user has not set the variable COVERAGE_PROCESS_START,
+                    # create a default one and export it. The COVERAGE_PROCESS_START
+                    # value indicates where the coverage configuration file resides
+                    # More info on https://pypi.python.org/pypi/coverage
+                    if not os.environ.get('COVERAGE_PROCESS_START'):
+                        os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests)
+
+                    self.coverage_installed = True
+                except:
+                    log.warn('\n'.join(["python coverage is not installed",
+                        "Make sure your coverage takes into account sub-process",
+                        "More info on https://pypi.python.org/pypi/coverage"]))
+                    self.coverage_installed = False
+
+        def stopTestRun(self):
+            """ Report coverage data after the testcases are run """
+
+            if args.coverage and self.coverage_installed:
+                with open(os.environ['COVERAGE_PROCESS_START']) as ccf:
+                    log.info("Coverage configuration file (%s)" % os.environ.get('COVERAGE_PROCESS_START'))
+                    log.info("===========================")
+                    log.info("\n%s" % "".join(ccf.readlines()))
+
+                log.info("Coverage Report")
+                log.info("===============")
+
+                coverage_report()
+
+    return StampedResult
+
 
 if __name__ == "__main__":
     try:
-- 
1.9.1


