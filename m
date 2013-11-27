Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBBA6DE55
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:08:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2013 09:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,783,1378882800"; d="scan'208";a="435178773"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 27 Nov 2013 09:08:15 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 4CB476A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:08:13 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 19:08:53 +0200
Message-Id: <dca694aed695a8adf2b27ba3d7b3abb9fb2fc20a.1385571298.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
Subject: [PATCH 4/4] lib/oeqa/selftest: add test modules for expected bitbake output and bitbake-layers
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
X-List-Received-Date: Wed, 27 Nov 2013 17:08:35 -0000

From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>

Tests for bitbake-layers and expected output for some bitbake options.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 37 +++++++++++++++
 meta/lib/oeqa/selftest/bbtests.py  | 97 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/bblayers.py
 create mode 100644 meta/lib/oeqa/selftest/bbtests.py

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
new file mode 100644
index 0000000..52aa4f8
--- /dev/null
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -0,0 +1,37 @@
+import unittest
+import os
+import logging
+import re
+import shutil
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd
+
+class BitbakeLayers(oeSelfTest):
+
+    def test_bitbakelayers_showcrossdepends(self):
+        result = runCmd('bitbake-layers show-cross-depends')
+        self.assertTrue('aspell' in result.output)
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
+        self.assertFalse(os.path.isdir(os.path.join(self.builddir, 'test')))
+        result = runCmd('bitbake-layers flatten test')
+        bb_file = os.path.join(self.builddir, 'test/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb')
+        self.assertTrue(os.path.isfile(bb_file))
+        contents = ftools.read_file(bb_file)
+        find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
+        shutil.rmtree(os.path.join(self.builddir, 'test'))
+        self.assertTrue(find_in_contents)
diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
new file mode 100644
index 0000000..01e0099
--- /dev/null
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -0,0 +1,97 @@
+import unittest
+import os
+import logging
+import re
+import shutil
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+
+class BitbakeTests(oeSelfTest):
+
+    def test_run_bitbake_from_dir_1(self):
+        os.chdir(os.path.join(self.builddir, 'conf'))
+        bitbake('-e')
+
+    def test_run_bitbake_from_dir_2(self):
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
+        self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
+        result = bitbake('man -c patch', ignore_status=True)
+        self.delete_recipeinc('man')
+        bitbake('-cclean man')
+        self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output)
+
+    def test_force_task(self):
+        bitbake('m4-native')
+        result = bitbake('-C compile m4-native')
+        look_for_tasks = ['do_compile', 'do_install', 'do_populate_sysroot']
+        for task in look_for_tasks:
+            find_task = re.search("m4-native.*%s" % task, result.output)
+            self.assertTrue(find_task)
+
+    def test_bitbake_g(self):
+        result = bitbake('-g core-image-basic')
+        self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output)
+        self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')))
+        for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
+            os.remove(f)
+
+    def test_invalid_recipe_src_uri(self):
+        data = 'SRC_URI = "file://invalid"'
+        self.write_recipeinc('man', data)
+        bitbake('-ccleanall man')
+        result = bitbake('-c fetch man', ignore_status=True)
+        bitbake('-ccleanall man')
+        self.delete_recipeinc('man')
+        self.assertEqual(result.status, 1, msg='Command succeded when it should have failed')
+        self.assertTrue('ERROR: Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output)
+        self.assertTrue('ERROR: Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.' in result.output)
+
+    def test_rename_downloaded_file(self):
+        data = 'SRC_URI_append = ";downloadfilename=test-aspell.tar.gz"'
+        self.write_recipeinc('aspell', data)
+        bitbake('-ccleanall aspell')
+        result = bitbake('-c fetch aspell', ignore_status=True)
+        self.delete_recipeinc('aspell')
+        self.assertEqual(result.status, 0)
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz')))
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')))
+        bitbake('-ccleanall aspell')
-- 
1.8.3.1


