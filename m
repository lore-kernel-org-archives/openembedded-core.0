Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A74F3607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 26 Feb 2016 06:37:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="753776391"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 26 Feb 2016 06:37:01 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id A5F0B6A4002;
	Fri, 26 Feb 2016 07:24:49 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:43 +0200
Message-Id: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/9] selftest: Moved method from oe-selftest to oeqa/runner.py
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:01 -0000

Moved methods to runner and added parameters to them in
order for them to be used by other runners.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/runner.py | 344 ++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/oe-selftest     | 325 +++------------------------------------------
 2 files changed, 359 insertions(+), 310 deletions(-)
 create mode 100644 meta/lib/oeqa/runner.py

diff --git a/meta/lib/oeqa/runner.py b/meta/lib/oeqa/runner.py
new file mode 100644
index 0000000..ccb1e3b
--- /dev/null
+++ b/meta/lib/oeqa/runner.py
@@ -0,0 +1,344 @@
+import os
+import logging
+import sys
+import time
+import oeqa.utils.ftools as ftools
+from oeqa.utils.commands import bitbake, get_bb_var, get_test_layer
+
+
+class Tc:
+    """ Holds information about test cases """
+
+    def __init__(self, tcname, tcclass, tcmodule, tcid=None, tctag=None):
+        self.tcname = tcname
+        self.tcclass = tcclass
+        self.fullpath = '.'.join([tcmodule, tcclass, tcname])
+        # Trim prefix from tcmodule
+        self.tcmodule = tcmodule.split('.')[-1]
+        self.tcid = tcid
+        # A test case can have multiple tags (as tuples) otherwise str will suffice
+        self.tctag = tctag
+
+
+class Runner:
+
+    def __init__(self, caller, base_class, test_mod_dir):
+        """
+        :param caller: eg. selftest, test-recipe (log files will use this name)
+        :param base_class: eg. oeSelfTest, RecipeTests
+        :param test_mod_dir: eg oeqa.selftest, oeqa.recipetests
+        """
+
+        self.caller = caller
+        self.base_class = base_class
+        self.test_mod_dir = test_mod_dir
+        self.log = self.logger_create(self.caller)
+        self.builddir = os.environ.get("BUILDDIR")
+
+    def logger_create(self, log_name):
+        """ Create logger obj with logging file as <log_name-date.log> and symlink to it as <log_name.log> """
+
+        log_link = '%s.log' % log_name
+        log_file = '%s-%s.log' % (log_name, time.strftime("%Y-%m-%d_%H:%M:%S"))
+
+        if os.path.exists(log_link):
+            os.remove(log_link)
+        os.symlink(log_file, log_link)
+
+        log = logging.getLogger(log_name)
+        log.setLevel(logging.DEBUG)
+
+        fh = logging.FileHandler(filename=log_file, mode='w')
+        fh.setLevel(logging.DEBUG)
+
+        ch = logging.StreamHandler(sys.stdout)
+        ch.setLevel(logging.INFO)
+
+        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s', "%Y-%m-%d %H:%M:%S")
+        fh.setFormatter(formatter)
+        ch.setFormatter(formatter)
+
+        log.addHandler(fh)
+        log.addHandler(ch)
+
+        return log
+
+    def preflight_check(self):
+        """ Check that the environment is sourced, meta-selftest included in bblayers and current dir is BUILDDIR """
+
+        self.log.info("Checking that everything is in order before running the tests")
+
+        if not self.builddir:
+            self.log.error("BUILDDIR isn't set. Did you forget to source your build environment setup script?")
+            return False
+
+        if os.getcwd() != self.builddir:
+            self.log.info("Changing cwd to %s" % self.builddir)
+            os.chdir(self.builddir)
+
+        if "meta-selftest" not in get_bb_var("BBLAYERS"):
+            self.log.error("You don't seem to have the meta-selftest layer in BBLAYERS")
+            return False
+
+        self.log.info("Running bitbake -p")
+        bitbake("-p")
+
+        return True
+
+    def add_include(self, include_files, include_to):
+        """ Include in include_to (local.conf, bblayers.conf) the specified files """
+
+        include_msg_header = "# include added by %s\n" % self.caller
+        include_msg = include_msg_header
+        if isinstance(include_files, (list, tuple)):
+            for f in include_files:
+                include_msg += 'include %s\n' % f
+        else:
+            include_msg += 'include %s\n' % include_files
+
+        if include_msg_header not in ftools.read_file(os.path.join(self.builddir, 'conf', include_to)):
+            self.log.info("Adding: %s in %s" % (include_files, include_to))
+            ftools.append_file(os.path.join(self.builddir, 'conf', include_to), include_msg)
+
+    def remove_include(self, remove_files, remove_from):
+        """ Remove from remove_from (local.conf, bblayers.conf) the specified files """
+
+        if self.builddir is None:
+            return
+
+        remove_msg_header = "# include added by %s\n" % self.caller
+        remove_msg = remove_msg_header
+        if isinstance(remove_files, (list, tuple)):
+            for f in remove_files:
+                remove_msg += 'include %s\n' % f
+        else:
+            remove_msg += 'include %s\n' % remove_files
+
+        if remove_msg_header in ftools.read_file(os.path.join(self.builddir, 'conf', remove_from)):
+            self.log.info("Removing the include from %s" % remove_from)
+            ftools.remove_from_file(os.path.join(self.builddir, 'conf', remove_from), remove_msg)
+
+    def remove_inc_files(self, remove_inc_list):
+        """ Remove remove_inc_list from BUILDDIR/conf/ """
+
+        # Also remove the test_recipe.inc if available
+        try:
+            for root, _, files in os.walk(get_test_layer()):
+                pass
+            for f in files:
+                if f == 'test_recipe.inc':
+                    os.remove(os.path.join(root, f))
+        except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
+            pass
+
+        # log.info('Removing: %s' % remove_inc_list)
+        for incl_file in remove_inc_list:
+            try:
+                os.remove(os.path.join(self.builddir, 'conf', incl_file))
+            except:
+                pass
+
+    # FIXME: this method duplicates some of the code. Keep it here for now
+    def get_tests(self, exclusive_modules=[], include_hidden=False):
+        testslist = []
+        prefix = self.test_mod_dir.__name__
+        for x in exclusive_modules:
+            testslist.append('.'.join([prefix, x]))
+        if not testslist:
+            for testpath in self.test_mod_dir.__path__:
+                files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not
+                                include_hidden) and not f.startswith('__') and f != 'base.py'])
+                for f in files:
+                    module = '.'.join([prefix, os.path.splitext(f)[0]])
+                    if module not in testslist:
+                        testslist.append(module)
+
+        return testslist
+
+    def get_tests_from_module(self, tmod):
+        """ Get a list of Tcs from module extending the base_class """
+
+        tlist = []
+
+        try:
+            import importlib
+            modlib = importlib.import_module(tmod)
+            for mod in vars(modlib).values():
+                if isinstance(mod, type(self.base_class)) and issubclass(mod, self.base_class) and mod is not self.base_class:
+                    for test in dir(mod):
+                        if test.startswith('test_') and hasattr(vars(mod)[test], '__call__'):
+                            # Get test case id and feature tag
+                            # NOTE: if testcase decorator or feature tag are not set it will throw an error
+                            try:
+                                tid = vars(mod)[test].test_case
+                            except:
+                                print 'DEBUG: tc id missing for ' + str(test)
+                                tid = None
+                            try:
+                                ttag = vars(mod)[test].tag__feature
+                            except:
+                                # print 'DEBUG: feature tag missing for ' + str(test)
+                                ttag = None
+
+                            tlist.append(Tc(test, mod.__name__, mod.__module__, tid, ttag))
+        except:
+            pass
+
+        return tlist
+
+    def get_all_tests(self):
+        """ Get all test from test_mod_dir (eg. oeqa.selftest) that extends base_class (eg. oeSelfTest)"""
+
+        tmodules = set()
+        testlist = []
+        prefix = self.test_mod_dir.__name__
+
+        # Get all the test modules (except the hidden ones)
+        for tpath in self.test_mod_dir.__path__:
+            files = sorted([f for f in os.listdir(tpath) if f.endswith('.py') and not
+                            f.startswith(('_', '__')) and f != 'base.py'])
+            for f in files:
+                tmodules.add('.'.join([prefix, os.path.splitext(f)[0]]))
+
+        # Get all the tests from modules
+        tmodules = sorted(list(tmodules))
+
+        for tmod in tmodules:
+            testlist += self.get_tests_from_module(tmod)
+
+        return testlist
+
+    def list_tests(self):
+        """ List all available tests """
+
+        ts = self.get_all_tests()
+
+        print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
+        print '_' * 150
+        for t in ts:
+            if isinstance(t.tctag, (tuple, list)):
+                print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, ', '.join(t.tctag), t.tcname, t.tcclass, t.tcmodule)
+            else:
+                print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, t.tctag, t.tcname, t.tcclass, t.tcmodule)
+        print '_' * 150
+        print 'Total found:\t %s' % len(ts)
+
+    def list_tags(self):
+        """
+        Get all tags set to test cases
+        Note: This is useful when setting tags to test cases
+        Note: The list of tags should be kept as minimal as possible
+        """
+
+        tags = set()
+        all_tests = self.get_all_tests()
+
+        for tc in all_tests:
+            if isinstance(tc.tctag, (tuple, list)):
+                tags.update(set(tc.tctag))
+            else:
+                tags.add(tc.tctag)
+
+        print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
+
+    def get_testsuite_by(self, criteria, keyword):
+        """
+        Get a testsuite based on 'keyword'
+        :param criteria: name, class, module, id, tag
+        :param keyword: a list of tests, classes, modules, ids, tags
+        """
+        ts = set()
+        all_tests = self.get_all_tests()
+
+        if criteria == 'name':
+            for tc in all_tests:
+                if tc.tcname in keyword:
+                    ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+
+        elif criteria == 'class':
+            for tc in all_tests:
+                if tc.tcclass in keyword:
+                    ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+
+        elif criteria == 'module':
+            for tc in all_tests:
+                if tc.tcmodule in keyword:
+                    ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+        elif criteria == 'id':
+            for tc in all_tests:
+                if str(tc.tcid) in keyword:
+                    ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+        elif criteria == 'tag':
+            for tc in all_tests:
+                # tc can have multiple tags (as list or tuple) otherwise as str
+                if isinstance(tc.tctag, (list, tuple)):
+                    for tag in tc.tctag:
+                        if str(tag) in keyword:
+                            ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+                elif str(tc.tctag) in keyword:
+                    ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+
+        return sorted(list(ts))
+
+    # NOTE: I would probably merge create_testsuite_by and get_testsuite_by into one method
+    def create_testsuite_by(self, criteria, keyword):
+        """
+        Create a testsuite based on 'keyword'
+        :param criteria: name, class, module, id, tag
+        :param keyword: a list of tests, classes, modules, ids, tags
+        """
+
+        ts = set()
+        all_tests = self.get_all_tests()
+
+        if criteria == 'name':
+            for tc in all_tests:
+                if tc.tcname in keyword:
+                    ts.add(tc.fullpath)
+
+        elif criteria == 'class':
+            for tc in all_tests:
+                if tc.tcclass in keyword:
+                    ts.add(tc.fullpath)
+
+        elif criteria == 'module':
+            for tc in all_tests:
+                if tc.tcmodule in keyword:
+                    ts.add(tc.fullpath)
+        elif criteria == 'id':
+            for tc in all_tests:
+                if str(tc.tcid) in keyword:
+                    ts.add(tc.fullpath)
+        elif criteria == 'tag':
+            for tc in all_tests:
+                # tc can have multiple tags (as list or tuple) otherwise as str
+                if isinstance(tc.tctag, (list, tuple)):
+                    for tag in tc.tctag:
+                        if str(tag) in keyword:
+                            ts.add(tc.fullpath)
+                elif tc.tctag in keyword:
+                    ts.add(tc.fullpath)
+
+        return sorted(list(ts))
+
+    def list_testsuite_by(self, criteria, keyword):
+        """
+        List a testsuite based on 'keyword'
+        :param criteria: name, class, module, id, tag
+        :param keyword: a list of tests, classes, modules, ids, tags
+        """
+
+        ts = self.get_testsuite_by(criteria, keyword)
+
+        print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
+        print '_' * 150
+        for t in ts:
+            if isinstance(t[1], (tuple, list)):
+                print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t[0], ', '.join(t[1]), t[2], t[3], t[4])
+            else:
+                print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % t
+        print '_' * 150
+        print 'Filtering by:\t %s' % criteria
+        print 'Looking for:\t %s' % ', '.join(str(x) for x in keyword)
+        print 'Total found:\t %s' % len(ts)
+
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 4eb404b..b592511 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -44,30 +44,11 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
 from oeqa.selftest.base import oeSelfTest, get_available_machines
 
