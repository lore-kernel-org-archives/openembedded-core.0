Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5135AE8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:39:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40652.1767001166378017897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ulFonO/w;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 940361A24E5
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BAEC60725
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBDFD11979962;
	Mon, 29 Dec 2025 10:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767001164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AK7F7cBPtpn3bspsSTJwXDs/yBwv8pEV5dVVZkt9XpI=;
	b=ulFonO/wKKvnkF89kAPHHl5J5lmvImkdXeO1HnbQZPLof84s1i7Ty2NkXbItTR530w3cne
	7aJAXxyuR68vTmWbT80/34r9V6NgOepNY+aNtSAnMhwxBYMUy+snrzb1+hXs2HXkoZIt/K
	bT23LG7roO/LTDePs55+AaAWXrI6Mh1hryq3tbKt87gDEJS7cL69dx7n7OYFRdOCAVnmEN
	M4QvO7vFsQfy/DI0UNlo9/WgbVS3QKjBcJFEQQNga+xXv3vecR80jeDR7SVAROU9yIAXmt
	YoZUOK+Sz3WmeB7UmxXlUZIHoefNpp1tiJH2w+teXL7YfSvSkZ9kfV8xxkOFLQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 29 Dec 2025 10:39:00 +0100
Subject: [PATCH 1/2] oeqa: runtime: go: Increase
 test_go_compile/test_go_module timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-mathieu-oeqa-15999-fixes-v1-1-b0681fa259a6@bootlin.com>
References: <20251229-mathieu-oeqa-15999-fixes-v1-0-b0681fa259a6@bootlin.com>
In-Reply-To: <20251229-mathieu-oeqa-15999-fixes-v1-0-b0681fa259a6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767001162; l=1492;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=CwpytfFXZ8//1GuBUOTiGG52tg99fFOCCcPitvCTyHI=;
 b=tsLxcDe72O1Rn09PI2Ox0m6Yd3QSeOSoRVdsgb0K860vWTebpeI4FngltPWqGzYdYUHtWyKN3
 tagctFLiHnIBOzQuwkV29x16GGKenENp/ltkkLPp9hUQQjJYzMVGXze
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228591

These tests tend do take a bit of time, and this is probably why they
have been seen failing a few times in the past months. Rising the
timeout from 5 to 10 minutes appears to help.

Fixes [YOCTO #15999]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/go.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index d4b69438a563..0c9c4ff4cd32 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -35,7 +35,7 @@ class GoCompileTest(OERuntimeTestCase):
             self.skipTest('go command not found, output: %s' % output)
 
         # Compile the simple Go program
-        status, output = self.target.run('go build -o /tmp/test /tmp/test.go')
+        status, output = self.target.run('go build -o /tmp/test /tmp/test.go', 600)
         msg = 'go compile failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
@@ -65,7 +65,7 @@ class GoCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
         # Build the module
-        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go')
+        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go', 600)
         msg = 'go build failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 

-- 
2.47.3


