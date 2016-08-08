Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2877771A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316021"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:55 -0700
Message-Id: <c90de554165ce5fbe76a932af0fce644cf7b7e14.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 07/20] oeqa.selftest.devtool: Split configuration from code
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
 meta/lib/oeqa/selftest/conf/devtool.conf | 100 ++++++++
 meta/lib/oeqa/selftest/devtool.py        | 417 +++++++++++++++++++++----------
 2 files changed, 389 insertions(+), 128 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/devtool.conf

diff --git a/meta/lib/oeqa/selftest/conf/devtool.conf b/meta/lib/oeqa/selftest/conf/devtool.conf
new file mode 100644
index 0000000..f328c64
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/devtool.conf
@@ -0,0 +1,100 @@
+[DevtoolTests]
+test_create_workspace_prefix = devtoolqa
+test_devtool_add_prefix = %(test_create_workspace_prefix)s
+test_devtool_add_url = http://www.ivarch.com/programs/sources/pv-1.5.3.tar.bz2
+test_devtool_add_tar_file = pv-1.5.3.tar.bz2
+test_devtool_add_dir = pv-1.5.3
+test_devtool_add_package = pv
+test_devtool_add_git_local_prefix = %(test_create_workspace_prefix)s
+test_devtool_add_git_local_pn = dbus-wait
+#  We choose an https:// git URL here to check rewriting the URL works
+test_devtool_add_git_local_url = https://git.yoctoproject.org/git/dbus-wait
+test_devtool_add_git_local_checkvars_license = GPLv2
+test_devtool_add_git_local_checkvars_md5 = b234ee4d69f5fce4486a80fdaf4a4263
+test_devtool_add_git_local_checkvars_pv = 0.1
+test_devtool_add_git_local_checkvars_srcuri = git://git.yoctoproject.org/git/dbus-wait;protocol=https
+test_devtool_add_git_local_checkvars_depends = dbus
+test_devtool_add_git_local_srcrev = 6cc6077a36fe2648a5f993fe7c16c9632f946517
+test_devtool_add_library_recipe1 = libusb1
+test_devtool_add_library_prefix = %(test_create_workspace_prefix)s
+test_devtool_add_library_version = 1.1
+# _recipe2 is linked to _url, _file, _binary and _extra_var
+test_devtool_add_library_recipe2 = libftdi
+test_devtool_add_library_url = https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.1.tar.bz2
+test_devtool_add_library_file = libftdi1
+test_devtool_add_library_binary = libftdi1.so.2.1.0
+# libftdi's python/CMakeLists.txt is a bit broken, so let's just disable it
+# There's also the matter of it installing cmake files to a path we don't
+# normally cover, which triggers the installed-vs-shipped QA test we have
+# within do_package
+test_devtool_add_library_extra_var = "EXTRA_OECMAKE -- \'-DPYTHON_BINDINGS=OFF -DLIBFTDI_CMAKE_CONFIG_DIR=${datadir}/cmake/Modules\'"
+test_devtool_add_fetch_prefix = devtoolqa
+# _testver is linked to _url and _testrecipe
+test_devtool_add_fetch_testver = 0.23
+test_devtool_add_fetch_url = https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-0.23.tar.gz
+test_devtool_add_fetch_testrecipe = python-markupsafe
+test_devtool_add_fetch_fakever = 1.9
+test_devtool_add_fetch_git_prefix = %(test_devtool_add_fetch_prefix)s
+test_devtool_add_fetch_git_url = git://git.yoctoproject.org/libmatchbox
+test_devtool_add_fetch_git_checkrev = 462f0652055d89c648ddd54fd7b03f175c2c6973
+test_devtool_add_fetch_git_testrecipe = libmatchbox2
+test_devtool_add_fetch_git_pv = 1.12
+# To try with version specified
+test_devtool_add_fetch_git_ver = 1.5
+test_devtool_add_fetch_simple_prefix = devtoolqa
+# _testver is linked to _url and _testrecipe
+test_devtool_add_fetch_simple_testver = 1.6.0
+test_devtool_add_fetch_simple_url = http://www.ivarch.com/programs/sources/pv-1.6.0.tar.bz2
+test_devtool_add_fetch_simple_testrecipe = pv
+test_devtool_modify_prefix = devtoolqa
+test_devtool_modify_recipe = mdadm
+test_devtool_modify_invalid_prefix = %(test_devtool_modify_prefix)s
+test_devtool_modify_invalid_testrecipes = perf kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support
+test_devtool_modify_native_prefix = %(test_devtool_modify_prefix)s
+test_devtool_modify_native_testrecipes = mtools-native apt-native desktop-file-utils-native
+test_devtool_modify_git_prefix = %(test_devtool_modify_prefix)s
+test_devtool_modify_git_testrecipe = mkelfimage
+test_devtool_modify_localfiles_prefix = %(test_devtool_modify_prefix)s
+test_devtool_modify_localfiles_testrecipe = lighttpd
+test_devtool_modify_virtual_prefix = %(test_devtool_modify_prefix)s
+test_devtool_modify_virtual_virtrecipe = virtual/libx11
+test_devtool_modify_virtual_realrecipe = libx11
+test_devtool_update_recipe_prefix = %(test_devtool_modify_prefix)s
+test_devtool_update_recipe_testrecipe = minicom
+test_devtool_update_recipe_git_prefix = %(test_devtool_modify_prefix)s
+test_devtool_update_recipe_git_testrecipe = mtd-utils
+test_devtool_update_recipe_git_srcuri = git://git.infradead.org/mtd-utils.git
+test_devtool_update_recipe_append_prefix = %(test_devtool_modify_prefix)s
+test_devtool_update_recipe_append_testrecipe = mdadm
+test_devtool_update_recipe_append_git_prefix = %(test_devtool_modify_prefix)s
+test_devtool_update_recipe_append_git_testrecipe = mtd-utils
+test_devtool_update_recipe_local_files_prefix = %(test_devtool_modify_prefix)s
+test_devtool_update_recipe_local_files_testrecipe = makedevs
+test_devtool_update_recipe_local_files_2_prefix = %(test_devtool_modify_prefix)s
+test_devtool_update_recipe_local_files_2_testrecipe = lzo
+test_devtool_extract_prefix = devtoolqa
+test_devtool_extract_virtual_prefix = %(test_devtool_extract_prefix)s
+test_devtool_extract_virtual_virtrecipe = libx11
+test_devtool_reset_all_prefix = devtoolqa
+test_devtool_reset_all_testrecipe1 = mdadm
+test_devtool_reset_all_testrecipe2 = cronie
+test_devtool_deploy_target_prefix = devtoolqa
+test_devtool_deploy_target_testrecipe = mdadm
+test_devtool_deploy_target_testcommand = --help
+test_devtool_build_image_prefix = devtoolqa
+test_devtool_build_image_image = core-image-minimal
+# Add target and native recipes to workspace
+test_devtool_build_image_recipes = mdadm parted-native
+test_devtool_upgrade_prefix = devtoolqa
+test_devtool_upgrade_recipe = devtool-upgrade-test1
+test_devtool_upgrade_version = 1.6.0
+test_devtool_upgrade_git_recipe = devtool-upgrade-test2
+test_devtool_upgrade_git_commit = 6cc6077a36fe2648a5f993fe7c16c9632f946517
+test_devtool_upgrade_git_prefix = devtoolqa
+test_devtool_layer_plugins_s = Microsoft Made No Profit From Anyone's Zunes Yo
+_setup_test_devtool_finish_upgrade_recipe = devtool-upgrade-test1
+_setup_test_devtool_finish_upgrade_oldversion = 1.5.3
+_setup_test_devtool_finish_upgrade_newversion = 1.6.0
+_setup_test_devtool_finish_upgrade_prefix = devtoolqa
+_setup_test_devtool_finish_modify_recipe = mdadm
+_setup_test_devtool_finish_modify_prefix = devtoolqa
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 08fe8df..3068c4d 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -11,6 +11,8 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, runqemu, get_test_layer
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class DevtoolBase(oeSelfTest):
 
