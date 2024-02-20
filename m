Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18E9C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 13:33:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.13132.1708436034637989423
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 05:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iPD6Jz3T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18AD36000C;
	Tue, 20 Feb 2024 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708436032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oFhgwVZlo6917PLtqktK+NONkvyeXHt+bFNAnmTKalg=;
	b=iPD6Jz3TmwkHG8HUg/2EXBdi3Y3litm2wuwF0u8bCIIUMFMjsFbiRXrYUAQWhau8SkVQ32
	p9c5SeyDgVEr09D9fdyh7jI9qGmXqg56Ssk0UDc9GddDTkRzHT99YtMZaVqofUFRMwCR8g
	Xt7A0tvGdaPS6Yt+I/gBMYMcnuWbNb5CNfIGC0hU0kK6aqPLEw+kpUzOyZzQOoz5cYXcsI
	xWc6Ugyw4R0Uhw3qf2bnPI6ZNSwPCxhMItJY1741AB/Zk5TonfetASeG2Uj6Lvm4bvE9DH
	Y7LZ4iqK00AjzfoOYXMg9VhAFFj2aDZec+2/B7FHc8N4z+8pNJq12aDzw05uUQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH] testimage: log exception when failing to retrieve artifacts
Date: Tue, 20 Feb 2024 14:33:12 +0100
Message-ID: <20240220133312.2714492-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 13:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195917

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Despite managing to retrieve the failed ptests artifacts, testimage seems
to dump some retrieval errors like the following one:

WARNING: core-image-ptest-valgrind-1.0-r0 do_testimage: Can not retrieve
/usr/lib/valgrind/ptest from test target

Log the corresponding exception to help analyzing such issue

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
As a more detailed example, such log is visible in [1], while artifacts
have been properly pushed in the corresponding web server in [2]

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6099/steps/13/logs/stdio
[2] https://autobuilder.yocto.io/pub/non-release/20240218-3/testresults/qemuarm64-ptest/artifacts/usr/lib/valgrind/ptest/
---
 meta/classes-recipe/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 934272b6b837..bee19674ef4f 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -208,8 +208,8 @@ def retrieve_test_artifacts(target, artifacts_list, target_dir):
             dest_dir = os.path.join(local_artifacts_dir, os.path.dirname(artifact_path[1:]))
             os.makedirs(dest_dir, exist_ok=True)
             target.copyFrom(artifact_path, dest_dir)
-        except:
-            bb.warn(f"Can not retrieve {artifact_path} from test target")
+        except Exception as e:
+            bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
 
 def testimage_main(d):
     import os
-- 
2.43.1


