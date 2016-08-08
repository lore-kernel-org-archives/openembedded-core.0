Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74E0D771D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316034"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:05 -0700
Message-Id: <8a77a75e55a638fbf63990a33f6c85c0846c0c31.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 17/20] oeqa.selftest.signing: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:24 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/signing.conf |  15 ++++
 meta/lib/oeqa/selftest/signing.py        | 119 +++++++++++++++++++------------
 2 files changed, 90 insertions(+), 44 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/signing.conf

diff --git a/meta/lib/oeqa/selftest/conf/signing.conf b/meta/lib/oeqa/selftest/conf/signing.conf
new file mode 100644
index 0000000..c95d247
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/signing.conf
@@ -0,0 +1,15 @@
+[Signing]
+setUpClass_prefix = oeqa-signing-
+# key.secret and key.pub are located in gpg_dir
+setUpClass_pub_keyname = key.pub
+setUpClass_secret_keyname = key.secret
+setUpClass_test_recipe = ed
+setUpClass_passphrase = test123
+signing_packages_inherit = sign_rpm
+signing_packages_name = testuser
+[LockedSignatures]
+locked_signatures_locked_sigs_file = locked-sigs.inc
+locked_signatures_feature = require %(locked_signatures_locked_sigs_file)s
+                            SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"
+locked_signatures_recipe_dir = recipes-test
+locked_signatures_summary = test locked signature
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 4c12d6d..8ce45c3 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -7,13 +7,12 @@ import shutil
 import tempfile
 from oeqa.utils.decorators import testcase
 from oeqa.utils.ftools import write_file
+from oeqa.utils.readconfig import conffile
 
 
 class Signing(oeSelfTest):
 
     gpg_dir = ""
-    pub_key_path = ""
-    secret_key_path = ""
 
     @classmethod
     def setUpClass(cls):
@@ -21,11 +20,19 @@ class Signing(oeSelfTest):
         if not shutil.which("gpg"):
             raise AssertionError("This test needs GnuPG")
 
-        cls.gpg_home_dir = tempfile.TemporaryDirectory(prefix="oeqa-signing-")
+        cls.config = conffile(__file__)
+        prefix = cls.config.get('Signing', 'setUpClass_prefix')
+        pub_keyname = cls.config.get('Signing', 'setUpClass_pub_keyname')
+        secret_keyname = cls.config.get('Signing', 'setUpClass_secret_keyname')
+        cls.test_recipe = cls.config.get('Signing', 'setUpClass_test_recipe')
+        cls.passphrase = cls.config.get('Signing', 'setUpClass_passphrase')
+        cls.gpg_home_dir = tempfile.TemporaryDirectory(prefix)
         cls.gpg_dir = cls.gpg_home_dir.name
 
