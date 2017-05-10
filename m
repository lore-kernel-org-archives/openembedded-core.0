Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 19E2071DAE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:48:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735218"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:48:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:16 -0500
Message-Id: <323a90b080fad3fe23ae93ff6a0ce35ff40cd141.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 16/17] oeqa/sdkext/cases: Move sdk_update test into devtool module
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
X-List-Received-Date: Wed, 10 May 2017 19:48:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the new OEQA thread support there are problems running
devtool twice at the same time because only one instance of
bitbake/devtool is allowed.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py    | 32 ++++++++++++++++++++++++++
 meta/lib/oeqa/sdkext/cases/sdk_update.py | 39 --------------------------------
 2 files changed, 32 insertions(+), 39 deletions(-)
 delete mode 100644 meta/lib/oeqa/sdkext/cases/sdk_update.py

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index a01bc0b..ea90517 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -1,12 +1,14 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
+import os
 import shutil
 import subprocess
 
 from oeqa.sdkext.case import OESDKExtTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.utils.httpserver import HTTPService
 
 class DevtoolTest(OESDKExtTestCase):
     @classmethod
@@ -95,3 +97,33 @@ class DevtoolTest(OESDKExtTestCase):
             self._run('devtool build %s ' % package_nodejs)
         finally:
             self._run('devtool reset %s '% package_nodejs)
+
+class SdkUpdateTest(OESDKExtTestCase):
+    @classmethod
+    def setUpClass(self):
+        self.publish_dir = os.path.join(self.tc.sdk_dir, 'esdk_publish')
+        if os.path.exists(self.publish_dir):
+            shutil.rmtree(self.publish_dir)
+        os.mkdir(self.publish_dir)
+
+        base_tcname = "%s/%s" % (self.td.get("SDK_DEPLOY", ''),
+            self.td.get("TOOLCHAINEXT_OUTPUTNAME", ''))
+        tcname_new = "%s-new.sh" % base_tcname
+        if not os.path.exists(tcname_new):
+            tcname_new = "%s.sh" % base_tcname
+
+        cmd = 'oe-publish-sdk %s %s' % (tcname_new, self.publish_dir)
+        subprocess.check_output(cmd, shell=True)
+
+        self.http_service = HTTPService(self.publish_dir)
+        self.http_service.start()
+
+        self.http_url = "http://127.0.0.1:%d" % self.http_service.port
+
+    def test_sdk_update_http(self):
+        output = self._run("devtool sdk-update \"%s\"" % self.http_url)
+
+    @classmethod
+    def tearDownClass(self):
+        self.http_service.stop()
+        shutil.rmtree(self.publish_dir)
diff --git a/meta/lib/oeqa/sdkext/cases/sdk_update.py b/meta/lib/oeqa/sdkext/cases/sdk_update.py
deleted file mode 100644
index 2f8598b..0000000
--- a/meta/lib/oeqa/sdkext/cases/sdk_update.py
+++ /dev/null
@@ -1,39 +0,0 @@
-# Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-import os
-import shutil
-import subprocess
-
-from oeqa.sdkext.case import OESDKExtTestCase
-from oeqa.utils.httpserver import HTTPService
-
-class SdkUpdateTest(OESDKExtTestCase):
-    @classmethod
-    def setUpClass(self):
-        self.publish_dir = os.path.join(self.tc.sdk_dir, 'esdk_publish')
-        if os.path.exists(self.publish_dir):
-            shutil.rmtree(self.publish_dir)
-        os.mkdir(self.publish_dir)
-
-        base_tcname = "%s/%s" % (self.td.get("SDK_DEPLOY", ''),
-            self.td.get("TOOLCHAINEXT_OUTPUTNAME", ''))
-        tcname_new = "%s-new.sh" % base_tcname
-        if not os.path.exists(tcname_new):
-            tcname_new = "%s.sh" % base_tcname
-
-        cmd = 'oe-publish-sdk %s %s' % (tcname_new, self.publish_dir)
-        subprocess.check_output(cmd, shell=True)
-
-        self.http_service = HTTPService(self.publish_dir)
-        self.http_service.start()
-
-        self.http_url = "http://127.0.0.1:%d" % self.http_service.port
-
-    def test_sdk_update_http(self):
-        output = self._run("devtool sdk-update \"%s\"" % self.http_url)
-
-    @classmethod
-    def tearDownClass(self):
-        self.http_service.stop()
-        shutil.rmtree(self.publish_dir)
-- 
2.1.4


