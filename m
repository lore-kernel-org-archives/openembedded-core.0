Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE6377449
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Feb 2016 06:37:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="895498801"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2016 06:37:03 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 313826A4002;
	Fri, 26 Feb 2016 07:24:52 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:45 +0200
Message-Id: <1456497651-23161-3-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 3/9] selftest: Moved list_classes, list_modules, run methods to runner.py
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
 meta/lib/oeqa/runner.py | 59 ++++++++++++++++++++++++++++++++++++++++++++
 scripts/oe-selftest     | 65 ++++++++++---------------------------------------
 2 files changed, 72 insertions(+), 52 deletions(-)

diff --git a/meta/lib/oeqa/runner.py b/meta/lib/oeqa/runner.py
index 5bfd4d1..e729478 100644
--- a/meta/lib/oeqa/runner.py
+++ b/meta/lib/oeqa/runner.py
@@ -344,6 +344,65 @@ class Runner:
         print 'Looking for:\t %s' % ', '.join(str(x) for x in keyword)
         print 'Total found:\t %s' % len(ts)
 
+    def list_modules(self):
+        """ List all available modules """
+
+        self.log.info('Listing all available test modules:')
+        testslist = self.get_tests(include_hidden=True)
+        for test in testslist:
+            module = test.split('.')[-1]
+            print module + ' (hidden)' if module.startswith('_') else module
+
+    def list_all_classes(self):
+        """ List all tests with their corresponding class and module  (Hierarchy format) """
+
+        testslist = self.get_tests(include_hidden=True)
+        for test in testslist:
+            module = test.split('.')[-1]
+            print module + ' (hidden)' if module.startswith('_') else module
+            try:
+                import importlib
+                modlib = importlib.import_module(test)
+                for v in vars(modlib):
+                    t = vars(modlib)[v]
+                    if isinstance(t, type(self.base_class)) and issubclass(t, self.base_class) and t != self.base_class:
+                        print " --", v
+                        for method in dir(t):
+                            if method.startswith("test_") and callable(vars(t)[method]):
+                                print " --  --", method
+
+            except (AttributeError, ImportError) as e:
+                print e
+                pass
+
+    def run(self, testlist, args):
+        """
+        :param testlist: ['oeqa.selftest.archiver', 'oeqa.selftest.bblayers', ..]
+        :param args: the args the calling script was invoked with (used by coverage)
+        """
+
+        suite = unittest.TestSuite()
+        loader = unittest.TestLoader()
+        loader.sortTestMethodsUsing = None
+        runner = unittest.TextTestRunner(verbosity=2, resultclass=self.buildResultClass(args))
+
+        for test in testlist:
+            self.log.info("Loading tests from: %s" % test)
+            try:
+                suite.addTests(loader.loadTestsFromName(test))
+            except AttributeError as e:
+                self.log.error("Failed to import %s" % test)
+                self.log.error(e)
+                return 1
+
+        result = runner.run(suite)
+        self.log.info("Finished")
+
+        if result.wasSuccessful():
+            return 0
+        else:
+            return 1
+
     @staticmethod
     def coverage_setup(run_tests, run_all_tests):
         """ Set up the coverage measurement for the testcases to be run """
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 9f71154..ba73502 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -27,11 +27,6 @@
 
 import os
 import sys
-import unittest
-import logging
-import argparse
-import subprocess
-import time as t
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -40,8 +35,7 @@ scriptpath.add_oe_lib_path()
 import argparse_oe
 
 import oeqa.selftest
-import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
+from oeqa.utils.commands import get_bb_var, get_test_layer
 from oeqa.selftest.base import oeSelfTest, get_available_machines
 
 from oeqa.runner import Runner
@@ -102,40 +96,23 @@ def main():
             criteria = args.list_tests_by[0]
             keyword = args.list_tests_by[1:]
             test_runner.list_testsuite_by(criteria, keyword)
+            return 0
 
     if args.list_tests:
         test_runner.list_tests()
+        return 0
 
     if args.list_tags:
         test_runner.list_tags()
+        return 0
 
     if args.list_allclasses:
-        args.list_modules = True
+        test_runner.list_all_classes()
+        return 0
 
     if args.list_modules:
-        log.info('Listing all available test modules:')
-        testslist = test_runner.get_tests(include_hidden=True)
-        for test in testslist:
-            module = test.split('.')[-1]
-            info = ''
-            if module.startswith('_'):
-                info = ' (hidden)'
-            print module + info
-            if args.list_allclasses:
-                try:
-                    import importlib
-                    modlib = importlib.import_module(test)
-                    for v in vars(modlib):
-                        t = vars(modlib)[v]
-                        if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
-                            print " --", v
-                            for method in dir(t):
-                                if method.startswith("test_") and callable(vars(t)[method]):
-                                    print " --  --", method
-
-                except (AttributeError, ImportError) as e:
-                    print e
-                    pass
+        test_runner.list_modules()
+        return 0
 
     if args.run_tests or args.run_all_tests or args.run_tests_by:
         if not test_runner.preflight_check():
@@ -146,21 +123,10 @@ def main():
         else:
             testslist = test_runner.get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
 
-        suite = unittest.TestSuite()
-        loader = unittest.TestLoader()
-        loader.sortTestMethodsUsing = None
-        runner = unittest.TextTestRunner(verbosity=2, resultclass=test_runner.buildResultClass(args))
         # we need to do this here, otherwise just loading the tests
         # will take 2 minutes (bitbake -e calls)
         oeSelfTest.testlayer_path = get_test_layer()
-        for test in testslist:
-            log.info("Loading tests from: %s" % test)
-            try:
-                suite.addTests(loader.loadTestsFromName(test))
-            except AttributeError as e:
-                log.error("Failed to import %s" % test)
-                log.error(e)
-                return 1
+
         test_runner.add_include(['machine.inc', 'selftest.inc'], 'local.conf')
         test_runner.add_include('bblayers.inc', 'bblayers.conf')
 
@@ -170,22 +136,17 @@ def main():
             log.info('Custom machine mode enabled. MACHINE set to %s' % args.machine)
             if args.machine == 'random':
                 os.environ['CUSTOMMACHINE'] = 'random'
-                result = runner.run(suite)
+                result = test_runner.run(testslist, args)
             else:  # all
                 machines = get_available_machines()
                 for m in machines:
                     log.info('Run tests with custom MACHINE set to: %s' % m)
                     os.environ['CUSTOMMACHINE'] = m
-                    result = runner.run(suite)
+                    result = test_runner.run(testslist, args)
         else:
-            result = runner.run(suite)
-
-        log.info("Finished")
+            result = test_runner.run(testslist, args)
 
-        if result.wasSuccessful():
-            return 0
-        else:
-            return 1
+        return result
 
 if __name__ == "__main__":
     try:
-- 
2.1.0


