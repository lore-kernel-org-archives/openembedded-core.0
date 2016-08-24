Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4CBEB7318C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 20:55:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 24 Aug 2016 13:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,572,1464678000"; d="scan'208";a="1030784314"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2016 13:55:36 -0700
Received: from fjpedraz-MOBL3.zpn.intel.com (unknown [10.219.128.66])
	by linux.intel.com (Postfix) with ESMTP id B087A6A4006;
	Wed, 24 Aug 2016 13:55:15 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 15:55:23 -0500
Message-Id: <1472072123-21358-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	paul.eggleton@linux.intel.com
Subject: [PATCH v2] oeqa/selftest Adds eSDK test cases to devtool verification.
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
X-List-Received-Date: Wed, 24 Aug 2016 20:55:34 -0000

The covered functions are, install libraries headers and image generation
binary feeds.

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/eSDK.py | 103 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/eSDK.py

diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
new file mode 100644
index 0000000..9d5c680
--- /dev/null
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -0,0 +1,103 @@
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
+    # Install libraries and headers, image generation binary feeds.
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
+if __name__ == '__main__':
+    unittest.main()
-- 
2.5.0


