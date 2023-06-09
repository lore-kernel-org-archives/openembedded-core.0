Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347AFC83005
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 06:47:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.7349.1686293270744409048
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 23:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kFuJNJcI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686293269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPe1iucLq1Gp7IPsUSMyOZRk+yc+lnR44Tt42jR6KoM=;
	b=kFuJNJcIsiZ43AKFkEjhEDbB9zc12v2R528in4rOd4LMla0w5gyw0QPh67mFpJX62/5RFI
	k2rioqykssg0Y60TGrxNxCohf4Jr5QYIFT6qDxxHV5+ktVwJTaOEyOnLcyXkRcY+LN5KX6
	qOhvr4HXy1PIiSVAXsco5bFbMTOLmNQfNMFYV7rQ3fo1bLWGQTi9GDnJX7QXR9+iUsbPxU
	f54c+S6xACnmXGYWaQeMAJYXITup6zTyubb//V0Bofhu7lWXYVwyVh+28WpJZENio3+QVw
	4SiQGN4ECdJN7O651pBULyV+cETcXYwZGsm+kntWYLjJxZYytyRSphLHRBTlZw==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A1866000A;
	Fri,  9 Jun 2023 06:47:49 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [OE-Core][PATCH v3 3/4] testimage: implement test artifacts retriever for failing tests
Date: Fri,  9 Jun 2023 08:48:01 +0200
Message-Id: <20230609064802.11777-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609064802.11777-1-alexis.lothore@bootlin.com>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 06:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182535

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Add a basic artifacts retrievers in testimage class which:
- triggers when at least one runtime test fails but tests execution
  encountered no major issue
- reads a list of paths to retrieve from TESTIMAGE_FAILED_QA_ARTIFACTS
- checks for artifacts presence on target
- retrieve those files over scp thanks to existing ssh class
- store those files in an "artifacts" directory in "tmp/log/oeqa/<image>"

This implementation assumes that the SSH or Qemu target has run and
finished gracefully. If tests do not finish because of an exception,
artifacts will not be retrieved

Bring partial solution to [YOCTO #14901]

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes since v2:
- remove ptests directories from default artifact list, now managed in
  core-image-ptest.bb
- use new function to check for any failed ptest

Changes since v1:
- only gather artifacts in nominal case (ie qemu runs without any raised
  exception)
- list artifacts directly in variable instead of using external file
- use standard variables in artifacts paths
- allow glob patterns usage in artifacts paths
- expand/filter artifacts list on target before retrieving them
- tune default artifacts list
---
 meta/classes-recipe/testimage.bbclass | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index b48cd96575d2..765184c18008 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -18,6 +18,15 @@ inherit image-artifact-names
 
 TESTIMAGE_AUTO ??= "0"
 
+# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for
+# each entry in it, if artifact pointed by path description exists on target,
+# it will be retrieved onto host
+
+TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
+    ${localstatedir}/log \
+    ${sysconfdir}/version \
+    ${sysconfdir}/os-release"
+
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
 # The test names are the module names in meta/lib/oeqa/runtime/cases.
@@ -192,6 +201,39 @@ def get_testimage_boot_patterns(d):
                 boot_patterns[flag] = flagval.encode().decode('unicode-escape')
     return boot_patterns
 
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
+            bb.warn(f"No file/directory matching path {raw_path}")
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
+        except:
+            bb.warn(f"Can not retrieve {artifact_path} from test target")
 
 def testimage_main(d):
     import os
@@ -383,6 +425,12 @@ def testimage_main(d):
             pass
         results = tc.runTests()
         complete = True
+        if results.hasAnyFailingTest():
+            artifacts_list = get_artifacts_list(tc.target, d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
+            if not artifacts_list:
+                bb.warn("Could not load artifacts list, skip artifacts retrieval")
+            else:
+                retrieve_test_artifacts(tc.target, artifacts_list, get_testimage_json_result_dir(d))
     except (KeyboardInterrupt, BlockingIOError) as err:
         if isinstance(err, KeyboardInterrupt):
             bb.error('testimage interrupted, shutting down...')
-- 
2.40.1


