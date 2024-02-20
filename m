Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D8EC5478A
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 20:02:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.23172.1708459329348752513
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 12:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O0xpDdKC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7774320004;
	Tue, 20 Feb 2024 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708459327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V65Jjte45q8m7VpMT0lSUFIVcFT9uvkDPGqTNQM8EO0=;
	b=O0xpDdKC0D9RDhFwMZTRr+nIXtsD5nNe7+gaYJVlvKn2WMi767htoVMloLoijMPfdoSzF8
	Gh7/Fmv56fPm1mB5HzWJzfXNN3wqOgiSyBluxOajGAOb/IdAkfXA0sTdWxppKcz3jcP2Pv
	5iO6P0tuGIiXxVOqT7oJZOaewNXImBaxj07sdnAAl2kNMhquW5QB+Y273I+YuDKc4Fpi6R
	aWxddxQ5RvN+l5m0rEddB3+zkd1ZIOP6jEE20mYxeWDXxdL0C4lApcDrQ8pkqg0AiQryYD
	YHFPr+h6sbx2PQKR23R5iEPzIZcYZ3VaUOmJdwMNG6jScsQfFjHj+zVfvEW8eQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 1/4] testimage: create a list of failed test post actions
Date: Tue, 20 Feb 2024 21:01:56 +0100
Message-ID: <20240220200159.13419-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240220200159.13419-1-alexis.lothore@bootlin.com>
References: <20240220200159.13419-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 20:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195927

From: Alexis Lothoré <alexis.lothore@bootlin.com>

testimage is able to detect whenever a test run leads to some tests
failing, and execute some actions in this case. The only action currently
defined in such case is to retrieve artifacts from the target under test,
as listed in TESTIMAGE_FAILED_QA_ARTIFACTS

In order to be able to add multiple actions, define a central function to
gather all "post actions" to run whenever a test has failed
(run_failed_tests_post_actions). This function contains a table listing all
functions to be called whenever a test fails. Any function in this table
will be provided with bitbake internal data dictionary ("d") and the
current runtime testing context ("tc"). Isolate all this feature in a
dedicated bbclass file inherited by testimage.
This patch does not bring any functional change.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../failed-tests-post-actions.bbclass         | 64 +++++++++++++++++++
 meta/classes-recipe/testimage.bbclass         | 42 +-----------
 2 files changed, 66 insertions(+), 40 deletions(-)
 create mode 100644 meta/classes-recipe/failed-tests-post-actions.bbclass

diff --git a/meta/classes-recipe/failed-tests-post-actions.bbclass b/meta/classes-recipe/failed-tests-post-actions.bbclass
new file mode 100644
index 000000000000..7c7d3391298f
--- /dev/null
+++ b/meta/classes-recipe/failed-tests-post-actions.bbclass
@@ -0,0 +1,64 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+
+##################################################################
+# Artifacts retrieval
+##################################################################
+
+def get_artifacts_list(target, raw_list):
+    result = []
+    # Passed list may contains patterns in paths, expand them directly on target
+    for raw_path in raw_list.split():
+        cmd = f"for p in {raw_path}; do if [ -e $p ]; then echo $p; fi; done"
+        try:
+            status, output = target.run(cmd)
+            if status != 0 or not output:
+                raise Exception()
+            result += output.split()
+        except:
+            bb.note(f"No file/directory matching path {raw_path}")
+
+    return result
+
+def retrieve_test_artifacts(target, artifacts_list, target_dir):
+    import shutil
+
+    local_artifacts_dir = os.path.join(target_dir, "artifacts")
+    if os.path.isdir(local_artifacts_dir):
+        shutil.rmtree(local_artifacts_dir)
+
+    os.makedirs(local_artifacts_dir)
+    for artifact_path in artifacts_list:
+        if not os.path.isabs(artifact_path):
+            bb.warn(f"{artifact_path} is not an absolute path")
+            continue
+        try:
+            dest_dir = os.path.join(local_artifacts_dir, os.path.dirname(artifact_path[1:]))
+            os.makedirs(dest_dir, exist_ok=True)
+            target.copyFrom(artifact_path, dest_dir)
+        except Exception as e:
+            bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
+
+def list_and_fetch_failed_tests_artifacts(d, tc):
+    artifacts_list = get_artifacts_list(tc.target, d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
+    if not artifacts_list:
+        bb.warn("Could not load artifacts list, skip artifacts retrieval")
+    else:
+        retrieve_test_artifacts(tc.target, artifacts_list, get_testimage_json_result_dir(d))
+
+
+##################################################################
+# General post actions runner
+##################################################################
+
+def run_failed_tests_post_actions(d, tc):
+    post_actions=[
+        list_and_fetch_failed_tests_artifacts
+    ]
+
+    for action in post_actions:
+        action(d, tc)
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index bee19674ef4f..d2b525d40f41 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -4,6 +4,7 @@
 
 inherit metadata_scm
 inherit image-artifact-names
+inherit failed-tests-post-actions
 
 # testimage.bbclass enables testing of qemu images using python unittests.
 # Most of the tests are commands run on target image over ssh.
@@ -177,40 +178,6 @@ def get_testimage_boot_patterns(d):
                 boot_patterns[flag] = flagval.encode().decode('unicode-escape')
     return boot_patterns
 
-def get_artifacts_list(target, raw_list):
-    result = []
-    # Passed list may contains patterns in paths, expand them directly on target
-    for raw_path in raw_list.split():
-        cmd = f"for p in {raw_path}; do if [ -e $p ]; then echo $p; fi; done"
-        try:
-            status, output = target.run(cmd)
-            if status != 0 or not output:
-                raise Exception()
-            result += output.split()
-        except:
-            bb.note(f"No file/directory matching path {raw_path}")
-
-    return result
-
-def retrieve_test_artifacts(target, artifacts_list, target_dir):
-    import shutil
-
-    local_artifacts_dir = os.path.join(target_dir, "artifacts")
-    if os.path.isdir(local_artifacts_dir):
-        shutil.rmtree(local_artifacts_dir)
-
-    os.makedirs(local_artifacts_dir)
-    for artifact_path in artifacts_list:
-        if not os.path.isabs(artifact_path):
-            bb.warn(f"{artifact_path} is not an absolute path")
-            continue
-        try:
-            dest_dir = os.path.join(local_artifacts_dir, os.path.dirname(artifact_path[1:]))
-            os.makedirs(dest_dir, exist_ok=True)
-            target.copyFrom(artifact_path, dest_dir)
-        except Exception as e:
-            bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
-
 def testimage_main(d):
     import os
     import json
@@ -406,12 +373,7 @@ def testimage_main(d):
         results = tc.runTests()
         complete = True
         if results.hasAnyFailingTest():
-            artifacts_list = get_artifacts_list(tc.target, d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
-            if not artifacts_list:
-                bb.warn("Could not load artifacts list, skip artifacts retrieval")
-            else:
-                bb.warn(f"Retrieving artifacts: {d.getVar('TESTIMAGE_FAILED_QA_ARTIFACTS')}")
-                retrieve_test_artifacts(tc.target, artifacts_list, get_testimage_json_result_dir(d))
+            run_failed_tests_post_actions(d, tc)
     except (KeyboardInterrupt, BlockingIOError) as err:
         if isinstance(err, KeyboardInterrupt):
             bb.error('testimage interrupted, shutting down...')
-- 
2.43.1


