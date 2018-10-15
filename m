Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C0CB479ABC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:40:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 00:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,383,1534834800"; d="scan'208";a="100295797"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 15 Oct 2018 00:40:14 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 15:24:53 +0800
Message-Id: <1539588294-5532-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 4/5] testimage.bbclass: write testresult to json files
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
X-List-Received-Date: Mon, 15 Oct 2018 07:40:14 -0000

As part of the solution to replace Testopia to store testresult,
OEQA testimage need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testimage.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2642a72..8c88340 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -308,7 +308,13 @@ def testimage_main(d):
     # Show results (if we have them)
     if not results:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
-    results.logDetails()
+    json_result_dir = os.path.join(d.getVar("WORKDIR"),
+                                   'temp',
+                                   'json_testresults-%s' % os.getpid(),
+                                   'runtime',
+                                   machine,
+                                   d.getVar("IMAGE_BASENAME"))
+    results.logDetails(json_result_dir)
     results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
-- 
2.7.4


