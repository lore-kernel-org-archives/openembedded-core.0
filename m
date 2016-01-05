Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 63CE460667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:50:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2016 06:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,525,1444719600"; d="scan'208";a="874991975"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2016 06:50:35 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 51C766A4004;
	Tue,  5 Jan 2016 07:38:32 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:53:34 +0200
Message-Id: <1452005614-4552-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv5] scripts/oe-selftest: Allow to run tests on random/all MACHINEs
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
X-List-Received-Date: Tue, 05 Jan 2016 14:50:34 -0000

Add an option for random MACHINE into oe-selftest:
--machine [random/all]
1. random: will set a random MACHINE for each test
2. all: will run tests for all machines

Custom machine sets only weak default values (??=) for MACHINE in machine.inc.
This let test cases that require a specific MACHINE to be able to
override it, using (?= or =).

e.g.:
oe-selftest --run-tests signing --machine random -->
will run all tests switching MACHINE randomly for each test

oe-selftest --run-tests signing --machine all -->
for each machine will run all tests

oe-selftest --run-all-tests --machine random

Also update oeqa/selftest/base.py to accomodate this feature.

Fix for [YOCTO #5880].

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 64 ++++++++++++++++++++++++++++++++++++++----
 scripts/oe-selftest            | 37 ++++++++++++++++++------
 2 files changed, 86 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 9bddc23..dc93731 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -16,6 +16,8 @@ import errno
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.utils.decorators import LogResults
+from random import choice
+import glob
 
 @LogResults
 class oeSelfTest(unittest.TestCase):
@@ -29,9 +31,10 @@ class oeSelfTest(unittest.TestCase):
         self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
         self.local_bblayers_path = os.path.join(self.builddir, "conf/bblayers.conf")
         self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
+        self.machineinc_path = os.path.join(self.builddir, "conf/machine.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
-        self._track_for_cleanup = [self.testinc_path]
+        self._track_for_cleanup = [self.testinc_path, self.testinc_bblayers_path, self.machineinc_path]
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
@@ -47,11 +50,25 @@ class oeSelfTest(unittest.TestCase):
             for f in files:
                 if f == 'test_recipe.inc':
                     os.remove(os.path.join(root, f))
-        try:
-            os.remove(self.testinc_bblayers_path)
-        except OSError as e:
-            if e.errno != errno.ENOENT:
-                raise
+
+        for incl_file in [self.testinc_bblayers_path, self.machineinc_path]:
+            try:
+                os.remove(incl_file)
+            except OSError as e:
+                if e.errno != errno.ENOENT:
+                    raise
+
+        # Get CUSTOMMACHINE from env (set by --machine argument to oe-selftest)
+        custommachine = os.getenv('CUSTOMMACHINE')
+        if custommachine:
+            if custommachine == 'random':
+                machine = get_random_machine()
+            else:
+                machine = custommachine
+            machine_conf = 'MACHINE ??= "%s"\n' % machine
+            self.set_machine_config(machine_conf)
+            print 'MACHINE: %s' % machine
+
         # tests might need their own setup
         # but if they overwrite this one they have to call
         # super each time, so let's give them an alternative
@@ -99,11 +116,21 @@ class oeSelfTest(unittest.TestCase):
         self.log.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
         ftools.write_file(self.testinc_path, data)
 
+        custommachine = os.getenv('CUSTOMMACHINE')
+        if custommachine and 'MACHINE' in data:
+            machine = get_bb_var('MACHINE')
+            self.log.warning('MACHINE overridden: %s' % machine)
+
     # append to <builddir>/conf/selftest.inc
     def append_config(self, data):
         self.log.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
         ftools.append_file(self.testinc_path, data)
 
+        custommachine = os.getenv('CUSTOMMACHINE')
+        if custommachine and 'MACHINE' in data:
+            machine = get_bb_var('MACHINE')
+            self.log.warning('MACHINE overridden: %s' % machine)
+
     # remove data from <builddir>/conf/selftest.inc
     def remove_config(self, data):
         self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_path, data))
