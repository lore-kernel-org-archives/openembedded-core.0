Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C636C54E51
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 09:19:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.16876.1708939174784555568
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 01:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UIczwLvY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54B731C000C;
	Mon, 26 Feb 2024 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708939173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEgJ6pgDo3Pq0ewsLn/7kmErJddBHyBge+1pfyV16N0=;
	b=UIczwLvYXKHGngrUjdLfUbq9I9o2gX+m8PZCh+zYdz1+rEQRS1wYMA3DuZ5ja+OcD/a3Ka
	hNfZS4GNn5+kA2iF21ArSKzfJ6A8LWOTm+vS46ZvqkNDcqNYLN3xV+atwAY0DU6596dPxP
	W55fawIT6bsVx2qbs2+m+5M28sjOB1smXDsPqVDvYn0fgYqXhkXjPygcXNXOAKV3a3T1fy
	UZzHuAtpZnfs+Qk8op/BSxq2L+EiepWnCag/ANzYkjVd4vMb6VnGIFC/d1dOenk0AJp6IT
	xDWQJCeWwZixb/yinziv//xnYOoVU9LdhPyAqe/uT3UIlOc3YTwPAkBxUZ/BoA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v4 3/5] oeqa/utils/postactions: isolate directory creation in dedicated action
Date: Mon, 26 Feb 2024 10:19:20 +0100
Message-ID: <20240226091922.41801-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240226091922.41801-1-alexis.lothore@bootlin.com>
References: <20240226091922.41801-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 09:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196193

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


