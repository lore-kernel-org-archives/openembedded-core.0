Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3643CC54E50
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 14:03:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.11208.1708697032525886709
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 06:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MsMVhEvc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01B4220002;
	Fri, 23 Feb 2024 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708697031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEgJ6pgDo3Pq0ewsLn/7kmErJddBHyBge+1pfyV16N0=;
	b=MsMVhEvcs1EE/Op1w0JhbUaC3OKX/+33jxHtmtKGoSFjNZ5ET40Ei7RDzNYkzkyuHRJmJF
	rmrIXnni59WHv1Z+wE3VAk2BIcK619F6rtgONBUIcxIiNAdtfIF2gxd1i6N98IaP2zB3yT
	itXLHV+o/kmntYH693gyDh4uKhG7G3ko3lkwxQnkJ2TMWDx89W334dluAinwFEwZqMDaN4
	wbI3BaH6PDzBWfH5V29i+KL1pk80Fad9+BXRb/ad+Ws7pmdJhYi6kXY9CTm3YgT4T4hTGx
	mbbealPTfm7YGapq3amGKbIVbTG5XQzyF0dzBKC9VRpGjj9I7wZbQNsK2RMEpw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 3/5] oeqa/utils/postactions: isolate directory creation in dedicated action
Date: Fri, 23 Feb 2024 15:03:43 +0100
Message-ID: <20240223140345.1362972-4-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196088

From: Alexis Lothoré <alexis.lothore@bootlin.com>

In order to be able to create actions that could store new files during
failed test post actions, we need to split artifacts directory creation
from artifacts retrieval.

Create a new dedicated action to create artifacts main directory so we can
add actions creating files in this new directory, without worrying about
actions order if at least this action is set first.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- use new shared helper get_json_result_dir()
---
 meta/lib/oeqa/utils/postactions.py | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 09c338ef6886..7014b2830a9c 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -9,6 +9,15 @@
 
 from oeqa.utils import get_json_result_dir
 
+def create_artifacts_directory(d, tc):
+    import shutil
+
+    local_artifacts_dir = os.path.join(get_json_result_dir(d), "artifacts")
+    if os.path.isdir(local_artifacts_dir):
+        shutil.rmtree(local_artifacts_dir)
+
+    os.makedirs(local_artifacts_dir)
+
 ##################################################################
 # Artifacts retrieval
 ##################################################################
@@ -29,13 +38,7 @@ def get_artifacts_list(target, raw_list):
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
@@ -61,6 +64,7 @@ def list_and_fetch_failed_tests_artifacts(d, tc):
 
 def run_failed_tests_post_actions(d, tc):
     post_actions=[
+        create_artifacts_directory,
         list_and_fetch_failed_tests_artifacts
     ]
 
-- 
2.43.1


