Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB36C54E41
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 15:16:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.14943.1708701416125543457
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 07:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VP1Ib1U6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99CD61BF214;
	Fri, 23 Feb 2024 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708701414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5t1v6ah5B92Jt5MkGcmp5hSvI5wevVDMx3spVHHIIrE=;
	b=VP1Ib1U6Qpy2Tt/6qT/9M0X/7j/kOJoBKPlsOeMQrcjBu4vy9dnHdaEUhIrxpURKU8XfSr
	yAM+OPXPGWjyo9hBYHOCIzrQsF89RSrMpqOoTEdcl16Z73SI/t9qaj2W6B4ixi/LoAYqN7
	T4jRBV3pJCcxt3bPWMarVEREv7zbj472hNDva4ba8hzMGw0yjRT+dIhgEtsQgNcZWVzwFC
	sEbjA2coYpvAqupztWkdxqDjNwuAptjzdu/6eWHDlot7kZM1lln+LSVYKEgQSZhapvB/wr
	srsY3mwNcDi4Nu6jJypXafyDEoL/Js9HUAsJ2Xgv8zEMAzf8wEyEC0oQMFk+Bg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v3 5/5] oeqa/utils/postactions: testimage: add host disk usage stat as post action
Date: Fri, 23 Feb 2024 16:16:48 +0100
Message-ID: <20240223151648.1453027-6-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240223151648.1453027-1-alexis.lothore@bootlin.com>
References: <20240223151648.1453027-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 15:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196101

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Since the target under test can be a virtualized guest, when some tests
fail because of disk usage (see [1]), also fetch disk usage statistics from
host to allow checking whether a host disk space saturation could affect
running tests.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15220

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- use new shared helper get_json_result_dir()
---
 meta/lib/oeqa/utils/postactions.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 008968b56a3f..03cecdc21578 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -32,6 +32,16 @@ def get_target_disk_usage(d, tc):
     except Exception as e:
         bb.warn(f"Can not get target disk usage: {e}")
 
+def get_host_disk_usage(d, tc):
+    import subprocess
+
+    output_file = os.path.join(get_json_result_dir(d), "artifacts", "host_disk_usage.txt")
+    try:
+        with open(output_file, 'w') as f:
+            output = subprocess.run(['/usr/bin/df', '-hl'], check=True, text=True, stdout=f)
+    except Exception as e:
+        bb.warn(f"Can not get host disk usage: {e}")
+
 ##################################################################
 # Artifacts retrieval
 ##################################################################
@@ -80,7 +90,8 @@ def run_failed_tests_post_actions(d, tc):
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


