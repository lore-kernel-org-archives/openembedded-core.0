Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B2ABA72FC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:47:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 07:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,215,1484035200"; d="scan'208";a="828950359"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2017 07:46:59 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 07:45:00 +0000
Message-Id: <7a84d3223a92d576623eaffefc1af5689af97636.1488181279.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1488181279.git.mariano.lopez@linux.intel.com>
References: <cover.1488181279.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1488181279.git.mariano.lopez@linux.intel.com>
References: <cover.1488181279.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/2] oeqa/core/loader.py: Give meaningful error when failed to load classes
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
X-List-Received-Date: Mon, 27 Feb 2017 15:47:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

With this we get the class that is actually having the problem,
not just a TypeError with an unknown class causing the error.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index a380325..b9ba923 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -171,11 +171,11 @@ class OETestLoader(unittest.TestLoader):
         """
         if issubclass(testCaseClass, unittest.suite.TestSuite):
             raise TypeError("Test cases should not be derived from TestSuite." \
-                                " Maybe you meant to derive from TestCase?")
+                                " Maybe you meant to derive %s from TestCase?" \
+                                % testCaseClass.__name__)
         if not issubclass(testCaseClass, self.caseClass):
-            raise TypeError("Test cases need to be derived from %s" % \
-                    self.caseClass.__name__)
-
+            raise TypeError("Test %s is not derived from %s" % \
+                    (testCaseClass.__name__, self.caseClass.__name__))
 
         testCaseNames = self.getTestCaseNames(testCaseClass)
         if not testCaseNames and hasattr(testCaseClass, 'runTest'):
-- 
2.6.6


