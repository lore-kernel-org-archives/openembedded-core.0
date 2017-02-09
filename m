Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0272A72002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 16:17:07 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 09 Feb 2017 08:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="56958517"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga004.jf.intel.com with ESMTP; 09 Feb 2017 08:17:07 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 08:12:38 +0000
Message-Id: <d88d8c66d0b5f2b2b3b32d41c7de51ba1cc8f9b3.1486627357.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1486627357.git.mariano.lopez@linux.intel.com>
References: <cover.1486627357.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1486627357.git.mariano.lopez@linux.intel.com>
References: <cover.1486627357.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] selftest: Optimize get_bb_var use
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

get_bb_var calls bitbake every time it is used and every call
would take about 7 seconds. There are tests that calls get_bb_var
several times when they can use get_bb_vars. Also there are tests
that calls it to fetch the same variable over and over again.

This will optimize the use of get_bb_var and get_bb_vars for a
little speed up in the tests.

[YOCTO #11037]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/archiver.py     |  7 +--
 meta/lib/oeqa/selftest/bbtests.py      | 24 +++++----
 meta/lib/oeqa/selftest/buildhistory.py |  5 +-
 meta/lib/oeqa/selftest/buildoptions.py | 10 ++--
 meta/lib/oeqa/selftest/devtool.py      | 57 ++++++++++++---------
 meta/lib/oeqa/selftest/eSDK.py         | 21 ++++----
 meta/lib/oeqa/selftest/liboe.py        | 21 ++++----
 meta/lib/oeqa/selftest/manifest.py     |  7 +--
 meta/lib/oeqa/selftest/pkgdata.py      | 11 ++--
 meta/lib/oeqa/selftest/prservice.py    |  9 ++--
 meta/lib/oeqa/selftest/recipetool.py   | 34 +++++++------
 meta/lib/oeqa/selftest/runtime-test.py | 15 ++++--
 meta/lib/oeqa/selftest/signing.py      | 12 +++--
 meta/lib/oeqa/selftest/sstate.py       | 20 +++++---
 meta/lib/oeqa/selftest/sstatetests.py  | 92 ++++++++++++++--------------------
 meta/lib/oeqa/selftest/tinfoil.py      |  2 +-
 meta/lib/oeqa/selftest/wic.py          | 39 +++++++-------
 17 files changed, 208 insertions(+), 178 deletions(-)

diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
index 97b6f5b..d7f215c 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -1,5 +1,5 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import bitbake, get_bb_var
+from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.utils.decorators import testcase
 import glob
 import os
@@ -28,10 +28,11 @@ class Archiver(oeSelfTest):
         features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % exclude_recipe
         self.write_config(features)
 
-        shutil.rmtree(get_bb_var('TMPDIR'))
+        bitbake('-c clean %s %s' % (include_recipe, exclude_recipe))
         bitbake("%s %s" % (include_recipe, exclude_recipe))
 
-        src_path = os.path.join(get_bb_var('DEPLOY_DIR_SRC'), get_bb_var('TARGET_SYS'))
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
+        src_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
 
         # Check that include_recipe was included
         included_present = len(glob.glob(src_path + '/%s-*' % include_recipe))
diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 55c10f5..7ac4fc5 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -3,7 +3,7 @@ import re
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.utils.decorators import testcase
 
 class BitbakeTests(oeSelfTest):
@@ -78,9 +78,10 @@ class BitbakeTests(oeSelfTest):
         # test 1 from bug 5875
         test_recipe = 'zlib'
         test_data = "Microsoft Made No Profit From Anyone's Zunes Yo"
-        image_dir = get_bb_var('D', test_recipe)
-        pkgsplit_dir = get_bb_var('PKGDEST', test_recipe)
-        man_dir = get_bb_var('mandir', test_recipe)
+        bb_vars = get_bb_vars(['D', 'PKGDEST', 'mandir'], test_recipe)
+        image_dir = bb_vars['D']
+        pkgsplit_dir = bb_vars['PKGDEST']
+        man_dir = bb_vars['mandir']
 
         bitbake('-c clean %s' % test_recipe)
         bitbake('-c package -f %s' % test_recipe)
@@ -121,8 +122,9 @@ class BitbakeTests(oeSelfTest):
     @testcase(899)
     def test_image_manifest(self):
         bitbake('core-image-minimal')
-        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
-        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
+        bb_vars = get_bb_vars(["DEPLOY_DIR_IMAGE", "IMAGE_LINK_NAME"], "core-image-minimal")
+        deploydir = bb_vars["DEPLOY_DIR_IMAGE"]
+        imagename = bb_vars["IMAGE_LINK_NAME"]
         manifest = os.path.join(deploydir, imagename + ".manifest")
         self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image. It should have been created in %s" % manifest)
 
@@ -160,8 +162,9 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         result = bitbake('-c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
         self.assertEqual(result.status, 0, msg = "Couldn't fetch aspell. %s" % result.output)
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % str(get_bb_var("DL_DIR")))
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % str(get_bb_var("DL_DIR")))
+        dl_dir = get_bb_var("DL_DIR")
+        self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % dl_dir)
+        self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % dl_dir)
 
     @testcase(1028)
     def test_environment(self):
@@ -253,8 +256,9 @@ INHERIT_remove = \"report-error\"
     def test_bbappend_order(self):
         """ Bitbake should bbappend to recipe in a predictable order """
         test_recipe = 'ed'