-def logger_create():
-    log_file = "oe-selftest-" + t.strftime("%Y-%m-%d_%H:%M:%S") + ".log"
-    if os.path.exists("oe-selftest.log"): os.remove("oe-selftest.log")
-    os.symlink(log_file, "oe-selftest.log")
+from oeqa.runner import Runner
 
-    log = logging.getLogger("selftest")
-    log.setLevel(logging.DEBUG)
+test_runner = Runner('selftest', oeSelfTest, oeqa.selftest)
+log = test_runner.log
 
-    fh = logging.FileHandler(filename=log_file, mode='w')
-    fh.setLevel(logging.DEBUG)
-
-    ch = logging.StreamHandler(sys.stdout)
-    ch.setLevel(logging.INFO)
-
-    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
-    fh.setFormatter(formatter)
-    ch.setFormatter(formatter)
-
-    log.addHandler(fh)
-    log.addHandler(ch)
-
-    return log
-
-log = logger_create()
 
 def get_args_parser():
     description = "Script that runs unit tests agains bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
@@ -91,284 +72,6 @@ def get_args_parser():
     return parser
 
 
-def preflight_check():
-
-    log.info("Checking that everything is in order before running the tests")
-
-    if not os.environ.get("BUILDDIR"):
-        log.error("BUILDDIR isn't set. Did you forget to source your build environment setup script?")
-        return False
-
-    builddir = os.environ.get("BUILDDIR")
-    if os.getcwd() != builddir:
-        log.info("Changing cwd to %s" % builddir)
-        os.chdir(builddir)
-
-    if not "meta-selftest" in get_bb_var("BBLAYERS"):
-        log.error("You don't seem to have the meta-selftest layer in BBLAYERS")
-        return False
-
-    log.info("Running bitbake -p")
-    runCmd("bitbake -p")
-
-    return True
-
-def add_include():
-    builddir = os.environ.get("BUILDDIR")
-    if "#include added by oe-selftest.py" \
-        not in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
-            log.info("Adding: \"include selftest.inc\" in local.conf")
-            ftools.append_file(os.path.join(builddir, "conf/local.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
-
-    if "#include added by oe-selftest.py" \
-        not in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
-            log.info("Adding: \"include bblayers.inc\" in bblayers.conf")
-            ftools.append_file(os.path.join(builddir, "conf/bblayers.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude bblayers.inc")
-
-def remove_include():
-    builddir = os.environ.get("BUILDDIR")
-    if builddir is None:
-        return
-    if "#include added by oe-selftest.py" \
-        in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
-            log.info("Removing the include from local.conf")
-            ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
-
-    if "#include added by oe-selftest.py" \
-        in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
-            log.info("Removing the include from bblayers.conf")
-            ftools.remove_from_file(os.path.join(builddir, "conf/bblayers.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude bblayers.inc")
-
-def remove_inc_files():
-    try:
-        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/selftest.inc"))
-        for root, _, files in os.walk(get_test_layer()):
-            for f in files:
-                if f == 'test_recipe.inc':
-                    os.remove(os.path.join(root, f))
-    except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
-        pass
-
-    for incl_file in ['conf/bblayers.inc', 'conf/machine.inc']:
-        try:
-            os.remove(os.path.join(os.environ.get("BUILDDIR"), incl_file))
-        except:
-            pass
-
-def get_tests(exclusive_modules=[], include_hidden=False):
-    testslist = []
-    for x in exclusive_modules:
-        testslist.append('oeqa.selftest.' + x)
-    if not testslist:
-        for testpath in oeqa.selftest.__path__:
-            files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
-            for f in files:
-                module = 'oeqa.selftest.' + f[:-3]
-                if module not in testslist:
-                    testslist.append(module)
-
-    return testslist
-
-
-class Tc:
-    def __init__(self, tcname, tcclass, tcmodule, tcid=None, tctag=None):
-        self.tcname = tcname
-        self.tcclass = tcclass
-        self.tcmodule = tcmodule
-        self.tcid = tcid
-        # A test case can have multiple tags (as list or as tuples) otherwise str suffice
-        self.tctag = tctag
-        self.fullpath = '.'.join(['oeqa', 'selftest', tcmodule, tcclass, tcname])
-
-
-def get_tests_from_module(tmod):
-    tlist = []
-    prefix = 'oeqa.selftest.'
-
-    try:
-        import importlib
-        modlib = importlib.import_module(tmod)
-        for mod in vars(modlib).values():
-            if isinstance(mod, type(oeSelfTest)) and issubclass(mod, oeSelfTest) and mod is not oeSelfTest:
-                for test in dir(mod):
-                    if test.startswith('test_') and hasattr(vars(mod)[test], '__call__'):
-                        # Get test case id and feature tag
-                        # NOTE: if testcase decorator or feature tag not set will throw error
-                        try:
-                            tid = vars(mod)[test].test_case
-                        except:
-                            print 'DEBUG: tc id missing for ' + str(test)
-                            tid = None
-                        try:
-                            ttag = vars(mod)[test].tag__feature
-                        except:
-                            # print 'DEBUG: feature tag missing for ' + str(test)
-                            ttag = None
-
-                        # NOTE: for some reason lstrip() doesn't work for mod.__module__
-                        tlist.append(Tc(test, mod.__name__, mod.__module__.replace(prefix, ''), tid, ttag))
-    except:
-        pass
-
-    return tlist
-
-
-def get_all_tests():
-    tmodules = set()
-    testlist = []
-    prefix = 'oeqa.selftest.'
-
-    # Get all the test modules (except the hidden ones)
-    for tpath in oeqa.selftest.__path__:
-        files = sorted([f for f in os.listdir(tpath) if f.endswith('.py') and not
-                        f.startswith(('_', '__')) and f != 'base.py'])
-        for f in files:
-            tmodules.add(prefix + f.rstrip('.py'))
-
-    # Get all the tests from modules
-    tmodules = sorted(list(tmodules))
-
-    for tmod in tmodules:
-        testlist += get_tests_from_module(tmod)
-
-    return testlist
-
-
-def create_testsuite_by(criteria, keyword):
-    # Create a testsuite based on 'keyword'
-    # criteria: name, class, module, id, tag
-    # keyword: a list of tests, classes, modules, ids, tags
-    # NOTE: globing would be nice?
-
-    ts = set()
-    all_tests = get_all_tests()
-
-    if criteria == 'name':
-        for tc in all_tests:
-            if tc.tcname in keyword:
-                ts.add(tc.fullpath)
-
-    elif criteria == 'class':
-        for tc in all_tests:
-            if tc.tcclass in keyword:
-                ts.add(tc.fullpath)
-
-    elif criteria == 'module':
-        for tc in all_tests:
-            if tc.tcmodule in keyword:
-                ts.add(tc.fullpath)
-    elif criteria == 'id':
-        for tc in all_tests:
-            if str(tc.tcid) in keyword:
-                ts.add(tc.fullpath)
-    elif criteria == 'tag':
-        for tc in all_tests:
-            # tc can have multiple tags (as list or tuple) otherwise as str
-            if isinstance(tc.tctag, (list, tuple)):
-                for tag in tc.tctag:
-                    if str(tag) in keyword:
-                        ts.add(tc.fullpath)
-            elif tc.tctag in keyword:
-                ts.add(tc.fullpath)
-
-    return sorted(list(ts))
-
-
-def get_testsuite_by(criteria, keyword):
-    # Get a testsuite based on 'keyword'
-    # criteria: name, class, module, id, tag
-    # keyword: a list of tests, classes, modules, ids, tags
-    # NOTE: globing would be nice?
-    ts = set()
-    all_tests = get_all_tests()
-
-    if criteria == 'name':
-        for tc in all_tests:
-            if tc.tcname in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
-
-    elif criteria == 'class':
-        for tc in all_tests:
-            if tc.tcclass in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
-
-    elif criteria == 'module':
-        for tc in all_tests:
-            if tc.tcmodule in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
-    elif criteria == 'id':
-        for tc in all_tests:
-            if str(tc.tcid) in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
-    elif criteria == 'tag':
-        for tc in all_tests:
-            # tc can have multiple tags (as list or tuple) otherwise as str
-            if isinstance(tc.tctag, (list, tuple)):
-                for tag in tc.tctag:
-                    if str(tag) in keyword:
-                        ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
-            elif str(tc.tctag) in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
-
-    return sorted(list(ts))
-
-
-def list_testsuite_by(criteria, keyword):
-    # Get a testsuite based on 'keyword'
-    # criteria: name, class, module, id, tag
-    # keyword: a list of tests, classes, modules, ids, tags
-    # NOTE: globing would be nice?
-
-    ts = get_testsuite_by(criteria, keyword)
-
-    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
-    print '_' * 150
-    for t in ts:
-        if isinstance(t[1], (tuple, list)):
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t[0], ', '.join(t[1]), t[2], t[3], t[4])
-        else:
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % t
-    print '_' * 150
-    print 'Filtering by:\t %s' % criteria
-    print 'Looking for:\t %s' % ', '.join(str(x) for x in keyword)
-    print 'Total found:\t %s' % len(ts)
-
-
-def list_tests():
-    # List all available oe-selftest tests
-
-    ts = get_all_tests()
-
-    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
-    print '_' * 150
-    for t in ts:
-        if isinstance(t.tctag, (tuple, list)):
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, ', '.join(t.tctag), t.tcname, t.tcclass, t.tcmodule)
-        else:
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, t.tctag, t.tcname, t.tcclass, t.tcmodule)
-    print '_' * 150
-    print 'Total found:\t %s' % len(ts)
-
-
-def list_tags():
-    # Get all tags set to test cases
-    # This is useful when setting tags to test cases
-    # The list of tags should be kept as minimal as possible
-    tags = set()
-    all_tests = get_all_tests()
-
-    for tc in all_tests:
-        if isinstance(tc.tctag, (tuple, list)):
-            tags.update(set(tc.tctag))
-        else:
-            tags.add(tc.tctag)
-
-    print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
-
 def coverage_setup(run_tests, run_all_tests):
     """ Set up the coverage measurement for the testcases to be run """
     builddir = os.environ.get("BUILDDIR")
@@ -438,7 +141,7 @@ def main():
         else:
             criteria = args.run_tests_by[0]
             keyword = args.run_tests_by[1:]
-            ts = create_testsuite_by(criteria, keyword)
+            ts = test_runner.create_testsuite_by(criteria, keyword)
 
     if args.list_tests_by and len(args.list_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
@@ -448,20 +151,20 @@ def main():
         else:
             criteria = args.list_tests_by[0]
             keyword = args.list_tests_by[1:]
-            list_testsuite_by(criteria, keyword)
+            test_runner.list_testsuite_by(criteria, keyword)
 
     if args.list_tests:
-        list_tests()
+        test_runner.list_tests()
 
     if args.list_tags:
-        list_tags()
+        test_runner.list_tags()
 
     if args.list_allclasses:
         args.list_modules = True
 
     if args.list_modules:
         log.info('Listing all available test modules:')
-        testslist = get_tests(include_hidden=True)
+        testslist = test_runner.get_tests(include_hidden=True)
         for test in testslist:
             module = test.split('.')[-1]
             info = ''
@@ -485,13 +188,13 @@ def main():
                     pass
 
     if args.run_tests or args.run_all_tests or args.run_tests_by:
-        if not preflight_check():
+        if not test_runner.preflight_check():
             return 1
 
         if args.run_tests_by:
             testslist = ts
         else:
-            testslist = get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
+            testslist = test_runner.get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
 
         suite = unittest.TestSuite()
         loader = unittest.TestLoader()
@@ -508,7 +211,8 @@ def main():
                 log.error("Failed to import %s" % test)
                 log.error(e)
                 return 1
-        add_include()
+        test_runner.add_include(['machine.inc', 'selftest.inc'], 'local.conf')
+        test_runner.add_include('bblayers.inc', 'bblayers.conf')
 
         if args.machine:
             # Custom machine sets only weak default values (??=) for MACHINE in machine.inc
@@ -595,6 +299,7 @@ if __name__ == "__main__":
         import traceback
         traceback.print_exc(5)
     finally:
-        remove_include()
-        remove_inc_files()
+        test_runner.remove_include(['machine.inc', 'selftest.inc'], 'local.conf')
+        test_runner.remove_include('bblayers.inc', 'bblayers.conf')
+        test_runner.remove_inc_files(['selftest.inc', 'machine.inc', 'bblayers.inc'])
     sys.exit(ret)
-- 
2.1.0


