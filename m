Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2263D79C11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 09:26:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2018 02:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,396,1534834800"; d="scan'208";a="101236470"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2018 02:26:30 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 17:11:09 +0800
Message-Id: <1539853869-53465-5-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539853869-53465-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1539853869-53465-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 5/5] testsdk.bbclass: write testresult to json files
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
X-List-Received-Date: Thu, 18 Oct 2018 09:26:30 -0000

As part of the solution to replace Testopia to store testresult,
OEQA sdk and sdkext need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testsdk.bbclass | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index d3f475d..ef4d160 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -80,8 +80,13 @@ def testsdk_main(d):
 
         component = "%s %s" % (pn, OESDKTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-
-        result.logDetails()
+        image = d.getVar("IMAGE_BASENAME")
+        json_result_dir = os.path.join(d.getVar("WORKDIR"),
+                                       'temp',
+                                       'json_testresults-%s' % os.getpid(),
+                                       'sdk',
+                                       image)
+        result.logDetails(json_result_dir, {'TEST_TYPE': 'sdk', 'IMAGE_BASENAME': image})
         result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
@@ -184,8 +189,13 @@ def testsdkext_main(d):
 
         component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-
-        result.logDetails()
+        image = d.getVar("IMAGE_BASENAME")
+        json_result_dir = os.path.join(d.getVar("WORKDIR"),
+                                       'temp',
+                                       'json_testresults-%s' % os.getpid(),
+                                       'sdkext',
+                                       image)
+        result.logDetails(json_result_dir, {'TEST_TYPE': 'sdkext', 'IMAGE_BASENAME': image})
         result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
-- 
2.7.4


