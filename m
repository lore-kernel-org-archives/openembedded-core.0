Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE9E960102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 11:50:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 26 Jan 2017 03:50:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="57459843"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 26 Jan 2017 03:50:51 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8A0136A4006;
	Thu, 26 Jan 2017 03:49:53 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 13:28:17 +0200
Message-Id: <1485430097-10362-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] selftest: wic: split test_debug test case
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
X-List-Received-Date: Thu, 26 Jan 2017 11:50:59 -0000

Splitted to test_debug_short and test_debug_long to make each
of the test cases to run wic once. This is consistent with the
rest of the test cases and ensures that test cases are set up
properly.

This also fixes the following test failure caused by the image
left from the first wic run:

FAIL: test_debug (oeqa.selftest.wic.Wic)
Test debug
----------------------------------------------------------------------
Traceback (most recent call last):
  File "meta/lib/oeqa/utils/decorators.py", line 109, in wrapped_f
    return func(*args, **kwargs)
  File "meta/lib/oeqa/selftest/wic.py", line 270, in test_debug
    self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
AssertionError: 1 != 2

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 8864af6..9784a68 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -258,12 +258,15 @@ class Wic(oeSelfTest):
                                    ignore_status=True).status)
 
     @testcase(1558)
-    def test_debug(self):
-        """Test debug"""
+    def test_debug_short(self):
+        """Test -D option"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
                                    "-D -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
+    def test_debug_long(self):
+        """Test --debug option"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
                                    "--debug -o %s" % self.resultdir).status)
-- 
2.1.4


