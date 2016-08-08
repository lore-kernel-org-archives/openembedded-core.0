Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 529DA771AD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316014"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:52 -0700
Message-Id: <d8ec10089c0a5cf714fd6e051ce6f9ec7cd10cf6.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 04/20] oeqa.selftest.bbtests: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:21 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py        | 175 +++++++++++++++++++++----------
 meta/lib/oeqa/selftest/conf/bbtests.conf |  28 +++++
 2 files changed, 150 insertions(+), 53 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/bbtests.conf

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 4b42323..0f89fee 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -5,9 +5,16 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class BitbakeTests(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     def getline(self, res, line):
         for l in res.output.split('\n'):
             if line in l:
@@ -27,8 +34,10 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(806)
     def test_event_handler(self):
-        self.write_config("INHERIT += \"test_events\"")
-        result = bitbake('m4-native')
+        features = self.config.get('bitbaketests', 'event_handler_features')
+        recipe = self.config.get('bitbaketests', 'event_handler_recipe')
+        self.write_config(features)
+        result = bitbake(recipe)
         find_build_started = re.search("NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing RunQueue Tasks", result.output)
         find_build_completed = re.search("Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
         self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
@@ -37,26 +46,40 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(103)
     def test_local_sstate(self):
-        bitbake('m4-native -ccleansstate')
-        bitbake('m4-native')
-        bitbake('m4-native -cclean')
-        result = bitbake('m4-native')
-        find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
-        self.assertTrue(find_setscene, msg = "No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
+        recipe = self.config.get('bitbaketests', 'local_sstate_recipe')
+        bitbake('%s -ccleansstate' % recipe)
+        bitbake(recipe)
+        bitbake('%s -cclean' % recipe)
+        result = bitbake(recipe)
+        find_setscene = re.search(
+                      "%s.*do_.*_setscene" % recipe, result.output)
+        self.assertTrue(find_setscene, msg="No \"%s.*do_.*_setscene\" message \
+found during bitbake %s. bitbake output: %s" % (recipe, recipe, result.output))
 
     @testcase(105)
     def test_bitbake_invalid_recipe(self):
-        result = bitbake('-b asdf', ignore_status=True)
-        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        recipe = eval(
+               self.config.get('bitbaketests', 'bb_invalid_recipe_recipe'))
+        result = bitbake('-b %s' % recipe, ignore_status=True)
+        self.assertTrue("ERROR: Unable to find any recipe file matching '%s'"
+                        % recipe in result.output,
+                        msg="Though %s recipe doesn't exist, bitbake didn't \
+output any err. message. bitbake output: %s" % (recipe, result.output))
 
     @testcase(107)
     def test_bitbake_invalid_target(self):
-        result = bitbake('asdf', ignore_status=True)
-        self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output, msg = "Though no 'asdf' target exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        recipe = eval(
+               self.config.get('bitbaketests', 'bb_invalid_target_recipe'))
+        result = bitbake(recipe, ignore_status=True)
+        self.assertTrue("ERROR: Nothing PROVIDES '%s'" % recipe
+                        in result.output, msg="Though no '%s' target exists, \
+bitbake didn't output any err. message. bitbake output: %s"
+                        % (recipe, result.output))
 
     @testcase(106)
     def test_warnings_errors(self):
-        result = bitbake('-b asdf', ignore_status=True)
+        recipe = self.config.get('bitbaketests', 'warnings_errors_recipe')
+        result = bitbake('-b %s' % recipe, ignore_status=True)
         find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
         find_errors = re.search("Summary: There w.{2,3}? [1-9][0-9]* ERROR messages* shown", result.output)
         self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
@@ -64,18 +87,22 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(108)
     def test_invalid_patch(self):
-        self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
-        result = bitbake('man -c patch', ignore_status=True)
-        self.delete_recipeinc('man')
-        bitbake('-cclean man')
+        recipe = self.config.get('bitbaketests', 'invalid_patch_recipe')
+        filename = self.config.get('bitbaketests', 'invalid_patch_file')
+        self.write_recipeinc(recipe, 'SRC_URI += "file://%s"' % filename)
+        result = bitbake('%s -c patch' % recipe, ignore_status=True)
+        self.delete_recipeinc(recipe)
+        bitbake('-cclean %s' % recipe)
         line = self.getline(result, "Function failed: patch_do_patch")
-        self.assertTrue(line and line.startswith("ERROR:"), msg = "Though no man-1.5h1-make.patch file exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        self.assertTrue(line and line.startswith("ERROR:"),
+                        msg="Though no %s file exists, bitbake didn't output \
+any err. message. bitbake output: %s" % (filename, result.output))
 
     @testcase(1354)
     def test_force_task_1(self):
         # test 1 from bug 5875
-        test_recipe = 'zlib'
-        test_data = "Microsoft Made No Profit From Anyone's Zunes Yo"
+        test_recipe = self.config.get('bitbaketests', 'force_task_1_recipe')
+        test_data = self.config.get('bitbaketests', 'force_task_1_data')
         image_dir = get_bb_var('D', test_recipe)
         pkgsplit_dir = get_bb_var('PKGDEST', test_recipe)
         man_dir = get_bb_var('mandir', test_recipe)
@@ -84,11 +111,12 @@ class BitbakeTests(oeSelfTest):
         bitbake(test_recipe)
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
-        man_file = os.path.join(image_dir + man_dir, 'man3/zlib.3')
+        man_file = os.path.join(image_dir + man_dir, 'man3/%s.3' % test_recipe)
         ftools.append_file(man_file, test_data)
         bitbake('-c package -f %s' % test_recipe)
 
-        man_split_file = os.path.join(pkgsplit_dir, 'zlib-doc' + man_dir, 'man3/zlib.3')
+        man_split_file = os.path.join(pkgsplit_dir, '%s-doc' % test_recipe +
+                                      man_dir, 'man3/%s.3' % test_recipe)
         man_split_content = ftools.read_file(man_split_file)
         self.assertIn(test_data, man_split_content, 'The man file has not changed in packages-split.')
 
@@ -98,7 +126,7 @@ class BitbakeTests(oeSelfTest):
     @testcase(163)
     def test_force_task_2(self):
         # test 2 from bug 5875
-        test_recipe = 'zlib'
+        test_recipe = self.config.get('bitbaketests', 'force_task_2_recipe')
 
         bitbake('-c cleansstate %s' % test_recipe)
         bitbake(test_recipe)
@@ -111,17 +139,29 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(167)
     def test_bitbake_g(self):
-        result = bitbake('-g core-image-full-cmdline')
-        for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
-            self.addCleanup(os.remove, f)
-        self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output, msg = "No dependency \"pn-buildlist\" file was generated for the given task target. bitbake output: %s" % result.output)
-        self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')), msg = "No \"openssh\" dependency found in pn-buildlist file.")
+        image = self.config.get('bitbaketests', 'bitbake_g_image')
+        pnfiles = eval(self.config.get('bitbaketests', 'bitbake_g_files'))
+        drecipe = self.config.get(
+                'bitbaketests', 'bitbake_g_dependencyrecipe')
+        result = bitbake('-g %s' % image)
+        for f in pnfiles:
+            self.addCleanup(os.remove, pnfiles[f])
+        self.assertTrue('NOTE: PN build list saved to \'%s\''
+                        % pnfiles['PN build list'] in result.output,
+                        msg="No dependency \"%s\" file was generated for \
+the given task target. bitbake output: %s"
+                        % (pnfiles['PN build list'], result.output))
+        self.assertTrue(drecipe in ftools.read_file(os.path.join(self.builddir,
+                        pnfiles['PN build list'])),
+                        msg="No \"%s\" dependency found in %s file."
+                        % (drecipe, pnfiles['PN build list']))
 
     @testcase(899)
     def test_image_manifest(self):
-        bitbake('core-image-minimal')
-        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
-        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
+        image = self.config.get('bitbaketests', 'image_manifest_image')
+        bitbake(image)
+        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target=image)
+        imagename = get_bb_var("IMAGE_LINK_NAME", target=image)
         manifest = os.path.join(deploydir, imagename + ".manifest")
         self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image. It should have been created in %s" % manifest)
 
