Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89B9C001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:44 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3856.1688092179300309734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vW0cfHCD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-666eef03ebdso880590b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092178; x=1690684178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pNeocxh0lB7vooBa6npfgqXuZ4dY/Z/AOMoTzvWKws=;
        b=vW0cfHCDGm2pL5XyJGys4Nez9R1SjKiFhwHVbsiNdoirOt5jAKMZZbdM0hbh3jjeOl
         35ABylzmZJPpelGu4j3oBePizch5U/sOroTZRXdu3UdFM44XljBFHMInPe6Nndg13q6+
         pBEDlAQmIQKwQOElFwll5ZCMIY+YsBzfwf/GMRYpeZORV3mmjskHr39maeoeO2GTfRiJ
         ZWwSzDeK9caOMUiLzMGr3StV1A7v3QKAV2hi3VzsHgy0JQdow7KIUDsR4hjM8SVsm772
         GpGeFew6nWrYaYiSd/kwGLM91S6+JS7jr4tapOOk7BD1gpMJhW+LAEFzYt/GkcWE5Nzv
         eNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092178; x=1690684178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pNeocxh0lB7vooBa6npfgqXuZ4dY/Z/AOMoTzvWKws=;
        b=HvTKj0hVj8/5Z7qW970kD0S93fwEqu0FoTmrrJeFO89OGMbRyPI+hUW/J22qXLmoHq
         lYvfPwCkblpwBj6knC9oS6qXfd88hiUbnQPTraEbGvS7CakhSQT/IzgQVZgZ/U9ULA5H
         otvXAT5xgSj07KXuLsq7bX8oG+08i6j2+55pPPPe6jrg//g3Opfm+E4Cg3QGRzuAbqWy
         OAwBpC4ba79FWQ5KfLT+T0u5VeC24lCYStAxbklkaLG5euTPyurn2pD54IJNoSy7Np8n
         c7Zm9+NrdRC8LvJMaH4ngIvB2CnkHjKElVbhJzXMgzUmvppG1ta2KcN5pjlocfm4tiQA
         fdAg==
X-Gm-Message-State: ABy/qLYBTkW6GcmZcEmvu4DIKikBHkQv8ImajtdD6g8kuDJ7E4i2LojR
	xMJUh2JFc8i0SwBfrjsrAAjkyJwHSTVp6aElSEdhVQ==
X-Google-Smtp-Source: APBJJlHre5Kd8aIHAEI5MOQ0wx1DSnbT9lfNsoXXMyUgDpZxUmKs088zyT77MdPs4mXwPmvpLFvyLw==
X-Received: by 2002:a05:6a00:1352:b0:682:4b93:a4d3 with SMTP id k18-20020a056a00135200b006824b93a4d3mr2004731pfu.1.1688092178262;
        Thu, 29 Jun 2023 19:29:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/30] scripts/runqemu: split lock dir creation into a reusable function
Date: Thu, 29 Jun 2023 16:28:52 -1000
Message-Id: <811e24cf68c542d38386f83eda05d7efe3e5e4dc.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183656

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 004d6bcb067ecf1d796801fa43a98820c4efd3c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4c06cefbff..50224f2784 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1083,6 +1083,17 @@ to your build configuration.
         self.set('NETWORK_CMD', '-netdev bridge,br=%s,id=net0,helper=%s -device virtio-net-pci,netdev=net0 ' % (
             self.net_bridge, os.path.join(self.bindir_native, 'qemu-oe-bridge-helper')))
 
+    def make_lock_dir(self, lockdir):
+        if not os.path.exists(lockdir):
+            # There might be a race issue when multi runqemu processess are
+            # running at the same time.
+            try:
+                os.mkdir(lockdir)
+                os.chmod(lockdir, 0o777)
+            except FileExistsError:
+                pass
+        return
+
     def setup_slirp(self):
         """Setup user networking"""
 
@@ -1101,14 +1112,7 @@ to your build configuration.
         mac = 2
 
         lockdir = "/tmp/qemu-port-locks"
-        if not os.path.exists(lockdir):
-            # There might be a race issue when multi runqemu processess are
-            # running at the same time.
-            try:
-                os.mkdir(lockdir)
-                os.chmod(lockdir, 0o777)
-            except FileExistsError:
-                pass
+        self.make_lock_dir(lockdir)
 
         # Find a free port to avoid conflicts
         for p in ports[:]:
@@ -1148,14 +1152,7 @@ to your build configuration.
             logger.error("ip: %s" % ip)
             raise OEPathError("runqemu-ifup, runqemu-ifdown or ip not found")
 
-        if not os.path.exists(lockdir):
-            # There might be a race issue when multi runqemu processess are
-            # running at the same time.
-            try:
-                os.mkdir(lockdir)
-                os.chmod(lockdir, 0o777)
-            except FileExistsError:
-                pass
+        self.make_lock_dir(lockdir)
 
         cmd = (ip, 'link')
         logger.debug('Running %s...' % str(cmd))
-- 
2.34.1


