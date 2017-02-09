Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D9D0B71A84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 16:17:06 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 09 Feb 2017 08:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="56958515"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga004.jf.intel.com with ESMTP; 09 Feb 2017 08:17:06 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 08:12:37 +0000
Message-Id: <f18e7066746f23db8fd4fb9c5907820e337314c6.1486627357.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1486627357.git.mariano.lopez@linux.intel.com>
References: <cover.1486627357.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1486627357.git.mariano.lopez@linux.intel.com>
References: <cover.1486627357.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] selftest: Avoid sstate corruption by calling cleansstate
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
X-List-Received-Date: Thu, 09 Feb 2017 16:17:08 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently selftest doesn't use sstates because some tests
clean sstate cache; using sstates would give a performance
boost instead of building everything from scratch.

With this sstates are not corrupted using different methods
depending on tests:

devtool: These tests needed to delete the cache so SSTATE_DIR
as SSTATE_MIRRORS and set a temporal SSTATE_DIR.

sstatetests: This module already used a temporal SSTATE_DIR, so
just set up the SSTATE_MIRRORS.

Rest: Removed cleansstate, some of them required to force a
certain task, others were just removed or changed for another
task.

[YOCTO #10929]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py      |  6 ++----
 meta/lib/oeqa/selftest/buildoptions.py | 18 ++++++------------
 meta/lib/oeqa/selftest/devtool.py      | 18 +++++++++++++++++-
 meta/lib/oeqa/selftest/oescripts.py    |  8 ++------
 meta/lib/oeqa/selftest/prservice.py    |  3 ---
 meta/lib/oeqa/selftest/recipetool.py   |  5 -----
 meta/lib/oeqa/selftest/signing.py      |  8 ++++----
 meta/lib/oeqa/selftest/sstatetests.py  |  6 +++---
 8 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 9dbac95..55c10f5 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -37,7 +37,6 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(103)
     def test_local_sstate(self):
-        bitbake('m4-native -ccleansstate')
         bitbake('m4-native')
         bitbake('m4-native -cclean')
         result = bitbake('m4-native')
@@ -83,8 +82,8 @@ class BitbakeTests(oeSelfTest):
         pkgsplit_dir = get_bb_var('PKGDEST', test_recipe)
         man_dir = get_bb_var('mandir', test_recipe)
 
-        bitbake('-c cleansstate %s' % test_recipe)
-        bitbake(test_recipe)
+        bitbake('-c clean %s' % test_recipe)
+        bitbake('-c package -f %s' % test_recipe)
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
         man_file = os.path.join(image_dir + man_dir, 'man3/zlib.3')
@@ -103,7 +102,6 @@ class BitbakeTests(oeSelfTest):
         # test 2 from bug 5875
         test_recipe = 'zlib'
 
-        bitbake('-c cleansstate %s' % test_recipe)
         bitbake(test_recipe)
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index d40eb00..2889afa 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -36,9 +36,7 @@ class ImageOptionsTests(oeSelfTest):
         p = get_bb_var('SYSROOT_DESTDIR', 'ccache-native') + get_bb_var('bindir', 'ccache-native') + "/" + "ccache"
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
-        bitbake("m4 -c cleansstate")
-        bitbake("m4 -c compile")
-        self.addCleanup(bitbake, 'ccache-native -ccleansstate')
+        bitbake("m4 -f -c compile")
         res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
         self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))
 
@@ -75,14 +73,13 @@ class SanityOptionsTest(oeSelfTest):
 
     @testcase(927)
     def test_options_warnqa_errorqa_switch(self):
-        bitbake("xcursor-transparent-theme -ccleansstate")
 
         self.write_config("INHERIT_remove = \"report-error\"")
         if "packages-list" not in get_bb_var("ERROR_QA"):
             self.append_config("ERROR_QA_append = \" packages-list\"")
 
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
-        res = bitbake("xcursor-transparent-theme", ignore_status=True)
+        res = bitbake("xcursor-transparent-theme -f -c package", ignore_status=True)
         self.delete_recipeinc('xcursor-transparent-theme')
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
@@ -90,8 +87,7 @@ class SanityOptionsTest(oeSelfTest):
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
-        bitbake("xcursor-transparent-theme -ccleansstate")
-        res = bitbake("xcursor-transparent-theme")
+        res = bitbake("xcursor-transparent-theme -f -c package")
         self.delete_recipeinc('xcursor-transparent-theme')
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
@@ -100,8 +96,7 @@ class SanityOptionsTest(oeSelfTest):
     def test_sanity_unsafe_script_references(self):
         self.write_config('WARN_QA_append = " unsafe-references-in-scripts"')
 
