Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B2CC54E4C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 14:03:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.11207.1708697032200577193
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 06:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hxkTzbuC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEBEE20008;
	Fri, 23 Feb 2024 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708697030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2hvWb2Pt4gAzOcJWCv8KE5rJ/twULPFf1mGwC3KeWw=;
	b=hxkTzbuCG9a0KWrhjC8Pmt7hozM/aXoYLloykkZDfJyHRVbjljLP5VkGp/XplAOY7eHzTA
	J608wyfu7MohxbE6W/4otYUa06WTAIzYdziPWA+OAXBkPbqR2D6qeZxEoDaZVDg5en2IC+
	8GG9XDrJVRXx2R27LTceyFCDA5hYpK2XrsyOD6OvoKd5jm0RliZOD6QmC5V0stzrLcmOEH
	sr0rI9BLwDmpYrSOhPs5fThL+mqDxrgJFW/ejr/aofuvqhEYL4fjZiKUVmmWi1SC+YZaEe
	Sz4RrVv33OPf3g9OVRE0LQ2xhrPvKRVB2Gb721DkJgEqgVyWF1AtcndLTovYWw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 2/5] testimage: create a list of failed test post actions
Date: Fri, 23 Feb 2024 15:03:42 +0100
Message-ID: <20240223140345.1362972-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240223140345.1362972-1-alexis.lothore@bootlin.com>
References: <20240223140345.1362972-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 14:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196087

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
dedicated postactions.py file inherited by testimage.
This patch does not bring any functional change.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- move functions in a lib in oeqa instead of a bbclass
- use new shared helper get_json_result_dir()
---
 meta/classes-recipe/testimage.bbclass | 42 +----------------
 meta/lib/oeqa/utils/postactions.py    | 68 +++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 40 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/postactions.py

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index c450566dadea..ad040ee8f071 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -170,40 +170,6 @@ def get_testimage_boot_patterns(d):
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
@@ -218,6 +184,7 @@ def testimage_main(d):
     from oeqa.core.utils.test import getSuiteCases
     from oeqa.utils import make_logger_bitbake_compatible
     from oeqa.utils import get_json_result_dir
+    from oeqa.utils.postactions import run_failed_tests_post_actions
 
     def sigterm_exception(signum, stackframe):
         """
@@ -400,12 +367,7 @@ def testimage_main(d):
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
diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
new file mode 100644
index 000000000000..09c338ef6886
--- /dev/null
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -0,0 +1,68 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Run a set of actions after tests. The runner provides internal data
+# dictionary as well as test context to any action to run.
+
+from oeqa.utils import get_json_result_dir
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
+        retrieve_test_artifacts(tc.target, artifacts_list, get_json_result_dir(d))
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
-- 
2.43.1


