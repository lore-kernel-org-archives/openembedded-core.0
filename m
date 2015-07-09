Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 69337737A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:51:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2015 09:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,441,1432623600"; d="scan'208";a="759197029"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2015 09:51:27 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 36FAE6A4083;
	Thu,  9 Jul 2015 09:50:47 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 20:01:51 +0300
Message-Id: <1436461311-27806-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/bbtests: Show useful failure message for all auto-tests
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
X-List-Received-Date: Thu, 09 Jul 2015 16:51:39 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 54 ++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 7df6b2f..8301790 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -14,14 +14,14 @@ class BitbakeTests(oeSelfTest):
     @testcase(789)
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
-        bitbake('-e')
+        self.assertEqual(bitbake('-e').status, 0, msg = "bitbake couldn't run from \"conf\" dir")
 
     @testcase(790)
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir(os.path.dirname(os.environ['BUILDDIR']))
-        bitbake('-e', env=my_env)
+        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir")
 
     @testcase(806)
     def test_event_handler(self):
@@ -31,7 +31,7 @@ class BitbakeTests(oeSelfTest):
         find_build_completed = re.search("Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
         self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
         self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
-        self.assertFalse('Test for bb.event.InvalidEvent' in result.output)
+        self.assertFalse('Test for bb.event.InvalidEvent' in result.output, msg = "\"Test for bb.event.InvalidEvent\" message found during bitbake process")
 
     @testcase(103)
     def test_local_sstate(self):
@@ -40,17 +40,17 @@ class BitbakeTests(oeSelfTest):
         bitbake('m4-native -cclean')
         result = bitbake('m4-native')
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
-        self.assertTrue(find_setscene)
+        self.assertTrue(find_setscene, msg = "No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native")
 
     @testcase(105)
     def test_bitbake_invalid_recipe(self):
         result = bitbake('-b asdf', ignore_status=True)
-        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output)
+        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message.")
 
     @testcase(107)
     def test_bitbake_invalid_target(self):
         result = bitbake('asdf', ignore_status=True)
-        self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output)
+        self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output, msg = "Though no 'asdf' target exists, bitbake didn't output any err. message.")
 
     @testcase(106)
     def test_warnings_errors(self):
@@ -66,7 +66,7 @@ class BitbakeTests(oeSelfTest):
         result = bitbake('man -c patch', ignore_status=True)
         self.delete_recipeinc('man')
         bitbake('-cclean man')
-        self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output)
+        self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output, msg = "Though no man-1.5h1-make.patch file exists, bitbake didn't output any err. message.")
 
     @testcase(163)
     def test_force_task(self):
@@ -76,15 +76,15 @@ class BitbakeTests(oeSelfTest):
         look_for_tasks = ['do_compile', 'do_install', 'do_populate_sysroot']
         for task in look_for_tasks:
             find_task = re.search("m4-native.*%s" % task, result.output)
-            self.assertTrue(find_task)
+            self.assertTrue(find_task, msg = "Couldn't find %s task" % task)
 
     @testcase(167)
     def test_bitbake_g(self):
         result = bitbake('-g core-image-full-cmdline')
-        self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output)
-        self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')))
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
-            os.remove(f)
+            self.addCleanup(os.remove, f)
+        self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output, msg = "No dependency \"pn-buildlist\" file was generated for the given task target.")
+        self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')), msg = "No \"openssh\" dependency found in pn-buildlist file.")
 
     @testcase(899)
     def test_image_manifest(self):
@@ -106,8 +106,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         bitbake('-ccleanall man')
         self.delete_recipeinc('man')
         self.assertEqual(result.status, 1, msg='Command succeded when it should have failed')
-        self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output)
-        self.assertTrue('ERROR: Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.' in result.output)
+        self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output, msg = "\"invalid\" file \
+doesn't exist, yet no error message encountered")
+        self.assertTrue('ERROR: Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.' in result.output, msg = "\"invalid\" file \
+doesn't exist, yet fetcher didn't report any error.")
 
     @testcase(171)
     def test_rename_downloaded_file(self):
@@ -119,33 +121,33 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         bitbake('-ccleanall aspell')
         result = bitbake('-c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
-        self.assertEqual(result.status, 0)
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz')))
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')))
-        bitbake('-ccleanall aspell')
+        self.addCleanup(bitbake, '-ccleanall aspell')
+        self.assertEqual(result.status, 0, msg = "Couldn't fetch aspell.")
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found")
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found")
 
     @testcase(1028)
     def test_environment(self):
         self.append_config("TEST_ENV=\"localconf\"")
         self.addCleanup(self.remove_config, "TEST_ENV=\"localconf\"")
         result = runCmd('bitbake -e | grep TEST_ENV=')
-        self.assertTrue('localconf' in result.output)
+        self.assertTrue('localconf' in result.output, msg = "bitbake didn't report any value for TEST_ENV variable.")
 
     @testcase(1029)
     def test_dry_run(self):
         result = runCmd('bitbake -n m4-native')
-        self.assertEqual(0, result.status)
+        self.assertEqual(0, result.status, "bitbake dry run didn't run as expected.")
 
     @testcase(1030)
     def test_just_parse(self):
         result = runCmd('bitbake -p')
-        self.assertEqual(0, result.status)
+        self.assertEqual(0, result.status, "errors encountered when parsing recipes.")
 
     @testcase(1031)
     def test_version(self):
         result = runCmd('bitbake -s | grep wget')
         find = re.search("wget *:([0-9a-zA-Z\.\-]+)", result.output)
-        self.assertTrue(find)
+        self.assertTrue(find, "No version returned for searched recipe")
 
     @testcase(1032)
     def test_prefile(self):
@@ -153,11 +155,11 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.track_for_cleanup(preconf)
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
-        self.assertTrue('prefile' in result.output)
+        self.assertTrue('prefile' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration.")
         self.append_config("TEST_PREFILE=\"localconf\"")
         self.addCleanup(self.remove_config, "TEST_PREFILE=\"localconf\"")
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
-        self.assertTrue('localconf' in result.output)
+        self.assertTrue('localconf' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration.")
 
     @testcase(1033)
     def test_postfile(self):
@@ -167,12 +169,12 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.append_config("TEST_POSTFILE=\"localconf\"")
         self.addCleanup(self.remove_config, "TEST_POSTFILE=\"localconf\"")
         result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
-        self.assertTrue('postfile' in result.output)
+        self.assertTrue('postfile' in result.output, "Postconfigure file \"postfile.conf\"was not taken into consideration.")
 
     @testcase(1034)
     def test_checkuri(self):
         result = runCmd('bitbake -c checkuri m4')
-        self.assertEqual(0, result.status)
+        self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed")
 
     @testcase(1035)
     def test_continue(self):
@@ -185,7 +187,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
         manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
-        self.assertLess(errorpos,continuepos)
+        self.assertLess(errorpos,continuepos, msg = "bitbake didn't pass do_fail_task")
 
     @testcase(1119)
     def test_non_gplv3(self):
-- 
2.1.4