-        test_recipe_summary_before = get_bb_var('SUMMARY', test_recipe)
-        test_recipe_pv = get_bb_var('PV', test_recipe)
+        bb_vars = get_bb_vars(['SUMMARY', 'PV'], test_recipe)
+        test_recipe_summary_before = bb_vars['SUMMARY']
+        test_recipe_pv = bb_vars['PV']
         recipe_append_file = test_recipe + '_' + test_recipe_pv + '.bbappend'
         expected_recipe_summary = test_recipe_summary_before
 
diff --git a/meta/lib/oeqa/selftest/buildhistory.py b/meta/lib/oeqa/selftest/buildhistory.py
index 674da62..008c39c 100644
--- a/meta/lib/oeqa/selftest/buildhistory.py
+++ b/meta/lib/oeqa/selftest/buildhistory.py
@@ -3,14 +3,15 @@ import re
 import datetime
 
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import bitbake, get_bb_var
+from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.utils.decorators import testcase
 
 
 class BuildhistoryBase(oeSelfTest):
 
     def config_buildhistory(self, tmp_bh_location=False):
-        if (not 'buildhistory' in get_bb_var('USER_CLASSES')) and (not 'buildhistory' in get_bb_var('INHERIT')):
+        bb_vars = get_bb_vars(['USER_CLASSES', 'INHERIT'])
+        if (not 'buildhistory' in bb_vars['USER_CLASSES']) and (not 'buildhistory' in bb_vars['INHERIT']):
             add_buildhistory_config = 'INHERIT += "buildhistory"\nBUILDHISTORY_COMMIT = "1"'
             self.append_config(add_buildhistory_config)
 
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 2889afa..04d4606 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -5,7 +5,7 @@ import shutil
 import tempfile
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
 from oeqa.utils.decorators import testcase
 
@@ -33,12 +33,14 @@ class ImageOptionsTests(oeSelfTest):
     @testcase(286)
     def test_ccache_tool(self):
         bitbake("ccache-native")
-        p = get_bb_var('SYSROOT_DESTDIR', 'ccache-native') + get_bb_var('bindir', 'ccache-native') + "/" + "ccache"
+        bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
+        p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
         bitbake("m4 -f -c compile")
-        res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
-        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))
+        log_compile = os.path.join(get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
+        res = runCmd("grep ccache %s" % log_compile, ignore_status=True)
+        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
 
     @testcase(1435)
     def test_read_only_image(self):
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 8bf9f05..f1661ef 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -213,9 +213,10 @@ class DevtoolTests(DevtoolBase):
         bitbake('pv -c cleansstate')
         # Test devtool build
         result = runCmd('devtool build pv')
-        installdir = get_bb_var('D', 'pv')
+        bb_vars = get_bb_vars(['D', 'bindir'], 'pv')
+        installdir = bb_vars['D']
         self.assertTrue(installdir, 'Could not query installdir variable')
-        bindir = get_bb_var('bindir', 'pv')
+        bindir = bb_vars['bindir']
         self.assertTrue(bindir, 'Could not query bindir variable')
         if bindir[0] == '/':
             bindir = bindir[1:]
@@ -296,11 +297,12 @@ class DevtoolTests(DevtoolBase):
             f.write('\nTESTLIBOUTPUT = "${STAGING_DIR}-components/${TUNE_PKGARCH}/${PN}/${libdir}"\n')
         # Test devtool build
         result = runCmd('devtool build libftdi')
-        staging_libdir = get_bb_var('TESTLIBOUTPUT', 'libftdi')
+        bb_vars = get_bb_vars(['TESTLIBOUTPUT', 'STAMP'], 'libftdi')
+        staging_libdir = bb_vars['TESTLIBOUTPUT']
         self.assertTrue(staging_libdir, 'Could not query TESTLIBOUTPUT variable')
         self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), "libftdi binary not found in STAGING_LIBDIR. Output of devtool build libftdi %s" % result.output)
         # Test devtool reset
-        stampprefix = get_bb_var('STAMP', 'libftdi')
+        stampprefix = bb_vars['STAMP']
         result = runCmd('devtool reset libftdi')
         result = runCmd('devtool status')
         self.assertNotIn('libftdi', result.output)
@@ -463,9 +465,10 @@ class DevtoolTests(DevtoolBase):
                     self.assertNotIn(expected + '\n', f, message)
 
         modfile = os.path.join(tempdir, 'mdadm.8.in')
-        pkgd = get_bb_var('PKGD', 'mdadm')
+        bb_vars = get_bb_vars(['PKGD', 'mandir'], 'mdadm')
+        pkgd = bb_vars['PKGD']
         self.assertTrue(pkgd, 'Could not query PKGD variable')
-        mandir = get_bb_var('mandir', 'mdadm')
+        mandir = bb_vars['mandir']
         self.assertTrue(mandir, 'Could not query mandir variable')
         manfile = oe.path.join(pkgd, mandir, 'man8', 'mdadm.8')
 
@@ -679,8 +682,9 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe(self):
         # Check preconditions
         testrecipe = 'minicom'
-        recipefile = get_bb_var('FILE', testrecipe)
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
         self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
@@ -711,8 +715,9 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
-        recipefile = get_bb_var('FILE', testrecipe)
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
         patches = []
         for entry in src_uri.split():
