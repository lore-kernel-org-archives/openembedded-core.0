Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C40CCF6495
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:56 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.45590.1727661475025276538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZtBGSekA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e082bf1c7fso2802134a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661474; x=1728266274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeerIeTEXIsaGYSk5l2BSxk9TIKE+Z9lgxA/DZd9fUc=;
        b=ZtBGSekA0uDIciLC+PxPHq2h94oQz1aruSPiL/DzVL+8V5vnjmtFmSsNoxljypveQ8
         zpoCFbkY7uiwCTKMfEa//aP+RGh+OngeRO2SXK5XjbAPBV0qw0uzZQNcKPOIxlnjTHJl
         9ba6wmAumWVTLQJ84oldxpXeqRDNmt6vtHk92iTIfmHP6ospNXKZgECe8f04pjYfxYvv
         wtYo9ntqO+4+w300g/ysyE6dAjPpP+UTUsmSMTOgQsjy9C50PnULuigLyqcPCx0TWgib
         vasetHByBg4WoV8VuLhUjs2W6XyWfHEUpdavnYSm2gtsnbX7jgyp5B+r9UwLDqH4F1eK
         8DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661474; x=1728266274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeerIeTEXIsaGYSk5l2BSxk9TIKE+Z9lgxA/DZd9fUc=;
        b=UhUhrc5Ix/sBoy51IdPFBDlgkutDxh9S6pWqp2MszO0quZ2N08OW7lYZLK/UIfh379
         wUUtJ1gzLUfPnYWZUDZZww2lXRf7m8d68cgE4ciPqdiSFndO4KMvtcc3QFfYbhtLPoa1
         dcQb4+4uR/iEf7uUR/4jNrOkC7t1u/REeQnCLT/GQXks8bzU/pWvPkMl918RZ5kUxC5T
         PrPiPSwugHLPEdlACNWhLW9UFmdil8o3BNfeoqMlnOEItSdkXnvizPKEMhOECPeyS83m
         8IW4Be+ybR+eLcAE0JjVWEOikrf0DmS7nU/IUTMe4EQBNQyDhQGUjsqBvuFBpE4PjblU
         oLUw==
X-Gm-Message-State: AOJu0YyOk2DRsNfRgaqNuWrauTz8j2XPq30OgbE+AWZgMpBXHlQHD/bU
	yNdv77d/1q+0qF+zc15bAcv9Qn6IpeRjAJASn1NpcvntS8LKUdX9ukGDRQbeMwqVHgqRKXyJ9rE
	S7FA=
X-Google-Smtp-Source: AGHT+IH9J4VNAHMJWdlpylU/hFM80aBtlFY+LbpyUP3XbsQHQHSvxDsjh6EwHdkYGAxZBc2HJNFgQA==
X-Received: by 2002:a17:90a:cf02:b0:2d8:8f24:bd88 with SMTP id 98e67ed59e1d1-2e0b89d4d5bmr12148129a91.14.1727661474247;
        Sun, 29 Sep 2024 18:57:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/27] runqemu: keep generating tap devices
Date: Sun, 29 Sep 2024 18:57:09 -0700
Message-Id: <ae4e4fb703f63402cacbef772e70082e5760f78a.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205076

From: Konrad Weihmann <kweihmann@outlook.com>

in case there is no tap device the script tries to
generate a new one.
The new device is then unguarded for a moment, so
the newly generated device could be acquired
by a different instance or user, before it is locked to
the instance with acquire_taplock.
To fix that keep generating new tap devices in case
the lock can't be acquired up to 5 times.
If no tap device can be locked it fails in the existing
error handling

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23876576d054ebbab9b02c0012782aa56feda123)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 69cd44864e..fe395d1bc6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1195,16 +1195,20 @@ to your build configuration.
             uid = os.getuid()
             logger.info("Setting up tap interface under sudo")
             cmd = ('sudo', self.qemuifup, str(gid))
-            try:
-                tap = subprocess.check_output(cmd).decode('utf-8').strip()
-            except subprocess.CalledProcessError as e:
-                logger.error('Setting up tap device failed:\n%s\nRun runqemu-gen-tapdevs to manually create one.' % str(e))
-                sys.exit(1)
-            lockfile = os.path.join(lockdir, tap)
-            self.taplock = lockfile + '.lock'
-            self.acquire_taplock()
-            self.cleantap = True
-            logger.debug('Created tap: %s' % tap)
+            for _ in range(5):
+                try:
+                    tap = subprocess.check_output(cmd).decode('utf-8').strip()
+                except subprocess.CalledProcessError as e:
+                    logger.error('Setting up tap device failed:\n%s\nRun runqemu-gen-tapdevs to manually create one.' % str(e))
+                    sys.exit(1)
+                lockfile = os.path.join(lockdir, tap)
+                self.taplock = lockfile + '.lock'
+                if self.acquire_taplock():
+                    self.cleantap = True
+                    logger.debug('Created tap: %s' % tap)
+                    break
+                else:
+                    tap = None
 
         if not tap:
             logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
-- 
2.34.1