@@ -114,6 +116,11 @@ class DevtoolBase(oeSelfTest):
 
 class DevtoolTests(DevtoolBase):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     def setUp(self):
         """Test case setup function"""
         super(DevtoolTests, self).setUp()
@@ -155,7 +162,9 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('bitbake-layers show-layers')
         self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
         # Try creating a workspace layer with a specific path
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        prefix = self.config.get(
+               'DevtoolTests', 'test_create_workspace_prefix')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         result = runCmd('devtool create-workspace %s' % tempdir)
         self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')), msg = "No workspace created. devtool output: %s " % result.output)
@@ -172,45 +181,66 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1159)
     def test_devtool_add(self):
+        prefix = self.config.get('DevtoolTests', 'test_devtool_add_prefix')
+        url = self.config.get('DevtoolTests', 'test_devtool_add_url')
+        tar_file = self.config.get('DevtoolTests', 'test_devtool_add_tar_file')
+        add_dir = self.config.get('DevtoolTests', 'test_devtool_add_dir')
+        package = self.config.get('DevtoolTests', 'test_devtool_add_package')
         # Fetch source
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
-        url = 'http://www.ivarch.com/programs/sources/pv-1.5.3.tar.bz2'
         result = runCmd('wget %s' % url, cwd=tempdir)
