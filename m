Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9153F78170
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133865"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:17 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:37:08 -0500
Message-Id: <0ea37275524c3c9d8ba0d118c62a2371a901fbfc.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 22/29] oeqa/selftest/cases: devtool enable threaded runs
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Add new class DevtoolCommon to split devtool suite into other modules.
- Change to use wrappers from OESelfTest class (runCmd, bitbake).
- When remove workspacedir using bitbake-layers use full path because
now has it own builddir.
- Add a build of xz-native because some tests needs it to
decompress tarballs and is supposed to be provided, see bug [YOCTO #11474].

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 644 ++++++++++++++++----------------
 1 file changed, 325 insertions(+), 319 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 28c84679a17..c66e77a9ace 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -6,13 +6,12 @@ import glob
 import fnmatch
 
 import oeqa.utils.ftools as ftools
+from oeqa.utils.commands import create_temp_layer, runqemu
+
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
-from oeqa.utils.commands import get_bb_vars, runqemu
 from oeqa.core.decorator.oeid import OETestID
 
 class DevtoolBase(OESelftestTestCase):
-
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
             invar = None
@@ -62,7 +61,7 @@ class DevtoolBase(OESelftestTestCase):
             self.assertIn(inherit, inherits, 'Missing inherit of %s' % inherit)
 
     def _check_bbappend(self, testrecipe, recipefile, appenddir):
-        result = runCmd('bitbake-layers show-appends', cwd=self.builddir)
+        result = self.runCmd('bitbake-layers show-appends', cwd=self.builddir)
         resultlines = result.output.splitlines()
         inrecipe = False
         bbappends = []
@@ -88,7 +87,7 @@ class DevtoolBase(OESelftestTestCase):
         create_temp_layer(templayerdir, templayername, priority, recipepathspec)
         if addlayer:
             self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
-            result = runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
+            result = self.runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
 
     def _process_ls_output(self, output):
         """
@@ -114,47 +113,54 @@ class DevtoolBase(OESelftestTestCase):
         return filelist
 
 
-class DevtoolTests(DevtoolBase):
-
+class DevtoolCommon(DevtoolBase):
     @classmethod
     def setUpClass(cls):
-        super(DevtoolTests, cls).setUpClass()
-        bb_vars = get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
+        super(DevtoolCommon, cls).setUpClass()
+        bb_vars = cls.get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
         cls.original_sstate = bb_vars['SSTATE_DIR']
         cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
         cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
         cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
                             % cls.original_sstate)
 
+        # XXX: some test cases needs xz-native to unpack like mdadm recipes
+        # and it is supposed to be provided
+        cls.bitbake("xz-native")
+
     @classmethod
     def tearDownClass(cls):
         cls.logger.debug('Deleting devtool sstate cache on %s' % cls.devtool_sstate)
-        runCmd('rm -rf %s' % cls.devtool_sstate)
-        super(DevtoolTests, cls).tearDownClass()
+        cls.runCmd('rm -rf %s' % cls.devtool_sstate)
+        super(DevtoolCommon, cls).tearDownClass()
 
     def setUp(self):
         """Test case setup function"""
-        super(DevtoolTests, self).setUp()
+        super(DevtoolCommon, self).setUp()
         self.workspacedir = os.path.join(self.builddir, 'workspace')
         self.assertTrue(not os.path.exists(self.workspacedir),
                         'This test cannot be run with a workspace directory '
                         'under the build directory')
         self.append_config(self.sstate_conf)
 
+class DevtoolTests(DevtoolCommon):
+    _use_own_builddir = True
+    _main_thread = False
+
     def _check_src_repo(self, repo_dir):
         """Check srctree git repository"""
         self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
                         'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=repo_dir)
+        result = self.runCmd('git status --porcelain', cwd=repo_dir)
         self.assertEqual(result.output.strip(), "",
                          'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=repo_dir)
+        result = self.runCmd('git symbolic-ref HEAD', cwd=repo_dir)
         self.assertEqual(result.output.strip(), "refs/heads/devtool",
                          'Wrong branch in git repo')
 
     def _check_repo_status(self, repo_dir, expected_status):
         """Check the worktree status of a repository"""
-        result = runCmd('git status . --porcelain',
+        result = self.runCmd('git status . --porcelain',
                         cwd=repo_dir)
         for line in result.output.splitlines():
             for ind, (f_status, fn_re) in enumerate(expected_status):
@@ -171,21 +177,21 @@ class DevtoolTests(DevtoolBase):
     @OETestID(1158)
     def test_create_workspace(self):
         # Check preconditions
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
         # Try creating a workspace layer with a specific path
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        result = runCmd('devtool create-workspace %s' % tempdir)
+        result = self.runCmd('devtool create-workspace %s' % tempdir)
         self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')), msg = "No workspace created. devtool output: %s " % result.output)
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertIn(tempdir, result.output)
         # Try creating a workspace layer with the default path
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool create-workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool create-workspace')
         self.assertTrue(os.path.isfile(os.path.join(self.workspacedir, 'conf', 'layer.conf')), msg = "No workspace created. devtool output: %s " % result.output)
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertNotIn(tempdir, result.output)
         self.assertIn(self.workspacedir, result.output)
 
@@ -195,25 +201,25 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         url = 'http://www.ivarch.com/programs/sources/pv-1.5.3.tar.bz2'
-        result = runCmd('wget %s' % url, cwd=tempdir)
-        result = runCmd('tar xfv pv-1.5.3.tar.bz2', cwd=tempdir)
+        result = self.runCmd('wget %s' % url, cwd=tempdir)
+        result = self.runCmd('tar xfv pv-1.5.3.tar.bz2', cwd=tempdir)
         srcdir = os.path.join(tempdir, 'pv-1.5.3')
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate pv')
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add pv %s' % srcdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool add pv %s' % srcdir)
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn('pv', result.output)
         self.assertIn(srcdir, result.output)
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
-        bitbake('pv -c cleansstate')
+        self.bitbake('pv -c cleansstate')
         # Test devtool build
-        result = runCmd('devtool build pv')
-        bb_vars = get_bb_vars(['D', 'bindir'], 'pv')
+        result = self.runCmd('devtool build pv')
+        bb_vars = self.get_bb_vars(['D', 'bindir'], 'pv')
         installdir = bb_vars['D']
         self.assertTrue(installdir, 'Could not query installdir variable')
         bindir = bb_vars['bindir']
@@ -233,22 +239,22 @@ class DevtoolTests(DevtoolBase):
         url = 'https://git.yoctoproject.org/git/dbus-wait'
         # Force fetching to "noname" subdir so we verify we're picking up the name from autoconf
         # instead of the directory name
-        result = runCmd('git clone %s noname' % url, cwd=tempdir)
+        result = self.runCmd('git clone %s noname' % url, cwd=tempdir)
         srcdir = os.path.join(tempdir, 'noname')
-        result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
+        result = self.runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure script in source directory')
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # Don't specify a name since we should be able to auto-detect it
-        result = runCmd('devtool add %s' % srcdir)
+        result = self.runCmd('devtool add %s' % srcdir)
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Check the recipe name is correct
-        recipefile = get_bb_var('FILE', pn)
+        recipefile = self.get_bb_var('FILE', pn)
         self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorrectly named')
         self.assertIn(recipefile, result.output)
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(pn, result.output)
         self.assertIn(srcdir, result.output)
         self.assertIn(recipefile, result.output)
@@ -269,42 +275,42 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         version = '1.1'
         url = 'https://www.intra2net.com/en/developer/libftdi/download/libftdi1-%s.tar.bz2' % version
-        result = runCmd('wget %s' % url, cwd=tempdir)
-        result = runCmd('tar xfv libftdi1-%s.tar.bz2' % version, cwd=tempdir)
+        result = self.runCmd('wget %s' % url, cwd=tempdir)
+        result = self.runCmd('tar xfv libftdi1-%s.tar.bz2' % version, cwd=tempdir)
         srcdir = os.path.join(tempdir, 'libftdi1-%s' % version)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'CMakeLists.txt')), 'Unable to find CMakeLists.txt in source directory')
         # Test devtool add (and use -V so we test that too)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add libftdi %s -V %s' % (srcdir, version))
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool add libftdi %s -V %s' % (srcdir, version))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn('libftdi', result.output)
         self.assertIn(srcdir, result.output)
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
-        bitbake('libftdi -c cleansstate')
+        self.bitbake('libftdi -c cleansstate')
         # libftdi's python/CMakeLists.txt is a bit broken, so let's just disable it
         # There's also the matter of it installing cmake files to a path we don't
         # normally cover, which triggers the installed-vs-shipped QA test we have
         # within do_package
         recipefile = '%s/recipes/libftdi/libftdi_%s.bb' % (self.workspacedir, version)
-        result = runCmd('recipetool setvar %s EXTRA_OECMAKE -- \'-DPYTHON_BINDINGS=OFF -DLIBFTDI_CMAKE_CONFIG_DIR=${datadir}/cmake/Modules\'' % recipefile)
+        result = self.runCmd('recipetool setvar %s EXTRA_OECMAKE -- \'-DPYTHON_BINDINGS=OFF -DLIBFTDI_CMAKE_CONFIG_DIR=${datadir}/cmake/Modules\'' % recipefile)
         with open(recipefile, 'a') as f:
             f.write('\nFILES_${PN}-dev += "${datadir}/cmake/Modules"\n')
             # We don't have the ability to pick up this dependency automatically yet...
             f.write('\nDEPENDS += "libusb1"\n')
             f.write('\nTESTLIBOUTPUT = "${COMPONENTS_DIR}/${TUNE_PKGARCH}/${PN}/${libdir}"\n')
         # Test devtool build
-        result = runCmd('devtool build libftdi')
-        bb_vars = get_bb_vars(['TESTLIBOUTPUT', 'STAMP'], 'libftdi')
+        result = self.runCmd('devtool build libftdi')
+        bb_vars = self.get_bb_vars(['TESTLIBOUTPUT', 'STAMP'], 'libftdi')
         staging_libdir = bb_vars['TESTLIBOUTPUT']
         self.assertTrue(staging_libdir, 'Could not query TESTLIBOUTPUT variable')
         self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), "libftdi binary not found in STAGING_LIBDIR. Output of devtool build libftdi %s" % result.output)
         # Test devtool reset
         stampprefix = bb_vars['STAMP']
-        result = runCmd('devtool reset libftdi')
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool reset libftdi')
+        result = self.runCmd('devtool status')
         self.assertNotIn('libftdi', result.output)
         self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe libftdi')
         matches = glob.glob(stampprefix + '*')
@@ -323,34 +329,34 @@ class DevtoolTests(DevtoolBase):
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         self.assertTrue(os.path.isdir(os.path.join(srcdir, '.git')), 'git repository for external source tree was not created')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(srcdir, result.output)
         # Check recipe
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/MarkupSafe-${PV}'
         checkvars['SRC_URI'] = url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with version specified
-        result = runCmd('devtool reset -n %s' % testrecipe)
+        result = self.runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
         fakever = '1.9'
-        result = runCmd('devtool add %s %s -f %s -V %s' % (testrecipe, srcdir, url, fakever))
+        result = self.runCmd('devtool add %s %s -f %s -V %s' % (testrecipe, srcdir, url, fakever))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(srcdir, result.output)
         # Check recipe
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         self.assertIn('%s_%s.bb' % (testrecipe, fakever), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
@@ -368,16 +374,16 @@ class DevtoolTests(DevtoolBase):
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created: %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find imraa/imraa.c in source directory')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(srcdir, result.output)
         # Check recipe
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
@@ -386,17 +392,17 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with revision and version specified
-        result = runCmd('devtool reset -n %s' % testrecipe)
+        result = self.runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
         url_rev = '%s;rev=%s' % (url, checkrev)
-        result = runCmd('devtool add %s %s -f "%s" -V 1.5' % (testrecipe, srcdir, url_rev))
+        result = self.runCmd('devtool add %s %s -f "%s" -V 1.5' % (testrecipe, srcdir, url_rev))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find imraa/imraa.c in source directory')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(srcdir, result.output)
         # Check recipe
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
@@ -416,17 +422,17 @@ class DevtoolTests(DevtoolBase):
         srcdir = os.path.join(self.workspacedir, 'sources', testrecipe)
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s' % url)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool add %s' % url)
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
         self.assertTrue(os.path.isdir(os.path.join(srcdir, '.git')), 'git repository for external source tree was not created')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(srcdir, result.output)
         # Check recipe
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = None
@@ -440,21 +446,21 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         self.add_command_to_tearDown('bitbake -c clean mdadm')
-        result = runCmd('devtool modify mdadm -x %s' % tempdir)
+        result = self.runCmd('devtool modify mdadm -x %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mdadm_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
 
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn('mdadm', result.output)
         self.assertIn(tempdir, result.output)
         self._check_src_repo(tempdir)
 
-        bitbake('mdadm -C unpack')
+        self.bitbake('mdadm -C unpack')
 
         def check_line(checkfile, expected, message, present=True):
             # Check for $expected, on a line on its own, in checkfile.
@@ -465,7 +471,7 @@ class DevtoolTests(DevtoolBase):
                     self.assertNotIn(expected + '\n', f, message)
 
         modfile = os.path.join(tempdir, 'mdadm.8.in')
-        bb_vars = get_bb_vars(['PKGD', 'mandir'], 'mdadm')
+        bb_vars = self.get_bb_vars(['PKGD', 'mandir'], 'mdadm')
         pkgd = bb_vars['PKGD']
         self.assertTrue(pkgd, 'Could not query PKGD variable')
         mandir = bb_vars['mandir']
@@ -475,20 +481,20 @@ class DevtoolTests(DevtoolBase):
         check_line(modfile, 'Linux Software RAID', 'Could not find initial string')
         check_line(modfile, 'antique pin sardine', 'Unexpectedly found replacement string', present=False)
 
-        result = runCmd("sed -i 's!^Linux Software RAID$!antique pin sardine!' %s" % modfile)
+        result = self.runCmd("sed -i 's!^Linux Software RAID$!antique pin sardine!' %s" % modfile)
         check_line(modfile, 'antique pin sardine', 'mdadm.8.in file not modified (sed failed)')
 
-        bitbake('mdadm -c package')
+        self.bitbake('mdadm -c package')
         check_line(manfile, 'antique pin sardine', 'man file not modified. man searched file path: %s' % manfile)
 
-        result = runCmd('git checkout -- %s' % modfile, cwd=tempdir)
+        result = self.runCmd('git checkout -- %s' % modfile, cwd=tempdir)
         check_line(modfile, 'Linux Software RAID', 'man .in file not restored (git failed)')
 
-        bitbake('mdadm -c package')
+        self.bitbake('mdadm -c package')
         check_line(manfile, 'Linux Software RAID', 'man file not updated. man searched file path: %s' % manfile)
 
-        result = runCmd('devtool reset mdadm')
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool reset mdadm')
+        result = self.runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
 
     @OETestID(1620)
@@ -501,7 +507,7 @@ class DevtoolTests(DevtoolBase):
             self.assertNotExists(f)
 
         # Clean up anything in the workdir/sysroot/sstate cache
-        bitbake('mdadm m4 -c cleansstate')
+        self.bitbake('mdadm m4 -c cleansstate')
         # Try modifying a recipe
         tempdir_mdadm = tempfile.mkdtemp(prefix='devtoolqa')
         tempdir_m4 = tempfile.mkdtemp(prefix='devtoolqa')
@@ -510,27 +516,27 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(tempdir_m4)
         self.track_for_cleanup(builddir_m4)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         self.add_command_to_tearDown('bitbake -c clean mdadm m4')
         self.write_recipeinc('m4', 'EXTERNALSRC_BUILD = "%s"\ndo_clean() {\n\t:\n}\n' % builddir_m4)
         try:
-            runCmd('devtool modify mdadm -x %s' % tempdir_mdadm)
-            runCmd('devtool modify m4 -x %s' % tempdir_m4)
+            self.runCmd('devtool modify mdadm -x %s' % tempdir_mdadm)
+            self.runCmd('devtool modify m4 -x %s' % tempdir_m4)
             assertNoFile(tempdir_mdadm, 'mdadm')
             assertNoFile(builddir_m4, 'src/m4')
-            result = bitbake('m4 -e')
-            result = bitbake('mdadm m4 -c compile')
+            result = self.bitbake('m4 -e')
+            result = self.bitbake('mdadm m4 -c compile')
             self.assertEqual(result.status, 0)
             assertFile(tempdir_mdadm, 'mdadm')
             assertFile(builddir_m4, 'src/m4')
             # Check that buildclean task exists and does call make clean
-            bitbake('mdadm m4 -c buildclean')
+            self.bitbake('mdadm m4 -c buildclean')
             assertNoFile(tempdir_mdadm, 'mdadm')
             assertNoFile(builddir_m4, 'src/m4')
-            bitbake('mdadm m4 -c compile')
+            self.bitbake('mdadm m4 -c compile')
             assertFile(tempdir_mdadm, 'mdadm')
             assertFile(builddir_m4, 'src/m4')
-            bitbake('mdadm m4 -c clean')
+            self.bitbake('mdadm m4 -c clean')
             # Check that buildclean task is run before clean for B == S
             assertNoFile(tempdir_mdadm, 'mdadm')
             # Check that buildclean task is not run before clean for B != S
@@ -544,11 +550,11 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
 
         testrecipes = 'perf kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support'.split()
         # Find actual name of gcc-source since it now includes the version - crude, but good enough for this purpose
-        result = runCmd('bitbake-layers show-recipes gcc-source*')
+        result = self.runCmd('bitbake-layers show-recipes gcc-source*')
         for line in result.output.splitlines():
             # just match those lines that contain a real target
             m = re.match('(?P<recipe>^[a-zA-Z0-9.-]+)(?P<colon>:$)', line)
@@ -556,14 +562,14 @@ class DevtoolTests(DevtoolBase):
                 testrecipes.append(m.group('recipe'))
         for testrecipe in testrecipes:
             # Check it's a valid recipe
-            bitbake('%s -e' % testrecipe)
+            self.bitbake('%s -e' % testrecipe)
             # devtool extract should fail
-            result = runCmd('devtool extract %s %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
+            result = self.runCmd('devtool extract %s %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
             self.assertNotEqual(result.status, 0, 'devtool extract on %s should have failed. devtool output: %s' % (testrecipe, result.output))
             self.assertNotIn('Fetching ', result.output, 'devtool extract on %s should have errored out before trying to fetch' % testrecipe)
             self.assertIn('ERROR: ', result.output, 'devtool extract on %s should have given an ERROR' % testrecipe)
             # devtool modify should fail
-            result = runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
+            result = self.runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
             self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' %  (testrecipe, result.output))
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
@@ -575,22 +581,22 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
 
         bbclassextended = False
         inheritnative = False
         testrecipes = 'mtools-native apt-native desktop-file-utils-native'.split()
         for testrecipe in testrecipes:
-            checkextend = 'native' in (get_bb_var('BBCLASSEXTEND', testrecipe) or '').split()
+            checkextend = 'native' in (self.get_bb_var('BBCLASSEXTEND', testrecipe) or '').split()
             if not bbclassextended:
                 bbclassextended = checkextend
             if not inheritnative:
                 inheritnative = not checkextend
-            result = runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)))
+            result = self.runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)))
             self.assertNotIn('ERROR: ', result.output, 'ERROR in devtool modify output: %s' % result.output)
-            result = runCmd('devtool build %s' % testrecipe)
+            result = self.runCmd('devtool build %s' % testrecipe)
             self.assertNotIn('ERROR: ', result.output, 'ERROR in devtool build output: %s' % result.output)
-            result = runCmd('devtool reset %s' % testrecipe)
+            result = self.runCmd('devtool reset %s' % testrecipe)
             self.assertNotIn('ERROR: ', result.output, 'ERROR in devtool reset output: %s' % result.output)
 
         self.assertTrue(bbclassextended, 'None of these recipes are BBCLASSEXTENDed to native - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
@@ -601,35 +607,35 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_modify_git(self):
         # Check preconditions
         testrecipe = 'mkelfimage'
-        src_uri = get_bb_var('SRC_URI', testrecipe)
+        src_uri = self.get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
         # Clean up anything in the workdir/sysroot/sstate cache
-        bitbake('%s -c cleansstate' % testrecipe)
+        self.bitbake('%s -c cleansstate' % testrecipe)
         # Try modifying a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mkelfimage_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(tempdir, result.output)
         # Check git repo
         self._check_src_repo(tempdir)
         # Try building
-        bitbake(testrecipe)
+        self.bitbake(testrecipe)
 
     @OETestID(1167)
     def test_devtool_modify_localfiles(self):
         # Check preconditions
         testrecipe = 'lighttpd'
-        src_uri = (get_bb_var('SRC_URI', testrecipe) or '').split()
+        src_uri = (self.get_bb_var('SRC_URI', testrecipe) or '').split()
         foundlocal = False
         for item in src_uri:
             if item.startswith('file://') and '.patch' not in item:
@@ -637,24 +643,24 @@ class DevtoolTests(DevtoolBase):
                 break
         self.assertTrue(foundlocal, 'This test expects the %s recipe to fetch local files and it seems that it no longer does' % testrecipe)
         # Clean up anything in the workdir/sysroot/sstate cache
-        bitbake('%s -c cleansstate' % testrecipe)
+        self.bitbake('%s -c cleansstate' % testrecipe)
         # Try modifying a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'configure.ac'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % testrecipe))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(tempdir, result.output)
         # Try building
-        bitbake(testrecipe)
+        self.bitbake(testrecipe)
 
     @OETestID(1378)
     def test_devtool_modify_virtual(self):
@@ -664,14 +670,14 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool modify %s -x %s' % (virtrecipe, tempdir))
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool modify %s -x %s' % (virtrecipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % realrecipe))
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertNotIn(virtrecipe, result.output)
         self.assertIn(realrecipe, result.output)
         # Check git repo
@@ -683,7 +689,7 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe(self):
         # Check preconditions
         testrecipe = 'minicom'
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
@@ -692,21 +698,21 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         # We don't use -x here so that we test the behaviour of devtool modify without it
-        result = runCmd('devtool modify %s %s' % (testrecipe, tempdir))
+        result = self.runCmd('devtool modify %s %s' % (testrecipe, tempdir))
         # Check git repo
         self._check_src_repo(tempdir)
         # Add a couple of commits
         # FIXME: this only tests adding, need to also test update and remove
-        result = runCmd('echo "Additional line" >> README', cwd=tempdir)
-        result = runCmd('git commit -a -m "Change the README"', cwd=tempdir)
-        result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
-        result = runCmd('git add devtool-new-file', cwd=tempdir)
-        result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
+        result = self.runCmd('echo "Additional line" >> README', cwd=tempdir)
+        result = self.runCmd('git commit -a -m "Change the README"', cwd=tempdir)
+        result = self.runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git add devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git commit -m "Add a new file"', cwd=tempdir)
         self.add_command_to_tearDown('cd %s; rm %s/*.patch; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = runCmd('devtool update-recipe %s' % testrecipe)
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            ('??', '.*/0001-Change-the-README.patch$'),
                            ('??', '.*/0002-Add-a-new-file.patch$')]
@@ -716,7 +722,7 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
@@ -730,25 +736,25 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Check git repo
         self._check_src_repo(tempdir)
         # Add a couple of commits
         # FIXME: this only tests adding, need to also test update and remove
-        result = runCmd('echo "# Additional line" >> Makefile.am', cwd=tempdir)
-        result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempdir)
-        result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
-        result = runCmd('git add devtool-new-file', cwd=tempdir)
-        result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
+        result = self.runCmd('echo "# Additional line" >> Makefile.am', cwd=tempdir)
+        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempdir)
+        result = self.runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git add devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git commit -m "Add a new file"', cwd=tempdir)
         self.add_command_to_tearDown('cd %s; rm -rf %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = runCmd('devtool update-recipe -m srcrev %s' % testrecipe)
+        result = self.runCmd('devtool update-recipe -m srcrev %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile))] + \
                           [(' D', '.*/%s$' % patch) for patch in patches]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-        result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        result = self.runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
         addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
         srcurilines = src_uri.split()
         srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
@@ -772,9 +778,9 @@ class DevtoolTests(DevtoolBase):
                         break
                 self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
         # Now try with auto mode
-        runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
-        result = runCmd('devtool update-recipe %s' % testrecipe)
-        result = runCmd('git rev-parse --show-toplevel', cwd=os.path.dirname(recipefile))
+        self.runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
+        result = self.runCmd('git rev-parse --show-toplevel', cwd=os.path.dirname(recipefile))
         topleveldir = result.output.strip()
         relpatchpath = os.path.join(os.path.relpath(os.path.dirname(recipefile), topleveldir), testrecipe)
         expected_status = [(' M', os.path.relpath(recipefile, topleveldir)),
@@ -786,7 +792,7 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_append(self):
         # Check preconditions
         testrecipe = 'mdadm'
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
@@ -797,19 +803,19 @@ class DevtoolTests(DevtoolBase):
         templayerdir = os.path.join(tempdir, 'layer')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
         # Check git repo
         self._check_src_repo(tempsrcdir)
         # Add a commit
-        result = runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
-        result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
+        result = self.runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
+        result = self.runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
         self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
         # Create a temporary layer and add it to bblayers.conf
         self._create_temp_layer(templayerdir, True, 'selftestupdaterecipe')
         # Create the bbappend
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
         self.assertNotIn('WARNING:', result.output)
         # Check recipe is still clean
         self._check_repo_status(os.path.dirname(recipefile), [])
@@ -829,12 +835,12 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
 
         # Check we can run it again and bbappend isn't modified
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
         with open(bbappendfile, 'r') as f:
             self.assertEqual(expectedlines, f.readlines())
         # Drop new commit and check patch gets deleted
-        result = runCmd('git reset HEAD^', cwd=tempsrcdir)
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
         self.assertNotExists(patchfile, 'Patch file not deleted')
         expectedlines2 = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
@@ -842,9 +848,9 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines2, f.readlines())
         # Put commit back and check we can run it if layer isn't in bblayers.conf
         os.remove(bbappendfile)
-        result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
-        result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
+        result = self.runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
         self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
         self.assertExists(patchfile, 'Patch file not created (with disabled layer)')
         with open(bbappendfile, 'r') as f:
@@ -855,7 +861,7 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
@@ -870,14 +876,14 @@ class DevtoolTests(DevtoolBase):
         templayerdir = os.path.join(tempdir, 'layer')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
         # Check git repo
         self._check_src_repo(tempsrcdir)
         # Add a commit
-        result = runCmd('echo "# Additional line" >> Makefile.am', cwd=tempsrcdir)
-        result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
+        result = self.runCmd('echo "# Additional line" >> Makefile.am', cwd=tempsrcdir)
+        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
         self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
         # Create a temporary layer
         os.makedirs(os.path.join(templayerdir, 'conf'))
@@ -889,9 +895,9 @@ class DevtoolTests(DevtoolBase):
             f.write('BBFILE_PRIORITY_oeselftesttemplayer = "999"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_oeselftesttemplayer = "1"\n')
         self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
-        result = runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
+        result = self.runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
         # Create the bbappend
-        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertNotIn('WARNING:', result.output)
         # Check recipe is still clean
         self._check_repo_status(os.path.dirname(recipefile), [])
@@ -902,7 +908,7 @@ class DevtoolTests(DevtoolBase):
         self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
 
         # Check bbappend contents
-        result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
         expectedlines = set(['SRCREV = "%s"\n' % result.output,
                              '\n',
                              'SRC_URI = "%s"\n' % git_uri,
@@ -911,14 +917,14 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, set(f.readlines()))
 
         # Check we can run it again and bbappend isn't modified
-        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         with open(bbappendfile, 'r') as f:
             self.assertEqual(expectedlines, set(f.readlines()))
         # Drop new commit and check SRCREV changes
-        result = runCmd('git reset HEAD^', cwd=tempsrcdir)
-        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
-        result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
         expectedlines = set(['SRCREV = "%s"\n' % result.output,
                              '\n',
                              'SRC_URI = "%s"\n' % git_uri,
@@ -927,12 +933,12 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, set(f.readlines()))
         # Put commit back and check we can run it if layer isn't in bblayers.conf
         os.remove(bbappendfile)
-        result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
-        result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
-        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
+        result = self.runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
         self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
-        result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
         expectedlines = set(['SRCREV = "%s"\n' % result.output,
                              '\n',
                              'SRC_URI = "%s"\n' % git_uri,
@@ -945,28 +951,28 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_local_files(self):
         """Check that local source files are copied over instead of patched"""
         testrecipe = 'makedevs'
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         # Setup srctree for modifying the recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be
         # building it)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Check git repo
         self._check_src_repo(tempdir)
         # Try building just to ensure we haven't broken that
-        bitbake("%s" % testrecipe)
+        self.bitbake("%s" % testrecipe)
         # Edit / commit local source
-        runCmd('echo "/* Foobar */" >> oe-local-files/makedevs.c', cwd=tempdir)
-        runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
-        runCmd('echo "Bar" > new-file', cwd=tempdir)
-        runCmd('git add new-file', cwd=tempdir)
-        runCmd('git commit -m "Add new file"', cwd=tempdir)
+        self.runCmd('echo "/* Foobar */" >> oe-local-files/makedevs.c', cwd=tempdir)
+        self.runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
+        self.runCmd('echo "Bar" > new-file', cwd=tempdir)
+        self.runCmd('git add new-file', cwd=tempdir)
+        self.runCmd('git commit -m "Add new file"', cwd=tempdir)
         self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
                                      os.path.dirname(recipefile))
-        runCmd('devtool update-recipe %s' % testrecipe)
+        self.runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            (' M', '.*/makedevs/makedevs.c$'),
                            ('??', '.*/makedevs/new-local$'),
@@ -977,36 +983,36 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
         testrecipe = 'lzo'
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         # Setup srctree for modifying the recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Check git repo
         self._check_src_repo(tempdir)
         # Add oe-local-files to Git
-        runCmd('rm oe-local-files/.gitignore', cwd=tempdir)
-        runCmd('git add oe-local-files', cwd=tempdir)
-        runCmd('git commit -m "Add local sources"', cwd=tempdir)
+        self.runCmd('rm oe-local-files/.gitignore', cwd=tempdir)
+        self.runCmd('git add oe-local-files', cwd=tempdir)
+        self.runCmd('git commit -m "Add local sources"', cwd=tempdir)
         # Edit / commit local sources
-        runCmd('echo "# Foobar" >> oe-local-files/acinclude.m4', cwd=tempdir)
-        runCmd('git commit -am "Edit existing file"', cwd=tempdir)
-        runCmd('git rm oe-local-files/run-ptest', cwd=tempdir)
-        runCmd('git commit -m"Remove file"', cwd=tempdir)
-        runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
-        runCmd('git add oe-local-files/new-local', cwd=tempdir)
-        runCmd('git commit -m "Add new local file"', cwd=tempdir)
-        runCmd('echo "Gar" > new-file', cwd=tempdir)
-        runCmd('git add new-file', cwd=tempdir)
-        runCmd('git commit -m "Add new file"', cwd=tempdir)
+        self.runCmd('echo "# Foobar" >> oe-local-files/acinclude.m4', cwd=tempdir)
+        self.runCmd('git commit -am "Edit existing file"', cwd=tempdir)
+        self.runCmd('git rm oe-local-files/run-ptest', cwd=tempdir)
+        self.runCmd('git commit -m"Remove file"', cwd=tempdir)
+        self.runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
+        self.runCmd('git add oe-local-files/new-local', cwd=tempdir)
+        self.runCmd('git commit -m "Add new local file"', cwd=tempdir)
+        self.runCmd('echo "Gar" > new-file', cwd=tempdir)
+        self.runCmd('git add new-file', cwd=tempdir)
+        self.runCmd('git commit -m "Add new file"', cwd=tempdir)
         self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
                                      os.path.dirname(recipefile))
         # Checkout unmodified file to working copy -> devtool should still pick
         # the modified version from HEAD
-        runCmd('git checkout HEAD^ -- oe-local-files/acinclude.m4', cwd=tempdir)
-        runCmd('devtool update-recipe %s' % testrecipe)
+        self.runCmd('git checkout HEAD^ -- oe-local-files/acinclude.m4', cwd=tempdir)
+        self.runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            (' M', '.*/acinclude.m4$'),
                            (' D', '.*/run-ptest$'),
@@ -1018,19 +1024,19 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_local_files_3(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-localonly'
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = runCmd('devtool modify %s' % testrecipe)
+        result = self.runCmd('devtool modify %s' % testrecipe)
         # Modify one file
-        runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe, 'oe-local-files'))
+        self.runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe, 'oe-local-files'))
         self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = runCmd('devtool update-recipe %s' % testrecipe)
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
@@ -1038,27 +1044,27 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_local_patch_gz(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-patch-gz'
-        if get_bb_var('DISTRO') == 'poky-tiny':
+        if self.get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest("The DISTRO 'poky-tiny' does not provide the dependencies needed by %s" % testrecipe)
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = runCmd('devtool modify %s' % testrecipe)
+        result = self.runCmd('devtool modify %s' % testrecipe)
         # Modify one file
         srctree = os.path.join(self.workspacedir, 'sources', testrecipe)
-        runCmd('echo "Another line" >> README', cwd=srctree)
-        runCmd('git commit -a --amend --no-edit', cwd=srctree)
+        self.runCmd('echo "Another line" >> README', cwd=srctree)
+        self.runCmd('git commit -a --amend --no-edit', cwd=srctree)
         self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = runCmd('devtool update-recipe %s' % testrecipe)
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s/readme.patch.gz$' % testrecipe)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
         patch_gz = os.path.join(os.path.dirname(recipefile), testrecipe, 'readme.patch.gz')
-        result = runCmd('file %s' % patch_gz)
+        result = self.runCmd('file %s' % patch_gz)
         if 'gzip compressed data' not in result.output:
             self.fail('New patch file is not gzipped - file reports:\n%s' % result.output)
 
@@ -1069,15 +1075,15 @@ class DevtoolTests(DevtoolBase):
         # was also in SRC_URI
         # First, modify the recipe
         testrecipe = 'devtool-test-subdir'
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = runCmd('devtool modify %s' % testrecipe)
+        result = self.runCmd('devtool modify %s' % testrecipe)
         testfile = os.path.join(self.workspacedir, 'sources', testrecipe, 'testfile')
         self.assertExists(testfile, 'Extracted source could not be found')
         with open(testfile, 'r') as f:
@@ -1085,7 +1091,7 @@ class DevtoolTests(DevtoolBase):
         self.assertEqual(contents, 'Modified version', 'File has apparently not been overwritten as it should have been')
         # Test devtool update-recipe without modifying any files
         self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = runCmd('devtool update-recipe %s' % testrecipe)
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = []
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
@@ -1094,7 +1100,7 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-        result = runCmd('devtool extract matchbox-terminal %s' % tempdir)
+        result = self.runCmd('devtool extract matchbox-terminal %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         # devtool extract shouldn't create the workspace
         self.assertNotExists(self.workspacedir)
@@ -1105,7 +1111,7 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-        result = runCmd('devtool extract virtual/make %s' % tempdir)
+        result = self.runCmd('devtool extract virtual/make %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         # devtool extract shouldn't create the workspace
         self.assertNotExists(self.workspacedir)
@@ -1116,21 +1122,21 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         testrecipe1 = 'mdadm'
         testrecipe2 = 'cronie'
-        result = runCmd('devtool modify -x %s %s' % (testrecipe1, os.path.join(tempdir, testrecipe1)))
-        result = runCmd('devtool modify -x %s %s' % (testrecipe2, os.path.join(tempdir, testrecipe2)))
-        result = runCmd('devtool build %s' % testrecipe1)
-        result = runCmd('devtool build %s' % testrecipe2)
-        stampprefix1 = get_bb_var('STAMP', testrecipe1)
+        result = self.runCmd('devtool modify -x %s %s' % (testrecipe1, os.path.join(tempdir, testrecipe1)))
+        result = self.runCmd('devtool modify -x %s %s' % (testrecipe2, os.path.join(tempdir, testrecipe2)))
+        result = self.runCmd('devtool build %s' % testrecipe1)
+        result = self.runCmd('devtool build %s' % testrecipe2)
+        stampprefix1 = self.get_bb_var('STAMP', testrecipe1)
         self.assertTrue(stampprefix1, 'Unable to get STAMP value for recipe %s' % testrecipe1)
-        stampprefix2 = get_bb_var('STAMP', testrecipe2)
+        stampprefix2 = self.get_bb_var('STAMP', testrecipe2)
         self.assertTrue(stampprefix2, 'Unable to get STAMP value for recipe %s' % testrecipe2)
-        result = runCmd('devtool reset -a')
+        result = self.runCmd('devtool reset -a')
         self.assertIn(testrecipe1, result.output)
         self.assertIn(testrecipe2, result.output)
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertNotIn(testrecipe1, result.output)
         self.assertNotIn(testrecipe2, result.output)
         matches1 = glob.glob(stampprefix1 + '*')
@@ -1147,14 +1153,14 @@ class DevtoolTests(DevtoolBase):
         # really this has to be done as an oe-selftest test.
         #
         # Check preconditions
-        machine = get_bb_var('MACHINE')
+        machine = self.get_bb_var('MACHINE')
         if not machine.startswith('qemu'):
             self.skipTest('This test only works with qemu machines')
         if not os.path.exists('/etc/runqemu-nosudo'):
             self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
-        result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
+        result = self.runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
         if result.status != 0:
-            result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
+            result = self.runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
             if result.status != 0:
                 self.skipTest('Failed to determine if tap devices exist with ifconfig or ip: %s' % result.output)
         for line in result.output.splitlines():
@@ -1169,41 +1175,41 @@ class DevtoolTests(DevtoolBase):
         testimage = 'oe-selftest-image'
         testcommand = '/sbin/mdadm --help'
         # Build an image to run
-        bitbake("%s qemu-native qemu-helper-native" % testimage)
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        self.bitbake("%s qemu-native qemu-helper-native" % testimage)
+        deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
         self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
         self.add_command_to_tearDown('rm -f %s/%s*' % (deploy_dir_image, testimage))
         # Clean recipe so the first deploy will fail
-        bitbake("%s -c clean" % testrecipe)
+        self.bitbake("%s -c clean" % testrecipe)
         # Try devtool modify
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Test that deploy-target at this point fails (properly)
-        result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe, ignore_status=True)
+        result = self.runCmd('devtool deploy-target -n %s root@localhost' % testrecipe, ignore_status=True)
         self.assertNotEqual(result.output, 0, 'devtool deploy-target should have failed, output: %s' % result.output)
         self.assertNotIn(result.output, 'Traceback', 'devtool deploy-target should have failed with a proper error not a traceback, output: %s' % result.output)
-        result = runCmd('devtool build %s' % testrecipe)
+        result = self.runCmd('devtool build %s' % testrecipe)
         # First try a dry-run of deploy-target
-        result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
+        result = self.runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
         self.assertIn('  %s' % testfile, result.output)
         # Boot the image
         with runqemu(testimage) as qemu:
             # Now really test deploy-target
-            result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+            result = self.runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
             # Run a test command to see if it was installed properly
             sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
+            result = self.runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
             # Check if it deployed all of the files with the right ownership/perms
             # First look on the host - need to do this under pseudo to get the correct ownership/perms
-            bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
+            bb_vars = self.get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
             installdir = bb_vars['D']
             fakerootenv = bb_vars['FAKEROOTENV']
             fakerootcmd = bb_vars['FAKEROOTCMD']
-            result = runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
+            result = self.runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
             filelist1 = self._process_ls_output(result.output)
 
             # Now look on the target
@@ -1214,14 +1220,14 @@ class DevtoolTests(DevtoolBase):
                 for line in filelist1:
                     splitline = line.split()
                     f.write(splitline[-1] + '\n')
-            result = runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
+            result = self.runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
             filelist2 = self._process_ls_output(result.output)
             filelist1.sort(key=lambda item: item.split()[-1])
             filelist2.sort(key=lambda item: item.split()[-1])
             self.assertEqual(filelist1, filelist2)
             # Test undeploy-target
-            result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
-            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
+            result = self.runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+            result = self.runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
             self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
 
     @OETestID(1366)
@@ -1231,22 +1237,22 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         image = 'core-image-minimal'
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         self.add_command_to_tearDown('bitbake -c clean %s' % image)
-        bitbake('%s -c clean' % image)
+        self.bitbake('%s -c clean' % image)
         # Add target and native recipes to workspace
         recipes = ['mdadm', 'parted-native']
         for recipe in recipes:
             tempdir = tempfile.mkdtemp(prefix='devtoolqa')
             self.track_for_cleanup(tempdir)
             self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
-            runCmd('devtool modify %s -x %s' % (recipe, tempdir))
+            self.runCmd('devtool modify %s -x %s' % (recipe, tempdir))
         # Try to build image
-        result = runCmd('devtool build-image %s' % image)
+        result = self.runCmd('devtool build-image %s' % image)
         self.assertNotEqual(result, 0, 'devtool build-image failed')
         # Check if image contains expected packages
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        image_link_name = get_bb_var('IMAGE_LINK_NAME', image)
+        deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
+        image_link_name = self.get_bb_var('IMAGE_LINK_NAME', image)
         reqpkgs = [item for item in recipes if not item.endswith('-native')]
         with open(os.path.join(deploy_dir_image, image_link_name + '.manifest'), 'r') as f:
             for line in f:
@@ -1263,23 +1269,23 @@ class DevtoolTests(DevtoolBase):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # Check parameters
-        result = runCmd('devtool upgrade -h')
+        result = self.runCmd('devtool upgrade -h')
         for param in 'recipename srctree --version -V --branch -b --keep-temp --no-patch'.split():
             self.assertIn(param, result.output)
         # For the moment, we are using a real recipe.
         recipe = 'devtool-upgrade-test1'
         version = '1.6.0'
-        oldrecipefile = get_bb_var('FILE', recipe)
+        oldrecipefile = self.get_bb_var('FILE', recipe)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         # Check that recipe is not already under devtool control
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
         # Check upgrade. Code does not check if new PV is older or newer that current PV, so, it may be that
         # we are downgrading instead of upgrading.
-        result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, version))
+        result = self.runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, version))
         # Check if srctree at least is populated
         self.assertTrue(len(os.listdir(tempdir)) > 0, 'srctree (%s) should be populated with new (%s) source code' % (tempdir, version))
         # Check new recipe subdirectory is present
@@ -1288,7 +1294,7 @@ class DevtoolTests(DevtoolBase):
         newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, '%s_%s.bb' % (recipe, version))
         self.assertExists(newrecipefile, 'Recipe file should exist after upgrade')
         # Check devtool status and make sure recipe is present
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(recipe, result.output)
         self.assertIn(tempdir, result.output)
         # Check recipe got changed as expected
@@ -1298,8 +1304,8 @@ class DevtoolTests(DevtoolBase):
             newlines = f.readlines()
         self.assertEqual(desiredlines, newlines)
         # Check devtool reset recipe
-        result = runCmd('devtool reset %s -n' % recipe)
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool reset %s -n' % recipe)
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
@@ -1308,24 +1314,24 @@ class DevtoolTests(DevtoolBase):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         recipe = 'devtool-upgrade-test2'
         commit = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
-        oldrecipefile = get_bb_var('FILE', recipe)
+        oldrecipefile = self.get_bb_var('FILE', recipe)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         # Check that recipe is not already under devtool control
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
         # Check upgrade
-        result = runCmd('devtool upgrade %s %s -S %s' % (recipe, tempdir, commit))
+        result = self.runCmd('devtool upgrade %s %s -S %s' % (recipe, tempdir, commit))
         # Check if srctree at least is populated
         self.assertTrue(len(os.listdir(tempdir)) > 0, 'srctree (%s) should be populated with new (%s) source code' % (tempdir, commit))
         # Check new recipe file is present
         newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, os.path.basename(oldrecipefile))
         self.assertExists(newrecipefile, 'Recipe file should exist after upgrade')
         # Check devtool status and make sure recipe is present
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(recipe, result.output)
         self.assertIn(tempdir, result.output)
         # Check recipe got changed as expected
@@ -1335,8 +1341,8 @@ class DevtoolTests(DevtoolBase):
             newlines = f.readlines()
         self.assertEqual(desiredlines, newlines)
         # Check devtool reset recipe
-        result = runCmd('devtool reset %s -n' % recipe)
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool reset %s -n' % recipe)
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
@@ -1347,10 +1353,10 @@ class DevtoolTests(DevtoolBase):
         This test executes the selftest-reverse command from meta-selftest."""
 
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
 
         s = "Microsoft Made No Profit From Anyone's Zunes Yo"
-        result = runCmd("devtool --quiet selftest-reverse \"%s\"" % s)
+        result = self.runCmd("devtool --quiet selftest-reverse \"%s\"" % s)
         self.assertEqual(result.output, s[::-1])
 
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
@@ -1371,12 +1377,12 @@ class DevtoolTests(DevtoolBase):
         """Test that devtool loads only the first found plugin in BBPATH."""
 
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
 
-        devtool = runCmd("which devtool")
-        fromname = runCmd("devtool --quiet pluginfile")
+        devtool = self.runCmd("which devtool")
+        fromname = self.runCmd("devtool --quiet pluginfile")
         srcfile = fromname.output
-        bbpath = get_bb_var('BBPATH')
+        bbpath = self.get_bb_var('BBPATH')
         searchpath = bbpath.split(':') + [os.path.dirname(devtool.output)]
         plugincontent = []
         with open(srcfile) as fh:
@@ -1385,12 +1391,12 @@ class DevtoolTests(DevtoolBase):
             self.assertIn('meta-selftest', srcfile, 'wrong bbpath plugin found')
             for path in searchpath:
                 self._copy_file_with_cleanup(srcfile, path, 'lib', 'devtool')
-            result = runCmd("devtool --quiet count")
+            result = self.runCmd("devtool --quiet count")
             self.assertEqual(result.output, '1')
-            result = runCmd("devtool --quiet multiloaded")
+            result = self.runCmd("devtool --quiet multiloaded")
             self.assertEqual(result.output, "no")
             for path in searchpath:
-                result = runCmd("devtool --quiet bbdir")
+                result = self.runCmd("devtool --quiet bbdir")
                 self.assertEqual(result.output, path)
                 os.unlink(os.path.join(result.output, 'lib', 'devtool', 'bbpath.py'))
         finally:
@@ -1401,32 +1407,32 @@ class DevtoolTests(DevtoolBase):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         # Use a "real" recipe from meta-selftest
         recipe = 'devtool-upgrade-test1'
         oldversion = '1.5.3'
         newversion = '1.6.0'
-        oldrecipefile = get_bb_var('FILE', recipe)
+        oldrecipefile = self.get_bb_var('FILE', recipe)
         recipedir = os.path.dirname(oldrecipefile)
-        result = runCmd('git status --porcelain .', cwd=recipedir)
+        result = self.runCmd('git status --porcelain .', cwd=recipedir)
         if result.output.strip():
             self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         # Check that recipe is not already under devtool control
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
         # Do the upgrade
-        result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, newversion))
+        result = self.runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, newversion))
         # Check devtool status and make sure recipe is present
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(recipe, result.output)
         self.assertIn(tempdir, result.output)
         # Make a change to the source
