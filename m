Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220BDC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 06:47:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.7350.1686293270819606344
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 23:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nhKtDoqa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686293268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IAJNYgkrVsfDpP7lCSbRWA8OmWIg7KNDS7TSafLzfI=;
	b=nhKtDoqavzMAT5Dcbmp84M3XGc5xq5HdGBirtQxxz5dBT4lN6nxWIVP+yMG4PTSYpBcitA
	uDbPl+vUDWYHaC1+CF6NNOoYt+UgJ+HZhsMH2U7rI9jnuuYSb/ErtENVmflolYVx38Nd/X
	qUkX/J7nmKGMe7IpPXAGZK9knHtSG48KH4LgEHuyggiWrA8gBSeeH7kWC1M8U4v9pL6xiR
	vqIV0SmkMwnpTF0CHVxRrXVnPblMiBDr6thcOWwnbLhkOTu0se52gJUDR7jKEJF39/O4Yt
	ksZ4n2Xu1Gc59JuA6atSyIFw9ZpJdshgK6pLKWifjrji2+5LwFIhaMMe1RVeFg==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A803160002;
	Fri,  9 Jun 2023 06:47:48 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [OE-Core][PATCH v3 2/4] oeqa/target/ssh: update options for SCP
Date: Fri,  9 Jun 2023 08:48:00 +0200
Message-Id: <20230609064802.11777-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609064802.11777-1-alexis.lothore@bootlin.com>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 06:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182534

From: Alexis Lothoré <alexis.lothore@bootlin.com>

By default scp expects files. Passing -r option allows to copy directories
too

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes since v1:
- drop legacy scp protocol option
---
 meta/lib/oeqa/core/target/ssh.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 51079075b5bd..e650302052db 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -40,8 +40,11 @@ class OESSHTarget(OETarget):
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
                 ]
+        scp_options = [
+                '-r'
+        ]
         self.ssh = ['ssh', '-l', self.user ] + ssh_options
-        self.scp = ['scp'] + ssh_options
+        self.scp = ['scp'] + ssh_options + scp_options
         if port:
             self.ssh = self.ssh + [ '-p', port ]
             self.scp = self.scp + [ '-P', port ]
-- 
2.40.1


