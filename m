Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 468EA71B04
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2poB011997; Wed, 1 Mar 2017 16:02:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wy3NQq6wg3aX; Wed,  1 Mar 2017 16:02:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2k5q011979
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004oA-PJ; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:38 +0000
Message-Id: <1488384162-18397-8-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/12] oeqa/selftest: Drop http sstate sharing
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
X-List-Received-Date: Wed, 01 Mar 2017 16:02:55 -0000

Using httpServer from python for sharing sstate is known to be buggy, it can't
cope with the number/type of requests coming from bitbake and quietly fails
to share files.

This causes intermittent build failures which are hard to debug. We can
use a file:// url for the sstate mirror instead, removing the need for
the http server.

The sdk-update test is simply dropped since the SDK is never published
to this location and hence it would never have any update. Its equiavalent
to pointing at an empty web server. There is a better eSDK update test in
testsdk so rather than improve this one, lets drop it and concentrate on
the one there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/eSDK.py | 55 ++++++++++++------------------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
index a66ff92..1596c6e 100644
--- a/meta/lib/oeqa/selftest/eSDK.py
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -9,7 +9,6 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.decorators import testcase
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
-from oeqa.utils.httpserver import HTTPService
 
 class oeSDKExtSelfTest(oeSelfTest):
     """
@@ -55,9 +54,6 @@ class oeSDKExtSelfTest(oeSelfTest):
     @staticmethod
     def update_configuration(cls, image, tmpdir_eSDKQA, env_eSDK, ext_sdk_path):
         sstate_dir = os.path.join(os.environ['BUILDDIR'], 'sstate-cache')
-        cls.http_service = HTTPService(sstate_dir)
-        cls.http_service.start()
-        cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
 
         oeSDKExtSelfTest.generate_eSDK(cls.image)
 
@@ -68,51 +64,39 @@ class oeSDKExtSelfTest(oeSelfTest):
 
         sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
-SSTATE_MIRRORS =  "file://.* http://%s/PATH"
+SSTATE_MIRRORS =  "file://.* file://%s/PATH"
 CORE_IMAGE_EXTRA_INSTALL = "perl"
-        """ % cls.http_url
+        """ % sstate_dir
 
         with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
             f.write(sstate_config)
 
     @classmethod
     def setUpClass(cls):
-        # If there is an exception in setUpClass it will not run tearDownClass
-        # method and it leaves HTTP server running forever, so we need to be
-        # sure tearDownClass is run.
-        try:
-            cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
+        cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
 
-            # Start to serve sstate dir
-            sstate_dir = get_bb_var('SSTATE_DIR')
-            cls.http_service = HTTPService(sstate_dir)
-            cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
-            cls.http_service.start()
+        sstate_dir = get_bb_var('SSTATE_DIR')
 
-            cls.image = 'core-image-minimal'
-            oeSDKExtSelfTest.generate_eSDK(cls.image)
+        cls.image = 'core-image-minimal'
+        oeSDKExtSelfTest.generate_eSDK(cls.image)
 
-            # Install eSDK
-            cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
-            runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
+        # Install eSDK
+        cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
+        runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
 
-            cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
+        cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
 
-            # Configure eSDK to use sstate mirror from poky
-            sstate_config="""
+        # Configure eSDK to use sstate mirror from poky
+        sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
-SSTATE_MIRRORS =  "file://.* http://%s/PATH"
-            """ % cls.http_url
-            with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
-                f.write(sstate_config)
-        except:
-            cls.tearDownClass()
-            raise
+SSTATE_MIRRORS =  "file://.* file://%s/PATH"
+            """ % sstate_dir
+        with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
+            f.write(sstate_config)
 
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_eSDKQA)
-        cls.http_service.stop()
 
     @testcase (1602)
     def test_install_libraries_headers(self):
@@ -127,12 +111,5 @@ SSTATE_MIRRORS =  "file://.* http://%s/PATH"
         cmd = "devtool build-image %s" % image
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
 
-    @testcase(1567)
-    def test_sdk_update_http(self):
-        cmd = "devtool sdk-update %s" % self.http_url
-        oeSDKExtSelfTest.update_configuration(self, self.image, self.tmpdir_eSDKQA, self.env_eSDK, self.ext_sdk_path)
-        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
-        self.http_service.stop()
-
 if __name__ == '__main__':
     unittest.main()
-- 
2.7.4


