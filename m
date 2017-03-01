Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2A971B04
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2pS9011995; Wed, 1 Mar 2017 16:02:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5fPpNJOBakw7; Wed,  1 Mar 2017 16:02:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kHV011980
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004oG-Px; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:39 +0000
Message-Id: <1488384162-18397-9-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/12] oeqa/esdk/devtool: clean setUpClass/tearDownClass
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
X-List-Received-Date: Wed, 01 Mar 2017 16:03:00 -0000

From: Ross Burton <ross.burton@intel.com>

These methods are class not instance methods, so the argument should be cls not
self.

Also don't put variables into cls that we don't need there.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index baa528f..ffaa2f0 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -11,14 +11,19 @@ from oeqa.core.decorator.data import skipIfNotDataVar
 
 class DevtoolTest(OESDKExtTestCase):
     @classmethod
-    def setUpClass(self):
-        self.myapp_src = os.path.join(self.tc.esdk_files_dir, "myapp")
-        self.myapp_dst = os.path.join(self.tc.sdk_dir, "myapp")
-        shutil.copytree(self.myapp_src, self.myapp_dst)
+    def setUpClass(cls):
+        myapp_src = os.path.join(cls.tc.esdk_files_dir, "myapp")
+        cls.myapp_dst = os.path.join(cls.tc.sdk_dir, "myapp")
+        shutil.copytree(myapp_src, cls.myapp_dst)
 
-        self.myapp_cmake_src = os.path.join(self.tc.esdk_files_dir, "myapp_cmake")
-        self.myapp_cmake_dst = os.path.join(self.tc.sdk_dir, "myapp_cmake")
-        shutil.copytree(self.myapp_cmake_src, self.myapp_cmake_dst)
+        myapp_cmake_src = os.path.join(cls.tc.esdk_files_dir, "myapp_cmake")
+        cls.myapp_cmake_dst = os.path.join(cls.tc.sdk_dir, "myapp_cmake")
+        shutil.copytree(myapp_cmake_src, cls.myapp_cmake_dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        shutil.rmtree(cls.myapp_dst)
+        shutil.rmtree(cls.myapp_cmake_dst)
 
     def _test_devtool_build(self, directory):
         self._run('devtool add myapp %s' % directory)
@@ -111,8 +116,3 @@ class DevtoolTest(OESDKExtTestCase):
             self._run('devtool reset %s' % package_nodejs)
             raise e
         self._run('devtool reset %s '% package_nodejs)
-
-    @classmethod
-    def tearDownClass(self):
-        shutil.rmtree(self.myapp_dst)
-        shutil.rmtree(self.myapp_cmake_dst)
-- 
2.7.4


