Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36074C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 20:02:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.22974.1708459329268751122
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 12:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VtMEa9vo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF89220003;
	Tue, 20 Feb 2024 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708459327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHhGs47w5dQa+H5Jg5OzVm74M5su9sy5srEBl7R6260=;
	b=VtMEa9vo1yXf7qCzLpfHWcdUN7dygjDlPmXUwoZ3j0fZDF66uViqu5rKZdfXnlkIfcHYSH
	4TLvFDShdDUIE8Huj4n5aC+ArukOdcK+oAUJW8bYzGH+ucOozxKmi/MDnxM01+YfjK2TSI
	88T0V+hsma0CmqRyd8dxoLrM7/qEdU9UhwkVWeDFeKyql7wc2LDRTcM9aiy+0KmJWgj8mm
	8If/4SXMgL9GiTSbwTT9AvPHNhQSY9sGPBGeEeBXna/hWDSppOKZ7oao0Qn34NlTSevqzg
	spgFerpNG38GzGHVqQTKtXLmZ3vrqiEBCpWyFvmd9pdLBbZAU06XfDZxC02wSQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 2/4] testimage: isolate artifacts directory creation in dedicated post action
Date: Tue, 20 Feb 2024 21:01:57 +0100
Message-ID: <20240220200159.13419-3-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195926

From: Alexis Lothoré <alexis.lothore@bootlin.com>

In order to be able to create actions that could store new files during
failed test post actions, we need to split artifacts directory creation
from artifacts retrieval.

Create a new dedicated action to create artifacts main directory so we can
add actions creating files in this new directory, without worrying about
actions order if at least this action is set first.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../failed-tests-post-actions.bbclass            | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/failed-tests-post-actions.bbclass b/meta/classes-recipe/failed-tests-post-actions.bbclass
index 7c7d3391298f..eaf08fb792f3 100644
--- a/meta/classes-recipe/failed-tests-post-actions.bbclass
+++ b/meta/classes-recipe/failed-tests-post-actions.bbclass
@@ -9,6 +9,15 @@
 # Artifacts retrieval
 ##################################################################
 
+def create_artifacts_directory(d, tc):
+    import shutil
+
+    local_artifacts_dir = os.path.join(get_testimage_json_result_dir(d), "artifacts")
+    if os.path.isdir(local_artifacts_dir):
+        shutil.rmtree(local_artifacts_dir)
+
+    os.makedirs(local_artifacts_dir)
+
 def get_artifacts_list(target, raw_list):
     result = []
     # Passed list may contains patterns in paths, expand them directly on target
@@ -25,13 +34,7 @@ def get_artifacts_list(target, raw_list):
     return result
 
 def retrieve_test_artifacts(target, artifacts_list, target_dir):
-    import shutil
-
     local_artifacts_dir = os.path.join(target_dir, "artifacts")
-    if os.path.isdir(local_artifacts_dir):
-        shutil.rmtree(local_artifacts_dir)
-
-    os.makedirs(local_artifacts_dir)
     for artifact_path in artifacts_list:
         if not os.path.isabs(artifact_path):
             bb.warn(f"{artifact_path} is not an absolute path")
@@ -57,6 +60,7 @@ def list_and_fetch_failed_tests_artifacts(d, tc):
 
 def run_failed_tests_post_actions(d, tc):
     post_actions=[
+        create_artifacts_directory,
         list_and_fetch_failed_tests_artifacts
     ]
 
-- 
2.43.1