@@ -780,8 +785,9 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_append(self):
         # Check preconditions
         testrecipe = 'mdadm'
-        recipefile = get_bb_var('FILE', testrecipe)
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
         self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
@@ -848,8 +854,9 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
-        recipefile = get_bb_var('FILE', testrecipe)
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
         for entry in src_uri.split():
             if entry.startswith('git://'):
@@ -1009,8 +1016,9 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_local_files_3(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-localonly'
-        recipefile = get_bb_var('FILE', testrecipe)
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
@@ -1027,8 +1035,9 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_local_patch_gz(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-patch-gz'
-        recipefile = get_bb_var('FILE', testrecipe)
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
@@ -1054,8 +1063,9 @@ class DevtoolTests(DevtoolBase):
         # was also in SRC_URI
         # First, modify the recipe
         testrecipe = 'devtool-test-subdir'
-        recipefile = get_bb_var('FILE', testrecipe)
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
@@ -1184,9 +1194,10 @@ class DevtoolTests(DevtoolBase):
             result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
             # Check if it deployed all of the files with the right ownership/perms
             # First look on the host - need to do this under pseudo to get the correct ownership/perms
-            installdir = get_bb_var('D', testrecipe)
-            fakerootenv = get_bb_var('FAKEROOTENV', testrecipe)
-            fakerootcmd = get_bb_var('FAKEROOTCMD', testrecipe)
+            bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
+            installdir = bb_vars['D']
+            fakerootenv = bb_vars['FAKEROOTENV']
+            fakerootcmd = bb_vars['FAKEROOTCMD']
             result = runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
             filelist1 = self._process_ls_output(result.output)
 
diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
index ee1ca6a..b10eb0e 100644
--- a/meta/lib/oeqa/selftest/eSDK.py
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -6,9 +6,9 @@ import glob
 import logging
 import subprocess
 import oeqa.utils.ftools as ftools
-from oeqa.utils.decorators import testcase 
+from oeqa.utils.decorators import testcase
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.utils.httpserver import HTTPService
 
 class oeSDKExtSelfTest(oeSelfTest):
@@ -24,7 +24,7 @@ class oeSDKExtSelfTest(oeSelfTest):
         # what environment load oe-selftest, i586, x86_64
         pattern = os.path.join(tmpdir_eSDKQA, 'environment-setup-*')
         return glob.glob(pattern)[0]
-    
+
     @staticmethod
     def run_esdk_cmd(env_eSDK, tmpdir_eSDKQA, cmd, postconfig=None, **options):
         if postconfig:
@@ -47,10 +47,11 @@ class oeSDKExtSelfTest(oeSelfTest):
     def get_eSDK_toolchain(image):
         pn_task = '%s -c populate_sdk_ext' % image
 
-        sdk_deploy = get_bb_var('SDK_DEPLOY', pn_task)
-        toolchain_name = get_bb_var('TOOLCHAINEXT_OUTPUTNAME', pn_task)
+        bb_vars = get_bb_vars(['SDK_DEPLOY', 'TOOLCHAINEXT_OUTPUTNAME'], pn_task)
+        sdk_deploy = bb_vars['SDK_DEPLOY']
+        toolchain_name = bb_vars['TOOLCHAINEXT_OUTPUTNAME']
         return os.path.join(sdk_deploy, toolchain_name + '.sh')
-    
+
     @staticmethod
     def update_configuration(cls, image, tmpdir_eSDKQA, env_eSDK, ext_sdk_path):
         sstate_dir = os.path.join(os.environ['BUILDDIR'], 'sstate-cache')
@@ -64,7 +65,7 @@ class oeSDKExtSelfTest(oeSelfTest):
         runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
 
         cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
-       
+
         sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* http://%s/PATH"
@@ -73,7 +74,6 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
 
         with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
             f.write(sstate_config)
-    
 
     @classmethod
     def setUpClass(cls):
@@ -83,7 +83,7 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
         cls.http_service.start()
 
         cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
- 
+
         cls.image = 'core-image-minimal'
 
         cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
@@ -103,7 +103,6 @@ SSTATE_MIRRORS =  "file://.* http://%s/PATH"
         with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
             f.write(sstate_config)
 
-      
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_eSDKQA)
@@ -115,7 +114,7 @@ SSTATE_MIRRORS =  "file://.* http://%s/PATH"
         bitbake(pn_sstate)
         cmd = "devtool sdk-install %s " % pn_sstate
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
-    
+
     @testcase(1603)
     def test_image_generation_binary_feeds(self):
         image = 'core-image-minimal'
diff --git a/meta/lib/oeqa/selftest/liboe.py b/meta/lib/oeqa/selftest/liboe.py
index cd12cd2..0b0301d 100644
--- a/meta/lib/oeqa/selftest/liboe.py
+++ b/meta/lib/oeqa/selftest/liboe.py
@@ -1,11 +1,16 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import get_bb_var, bitbake, runCmd
+from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
 import glob
 import os
 import os.path
 
 class LibOE(oeSelfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        cls.tmp_dir = get_bb_var('TMPDIR')
+
     def test_copy_tree_special(self):
         """
         Summary:    oe.path.copytree() should copy files with special character
@@ -14,8 +19,7 @@ class LibOE(oeSelfTest):
         Product:    OE-Core
         Author:     Joshua Lock <joshua.g.lock@intel.com>
         """
-        tmp_dir = get_bb_var('TMPDIR')
-        testloc = oe.path.join(tmp_dir, 'liboetests')
+        testloc = oe.path.join(self.tmp_dir, 'liboetests')
         src = oe.path.join(testloc, 'src')
         dst = oe.path.join(testloc, 'dst')
         bb.utils.mkdirhier(testloc)
@@ -40,8 +44,7 @@ class LibOE(oeSelfTest):
         Product:    OE-Core
         Author:     Joshua Lock <joshua.g.lock@intel.com>
         """
-        tmp_dir = get_bb_var('TMPDIR')
-        testloc = oe.path.join(tmp_dir, 'liboetests')
+        testloc = oe.path.join(self.tmp_dir, 'liboetests')
         src = oe.path.join(testloc, 'src')
         dst = oe.path.join(testloc, 'dst')
         bb.utils.mkdirhier(testloc)
@@ -51,8 +54,9 @@ class LibOE(oeSelfTest):
         # ensure we have setfattr available
         bitbake("attr-native")
 
-        destdir = get_bb_var('SYSROOT_DESTDIR', 'attr-native')
-        bindir = get_bb_var('bindir', 'attr-native')
+        bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'attr-native')
+        destdir = bb_vars['SYSROOT_DESTDIR']
+        bindir = bb_vars['bindir']
         bindir = destdir + bindir
 
         # create a file with xattr and copy it
@@ -73,8 +77,7 @@ class LibOE(oeSelfTest):
         Product:    OE-Core
         Author:     Joshua Lock <joshua.g.lock@intel.com>
         """
-        tmp_dir = get_bb_var('TMPDIR')
-        testloc = oe.path.join(tmp_dir, 'liboetests')
+        testloc = oe.path.join(self.tmp_dir, 'liboetests')
         src = oe.path.join(testloc, 'src')
         dst = oe.path.join(testloc, 'dst')
         bb.utils.mkdirhier(testloc)
diff --git a/meta/lib/oeqa/selftest/manifest.py b/meta/lib/oeqa/selftest/manifest.py
index 44d0404..fe6f949 100644
--- a/meta/lib/oeqa/selftest/manifest.py
+++ b/meta/lib/oeqa/selftest/manifest.py
@@ -2,7 +2,7 @@ import unittest
 import os
 
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import get_bb_var, bitbake
+from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake
 from oeqa.utils.decorators import testcase
 
 class ManifestEntry:
@@ -84,9 +84,10 @@ class VerifyManifest(oeSelfTest):
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
             for k in d_target.keys():
+                bb_vars = get_bb_vars(['SDK_NAME', 'SDK_VERSION'], self.buildtarget)
                 mfilename[k] = "{}-toolchain-{}.{}.manifest".format(
-                        get_bb_var("SDK_NAME", self.buildtarget),
-                        get_bb_var("SDK_VERSION", self.buildtarget),
+                        bb_vars['SDK_NAME'],
+                        bb_vars['SDK_VERSION'],
                         k)
                 mpath[k] = os.path.join(mdir, mfilename[k])
                 if not os.path.isfile(mpath[k]):
diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index 3512ce3..36d8b34 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -6,7 +6,7 @@ import fnmatch
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.utils.decorators import testcase
 
 class OePkgdataUtilTests(oeSelfTest):
@@ -126,10 +126,11 @@ class OePkgdataUtilTests(oeSelfTest):
                     curpkg = line.split(':')[0]
                     files[curpkg] = []
             return files
-        base_libdir = get_bb_var('base_libdir')
-        libdir = get_bb_var('libdir')
-        includedir = get_bb_var('includedir')
-        mandir = get_bb_var('mandir')
+        bb_vars = get_bb_vars(['base_libdir', 'libdir', 'includedir', 'mandir'])
+        base_libdir = bb_vars['base_libdir']
+        libdir = bb_vars['libdir']
+        includedir = bb_vars['includedir']
+        mandir = bb_vars['mandir']
         # Test recipe-space package name
         result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
         files = splitoutput(result.output)
diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 0b2dfe6..34d4197 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -12,10 +12,13 @@ from oeqa.utils.decorators import testcase
 from oeqa.utils.network import get_free_port
 
 class BitbakePrTests(oeSelfTest):
- 
+
+    @classmethod
+    def setUpClass(cls):
+        cls.pkgdata_dir = get_bb_var('PKGDATA_DIR')
+
     def get_pr_version(self, package_name):
-        pkgdata_dir = get_bb_var('PKGDATA_DIR')
-        package_data_file = os.path.join(pkgdata_dir, 'runtime', package_name)
+        package_data_file = os.path.join(self.pkgdata_dir, 'runtime', package_name)
         package_data = ftools.read_file(package_data_file)
         find_pr = re.search("PKGR: r[0-9]+\.([0-9]+)", package_data)
         self.assertTrue(find_pr, "No PKG revision found in %s" % package_data_file)
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index e834823..d62c8bb 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -4,7 +4,8 @@ import shutil
 import tempfile
 import urllib.parse
 
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import get_bb_vars, create_temp_layer
 from oeqa.utils.decorators import testcase
 from oeqa.selftest import devtool
 
@@ -25,6 +26,7 @@ def tearDownModule():
 
 
 class RecipetoolBase(devtool.DevtoolBase):
+
     def setUpLocal(self):
         self.templayerdir = templayerdir
         self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
@@ -65,12 +67,16 @@ class RecipetoolBase(devtool.DevtoolBase):
 
 
 class RecipetoolTests(RecipetoolBase):
+
     @classmethod
     def setUpClass(cls):
         # Ensure we have the right data in shlibs/pkgdata
         logger = logging.getLogger("selftest")
         logger.info('Running bitbake to generate pkgdata')
         bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
+        bb_vars = get_bb_vars(['COREBASE', 'BBPATH'])
+        cls.corebase = bb_vars['COREBASE']
+        cls.bbpath = bb_vars['BBPATH']
 
     def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, options, expectedlines, expectedfiles):
         cmd = 'recipetool appendfile %s %s %s %s' % (self.templayerdir, destfile, newfile, options)
@@ -104,9 +110,8 @@ class RecipetoolTests(RecipetoolBase):
         # Now try with a file we know should be an alternative
         # (this is very much a fake example, but one we know is reliably an alternative)
         self._try_recipetool_appendfile_fail('/bin/ls', self.testfile, ['ERROR: File /bin/ls is an alternative possibly provided by the following recipes:', 'coreutils', 'busybox'])
-        corebase = get_bb_var('COREBASE')
         # Need a test file - should be executable
-        testfile2 = os.path.join(corebase, 'oe-init-build-env')
+        testfile2 = os.path.join(self.corebase, 'oe-init-build-env')
         testfile2name = os.path.basename(testfile2)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -135,7 +140,6 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1173)
     def test_recipetool_appendfile_add(self):
