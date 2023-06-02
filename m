Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBA8C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:50:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8883.1685699420078968635
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 02:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kCqrodAC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685699418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XakE4986FFZiaonPfKCUcsC8TTf0nqLVbsX7lObtkvc=;
	b=kCqrodAC8hSFDy8WHoyPylS6BT/5ZeMG7u3rTL1oid6rYdMdkT2lqa4PZN8QibjpTZBxVh
	PSrH2C+DOv98WrXG13x5Dm1pHhUg3tgqzb2UaN5nhLrJVn4a7QP4Zp7H4xhFtjl+Jep/gd
	gmOFFN0Y5XklkLi64ZmRbyP+7sTO4bKlM9N2Z4ZalWCNxnLMSf00ZV6uEXpyXQ1mRD/e33
	pEXICW+O151ssOP0lOm2LsYXxvgdvrxvi3nAF3NHuFzsm3PnynCvk608/ufhNYR4aKNaNe
	z15z0grIPX9vtMW7C0LIOxPyGVTb6EUV7jBE0DwT0BjrSuC6KVAAY4wz/HHvYg==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A889C0002;
	Fri,  2 Jun 2023 09:50:18 +0000 (UTC)
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][RFC][PATCH 1/3] oeqa/target/ssh: update options for SCP
Date: Fri,  2 Jun 2023 11:50:35 +0200
Message-Id: <20230602095037.97981-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602095037.97981-1-alexis.lothore@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 09:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182298

Add two options for SCP:
- by default scp expects sftp server to be available on target, which is
  not always true (e.g: core-image-minimal image). Pass -O to force SCP to
  fallback to legacy SCP protocol
- by default scp expects files. Passing -r option allows to copy
  directories too

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/core/target/ssh.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 51079075b5bd..dc17ceecd74d 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -40,8 +40,12 @@ class OESSHTarget(OETarget):
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
                 ]
+        scp_options = [
+                '-O', # Allow legacy option for images not containing SFTP server
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


