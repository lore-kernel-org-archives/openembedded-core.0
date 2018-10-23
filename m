Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id F369474C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 06:12:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 23:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,415,1534834800"; d="scan'208";a="97699700"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2018 23:12:38 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 13:57:21 +0800
Message-Id: <1540274242-78226-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540274242-78226-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1540274242-78226-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Tue, 23 Oct 2018 06:12:38 -0000

As part of the solution to replace Testopia to store testresult,
OEQA testimage need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

By default, json testresult file will be written to "oeqa"
directory under the "WORKDIR" directory.

To configure multiple instances of bitbake to write json testresult
to a single testresult file at custom directory, user will define
the variable "OEQA_JSON_RESULT_DIR" with the custom directory for
json testresult.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testimage.bbclass | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2642a72..109eecc 100644
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
@@ -141,6 +141,30 @@ def testimage_sanity(d):
         bb.fatal('When TEST_TARGET is set to "simpleremote" '
                  'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
 
+def _get_testimage_configuration(d, test_type, pid, machine):
+    import platform
+    configuration = {'TEST_TYPE': test_type,
+                    'PROCESS_ID': pid,
+                    'MACHINE': machine,
+                    'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
+                    'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
+                    'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-')}
+    layers = (d.getVar("BBLAYERS") or "").split()
+    for l in layers:
+        configuration['%s_BRANCH_REV' % os.path.basename(l)] = '%s:%s' % (base_get_metadata_git_branch(l, None).strip(),
+                                                                          base_get_metadata_git_revision(l, None))
+    return configuration
+
+def _get_testimage_json_result_dir(d):
+    json_result_dir = os.path.join(d.getVar("WORKDIR"), 'oeqa')
+    custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
+    if custom_json_result_dir:
+        json_result_dir = custom_json_result_dir
+    return json_result_dir
+
+def _get_testimage_result_id(configuration):
+    return '%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['MACHINE'])
+
 def testimage_main(d):
     import os
     import json
@@ -308,7 +332,10 @@ def testimage_main(d):
     # Show results (if we have them)
     if not results:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
-    results.logDetails()
+    configuration = _get_testimage_configuration(d, 'runtime', os.getpid(), machine)
+    results.logDetails(_get_testimage_json_result_dir(d),
+                       configuration,
+                       _get_testimage_result_id(configuration))
     results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
-- 
2.7.4