-        result = runCmd('sed -i \'/^#include "pv.h"/a \\/* Here is a new comment *\\/\' src/pv/number.c', cwd=tempdir)
-        result = runCmd('git status --porcelain', cwd=tempdir)
+        result = self.runCmd('sed -i \'/^#include "pv.h"/a \\/* Here is a new comment *\\/\' src/pv/number.c', cwd=tempdir)
+        result = self.runCmd('git status --porcelain', cwd=tempdir)
         self.assertIn('M src/pv/number.c', result.output)
-        result = runCmd('git commit src/pv/number.c -m "Add a comment to the code"', cwd=tempdir)
+        result = self.runCmd('git commit src/pv/number.c -m "Add a comment to the code"', cwd=tempdir)
         # Check if patch is there
         recipedir = os.path.dirname(oldrecipefile)
         olddir = os.path.join(recipedir, recipe + '-' + oldversion)
@@ -1441,8 +1447,8 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('/meta-selftest/', recipedir)
         # Try finish to the original layer
         self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
-        result = runCmd('devtool finish %s meta-selftest' % recipe)
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool finish %s meta-selftest' % recipe)
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         self.assertNotExists(oldrecipefile, 'Old recipe file should have been deleted but wasn\'t')
@@ -1461,12 +1467,12 @@ class DevtoolTests(DevtoolBase):
         # Try finish to a different layer - should create a bbappend
         # This cleanup isn't strictly necessary but do it anyway just in case it goes wrong and writes to here
         self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
