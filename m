Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A85CF9C79
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.36187.1727097263096424236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nnIn1BRH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7198a7a1c01so3877914b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097262; x=1727702062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1l+gcRysDaYLO6ri5mZ3AX7FCx7Gfj83tSWVqFriqc=;
        b=nnIn1BRHlBPsx3to+7SzT3HjbsFOnVu7uu8vMg0hZXlRkjXcyNDNLq/bagdjPCIIml
         H28gjLKSBRO3mARLnux7dMmix66u6v+m0p1CXBtOEV5gFXg9EwKIttSjTu6RpZUnLOgB
         rgpcnjAJcyefNcbqXFLKm73U5fcX6k/pCcrgMdVjhRLjR1YQm9wPz6yGRVC+xYIJrPly
         7kzvP1bMFgYOpySPMOhmEcOyHF5gU3Xu1lRRy/LWgS0wGYkb7hcdOufWribCqt1SgeZV
         vuDWN4sFe6b7nT2zeE4tbJlCTlprtaz1BXydGr3kS6IKQ1i6flBBc5ezwbjr51H/Ap3v
         t8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097262; x=1727702062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1l+gcRysDaYLO6ri5mZ3AX7FCx7Gfj83tSWVqFriqc=;
        b=Rgo8cNX5jcCpgWfMMX822VTJo0daK9OYziuTRI84t3WhuM13hwRHBpY93f0YmlVRmR
         U92AWHO5m0KAXiQAgwL66cRbWkMcqQaCmz+LRzHSHMmoOS0XdeqObpbjjPQVRRS2gceL
         /5EcES6JfBt3F8Aqz2x9/a/aPDIY9KpJHREqcJ5DnMqy46tceiBbXfU35wiV7ePjPsJg
         22w9JVkjqPpdx7D2tPuXzDoFEG+d1DB5rNYi6b744RDONfvs0g4fKUMN6JKcQwQPyKyq
         LQOhUgqPY9EgKnzXeODI3lj0Eilqwln+gRlHeyzQ9puqP9tDeciYWdw2Hf16kzXO0TeV
         Om8A==
X-Gm-Message-State: AOJu0Yz7ZivoeYrNW2FXGgF9JYjKk2Z1wPD6ppw0dS/jpA+/+09AMoEv
	QSPatIAkM89dkgHuhcaw+lmNo467rhxfA8tylempVPdQqN6EjQRGYuIKzVA0lcXBo3affbcouAn
	4yfE=
X-Google-Smtp-Source: AGHT+IFXHTraDGgsAqjgNa4ZBT7etkwYtBjA1Ii8zGHoRt5r8pHLGs2Qbv9kos8KRaM6+5Wb6ll3qA==
X-Received: by 2002:a05:6a00:a90:b0:718:dd80:c2bc with SMTP id d2e1a72fcca58-7199c9df5c5mr18393309b3a.19.1727097262226;
        Mon, 23 Sep 2024 06:14:22 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] runqemu: keep generating tap devices
Date: Mon, 23 Sep 2024 06:13:53 -0700
Message-Id: <5215635442949a62f502e839ddf1f12e790e5e37.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204818

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

(From OE-Core rev: 23876576d054ebbab9b02c0012782aa56feda123)

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ba7c1b2461..8a417a7c24 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1150,16 +1150,20 @@ to your build configuration.
             uid = os.getuid()
             logger.info("Setting up tap interface under sudo")
             cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
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