@@ -147,29 +187,42 @@ doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result
 
     @testcase(171)
     def test_rename_downloaded_file(self):
+        recipe = self.config.get(
+               'bitbaketests', 'rename_downloaded_file_recipe')
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        data = 'SRC_URI_append = ";downloadfilename=test-aspell.tar.gz"'
-        self.write_recipeinc('aspell', data)
-        bitbake('-ccleanall aspell')
-        result = bitbake('-c fetch aspell', ignore_status=True)
-        self.delete_recipeinc('aspell')
-        self.assertEqual(result.status, 0, msg = "Couldn't fetch aspell. %s" % result.output)
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % str(get_bb_var("DL_DIR")))
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % str(get_bb_var("DL_DIR")))
+        data = 'SRC_URI_append = ";downloadfilename=test-%s.tar.gz"' % recipe
+        self.write_recipeinc(recipe, data)
+        bitbake('-ccleanall %s' % recipe)
+        result = bitbake('-c fetch %s' % recipe, ignore_status=True)
+        self.delete_recipeinc(recipe)
+        self.assertEqual(result.status, 0, msg="Couldn't fetch %s. %s"
+                         % (recipe, result.output))
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"),
+                        'test-%s.tar.gz' % recipe)),
+                        msg="File rename failed. No corresponding \
+test-%s.tar.gz file found under %s" % (recipe, str(get_bb_var("DL_DIR"))))
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"),
+                        'test-%s.tar.gz.done' % recipe)),
+                        "File rename failed. No corresponding \
+test-%s.tar.gz.done file found under %s" % (recipe, str(get_bb_var("DL_DIR"))))
 
     @testcase(1028)
     def test_environment(self):
