Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 086467D2F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 07:12:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2019 00:12:41 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga003.jf.intel.com with ESMTP; 17 May 2019 00:12:40 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 15:12:36 +0800
Message-Id: <1558077157-74260-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] oeqa/runtime/cases/graphic: Enable graphic opengl testing
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
X-List-Received-Date: Fri, 17 May 2019 07:12:40 -0000

Convert manual testcase bsps-hw.bsps-hw.bsps-hw.Graphics_-_ABAT
from oeqa/manual/bsp-hw.json to runtime automated test.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/graphic.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/graphic.py

diff --git a/meta/lib/oeqa/runtime/cases/graphic.py b/meta/lib/oeqa/runtime/cases/graphic.py
new file mode 100644
index 0000000..7d484c4
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/graphic.py
@@ -0,0 +1,25 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.decorator.data import skipIfNotFeature
+import threading
+import time
+
+class GraphicTestThread(threading.Thread):
+   def __init__(self, target_function, target_args=()):
+      threading.Thread.__init__(self, target=target_function, args=target_args)
+
+class GraphicTest(OERuntimeTestCase):
+    def run_graphic_test(self, run_args):
+        self.target.run(run_args)
+
+    @skipIfNotFeature('x11-base', 'Test requires x11 to be in IMAGE_FEATURES')
+    @OEHasPackage(['mesa-demos'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_graphic_opengl_with_glxgears(self):
+        gt_thread = GraphicTestThread(self.run_graphic_test, target_args=('export DISPLAY=:0; glxgears',))
+        gt_thread.start()
+        time.sleep(2)
+        status, output = self.target.run('pidof glxgears')
+        self.target.run('kill %s' % output)
+        self.assertEqual(status, 0, msg='Not able to find process that run glxgears.')
-- 
2.7.4


