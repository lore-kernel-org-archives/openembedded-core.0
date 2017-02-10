Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 633DF77399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 22:20:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 14:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="57405774"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 14:20:29 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 14:15:56 +0000
Message-Id: <aaa8a2da203b69955f9a9bc455893a4c2c6d85bf.1486735704.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1486735704.git.mariano.lopez@linux.intel.com>
References: <cover.1486735704.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1486735704.git.mariano.lopez@linux.intel.com>
References: <cover.1486735704.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] oeqa/core/loader.py: Give meaningful error when failed to load classes
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
X-List-Received-Date: Fri, 10 Feb 2017 22:20:30 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

With this we get the class that is actually having the problem,
not just a TypeError with an unknown class causing the error.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index c73ef9a..bf13a5a 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -171,10 +171,11 @@ class OETestLoader(unittest.TestLoader):
         """
         if issubclass(testCaseClass, unittest.suite.TestSuite):
             raise TypeError("Test cases should not be derived from TestSuite." \
-                                " Maybe you meant to derive from TestCase?")
+                                " Maybe you meant to derive %s from TestCase?" \
+                                % testCaseClass.__name__)
         if not issubclass(testCaseClass, self.caseClass):
-            raise TypeError("Test cases need to be derived from %s" % \
-                    caseClass.__name__)
+            raise TypeError("Test %s is not derived from %s" % \
+                    (testCaseClass.__name__, self.caseClass.__name__))
 
 
         testCaseNames = self.getTestCaseNames(testCaseClass)
-- 
2.6.6


