Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB0477F6D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279805"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:48 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:37 -0500
Message-Id: <6675ccafcdd4990550ef270a61b1dd4b3fefbb81.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 22/30] oeqa/selftest/cases: eSDK enable threaded runs
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Change some staticmethods to classmethods to be able access
wrappers from OESelfTestCase.
- Remove unused method update_configuration.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 61 +++++++++++-------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 60f4e239ab0..618f93c53c1 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -4,7 +4,6 @@ import os
 import glob
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
 class oeSDKExtSelfTest(OESelftestTestCase):
     """
@@ -12,16 +11,15 @@ class oeSDKExtSelfTest(OESelftestTestCase):
     # This code is planned to be part of the automation for eSDK containig
     # Install libraries and headers, image generation binary feeds, sdk-update.
     """
-
-    @staticmethod
-    def get_esdk_environment(env_eSDK, tmpdir_eSDKQA):
+    @classmethod
+    def get_esdk_environment(cls, env_eSDK, tmpdir_eSDKQA):
         # XXX: at this time use the first env need to investigate
         # what environment load oe-selftest, i586, x86_64
         pattern = os.path.join(tmpdir_eSDKQA, 'environment-setup-*')
         return glob.glob(pattern)[0]
 
-    @staticmethod
-    def run_esdk_cmd(env_eSDK, tmpdir_eSDKQA, cmd, postconfig=None, **options):
+    @classmethod
+    def run_esdk_cmd(cls, env_eSDK, tmpdir_eSDKQA, cmd, postconfig=None, **options):
         if postconfig:
             esdk_conf_file = os.path.join(tmpdir_eSDKQA, 'conf', 'local.conf')
             with open(esdk_conf_file, 'a+') as f:
@@ -31,57 +29,37 @@ class oeSDKExtSelfTest(OESelftestTestCase):
         if not 'shell' in options:
             options['shell'] = True
 
-        runCmd("cd %s; . %s; %s" % (tmpdir_eSDKQA, env_eSDK, cmd), **options)
+        cls.runCmd("cd %s; . %s; %s" % (tmpdir_eSDKQA, env_eSDK, cmd), **options)
 
-    @staticmethod
-    def generate_eSDK(image):
+    @classmethod
+    def generate_eSDK(cls, image):
         pn_task = '%s -c populate_sdk_ext' % image
-        bitbake(pn_task)
+        cls.bitbake(pn_task)
 
-    @staticmethod
-    def get_eSDK_toolchain(image):
+    @classmethod
+    def get_eSDK_toolchain(cls, image):
         pn_task = '%s -c populate_sdk_ext' % image
 
-        bb_vars = get_bb_vars(['SDK_DEPLOY', 'TOOLCHAINEXT_OUTPUTNAME'], pn_task)
+        bb_vars = cls.get_bb_vars(['SDK_DEPLOY', 'TOOLCHAINEXT_OUTPUTNAME'], pn_task)
         sdk_deploy = bb_vars['SDK_DEPLOY']
         toolchain_name = bb_vars['TOOLCHAINEXT_OUTPUTNAME']
         return os.path.join(sdk_deploy, toolchain_name + '.sh')
 
-    @staticmethod
-    def update_configuration(cls, image, tmpdir_eSDKQA, env_eSDK, ext_sdk_path):
-        sstate_dir = os.path.join(cls.builddir, 'sstate-cache')
-
-        oeSDKExtSelfTest.generate_eSDK(cls.image)
-
-        cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
-        runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
-
-        cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
-
-        sstate_config="""
-SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
-SSTATE_MIRRORS =  "file://.* file://%s/PATH"
-CORE_IMAGE_EXTRA_INSTALL = "perl"
-        """ % sstate_dir
-
-        with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
-            f.write(sstate_config)
-
     @classmethod
     def setUpClass(cls):
         super(oeSDKExtSelfTest, cls).setUpClass()
         cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
 
-        sstate_dir = get_bb_var('SSTATE_DIR')
+        sstate_dir = cls.get_bb_var('SSTATE_DIR')
 
         cls.image = 'core-image-minimal'
-        oeSDKExtSelfTest.generate_eSDK(cls.image)
+        cls.generate_eSDK(cls.image)
 
         # Install eSDK
-        cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
-        runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
+        cls.ext_sdk_path = cls.get_eSDK_toolchain(cls.image)
+        cls.runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
 
-        cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
+        cls.env_eSDK = cls.get_esdk_environment('', cls.tmpdir_eSDKQA)
 
         # Configure eSDK to use sstate mirror from poky
         sstate_config="""
@@ -99,13 +77,12 @@ SSTATE_MIRRORS =  "file://.* file://%s/PATH"
     @OETestID(1602)
     def test_install_libraries_headers(self):
         pn_sstate = 'bc'
-        bitbake(pn_sstate)
+        self.bitbake(pn_sstate)
         cmd = "devtool sdk-install %s " % pn_sstate
-        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
+        self.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
 
     @OETestID(1603)
     def test_image_generation_binary_feeds(self):
         image = 'core-image-minimal'
         cmd = "devtool build-image %s" % image
-        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
-
+        self.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
-- 
2.11.0