-        oe_core_dir = os.path.join(get_bb_var('COREBASE'), 'meta')
+        oe_core_dir = os.path.join(self.get_bb_var('COREBASE'), 'meta')
         newrecipedir = os.path.join(oe_core_dir, 'recipes-test', 'devtool')
         newrecipefile = os.path.join(newrecipedir, '%s_%s.bb' % (recipe, newversion))
         self.track_for_cleanup(newrecipedir)
-        result = runCmd('devtool finish %s oe-core' % recipe)
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool finish %s oe-core' % recipe)
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         self.assertExists(oldrecipefile, 'Old recipe file should not have been deleted')
@@ -1482,25 +1488,25 @@ class DevtoolTests(DevtoolBase):
         # Try modifying a recipe
         self.track_for_cleanup(self.workspacedir)
         recipe = 'mdadm'
-        oldrecipefile = get_bb_var('FILE', recipe)
+        oldrecipefile = self.get_bb_var('FILE', recipe)
         recipedir = os.path.dirname(oldrecipefile)
-        result = runCmd('git status --porcelain .', cwd=recipedir)
+        result = self.runCmd('git status --porcelain .', cwd=recipedir)
         if result.output.strip():
             self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool modify %s %s' % (recipe, tempdir))
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool modify %s %s' % (recipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         # Test devtool status
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool status')
         self.assertIn(recipe, result.output)
         self.assertIn(tempdir, result.output)
         # Make a change to the source
