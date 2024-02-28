Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C41C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 16:41:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1433.1709138501402883996
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 08:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ckk+z9js;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EF7BE0004;
	Wed, 28 Feb 2024 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709138499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ntk+4fuwmksiYsxh01A/gTREHDfMfvfKZ662QK8LFSk=;
	b=ckk+z9jsbKrfBQFl5ddA/frm8CRW132iX5LkvrJhn/o7lZUbkjqOejlVF7c1ocUB4/BM7T
	McVYmezYYYReOZmIrdEwKFBXAQLBipo+E4ycEi3W8dr1BkYIUSx2zhNeOV7J0Suk9Ah9xG
	iTYdfURYaJvkCoXiUCJlnS1sE6V6bJeNvRN29d8+8cNqCudofvH/ls/OXhRWlidWFBICOL
	Q2O0hFIkqYo63qSy6+y89CJz5suqmlnncMOtYCLnmBS1hshjxxy2ztRs7k0Yn8FR9Cbyrn
	MF9WhGLOa5isWoZJ1Y631x8xJ/K44VX9wWZz+jeRrBtwlItzyQNhfWxC53LgaA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH] oeqa/lib/utils/postactions: fix host disk usage stats retrieval
Date: Wed, 28 Feb 2024 17:41:35 +0100
Message-ID: <20240228164135.330690-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196397

From: Alexis Lothoré <alexis.lothore@bootlin.com>

The recently introduced postactions module  can raise, on failing ptests,
the following warning:

WARNING: core-image-ptest-glib-2.0-1.0-r0 do_testimage: Can not get host
disk usage: [Errno 2] No such file or directory: '/usr/bin/df'

The issue is likely not happening because of df absence (to be confirmed
amongst the variety of workers) but because of the wrong path. Fix it by
letting subprocess search for df, passing only the binary name. To make it
work, we also have to reset the environment, otherwise the environment
configured before running bitbake will be used, and search will fail.
---
Example of such failure can be found on the autobuilder, as detected by
Richard:
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6136/steps/13/logs/stdio

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/utils/postactions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 03cecdc21578..8104400ac258 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -38,7 +38,7 @@ def get_host_disk_usage(d, tc):
     output_file = os.path.join(get_json_result_dir(d), "artifacts", "host_disk_usage.txt")
     try:
         with open(output_file, 'w') as f:
-            output = subprocess.run(['/usr/bin/df', '-hl'], check=True, text=True, stdout=f)
+            output = subprocess.run(['df', '-hl'], check=True, text=True, stdout=f, env={})
     except Exception as e:
         bb.warn(f"Can not get host disk usage: {e}")
 
-- 
2.43.1