@@ -151,3 +178,28 @@ class oeSelfTest(unittest.TestCase):
     def remove_bblayers_config(self, data):
         self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_bblayers_path, data))
         ftools.remove_from_file(self.testinc_bblayers_path, data)
+
+    # write to <builddir>/conf/machine.inc
+    def set_machine_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.machineinc_path, data))
+        ftools.write_file(self.machineinc_path, data)
+
+
+def get_available_machines():
+    # Get a list of all available machines
+    bbpath = get_bb_var('BBPATH').split(':')
+    machines = []
+
+    for path in bbpath:
+        found_machines = glob.glob(os.path.join(path, 'conf', 'machine', '*.conf'))
+        if found_machines:
+            for i in found_machines:
+                # eg: '/home/<user>/poky/meta-intel/conf/machine/intel-core2-32.conf'
+                machines.append(os.path.splitext(os.path.basename(i))[0])
+
+    return machines
+
+
+def get_random_machine():
+    # Get a random machine
+    return choice(get_available_machines())
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 08a5af3..2ed88ef 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -42,7 +42,7 @@ import argparse_oe
 import oeqa.selftest
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.base import oeSelfTest, get_available_machines
 
 def logger_create():
     log_file = "oe-selftest-" + t.strftime("%Y-%m-%d_%H:%M:%S") + ".log"
@@ -84,6 +84,8 @@ def get_args_parser():
                        help='list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
     group.add_argument('--list-tags', required=False, dest='list_tags', default=False, action="store_true",
                        help='List all tags that have been set to test cases.')
+    parser.add_argument('--machine', required=False, dest='machine', choices=['random', 'all'], default=None,
+                        help='Run tests on different machines (random/all).')
     return parser
 
 
@@ -115,7 +117,7 @@ def add_include():
         not in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
             log.info("Adding: \"include selftest.inc\" in local.conf")
             ftools.append_file(os.path.join(builddir, "conf/local.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude selftest.inc")
+                    "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
 
     if "#include added by oe-selftest.py" \
         not in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
@@ -131,13 +133,13 @@ def remove_include():
         in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
             log.info("Removing the include from local.conf")
             ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
-                    "#include added by oe-selftest.py\ninclude selftest.inc")
+                    "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
 
     if "#include added by oe-selftest.py" \
         in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
             log.info("Removing the include from bblayers.conf")
             ftools.remove_from_file(os.path.join(builddir, "conf/bblayers.conf"), \
-                    "#include added by oe-selftest.py\ninclude bblayers.inc")
+                    "\n#include added by oe-selftest.py\ninclude bblayers.inc")
 
 def remove_inc_files():
     try:
@@ -149,10 +151,11 @@ def remove_inc_files():
     except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
         pass
 
-    try:
-        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/bblayers.inc"))
-    except:
-        pass
+    for incl_file in ['conf/bblayers.inc', 'conf/machine.inc']:
+        try:
+            os.remove(os.path.join(os.environ.get("BUILDDIR"), incl_file))
+        except:
+            pass
 
 def get_tests(exclusive_modules=[], include_hidden=False):
     testslist = []
@@ -472,7 +475,23 @@ def main():
                 log.error(e)
                 return 1
         add_include()
-        result = runner.run(suite)
+
+        if args.machine:
+            # Custom machine sets only weak default values (??=) for MACHINE in machine.inc
+            # This let test cases that require a specific MACHINE to be able to override it, using (?= or =)
+            log.info('Custom machine mode enabled. MACHINE set to %s' % args.machine)
+            if args.machine == 'random':
+                os.environ['CUSTOMMACHINE'] = 'random'
+                result = runner.run(suite)
+            else:  # all
+                machines = get_available_machines()
+                for m in machines:
+                    log.info('Run tests with custom MACHINE set to: %s' % m)
+                    os.environ['CUSTOMMACHINE'] = m
+                    result = runner.run(suite)
+        else:
+            result = runner.run(suite)
+
         log.info("Finished")
 
         if args.coverage:
-- 
2.1.0