-        result = runCmd('tar xfv pv-1.5.3.tar.bz2', cwd=tempdir)
-        srcdir = os.path.join(tempdir, 'pv-1.5.3')
+        result = runCmd('tar xfv %s' % tar_file, cwd=tempdir)
+        srcdir = os.path.join(tempdir, add_dir)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake -c cleansstate pv')
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % package)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add pv %s' % srcdir)
+        result = runCmd('devtool add %s %s' % (package, srcdir))
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         # Test devtool status
         result = runCmd('devtool status')
-        self.assertIn('pv', result.output)
+        self.assertIn(package, result.output)
         self.assertIn(srcdir, result.output)
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
-        bitbake('pv -c cleansstate')
+        bitbake('%s -c cleansstate' % package)
         # Test devtool build
-        result = runCmd('devtool build pv')
-        installdir = get_bb_var('D', 'pv')
+        result = runCmd('devtool build %s' % package)
+        installdir = get_bb_var('D', package)
         self.assertTrue(installdir, 'Could not query installdir variable')
-        bindir = get_bb_var('bindir', 'pv')
+        bindir = get_bb_var('bindir', package)
         self.assertTrue(bindir, 'Could not query bindir variable')
         if bindir[0] == '/':
             bindir = bindir[1:]
-        self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
+        self.assertTrue(
+            os.path.isfile(os.path.join(installdir, bindir, package)),
+            '%s binary not found in D' % package)
 
     @testcase(1423)
     def test_devtool_add_git_local(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_add_git_local_prefix')
+        pn = self.config.get(
+           'DevtoolTests', 'test_devtool_add_git_local_pn')
+        # We choose an https:// git URL here to check rewriting the URL works
+        url = self.config.get(
+            'DevtoolTests', 'test_devtool_add_git_local_url')
+        srcrev = self.config.get(
+               'DevtoolTests', 'test_devtool_add_git_local_srcrev')
+        license = self.config.get(
+                'DevtoolTests', 'test_devtool_add_git_local_checkvars_license')
+        md5 = self.config.get(
+            'DevtoolTests', 'test_devtool_add_git_local_checkvars_md5')
+        pv = self.config.get(
+           'DevtoolTests', 'test_devtool_add_git_local_checkvars_pv')
+        srcuri = self.config.get(
+               'DevtoolTests', 'test_devtool_add_git_local_checkvars_srcuri')
+        depends = self.config.get(
+                'DevtoolTests', 'test_devtool_add_git_local_checkvars_depends')
         # Fetch source from a remote URL, but do it outside of devtool
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
-        pn = 'dbus-wait'
-        srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
-        # We choose an https:// git URL here to check rewriting the URL works
-        url = 'https://git.yoctoproject.org/git/dbus-wait'
         # Force fetching to "noname" subdir so we verify we're picking up the name from autoconf
         # instead of the directory name
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
@@ -233,70 +263,102 @@ class DevtoolTests(DevtoolBase):
         self.assertIn(srcdir, result.output)
         self.assertIn(recipefile, result.output)
         checkvars = {}
-        checkvars['LICENSE'] = 'GPLv2'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
+        checkvars['LICENSE'] = license
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=%s' % md5
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '0.1+git${SRCPV}'
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https'
+        checkvars['PV'] = '%s+git${SRCPV}' % pv
+        checkvars['SRC_URI'] = srcuri
         checkvars['SRCREV'] = srcrev
-        checkvars['DEPENDS'] = set(['dbus'])
+        checkvars['DEPENDS'] = set([depends])
         self._test_recipe_contents(recipefile, checkvars, [])
 
     @testcase(1162)
     def test_devtool_add_library(self):
         # We don't have the ability to pick up this dependency automatically yet...
-        bitbake('libusb1')
+        recipe1 = self.config.get(
+                'DevtoolTests', 'test_devtool_add_library_recipe1')
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_add_library_prefix')
+        version = self.config.get(
+                'DevtoolTests', 'test_devtool_add_library_version')
+        recipe2 = self.config.get(
+                'DevtoolTests', 'test_devtool_add_library_recipe2')
+        url = self.config.get(
+            'DevtoolTests', 'test_devtool_add_library_url')
+        libfile = self.config.get(
+                'DevtoolTests', 'test_devtool_add_library_file')
+        binary = self.config.get(
+               'DevtoolTests', 'test_devtool_add_library_binary')
+        extra_var = eval(
+                  self.config.get(
+                     'DevtoolTests', 'test_devtool_add_library_extra_var'))
+        bitbake(recipe1)
         # Fetch source
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
-        version = '1.1'
-        url = 'https://www.intra2net.com/en/developer/libftdi/download/libftdi1-%s.tar.bz2' % version
         result = runCmd('wget %s' % url, cwd=tempdir)
-        result = runCmd('tar xfv libftdi1-%s.tar.bz2' % version, cwd=tempdir)
-        srcdir = os.path.join(tempdir, 'libftdi1-%s' % version)
+        result = runCmd(
+               'tar xfv %s-%s.tar.bz2' % (libfile, version), cwd=tempdir)
+        srcdir = os.path.join(tempdir, '%s-%s' % (libfile, version))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'CMakeLists.txt')), 'Unable to find CMakeLists.txt in source directory')
         # Test devtool add (and use -V so we test that too)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add libftdi %s -V %s' % (srcdir, version))
