Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE4FC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:50:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8885.1685699420725604369
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 02:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SjVqcfhR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685699419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4I0hO2nZdkAGDGW9kZppHciRxm3gHpa3loYxv8EleY=;
	b=SjVqcfhRI9cHB3QdEJZ6A2r0+VNL2mTPg7vSqezrwBj5uPJxXMcJFEPL+lEjEjwmQHzwZA
	FnBeTgvrErNT4lvGkz9Q4pUE2agj9yBY8HI1wYjF9H23vZp4oyX6JstuILTNxd51PyArNn
	g66nFOB+ZWv0ZEpgLuxYuXLNLaggqyDT2zVtPtZYZRRIlfMJSogLz1BLRFMUHO5MPVT9S1
	relH4n/+EXCRgBrxXAWiRGu19XGL8I0qWyJRSQ0wm0j3s7X1rd33tpIhlKANuiTEMGdtrX
	SbBYerIqPc7OOhs24QhTIHmAr/nh9zXjodLAr4gcgrZwRBqr1mJdZfPvH/11GQ==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2035BC0012;
	Fri,  2 Jun 2023 09:50:19 +0000 (UTC)
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts retriever for failing tests
Date: Fri,  2 Jun 2023 11:50:37 +0200
Message-Id: <20230602095037.97981-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602095037.97981-1-alexis.lothore@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 09:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182300

Add a basic artifacts retrievers in testimage class which:
- triggers when at least one runtime test fails
- reads a list of files to retrieve from ARTIFACTS_LIST_PATH
- retrieve those files over scp thanks to existing ssh class
- store those files in an "artifacts" directory in "tmp/log/oeqa/<image>"

Bring partial solution to [YOCTO #14901]

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/classes-recipe/testimage.bbclass | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 6b10c1db09f9..3fd3dd5b0264 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -18,6 +18,12 @@ inherit image-artifact-names
 
 TESTIMAGE_AUTO ??= "0"
 
+# When any test fails, if path to an artifacts configuration (listing
+# files/directories to retrieve on target) has been provided, all listed
+# elements will be downloaded from target before shutting it down
+
+ARTIFACTS_LIST_PATH ??= ""
+
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
 # The test names are the module names in meta/lib/oeqa/runtime/cases.
@@ -192,6 +198,45 @@ def get_testimage_boot_patterns(d):
                 boot_patterns[flag] = flagval.encode().decode('unicode-escape')
     return boot_patterns
 
+def load_artifacts_list(artifacts_conf_path):
+    import json
+
+    if not artifacts_conf_path:
+        return None
+
+    if not os.path.isfile(artifacts_conf_path):
+        return None
+
+    try:
+        with open(artifacts_conf_path) as f:
+            artifacts_list = json.load(f)
+    except json.decoder.JSONDecodeError as e:
+        bb.warn(f"Invalid tests artifact list format: {e.lineno}:{e.colno} : {e.msg}")
+        return None
+
+    if 'artifacts' in artifacts_list:
+        return artifacts_list['artifacts']
+
+    return None
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
+        except:
+            bb.warn(f"Can not retrieve {artifact_path} from test target")
 
 def testimage_main(d):
     import os
@@ -402,6 +447,12 @@ def testimage_main(d):
                         get_testimage_result_id(configuration),
                         dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
         results.logSummary(pn)
+        if not results.wasSuccessful():
+            artifacts_list = load_artifacts_list(d.getVar("ARTIFACTS_LIST_PATH"))
+            if not artifacts_list:
+                bb.warn("Could not load artifacts list, skip artifacts retrieval")
+            else:
+                retrieve_test_artifacts(tc.target, artifacts_list, get_testimage_json_result_dir(d))
 
     tc.target.stop()
 
-- 
2.40.1


