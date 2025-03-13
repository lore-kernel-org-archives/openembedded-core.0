Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB7EC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 09:35:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10391.1741858520177534037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 02:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jSYEdX4O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5239F4342B;
	Thu, 13 Mar 2025 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741858518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q5Uo76zUkVL0SfuXCIdyuLLNkdSysF5SWJy7YjmozYI=;
	b=jSYEdX4OOwFDhraAckaxcLcW2Jk9YCLNRxrCbr3Iy2YgGddcaU50w8x+1Y6zSMX4IZElvE
	C8IyNqFQx+I6c9YedfY8xvmcGseA2B1Rz6id8O1pWZAygGeYpS8oJ5/x9caPaR1+InQ4s0
	cYw6QbIiynIUoSxjpWdEF5a1NGvYMNb9xWEQ7Id6QGsn+Yfm/RLsKkO5ZcdM0e1GTPlZsL
	h3wLMl25jbFgxlNjcAeMY4mY0YGqz1yU1PCZqq9dxRh96Q9sZ9hBSR5cy0KOjP+HCI1rWJ
	W7qByHujae05f8iGw+FjxIrIO+VMiJs7oELOq8Fd3xFcCBbB80Qgx0t+lGvFsA==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] lib/oe/qa: raise error on objdump failure
Date: Thu, 13 Mar 2025 10:34:37 +0100
Message-ID: <20250313093437.95237-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: spam:medium
X-GND-Score: 300
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecundevohgrshhtrghlucdlfedttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhenucggtffrrghtthgvrhhnpeeludeiveejfeekveduffffkeelleefueegvedvfefftefgvefghfejjeegffeukeenucffohhmrghinhepphhrohgtvghsshdrrhhunhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepgihpshdufedqudduieehghejrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 09:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212754

From: Thomas Perrot <thomas.perrot@bootlin.com>

Change the log level from 'note' to 'fatal' when objdump fails.
This ensures failures are treated with higher severity, providing
more visible feedback when objdump commands fail.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/lib/oe/qa.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index cd36cb5070d1..c1e295029abb 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -155,7 +155,7 @@ class ELFFile:
             self.objdump_output[cmd] = bb.process.run([objdump, cmd, self.name], env=env, shell=False)[0]
             return self.objdump_output[cmd]
         except Exception as e:
-            bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
+            bb.fatal("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
             return ""
 
 def elf_machine_to_string(machine):
-- 
2.48.1