+        result = runCmd(
+               'devtool add %s %s -V %s' % (recipe2, srcdir, version))
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         # Test devtool status
         result = runCmd('devtool status')
-        self.assertIn('libftdi', result.output)
+        self.assertIn(recipe2, result.output)
         self.assertIn(srcdir, result.output)
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
-        bitbake('libftdi -c cleansstate')
+        bitbake('%s -c cleansstate' % recipe2)
         # libftdi's python/CMakeLists.txt is a bit broken, so let's just disable it
         # There's also the matter of it installing cmake files to a path we don't
         # normally cover, which triggers the installed-vs-shipped QA test we have
         # within do_package
-        recipefile = '%s/recipes/libftdi/libftdi_%s.bb' % (self.workspacedir, version)
-        result = runCmd('recipetool setvar %s EXTRA_OECMAKE -- \'-DPYTHON_BINDINGS=OFF -DLIBFTDI_CMAKE_CONFIG_DIR=${datadir}/cmake/Modules\'' % recipefile)
+        recipefile = '%s/recipes/%s/%s_%s.bb' % (
+                   self.workspacedir, recipe2, recipe2, version)
+        result = runCmd('recipetool setvar %s %s' % (recipefile, extra_var))
         with open(recipefile, 'a') as f:
             f.write('\nFILES_${PN}-dev += "${datadir}/cmake/Modules"\n')
         # Test devtool build
-        result = runCmd('devtool build libftdi')
-        staging_libdir = get_bb_var('STAGING_LIBDIR', 'libftdi')
+        result = runCmd('devtool build %s' % recipe2)
+        staging_libdir = get_bb_var('STAGING_LIBDIR', recipe2)
         self.assertTrue(staging_libdir, 'Could not query STAGING_LIBDIR variable')
-        self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), "libftdi binary not found in STAGING_LIBDIR. Output of devtool build libftdi %s" % result.output)
+        self.assertTrue(
+            os.path.isfile(
+                os.path.join(staging_libdir, binary)),
+            "%s binary not found in STAGING_LIBDIR. Output of devtool build \
+%s %s" % (recipe2, recipe2, result.output))
         # Test devtool reset
-        stampprefix = get_bb_var('STAMP', 'libftdi')
-        result = runCmd('devtool reset libftdi')
+        stampprefix = get_bb_var('STAMP', recipe2)
+        result = runCmd('devtool reset %s' % recipe2)
         result = runCmd('devtool status')
-        self.assertNotIn('libftdi', result.output)
-        self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe libftdi')
+        self.assertNotIn(recipe2, result.output)
+        self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe %s'
+                        % recipe2)
         matches = glob.glob(stampprefix + '*')
