Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5D96A71B86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:36 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885992"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:46 +1300
Message-Id: <2eea6a65b009e9d47c03b7d82d2699f88228fc62.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/14] oe-selftest: add basic tinfoil tests
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:36 -0000

Add some tests to verify that the new tinfoil API is operating
correctly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/tinfoil.py | 146 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/tinfoil.py

diff --git a/meta/lib/oeqa/selftest/tinfoil.py b/meta/lib/oeqa/selftest/tinfoil.py
new file mode 100644
index 0000000..4f70e0d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/tinfoil.py
@@ -0,0 +1,146 @@
+import unittest
+import os
+import re
+import bb.tinfoil
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, get_bb_var
+from oeqa.utils.decorators import testcase
+
+class TinfoilTests(oeSelfTest):
+    """ Basic tests for the tinfoil API """
+
+    def test_getvar(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(True)
+            machine = tinfoil.config_data.getVar('MACHINE', True)
+            if not machine:
+                self.fail('Unable to get MACHINE value - returned %s' % machine)
+
+    def test_expand(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(True)
+            expr = '${@os.getpid()}'
+            pid = tinfoil.config_data.expand(expr)
+            if not pid:
+                self.fail('Unable to expand "%s" - returned %s' % (expr, pid))
+
+    def test_getvar_bb_origenv(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(True)
+            origenv = tinfoil.config_data.getVar('BB_ORIGENV', False)
+            if not origenv:
+                self.fail('Unable to get BB_ORIGENV value - returned %s' % origenv)
+            self.assertEqual(origenv.getVar('HOME', False), os.environ['HOME'])
+
+    def test_parse_recipe(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            testrecipe = 'mdadm'
+            best = tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecipe)
+            rd = tinfoil.parse_recipe_file(best[3])
+            self.assertEqual(testrecipe, rd.getVar('PN', True))
+
+    def test_parse_recipe_copy_expand(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            testrecipe = 'mdadm'
+            best = tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecipe)
+            rd = tinfoil.parse_recipe_file(best[3])
+            # Check we can get variable values
+            self.assertEqual(testrecipe, rd.getVar('PN', True))
+            # Check that expanding a value that includes a variable reference works
+            self.assertEqual(testrecipe, rd.getVar('BPN', True))
+            # Now check that changing the referenced variable's value in a copy gives that
+            # value when expanding
+            localdata = bb.data.createCopy(rd)
+            localdata.setVar('PN', 'hello')
+            self.assertEqual('hello', localdata.getVar('BPN', True))
+
+    def test_parse_recipe_initial_datastore(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            testrecipe = 'mdadm'
+            best = tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecipe)
+            dcopy = bb.data.createCopy(tinfoil.config_data)
+            dcopy.setVar('MYVARIABLE', 'somevalue')
+            rd = tinfoil.parse_recipe_file(best[3], config_data=dcopy)
+            # Check we can get variable values
+            self.assertEqual('somevalue', rd.getVar('MYVARIABLE', True))
+
+    def test_list_recipes(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            # Check pkg_pn
+            checkpns = ['tar', 'automake', 'coreutils', 'm4-native', 'nativesdk-gcc']
+            pkg_pn = tinfoil.cooker.recipecaches[''].pkg_pn
+            for pn in checkpns:
+                self.assertIn(pn, pkg_pn)
+            # Check pkg_fn
+            checkfns = {'nativesdk-gcc': '^virtual:nativesdk:.*', 'coreutils': '.*/coreutils_.*.bb'}
+            for fn, pn in tinfoil.cooker.recipecaches[''].pkg_fn.items():
+                if pn in checkpns:
+                    if pn in checkfns:
+                        self.assertTrue(re.match(checkfns[pn], fn), 'Entry for %s: %s did not match %s' % (pn, fn, checkfns[pn]))
+                    checkpns.remove(pn)
+            if checkpns:
+                self.fail('Unable to find pkg_fn entries for: %s' % ', '.join(checkpns))
+
+    def test_wait_event(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=True)
+            # Need to drain events otherwise events that will be masked will still be in the queue
+            while tinfoil.wait_event(0.25):
+                pass
+            tinfoil.set_event_mask(['bb.event.FilesMatchingFound', 'bb.command.CommandCompleted'])
+            pattern = 'conf'
+            res = tinfoil.run_command('findFilesMatchingInDir', pattern, 'conf/machine')
+            self.assertTrue(res)
+
+            eventreceived = False
+            waitcount = 5
+            while waitcount > 0:
+                event = tinfoil.wait_event(1)
+                if event:
+                    if isinstance(event, bb.command.CommandCompleted):
+                        break
+                    elif isinstance(event, bb.event.FilesMatchingFound):
+                        self.assertEqual(pattern, event._pattern)
+                        self.assertIn('qemuarm.conf', event._matches)
+                        eventreceived = True
+                    else:
+                        self.fail('Unexpected event: %s' % event)
+
+                waitcount = waitcount - 1
+
+            self.assertNotEqual(waitcount, 0, 'Timed out waiting for CommandCompleted event from bitbake server')
+            self.assertTrue(eventreceived, 'Did not receive FilesMatchingFound event from bitbake server')
+
+    def test_setvariable_clean(self):
+        # First check that setVariable affects the datastore
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=True)
+            tinfoil.run_command('setVariable', 'TESTVAR', 'specialvalue')
+            self.assertEqual(tinfoil.config_data.getVar('TESTVAR', True), 'specialvalue', 'Value set using setVariable is not reflected in client-side getVar()')
+
+        # Now check that the setVariable's effects are no longer present
+        # (this may legitimately break in future if we stop reinitialising
+        # the datastore, in which case we'll have to reconsider use of
+        # setVariable entirely)
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=True)
+            self.assertNotEqual(tinfoil.config_data.getVar('TESTVAR', True), 'specialvalue', 'Value set using setVariable is still present!')
+
+        # Now check that setVar on the main datastore works (uses setVariable internally)
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=True)
+            tinfoil.config_data.setVar('TESTVAR', 'specialvalue')
+            value = tinfoil.run_command('getVariable', 'TESTVAR')
+            self.assertEqual(value, 'specialvalue', 'Value set using config_data.setVar() is not reflected in config_data.getVar()')
+
-- 
2.5.5