-        self.write_config("TEST_ENV=\"localconf\"")
+        tstring = self.config.get('bitbaketests', 'environment_teststring')
+        self.write_config("TEST_ENV=\"%s\"" % tstring)
         result = runCmd('bitbake -e | grep TEST_ENV=')
-        self.assertTrue('localconf' in result.output, msg = "bitbake didn't report any value for TEST_ENV variable. To test, run 'bitbake -e | grep TEST_ENV='")
+        self.assertTrue(tstring in result.output,
+                        msg="bitbake didn't report any value for TEST_ENV \
+variable. To test, run 'bitbake -e | grep TEST_ENV='")
 
     @testcase(1029)
     def test_dry_run(self):
-        result = runCmd('bitbake -n m4-native')
+        recipe = self.config.get('bitbaketests', 'dry_run_recipe')
+        result = runCmd('bitbake -n %s' % recipe)
         self.assertEqual(0, result.status, "bitbake dry run didn't run as expected. %s" % result.output)
 
     @testcase(1030)
@@ -205,38 +258,53 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     @testcase(1034)
     def test_checkuri(self):
-        result = runCmd('bitbake -c checkuri m4')
+        recipe = self.config.get('bitbaketests', 'checkuri_recipe')
+        result = runCmd('bitbake -c checkuri %s' % recipe)
         self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed. bitbake output: %s" % result.output)
 
     @testcase(1035)
     def test_continue(self):
+        recipe = self.config.get('bitbaketests', 'continue_recipe')
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
         self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
