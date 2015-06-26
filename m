Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C0D78607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:07:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jun 2015 08:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,685,1427785200"; d="scan'208";a="718200452"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Jun 2015 08:07:31 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id 547456A4005;
	Fri, 26 Jun 2015 08:06:52 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 18:07:05 +0300
Message-Id: <1435331227-25862-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] Added 'testcase' decorator to oe-selftest test cases missing this feature.
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
X-List-Received-Date: Fri, 26 Jun 2015 15:07:42 -0000

---
 meta/lib/oeqa/selftest/bblayers.py     |  1 +
 meta/lib/oeqa/selftest/devtool.py      | 16 ++++++++++++++++
 meta/lib/oeqa/selftest/layerappend.py  |  1 +
 meta/lib/oeqa/selftest/lic-checksum.py |  2 ++
 meta/lib/oeqa/selftest/pkgdata.py      |  8 ++++++++
 meta/lib/oeqa/selftest/recipetool.py   | 25 ++++++++++++++++++++++---
 meta/lib/oeqa/selftest/wic.py          |  7 +++++++
 7 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 3a18029..bf3dd1b 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -43,6 +43,7 @@ class BitbakeLayers(oeSelfTest):
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents)
 
+    @testcase(1195)
     def test_bitbakelayers_add_remove(self):
         test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index c4a0399..5dc0947 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -84,6 +84,7 @@ class DevtoolBase(oeSelfTest):
 
 class DevtoolTests(DevtoolBase):
 
