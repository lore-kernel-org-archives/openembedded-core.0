Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE659C678DC
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 09:49:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.14440.1726825783817196738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 02:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LDqpPope;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B410C0005;
	Fri, 20 Sep 2024 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726825781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sgWJkULpBbNUaII5/X9dzf0KIpinO5hJSAkYQEtgE+8=;
	b=LDqpPopezlH4q5xVqeI0PvJZIj4z4f9zT/ruMx2H1WLZDcYNAWn4h+ijJbYb0KmpSSpfzK
	Ad3OGo0ZScMyqBidXbYqCpxdAdsQFFt79XZMacSqf4984pNzllAf5RnYbNe91dmolKRiHC
	p2tVFGt7k0Uum1oNKBAfBWQD5ccCjrtQm0ULMglyaGYoBkTTaCmi1M3a8ZX+q9o7/LJo/6
	CPZoSxpnGp4YMX58h3jLd2jlSycwa1TmqfDp5hAzqFHKQIyleQjWdUL6T5YLkNo+06mXo3
	eDFxaAwl0xfPUvH9TW2yPDB7MddGXTzjHYcl684Y9Ywk/MvP+JQ9oaidAGhqDA==
From: mathieu.dubois-briand@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] oeqa/postactions: Fix archive retrieval from target
Date: Fri, 20 Sep 2024 11:48:44 +0200
Message-Id: <20240920094844.3987858-1-mathieu.dubois-briand@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 09:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204729

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

A previous patch broke archive retrieval because of an undeclared
variable. Declare the archive_name variable as expected.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexis Lothoré <alexis.lothore@bootlin.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/lib/oeqa/utils/postactions.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index d5080523aa83..8f787838b9d9 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -68,6 +68,7 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artifacts_list, outputdir):
         (status, output) = tc.target.run(cmd, raw = True)
         if status != 0 or not output:
             raise Exception("Error while fetching compressed artifacts")
+        archive_name = os.path.join(outputdir, "tests_artifacts.tar.gz")
         with open(archive_name, "wb") as f:
             f.write(output)
     except Exception as e:
-- 
2.39.2


