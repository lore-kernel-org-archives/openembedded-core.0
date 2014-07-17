Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EEC556ACD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:05:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2014 06:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,678,1400050800"; d="scan'208";a="563196294"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2014 06:05:53 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 8710B6A4087;
	Thu, 17 Jul 2014 06:05:19 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 18:10:43 +0300
Message-Id: <1405609843-17942-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] scripts/oe-selftest: add command-line parsing and options
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
X-List-Received-Date: Thu, 17 Jul 2014 13:05:56 -0000

[YOCTO #6453]

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 scripts/oe-selftest | 81 +++++++++++++++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 28 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 8c4ea92..2332b22 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -29,6 +29,7 @@ import os
 import sys
 import unittest
 import logging
+import argparse
 
 sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'meta/lib')))
 
@@ -58,6 +59,16 @@ def logger_create():
 
 log = logger_create()
 
+def get_args_parser():
+    description = "Script that runs unit tests agains bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
+    parser = argparse.ArgumentParser(description=description)
+    group = parser.add_mutually_exclusive_group(required=True)
+    group.add_argument('--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None, help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
+    group.add_argument('--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False, help='Run all (unhidden) tests')
+    group.add_argument('--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
+    return parser
+
+
 def preflight_check():
 
     log.info("Checking that everything is in order before running the tests")
@@ -108,13 +119,13 @@ def remove_inc_files():
     except OSError as e:
         pass
 
-def get_tests():
+def get_tests(exclusive_modules=[], include_hidden=False):
     testslist = []
-    for x in sys.argv[1:]:
+    for x in exclusive_modules:
         testslist.append('oeqa.selftest.' + x)
     if not testslist:
         testpath = os.path.abspath(os.path.dirname(oeqa.selftest.__file__))
-        files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not f.startswith('_') and f != 'base.py'])
+        files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
         for f in files:
             module = 'oeqa.selftest.' + f[:-3]
             testslist.append(module)
@@ -122,32 +133,46 @@ def get_tests():
     return testslist
 
 def main():
-    if not preflight_check():
-        return 1
-
-    testslist = get_tests()
-    suite = unittest.TestSuite()
-    loader = unittest.TestLoader()
-    loader.sortTestMethodsUsing = None
-    runner = unittest.TextTestRunner(verbosity=2)
-    # we need to do this here, otherwise just loading the tests
-    # will take 2 minutes (bitbake -e calls)
-    oeSelfTest.testlayer_path = get_test_layer()
-    for test in testslist:
-        log.info("Loading tests from: %s" % test)
-        try:
-            suite.addTests(loader.loadTestsFromName(test))
-        except AttributeError as e:
-            log.error("Failed to import %s" % test)
-            log.error(e)
+    parser = get_args_parser()
+    args = parser.parse_args()
+
+    if args.list_modules:
+        log.info('Listing all available test modules:')
+        testslist = get_tests(include_hidden=True)
+        for test in testslist:
+            module = test.split('.')[-1]
+            info = ''
+            if module.startswith('_'):
+                info = ' (hidden)'
+            print module + info
+
+    if args.run_tests or args.run_all_tests:
+        if not preflight_check():
+            return 1
+
+        testslist = get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
+        suite = unittest.TestSuite()
+        loader = unittest.TestLoader()
+        loader.sortTestMethodsUsing = None
+        runner = unittest.TextTestRunner(verbosity=2)
+        # we need to do this here, otherwise just loading the tests
+        # will take 2 minutes (bitbake -e calls)
+        oeSelfTest.testlayer_path = get_test_layer()
+        for test in testslist:
+            log.info("Loading tests from: %s" % test)
+            try:
+                suite.addTests(loader.loadTestsFromName(test))
+            except AttributeError as e:
+                log.error("Failed to import %s" % test)
+                log.error(e)
+                return 1
+        add_include()
+        result = runner.run(suite)
+        log.info("Finished")
+        if result.wasSuccessful():
+            return 0
+        else:
             return 1
-    add_include()
-    result = runner.run(suite)
-    log.info("Finished")
-    if result.wasSuccessful():
-        return 0
-    else:
-        return 1
 
 if __name__ == "__main__":
     try:
-- 
1.8.3.2