-        runCmd('bitbake -c cleanall man xcursor-transparent-theme')
-        result = runCmd('bitbake man xcursor-transparent-theme -k', ignore_status=True)
+        runCmd('bitbake -c cleanall man %s' % recipe)
+        result = runCmd('bitbake man %s -k' % recipe, ignore_status=True)
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
-        manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
-        continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
+        manver = re.search(
+               "NOTE: recipe %s-(.*?): task do_unpack: Started" % recipe,
+               result.output)
+        continuepos = result.output.find('NOTE: recipe %s-%s: task do_unpack: \
+Started' % (recipe, manver.group(1)))
         self.assertLess(errorpos,continuepos, msg = "bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
 
     @testcase(1119)
     def test_non_gplv3(self):
-        data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
+        recipe = self.config.get('bitbaketests', 'non_gplv3_recipe')
+        data = self.config.get('bitbaketests', 'non_gplv3_data')
         conf = os.path.join(self.builddir, 'conf/local.conf')
         ftools.append_file(conf ,data)
         self.addCleanup(ftools.remove_from_file, conf ,data)
-        result = bitbake('readline', ignore_status=True)
+        result = bitbake(recipe, ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
-        self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
-        self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))
+        self.assertFalse(
+            os.path.isfile(os.path.join(
+                               self.builddir,
+                               'tmp/deploy/licenses/%s/generic_GPLv3'
+                               % recipe)))
+        self.assertTrue(
+            os.path.isfile(os.path.join(
+                               self.builddir,
+                               'tmp/deploy/licenses/%s/generic_GPLv2'
+                               % recipe)))
 
     @testcase(1422)
     def test_setscene_only(self):
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
-        test_recipe = 'ed'
+        test_recipe = self.config.get(
+                    'bitbaketests', 'setscene_only_recipe')
 
         bitbake(test_recipe)
         bitbake('-c clean %s' % test_recipe)
@@ -251,7 +319,8 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
     @testcase(1425)
     def test_bbappend_order(self):
         """ Bitbake should bbappend to recipe in a predictable order """
-        test_recipe = 'ed'
+        test_recipe = self.config.get(
+                    'bitbaketests', 'bbappend_order_recipe')
         test_recipe_summary_before = get_bb_var('SUMMARY', test_recipe)
         test_recipe_pv = get_bb_var('PV', test_recipe)
         recipe_append_file = test_recipe + '_' + test_recipe_pv + '.bbappend'
diff --git a/meta/lib/oeqa/selftest/conf/bbtests.conf b/meta/lib/oeqa/selftest/conf/bbtests.conf
new file mode 100644
index 0000000..1412049
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/bbtests.conf
@@ -0,0 +1,28 @@
+[bitbaketests]
+event_handler_features = INHERIT += "test_events"
+event_handler_recipe = m4-native
+local_sstate_recipe = %(event_handler_recipe)s
+bb_invalid_recipe_recipe = "asdf" # nonexistent recipe
+bb_invalid_target_recipe = %(bb_invalid_recipe_recipe)s
+warnings_errors_recipe = %(bb_invalid_recipe_recipe)s
+invalid_patch_recipe = man
+invalid_patch_file = man-1.5h1-make.patch
+force_task_1_recipe = zlib
+force_task_1_data = Microsoft Made No Profit From Anyone's Zunes Yo
+force_task_2_recipe = %(force_task_1_recipe)s
+bitbake_g_image = core-image-full-cmdline
+bitbake_g_files = {'PN build list': 'pn-buildlist',
+                  'PN dependencies list': 'pn-depends.dot',
+                  'Package dependencies list': 'package-depends.dot',
+                  'Task dependencies list': 'task-depends.dot'}
+bitbake_g_dependencyrecipe = openssh
+image_manifest_image = core-image-minimal
+rename_downloaded_file_recipe = aspell
+environment_teststring = localconf
+dry_run_recipe = %(event_handler_recipe)s
+checkuri_recipe = m4
+continue_recipe = xcursor-transparent-theme
+non_gplv3_data = INCOMPATIBLE_LICENSE = "GPLv3"
+non_gplv3_recipe = readline
+setscene_only_recipe = ed
+bbappend_order_recipe = %(setscene_only_recipe)s
-- 
1.8.3.1


