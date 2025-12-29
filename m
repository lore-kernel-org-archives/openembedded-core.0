Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54489E92725
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:39:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40654.1767001166863363239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HuQPbDGL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 30CF21A24E6
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0617760725
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A6B711979968;
	Mon, 29 Dec 2025 10:39:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767001164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=73Q1aupfQkLfFOY/qLkg/XnjK93A6ybfi57tHBKvdlM=;
	b=HuQPbDGL/g+rx81dNRcQiYf3xZOyDn1mMph6oiA65HNCb76BBYe/ZtihVGCjt94ieY6DwM
	3JdMatrFCgrr2el/RML7EAsFZnS/4EjJuCvfVwg6vw9gBTP3mzkPwKRTXZdMOZe3eXJUwC
	xkc7xoJMfLcyiwB0Jvt0+5Dmyh81bDUeRv4BcHr9dnAMEhrFwhmtn5mLjc3fqVx/+rWsdr
	5QKvyu8HUXOxDDZ/fqkl96zKk8gywKMijAgBsfHnBC9c5vvwRLGsdQMkyJ1qyNtLF6Og5n
	zcNZ7a9LmBkondHrv07RY9KLQJT3OGUZ0wArCEGz0NJXKs0lUBp2uNOFgbaLQQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 29 Dec 2025 10:39:01 +0100
Subject: [PATCH 2/2] testimage: Print last lines of kernel log on test fail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-mathieu-oeqa-15999-fixes-v1-2-b0681fa259a6@bootlin.com>
References: <20251229-mathieu-oeqa-15999-fixes-v1-0-b0681fa259a6@bootlin.com>
In-Reply-To: <20251229-mathieu-oeqa-15999-fixes-v1-0-b0681fa259a6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767001162; l=1197;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=ZSVVSOib35IBAKJL62TaRn8pIB3S8RzqBRoSCQ2m9Xw=;
 b=qIyiL4uKoQNS8MTK8enLreJvrmr0u0iU2m52Yd4beFEwQVdRTpLfeVEajHCf10vjbxdyJOR5K
 j9KBeacM7ZdCq5pEM+OHr4Nk8Sv1/HhZA5z5NFUSSN6kqweNLbeXb9P
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228592

Testimage test fails are often a consequence of issues inside of the
virtual machine, such as the OOM killer firing. Showing the last kernel
log lines on the main log output should help to debug these fails.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/classes-recipe/testimage.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 844c0f19ad02..20f51e930103 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -413,6 +413,9 @@ def testimage_main(d):
         bb.error('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
     if results and not results.wasSuccessful():
         bb.error('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
+        with open(bootlog, 'r') as bootlogfile:
+            bootlines = "".join(bootlogfile.readlines()[-20:])
+        bb.plain('%s - FAILED - Last lines of QEMU boot log:\n%s' % (pn, bootlines))
 
 def get_runtime_paths(d):
     """

-- 
2.47.3


