Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68552C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:50:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.8830.1685699421010756587
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 02:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SguQEBf4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685699419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VhKIhJfqtwOM8Y+AejSNXNUK81sjjOqIBdPMZkBilI0=;
	b=SguQEBf4uElM5GpLC8ABNTBhJGWsjEX4iGdiz2QQP9GR5Cvfl2CLwA0DNDccIuQ8zBS9C0
	YwaDxUQHENOm+E61my42q3p3CZ80BuMokRsHAW8m103dyQiI4BPSrj3Ntlm+5Si78eRnYw
	0OmojWa1lVDOTyAauCqrC9b5DRg2XudYNid091G9ePEVcuEFnrQNGpwYxdyiKYOMVadJDG
	WfQygOQFR2gStzPJ+0iGeUL22sGjRLtyDbuIUrJ6HlHk/iU8/G5AJlurqx6hsFDlqyHuU1
	3Qvc8ArPHOXYZhoYLh2zQ+ePxqqPtuL/2snWZWxDQMyP4QyH4oSjDvCvVhpQfg==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6007C0006;
	Fri,  2 Jun 2023 09:50:18 +0000 (UTC)
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][RFC][PATCH 2/3] testimage: shut down DUT later
Date: Fri,  2 Jun 2023 11:50:36 +0200
Message-Id: <20230602095037.97981-3-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182301

Move target stop (for Qemu targets: qemu image stop) later in testimage
main function, especially _after_ having access to general test results, to
allow executing some other actions (like retrieving some files) on DUT
depending on test results (e.g. : retrieve some log files)

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 1bf0cb450ce4..6b10c1db09f9 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -393,7 +393,6 @@ def testimage_main(d):
         results = tc.results
     finally:
         signal.signal(signal.SIGTERM, orig_sigterm_handler)
-        tc.target.stop()
 
     # Show results (if we have them)
     if results:
@@ -404,6 +403,8 @@ def testimage_main(d):
                         dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
         results.logSummary(pn)
 
+    tc.target.stop()
+
     # Copy additional logs to tmp/log/oeqa so it's easier to find them
     targetdir = os.path.join(get_testimage_json_result_dir(d), d.getVar("PN"))
     os.makedirs(targetdir, exist_ok=True)
@@ -415,6 +416,7 @@ def testimage_main(d):
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
+
 def get_runtime_paths(d):
     """
     Returns a list of paths where runtime test must reside.
-- 
2.40.1


