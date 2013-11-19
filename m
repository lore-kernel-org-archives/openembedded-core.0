Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 176EA6AD6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 15:43:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Nov 2013 07:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,729,1378882800"; d="scan'208";a="430301139"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2013 07:43:03 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id ABE0F6A4009
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 07:43:01 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:43:36 +0200
Message-Id: <3a0d1807859e8ea3f5ac39f5626743d25b91e740.1384874570.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 3/4] scripts/lib/selftest: add a new module for bitbake output tests
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
X-List-Received-Date: Tue, 19 Nov 2013 15:43:02 -0000

From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>

Tests for bitbake-layers and expected output for some bitbake options.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/lib/selftest/tests/__init__.py |  1 +
 scripts/lib/selftest/tests/bboutput.py | 86 ++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 scripts/lib/selftest/tests/bboutput.py

diff --git a/scripts/lib/selftest/tests/__init__.py b/scripts/lib/selftest/tests/__init__.py
index e69de29..3acc480 100644
--- a/scripts/lib/selftest/tests/__init__.py
+++ b/scripts/lib/selftest/tests/__init__.py
@@ -0,0 +1 @@
+from selftest.tests.bboutput import *
diff --git a/scripts/lib/selftest/tests/bboutput.py b/scripts/lib/selftest/tests/bboutput.py
new file mode 100644
index 0000000..386572f
--- /dev/null
+++ b/scripts/lib/selftest/tests/bboutput.py
@@ -0,0 +1,86 @@
+import unittest
+import os
+import logging
+import re
+import shutil
+from selftest.base import oeSelfTest
+from selftest.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+import selftest.utils.ftools as ftools
+
+class BitbakeTests(oeSelfTest):
+
+    def test_run_bitbake_from_1(self):
+        os.chdir(os.path.join(self.builddir, 'conf'))
+        bitbake('-e')
+
+    def test_run_bitbake_from_2(self):
+        my_env = os.environ.copy()
+        my_env['BBPATH'] = my_env['BUILDDIR']
+        os.chdir(os.path.dirname(os.environ['BUILDDIR']))
+        bitbake('-e', env=my_env)
+
+    def test_event_handler(self):
+        self.write_config("INHERIT += \"test_events\"")
+        result = bitbake('m4-native')
+        find_build_started = re.search("NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Preparing runqueue", result.output)
+        find_build_completed = re.search("Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
+        self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
+        self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
+        self.assertFalse('Test for bb.event.InvalidEvent' in result.output)
+
+    def test_local_sstate(self):
+        bitbake('m4-native -ccleansstate')
+        bitbake('m4-native')
+        bitbake('m4-native -cclean')
+        result = bitbake('m4-native')
+        find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
+        self.assertTrue(find_setscene)
+
+    def test_bitbake_invalid_recipe(self):
+        result = bitbake('-b asdf', ignore_status=True)
+        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output)
+
+    def test_bitbake_invalid_target(self):
+        result = bitbake('asdf', ignore_status=True)
+        self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output)
+
+    def test_warnings_errors(self):
+        result = bitbake('-b asdf', ignore_status=True)
+        find_warnings = re.search("Summary: There was [1-9][0-9]* WARNING message shown.", result.output)
+        find_errors = re.search("Summary: There was [1-9][0-9]* ERROR message shown.", result.output)
+        self.assertTrue(find_warnings)
+        self.assertTrue(find_errors)
+
+    def test_invalid_patch(self):
+        inc_file = os.path.join(get_test_layer(), 'recipes-test/man/test_recipe.inc')
+        ftools.write_file(inc_file, 'SRC_URI += "file://man-1.5h1-make.patch"')
+        result = bitbake('man -c patch', ignore_status=True)
+        os.remove(inc_file)
+        bitbake('-cclean man')
+        self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output)
+
+
+class BitbakeLayers(oeSelfTest):
+
+    def test_bitbakelayers_showlayers(self):
+        result = runCmd('bitbake-layers show_layers')
+        self.assertTrue('meta-selftest' in result.output)
+
+    def test_bitbakelayers_showappends(self):
+        result = runCmd('bitbake-layers show_appends')
+        self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
+
+    def test_bitbakelayers_showoverlayed(self):
+        result = runCmd('bitbake-layers show_overlayed')
+        self.assertTrue('aspell' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
+
+    def test_bitbakelayers_flatten(self):
+        if os.path.isdir(os.path.join(self.builddir, 'test')):
+            shutil.rmtree(os.path.join(self.builddir, 'test'))
+        result = runCmd('bitbake-layers flatten test')
+        bb_file = os.path.join(self.builddir, 'test/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb')
+        self.assertTrue(os.path.isfile(bb_file))
+        contents = ftools.read_file(bb_file)
+        find_in_contents = re.search("##### bbappended from meta-selftest #####\nTEST_VAR = \"\"", contents)
+        shutil.rmtree(os.path.join(self.builddir, 'test'))
+        self.assertTrue(find_in_contents)
-- 
1.8.3.1


