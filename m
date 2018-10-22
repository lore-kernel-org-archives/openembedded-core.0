Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CF3A679C1C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:09:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 00:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,411,1534834800"; d="scan'208";a="243249385"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 22 Oct 2018 00:09:40 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 14:54:23 +0800
Message-Id: <1540191264-12332-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Mon, 22 Oct 2018 07:09:39 -0000

As part of the solution to replace Testopia to store testresult,
OEQA testimage need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

To configure multiple instances of bitbake to write json testresult
to a single testresult file, user will define the variable
"OEQA_JSON_RESULT_COMMON_DIR" with the common directory for writing
json testresult.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testimage.bbclass | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2642a72..112ba71 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -2,7 +2,7 @@
 #
 # Released under the MIT license (see COPYING.MIT)
 
-
+inherit metadata_scm
 # testimage.bbclass enables testing of qemu images using python unittests.
 # Most of the tests are commands run on target image over ssh.
 # To use it add testimage to global inherit and call your target image with -c testimage
@@ -141,6 +141,33 @@ def testimage_sanity(d):
         bb.fatal('When TEST_TARGET is set to "simpleremote" '
                  'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
 
+def _get_configuration(d, test_type, pid, machine):
+    import platform
+    bb_core_dir = d.getVar("BBFILE_PATTERN_core=")
+    return {'TEST_TYPE': test_type,
+            'BRANCH': base_get_metadata_git_branch(bb_core_dir, None).strip(),
+            'COMMIT': base_get_metadata_git_revision(bb_core_dir, None),
+            'PROCESS_ID': pid,
+            'MACHINE': machine,
+            'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
+            'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
+            'HOST_DISTRO': platform.linux_distribution()}
+
+def _get_json_result_dir(d, configuration):
+    json_result_dir = os.path.join(d.getVar("WORKDIR"),
+                                   'temp',
+                                   'json_testresults-%s' % configuration['PROCESS_ID'],
+                                   configuration['TEST_TYPE'],
+                                   configuration['MACHINE'],
+                                   configuration['IMAGE_BASENAME'])
+    oeqa_json_result_common_dir = d.getVar("OEQA_JSON_RESULT_COMMON_DIR")
+    if oeqa_json_result_common_dir:
+        json_result_dir = oeqa_json_result_common_dir
+    return json_result_dir
+
+def _get_result_id(configuration):
+    return '%s-%s-%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['MACHINE'])
+
 def testimage_main(d):
     import os
     import json
@@ -308,7 +335,10 @@ def testimage_main(d):
     # Show results (if we have them)
     if not results:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
-    results.logDetails()
+    configuration = _get_configuration(d, 'runtime', os.getpid(), machine)
+    results.logDetails(_get_json_result_dir(d, configuration),
+                       configuration,
+                       _get_result_id(configuration))
     results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
-- 
2.7.4


