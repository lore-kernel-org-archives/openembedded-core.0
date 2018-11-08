Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D40D87547F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 09:57:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2018 01:57:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,478,1534834800"; d="scan'208";a="104464223"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga004.fm.intel.com with ESMTP; 08 Nov 2018 01:56:59 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 17:41:54 +0800
Message-Id: <1541670114-31523-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] oeqa/runtime: Add tests for gstreamer CLI
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
X-List-Received-Date: Thu, 08 Nov 2018 09:57:01 -0000

We should not be finding GStreamer issues right around
release time but that's what we seem to do.

Port gstreamer tests from Intel Ref Kit.
https://github.com/intel/intel-iot-refkit/blob/master/meta-iotqa/
lib/oeqa/runtime/multimedia/gstreamer/gstreamer_cli.py

Add tests for gstreamer commandline tools (gst-inspect-1.0
& gst-launch-1.0).

[YOCTO #11418]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/gstreamer.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/gstreamer.py

diff --git a/meta/lib/oeqa/runtime/cases/gstreamer.py b/meta/lib/oeqa/runtime/cases/gstreamer.py
new file mode 100644
index 0000000..7e2cda2
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/gstreamer.py
@@ -0,0 +1,14 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class GstreamerCliTest(OERuntimeTestCase):
+
+    @OEHasPackage(['gstreamer1.0'])
+    def test_gst_inspect_can_list_all_plugins(self):
+        status, output = self.target.run('gst-inspect-1.0')
+        self.assertEqual(status, 0, 'gst-inspect-1.0 does not appear to be running.')
+
+    @OEHasPackage(['gstreamer1.0'])
+    def test_gst_launch_can_create_video_pipeline(self):
+        status, output = self.target.run('gst-launch-1.0 -v fakesrc silent=false num-buffers=3 ! fakesink silent=false')
+        self.assertEqual(status, 0, 'gst-launch-1.0 does not appear to be running.')
-- 
2.7.4


