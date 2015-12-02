Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 91AEA60616
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 14:38:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Dec 2015 06:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,373,1444719600"; d="scan'208";a="611309654"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2015 06:38:27 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id CF8506A4005;
	Wed,  2 Dec 2015 06:37:17 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 16:40:53 +0200
Message-Id: <1449067253-25056-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] scripts: oe-selftest Added new features.
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
X-List-Received-Date: Wed, 02 Dec 2015 14:38:28 -0000

[YOCTO #8750] Allow oe-selftest to run custom test suites based on different criteria

1. Can run custom lists of tests based on different criteria:
   --run-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>
   eg: --run-tests-by module imagefeatures signing recipetool
       --run-tests-by id 1377 1273 935
       --run-tests-by tag wic sstate bitbake
2. Can list tests based on different criteria:
   --list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>
   eg: --list-tests-by module imagefeatures signing recipetool
       --list-tests-by id 1377 1273 935
       --list-tests-by tag wic sstate bitbake
3. Can list all tags that have been set to test cases:
   --list-tags
   The list of tags should be kept as minimal as possible.
   This helps preview the tags used so far.

   To take advantage of the 'tag' feature:
   - add @tag(feature=<>) to testcases
   eg: @tag(feature='signing') for a single tag
       @tag(feature=(('signing', 'sstate')) or
       @tag(feature=['signing', 'sstate']) for multiple tags

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/oe-selftest | 218 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 216 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 9679962..bc50b2a 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -72,6 +72,12 @@ def get_args_parser():
     group.add_argument('--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
     group.add_argument('--list-classes', required=False, action="store_true", dest="list_allclasses", default=False, help='List all available test classes.')
     parser.add_argument('--coverage', action="store_true", help="Run code coverage when testing")
+    group.add_argument('--run-tests-by', required=False, dest='run_tests_by', default=False, nargs='*',
+                       help='run-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
+    group.add_argument('--list-tests-by', required=False, dest='list_tests_by', default=False, nargs='*',
+                       help='list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
+    group.add_argument('--list-tags', required=False, dest='list_tags', default=False, action="store_true",
+                       help='List all tags that have been set to test cases.')
     return parser
 
 
@@ -156,6 +162,187 @@ def get_tests(exclusive_modules=[], include_hidden=False):
 
     return testslist
 
+
+class Tc:
+    def __init__(self, tcname, tcclass, tcmodule, tcid=None, tctag=None):
+        self.tcname = tcname
+        self.tcclass = tcclass
+        self.tcmodule = tcmodule
+        self.tcid = tcid
+        # A test case can have multiple tags (as list or as tuples) otherwise str suffice
+        self.tctag = tctag
+        self.fullpath = '.'.join(['oeqa', 'selftest', tcmodule, tcclass, tcname])
+
+
+def get_tests_from_module(tmod):
+    tlist = []
+    prefix = 'oeqa.selftest.'
+
+    try:
+        import importlib
+        modlib = importlib.import_module(tmod)
+        for mod in vars(modlib).values():
+            if isinstance(mod, type(oeSelfTest)) and issubclass(mod, oeSelfTest) and mod is not oeSelfTest:
+                for test in dir(mod):
+                    if test.startswith('test_') and hasattr(vars(mod)[test], '__call__'):
+                        # Get test case id and feature tag
+                        # NOTE: if testcase decorator or feature tag not set will throw error
+                        try:
+                            tid = vars(mod)[test].test_case
+                        except:
+                            print 'DEBUG: tc id missing for ' + str(test)
+                            tid = None
+                        try:
+                            ttag = vars(mod)[test].tag__feature
+                        except:
+                            # print 'DEBUG: feature tag missing for ' + str(test)
+                            ttag = None
+
+                        # NOTE: for some reason lstrip() doesn't work for mod.__module__
+                        tlist.append(Tc(test, mod.__name__, mod.__module__.replace(prefix, ''), tid, ttag))
+    except:
+        pass
+
+    return tlist
+
+
+def get_all_tests():
+    tmodules = set()
+    testlist = []
+    prefix = 'oeqa.selftest.'
+
+    # Get all the test modules (except the hidden ones)
+    for tpath in oeqa.selftest.__path__:
+        files = sorted([f for f in os.listdir(tpath) if f.endswith('.py') and not
+                        f.startswith(('_', '__')) and f != 'base.py'])
+        for f in files:
+            tmodules.add(prefix + f.rstrip('.py'))
+
+    # Get all the tests from modules
+    tmodules = sorted(list(tmodules))
+
+    for tmod in tmodules:
+        testlist += get_tests_from_module(tmod)
+
+    return testlist
+
+
+def create_testsuite_by(criteria, keyword):
+    # Create a testsuite based on 'keyword'
+    # criteria: name, class, module, id, tag
+    # keyword: a list of tests, classes, modules, ids, tags
+    # NOTE: globing would be nice?
+
+    ts = set()
+    all_tests = get_all_tests()
+
+    if criteria == 'name':
+        for tc in all_tests:
+            if tc.tcname in keyword:
+                ts.add(tc.fullpath)
+
+    elif criteria == 'class':
+        for tc in all_tests:
+            if tc.tcclass in keyword:
+                ts.add(tc.fullpath)
+
+    elif criteria == 'module':
+        for tc in all_tests:
+            if tc.tcmodule in keyword:
+                ts.add(tc.fullpath)
+    elif criteria == 'id':
+        for tc in all_tests:
+            if str(tc.tcid) in keyword:
+                ts.add(tc.fullpath)
+    elif criteria == 'tag':
+        for tc in all_tests:
+            # tc can have multiple tags (as list or tuple) otherwise as str
+            if isinstance(tc.tctag, (list, tuple)):
+                for tag in tc.tctag:
+                    if str(tag) in keyword:
+                        ts.add(tc.fullpath)
+            elif tc.tctag in keyword:
+                ts.add(tc.fullpath)
+
+    return sorted(list(ts))
+
+
+def get_testsuite_by(criteria, keyword):
+    # Get a testsuite based on 'keyword'
+    # criteria: name, class, module, id, tag
+    # keyword: a list of tests, classes, modules, ids, tags
+    # NOTE: globing would be nice?
+    ts = set()
+    all_tests = get_all_tests()
+
+    if criteria == 'name':
+        for tc in all_tests:
+            if tc.tcname in keyword:
+                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+
+    elif criteria == 'class':
+        for tc in all_tests:
+            if tc.tcclass in keyword:
+                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+
+    elif criteria == 'module':
+        for tc in all_tests:
+            if tc.tcmodule in keyword:
+                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+    elif criteria == 'id':
+        for tc in all_tests:
+            if str(tc.tcid) in keyword:
+                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+    elif criteria == 'tag':
+        for tc in all_tests:
+            # tc can have multiple tags (as list or tuple) otherwise as str
+            if isinstance(tc.tctag, (list, tuple)):
+                for tag in tc.tctag:
+                    if str(tag) in keyword:
+                        ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+            elif str(tc.tctag) in keyword:
+                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+
+    return sorted(list(ts))
+
+
+def list_testsuite_by(criteria, keyword):
+    # Get a testsuite based on 'keyword'
+    # criteria: name, class, module, id, tag
+    # keyword: a list of tests, classes, modules, ids, tags
+    # NOTE: globing would be nice?
+
+    ts = get_testsuite_by(criteria, keyword)
+
+    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
+    print '_' * 150
+    for t in ts:
+        if isinstance(t[1], (tuple, list)):
+            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t[0], ', '.join(t[1]), t[2], t[3], t[4])
+        else:
+            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % t
+    print '_' * 150
+    print 'Filtering by:\t %s' % criteria
+    print 'Looking for:\t %s' % ', '.join(str(x) for x in keyword)
+    print 'Total found:\t %s' % len(ts)
+
+
+def list_tags():
+    # Get all tags set to test cases
+    # This is useful when setting tags to test cases
+    # The list of tags should be kept as minimal as possible
+    tags = set()
+    all_tests = get_all_tests()
+
+    for tc in all_tests:
+        if isinstance(tc.tctag, (tuple, list)):
+            tags.update(set(tc.tctag))
+        else:
+            tags.add(tc.tctag)
+
+    print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
+
+
 def main():
     parser = get_args_parser()
     args = parser.parse_args()
@@ -167,6 +354,29 @@ def main():
     sys.path.extend(layer_libdirs)
     reload(oeqa.selftest)
 
+    if args.run_tests_by and len(args.run_tests_by) >= 2:
+        valid_options = ['name', 'class', 'module', 'id', 'tag']
+        if args.run_tests_by[0] not in valid_options:
+            print '--run-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.run_tests_by[0]
+            return 1
+        else:
+            criteria = args.run_tests_by[0]
+            keyword = args.run_tests_by[1:]
+            ts = create_testsuite_by(criteria, keyword)
+
+    if args.list_tests_by and len(args.list_tests_by) >= 2:
+        valid_options = ['name', 'class', 'module', 'id', 'tag']
+        if args.list_tests_by[0] not in valid_options:
+            print '--list-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.list_tests_by[0]
+            return 1
+        else:
+            criteria = args.list_tests_by[0]
+            keyword = args.list_tests_by[1:]
+            list_testsuite_by(criteria, keyword)
+
+    if args.list_tags:
+        list_tags()
+
     if args.list_allclasses:
         args.list_modules = True
 
@@ -195,7 +405,7 @@ def main():
                     print e
                     pass
 
-    if args.run_tests or args.run_all_tests:
+    if args.run_tests or args.run_all_tests or args.run_tests_by:
         if not preflight_check():
             return 1
 
@@ -235,7 +445,11 @@ def main():
 
                 coverage_process_start = os.environ["COVERAGE_PROCESS_START"] = coveragerc
 
-        testslist = get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
+        if args.run_tests_by:
+            testslist = ts
+        else:
+            testslist = get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
+
         suite = unittest.TestSuite()
         loader = unittest.TestLoader()
         loader.sortTestMethodsUsing = None
-- 
2.1.0