-        result = runCmd('sed -i \'/^#include "mdadm.h"/a \\/* Here is a new comment *\\/\' maps.c', cwd=tempdir)
-        result = runCmd('git status --porcelain', cwd=tempdir)
+        result = self.runCmd('sed -i \'/^#include "mdadm.h"/a \\/* Here is a new comment *\\/\' maps.c', cwd=tempdir)
+        result = self.runCmd('git status --porcelain', cwd=tempdir)
         self.assertIn('M maps.c', result.output)
-        result = runCmd('git commit maps.c -m "Add a comment to the code"', cwd=tempdir)
+        result = self.runCmd('git commit maps.c -m "Add a comment to the code"', cwd=tempdir)
         for entry in os.listdir(recipedir):
             filesdir = os.path.join(recipedir, entry)
             if os.path.isdir(filesdir):
@@ -1516,8 +1522,8 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('/meta/', recipedir)
         # Try finish to the original layer
         self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
-        result = runCmd('devtool finish %s meta' % recipe)
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool finish %s meta' % recipe)
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         expected_status = [(' M', '.*/%s$' % os.path.basename(oldrecipefile)),
@@ -1529,16 +1535,16 @@ class DevtoolTests(DevtoolBase):
         recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
         self.assertIn('/meta/', recipedir)
-        relpth = os.path.relpath(recipedir, os.path.join(get_bb_var('COREBASE'), 'meta'))
+        relpth = os.path.relpath(recipedir, os.path.join(self.get_bb_var('COREBASE'), 'meta'))
         appenddir = os.path.join(self.testlayer_path, relpth)
         self.track_for_cleanup(appenddir)
         # Try finish to the original layer
         self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
-        result = runCmd('devtool finish %s meta-selftest' % recipe)
-        result = runCmd('devtool status')
+        result = self.runCmd('devtool finish %s meta-selftest' % recipe)
+        result = self.runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
-        result = runCmd('git status --porcelain .', cwd=recipedir)
+        result = self.runCmd('git status --porcelain .', cwd=recipedir)
         if result.output.strip():
             self.fail('Recipe directory for %s contains the following unexpected changes after finish:\n%s' % (recipe, result.output.strip()))
         recipefn = os.path.splitext(os.path.basename(oldrecipefile))[0]
@@ -1562,7 +1568,7 @@ class DevtoolTests(DevtoolBase):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
 
         # First run devtool add
         # We already have this recipe in OE-Core, but that doesn't matter
@@ -1571,7 +1577,7 @@ class DevtoolTests(DevtoolBase):
         recipefile = os.path.join(self.workspacedir, 'recipes', recipename, '%s_%s.bb' % (recipename, recipever))
         url = 'http://downloads.yoctoproject.org/mirror/sources/i2c-tools-%s.tar.bz2' % recipever
         def add_recipe():
-            result = runCmd('devtool add %s' % url)
+            result = self.runCmd('devtool add %s' % url)
             self.assertExists(recipefile, 'Expected recipe file not created')
             self.assertExists(os.path.join(self.workspacedir, 'sources', recipename), 'Source directory not created')
             checkvars = {}
@@ -1583,7 +1589,7 @@ class DevtoolTests(DevtoolBase):
         newrecipename = 'mynewrecipe'
         newrecipever = '456'
         newrecipefile = os.path.join(self.workspacedir, 'recipes', newrecipename, '%s_%s.bb' % (newrecipename, newrecipever))
-        result = runCmd('devtool rename %s %s -V %s' % (recipename, newrecipename, newrecipever))
+        result = self.runCmd('devtool rename %s %s -V %s' % (recipename, newrecipename, newrecipever))
         self.assertExists(newrecipefile, 'Recipe file not renamed')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipename), 'Old recipe directory still exists')
         newsrctree = os.path.join(self.workspacedir, 'sources', newrecipename)
