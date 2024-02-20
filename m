Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5EC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 20:02:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.23175.1708459329836060093
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 12:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bri4XesI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 518302000A;
	Tue, 20 Feb 2024 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708459328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYxA5U2cbhi3R2QGW83h0hasmcBuwobpKYnEGYnDebU=;
	b=bri4XesIKSaAL06tWNDCil9XoFHHMnsUM2E/SbAIY5405GB1TtlxVbrsjOuHiEKGngZ7hM
	oZu9zTEquAFna6VR8n643WiGUi1taOuvajY8v4mtsEWhdlcNFqimJn3akWlHqN32VZdo2X
	KXyvsSpC915aL94d+YV+yMHecOOC4QWsJ7cko3JFg/KPSqnrIUSg26yc9ctqyVI5wm7beI
	9QVKi/LDlHWopYuezd2DTsN+Q3SdXr9gx0N3WirkAsH70JFEOjgwhqMLTkoEJl55bj0oYA
	4zWIgUUaqskxT/zlJ5QZfyvCy3+6Hyv+UTY4O0FytGfOtKzNLVUIzkeZCmZ0jQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 4/4] testimage: add host disk usage stat as post action
Date: Tue, 20 Feb 2024 21:01:59 +0100
Message-ID: <20240220200159.13419-5-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195929

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Since the target under test can be a virtualized guest, when some tests
fail because of disk usage (see [1]), also fetch disk usage statistics from
host to allow checking whether a host disk space saturation could affect
running tests.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../failed-tests-post-actions.bbclass               | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/failed-tests-post-actions.bbclass b/meta/classes-recipe/failed-tests-post-actions.bbclass
index a8604fca2b9d..a9e92aa2427e 100644
--- a/meta/classes-recipe/failed-tests-post-actions.bbclass
+++ b/meta/classes-recipe/failed-tests-post-actions.bbclass
@@ -19,6 +19,16 @@ def get_target_disk_usage(d, tc):
     except Exception as e:
         bb.warn(f"Can not get target disk usage: {e}")
 
+def get_host_disk_usage(d, tc):
+    import subprocess
+
+    output_file = os.path.join(get_testimage_json_result_dir(d), "artifacts", "host_disk_usage.txt")
+    try:
+        with open(output_file, 'w') as f:
+            output = subprocess.run(['/usr/bin/df', '-hl'], check=True, text=True, stdout=f)
+    except Exception as e:
+        bb.warn(f"Can not get host disk usage: {e}")
+
 ##################################################################
 # Artifacts retrieval
 ##################################################################
@@ -76,7 +86,8 @@ def run_failed_tests_post_actions(d, tc):
     post_actions=[
         create_artifacts_directory,
         list_and_fetch_failed_tests_artifacts,
-        get_target_disk_usage
+        get_target_disk_usage,
+        get_host_disk_usage
     ]
 
     for action in post_actions:
-- 
2.43.1