-        corebase = get_bb_var('COREBASE')
         # Try arbitrary file add to a recipe
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -148,7 +152,7 @@ class RecipetoolTests(RecipetoolBase):
         self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase', expectedlines, ['testfile'])
         # Try adding another file, this time where the source file is executable
         # (so we're testing that, plus modifying an existing bbappend)
-        testfile2 = os.path.join(corebase, 'oe-init-build-env')
+        testfile2 = os.path.join(self.corebase, 'oe-init-build-env')
         testfile2name = os.path.basename(testfile2)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -500,8 +504,7 @@ class RecipetoolTests(RecipetoolBase):
         recipetool = runCmd("which recipetool")
         fromname = runCmd("recipetool --quiet pluginfile")
         srcfile = fromname.output
-        bbpath = get_bb_var('BBPATH')
-        searchpath = bbpath.split(':') + [os.path.dirname(recipetool.output)]
+        searchpath = self.bbpath.split(':') + [os.path.dirname(recipetool.output)]
         plugincontent = []
         with open(srcfile) as fh:
             plugincontent = fh.readlines()
@@ -597,17 +600,18 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
         self._try_recipetool_appendsrcfiles(testrecipe, newfiles, expectedfiles=expectedfiles, destdir=destdir, options=options)
 
-        src_uri = get_bb_var('SRC_URI', testrecipe).split()
+        bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'FILESEXTRAPATHS'], testrecipe)
+        src_uri = bb_vars['SRC_URI'].split()
         for f in expectedfiles:
             if destdir:
                 self.assertIn('file://%s;subdir=%s' % (f, destdir), src_uri)
             else:
                 self.assertIn('file://%s' % f, src_uri)
 
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = bb_vars['FILE']
         bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         filesdir = os.path.join(os.path.dirname(bbappendfile), testrecipe)
