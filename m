Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 54ABA605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 21:14:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 13:14:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,196,1484035200"; d="scan'208";a="827359734"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2017 13:14:44 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 13:12:55 +0000
Message-Id: <45b78fc683ff4d5cad5d6bc30df7014a49692a0f.1487769155.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1487769155.git.mariano.lopez@linux.intel.com>
References: <cover.1487769155.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] selftest/eSDK.py: Cleanup when there is an error in setUpClass
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
X-List-Received-Date: Wed, 22 Feb 2017 21:14:44 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Lately autobuilders are experiencing hangs with selftest,
it seems it is cause if an error happens in setUpClass
method of oeSDKExtSelfTest class because HTTP server
keeps running in background.

This patch will ensure tearDownClass will be run if there
is an error in setUpClass.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/eSDK.py | 46 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
index ee1ca6a..b68e997 100644
--- a/meta/lib/oeqa/selftest/eSDK.py
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -64,7 +64,7 @@ class oeSDKExtSelfTest(oeSelfTest):
         runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
 
         cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
-       
+
         sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* http://%s/PATH"
@@ -73,37 +73,41 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
 
         with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
             f.write(sstate_config)
-    
 
     @classmethod
     def setUpClass(cls):
-        # Start to serve sstate dir
-        sstate_dir = get_bb_var('SSTATE_DIR')
-        cls.http_service = HTTPService(sstate_dir)
-        cls.http_service.start()
+        # If there is an exception in setUpClass it will not run tearDownClass
+        # method and it leaves HTTP server running forever, so we need to be
+        # sure tearDownClass is run.
+        try:
+            cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
 
-        cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
- 
-        cls.image = 'core-image-minimal'
+            # Start to serve sstate dir
+            sstate_dir = get_bb_var('SSTATE_DIR')
+            cls.http_service = HTTPService(sstate_dir)
+            cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
+            cls.http_service.start()
 
-        cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
-        oeSDKExtSelfTest.generate_eSDK(cls.image)
+            cls.image = 'core-image-minimal'
+            oeSDKExtSelfTest.generate_eSDK(cls.image)
 
-        # Install eSDK
-        cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
-        runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
+            # Install eSDK
+            cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
+            runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
 
-        cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
+            cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
 
-        # Configure eSDK to use sstate mirror from poky
-        sstate_config="""
+            # Configure eSDK to use sstate mirror from poky
+            sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* http://%s/PATH"
-        """ % cls.http_url
-        with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
-            f.write(sstate_config)
+            """ % cls.http_url
+            with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
+                f.write(sstate_config)
+        except:
+            cls.tearDownClass()
+            raise
 
-      
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_eSDKQA)
-- 
2.6.6