-        self.assertFalse(matches, 'Stamp files exist for recipe libftdi that should have been cleaned')
-        self.assertFalse(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary still found in STAGING_LIBDIR after cleaning')
+        self.assertFalse(matches, 'Stamp files exist for recipe %s that should \
+have been cleaned' % recipe2)
+        self.assertFalse(os.path.isfile(os.path.join(staging_libdir, binary)),
+                         '%s binary still found in STAGING_LIBDIR after \
+cleaning' % recipe2)
 
     @testcase(1160)
     def test_devtool_add_fetch(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_add_fetch_prefix')
+        testver = self.config.get(
+                'DevtoolTests', 'test_devtool_add_fetch_testver')
+        url = self.config.get('DevtoolTests', 'test_devtool_add_fetch_url')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_add_fetch_testrecipe')
+        fakever = self.config.get(
+                'DevtoolTests', 'test_devtool_add_fetch_fakever')
         # Fetch source
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
-        testver = '0.23'
-        url = 'https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-%s.tar.gz' % testver
-        testrecipe = 'python-markupsafe'
         srcdir = os.path.join(tempdir, testrecipe)
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
@@ -320,7 +382,6 @@ class DevtoolTests(DevtoolBase):
         # Try with version specified
         result = runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
-        fakever = '1.9'
         result = runCmd('devtool add %s %s -f %s -V %s' % (testrecipe, srcdir, url, fakever))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         # Test devtool status
@@ -337,12 +398,19 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1161)
     def test_devtool_add_fetch_git(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_add_fetch_git_prefix')
+        checkrev = self.config.get(
+                 'DevtoolTests', 'test_devtool_add_fetch_git_checkrev')
+        url = self.config.get(
+            'DevtoolTests', 'test_devtool_add_fetch_git_url')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_add_fetch_git_testrecipe')
+        pv = self.config.get('DevtoolTests', 'test_devtool_add_fetch_git_pv')
+        ver = self.config.get('DevtoolTests', 'test_devtool_add_fetch_git_ver')
         # Fetch source
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
-        url = 'git://git.yoctoproject.org/libmatchbox'
-        checkrev = '462f0652055d89c648ddd54fd7b03f175c2c6973'
-        testrecipe = 'libmatchbox2'
         srcdir = os.path.join(tempdir, testrecipe)
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
@@ -360,7 +428,7 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.12+git${SRCPV}'
+        checkvars['PV'] = '%s+git${SRCPV}' % pv
         checkvars['SRC_URI'] = url
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
@@ -368,7 +436,8 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
         url_rev = '%s;rev=%s' % (url, checkrev)
-        result = runCmd('devtool add %s %s -f "%s" -V 1.5' % (testrecipe, srcdir, url_rev))
+        result = runCmd('devtool add %s %s -f "%s" -V %s'
+                        % (testrecipe, srcdir, url_rev, ver))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure.ac in source directory')
         # Test devtool status
         result = runCmd('devtool status')
@@ -379,19 +448,24 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.5+git${SRCPV}'
+        checkvars['PV'] = '%s+git${SRCPV}' % ver
         checkvars['SRC_URI'] = url
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
     @testcase(1391)
     def test_devtool_add_fetch_simple(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_add_fetch_simple_prefix')
+        url = self.config.get(
+            'DevtoolTests', 'test_devtool_add_fetch_simple_url')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_add_fetch_simple_testrecipe')
+        testver = self.config.get(
+                'DevtoolTests', 'test_devtool_add_fetch_simple_testver')
         # Fetch source from a remote URL, auto-detecting name
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
-        testver = '1.6.0'
-        url = 'http://www.ivarch.com/programs/sources/pv-%s.tar.bz2' % testver
-        testrecipe = 'pv'
         srcdir = os.path.join(self.workspacedir, 'sources', testrecipe)
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
@@ -414,58 +488,76 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1164)
     def test_devtool_modify(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_modify_prefix')
+        recipe = self.config.get(
+               'DevtoolTests', 'test_devtool_modify_recipe')
         # Clean up anything in the workdir/sysroot/sstate cache
-        bitbake('mdadm -c cleansstate')
+        bitbake('%s -c cleansstate' % recipe)
         # Try modifying a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        self.add_command_to_tearDown('bitbake -c clean mdadm')
-        result = runCmd('devtool modify mdadm -x %s' % tempdir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
+        result = runCmd('devtool modify %s -x %s' % (recipe, tempdir))
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
-        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mdadm_*.bbappend'))
+        matches = glob.glob(
+                os.path.join(
+                    self.workspacedir, 'appends', '%s_*.bbappend' % recipe))
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
         # Test devtool status
         result = runCmd('devtool status')
-        self.assertIn('mdadm', result.output)
+        self.assertIn(recipe, result.output)
         self.assertIn(tempdir, result.output)
         # Check git repo
         self._check_src_repo(tempdir)
         # Try building
         bitbake('mdadm')
         # Try making (minor) modifications to the source
-        result = runCmd("sed -i 's!^\.TH.*!.TH MDADM 8 \"\" v9.999-custom!' %s" % os.path.join(tempdir, 'mdadm.8.in'))
-        bitbake('mdadm -c package')
-        pkgd = get_bb_var('PKGD', 'mdadm')
+        uprecipe = recipe.upper()
+        result = runCmd(
+               "sed -i 's!^\.TH.*!.TH %s 8 \"\" v9.999-custom!' %s"
+               % (uprecipe, os.path.join(tempdir, '%s.8.in' % recipe)))
+        bitbake('%s -c package' % recipe)
+        pkgd = get_bb_var('PKGD', recipe)
         self.assertTrue(pkgd, 'Could not query PKGD variable')
-        mandir = get_bb_var('mandir', 'mdadm')
+        mandir = get_bb_var('mandir', recipe)
         self.assertTrue(mandir, 'Could not query mandir variable')
         if mandir[0] == '/':
             mandir = mandir[1:]
-        with open(os.path.join(pkgd, mandir, 'man8', 'mdadm.8'), 'r') as f:
+        with open(
+                os.path.join(pkgd, mandir, 'man8', '%s.8' % recipe), 'r') as f:
             for line in f:
                 if line.startswith('.TH'):
-                    self.assertEqual(line.rstrip(), '.TH MDADM 8 "" v9.999-custom', 'man file not modified. man searched file path: %s' % os.path.join(pkgd, mandir, 'man8', 'mdadm.8'))
+                    self.assertEqual(
+                        line.rstrip(), '.TH %s 8 "" v9.999-custom' % uprecipe,
+                        'man file not modified. man searched file path: %s'
+                        % os.path.join(pkgd, mandir, 'man8', '%s.8' % recipe))
         # Test devtool reset
-        stampprefix = get_bb_var('STAMP', 'mdadm')
-        result = runCmd('devtool reset mdadm')
+        stampprefix = get_bb_var('STAMP', recipe)
+        result = runCmd('devtool reset %s' % recipe)
         result = runCmd('devtool status')
-        self.assertNotIn('mdadm', result.output)
-        self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe mdadm')
+        self.assertNotIn(recipe, result.output)
+        self.assertTrue(
+            stampprefix, 'Unable to get STAMP value for recipe %s' % recipe)
         matches = glob.glob(stampprefix + '*')
-        self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
+        self.assertFalse(matches, 'Stamp files exist for recipe %s that should\
+ have been cleaned' % recipe)
 
     @testcase(1166)
     def test_devtool_modify_invalid(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_modify_invalid_prefix')
+        testrecipes = self.config.get(
+            'DevtoolTests', 'test_devtool_modify_invalid_testrecipes').split()
         # Try modifying some recipes
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
 
-        testrecipes = 'perf kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support'.split()
         # Find actual name of gcc-source since it now includes the version - crude, but good enough for this purpose
         result = runCmd('bitbake-layers show-recipes gcc-source*')
         for line in result.output.splitlines():
@@ -488,17 +580,20 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1365)
     def test_devtool_modify_native(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_modify_native_prefix')
+        testrecipes = self.config.get(
+            'DevtoolTests', 'test_devtool_modify_native_testrecipes').split()
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         # Try modifying some recipes
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
 
         bbclassextended = False
         inheritnative = False
-        testrecipes = 'mtools-native apt-native desktop-file-utils-native'.split()
         for testrecipe in testrecipes:
             checkextend = 'native' in (get_bb_var('BBCLASSEXTEND', testrecipe) or '').split()
             if not bbclassextended:
@@ -518,14 +613,17 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1165)
     def test_devtool_modify_git(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_modify_git_prefix')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_modify_git_testrecipe')
         # Check preconditions
-        testrecipe = 'mkelfimage'
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
         # Clean up anything in the workdir/sysroot/sstate cache
         bitbake('%s -c cleansstate' % testrecipe)
         # Try modifying a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -546,8 +644,11 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1167)
     def test_devtool_modify_localfiles(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_modify_localfiles_prefix')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_modify_localfiles_testrecipe')
         # Check preconditions
-        testrecipe = 'lighttpd'
         src_uri = (get_bb_var('SRC_URI', testrecipe) or '').split()
         foundlocal = False
         for item in src_uri:
@@ -558,7 +659,7 @@ class DevtoolTests(DevtoolBase):
         # Clean up anything in the workdir/sysroot/sstate cache
         bitbake('%s -c cleansstate' % testrecipe)
         # Try modifying a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -577,10 +678,14 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1378)
     def test_devtool_modify_virtual(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_modify_virtual_prefix')
+        virtrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_modify_virtual_virtrecipe')
+        realrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_modify_virtual_realrecipe')
         # Try modifying a virtual recipe
-        virtrecipe = 'virtual/libx11'
-        realrecipe = 'libx11'
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -600,14 +705,17 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1169)
     def test_devtool_update_recipe(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_update_recipe_prefix')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_update_recipe_testrecipe')
         # Check preconditions
-        testrecipe = 'minicom'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
         self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -632,8 +740,13 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1172)
     def test_devtool_update_recipe_git(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_update_recipe_git_prefix')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_update_recipe_git_testrecipe')
+        srcuri = self.config.get(
+               'DevtoolTests', 'test_devtool_update_recipe_git_srcuri')
         # Check preconditions
-        testrecipe = 'mtd-utils'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
@@ -644,7 +757,7 @@ class DevtoolTests(DevtoolBase):
         self.assertGreater(len(patches), 0, 'The %s recipe does not appear to contain any patches, so this test will not be effective' % testrecipe)
         self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -666,7 +779,7 @@ class DevtoolTests(DevtoolBase):
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
-        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
+        addlines = ['SRCREV = ".*"', 'SRC_URI = "%s"' % srcuri]
         srcurilines = src_uri.split()
         srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
         srcurilines.append('"')
@@ -701,14 +814,17 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1170)
     def test_devtool_update_recipe_append(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_update_recipe_append_prefix')
+        testrecipe = self.config.get(
+                'DevtoolTests', 'test_devtool_update_recipe_append_testrecipe')
         # Check preconditions
-        testrecipe = 'mdadm'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
         self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         tempsrcdir = os.path.join(tempdir, 'source')
         templayerdir = os.path.join(tempdir, 'layer')
         self.track_for_cleanup(tempdir)
@@ -769,8 +885,11 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1171)
     def test_devtool_update_recipe_append_git(self):
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_update_recipe_append_git_prefix')
+        testrecipe = self.config.get(
+            'DevtoolTests', 'test_devtool_update_recipe_append_git_testrecipe')
         # Check preconditions
-        testrecipe = 'mtd-utils'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
@@ -780,7 +899,7 @@ class DevtoolTests(DevtoolBase):
                 break
         self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         tempsrcdir = os.path.join(tempdir, 'source')
         templayerdir = os.path.join(tempdir, 'layer')
         self.track_for_cleanup(tempdir)
@@ -859,10 +978,13 @@ class DevtoolTests(DevtoolBase):
     @testcase(1370)
     def test_devtool_update_recipe_local_files(self):
         """Check that local source files are copied over instead of patched"""
-        testrecipe = 'makedevs'
+        prefix = self.config.get(
+            'DevtoolTests', 'test_devtool_update_recipe_local_files_prefix')
+        testrecipe = self.config.get(
+           'DevtoolTests', 'test_devtool_update_recipe_local_files_testrecipe')
         recipefile = get_bb_var('FILE', testrecipe)
         # Setup srctree for modifying the recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -889,10 +1011,14 @@ class DevtoolTests(DevtoolBase):
     @testcase(1371)
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
-        testrecipe = 'lzo'
+        prefix = self.config.get(
+            'DevtoolTests', 'test_devtool_update_recipe_local_files_2_prefix')
+        testrecipe = self.config.get(
+            'DevtoolTests',
+            'test_devtool_update_recipe_local_files_2_testrecipe')
         recipefile = get_bb_var('FILE', testrecipe)
         # Setup srctree for modifying the recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -929,7 +1055,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1163)
     def test_devtool_extract(self):
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_extract_prefix')
+        tempdir = tempfile.mkdtemp(prefix)
         # Try devtool extract
         self.track_for_cleanup(tempdir)
         self.append_config('PREFERRED_PROVIDER_virtual/make = "remake"')
@@ -941,7 +1069,11 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1379)
     def test_devtool_extract_virtual(self):
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_extract_virtual_prefix')
+        virtrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_extract_virtual_virtrecipe')
+        tempdir = tempfile.mkdtemp(prefix)
         # Try devtool extract
         self.track_for_cleanup(tempdir)
         result = runCmd('devtool extract virtual/libx11 %s' % tempdir)
@@ -952,12 +1084,16 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1168)
     def test_devtool_reset_all(self):
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_reset_all_prefix')
+        testrecipe1 = self.config.get(
+                    'DevtoolTests', 'test_devtool_reset_all_testrecipe1')
+        testrecipe2 = self.config.get(
+                    'DevtoolTests', 'test_devtool_reset_all_testrecipe2')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        testrecipe1 = 'mdadm'
-        testrecipe2 = 'cronie'
         result = runCmd('devtool modify -x %s %s' % (testrecipe1, os.path.join(tempdir, testrecipe1)))
         result = runCmd('devtool modify -x %s %s' % (testrecipe2, os.path.join(tempdir, testrecipe2)))
         result = runCmd('devtool build %s' % testrecipe1)
