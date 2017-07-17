Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 060B977BE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467547"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:17 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:17 -0500
Message-Id: <67b5701f60a4969b04c9cf4f64b325116da454d2.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 09/30] oeqa/core/threaded: logSummary add skipped tests info
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
index a7dc0aed401..022c9ac59a2 100644
--- a/meta/lib/oeqa/core/threaded.py
+++ b/meta/lib/oeqa/core/threaded.py
@@ -234,6 +234,14 @@ class OETestResultThreaded(object):
                     self._results[tid]['result'].wasSuccessful()
         return wasSuccessful
 
+    def getSkippedTests(self):
+        skipped = 0
+
+        for tid in self._results.keys():
+            skipped = skipped + len(self.tc._results[tid]['skipped'])
+
+        return skipped
+
     def stop(self):
         for tid in self._results.keys():
             self._results[tid]['result'].stop()
@@ -248,6 +256,9 @@ class OETestResultThreaded(object):
             msg = "%s - OK - All required tests passed" % component
         else:
             msg = "%s - FAIL - Required tests failed" % component
+        skipped = self.getSkippedTests()
+        if skipped:
+            msg += " (skipped=%d)" % skipped
         self.tc.logger.info(msg)
 
     def logDetails(self):
-- 
2.11.0