@@ -1593,11 +1599,11 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(newrecipefile, checkvars, [])
         # Try again - change just name this time
-        result = runCmd('devtool reset -n %s' % newrecipename)
+        result = self.runCmd('devtool reset -n %s' % newrecipename)
         shutil.rmtree(newsrctree)
         add_recipe()
         newrecipefile = os.path.join(self.workspacedir, 'recipes', newrecipename, '%s_%s.bb' % (newrecipename, recipever))
-        result = runCmd('devtool rename %s %s' % (recipename, newrecipename))
+        result = self.runCmd('devtool rename %s %s' % (recipename, newrecipename))
         self.assertExists(newrecipefile, 'Recipe file not renamed')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipename), 'Old recipe directory still exists')
         self.assertExists(os.path.join(self.workspacedir, 'sources', newrecipename), 'Source directory not renamed')
@@ -1606,11 +1612,11 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url.replace(recipever, '${PV}')
         self._test_recipe_contents(newrecipefile, checkvars, [])
         # Try again - change just version this time
-        result = runCmd('devtool reset -n %s' % newrecipename)
+        result = self.runCmd('devtool reset -n %s' % newrecipename)
         shutil.rmtree(newsrctree)
         add_recipe()
         newrecipefile = os.path.join(self.workspacedir, 'recipes', recipename, '%s_%s.bb' % (recipename, newrecipever))
