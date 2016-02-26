Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D6F4F7743E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 26 Feb 2016 06:37:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="55311300"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 26 Feb 2016 06:37:06 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 7A37D6A4002;
	Fri, 26 Feb 2016 07:24:54 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:47 +0200
Message-Id: <1456497651-23161-5-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 5/9] scripts: test-recipe Tool for running tests on recipes
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:15 -0000

It shares many functionality with oe-selftest.
It requires an aditional argument --recipe <recipe>
in order to know on which recipe to test against.

Test recipes should be located at:
meta/lib/oeqa/recipetests/

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/test-recipe | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100755 scripts/test-recipe

diff --git a/scripts/test-recipe b/scripts/test-recipe
new file mode 100755
index 0000000..3fe80a5
--- /dev/null
+++ b/scripts/test-recipe
@@ -0,0 +1,168 @@
+#!/usr/bin/env python
+
+# Copyright (c) 2016, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION: Will run recipe tests on each provided recipe.
+#
+# USAGE: recipe-test --recipes <recipe> --run-all-tests
+#
+# OPTIONS: --recipes <recipe1>
+#          --list-tests
+#          --list-tests-by <criteria> <keyword>
+#          --run-all-tests
+#          --run-tests-by <criteria> <keyword>
+#
+# NOTE: tests are located in lib/oeqa/recipetests
+#
+# AUTHOR: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+#
+
+
+import sys
+import os
+import unittest
+
+sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+scriptpath.add_oe_lib_path()
+import argparse_oe
+
+import oeqa.recipetests
+from oeqa.utils.commands import get_test_layer, get_bb_var, bitbake, is_recipe_valid
+from oeqa.selftest.base import oeSelfTest
+from oeqa.recipetests.base import RecipeTests
+
+from oeqa.runner import Runner
+
+test_runner = Runner('test-recipe', RecipeTests, oeqa.recipetests)
+log = test_runner.log
+
+
+def get_args_parser():
+    description = 'Will run recipe tests on provided recipe.'
+    parser = argparse_oe.ArgumentParser(description=description)
+    group = parser.add_mutually_exclusive_group(required=True)
+    group.add_argument('--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None,
+                       help='Select what tests to run (modules, classes or test methods). '
+                            'Format should be: <module>.<class>.<test_method>')
+    group.add_argument('--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False,
+                       help='Run all (unhidden) tests')
+    group.add_argument('--list-modules', required=False, action="store_true", dest="list_modules", default=False,
+                       help='List all available test modules.')
+    group.add_argument('--list-classes', required=False, action="store_true", dest="list_allclasses", default=False,
+                       help='List all available test classes.')
+    parser.add_argument('--coverage', action="store_true", help="Run code coverage when testing")
+    group.add_argument('--run-tests-by', required=False, dest='run_tests_by', default=False, nargs='*',
+                       help='run-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
+    group.add_argument('--list-tests-by', required=False, dest='list_tests_by', default=False, nargs='*',
+                       help='list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
+    group.add_argument('--list-tests', required=False,  action="store_true", dest="list_tests", default=False,
+                       help='List all available tests.')
+    group.add_argument('--list-tags', required=False, dest='list_tags', default=False, action="store_true",
+                       help='List all tags that have been set to test cases.')
+    parser.add_argument('-r', '--recipes', nargs='+', default=False, dest='recipes', 
+                        help='recipe(s) to run tests against.')
+    return parser
+
+
+def main():
+    parser = get_args_parser()
+    args = parser.parse_args()
+
+    if args.list_tests:
+        test_runner.list_tests()
+        return 0
+
+    if args.list_tags:
+        test_runner.list_tags()
+        return 0
+
+    if args.list_allclasses:
+        test_runner.list_all_classes()
+        return 0
+
+    if args.list_modules:
+        test_runner.list_modules()
+        return 0
+
+    if args.list_tests_by and len(args.list_tests_by) >= 2:
+        valid_options = ['name', 'class', 'module', 'id', 'tag']
+        if args.list_tests_by[0] not in valid_options:
+            print '--list-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.list_tests_by[0]
+            return 1
+        else:
+            criteria = args.list_tests_by[0]
+            keyword = args.list_tests_by[1:]
+            test_runner.list_testsuite_by(criteria, keyword)
+            return 0
+
+    if args.run_tests_by and len(args.run_tests_by) >= 2:
+        valid_options = ['name', 'class', 'module', 'id', 'tag']
+        if args.run_tests_by[0] not in valid_options:
+            print '--run-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.run_tests_by[0]
+            return 1
+        else:
+            criteria = args.run_tests_by[0]
+            keyword = args.run_tests_by[1:]
+            ts = test_runner.create_testsuite_by(criteria, keyword)
+
+    if not ((args.run_tests or args.run_all_tests or args.run_tests_by) and args.recipes):
+        print 'Please specify the recipe(s) to tests against ( -r or --recipes).'
+        return 1
+
+    # Do we want to be able to test multiple recipes?
+    if not is_recipe_valid(args.recipes[0]):
+        print '"%s" is not a valid recipe. Make sure it shows up in "bitbake -s". Check your spelling.' % args.recipes[0]
+        return 1
+
+    if args.run_tests or args.run_all_tests or args.run_tests_by:
+        if not test_runner.preflight_check():
+            return 1
+
+        os.environ['TESTRECIPE'] = args.recipes[0]
+        log.info('Running tests for recipe "%s" ...' % args.recipes[0])
+
+        if args.run_tests_by:
+            testslist = ts
+        else:
+            testslist = test_runner.get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
+
+        # we need to do this here, otherwise just loading the tests
+        # will take 2 minutes (bitbake -e calls)
+        oeSelfTest.testlayer_path = get_test_layer()
+
+        test_runner.add_include(['required.inc', 'testrecipe.inc'], 'local.conf')
+        test_runner.add_include('bblayers.inc', 'bblayers.conf')
+
+        result = test_runner.run(testslist, args)
+
+        return result
+
+if __name__ == '__main__':
+
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    finally:
+        test_runner.remove_include(['required.inc', 'testrecipe.inc'], 'local.conf')
+        test_runner.remove_include('bblayers.inc', 'bblayers.conf')
+        test_runner.remove_inc_files(['testrecipe.inc', 'required.inc', 'bblayers.inc'])
+    sys.exit(ret)
-- 
2.1.0


