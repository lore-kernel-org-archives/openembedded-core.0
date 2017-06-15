Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 22259783B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:49:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 05:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="274633785"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2017 05:49:25 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 05:49:22 -0700
Message-Id: <20170615124922.46253-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 2/2] selftest: Add Testopia ID to test cases
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
X-List-Received-Date: Thu, 15 Jun 2017 12:49:24 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Add decorator @OETestID() with proper Tesopia TC ID to the test cases
that did not have it set.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/containerimage.py     |  2 ++
 meta/lib/oeqa/selftest/cases/devtool.py            | 10 ++++++++++
 meta/lib/oeqa/selftest/cases/image_typedep.py      |  2 ++
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |  1 +
 meta/lib/oeqa/selftest/cases/liboe.py              |  4 ++++
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py |  4 ++++
 meta/lib/oeqa/selftest/cases/package.py            |  4 ++++
 meta/lib/oeqa/selftest/cases/recipetool.py         |  4 ++++
 meta/lib/oeqa/selftest/cases/runtime_test.py       |  4 ++++
 meta/lib/oeqa/selftest/cases/sstatetests.py        |  2 ++
 meta/lib/oeqa/selftest/cases/tinfoil.py            |  1 +
 meta/lib/oeqa/selftest/cases/wic.py                | 19 +++++++++++++++++++
 12 files changed, 57 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 73162fa600a..99a5cc9e575 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -2,6 +2,7 @@ import os
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
+from oeqa.core.decorator.oeid import OETestID
 
 # This test builds an image with using the "container" IMAGE_FSTYPE, and
 # ensures that then files in the image are only the ones expected.
@@ -20,6 +21,7 @@ class ContainerImageTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
+    @OETestID(1619)
     def test_expected_files(self):
 
         def get_each_path_part(path):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 06ecf404738..a0406e6b1f6 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -491,6 +491,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
 
+    @OETestID(1620)
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
             f = os.path.join(path, *paths)
@@ -1013,6 +1014,7 @@ class DevtoolTests(DevtoolBase):
                            ('??', '.*/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    @OETestID(1627)
     def test_devtool_update_recipe_local_files_3(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-localonly'
@@ -1032,6 +1034,7 @@ class DevtoolTests(DevtoolBase):
         expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    @OETestID(1629)
     def test_devtool_update_recipe_local_patch_gz(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-patch-gz'
@@ -1059,6 +1062,7 @@ class DevtoolTests(DevtoolBase):
         if 'gzip compressed data' not in result.output:
             self.fail('New patch file is not gzipped - file reports:\n%s' % result.output)
 
+    @OETestID(1628)
     def test_devtool_update_recipe_local_files_subdir(self):
         # Try devtool extract on a recipe that has a file with subdir= set in
         # SRC_URI such that it overwrites a file that was in an archive that
@@ -1363,6 +1367,7 @@ class DevtoolTests(DevtoolBase):
             shutil.copy(srcfile, dstfile)
             self.track_for_cleanup(dstfile)
 
+    @OETestID(1625)
     def test_devtool_load_plugin(self):
         """Test that devtool loads only the first found plugin in BBPATH."""
 
@@ -1430,6 +1435,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.exists(os.path.join(olddir, patchfn)), 'Original patch file does not exist')
         return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn
 
+    @OETestID(1623)
     def test_devtool_finish_upgrade_origlayer(self):
         recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1448,6 +1454,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.exists(os.path.join(newdir, patchfn)), 'Patch file should have been copied into new directory but wasn\'t')
         self.assertTrue(os.path.exists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch')), 'New patch file should have been created but wasn\'t')
 
+    @OETestID(1624)
     def test_devtool_finish_upgrade_otherlayer(self):
         recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1503,6 +1510,7 @@ class DevtoolTests(DevtoolBase):
             self.fail('Unable to find recipe files directory for %s' % recipe)
         return recipe, oldrecipefile, recipedir, filesdir
 
+    @OETestID(1621)
     def test_devtool_finish_modify_origlayer(self):
         recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1517,6 +1525,7 @@ class DevtoolTests(DevtoolBase):
                            ('??', '.*/.*-Add-a-comment-to-the-code.patch$')]
         self._check_repo_status(recipedir, expected_status)
 
+    @OETestID(1622)
     def test_devtool_finish_modify_otherlayer(self):
         recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1549,6 +1558,7 @@ class DevtoolTests(DevtoolBase):
         if files:
             self.fail('Unexpected file(s) copied next to bbappend: %s' % ', '.join(files))
 