-        result = runCmd('devtool rename %s -V %s' % (recipename, newrecipever))
+        result = self.runCmd('devtool rename %s -V %s' % (recipename, newrecipever))
         self.assertExists(newrecipefile, 'Recipe file not renamed')
         self.assertExists(os.path.join(self.workspacedir, 'sources', recipename), 'Source directory no longer exists')
         checkvars = {}
@@ -1641,59 +1647,59 @@ class DevtoolTests(DevtoolBase):
                          and modification to the source and configurations are reflected
                          when building the kernel.
          """
-        kernel_provider = get_bb_var('PREFERRED_PROVIDER_virtual/kernel')
+        kernel_provider = self.get_bb_var('PREFERRED_PROVIDER_virtual/kernel')
         # Clean up the enviroment
-        bitbake('%s -c clean' % kernel_provider)
+        self.bitbake('%s -c clean' % kernel_provider)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
         self.add_command_to_tearDown('bitbake -c clean %s' % kernel_provider)
         #Step 1
         #Here is just generated the config file instead of all the kernel to optimize the
         #time of executing this test case.
-        bitbake('%s -c configure' % kernel_provider)
-        bbconfig = os.path.join(get_bb_var('B', kernel_provider),'.config')
-        buildir= get_bb_var('TOPDIR')
+        self.bitbake('%s -c configure' % kernel_provider)
+        bbconfig = os.path.join(self.get_bb_var('B', kernel_provider),'.config')
+        buildir= self.get_bb_var('TOPDIR')
         #Step 2
-        runCmd('cp %s %s' % (bbconfig, buildir))
+        self.runCmd('cp %s %s' % (bbconfig, buildir))
         self.assertExists(os.path.join(buildir, '.config'), 'Could not copy .config file from kernel')
 
         tmpconfig = os.path.join(buildir, '.config')
         #Step 3
-        bitbake('%s -c clean' % kernel_provider)
+        self.bitbake('%s -c clean' % kernel_provider)
         #Step 4.1
-        runCmd('devtool modify virtual/kernel -x %s' % tempdir)
+        self.runCmd('devtool modify virtual/kernel -x %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         #Step 4.2
         configfile = os.path.join(tempdir,'.config')
-        diff = runCmd('diff %s %s' % (tmpconfig, configfile))
+        diff = self.runCmd('diff %s %s' % (tmpconfig, configfile))
         self.assertEqual(0,diff.status,'Kernel .config file is not the same using bitbake and devtool')
         #Step 4.3
         #NOTE: virtual/kernel is mapped to kernel_provider
-        result = runCmd('devtool build %s' % kernel_provider)
+        result = self.runCmd('devtool build %s' % kernel_provider)
         self.assertEqual(0,result.status,'Cannot build kernel using `devtool build`')
-        kernelfile = os.path.join(get_bb_var('KBUILD_OUTPUT', kernel_provider), 'vmlinux')
+        kernelfile = os.path.join(self.get_bb_var('KBUILD_OUTPUT', kernel_provider), 'vmlinux')
         self.assertExists(kernelfile, 'Kernel was not build correctly')
 
         #Modify the kernel source
         modfile = os.path.join(tempdir,'arch/x86/boot/header.S')
         modstring = "Use a boot loader. Devtool testing."
-        modapplied = runCmd("sed -i 's/Use a boot loader./%s/' %s" % (modstring, modfile))
+        modapplied = self.runCmd("sed -i 's/Use a boot loader./%s/' %s" % (modstring, modfile))
         self.assertEqual(0,modapplied.status,'Modification to %s on kernel source failed' % modfile)
         #Modify the configuration
         codeconfigfile = os.path.join(tempdir,'.config.new')
         modconfopt = "CONFIG_SG_POOL=n"
-        modconf = runCmd("sed -i 's/CONFIG_SG_POOL=y/%s/' %s" % (modconfopt, codeconfigfile))
+        modconf = self.runCmd("sed -i 's/CONFIG_SG_POOL=y/%s/' %s" % (modconfopt, codeconfigfile))
         self.assertEqual(0,modconf.status,'Modification to %s failed' % codeconfigfile)
         #Build again kernel with devtool
-        rebuild = runCmd('devtool build %s' % kernel_provider)
+        rebuild = self.runCmd('devtool build %s' % kernel_provider)
         self.assertEqual(0,rebuild.status,'Fail to build kernel after modification of source and config')
         #Step 4.4
-        bzimagename = 'bzImage-' + get_bb_var('KERNEL_VERSION_NAME', kernel_provider)
-        bzimagefile = os.path.join(get_bb_var('D', kernel_provider),'boot', bzimagename)
-        checkmodcode = runCmd("grep '%s' %s" % (modstring, bzimagefile))
+        bzimagename = 'bzImage-' + self.get_bb_var('KERNEL_VERSION_NAME', kernel_provider)
+        bzimagefile = os.path.join(self.get_bb_var('D', kernel_provider),'boot', bzimagename)
+        checkmodcode = self.runCmd("grep '%s' %s" % (modstring, bzimagefile))
         self.assertEqual(0,checkmodcode.status,'Modification on kernel source failed')
         #Step 4.5
-        checkmodconfg = runCmd("grep %s %s" % (modconfopt, codeconfigfile))
+        checkmodconfg = self.runCmd("grep %s %s" % (modconfopt, codeconfigfile))
         self.assertEqual(0,checkmodconfg.status,'Modification to configuration file failed')
-- 
2.11.0


