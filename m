Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0637CCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 17:38:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.25069.1759858702713401381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 10:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2Hm0Z84c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5F1074E40F66
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35DD5606C8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93C85102F217B;
	Tue,  7 Oct 2025 19:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759858700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gcJFH7/eeVhtPWW/N4oPZXH0bJRM1l/YhWbSqqI3nyw=;
	b=2Hm0Z84cREwKiCZBGBGdfa71MxrRGoiXaNO8/o4hcMxblPf/9+soowq+NxZ5NKLFRBsMHY
	vnelYHl1XZq0A1eQPgmNUgDwDKqTZ7zGu9Vn4rSc+yoQp9AuEIu1YRKBUoisOFpmQyXGvi
	dIQ3xkoGCZzonIUQa8E5ivXLaDkn92ZdumgXEBzlIprONtvL2xKVKdoVZbjZUWKfsfl8eR
	Wac8fdKlbcjw/9i8IH4ivYwNRL8LTin+h5bbdBqEuk9uRywzknErgoYl4aEa/bCg5j8bFy
	che0xQfKgI73qYPi+TSrSbKLJhTA9Rvl52Pzl0Y1Hl2Rda7LomEk+2h0H+iVHw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 07 Oct 2025 19:38:09 +0200
Subject: [PATCH 4/4] oeqa: runtime: ssh: Manage any SSH failure locally
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-mathieu-ssh-fails-v1-4-a6affee3571b@bootlin.com>
References: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
In-Reply-To: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759858696; l=1001;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Pa1J7RzXG4WabxlOIut/knoREgaptJndptNzu52f6XU=;
 b=cFtcKDieDi6dOhlpPRPUI73sQ5YIcuFy2HhLuUvaT1pZXrSK07DXsjM0Op6n8xsK2EL61Un7p
 Gt7nE4FieRJCDYVBT9r0uwABSHgmq/oSN5YWJKOUA7PzDDesgevnaQ8
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 17:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224548

This is the SSH test, it makes sense to ignore SSH failures in the SSH
helper and manage them in the test body.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index b632a29a0178bf1c0015b84bca8e3fc3fd18fa74..3e9503277e39b281ffa7dc5f08f975ba2e96cee5 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -17,7 +17,7 @@ class SSHTest(OERuntimeTestCase):
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
         for i in range(5):
-          status, output = self.target.run("uname -a", timeout=30)
+          status, output = self.target.run("uname -a", timeout=30, ignore_ssh_fails=True)
           if status == 0:
               break
           elif status == 255 or status == -signal.SIGTERM:

-- 
2.47.3