-        filesextrapaths = get_bb_var('FILESEXTRAPATHS', testrecipe).split(':')
+        filesextrapaths = bb_vars['FILESEXTRAPATHS'].split(':')
         self.assertIn(filesdir, filesextrapaths)
 
 
@@ -638,8 +642,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
     @testcase(1280)
     def test_recipetool_appendsrcfile_srcdir_basic(self):
         testrecipe = 'bash'
-        srcdir = get_bb_var('S', testrecipe)
-        workdir = get_bb_var('WORKDIR', testrecipe)
+        bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
+        srcdir = bb_vars['S']
+        workdir = bb_vars['WORKDIR']
         subdir = os.path.relpath(srcdir, workdir)
         self._test_appendsrcfile(testrecipe, 'a-file', srcdir=subdir)
 
@@ -664,8 +669,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
-        srcdir = get_bb_var('S', testrecipe)
-        workdir = get_bb_var('WORKDIR', testrecipe)
+        bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
+        srcdir = bb_vars['S']
+        workdir = bb_vars['WORKDIR']
         subdir = os.path.relpath(srcdir, workdir)
 
         self._test_appendsrcfile(testrecipe, filepath, srcdir=subdir)
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 52e5b27..198f018 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -1,5 +1,5 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 from oeqa.utils.decorators import testcase
 import os
 import re
@@ -31,8 +31,9 @@ class TestExport(oeSelfTest):
         bitbake('core-image-minimal')
         bitbake('-c testexport core-image-minimal')
 
-        # Verify if TEST_EXPORT_DIR was created
         testexport_dir = get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
+
+        # Verify if TEST_EXPORT_DIR was created
         isdir = os.path.isdir(testexport_dir)
         self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
 
@@ -73,10 +74,14 @@ class TestExport(oeSelfTest):
         bitbake('core-image-minimal')
         bitbake('-c testexport core-image-minimal')
 
