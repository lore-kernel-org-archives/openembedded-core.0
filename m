Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9B71781DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:36:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133762"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:00 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:54 -0500
Message-Id: <6b1ddfc064208240aab40a57d16a8d0759cd0584.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 08/29] oeqa/core/threaded: logSummary add skipped tests info
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:00 -0000
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


