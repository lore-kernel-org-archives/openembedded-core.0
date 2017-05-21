Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E43D177F76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 01:32:00 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 18:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="105237508"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga006.fm.intel.com with ESMTP; 21 May 2017 18:32:00 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 11:22:23 -0700
Message-Id: <1495390943-47688-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495390943-47688-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1495390943-47688-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2] selftest/oeselftest: add QA test for assertExists and assertNotExists
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
X-List-Received-Date: Mon, 22 May 2017 01:32:01 -0000

Add QA tests for assertExists and assertNotExists inside osSelfTest class.
Add positive and negative testing for each assert function.

[YOCTO #11356]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/oeselftest.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/oeselftest.py

diff --git a/meta/lib/oeqa/selftest/oeselftest.py b/meta/lib/oeqa/selftest/oeselftest.py
new file mode 100644
index 0000000..b26f85c
--- /dev/null
+++ b/meta/lib/oeqa/selftest/oeselftest.py
@@ -0,0 +1,35 @@
+from oeqa.selftest.base import oeSelfTest
+
+class OeSelfTest(oeSelfTest):
+
+    def test_oeselftest_assertexists_does_raise_exception(self):
+        tc = oeSelfTest(methodName='assertExists')
+        cur_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'Wrong')
+
+        with self.assertRaises(AssertionError) as cm:
+            tc.assertExists(cur_path)
+
+    def test_oeselftest_assertexists_does_not_raise_exception(self):
+        tc = oeSelfTest(methodName='assertExists')
+        cur_path = os.path.dirname(os.path.realpath(__file__))
+
+        try:
+            tc.assertExists(cur_path)
+        except:
+            self.assertTrue(False, 'It raise exception where it should not')
+
+    def test_oeselftest_assertnotexists_does_raise_exception(self):
+        tc = oeSelfTest(methodName='assertExists')
+        cur_path = os.path.dirname(os.path.realpath(__file__))
+
+        with self.assertRaises(AssertionError) as cm:
+            tc.assertNotExists(cur_path)
+
+    def test_oeselftest_assertnotexists_does_not_raise_exception(self):
+        tc = oeSelfTest(methodName='assertExists')
+        cur_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'XXX')
+        
+        try:
+            tc.assertNotExists(cur_path)
+        except:
+            self.assertTrue(False, 'It raise exception where it should not')
-- 
2.7.4


