Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A2E6877F74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 01:32:00 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 18:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="105237507"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga006.fm.intel.com with ESMTP; 21 May 2017 18:32:00 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 11:22:22 -0700
Message-Id: <1495390943-47688-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495390943-47688-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1495390943-47688-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/2] base.py: add assertExists and assertNotExists to oeselftest
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
X-List-Received-Date: Mon, 22 May 2017 01:32:00 -0000

Current osselftest print confusing assertion message when using
self.assertTrue(os.path.exists(filepath)) to test file path,
example of confusing assertion message:
	AssertionError: False is not true

Add the assertExists and assertNotExists to improve assertion
message and simplify coding, using selft.assertExists(filepath),
will print meaningful assertion message:
	AssertionError: <filepath> does not exist

[YOCTO #11356]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 47a8ea8..43a1951 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -18,6 +18,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.utils.decorators import LogResults
 from random import choice
 import glob
+from unittest.util import safe_repr
 
 @LogResults
 class oeSelfTest(unittest.TestCase):
@@ -214,6 +215,18 @@ be re-executed from a clean environment to ensure accurate results.")
         self.log.debug("Writing to: %s\n%s\n" % (self.machineinc_path, data))
         ftools.write_file(self.machineinc_path, data)
 
+    # check does path exist    
+    def assertExists(self, expr, msg=None):
+        if not os.path.exists(expr):
+            msg = self._formatMessage(msg, "%s does not exist" % safe_repr(expr))
+            raise self.failureException(msg)
+    
+    # check does path not exist 
+    def assertNotExists(self, expr, msg=None):
+        if os.path.exists(expr):
+            msg = self._formatMessage(msg, "%s exists when it should not" % safe_repr(expr))
+            raise self.failureException(msg)
+
 
 def get_available_machines():
     # Get a list of all available machines
-- 
2.7.4


