Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AE8C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 09:19:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.16679.1708939175028429530
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 01:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pZLPNdMK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CD901C000D;
	Mon, 26 Feb 2024 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708939173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gZl/CX2XdTl9L5zW6yK1ki4i4/oUog+WKw64t/cC68=;
	b=pZLPNdMKvc4p46a8+Kqu7GqXBaRh9gVRLeaP5ODifJmtY+TB+5y90cX04RfIAPYtqksq9W
	SbkzpSq8JxLo+ex47YI/8DMHn5q2BDWlMkChLlFIgOGh8pG29ijWD2HGL60vVGTv9h+zJq
	l8Hze03CHq6M0dRtBv4feBeGSl6m4WLE3em1j0RRuRjG+3cTg3i9NcmoaaMws+t2tejTRG
	Vbd+nL0KVFjHkVid95L3g84QrYHcnnpeTejTV1GADj5cWQxU5gpkwEn8y1mGozY1OhXyZt
	A34e0TBIu5KZ/faCyWSv2Mf8Z4auDhaC8ZMDVCQPt7Pgn5wBQ66z2fKOeWeTig==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v4 4/5] oeqa/utils/postactions: add target disk usage stat as post action
Date: Mon, 26 Feb 2024 10:19:21 +0100
Message-ID: <20240226091922.41801-5-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196195

From: Alexis Lothoré <alexis.lothore@bootlin.com>

In order to debug issues related to disk space (see [1]),  add a failed
tests post action to retrieve disk usage on the target. Rely on the test
context object to run the corresponding command onto the target

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- - use new shared helper get_json_result_dir()
---
 meta/lib/oeqa/utils/postactions.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 7014b2830a9c..008968b56a3f 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -18,6 +18,20 @@ def create_artifacts_directory(d, tc):
 
     os.makedirs(local_artifacts_dir)
 
+##################################################################
+# Host/target statistics
+##################################################################
+
+def get_target_disk_usage(d, tc):
+    output_file = os.path.join(get_json_result_dir(d), "artifacts", "target_disk_usage.txt")
+    try:
+        (status, output) = tc.target.run('df -hl')
+        with open(output_file, 'w') as f:
+            f.write(output)
+            f.write("\n")
+    except Exception as e:
+        bb.warn(f"Can not get target disk usage: {e}")
+
 ##################################################################
 # Artifacts retrieval
 ##################################################################
@@ -65,7 +79,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc):
 def run_failed_tests_post_actions(d, tc):
     post_actions=[
         create_artifacts_directory,
-        list_and_fetch_failed_tests_artifacts
+        list_and_fetch_failed_tests_artifacts,
+        get_target_disk_usage
     ]
 
     for action in post_actions:
-- 
2.43.1