+        needed_vars = ['TEST_EXPORT_DIR', 'TEST_EXPORT_SDK_DIR', 'TEST_EXPORT_SDK_NAME']
+        bb_vars = get_bb_vars(needed_vars, 'core-image-minimal')
+        testexport_dir = bb_vars['TEST_EXPORT_DIR']
+        sdk_dir = bb_vars['TEST_EXPORT_SDK_DIR']
+        sdk_name = bb_vars['TEST_EXPORT_SDK_NAME']
+
         # Check for SDK
-        testexport_dir = get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
-        sdk_dir = get_bb_var('TEST_EXPORT_SDK_DIR', 'core-image-minimal')
-        tarball_name = "%s.sh" % get_bb_var('TEST_EXPORT_SDK_NAME', 'core-image-minimal')
+        tarball_name = "%s.sh" % sdk_name
         tarball_path = os.path.join(testexport_dir, sdk_dir, tarball_name)
         msg = "Couldn't find SDK tarball: %s" % tarball_path
         self.assertEqual(os.path.isfile(tarball_path), True, msg)
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 35c2dc1..006afbe 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -1,5 +1,5 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import os
 import glob
 import re
@@ -59,15 +59,17 @@ class Signing(oeSelfTest):
 
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
-        pkgdatadir = get_bb_var('PKGDATA_DIR', test_recipe)
+        needed_vars = ['PKGDATA_DIR', 'DEPLOY_DIR_RPM', 'PACKAGE_ARCH', 'STAGING_BINDIR_NATIVE']
+        bb_vars = get_bb_vars(needed_vars, test_recipe)
+        pkgdatadir = bb_vars['PKGDATA_DIR']
         pkgdata = oe.packagedata.read_pkgdatafile(pkgdatadir + "/runtime/ed")
         if 'PKGE' in pkgdata:
             pf = pkgdata['PN'] + "-" + pkgdata['PKGE'] + pkgdata['PKGV'] + '-' + pkgdata['PKGR']
         else:
             pf = pkgdata['PN'] + "-" + pkgdata['PKGV'] + '-' + pkgdata['PKGR']
-        deploy_dir_rpm = get_bb_var('DEPLOY_DIR_RPM', test_recipe)
-        package_arch = get_bb_var('PACKAGE_ARCH', test_recipe).replace('-', '_')
-        staging_bindir_native = get_bb_var('STAGING_BINDIR_NATIVE', test_recipe)
+        deploy_dir_rpm = bb_vars['DEPLOY_DIR_RPM']
+        package_arch = bb_vars['PACKAGE_ARCH'].replace('-', '_')
+        staging_bindir_native = bb_vars['STAGING_BINDIR_NATIVE']
 
         pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
 
diff --git a/meta/lib/oeqa/selftest/sstate.py b/meta/lib/oeqa/selftest/sstate.py
index 742f4d0..f54bc41 100644
--- a/meta/lib/oeqa/selftest/sstate.py
+++ b/meta/lib/oeqa/selftest/sstate.py
@@ -6,17 +6,24 @@ import shutil
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_test_layer
 
 
 class SStateBase(oeSelfTest):
 
     def setUpLocal(self):
         self.temp_sstate_location = None
-        self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.hostdistro = get_bb_var('NATIVELSBSTRING')
+        needed_vars = ['SSTATE_DIR', 'NATIVELSBSTRING', 'TCLIBC', 'TUNE_ARCH',
+                       'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
+        bb_vars = get_bb_vars(needed_vars)
+        self.sstate_path = bb_vars['SSTATE_DIR']
+        self.hostdistro = bb_vars['NATIVELSBSTRING']
+        self.tclibc = bb_vars['TCLIBC']
+        self.tune_arch = bb_vars['TUNE_ARCH']
+        self.topdir = bb_vars['TOPDIR']
+        self.target_vendor = bb_vars['TARGET_VENDOR']
+        self.target_os = bb_vars['TARGET_OS']
         self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
-        self.tclibc = get_bb_var('TCLIBC')
 
     # Creates a special sstate configuration with the option to add sstate mirrors
     def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
@@ -27,8 +34,9 @@ class SStateBase(oeSelfTest):
             config_temp_sstate = "SSTATE_DIR = \"%s\"" % temp_sstate_path
             self.append_config(config_temp_sstate)
             self.track_for_cleanup(temp_sstate_path)
-        self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.hostdistro = get_bb_var('NATIVELSBSTRING')
+        bb_vars = get_bb_vars(['SSTATE_DIR', 'NATIVELSBSTRING'])
+        self.sstate_path = bb_vars['SSTATE_DIR']
+        self.hostdistro = bb_vars['NATIVELSBSTRING']
         self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
 
         if add_local_mirrors:
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 783d3d0..5814815 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -41,13 +41,11 @@ class SStateTests(SStateBase):
 
     @testcase(975)
     def test_sstate_creation_distro_specific_pass(self):
-        targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
     @testcase(1374)
     def test_sstate_creation_distro_specific_fail(self):
-        targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
+        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
     @testcase(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
@@ -80,8 +78,7 @@ class SStateTests(SStateBase):
 
     @testcase(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
-        targetarch = get_bb_var('TUNE_ARCH')
-        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
+        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
         # glibc-initial is intended only for the glibc C library
         if self.tclibc == 'glibc':
             targets.append('glibc-initial')
@@ -95,8 +92,7 @@ class SStateTests(SStateBase):
 
     @testcase(1377)
     def test_cleansstate_task_distro_specific(self):
-        targetarch = get_bb_var('TUNE_ARCH')
-        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
+        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
         # glibc-initial is intended only for the glibc C library
         if self.tclibc == 'glibc':
             targets.append('glibc-initial')
@@ -137,13 +133,11 @@ class SStateTests(SStateBase):
 
     @testcase(175)
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
-        targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch, 'binutils-native'], temp_sstate_location=True)
+        self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
 
     @testcase(1372)
     def test_rebuild_distro_specific_sstate_cross_target(self):
-        targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch], temp_sstate_location=True)
+        self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch], temp_sstate_location=True)
 
     @testcase(1373)
     def test_rebuild_distro_specific_sstate_native_target(self):