-        cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
-        cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
+        cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing',
+                                        pub_keyname)
+        cls.secret_key_path = os.path.join(cls.testlayer_path, 'files',
+                                           'signing', secret_keyname)
 
         runCmd('gpg --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
 
@@ -40,32 +47,36 @@ class Signing(oeSelfTest):
         """
         import oe.packagedata
 
+        # Test configuration is taken from conf file
+        inherit = self.config.get('Signing', 'signing_packages_inherit')
+        passphrase = self.config.get('Signing', 'setupClass_passphrase')
+        name = self.config.get('Signing', 'signing_packages_name')
         package_classes = get_bb_var('PACKAGE_CLASSES')
         if 'package_rpm' not in package_classes:
             self.skipTest('This test requires RPM Packaging.')
 
-        test_recipe = 'ed'
-
-        feature = 'INHERIT += "sign_rpm"\n'
-        feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
-        feature += 'RPM_GPG_NAME = "testuser"\n'
+        feature = 'INHERIT += "%s"\n' % inherit
+        feature += 'RPM_GPG_PASSPHRASE = "%s"\n' % passphrase
+        feature += 'RPM_GPG_NAME = "%s"\n' % name
         feature += 'RPM_GPG_PUBKEY = "%s"\n' % self.pub_key_path
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
 
         self.write_config(feature)
 
-        bitbake('-c cleansstate %s' % test_recipe)
-        bitbake(test_recipe)
-        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
+        bitbake('-c cleansstate %s' % self.test_recipe)
+        bitbake(self.test_recipe)
+        self.add_command_to_tearDown('bitbake -c clean %s' % self.test_recipe)
 
-        pkgdatadir = get_bb_var('PKGDATA_DIR', test_recipe)
-        pkgdata = oe.packagedata.read_pkgdatafile(pkgdatadir + "/runtime/ed")
+        pkgdatadir = get_bb_var('PKGDATA_DIR', self.test_recipe)
+        pkgdata = oe.packagedata.read_pkgdatafile(pkgdatadir + "/runtime/%s"
+                                                  % self.test_recipe)
         if 'PKGE' in pkgdata:
             pf = pkgdata['PN'] + "-" + pkgdata['PKGE'] + pkgdata['PKGV'] + '-' + pkgdata['PKGR']
         else:
             pf = pkgdata['PN'] + "-" + pkgdata['PKGV'] + '-' + pkgdata['PKGR']
-        deploy_dir_rpm = get_bb_var('DEPLOY_DIR_RPM', test_recipe)
-        package_arch = get_bb_var('PACKAGE_ARCH', test_recipe).replace('-', '_')
+        deploy_dir_rpm = get_bb_var('DEPLOY_DIR_RPM', self.test_recipe)
+        package_arch = get_bb_var(
+                     'PACKAGE_ARCH', self.test_recipe).replace('-', '_')
         staging_bindir_native = get_bb_var('STAGING_BINDIR_NATIVE')
 
         pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
@@ -92,13 +103,12 @@ class Signing(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        test_recipe = 'ed'
-
         builddir = os.environ.get('BUILDDIR')
         sstatedir = os.path.join(builddir, 'test-sstate')
 
-        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
-        self.add_command_to_tearDown('bitbake -c cleansstate %s' % test_recipe)
+        self.add_command_to_tearDown('bitbake -c clean %s' % self.test_recipe)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s'
+                                     % self.test_recipe)
         self.add_command_to_tearDown('rm -rf %s' % sstatedir)
 
         # Determine the pub key signature
@@ -108,18 +118,20 @@ class Signing(oeSelfTest):
         pub_key = pub_key.group(1)
 
         feature = 'SSTATE_SIG_KEY ?= "%s"\n' % pub_key
-        feature += 'SSTATE_SIG_PASSPHRASE ?= "test123"\n'
+        feature += 'SSTATE_SIG_PASSPHRASE ?= "%s"\n' % self.passphrase
         feature += 'SSTATE_VERIFY_SIG ?= "1"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
         feature += 'SSTATE_DIR = "%s"\n' % sstatedir
 
         self.write_config(feature)
 
-        bitbake('-c cleansstate %s' % test_recipe)
-        bitbake(test_recipe)
+        bitbake('-c cleansstate %s' % self.test_recipe)
+        bitbake(self.test_recipe)
 
-        recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
-        recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
+        recipe_sig = glob.glob(
+                   sstatedir + '/*/*:%s:*_package.tgz.sig' % self.test_recipe)
+        recipe_tgz = glob.glob(
+                   sstatedir + '/*/*:%s:*_package.tgz' % self.test_recipe)
 
         self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
         self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
@@ -132,6 +144,21 @@ class Signing(oeSelfTest):
 
 class LockedSignatures(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.test_recipe = cls.config.get(
+                        'Signing', 'setupClass_test_recipe')
+        cls.locked_sigs_file = cls.config.get(
+                    'LockedSignatures', 'locked_signatures_locked_sigs_file')
+        cls.feature = cls.config.get(
+                    'LockedSignatures', 'locked_signatures_feature')
+        cls.recipe_dir = cls.config.get(
+                       'LockedSignatures', 'locked_signatures_recipe_dir')
+        cls.summary = cls.config.get(
+                    'LockedSignatures', 'locked_signatures_summary')
+
     @testcase(1420)
     def test_locked_signatures(self):
         """
@@ -142,37 +169,41 @@ class LockedSignatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        test_recipe = 'ed'
-        locked_sigs_file = 'locked-sigs.inc'
-
-        self.add_command_to_tearDown('rm -f %s' % os.path.join(self.builddir, locked_sigs_file))
+        self.add_command_to_tearDown(
+            'rm -f %s' % os.path.join(self.builddir, self.locked_sigs_file))
 
-        bitbake(test_recipe)
+        bitbake(self.test_recipe)
         # Generate locked sigs include file
-        bitbake('-S none %s' % test_recipe)
+        bitbake('-S none %s' % self.test_recipe)
 
-        feature = 'require %s\n' % locked_sigs_file
-        feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
-        self.write_config(feature)
+        self.write_config(self.feature)
 
         # Build a locked recipe
-        bitbake(test_recipe)
+        bitbake(self.test_recipe)
 
         # Make a change that should cause the locked task signature to change
-        recipe_append_file = test_recipe + '_' + get_bb_var('PV', test_recipe) + '.bbappend'
-        recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', test_recipe, recipe_append_file)
-        feature = 'SUMMARY += "test locked signature"\n'
-
-        os.mkdir(os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
+        recipe_append_file = self.test_recipe + '_' + get_bb_var(
+                                        'PV', self.test_recipe) + '.bbappend'
+        recipe_append_path = os.path.join(
+                           self.testlayer_path, self.recipe_dir,
+                           self.test_recipe, recipe_append_file)
+        feature = 'SUMMARY += "%s"\n' % self.summary
+
+        os.mkdir(os.path.join(self.testlayer_path, self.recipe_dir,
+                              self.test_recipe))
         write_file(recipe_append_path, feature)
 
-        self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
+        self.add_command_to_tearDown(
+            'rm -rf %s' % os.path.join(self.testlayer_path,
+                                       self.recipe_dir, self.test_recipe))
 
         # Build the recipe again
-        ret = bitbake(test_recipe)
+        ret = bitbake(self.test_recipe)
 
         # Verify you get the warning and that the real task *isn't* run (i.e. the locked signature has worked)
-        patt = r'WARNING: The %s:do_package sig is computed to be \S+, but the sig is locked to \S+ in SIGGEN_LOCKEDSIGS\S+' % test_recipe
+        patt = (r'WARNING: The %s:do_package sig is computed to be \S+, '
+                r'but the sig is locked to \S+ in SIGGEN_LOCKEDSIGS\S+'
+                % self.test_recipe)
         found_warn = re.search(patt, ret.output)
 
         self.assertIsNotNone(found_warn, "Didn't find the expected warning message. Output: %s" % ret.output)
-- 
1.8.3.1


