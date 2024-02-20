Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51446C54764
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 20:02:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.23174.1708459329531732445
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 12:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jhr5sBzy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10B0520007;
	Tue, 20 Feb 2024 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708459328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1s9kAAWZKHNfU82tB4qbyZ2nTQ4GbfNLuVvL5KKFEU=;
	b=jhr5sBzyr72oEO/V2OkkgYMelauZtR+9g5evLACUzsf4LwZX/Yiy472N3dJDYU3bR3bosE
	mbL2fhFkIj2+CWhYQ7N2vmxaZeo53M5dfM7gVlxxqwJtk70ABD2ovAv7RN1N0a6k4T0mMB
	U4Rm6u4CK44vQSxFXilh0/7JN+/dP1skJu1i8QOu1rqED1sK3pxjUruK9pabrVrYEaB/Yp
	wMOQjRBv8xIF6ZY6HPGNr+yUAhc+2w4yNTt78Pz3dWZkzXWpsXYcHypHXm7uNHmvYOPrhH
	vtjZunkzV5aJP8HZJTxaPbOy2XQRHtfQe6ArkiUiUXt4i8KE/q6n/60LIbFHyg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 3/4] testimage: add target disk usage stat as post action
Date: Tue, 20 Feb 2024 21:01:58 +0100
Message-ID: <20240220200159.13419-4-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195928

From: Alexis Lothoré <alexis.lothore@bootlin.com>

In order to debug issues related to disk space (see [1]),  add a failed
tests post action to retrieve disk usage on the target. Rely on the test
context object to run the corresponding command onto the target

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../failed-tests-post-actions.bbclass           | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/failed-tests-post-actions.bbclass b/meta/classes-recipe/failed-tests-post-actions.bbclass
index eaf08fb792f3..a8604fca2b9d 100644
--- a/meta/classes-recipe/failed-tests-post-actions.bbclass
+++ b/meta/classes-recipe/failed-tests-post-actions.bbclass
@@ -5,6 +5,20 @@
 #
 
 
+##################################################################
+# Host/target statistics
+##################################################################
+
+def get_target_disk_usage(d, tc):
+    output_file = os.path.join(get_testimage_json_result_dir(d), "artifacts", "target_disk_usage.txt")
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
@@ -61,7 +75,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc):
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