@@ -158,10 +152,9 @@ class SStateTests(SStateBase):
         self.assertTrue(len(global_config) == len(target_config), msg='Lists global_config and target_config should have the same number of elements')
         self.config_sstate(temp_sstate_location=True, add_local_mirrors=[self.sstate_path])
 
-        # If buildhistory is enabled, we need to disable version-going-backwards QA checks for this test. It may report errors otherwise.
-        if ('buildhistory' in get_bb_var('USER_CLASSES')) or ('buildhistory' in get_bb_var('INHERIT')):
-            remove_errors_config = 'ERROR_QA_remove = "version-going-backwards"'
-            self.append_config(remove_errors_config)
+        # If buildhistory is enabled, we need to disable version-going-backwards
+        # QA checks for this test. It may report errors otherwise.
+        self.append_config('ERROR_QA_remove = "version-going-backwards"')
 
         # For not this only checks if random sstate tasks are handled correctly as a group.
         # In the future we should add control over what tasks we check for.
@@ -242,8 +235,6 @@ class SStateTests(SStateBase):
         manually and check using bitbake -S.
         """
 
-        topdir = get_bb_var('TOPDIR')
-        targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
@@ -252,7 +243,7 @@ BUILD_OS = "linux"
 SDKMACHINE = "x86_64"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
         self.write_config("""
 MACHINE = "qemux86"
@@ -262,7 +253,7 @@ BUILD_OS = "linux"
 SDKMACHINE = "i686"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
 
         def get_files(d):
@@ -275,9 +266,9 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
                     continue
                 f.extend(os.path.join(root, name) for name in files)
             return f
-        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
-        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
-        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash").replace("i686-linux", "x86_64-linux").replace("i686" + targetvendor + "-linux", "x86_64" + targetvendor + "-linux", ) for x in files2]
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/")
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/")
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash").replace("i686-linux", "x86_64-linux").replace("i686" + self.target_vendor + "-linux", "x86_64" + self.target_vendor + "-linux", ) for x in files2]
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
@@ -290,18 +281,17 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
         builds, override the variables manually and check using bitbake -S.
         """
 
-        topdir = get_bb_var('TOPDIR')
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 NATIVELSBSTRING = \"DistroA\"
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 NATIVELSBSTRING = \"DistroB\"
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
 
         def get_files(d):
@@ -309,8 +299,8 @@ NATIVELSBSTRING = \"DistroB\"
             for root, dirs, files in os.walk(d):
                 f.extend(os.path.join(root, name) for name in files)
             return f
-        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
-        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/")
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
@@ -359,14 +349,11 @@ MULTILIBS = \"\"
 
     def sstate_allarch_samesigs(self, configA, configB):
 
-        topdir = get_bb_var('TOPDIR')
-        targetos = get_bb_var('TARGET_OS')
-        targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config(configA)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
         self.write_config(configB)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("world meta-toolchain -S none")
 
         def get_files(d):
@@ -380,15 +367,15 @@ MULTILIBS = \"\"
                         (_, task, _, shash) = name.rsplit(".", 3)
                         f[os.path.join(os.path.basename(root), task)] = shash
             return f
-        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/all" + targetvendor + "-" + targetos)
-        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/all" + targetvendor + "-" + targetos)
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/all" + self.target_vendor + "-" + self.target_os)
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/all" + self.target_vendor + "-" + self.target_os)
         self.maxDiff = None
         self.assertEqual(files1, files2)
 
-        nativesdkdir = os.path.basename(glob.glob(topdir + "/tmp-sstatesamehash/stamps/*-nativesdk*-linux")[0])
+        nativesdkdir = os.path.basename(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/*-nativesdk*-linux")[0])
 
-        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/" + nativesdkdir)
-        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/" + nativesdkdir)
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/" + nativesdkdir)
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/" + nativesdkdir)
         self.maxDiff = None
         self.assertEqual(files1, files2)
 
@@ -400,9 +387,6 @@ MULTILIBS = \"\"
         qemux86copy machine to test this. Also include multilibs in the test.
         """
 
-        topdir = get_bb_var('TOPDIR')
-        targetos = get_bb_var('TARGET_OS')
-        targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 MACHINE = \"qemux86\"
@@ -410,7 +394,7 @@ require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
@@ -419,7 +403,7 @@ require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("world meta-toolchain -S none")
 
         def get_files(d):
@@ -433,8 +417,8 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
                     if "do_build" not in name and "do_populate_sdk" not in name:
                         f.append(os.path.join(root, name))
             return f
