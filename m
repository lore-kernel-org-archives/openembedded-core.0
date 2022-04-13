X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Ferry Toth" <fntoth@gmail.com>
Subject: [PATCH v4 1/2] apt: add apt selftest to test signed package feeds
Date: Wed, 13 Apr 2022 22:37:41 +0200
Message-Id: <20220413203742.6142-2-fntoth@gmail.com>
In-Reply-To: <20220413203742.6142-1-fntoth@gmail.com>
References: <20220413203742.6142-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Xavier Berger <xavier.berger@biologic.net>, Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ferry Toth <ftoth@exalondelft.nl>

From: Ferry Toth <ftoth@exalondelft.nl>

Since Gatesgarth apt (1.8.2) has become more strict and doesn’t allow unsigned repositories by default.
Currently when building images this requirement is worked around by using [allow-insecure=yes] and
equivalently when performing selftest.

Patches "gpg-sign: Add parameters to gpg signature function" and "package_manager: sign DEB package feeds"
enable signed DEB package feeds. This patch adds a runtime test for apt derived from the test_testimage_dnf
test. It creates a signed deb package feed, runs a qemu image to install the key and performs some package
management. To be able to install the key the gnupg package is added to the testimage.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 meta/lib/oeqa/runtime/cases/apt.py           | 38 ++++++++++++++++----
 meta/lib/oeqa/selftest/cases/runtime_test.py | 38 ++++++++++++++++++++
 2 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 53745df93f..574a34f148 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -21,7 +21,7 @@ class AptRepoTest(AptTest):
 
     @classmethod
     def setUpClass(cls):
-        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all')
+        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], '')
         cls.repo_server = HTTPService(service_repo,
                                       '0.0.0.0', port=cls.tc.target.server_port,
                                       logger=cls.tc.logger)
@@ -34,20 +34,44 @@ class AptRepoTest(AptTest):
     def setup_source_config_for_package_install(self):
         apt_get_source_server = 'http://%s:%s/' % (self.tc.target.server_ip, self.repo_server.port)
         apt_get_sourceslist_dir = '/etc/apt/'
-        self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
+        self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s/all ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
+
+    def setup_source_config_for_package_install_signed(self):
+        apt_get_source_server = 'http:\/\/%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
+        apt_get_sourceslist_dir = '/etc/apt/'
+        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's/\[trusted=yes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
 
     def cleanup_source_config_for_package_install(self):
         apt_get_sourceslist_dir = '/etc/apt/'
         self.target.run('cd %s; rm sources.list' % (apt_get_sourceslist_dir))
 
+    def cleanup_source_config_for_package_install_signed(self):
+        apt_get_sourceslist_dir = '/etc/apt/'
+        self.target.run('cd %s; mv sources.list.bak sources.list' % (apt_get_sourceslist_dir))
+
+    def setup_key(self):
+        # the key is found on the target /etc/pki/packagefeed-gpg/
+        # named PACKAGEFEED-GPG-KEY-poky-branch
+        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
+
     @skipIfNotFeature('package-management',
                       'Test requires package-management to be in IMAGE_FEATURES')
     @skipIfNotDataVar('IMAGE_PKGTYPE', 'deb',
                       'DEB is not the primary package manager')
     @OEHasPackage(['apt'])
     def test_apt_install_from_repo(self):
-        self.setup_source_config_for_package_install()
-        self.pkg('update')
-        self.pkg('remove --yes run-postinsts-dev')
-        self.pkg('install --yes --allow-unauthenticated run-postinsts-dev')
-        self.cleanup_source_config_for_package_install()
+        if not self.tc.td.get('PACKAGE_FEED_GPG_NAME'):
+            self.setup_source_config_for_package_install()
+            self.pkg('update')
+            self.pkg('remove --yes run-postinsts-dev')
+            self.pkg('install --yes --allow-unauthenticated run-postinsts-dev')
+            self.cleanup_source_config_for_package_install()
+        else:
+            # when we are here a key has been set to sign the package feed and
+            # public key and gnupg installed on the image by test_testimage_apt
+            self.setup_source_config_for_package_install_signed()
+            self.setup_key()
+            self.pkg('update')
+            self.pkg('install --yes run-postinsts-dev')
+            self.pkg('remove --yes run-postinsts-dev')
+            self.cleanup_source_config_for_package_install_signed()
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 2ad89490fc..3ece617cb0 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -162,6 +162,44 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
+    def test_testimage_apt(self):
+        """
+        Summary: Check package feeds functionality for apt
+        Expected: 1. Check that remote package feeds can be accessed
+        Product: oe-core
+        Author: Ferry Toth <fntoth@gmail.com>
+        """
+        if get_bb_var('DISTRO') == 'poky-tiny':
+            self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
+
+        features = 'INHERIT += "testimage"\n'
+        features += 'TEST_SUITES = "ping ssh apt.AptRepoTest.test_apt_install_from_repo"\n'
+        # We don't yet know what the server ip and port will be - they will be patched
+        # in at the start of the on-image test
+        features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
+        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
+        features += 'PACKAGE_CLASSES = "package_deb"\n'
+        # We need  gnupg on the target to install keys
+        features += 'IMAGE_INSTALL:append:pn-core-image-full-cmdline = " gnupg"\n'
+
+        bitbake('gnupg-native -c addto_recipe_sysroot')
+
+        # Enable package feed signing
+        self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
+        self.track_for_cleanup(self.gpg_home)
+        signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
+        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --homedir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"), shell=True)
+        features += 'INHERIT += "sign_package_feed"\n'
+        features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
+        features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
+        features += 'GPG_PATH = "%s"\n' % self.gpg_home
+        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
+        self.write_config(features)
+
+        # Build core-image-sato and testimage
+        bitbake('core-image-full-cmdline socat')
+        bitbake('-c testimage core-image-full-cmdline')
+
     def test_testimage_virgl_gtk_sdl(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk and SDL frontends
-- 
2.32.0