+    @OETestID(1626)
     def test_devtool_rename(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index 0614c765b45..e6788853a36 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -2,11 +2,13 @@ import os
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
+from oeqa.core.decorator.oeid import OETestID
 
 class ImageTypeDepTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
+    @OETestID(1633)
     def test_conversion_typedep_added(self):
 
         self.write_recipeinc('emptytest', """
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 45a06feaf34..e6652ec7aba 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -96,6 +96,7 @@ class ImageFeatures(OESelftestTestCase):
         # Build a core-image-weston
         bitbake('core-image-weston')
 
+    @OETestID(1497)
     def test_bmap(self):
         """
         Summary:     Check bmap support
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index 01b2cab7aa7..e84609246a7 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -1,4 +1,5 @@
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
 import os
@@ -10,6 +11,7 @@ class LibOE(OESelftestTestCase):
         super(LibOE, cls).setUpClass()
         cls.tmp_dir = get_bb_var('TMPDIR')
 
+    @OETestID(1635)
     def test_copy_tree_special(self):
         """
         Summary:    oe.path.copytree() should copy files with special character
@@ -35,6 +37,7 @@ class LibOE(OESelftestTestCase):
 
         oe.path.remove(testloc)
 
+    @OETestID(1636)
     def test_copy_tree_xattr(self):
         """
         Summary:    oe.path.copytree() should preserve xattr on copied files
@@ -69,6 +72,7 @@ class LibOE(OESelftestTestCase):
 
         oe.path.remove(testloc)
 
+    @OETestID(1634)
     def test_copy_hardlink_tree_count(self):
         """
         Summary:    oe.path.copyhardlinktree() shouldn't miss out files
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index f9bec53d4ae..08675fd8208 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -2,6 +2,7 @@ import os
 from oeqa.selftest.case import OESelftestTestCase
 import tempfile
 from oeqa.utils.commands import get_bb_var
+from oeqa.core.decorator.oeid import OETestID
 
 class TestBlobParsing(OESelftestTestCase):
 
@@ -39,6 +40,7 @@ class TestBlobParsing(OESelftestTestCase):
         self.repo.git.add("--all")
         self.repo.git.commit(message=msg)
 
+    @OETestID(1859)
     def test_blob_to_dict(self):
         """
         Test convertion of git blobs to dictionary
@@ -51,6 +53,7 @@ class TestBlobParsing(OESelftestTestCase):
         self.assertEqual(valuesmap, blob_to_dict(blob),
             "commit was not translated correctly to dictionary")
 
+    @OETestID(1860)
     def test_compare_dict_blobs(self):
         """
         Test comparisson of dictionaries extracted from git blobs
@@ -71,6 +74,7 @@ class TestBlobParsing(OESelftestTestCase):
         var_changes = { x.fieldname : (x.oldvalue, x.newvalue) for x in change_records}
         self.assertEqual(changesmap, var_changes, "Changes not reported correctly")
 
+    @OETestID(1861)
     def test_compare_dict_blobs_default(self):
         """
         Test default values for comparisson of git blob dictionaries
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 6a8bc9283ff..5b9a6d15851 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,4 +1,5 @@
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.commands import bitbake, get_bb_vars
 import subprocess, os
 import oe.path
@@ -32,6 +33,7 @@ class VersionOrdering(OESelftestTestCase):
         self.bindir = type(self).bindir
         self.libdir = type(self).libdir
 
+    @OETestID(1880)
     def test_dpkg(self):
         for ver1, ver2, sort in self.tests:
             op = { -1: "<<", 0: "=", 1: ">>" }[sort]
@@ -48,6 +50,7 @@ class VersionOrdering(OESelftestTestCase):
             status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
+    @OETestID(1881)
     def test_opkg(self):
         for ver1, ver2, sort in self.tests:
             op = { -1: "<<", 0: "=", 1: ">>" }[sort]
@@ -64,6 +67,7 @@ class VersionOrdering(OESelftestTestCase):
             status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
+    @OETestID(1882)
     def test_rpm(self):
         # Need to tell the Python bindings where to find its configuration
         env = os.environ.copy()
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 46f0a7206b1..bdd405f1cc0 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -443,6 +443,7 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    @OETestID(1638)
     def test_recipetool_create_github(self):
         # Basic test to see if github URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -457,6 +458,7 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['setuptools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    @OETestID(1639)
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -472,6 +474,7 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['setuptools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    @OETestID(1637)
     def test_recipetool_create_git_http(self):
         # Basic test to check http git URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -499,6 +502,7 @@ class RecipetoolTests(RecipetoolBase):
             shutil.copy(srcfile, dstfile)
             self.track_for_cleanup(dstfile)
 
+    @OETestID(1640)
     def test_recipetool_load_plugin(self):
         """Test that recipetool loads only the first found plugin in BBPATH."""
 
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 2ac0a29761c..2a70ae15b81 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -11,6 +11,7 @@ class TestExport(OESelftestTestCase):
         runCmd("rm -rf /tmp/sdk")
         super(TestExport, cls).tearDownClass()
 
+    @OETestID(1499)
     def test_testexport_basic(self):
         """
         Summary: Check basic testexport functionality with only ping test enabled.
@@ -50,6 +51,7 @@ class TestExport(OESelftestTestCase):
             # Verify ping test was succesful
             self.assertEqual(0, result.status, 'oe-test runtime returned a non 0 status')
 
+    @OETestID(1641)
     def test_testexport_sdk(self):
         """
         Summary: Check sdk functionality for testexport.
@@ -104,6 +106,7 @@ class TestExport(OESelftestTestCase):
 
 class TestImage(OESelftestTestCase):
 
+    @OETestID(1644)
     def test_testimage_install(self):
         """
         Summary: Check install packages functionality for testimage/testexport.
@@ -123,6 +126,7 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
+    @OETestID(1883)
     def test_testimage_dnf(self):
         """
         Summary: Check package feeds functionality for dnf
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index e68ef5cbe97..07a206824aa 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -310,6 +310,7 @@ MACHINE = \"qemuarm\"
 """
         self.sstate_allarch_samesigs(configA, configB)
 
+    @OETestID(1645)
     def test_sstate_allarch_samesigs_multilib(self):
         """
         The sstate checksums of allarch multilib packages should be independent of whichever
@@ -410,6 +411,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
         self.assertCountEqual(files1, files2)
 
 
+    @OETestID(1498)
     def test_sstate_noop_samesigs(self):
         """
         The sstate checksums of two builds with these variables changed or
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 1394d426e70..3a58761c002 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -152,6 +152,7 @@ class TinfoilTests(OESelftestTestCase):
             value = tinfoil.run_command('getVariable', 'TESTVAR')
             self.assertEqual(value, 'specialvalue', 'Value set using config_data.setVar() is not reflected in config_data.getVar()')
 
+    @OETestID(1884)
     def test_datastore_operations(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ee9ff0f2dd9..02c7d0f66e1 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -311,6 +311,7 @@ class Wic(OESelftestTestCase):
                                    "-D -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
+    @OETestID(1658)
     def test_debug_long(self):
         """Test --debug option"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -326,6 +327,7 @@ class Wic(OESelftestTestCase):
                                    "-s -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
+    @OETestID(1671)
     def test_skip_build_check_long(self):
         """Test --skip-build-check option"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -342,6 +344,7 @@ class Wic(OESelftestTestCase):
                                    "-f -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
+    @OETestID(1656)
     def test_build_rootfs_long(self):
         """Test --build-rootfs option"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -383,6 +386,7 @@ class Wic(OESelftestTestCase):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
+    @OETestID(1661)
     def test_exclude_path(self):
         """Test --exclude-path wks option."""
 
@@ -490,6 +494,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         finally:
             os.environ['PATH'] = oldpath
 
+    @OETestID(1662)
     def test_exclude_path_errors(self):
         """Test --exclude-path wks option error handling."""
         wks_file = 'temp.wks'
@@ -517,6 +522,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
+    @OETestID(1655)
     def test_bmap_long(self):
         """Test generation of .bmap file --bmap option"""
         cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s" % self.resultdir
@@ -569,6 +575,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                                    % (image, imgenvdir, self.resultdir)).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
+    @OETestID(1665)
     def test_image_vars_dir_long(self):
         """Test image vars directory selection --vars option"""
         image = 'core-image-minimal'
@@ -618,6 +625,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertEqual(output, '/dev/root /\r\n/dev/sda3 /mnt')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestID(1852)
     def test_qemu_efi(self):
         """Test core-image-minimal efi image under qemu"""
         config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "mkefidisk.wks"\n'
@@ -647,6 +655,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
         return wkspath, wksname
 
+    @OETestID(1847)
     def test_fixed_size(self):
         """
         Test creation of a simple image with partition size controlled through
@@ -677,6 +686,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(1, len(partlns))
         self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0])
 
+    @OETestID(1848)
     def test_fixed_size_error(self):
         """
         Test creation of a simple image with partition size controlled through
@@ -692,6 +702,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(0, len(wicout))
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestID(1854)
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
         # build ext4 and wic images
@@ -707,6 +718,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
 
+    @OETestID(1853)
     def test_rawcopy_plugin(self):
         """Test rawcopy plugin"""
         img = 'core-image-minimal'
@@ -723,6 +735,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
+    @OETestID(1849)
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""
         img = 'core-image-minimal'
@@ -742,6 +755,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
+    @OETestID(1851)
     def test_kickstart_parser(self):
         """Test wks parser options"""
         with NamedTemporaryFile("w", suffix=".wks") as wks:
@@ -754,6 +768,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
+    @OETestID(1850)
     def test_image_bootpart_globbed(self):
         """Test globbed sources with image-bootpart plugin"""
         img = "core-image-minimal"
@@ -764,6 +779,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.remove_config(config)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
+    @OETestID(1855)
     def test_sparse_copy(self):
         """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
         libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'wic')
@@ -792,6 +808,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 self.assertEqual(dest_stat.st_blocks, 8)
             os.unlink(dest)
 
+    @OETestID(1857)
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -812,6 +829,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(0, result.status)
         self.assertEqual(6, len(result.output.split('\n')))
 
+    @OETestID(1856)
     def test_wic_cp(self):
         """Test copy files and directories to the the wic image."""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -856,6 +874,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertEqual(8, len(result.output.split('\n')))
             self.assertTrue(os.path.basename(testdir) in result.output)
 
+    @OETestID(1858)
     def test_wic_rm(self):
         """Test removing files and directories from the the wic image."""
         self.assertEqual(0, runCmd("wic create mkefidisk "
-- 
2.12.0


