Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE53179516
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 09:37:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2018 02:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,331,1534834800"; d="scan'208";a="85037211"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2018 02:37:27 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:22:06 +0800
Message-Id: <1538472127-27142-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538472127-27142-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1538472127-27142-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 3/4] testimage.bbclass: write testresult to json files
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
X-List-Received-Date: Tue, 02 Oct 2018 09:37:36 -0000

As part of the solution to replace Testopia to store testresult,
OEQA testimage need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

By default, testimage will write json testresult, to disable
this, specify OEQA_SKIP_OUTPUT_JSON="1" as configuration.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testimage.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 39de191..0adaf60 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -306,6 +306,18 @@ def testimage_main(d):
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
     results.logDetails()
     results.logSummary(pn)
+    if (d.getVar('OEQA_SKIP_OUTPUT_JSON')) == '1':
+        bb.debug(2, 'Skip the OEQA output json testresult as OEQA_SKIP_OUTPUT_JSON=1')
+    else:
+        workdir = d.getVar("WORKDIR")
+        image_basename = d.getVar("IMAGE_BASENAME")
+        json_result_dir = os.path.join(workdir,
+                                       'temp',
+                                       'json_testresults-%s' % os.getpid(),
+                                       'runtime',
+                                       machine,
+                                       image_basename)
+        results.logDetailsInJson(json_result_dir)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
 
-- 
2.7.4


