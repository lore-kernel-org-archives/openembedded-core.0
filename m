Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA268EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:00:55 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.11008.1686747653402550562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 06:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C1y9urm7;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9827109c6e9so76811966b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747652; x=1689339652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1W+Rv7Gz5jEWzgyfEIlu6KJ4Tbp3LwBI4fudUOZIzqc=;
        b=C1y9urm7DVdy4FyJkq31yeqnBe179ryGQDgdp19u09UzuhdBnRMYmzPLhG+SCFrh9k
         +Uv2yGU/WW9z6bts35/1NNWEKSYYlUB6qTNLcXRTpPdcv9Z2Z5iP4rZ9Q8f4RHwVD/b5
         ba9wJUNealTPkluLxJwEAa5fmNUZrFYtdOTjK3tiCdrtiz7y57NeN+6wxEpynFIGDu29
         Xxb3y7f/CNp0J+muLEyD2b67Ea+4CnMYjHXSv80KPXighyrhTLGwQdvNLOIL6eHwV1rU
         isV1yOL69rrqfrG9+2ZtBCwuigm11v9E8h7S2RMYMaNOeZcUMcHqa5Q11wqZI9SAfZ00
         gVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747652; x=1689339652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1W+Rv7Gz5jEWzgyfEIlu6KJ4Tbp3LwBI4fudUOZIzqc=;
        b=hAV62O1EOv1D0N7l79P4Ktust8lvq8drANSDxqQ79dP1EOVr0EOxzr4WqJiS//eQIP
         Qbcbh7pxIQDu97iGUbSB5pQqiXb6kktymrHxxTRuIX+7Km3fxu80KyUavcDgiDUfzlB/
         zM3IfZRH/9vNSaXMktukxVqfqb2IpijsxZxPu1gXDprjr7tbM/+KcDhw/Ko0+aCVAp6t
         CetUbHF3lXNZUfZppsWGJzdCF4rsvGGywfce8d6B/VcoDwmXcMuHPG/jly9nMrq4pnOD
         DUTYcaZg+u0XbKgP33OM7/D/I8PJ+XpWzFWCwzxFOL3yUpnchnStR6IAWNnP6sMCuHjF
         L7Ig==
X-Gm-Message-State: AC+VfDwzYnDFc9EE1CGg82xo0/hSNgi6Xz/RQDKWF14v8IQVXKBX7y1Q
	p3soRRoPC7yEN2RUF1voFzpAGruVEV86zw==
X-Google-Smtp-Source: ACHHUZ4zuBR6waX/WoHwJboVMdX1/mcEBAJjA6umW6iCASq0EIKnOUc+SWiUnFIjjVYKUX7+aZIVpQ==
X-Received: by 2002:a17:907:9403:b0:982:3db3:8d25 with SMTP id dk3-20020a170907940300b009823db38d25mr4481691ejc.60.1686747651434;
        Wed, 14 Jun 2023 06:00:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b5-20020a1709062b4500b0097456aa5fffsm8028189ejg.61.2023.06.14.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:00:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] scripts/runqemu: split lock dir creation into a reusable function
Date: Wed, 14 Jun 2023 15:00:46 +0200
Message-Id: <20230614130047.1587746-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182805

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 56715c3e1e1..cef5b8d4a4b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1087,6 +1087,17 @@ to your build configuration.
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
 
@@ -1105,14 +1116,7 @@ to your build configuration.
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
@@ -1152,14 +1156,7 @@ to your build configuration.
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
2.30.2