@@ -1003,10 +1139,16 @@ class DevtoolTests(DevtoolBase):
             self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         # Definitions
-        testrecipe = 'mdadm'
-        testfile = '/sbin/mdadm'
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_deploy_target_prefix')
+        testrecipe = self.config.get(
+                   'DevtoolTests', 'test_devtool_deploy_target_testrecipe')
+        test_command = self.config.get(
+                    'DevtoolTests', 'test_devtool_deploy_target_testcommand')
+
+        testfile = '/sbin/%s' % testrecipe
         testimage = 'oe-selftest-image'
-        testcommand = '/sbin/mdadm --help'
+        testcommand = '/sbin/%s %s' % (testrecipe, test_command)
         # Build an image to run
         bitbake("%s qemu-native qemu-helper-native" % testimage)
         deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
@@ -1015,7 +1157,7 @@ class DevtoolTests(DevtoolBase):
         # Clean recipe so the first deploy will fail
         bitbake("%s -c clean" % testrecipe)
         # Try devtool modify
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -1045,7 +1187,7 @@ class DevtoolTests(DevtoolBase):
             filelist1 = self._process_ls_output(result.output)
 
             # Now look on the target
-            tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
+            tempdir2 = tempfile.mkdtemp(prefix)
             self.track_for_cleanup(tempdir2)
             tmpfilelist = os.path.join(tempdir2, 'files.txt')
             with open(tmpfilelist, 'w') as f:
