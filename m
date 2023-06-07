Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F0AC7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:30:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.3622.1686126625154492312
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 01:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y4khLY9M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686126622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M+Ossdbplq+xwCsIamphFVAu7jtRLHWQd1EajDUq+z0=;
	b=Y4khLY9MCWeKg5A88P+nlbNWkuSd7Mlnm9LHYYO3WGZidz/GNvsDfTpfE2/uROCYEGjrMX
	JgbIQxo9zLtuLkmGxGNvnExF0sDtJwdrmM9MSp5Lt3vW4c7xyVuKAVzKW+WstbdjrSqIJR
	JPKrVNrYd6ez30+ww64B5bqMtzs7SGXCHpiD9V8h82h0TaZxsfqYS2nPOzJ8/sN10yQMKP
	tDptFIOKbgFUkJpNax+t/rGktn0Kh8HL8GU0qiCsUdEVvi1E4v0Jr/mptEi/Ts7VOg27oP
	yNKHALgKBQoXRcspJtWLPSSMY/lpi8M3576Ouk7KgMbR+sVNKtbWA5aHZJD1Hw==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA044E000F;
	Wed,  7 Jun 2023 08:30:21 +0000 (UTC)
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 1/2] oeqa/target/ssh: update options for SCP
Date: Wed,  7 Jun 2023 10:30:14 +0200
Message-Id: <20230607083015.20760-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607083015.20760-1-alexis.lothore@bootlin.com>
References: <20230607083015.20760-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 08:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182459

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