-        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps")
-        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps")
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps")
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
@@ -446,8 +430,6 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
         classes inherits should be the same.
         """
 
-        topdir = get_bb_var('TOPDIR')
-        targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
 BB_NUMBER_THREADS = "1"
@@ -458,8 +440,8 @@ DATE = "20161111"
 INHERIT_remove = "buildstats-summary buildhistory uninative"
 http_proxy = ""
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        self.track_for_cleanup(topdir + "/download1")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
+        self.track_for_cleanup(self.topdir + "/download1")
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
@@ -473,8 +455,8 @@ INHERIT_remove = "uninative"
 INHERIT += "buildstats-summary buildhistory"
 http_proxy = "http://example.com/"
 """)
-        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        self.track_for_cleanup(topdir + "/download2")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
+        self.track_for_cleanup(self.topdir + "/download2")
         bitbake("world meta-toolchain -S none")
 
         def get_files(d):
@@ -486,8 +468,8 @@ http_proxy = "http://example.com/"
                     base = os.sep.join(root.rsplit(os.sep, 2)[-2:] + [name])
                     f[base] = shash
             return f
-        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
-        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/")
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/")
         # Remove items that are identical in both sets
         for k,v in files1.items() & files2.items():
             del files1[k]
@@ -500,8 +482,8 @@ http_proxy = "http://example.com/"
             if k in files1 and k in files2:
                 print("%s differs:" % k)
                 print(subprocess.check_output(("bitbake-diffsigs",
-                                               topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k],
-                                               topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k])))
+                                               self.topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k],
+                                               self.topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k])))
             elif k in files1 and k not in files2:
                 print("%s in files1" % k)
             elif k not in files1 and k in files2:
diff --git a/meta/lib/oeqa/selftest/tinfoil.py b/meta/lib/oeqa/selftest/tinfoil.py
index 6ad106c..38ec7a3 100644
--- a/meta/lib/oeqa/selftest/tinfoil.py
+++ b/meta/lib/oeqa/selftest/tinfoil.py
@@ -4,7 +4,7 @@ import re
 import bb.tinfoil
 
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, get_bb_var
+from oeqa.utils.commands import runCmd
 from oeqa.utils.decorators import testcase
 
 class TinfoilTests(oeSelfTest):
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 417ba3d..4534a64 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,7 +29,7 @@ from glob import glob
 from shutil import rmtree
 
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 from oeqa.utils.decorators import testcase
 
 
@@ -212,12 +212,11 @@ class Wic(oeSelfTest):
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        variables = (('STAGING_DATADIR', 'wic-tools'),
-                     ('RECIPE_SYSROOT_NATIVE', 'wic-tools'),
-                     ('DEPLOY_DIR_IMAGE', 'core-image-minimal'),
-                     ('IMAGE_ROOTFS', 'core-image-minimal'))
-        bbvars = {var.lower(): get_bb_var(var, recipe) \
-                      for var, recipe in variables}
+        bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
+                               'wic-tools')
+        bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
+                                 'core-image-minimal'))
+        bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['resultdir'] = self.resultdir
         status = runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
@@ -321,12 +320,11 @@ class Wic(oeSelfTest):
     @testcase(1269)
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        variables = (('STAGING_DATADIR', 'wic-tools'),
-                     ('RECIPE_SYSROOT_NATIVE', 'wic-tools'),
-                     ('DEPLOY_DIR_IMAGE', 'core-image-minimal'),
-                     ('IMAGE_ROOTFS', 'core-image-minimal'))
-        bbvars = {var.lower(): get_bb_var(var, recipe) \
-                      for var, recipe in variables}
+        bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
+                               'wic-tools')
+        bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
+                                 'core-image-minimal'))
+        bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['wks'] = "directdisk-multi-rootfs"
         bbvars['resultdir'] = self.resultdir
         status = runCmd("wic create %(wks)s "
@@ -360,8 +358,9 @@ class Wic(oeSelfTest):
         """Generate and obtain the path to <image>.env"""
         if image not in self.wicenv_cache:
             self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
-            stdir = get_bb_var('STAGING_DIR', image)
-            machine = get_bb_var('MACHINE', image)
+            bb_vars = get_bb_vars(['STAGING_DIR', 'MACHINE'], image)
+            stdir = bb_vars['STAGING_DIR']
+            machine = bb_vars['MACHINE']
             self.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return self.wicenv_cache[image]
 
@@ -371,12 +370,13 @@ class Wic(oeSelfTest):
         image = 'core-image-minimal'
         imgdatadir = self._get_image_env_path(image)
 
-        basename = get_bb_var('IMAGE_BASENAME', image)
+        bb_vars = get_bb_vars(['IMAGE_BASENAME', 'WICVARS'], image)
+        basename = bb_vars['IMAGE_BASENAME']
         self.assertEqual(basename, image)
         path = os.path.join(imgdatadir, basename) + '.env'
         self.assertTrue(os.path.isfile(path))
 
-        wicvars = set(get_bb_var('WICVARS', image).split())
+        wicvars = set(bb_vars['WICVARS'].split())
         # filter out optional variables
         wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
                                       'INITRD', 'INITRD_LIVE', 'ISODIR'))
@@ -418,8 +418,9 @@ class Wic(oeSelfTest):
         self.assertEqual(0, bitbake('wic-image-minimal').status)
         self.remove_config(config)
 
-        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
+        deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
+        machine = bb_vars['MACHINE']
         prefix = os.path.join(deploy_dir, 'wic-image-minimal-%s.' % machine)
         # check if we have result image and manifests symlinks
         # pointing to existing files
-- 
2.6.6