@@ -1066,16 +1208,20 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_build_image(self):
         """Test devtool build-image plugin"""
         # Check preconditions
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_build_image_prefix')
+        image = self.config.get(
+              'DevtoolTests', 'test_devtool_build_image_image')
+        recipes = self.config.get(
+                'DevtoolTests', 'test_devtool_build_image_recipes').split()
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-        image = 'core-image-minimal'
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % image)
         bitbake('%s -c clean' % image)
         # Add target and native recipes to workspace
-        recipes = ['mdadm', 'parted-native']
         for recipe in recipes:
-            tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+            tempdir = tempfile.mkdtemp(prefix)
             self.track_for_cleanup(tempdir)
             self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
             runCmd('devtool modify %s -x %s' % (recipe, tempdir))
@@ -1099,6 +1245,12 @@ class DevtoolTests(DevtoolBase):
     @testcase(1367)
     def test_devtool_upgrade(self):
         # Check preconditions
+        recipe = self.config.get(
+               'DevtoolTests', 'test_devtool_upgrade_recipe')
+        version = self.config.get(
+                'DevtoolTests', 'test_devtool_upgrade_version')
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_upgrade_prefix')
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -1107,10 +1259,8 @@ class DevtoolTests(DevtoolBase):
         for param in 'recipename srctree --version -V --branch -b --keep-temp --no-patch'.split():
             self.assertIn(param, result.output)
         # For the moment, we are using a real recipe.
