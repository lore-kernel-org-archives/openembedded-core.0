Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEA47318C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:35:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2015 06:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875715481"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 06:35:39 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id F3E136A4087;
	Thu, 17 Dec 2015 07:23:39 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 16:38:19 +0200
Message-Id: <1450363100-17478-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv3 1/2] scripts/oe-selftest: Allow to run tests on random/all architecture
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
X-List-Received-Date: Thu, 17 Dec 2015 14:35:42 -0000

Add an option for random arch into oe-selftest:
--arch [random/all]
1. random: will set a random MACHINE for each test
2. all: will run tests for all architectures

Custom arch sets only weak default values (??=) for MACHINE in local.conf.
This let test cases that require a specific MACHINE to be able to
override it, using (?= or =).

e.g.:
oe-selftest --run-tests signing --arch random -->
will run all tests switching MACHINE randomly for each test

oe-selftest --run-tests signing --arch all -->
for each arch will run all tests

oe-selftest --run-all-tests --arch random

Also update oeqa/selftest/base.py to accomodate this feature.

Fix for [YOCTO #5880].

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 49 ++++++++++++++++++++++++++++++++++++------
 scripts/oe-selftest            | 34 +++++++++++++++++++++++------
 2 files changed, 70 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 9bddc23..d71bbbd 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -16,6 +16,7 @@ import errno
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.utils.decorators import LogResults
+from random import choice
 
 @LogResults
 class oeSelfTest(unittest.TestCase):
@@ -29,9 +30,12 @@ class oeSelfTest(unittest.TestCase):
         self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
         self.local_bblayers_path = os.path.join(self.builddir, "conf/bblayers.conf")
         self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
+        self.archinc_path = os.path.join(self.builddir, "conf/arch.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
-        self._track_for_cleanup = [self.testinc_path]
+        self._track_for_cleanup = [self.testinc_path, self.testinc_bblayers_path, self.archinc_path]
+        self.arch_list = ['qemuarm', 'qemuarm64', 'qemumips', 'qemuppc', 'qemux86', 'qemux86-64',
+                          'beaglebone', 'genericx86', 'genericx86-64', 'mpc8315e-rdb', 'edgerouter']
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
@@ -47,11 +51,25 @@ class oeSelfTest(unittest.TestCase):
             for f in files:
                 if f == 'test_recipe.inc':
                     os.remove(os.path.join(root, f))
-        try:
-            os.remove(self.testinc_bblayers_path)
-        except OSError as e:
-            if e.errno != errno.ENOENT:
-                raise
+
+        for incl_file in [self.testinc_bblayers_path, self.archinc_path]:
+            try:
+                os.remove(incl_file)
+            except OSError as e:
+                if e.errno != errno.ENOENT:
+                    raise
+
+        # Get CUSTOMARCH from env (set by --arch argument to oe-selftest)
+        customarch = os.getenv('CUSTOMARCH')
+        if customarch:
+            if customarch == 'random':
+                machine = self.get_random_arch()
+            else:
+                machine = customarch
+            arch_conf = 'MACHINE ??= "%s"\n' % machine
+            self.set_arch_config(arch_conf)
+            print 'Arch: %s' % machine
+
         # tests might need their own setup
         # but if they overwrite this one they have to call
         # super each time, so let's give them an alternative
@@ -99,11 +117,21 @@ class oeSelfTest(unittest.TestCase):
         self.log.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
         ftools.write_file(self.testinc_path, data)
 
+        customarch = os.getenv('CUSTOMARCH')
+        if customarch and 'MACHINE' in data:
+            machine = get_bb_var('MACHINE')
+            self.log.warning('Arch overridden: %s' % machine)
+
     # append to <builddir>/conf/selftest.inc
     def append_config(self, data):
         self.log.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
         ftools.append_file(self.testinc_path, data)
 
+        customarch = os.getenv('CUSTOMARCH')
+        if customarch and 'MACHINE' in data:
+            machine = get_bb_var('MACHINE')
+            self.log.warning('Arch overridden: %s' % machine)
+
     # remove data from <builddir>/conf/selftest.inc
     def remove_config(self, data):
         self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_path, data))
@@ -151,3 +179,12 @@ class oeSelfTest(unittest.TestCase):
     def remove_bblayers_config(self, data):
         self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_bblayers_path, data))
         ftools.remove_from_file(self.testinc_bblayers_path, data)
+
+    def get_random_arch(self):
+        # Return a random arch from the arch_list
+        return choice(self.arch_list)
+
+    # write to <builddir>/conf/arch.inc
+    def set_arch_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.archinc_path, data))
+        ftools.write_file(self.archinc_path, data)
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index bc50b2a..8a3df19 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -78,6 +78,8 @@ def get_args_parser():
                        help='list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
     group.add_argument('--list-tags', required=False, dest='list_tags', default=False, action="store_true",
                        help='List all tags that have been set to test cases.')
+    parser.add_argument('--arch', required=False, dest='arch', choices=['random', 'all'], default=None,
+                        help='Run tests on different architecture (random/all).')
     return parser
 
 
@@ -109,7 +111,7 @@ def add_include():
         not in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
             log.info("Adding: \"include selftest.inc\" in local.conf")
             ftools.append_file(os.path.join(builddir, "conf/local.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude selftest.inc")
+                    "\n#include added by oe-selftest.py\ninclude selftest.inc\ninclude arch.inc")
 
     if "#include added by oe-selftest.py" \
         not in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
@@ -125,7 +127,7 @@ def remove_include():
         in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
             log.info("Removing the include from local.conf")
             ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
-                    "#include added by oe-selftest.py\ninclude selftest.inc")
+                    "#include added by oe-selftest.py\ninclude selftest.inc\ninclude arch.inc")
 
     if "#include added by oe-selftest.py" \
         in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
@@ -143,10 +145,11 @@ def remove_inc_files():
     except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
         pass
 
-    try:
-        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/bblayers.inc"))
-    except:
-        pass
+    for incl_file in ['conf/bblayers.inc', 'conf/arch.inc']:
+        try:
+            os.remove(os.path.join(os.environ.get("BUILDDIR"), incl_file))
+        except:
+            pass
 
 def get_tests(exclusive_modules=[], include_hidden=False):
     testslist = []
@@ -466,7 +469,24 @@ def main():
                 log.error(e)
                 return 1
         add_include()
-        result = runner.run(suite)
+
+        if args.arch:
+            # Custom arch sets only weak default values (??=) for MACHINE in local.conf
+            # This let test cases that require a specific MACHINE to be able to override it, using (?= or =)
+            log.info('Custom arch mode enabled. Arch set to %s' % args.arch)
+            if args.arch == 'random':
+                os.environ['CUSTOMARCH'] = 'random'
+                result = runner.run(suite)
+            else:  # all
+                arch_list = ['qemuarm', 'qemuarm64', 'qemumips', 'qemuppc', 'qemux86', 'qemux86-64',
+                             'beaglebone', 'genericx86', 'genericx86-64', 'mpc8315e-rdb', 'edgerouter']
+                for arch in arch_list:
+                    log.info('Run tests with custom arch set to: %s' % arch)
+                    os.environ['CUSTOMARCH'] = arch
+                    result = runner.run(suite)
+        else:
+            result = runner.run(suite)
+
         log.info("Finished")
 
         if args.coverage:
-- 
2.1.0


