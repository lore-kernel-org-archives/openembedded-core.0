Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417F1C7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:30:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.3585.1686126625748611855
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 01:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ng4NuvKr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686126624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KhHY8QpAa+Hx4kZlmGympysR6UWYipphFxQpZMCo3D4=;
	b=Ng4NuvKrWBMFD4nDxReVLtTHJwYjgSKapb/rGFEU17PlqB1qm+jAPew/dLA9uUYr5aCUZG
	ZZkqRL/bC7bcGyfkBXBE54pQqKbhdgMMG0d8YH5fyzqHPAuFie7W2tT1G/Xijjj/cnLqln
	UhYotg7zi8FxobIshAd/9iH76aiqcMnE0Wvr5KtxZHNBsdzvN5OWSGBLgSJq0zCi0dYFHy
	rKBhBjaBrCvGgH/CIwyMZNFZXMUVhEImznO7jQdLiu8yoEp+NRWOETIV2nsT9eTOSKIgb1
	Av6Agwx3WTZxhtRt3JXY0B34RXr9Yhs/KFvNq2WPbVb3fVTwdR65qBfI15jBwQ==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99639E0016;
	Wed,  7 Jun 2023 08:30:22 +0000 (UTC)
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 2/2] testimage: implement test artifacts retriever for failing tests
Date: Wed,  7 Jun 2023 10:30:15 +0200
Message-Id: <20230607083015.20760-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607083015.20760-1-alexis.lothore@bootlin.com>
References: <20230607083015.20760-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 08:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182460

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
Changes since v1:
- only gather artifacts in nominal case (ie qemu runs without any raised
  exception)
- list artifacts directly in variable instead of using external file
- use standard variables in artifacts paths
- allow glob patterns usage in artifacts paths
- expand/filter artifacts list on target before retrieving them
- tune default artifacts list
---
 meta/classes-recipe/testimage.bbclass | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index b48cd96575d2..c6ce74a9e7a8 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -18,6 +18,16 @@ inherit image-artifact-names
 
 TESTIMAGE_AUTO ??= "0"
 
+# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for
+# each entry in it, if artifact pointed by path description exists on target,
+# it will be retrieved onto host
+
+TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
+    ${localstatedir}/log \
+    ${sysconfdir}/version \
+    ${sysconfdir}/os-release \
+    ${libdir}/*/ptest"
+
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
 # The test names are the module names in meta/lib/oeqa/runtime/cases.
@@ -192,6 +202,39 @@ def get_testimage_boot_patterns(d):
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
@@ -383,6 +426,12 @@ def testimage_main(d):
             pass
         results = tc.runTests()
         complete = True
+        if not results.wasSuccessful():
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