+    @testcase(1158)
     def test_create_workspace(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -106,6 +107,7 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(tempdir, result.output)
         self.assertIn(workspacedir, result.output)
 
+    @testcase(1159)
     def test_devtool_add(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -140,6 +142,7 @@ class DevtoolTests(DevtoolBase):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
+    @testcase(1162)
     def test_devtool_add_library(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -180,6 +183,7 @@ class DevtoolTests(DevtoolBase):
         self.assertFalse(matches, 'Stamp files exist for recipe libftdi that should have been cleaned')
         self.assertFalse(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary still found in STAGING_LIBDIR after cleaning')
 
+    @testcase(1160)
     def test_devtool_add_fetch(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -226,6 +230,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
 
+    @testcase(1161)
     def test_devtool_add_fetch_git(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -277,6 +282,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
+    @testcase(1164)
     def test_devtool_modify(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -328,6 +334,7 @@ class DevtoolTests(DevtoolBase):
         matches = glob.glob(stampprefix + '*')
         self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
 
+    @testcase(1166)
     def test_devtool_modify_invalid(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -360,6 +367,7 @@ class DevtoolTests(DevtoolBase):
             self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed' % testrecipe)
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
+    @testcase(1165)
     def test_devtool_modify_git(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -393,6 +401,7 @@ class DevtoolTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
+    @testcase(1167)
     def test_devtool_modify_localfiles(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -425,6 +434,7 @@ class DevtoolTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
+    @testcase(1169)
     def test_devtool_update_recipe(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -471,6 +481,7 @@ class DevtoolTests(DevtoolBase):
             else:
                 raise AssertionError('Unexpected modified file in status: %s' % line)
 
+    @testcase(1172)
     def test_devtool_update_recipe_git(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -545,6 +556,7 @@ class DevtoolTests(DevtoolBase):
                         break
                 self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
 
+    @testcase(1170)
     def test_devtool_update_recipe_append(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -620,6 +632,7 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
 
+    @testcase(1171)
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -716,6 +729,7 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
 
+    @testcase(1163)
     def test_devtool_extract(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -729,6 +743,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
         self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
 
+    @testcase(1168)
     def test_devtool_reset_all(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
@@ -758,6 +773,7 @@ class DevtoolTests(DevtoolBase):
         matches2 = glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe2)
 
+    @testcase(1207)
     def test_devtool_deploy_target(self):
         # NOTE: Whilst this test would seemingly be better placed as a runtime test,
         # unfortunately the runtime tests run under bitbake and you can't run
diff --git a/meta/lib/oeqa/selftest/layerappend.py b/meta/lib/oeqa/selftest/layerappend.py
index 79b6137..a82a6c8 100644
--- a/meta/lib/oeqa/selftest/layerappend.py
+++ b/meta/lib/oeqa/selftest/layerappend.py
@@ -51,6 +51,7 @@ SRC_URI_append += "file://appendtest.txt"
     def tearDownLocal(self):
         ftools.remove_from_file(self.builddir + "/conf/bblayers.conf", self.layerappend.replace("COREBASE", self.builddir + "/.."))
 
+    @testcase(1196)
     def test_layer_appends(self):
         corebase = get_bb_var("COREBASE")
         stagingdir = get_bb_var("STAGING_DIR_TARGET")
diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/lic-checksum.py
index 92fc3a8..bd3b9a1 100644
--- a/meta/lib/oeqa/selftest/lic-checksum.py
+++ b/meta/lib/oeqa/selftest/lic-checksum.py
@@ -4,11 +4,13 @@ import tempfile
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import bitbake
 from oeqa.utils import CommandError
+from oeqa.utils.decorators import testcase
 
 class LicenseTests(oeSelfTest):
 
     # Verify that changing a license file that has an absolute path causes
     # the license qa to fail due to a mismatched md5sum.
+    @testcase(1197)
     def test_nonmatching_checksum(self):
         bitbake_cmd = '-c configure emptytest'
         error_msg = 'ERROR: emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc'
diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index 34eea46..c4d34bd 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -18,6 +18,7 @@ class OePkgdataUtilTests(oeSelfTest):
         logger.info('Running bitbake to generate pkgdata')
         bitbake('glibc busybox zlib bash')
 
+    @testcase(1203)
     def test_lookup_pkg(self):
         # Forward tests
         result = runCmd('oe-pkgdata-util lookup-pkg "glibc busybox"')
@@ -36,6 +37,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.status, 1)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
+    @testcase(1205)
     def test_read_value(self):
         result = runCmd('oe-pkgdata-util read-value PN libz1')
         self.assertEqual(result.output, 'zlib')
@@ -43,6 +45,7 @@ class OePkgdataUtilTests(oeSelfTest):
         pkgsize = int(result.output.strip())
         self.assertGreater(pkgsize, 1)
 
+    @testcase(1198)
     def test_find_path(self):
         result = runCmd('oe-pkgdata-util find-path /lib/libc.so.6')
         self.assertEqual(result.output, 'glibc: /lib/libc.so.6')
@@ -52,6 +55,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.status, 1)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
 
+    @testcase(1204)
     def test_lookup_recipe(self):
         result = runCmd('oe-pkgdata-util lookup-recipe "libc6-staticdev busybox"')
         self.assertEqual(result.output, 'glibc\nbusybox')
@@ -61,6 +65,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.status, 1)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
+    @testcase(1202)
     def test_list_pkgs(self):
         # No arguments
         result = runCmd('oe-pkgdata-util list-pkgs')
@@ -105,6 +110,7 @@ class OePkgdataUtilTests(oeSelfTest):
         pkglist = sorted(result.output.split())
         self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'])
 
+    @testcase(1201)
     def test_list_pkg_files(self):
         def splitoutput(output):
             files = {}
@@ -193,6 +199,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
 
+    @testcase(1200)
     def test_glob(self):
         tempdir = tempfile.mkdtemp(prefix='pkgdataqa')
         self.track_for_cleanup(tempdir)
@@ -213,6 +220,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertNotIn('libz-dev', resultlist)
         self.assertNotIn('libz-dbg', resultlist)
 
+    @testcase(1206)
     def test_specify_pkgdatadir(self):
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg glibc' % get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libc6')
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index f3ad493..594a2ec 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -71,7 +71,7 @@ class RecipetoolTests(DevtoolBase):
         for errorstr in checkerror:
             self.assertIn(errorstr, result.output)
 
-
+    @testcase(1177)
     def test_recipetool_appendfile_basic(self):
         # Basic test
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -79,12 +79,14 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('base-files', '/etc/motd', self.testfile, '', expectedlines, ['motd'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1183)
     def test_recipetool_appendfile_invalid(self):
         # Test some commands that should error
         self._try_recipetool_appendfile_fail('/etc/passwd', self.testfile, ['ERROR: /etc/passwd cannot be handled by this tool', 'useradd', 'extrausers'])
         self._try_recipetool_appendfile_fail('/etc/timestamp', self.testfile, ['ERROR: /etc/timestamp cannot be handled by this tool'])
         self._try_recipetool_appendfile_fail('/dev/console', self.testfile, ['ERROR: /dev/console cannot be handled by this tool'])
 
+    @testcase(1176)
     def test_recipetool_appendfile_alternatives(self):
         # Now try with a file we know should be an alternative
         # (this is very much a fake example, but one we know is reliably an alternative)
@@ -109,12 +111,14 @@ class RecipetoolTests(DevtoolBase):
         result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
         self.assertNotEqual(result.status, 0, 'New file should have been copied but was not')
 
+    @testcase(1178)
     def test_recipetool_appendfile_binary(self):
         # Try appending a binary file
         result = runCmd('recipetool appendfile %s /bin/ls /bin/ls -r coreutils' % templayerdir)
         self.assertIn('WARNING: ', result.output)
         self.assertIn('is a binary', result.output)
 
+    @testcase(1173)
     def test_recipetool_appendfile_add(self):
         corebase = get_bb_var('COREBASE')
         # Try arbitrary file add to a recipe
@@ -144,6 +148,7 @@ class RecipetoolTests(DevtoolBase):
                          '}\n']
         self._try_recipetool_appendfile('netbase', '/usr/share/scriptname', testfile2, '-r netbase', expectedlines, ['testfile', testfile2name])
 
+    @testcase(1174)
     def test_recipetool_appendfile_add_bindir(self):
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -157,6 +162,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('netbase', '/usr/bin/selftest-recipetool-testbin', self.testfile, '-r netbase', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1175)
     def test_recipetool_appendfile_add_machine(self):
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -172,6 +178,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase -m mymachine', expectedlines, ['mymachine/testfile'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1184)
     def test_recipetool_appendfile_orig(self):
         # A file that's in SRC_URI and in do_install with the same name
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -179,6 +186,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-orig', self.testfile, '', expectedlines, ['selftest-replaceme-orig'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1191)
     def test_recipetool_appendfile_todir(self):
         # A file that's in SRC_URI and in do_install with destination directory rather than file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -186,6 +194,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-todir', self.testfile, '', expectedlines, ['selftest-replaceme-todir'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1187)
     def test_recipetool_appendfile_renamed(self):
         # A file that's in SRC_URI with a different name to the destination file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -193,6 +202,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-renamed', self.testfile, '', expectedlines, ['file1'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1190)
     def test_recipetool_appendfile_subdir(self):
         # A file that's in SRC_URI in a subdir
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -206,6 +216,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-subdir', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1189)
     def test_recipetool_appendfile_src_glob(self):
         # A file that's in SRC_URI as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -219,6 +230,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-src-globfile', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1181)
     def test_recipetool_appendfile_inst_glob(self):
         # A file that's in do_install as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -226,6 +238,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-globfile'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1182)
     def test_recipetool_appendfile_inst_todir_glob(self):
         # A file that's in do_install as a glob with destination as a directory
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -233,6 +246,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-todir-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-todir-globfile'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1185)
     def test_recipetool_appendfile_patch(self):
         # A file that's added by a patch in SRC_URI
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -251,6 +265,7 @@ class RecipetoolTests(DevtoolBase):
         else:
             self.assertTrue(False, 'Patch warning not found in output:\n%s' % output)
 
+    @testcase(1188)
     def test_recipetool_appendfile_script(self):
         # Now, a file that's in SRC_URI but installed by a script (so no mention in do_install)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -264,6 +279,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-scripted', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1180)
     def test_recipetool_appendfile_inst_func(self):
         # A file that's installed from a function called by do_install
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -271,6 +287,7 @@ class RecipetoolTests(DevtoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-func', self.testfile, '', expectedlines, ['selftest-replaceme-inst-func'])
         self.assertNotIn('WARNING: ', output)
 
+    @testcase(1186)
     def test_recipetool_appendfile_postinstall(self):
         # A file that's created by a postinstall script (and explicitly mentioned in it)
         # First try without specifying recipe
@@ -286,6 +303,7 @@ class RecipetoolTests(DevtoolBase):
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-postinst', self.testfile, '-r selftest-recipetool-appendfile', expectedlines, ['testfile'])
 
+    @testcase(1179)
     def test_recipetool_appendfile_extlayer(self):
         # Try creating a bbappend in a layer that's not in bblayers.conf and has a different structure
         exttemplayerdir = os.path.join(self.tempdir, 'extlayer')
@@ -301,6 +319,7 @@ class RecipetoolTests(DevtoolBase):
                          'metadata/recipes/recipes-test/selftest-recipetool-appendfile/selftest-recipetool-appendfile/selftest-replaceme-orig']
         self.assertEqual(sorted(createdfiles), sorted(expectedfiles))
 
+    @testcase(1192)
     def test_recipetool_appendfile_wildcard(self):
 
         def try_appendfile_wc(options):
@@ -325,8 +344,7 @@ class RecipetoolTests(DevtoolBase):
         filename = try_appendfile_wc('-w')
         self.assertEqual(filename, recipefn.split('_')[0] + '_%.bbappend')
 
-
-
+    @testcase(1193)
     def test_recipetool_create(self):
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
@@ -343,6 +361,7 @@ class RecipetoolTests(DevtoolBase):
         checkvars['SRC_URI[sha256sum]'] = 'f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64'
         self._test_recipe_contents(recipefile, checkvars, [])
 
+    @testcase(1194)
     def test_recipetool_create_git(self):
         # Ensure we have the right data in shlibs/pkgdata
         bitbake('libpng pango libx11 libxext jpeg')
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 358f09e..96f5f0e 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -30,6 +30,7 @@ from shutil import rmtree
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake
+from oeqa.utils.decorators import testcase
 
 class Wic(oeSelfTest):
     """Wic test class."""
@@ -46,24 +47,29 @@ class Wic(oeSelfTest):
         """This code is executed before each test method."""
         rmtree(self.resultdir, ignore_errors=True)
 
+    @testcase(1152)
     def test01_help(self):
         """Test wic --help"""
         self.assertEqual(0, runCmd('wic --help').status)
 
+    @testcase(1153)
     def test02_createhelp(self):
         """Test wic create --help"""
         self.assertEqual(0, runCmd('wic creat --help').status)
 
+    @testcase(1154)
     def test03_listhelp(self):
         """Test wic list --help"""
         self.assertEqual(0, runCmd('wic list --help').status)
 
+    @testcase(1155)
     def test04_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
+    @testcase(1156)
     def test05_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -74,6 +80,7 @@ class Wic(oeSelfTest):
                                    "core-image-minimal/1.0-r0/rootfs").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
+    @testcase(1157)
     def test06_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
-- 
2.1.4


