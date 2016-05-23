Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id A9D126FF23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 05:03:17 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id k7so30816584lbm.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 22:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1m5dUUJ9XzBLtL5nL36gT9fIuG8x0MOHRHFqEVHcil4=;
	b=vCdt99VC03Tjumx67lGMvpM1s2aYGI+rOh8SlR6T7nyEr3BTO4q505koRzCdJ1WyfT
	KYcG/B6Mccj+pdhjEqlp5bQYmARJA1CSpwt0JhT6yRfveBHAmZEnfTo2eVw/CFMf7us1
	CNMS/wERVYy6ppM5bYpqBP9nQh+/u7HuoK/SpB9gX9BjTtiUDmSt0V3TVOWfrTSFFVhH
	XMJLijqFIdAIDzpiMjBobksC/DTcdxqImCZOI59Kf4xpaQBG6QXUgeOYh4gmdle1ZMoH
	KoDDvW7zbnV52b5c3721T4CjPO3YwqEW/R5xLFCd3r0iRg11hE78QbZrkxFK9UdAOmzG
	w1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1m5dUUJ9XzBLtL5nL36gT9fIuG8x0MOHRHFqEVHcil4=;
	b=Nc3/Es8EOgOm8apm1oGUtAYVu+rSPmboXRWQDp9Lf8ICgJfMuJNHlUFIyJmiuzVMbb
	h6KpqC6uBO9/BAy3t3zrhH7CZdZcuqIrYxg+5Sd2tYp2TlimOv68+VueoFqAzS4Jekq3
	tt6Nht9NJWi32mws2wxZIfqQuOEtm6K0n5YQhYpLAQgX3YbO8OLcNQvQniO4KRKCD2w8
	wvsPM/QAzX58DbvfTCz6bSctoKtvPMTNoOJP+G4rkWh2QSQU6kxfygoAI/lI/4CBSKbw
	T9b2avHyKos2OA4NQQ6a8pYRfLWXW+8lobEh1cLsNqQpLZNscQx/vPoKheML7mjn/657
	zPTg==
X-Gm-Message-State: AOPr4FUDtdPnOrgzIfa5w+Hfu/uOuF8mwPvZAHDzMWBP6VciZnaoNl36ZZt+20Yy+UEfqA==
X-Received: by 10.112.132.1 with SMTP id oq1mr5026065lbb.100.1463979796826;
	Sun, 22 May 2016 22:03:16 -0700 (PDT)
Received: from localhost (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	uc8sm5293592lbb.30.2016.05.22.22.03.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 22 May 2016 22:03:15 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon, 23 May 2016 07:03:12 +0200
Message-Id: <1463979792-7559-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 2.8.1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [krogoth][PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 May 2016 05:03:19 -0000

In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
for images using opkg, which included openssl was fixed.

However, that broke the generation of the opkg-based images, that lacks
openssl. The error is a python stack trace, showing that shutil.copytree
tries to copy a non-existing directory.

This relates to [YOCTO #9040].

Signed-off-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6b0b260ce18a30d04edfb0afb7942b9f9a5480b)
---
 meta/lib/oe/rootfs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 95fd3ab..41f08f5 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -121,6 +121,8 @@ class Rootfs(object):
 
         bb.note("  Copying back package database...")
         for dir in dirs:
+            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
+                continue
             bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
             shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
 
-- 
2.8.1


