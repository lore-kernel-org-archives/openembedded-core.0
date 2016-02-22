Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 03213771CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 18:29:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 Feb 2016 10:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; d="scan'208";a="657283093"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.35])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2016 10:29:20 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 12:31:33 -0600
Message-Id: <d796f5aefb56881a5d27585ff83474d4656c5581.1456165797.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1456165797.git.anibal.limon@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1456165797.git.anibal.limon@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCHv2 4/4] oeqa/sdkext: Add sdk_update.SDKUpdateTest class.
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
X-List-Received-Date: Mon, 22 Feb 2016 18:29:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

The SDKUpdateTest class test devtool sdk-update mechanism inside
eSDK.

The SDKUpdateTest class search for new sdk if not found uses
the main one then it publish the eSDK into known folder
inside work and it starts a web server for serve the eSDK.

Finally it executes sdk-update over http, the local test is
commented due to bug [1].

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=9043

[YOCTO #9089]

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/lib/oeqa/sdkext/sdk_update.py | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/lib/oeqa/sdkext/sdk_update.py

diff --git a/meta/lib/oeqa/sdkext/sdk_update.py b/meta/lib/oeqa/sdkext/sdk_update.py
new file mode 100644
index 0000000..16f5b10
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/sdk_update.py
@@ -0,0 +1,39 @@
+import os
+import shutil
+import subprocess
+
+from oeqa.oetest import oeSDKExtTest
+from oeqa.utils.httpserver import HTTPService
+
+class SdkUpdateTest(oeSDKExtTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.publish_dir = os.path.join(self.tc.sdktestdir, 'esdk_publish')
+        if os.path.exists(self.publish_dir):
+            shutil.rmtree(self.publish_dir)
+        os.mkdir(self.publish_dir)
+
+        tcname_new = self.tc.d.expand(
+            "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}-new.sh")
+        if not os.path.exists(tcname_new):
+            tcname_new = self.tc.tcname
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
+#    def test_sdk_update_local(self):
+#        output = self._run("devtool sdk-update \"%s\"" % self.publish_dir)
+
+    @classmethod
+    def tearDownClass(self):
+        self.http_service.stop()
+        shutil.rmtree(self.publish_dir)
-- 
2.1.4