-        bitbake("-ccleansstate gzip")
-        res = bitbake("gzip")
+        res = bitbake("gzip -f -c package_qa")
         line = self.getline(res, "QA Issue: gzip")
         self.assertFalse(line, "WARNING: QA Issue: gzip message is present in bitbake's output and shouldn't be: %s" % res.output)
 
@@ -110,7 +105,7 @@ do_install_append_pn-gzip () {
 	echo "\n${bindir}/test" >> ${D}${bindir}/zcat
 }
 """)
-        res = bitbake("gzip")
+        res = bitbake("gzip -f -c package_qa")
         line = self.getline(res, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
 
@@ -118,7 +113,6 @@ do_install_append_pn-gzip () {
     def test_sanity_unsafe_binary_references(self):
         self.write_config('WARN_QA_append = " unsafe-references-in-binaries"')
 
-        bitbake("-ccleansstate nfs-utils")
         #res = bitbake("nfs-utils")
         # FIXME when nfs-utils passes this test
         #line = self.getline(res, "QA Issue: nfs-utils")
@@ -129,7 +123,7 @@ do_install_append_pn-gzip () {
 #	echo "\n${bindir}/test" >> ${D}${base_sbindir}/osd_login
 #}
 #""")
-        res = bitbake("nfs-utils")
+        res = bitbake("nfs-utils -f -c package_qa")
         line = self.getline(res, "QA Issue: nfs-utils")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
 
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 79a4b1f..8bf9f05 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -9,7 +9,8 @@ import fnmatch
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, runqemu, get_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
+from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
 from oeqa.utils.decorators import testcase
 
 class DevtoolBase(oeSelfTest):
@@ -117,6 +118,20 @@ class DevtoolBase(oeSelfTest):
 
 class DevtoolTests(DevtoolBase):
 
+    @classmethod
+    def setUpClass(cls):
+        bb_vars = get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
+        cls.original_sstate = bb_vars['SSTATE_DIR']
+        cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
+        cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
+        cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
+                            % cls.original_sstate)
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.log.debug('Deleting devtool sstate cache on %s' % cls.devtool_sstate)
+        runCmd('rm -rf %s' % cls.devtool_sstate)
+
     def setUp(self):
         """Test case setup function"""
         super(DevtoolTests, self).setUp()
@@ -124,6 +139,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(not os.path.exists(self.workspacedir),
                         'This test cannot be run with a workspace directory '
                         'under the build directory')
+        self.append_config(self.sstate_conf)
 
     def _check_src_repo(self, repo_dir):
         """Check srctree git repository"""
diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index 31cd508..28345dc 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -17,12 +17,8 @@ class TestScripts(oeSelfTest):
         path = os.path.dirname(get_bb_var('WORKDIR', 'gzip'))
         old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta/recipes-extended/gzip/gzip_1.3.12.bb')
         old_version = '1.3.12'
-        bitbake("-ccleansstate gzip")
-        bitbake("-ccleansstate -b %s" % old_version_recipe)
-        if os.path.exists(get_bb_var('WORKDIR', "-b %s" % old_version_recipe)):
-            shutil.rmtree(get_bb_var('WORKDIR', "-b %s" % old_version_recipe))
-        if os.path.exists(get_bb_var('WORKDIR', 'gzip')):
-            shutil.rmtree(get_bb_var('WORKDIR', 'gzip'))
+        bitbake("-c clean gzip")
+        bitbake("-c clean -b %s" % old_version_recipe)
 
         if os.path.exists(path):
             initial_contents = os.listdir(path)
diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 1b9a510..0b2dfe6 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -37,7 +37,6 @@ class BitbakePrTests(oeSelfTest):
     def increment_package_pr(self, package_name):
         inc_data = "do_package_append() {\n    bb.build.exec_func('do_test_prserv', d)\n}\ndo_test_prserv() {\necho \"The current date is: %s\"\n}" % datetime.datetime.now()
         self.write_recipeinc(package_name, inc_data)
-        bitbake("-ccleansstate %s" % package_name)
         res = bitbake(package_name, ignore_status=True)
         self.delete_recipeinc(package_name)
         self.assertEqual(res.status, 0, msg=res.output)
@@ -60,7 +59,6 @@ class BitbakePrTests(oeSelfTest):
         pr_2 = self.get_pr_version(package_name)
         stamp_2 = self.get_task_stamp(package_name, track_task)
 
-        bitbake("-ccleansstate %s" % package_name)
         self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
         self.assertTrue(stamp_1 != stamp_2, "Different pkg rev. but same stamp: %s" % stamp_1)
 
@@ -86,7 +84,6 @@ class BitbakePrTests(oeSelfTest):
         self.increment_package_pr(package_name)
         pr_2 = self.get_pr_version(package_name)
 
-        bitbake("-ccleansstate %s" % package_name)
         self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
 
     @testcase(930)
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index bcc2b46..e834823 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -72,11 +72,6 @@ class RecipetoolTests(RecipetoolBase):
         logger.info('Running bitbake to generate pkgdata')
         bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
 
-    @classmethod
-    def tearDownClass(cls):
-        # Shouldn't leave any traces of this artificial recipe behind
-        bitbake('-c cleansstate selftest-recipetool-appendfile')
-
     def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, options, expectedlines, expectedfiles):
         cmd = 'recipetool appendfile %s %s %s %s' % (self.templayerdir, destfile, newfile, options)
         return self._try_recipetool_appendcmd(cmd, testrecipe, expectedfiles, expectedlines)
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 70e8369..35c2dc1 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -54,8 +54,9 @@ class Signing(oeSelfTest):
 
         self.write_config(feature)
 
-        bitbake('-c cleansstate %s' % test_recipe)
-        bitbake(test_recipe)
+        bitbake('-c clean %s' % test_recipe)
+        bitbake('-f -c package_write_rpm %s' % test_recipe)
+
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
         pkgdatadir = get_bb_var('PKGDATA_DIR', test_recipe)
@@ -98,7 +99,6 @@ class Signing(oeSelfTest):
         sstatedir = os.path.join(builddir, 'test-sstate')
 
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
-        self.add_command_to_tearDown('bitbake -c cleansstate %s' % test_recipe)
         self.add_command_to_tearDown('rm -rf %s' % sstatedir)
 
         # Determine the pub key signature
@@ -115,7 +115,7 @@ class Signing(oeSelfTest):
 
         self.write_config(feature)
 
-        bitbake('-c cleansstate %s' % test_recipe)
+        bitbake('-c clean %s' % test_recipe)
         bitbake(test_recipe)
 
         recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index e3f819c..783d3d0 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -16,7 +16,7 @@ class SStateTests(SStateBase):
 
     # Test sstate files creation and their location
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
-        self.config_sstate(temp_sstate_location)
+        self.config_sstate(temp_sstate_location, [self.sstate_path])
 
         if  self.temp_sstate_location:
             bitbake(['-cclean'] + targets)
@@ -63,7 +63,7 @@ class SStateTests(SStateBase):
 
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
-        self.config_sstate(temp_sstate_location)
+        self.config_sstate(temp_sstate_location, [self.sstate_path])
 
         bitbake(['-ccleansstate'] + targets)
 
@@ -105,7 +105,7 @@ class SStateTests(SStateBase):
 
     # Test rebuilding of distro-specific sstate files
     def run_test_rebuild_distro_specific_sstate(self, targets, temp_sstate_location=True):
-        self.config_sstate(temp_sstate_location)
+        self.config_sstate(temp_sstate_location, [self.sstate_path])
 
         bitbake(['-ccleansstate'] + targets)
 
-- 
2.6.6


