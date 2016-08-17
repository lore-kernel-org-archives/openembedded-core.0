Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DC0F66013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 22:31:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 17 Aug 2016 15:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,535,1464678000"; d="scan'208";a="867218188"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2016 15:31:09 -0700
Received: from fjpedraz-MOBL3.zpn.intel.com (conejo-nuc.zpn.intel.com
	[10.219.128.66])
	by linux.intel.com (Postfix) with ESMTP id D064B6A4080;
	Wed, 17 Aug 2016 15:30:52 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 17:31:00 -0500
Message-Id: <1471473060-27026-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1471473060-27026-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1471473060-27026-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 2/2] oeqa/selftest Adds eSDK test cases to devtool verification.
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
X-List-Received-Date: Wed, 17 Aug 2016 22:31:11 -0000

The covered functions are, install libraries headers, image generation binary feeds and
sdk update devtool.

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/eSDK.py | 147 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/eSDK.py

diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
new file mode 100644
index 0000000..76fe660
--- /dev/null
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -0,0 +1,147 @@
+import unittest
+import tempfile
+import shutil
+import os
+import glob
+import logging
+import subprocess
+import oeqa.utils.ftools as ftools
+from oeqa.utils.decorators import testcase 
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.httpserver import HTTPService
+
+class oeSDKExtSelfTest(oeSelfTest):
+    """
+    # Bugzilla Test Plan: 6033
+    # This code is planned to be part of the automation for eSDK containig
+    # Install libraries and headers, image generation binary feeds, Node.js Installation, Node.js test recipes 
+    # and sdk update devtool.
+    """
+
+    @staticmethod
+    def get_esdk_environment(env_eSDK, tmpdir_eSDKQA):
+        # XXX: at this time use the first env need to investigate
+        # what environment load oe-selftest, i586, x86_64
+        pattern = os.path.join(tmpdir_eSDKQA, 'environment-setup-*')
+        return glob.glob(pattern)[0]
+    
+    @staticmethod
+    def run_esdk_cmd(env_eSDK, tmpdir_eSDKQA, cmd, postconfig=None, **options):
+        if postconfig:
+            esdk_conf_file = os.path.join(tmpdir_eSDKQA, 'conf', 'local.conf')
+            with open(esdk_conf_file, 'a+') as f:
+                f.write(postconfig)
+        if not options:
+            options = {}
+        if not 'shell' in options:
+            options['shell'] = True
+
+        runCmd("cd %s; . %s; %s" % (tmpdir_eSDKQA, env_eSDK, cmd), **options)
+
+    @staticmethod
+    def generate_eSDK(image):
+        pn_task = '%s -c populate_sdk_ext' % image
+        bitbake(pn_task)
+
+    @staticmethod
+    def get_eSDK_toolchain(image):
+        pn_task = '%s -c populate_sdk_ext' % image
+
+        sdk_deploy = get_bb_var('SDK_DEPLOY', pn_task)
+        toolchain_name = get_bb_var('TOOLCHAINEXT_OUTPUTNAME', pn_task)
+        return os.path.join(sdk_deploy, toolchain_name + '.sh')
+    
+
+    @classmethod
+    def setUpClass(cls):
+        # Start to serve sstate dir
+        sstate_dir = os.path.join(os.environ['BUILDDIR'], 'sstate-cache')
+        cls.http_service = HTTPService(sstate_dir)
+        cls.http_service.start()
+
+        http_url = "127.0.0.1:%d" % cls.http_service.port
+ 
+        image = 'core-image-minimal'
+
+        cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
+        oeSDKExtSelfTest.generate_eSDK(image)
+
+        # Install eSDK
+        ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(image)
+        runCmd("%s -y -d \"%s\"" % (ext_sdk_path, cls.tmpdir_eSDKQA))
+
+        cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
+
+        # Configure eSDK to use sstate mirror from poky
+        sstate_config="""
+SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
+SSTATE_MIRRORS =  "file://.* http://%s/PATH"
+        """ % http_url
+        with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
+            f.write(sstate_config)
+
+        # Common variables
+        cls.package_nodejs = "npm://registry.npmjs.org;name=forever;version=0.15.1"
+      
+    @classmethod
+    def tearDownClass(cls):
+        shutil.rmtree(cls.tmpdir_eSDKQA)
+        cls.http_service.stop()
+
+    @testcase (1471)
+    def test_install_libraries_headers(self):
+        pn_sstate = 'bc'
+        bitbake(pn_sstate)
+        cmd = "devtool sdk-install %s " % pn_sstate
+        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
+    
+    @testcase(1472)
+    def test_image_generation_binary_feeds(self):
+        image = 'core-image-minimal'
+        cmd = "devtool build-image %s" % image
+        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
+
+
+    @testcase(1487)
+    def test_sdkupdate_devtool(self):
+        image = 'core-image-sato'
+
+        tmpdir_publish_eSDK = tempfile.mkdtemp(prefix='publish_eSDK')
+
+        http_service = HTTPService(tmpdir_publish_eSDK)
+        http_service.start()
+        http_url = "http://127.0.0.1:%d" % http_service.port
+
+        sstate_config = """
+SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
+SSTATE_MIRRORS =  "file://.* http://%s/PATH"
+EXAMPLE_VAR = "qemux86"        
+        """ %http_url
+        
+        with open (os.path.join(self.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
+            f.write(sstate_config)
+
+        try:
+            oeSDKExtSelfTest.generate_eSDK(image)
+            ext_sdk_path_sato = oeSDKExtSelfTest.get_eSDK_toolchain(image)
+          
+            cmd = "oe-publish-sdk %s %s" % (ext_sdk_path_sato, tmpdir_publish_eSDK)
+            subprocess.check_output(cmd, shell=True)
+
+            cmd = 'devtool sdk-update %s' % http_url
+            oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, tmpdir_publish_eSDK, cmd)
+            with open(os.path.join(self.tmpdir_eSDKQA, 'conf', 'local.conf')) as f:
+                for line in f:
+                    if line.strip() == 'EXAMPLE_VAR = "qemux86"':
+                        break
+                else:
+                    self.fail("Test configuration missing.")
+
+        finally:
+            http_service.stop()
+            shutil.rmtree(tmpdir_publish_eSDK)
+            self.remove_config(sstate_config)
+
+if __name__ == '__main__':
+    unittest.main()
-- 
2.5.0


