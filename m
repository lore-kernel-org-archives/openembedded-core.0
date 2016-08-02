Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1D85A60722
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 20:47:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Aug 2016 13:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,462,1464678000"; d="scan'208";a="743296123"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.26.54])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Aug 2016 13:47:09 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2016 15:49:09 -0500
Message-Id: <1470170949-9224-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH v2] oe-selftest: reorganize syntax to use subcommands
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
X-List-Received-Date: Tue, 02 Aug 2016 20:47:36 -0000

The current syntax of oe-selftest is messy. This patch reorganizes it in a clearer way by grouping all functions in a 'run' subcommand and a 'list' subcommand.

[YOCTO #8938]
---
 scripts/oe-selftest | 362 ++++++++++++++++++++++++++--------------------------
 1 file changed, 184 insertions(+), 178 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 72bf4dd..e0ef0c1 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -84,30 +84,95 @@ def logger_create():
 
 log = logger_create()
 
-def get_args_parser():
-    description = "Script that runs unit tests agains bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
-    parser = argparse_oe.ArgumentParser(description=description)
-    group = parser.add_mutually_exclusive_group(required=True)
-    group.add_argument('-r', '--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None, help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
-    group.add_argument('-a', '--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False, help='Run all (unhidden) tests')
-    group.add_argument('-m', '--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
-    group.add_argument('--list-classes', required=False, action="store_true", dest="list_allclasses", default=False, help='List all available test classes.')
-    parser.add_argument('--coverage', action="store_true", help="Run code coverage when testing")
-    parser.add_argument('--coverage-source', dest="coverage_source", nargs="+", help="Specifiy the directories to take coverage from")
-    parser.add_argument('--coverage-include', dest="coverage_include", nargs="+", help="Specify extra patterns to include into the coverage measurement")
-    parser.add_argument('--coverage-omit', dest="coverage_omit", nargs="+", help="Specify with extra patterns to exclude from the coverage measurement")
-    group.add_argument('--run-tests-by', required=False, dest='run_tests_by', default=False, nargs='*',
-                       help='run-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
-    group.add_argument('--list-tests-by', required=False, dest='list_tests_by', default=False, nargs='*',
-                       help='list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
-    group.add_argument('-l', '--list-tests', required=False,  action="store_true", dest="list_tests", default=False,
-                       help='List all available tests.')
-    group.add_argument('--list-tags', required=False, dest='list_tags', default=False, action="store_true",
-                       help='List all tags that have been set to test cases.')
-    parser.add_argument('--machine', required=False, dest='machine', choices=['random', 'all'], default=None,
-                        help='Run tests on different machines (random/all).')
-    return parser
+def do_run_selftest(args):
+    """ Run tests from selftest """
+    if args.include is not None:
+        ts = sorted([ tc.fullpath for tc in get_testsuite_by(args.include[0],args.include[1])])
+    else:
+        ts = get_modules(exclusive_modules = ( args.tests or []), include_hidden=False)
+    if not ts:
+        return 1
+
+    if not preflight_check():
+        return 1
+
+    suite = unittest.TestSuite()
+    loader = unittest.TestLoader()
+    loader.sortTestMethodsUsing = None
+    runner = TestRunner(verbosity=2,
+            resultclass=buildResultClass(args))
+    # we need to do this here, otherwise just loading the tests
+    # will take 2 minutes (bitbake -e calls)
+    oeSelfTest.testlayer_path = get_test_layer()
+    for tc in ts:
+        log.info("Loading tests from: %s" % tc)
+        try:
+            suite.addTests(loader.loadTestsFromName(tc))
+        except AttributeError as e:
+            log.error("Failed to import %s" % tc)
+            log.error(e)
+            return 1
+    add_include()
+
+    if args.machine:
+        # Custom machine sets only weak default values (??=) for MACHINE in machine.inc
+        # This let test cases that require a specific MACHINE to be able to override it, using (?= or =)
+        log.info('Custom machine mode enabled. MACHINE set to %s' % args.machine)
+        if args.machine == 'random':
+            os.environ['CUSTOMMACHINE'] = 'random'
+            result = runner.run(suite)
+        else:  # all
+            machines = get_available_machines()
+            for m in machines:
+                log.info('Run tests with custom MACHINE set to: %s' % m)
+                os.environ['CUSTOMMACHINE'] = m
+                result = runner.run(suite)
+    else:
+        result = runner.run(suite)
+
+    log.info("Finished")
+
+    if result.wasSuccessful():
+        return 0
+    else:
+        return 1
 
+def do_list_selftest(args):
+    """ List tests from selftest """
+    if args.list_arg == 'tests' or args.list_arg == 'tags':
+        if args.include is not None:
+            ts = get_testsuite_by(args.include[0],args.include[1])
+        else:
+            ts = get_all_tests()
+
+    if args.list_arg == 'tests':
+        list_tests(ts, args.include)
+    elif args.list_arg == 'tags':
+        list_tags(ts)
+    else:
+        log.info('Listing all available test modules:')
+        modulelist = get_modules(include_hidden=True)
+        for full_mod in modulelist:
+            module = full_mod.split('oeqa.selftest.')[-1]
+            info = ''
+            if module.startswith('_'):
+                info = ' (hidden)'
+            print(module + info)
+            if args.list_arg == 'classes':
+                try:
+                    import importlib
+                    modlib = importlib.import_module(full_mod)
+                    for v in vars(modlib):
+                        t = vars(modlib)[v]
+                        if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
+                            print(" --", v)
+                            for method in dir(t):
+                                if method.startswith("test_") and isinstance(vars(t)[method], collections.Callable):
+                                    print(" --  --", method)
+
+                except (AttributeError, ImportError) as e:
+                    print(e)
+                    pass
 
 def preflight_check():
 
@@ -178,6 +243,17 @@ def remove_inc_files():
             pass
 
 
+class Tc:
+    def __init__(self, tcname, tcclass, tcmodule, tcid=None, tctag=None):
+        self.tcname = tcname
+        self.tcclass = tcclass
+        self.tcmodule = tcmodule
+        self.tcid = tcid
+        # A test case can have multiple tags (as tuples) otherwise str will suffice
+        self.tctag = tctag
+        self.fullpath = '.'.join(['oeqa', 'selftest', tcmodule, tcclass, tcname])
+
+
 def get_tests_modules(include_hidden=False):
     modules_list = list()
     for modules_path in oeqa.selftest.__path__:
@@ -195,7 +271,7 @@ def get_tests_modules(include_hidden=False):
     return modules_list
 
 
-def get_tests(exclusive_modules=[], include_hidden=False):
+def get_modules(exclusive_modules=[], include_hidden=False):
     test_modules = list()
     for x in exclusive_modules:
         test_modules.append('oeqa.selftest.' + x)
@@ -205,18 +281,6 @@ def get_tests(exclusive_modules=[], include_hidden=False):
 
     return test_modules
 
-
-class Tc:
-    def __init__(self, tcname, tcclass, tcmodule, tcid=None, tctag=None):
-        self.tcname = tcname
-        self.tcclass = tcclass
-        self.tcmodule = tcmodule
-        self.tcid = tcid
-        # A test case can have multiple tags (as tuples) otherwise str will suffice
-        self.tctag = tctag
-        self.fullpath = '.'.join(['oeqa', 'selftest', tcmodule, tcclass, tcname])
-
-
 def get_tests_from_module(tmod):
     tlist = []
     prefix = 'oeqa.selftest.'
@@ -261,7 +325,7 @@ def get_all_tests():
 
 def get_testsuite_by(criteria, keyword):
     # Get a testsuite based on 'keyword'
-    # criteria: name, class, module, id, tag
+    # criteria: tests, classes, modules, ids, tags
     # keyword: a list of tests, classes, modules, ids, tags
 
     ts = []
@@ -292,23 +356,23 @@ def get_testsuite_by(criteria, keyword):
 
         return result
 
-    if criteria == 'name':
+    if criteria == 'tests':
         names = get_matches([ tc.tcname for tc in all_tests ])
         ts = [ tc for tc in all_tests if tc.tcname in names ]
 
-    elif criteria == 'class':
+    elif criteria == 'classes':
         classes = get_matches([ tc.tcclass for tc in all_tests ])
         ts = [ tc for tc in all_tests if tc.tcclass in classes ]
 
-    elif criteria == 'module':
+    elif criteria == 'modules':
         modules = get_matches([ tc.tcmodule for tc in all_tests ])
         ts = [ tc for tc in all_tests if tc.tcmodule in modules ]
 
-    elif criteria == 'id':
+    elif criteria == 'ids':
         ids = get_matches([ str(tc.tcid) for tc in all_tests ])
         ts = [ tc for tc in all_tests if str(tc.tcid) in ids ]
 
-    elif criteria == 'tag':
+    elif criteria == 'tags':
         values = set()
         for tc in all_tests:
             # tc can have multiple tags (as tuple) otherwise str will suffice
@@ -331,31 +395,8 @@ def get_testsuite_by(criteria, keyword):
 
     return ts
 
-
-def list_testsuite_by(criteria, keyword):
-    # Get a testsuite based on 'keyword'
-    # criteria: name, class, module, id, tag
-    # keyword: a list of tests, classes, modules, ids, tags
-
-    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])
-
-    print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module'))
-    print('_' * 150)
-    for t in ts:
-        if isinstance(t[1], (tuple, list)):
-            print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t[0], ', '.join(t[1]), t[2], t[3], t[4]))
-        else:
-            print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % t)
-    print('_' * 150)
-    print('Filtering by:\t %s' % criteria)
-    print('Looking for:\t %s' % ', '.join(str(x) for x in keyword))
-    print('Total found:\t %s' % len(ts))
-
-
-def list_tests():
-    # List all available oe-selftest tests
-
-    ts = get_all_tests()
+def list_tests(ts, include):
+    # List oe-selftest tests
 
     print('%-4s\t%-10s\t%-50s' % ('id', 'tag', 'test'))
     print('_' * 80)
@@ -365,16 +406,17 @@ def list_tests():
         else:
             print('%-4s\t%-10s\t%-50s' % (t.tcid, t.tctag, '.'.join([t.tcmodule, t.tcclass, t.tcname])))
     print('_' * 80)
+    if include is not None:
+        print('Filtering by:\t %s' % include[0])
+        print('Looking for:\t %s' % ', '.join(str(x) for x in include[1]))
     print('Total found:\t %s' % len(ts))
 
-def list_tags():
-    # Get all tags set to test cases
-    # This is useful when setting tags to test cases
+def list_tags(ts):
+    # Get tags set to test cases. This is useful when setting tags to test cases.
     # The list of tags should be kept as minimal as possible
     tags = set()
-    all_tests = get_all_tests()
 
-    for tc in all_tests:
+    for tc in ts:
         if isinstance(tc.tctag, (tuple, list)):
             tags.update(set(tc.tctag))
         else:
@@ -453,9 +495,77 @@ def coverage_report():
 
 
 def main():
-    parser = get_args_parser()
+
+    description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
+    parser = argparse_oe.ArgumentParser(description=description)
+
+    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
+
+    class IncludeAction(argparse.Action):
+        #def __init__(self, option_strings, dest, nargs=None, **kwargs):
+        #    super(IncludeAction, self).__init__(option_strings, dest, **kwargs)
+        def __call__(self, parser, namespace, values, option_string=None):
+            name = option_string[10:]
+            setattr(namespace, self.dest, (name, values))
+
+    def add_include_args(inc_parser):
+        include_group = inc_parser.add_mutually_exclusive_group()
+        include_group.add_argument('--include-tests', dest='include', nargs = '+', action=IncludeAction,
+                                          help = 'Include from tests that match given pattern')
+        include_group.add_argument('--include-modules', dest='include', nargs = '+', action=IncludeAction,
+                                          help = 'Include from modules that match given pattern')
+        include_group.add_argument('--include-classes', dest='include', nargs = '+', action=IncludeAction,
+                                          help = 'Include from classes that match given pattern')
+        include_group.add_argument('--include-ids', dest='include', nargs = '+', action=IncludeAction,
+                                          help = 'Include from ids that match given pattern')
+        include_group.add_argument('--include-tags', dest='include', nargs = '+', action=IncludeAction,
+                                          help = 'Include from tags that match given pattern')
+
+    run_parser = subparsers.add_parser('run', help='Run a set of tests',
+                                          description='Run a set of tests')
+    run_parser.add_argument('--tests', '-t', nargs='+', help = 'Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
+    add_include_args(run_parser)
+    run_parser.add_argument('--machine', choices = ['random', 'all'],
+                                          help='Run tests on different machines (random/all).')
+    run_parser.add_argument('--coverage', action='store_true', help='Run code coverage when testing')
+    run_parser.add_argument('--coverage-source', dest='coverage_source', nargs='+',
+                                          help='Specify the directories to take coverage from')
+    run_parser.add_argument('--coverage-include', dest='coverage_include', nargs='+',
+                                          help='Specify extra patterns to include into the coverage measurement')
+    run_parser.add_argument('--coverage-omit', dest='coverage_omit', nargs='+',
+                                          help='Specify with extra patterns to exclude from the coverage measurement')
+    run_parser.set_defaults(func=do_run_selftest)
+
+
+    list_parser = subparsers.add_parser('list', help='List a set of tests',
+                                          description='List a set of tests')
+    list_group = list_parser.add_mutually_exclusive_group()
+    list_group.add_argument('--classes', '-c', dest='list_arg', action='store_const', help = 'List classes', const='classes')
+    list_group.add_argument('--modules', '-m', dest='list_arg', action='store_const', help = 'List modules', const='modules')
+    list_group.add_argument('--tags', '-t', dest='list_arg', action='store_const', help = 'List tags', const='tags')
+    add_include_args(list_parser)
+    list_parser.set_defaults(func=do_list_selftest)
+
     args = parser.parse_args()
 
+    if args._subparser_name == 'list':
+
+        args.list_arg = args.list_arg or 'tests'
+        if args.include is not None:
+            if args.list_arg == 'modules' or args.list_arg == 'classes':
+                arg1 = "--%s/-%s" % (args.list_arg, args.list_arg[0])
+                arg2 = "--include-%s" % args.include[0]
+                print("oe-selftest list: error: argument %s: not allowed with argument %s" % (arg1, arg2))
+                list_parser.print_help()
+                return 2
+    elif args._subparser_name == 'run':
+        if args.include is not None and args.tests is not None:
+            inc_arg = "--include-%s" % args.include[0]
+            print("oe-selftest run: error: argument --tests/-t: not allowed with argument %s" % inc_arg)
+            run_parser.print_help()
+            return 2
+
     # Add <layer>/lib to sys.path, so layers can add selftests
     log.info("Running bitbake -e to get BBPATH")
     bbpath = get_bb_var('BBPATH').split(':')
@@ -463,111 +573,7 @@ def main():
     sys.path.extend(layer_libdirs)
     imp.reload(oeqa.selftest)
 
-    if args.run_tests_by and len(args.run_tests_by) >= 2:
-        valid_options = ['name', 'class', 'module', 'id', 'tag']
-        if args.run_tests_by[0] not in valid_options:
-            print('--run-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.run_tests_by[0])
-            return 1
-        else:
-            criteria = args.run_tests_by[0]
-            keyword = args.run_tests_by[1:]
-            ts = sorted([ tc.fullpath for tc in get_testsuite_by(criteria, keyword) ])
-        if not ts:
-            return 1
-
-    if args.list_tests_by and len(args.list_tests_by) >= 2:
-        valid_options = ['name', 'class', 'module', 'id', 'tag']
-        if args.list_tests_by[0] not in valid_options:
-            print('--list-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.list_tests_by[0])
-            return 1
-        else:
-            criteria = args.list_tests_by[0]
-            keyword = args.list_tests_by[1:]
-            list_testsuite_by(criteria, keyword)
-
-    if args.list_tests:
-        list_tests()
-
-    if args.list_tags:
-        list_tags()
-
-    if args.list_allclasses:
-        args.list_modules = True
-
-    if args.list_modules:
-        log.info('Listing all available test modules:')
-        testslist = get_tests(include_hidden=True)
-        for test in testslist:
-            module = test.split('oeqa.selftest.')[-1]
-            info = ''
-            if module.startswith('_'):
-                info = ' (hidden)'
-            print(module + info)
-            if args.list_allclasses:
-                try:
-                    import importlib
-                    modlib = importlib.import_module(test)
-                    for v in vars(modlib):
-                        t = vars(modlib)[v]
-                        if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
-                            print(" --", v)
-                            for method in dir(t):
-                                if method.startswith("test_") and isinstance(vars(t)[method], collections.Callable):
-                                    print(" --  --", method)
-
-                except (AttributeError, ImportError) as e:
-                    print(e)
-                    pass
-
-    if args.run_tests or args.run_all_tests or args.run_tests_by:
-        if not preflight_check():
-            return 1
-
-        if args.run_tests_by:
-            testslist = ts
-        else:
-            testslist = get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
-
-        suite = unittest.TestSuite()
-        loader = unittest.TestLoader()
-        loader.sortTestMethodsUsing = None
-        runner = TestRunner(verbosity=2,
-                resultclass=buildResultClass(args))
-        # we need to do this here, otherwise just loading the tests
-        # will take 2 minutes (bitbake -e calls)
-        oeSelfTest.testlayer_path = get_test_layer()
-        for test in testslist:
-            log.info("Loading tests from: %s" % test)
-            try:
-                suite.addTests(loader.loadTestsFromName(test))
-            except AttributeError as e:
-                log.error("Failed to import %s" % test)
-                log.error(e)
-                return 1
-        add_include()
-
-        if args.machine:
-            # Custom machine sets only weak default values (??=) for MACHINE in machine.inc
-            # This let test cases that require a specific MACHINE to be able to override it, using (?= or =)
-            log.info('Custom machine mode enabled. MACHINE set to %s' % args.machine)
-            if args.machine == 'random':
-                os.environ['CUSTOMMACHINE'] = 'random'
-                result = runner.run(suite)
-            else:  # all
-                machines = get_available_machines()
-                for m in machines:
-                    log.info('Run tests with custom MACHINE set to: %s' % m)
-                    os.environ['CUSTOMMACHINE'] = m
-                    result = runner.run(suite)
-        else:
-            result = runner.run(suite)
-
-        log.info("Finished")
-
-        if result.wasSuccessful():
-            return 0
-        else:
-            return 1
+    ret = args.func(args)
 
 def buildResultClass(args):
     """Build a Result Class to use in the testcase execution"""
-- 
2.4.11


