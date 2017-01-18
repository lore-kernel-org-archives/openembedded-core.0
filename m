Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B8FE771A3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 02:09:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2017 18:09:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,247,1477983600"; d="scan'208";a="1084237044"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2017 18:09:09 -0800
Received: from fjpedraz-MOBL3.zpn.intel.com (unknown [10.219.5.153])
	by linux.intel.com (Postfix) with ESMTP id BCD2A6A4006;
	Tue, 17 Jan 2017 18:08:13 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 20:09:02 -0600
Message-Id: <1484705342-13494-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v2] oeqa/selftest: Adds test case for sdk-update eSDK
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
X-List-Received-Date: Wed, 18 Jan 2017 02:09:10 -0000

1. Test case adds perl recipe before build eSDK.
2. After this added recipe, the script verifies the update:

    ${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh
    oe-publish-sdk [esdk] [path-to-http]
    CORE_IMAGE_EXTRA_INSTALL = "perl"
    bitbake -c populate-sdk-ext [some-image]
    devtool sdk-update

This should fix [YOCTO #9369]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/eSDK.py | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
index b43a452..c95ca6d 100644
--- a/meta/lib/oeqa/selftest/eSDK.py
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -51,6 +51,29 @@ class oeSDKExtSelfTest(oeSelfTest):
         toolchain_name = get_bb_var('TOOLCHAINEXT_OUTPUTNAME', pn_task)
         return os.path.join(sdk_deploy, toolchain_name + '.sh')
     
+    @staticmethod
+    def update_configuration(cls, image, tmpdir_eSDKQA, env_eSDK, ext_sdk_path):
+        sstate_dir = os.path.join(os.environ['BUILDDIR'], 'sstate-cache')
+        cls.http_service = HTTPService(sstate_dir)
+        cls.http_service.start()
+        cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
+
+        oeSDKExtSelfTest.generate_eSDK(cls.image)
+
+        cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
+        runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
+
+        cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
+       
+        sstate_config="""
+SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
+SSTATE_MIRRORS =  "file://.* http://%s/PATH"
+CORE_IMAGE_EXTRA_INSTALL = "perl"
+        """ % cls.http_url
+
+        with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
+            f.write(sstate_config)
+    
 
     @classmethod
     def setUpClass(cls):
@@ -59,16 +82,16 @@ class oeSDKExtSelfTest(oeSelfTest):
         cls.http_service = HTTPService(sstate_dir)
         cls.http_service.start()
 
-        http_url = "127.0.0.1:%d" % cls.http_service.port
+        cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
  
-        image = 'core-image-minimal'
+        cls.image = 'core-image-minimal'
 
         cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
-        oeSDKExtSelfTest.generate_eSDK(image)
+        oeSDKExtSelfTest.generate_eSDK(cls.image)
 
         # Install eSDK
-        ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(image)
-        runCmd("%s -y -d \"%s\"" % (ext_sdk_path, cls.tmpdir_eSDKQA))
+        cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
+        runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
 
         cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
 
@@ -76,7 +99,7 @@ class oeSDKExtSelfTest(oeSelfTest):
         sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* http://%s/PATH"
-        """ % http_url
+        """ % cls.http_url
         with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
             f.write(sstate_config)
 
@@ -99,5 +122,12 @@ SSTATE_MIRRORS =  "file://.* http://%s/PATH"
         cmd = "devtool build-image %s" % image
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
 
+    @testcase(1567)
+    def test_sdk_update_http(self):
+        cmd = "devtool sdk-update %s" % self.http_url
+        oeSDKExtSelfTest.update_configuration(self, self.image, self.tmpdir_eSDKQA, self.env_eSDK, self.ext_sdk_path)
+        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
+        self.http_service.stop()
+
 if __name__ == '__main__':
     unittest.main()
-- 
2.5.0


