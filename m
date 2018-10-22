Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 248EC79C08
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:09:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 00:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,411,1534834800"; d="scan'208";a="243249390"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 22 Oct 2018 00:09:42 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 14:54:24 +0800
Message-Id: <1540191264-12332-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 4/4] testsdk.bbclass: write testresult to json files
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
X-List-Received-Date: Mon, 22 Oct 2018 07:09:42 -0000

As part of the solution to replace Testopia to store testresult,
OEQA sdk and sdkext need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

To configure multiple instances of bitbake to write json testresult
to a single testresult file, user will define the variable
"OEQA_JSON_RESULT_COMMON_DIR" with the common directory for writing
json testresult.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testsdk.bbclass | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index d3f475d..c4a0f37 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -2,6 +2,7 @@
 #
 # Released under the MIT license (see COPYING.MIT)
 
+inherit metadata_scm
 # testsdk.bbclass enables testing for SDK and Extensible SDK
 #
 # To run SDK tests, run the commands:
@@ -14,6 +15,33 @@
 #
 # where "<image-name>" is an image like core-image-sato.
 
+def _get_configuration(d, test_type, pid):
+    import platform
+    bb_core_dir = d.getVar("BBFILE_PATTERN_core=")
+    return {'TEST_TYPE': test_type,
+            'BRANCH': base_get_metadata_git_branch(bb_core_dir, None).strip(),
+            'COMMIT': base_get_metadata_git_revision(bb_core_dir, None),
+            'PROCESS_ID': pid,
+            'SDK_MACHINE': d.getVar("SDKMACHINE"),
+            'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
+            'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
+            'HOST_DISTRO': platform.linux_distribution()}
+
+def _get_json_result_dir(d, configuration):
+    json_result_dir = os.path.join(d.getVar("WORKDIR"),
+                                   'temp',
+                                   'json_testresults-%s' % configuration['PROCESS_ID'],
+                                   configuration['TEST_TYPE'],
+                                   configuration['SDK_MACHINE'],
+                                   configuration['IMAGE_BASENAME'])
+    oeqa_json_result_common_dir = d.getVar("OEQA_JSON_RESULT_COMMON_DIR")
+    if oeqa_json_result_common_dir:
+        json_result_dir = oeqa_json_result_common_dir
+    return json_result_dir
+
+def _get_result_id(configuration):
+    return '%s-%s-%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['SDK_MACHINE'])
+
 def testsdk_main(d):
     import os
     import subprocess
@@ -80,8 +108,10 @@ def testsdk_main(d):
 
         component = "%s %s" % (pn, OESDKTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-
-        result.logDetails()
+        configuration = _get_configuration(d, 'sdk', os.getpid())
+        result.logDetails(_get_json_result_dir(d, configuration),
+                           configuration,
+                           _get_result_id(configuration))
         result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
@@ -184,8 +214,10 @@ def testsdkext_main(d):
 
         component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-
-        result.logDetails()
+        configuration = _get_configuration(d, 'sdkext', os.getpid())
+        result.logDetails(_get_json_result_dir(d, configuration),
+                           configuration,
+                           _get_result_id(configuration))
         result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
-- 
2.7.4