-        recipe = 'devtool-upgrade-test1'
-        version = '1.6.0'
         oldrecipefile = get_bb_var('FILE', recipe)
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         # Check that recipe is not already under devtool control
         result = runCmd('devtool status')
@@ -1144,13 +1294,17 @@ class DevtoolTests(DevtoolBase):
     @testcase(1433)
     def test_devtool_upgrade_git(self):
         # Check preconditions
+        recipe = self.config.get(
+               'DevtoolTests', 'test_devtool_upgrade_git_recipe')
+        commit = self.config.get(
+               'DevtoolTests', 'test_devtool_upgrade_git_commit')
+        prefix = self.config.get(
+               'DevtoolTests', 'test_devtool_upgrade_git_prefix')
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        recipe = 'devtool-upgrade-test2'
-        commit = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
         oldrecipefile = get_bb_var('FILE', recipe)
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         # Check that recipe is not already under devtool control
         result = runCmd('devtool status')
@@ -1186,8 +1340,7 @@ class DevtoolTests(DevtoolBase):
 
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-
-        s = "Microsoft Made No Profit From Anyone's Zunes Yo"
+        s = self.config.get('DevtoolTests', 'test_devtool_layer_plugins_s')
         result = runCmd("devtool --quiet selftest-reverse \"%s\"" % s)
         self.assertEqual(result.output, s[::-1])
 
@@ -1197,15 +1350,20 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         # Use a "real" recipe from meta-selftest
-        recipe = 'devtool-upgrade-test1'
-        oldversion = '1.5.3'
-        newversion = '1.6.0'
+        recipe = self.config.get(
+               'DevtoolTests', '_setup_test_devtool_finish_upgrade_recipe')
+        oldversion = self.config.get(
+               'DevtoolTests', '_setup_test_devtool_finish_upgrade_oldversion')
+        newversion = self.config.get(
+               'DevtoolTests', '_setup_test_devtool_finish_upgrade_newversion')
+        prefix = self.config.get(
+               'DevtoolTests', '_setup_test_devtool_finish_upgrade_prefix')
         oldrecipefile = get_bb_var('FILE', recipe)
         recipedir = os.path.dirname(oldrecipefile)
         result = runCmd('git status --porcelain .', cwd=recipedir)
         if result.output.strip():
             self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         # Check that recipe is not already under devtool control
         result = runCmd('devtool status')
@@ -1273,13 +1431,16 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         # Try modifying a recipe
         self.track_for_cleanup(self.workspacedir)
-        recipe = 'mdadm'
+        recipe = self.config.get(
+               'DevtoolTests', '_setup_test_devtool_finish_modify_recipe')
+        prefix = self.config.get(
+               'DevtoolTests', '_setup_test_devtool_finish_modify_prefix')
         oldrecipefile = get_bb_var('FILE', recipe)
         recipedir = os.path.dirname(oldrecipefile)
         result = runCmd('git status --porcelain .', cwd=recipedir)
         if result.output.strip():
             self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s %s' % (recipe, tempdir))
@@ -1289,7 +1450,7 @@ class DevtoolTests(DevtoolBase):
         self.assertIn(recipe, result.output)
         self.assertIn(tempdir, result.output)
         # Make a change to the source
-        result = runCmd('sed -i \'/^#include "mdadm.h"/a \\/* Here is a new comment *\\/\' maps.c', cwd=tempdir)
+        result = runCmd('sed -i \'/^#include "%s.h"/a \\/* Here is a new comment *\\/\' maps.c' % recipe, cwd=tempdir)
         result = runCmd('git status --porcelain', cwd=tempdir)
         self.assertIn('M maps.c', result.output)
         result = runCmd('git commit maps.c -m "Add a comment to the code"', cwd=tempdir)
-- 
1.8.3.1


