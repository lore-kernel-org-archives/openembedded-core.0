Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15229CD6E5D
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 19:13:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3040.1780427599838045014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 12:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dofvht8G;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso3748065e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780427598; x=1781032398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zk07+QTQ3IRkfUHEWA+YRTjnn6AOLfAOtY9dVtE7U4=;
        b=Dofvht8GkJVISMUEQ2j/FKgiThKa5dI94sl10bNd7czfgSXAi5jNTAWKWRF29VWqtt
         LgBCBsFYopX0FcSTHtqvM0lX0HGZq+4jQROq85R0YdMCENYQHHyj8FFW5X5UJnApTL40
         9IVKc7O/14RP7T112vqpM55KreIC8uHlCwQIruFUnlrnPTLj8kE18DAM2KkUzYIvLgcF
         k17CpQQr6Q5qjSN8ySWWBwLGZSWAsMkgwFu+8Kc40f9I8AUI85BvM4Agkn+c5+deVmyk
         mGbMdaWYthp0fh1/hX0WdYrNURV2VZY3TJpaI5TWtcjl2LFJdQu93nk16sfi4l8d86L+
         JMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427598; x=1781032398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zk07+QTQ3IRkfUHEWA+YRTjnn6AOLfAOtY9dVtE7U4=;
        b=XU8cB784sTd/P6oZiQ7e43dbpyNIjXRz8P46zc0/RNdzHEdzg6hdkflujyqZxYlpPi
         p2BRR0njxtr7WOcvDjr8o1bKHKpeMjyizhTRg9Gr2EptmoMshyHsUiBdjaDPBvtLy9wg
         GFr8uehldaHfFAq/hImXGvljnFtNGw4R2WYvGvyc8i69apnsK1ZHsXcTghI983xtGIXB
         7ag8MzmL1/oVdJRBvHcy2IUohu1WY01BlC3BM/OKFjpDZlFz4ZkjwYvCoz1Jf0XXH2pr
         dtlgxUNtypdbPMMQjO7q5tjvYte6SJ7HnR3xfwu9n5WxBp/1e/wXz8qt3dgSudFPS1fX
         2nVw==
X-Gm-Message-State: AOJu0YyInHhNaCnv4ilY27otCUBhsv+BQRMKZq6PShbZwXn92wkeSvMY
	Ut1SPaRn79y5VoG+N2EXKtnTj0HWe+ndg6fOL57zRfRaHZGZPiWKEfDdBpMlDw==
X-Gm-Gg: Acq92OFncn/ae5FuLeNEPlxuP3WjxWKzvO63EbCjTV0gTL7DAfn/Icw7JaqZwkeIFx5
	AsBo6XZwitppv/YxuK2zaAA60LkyW/wrl7Y03QJRpfv4zc9HDfY3SPCbJzhIoCDCXgDi6d/7iB+
	gOeHoHBIPEgR9SoxYMhuemKXxiZiLWGzYDPM0bOwDdw2VR+bPt8mrRRBZg/70v7KW7HwmzMdZV5
	JblWJw6kDPzgMDMZMjTdWyugtUn5Go5clZWsq/ikp3RKqnYy+ufVjmH0PK9jMBTTnhdntDaspmB
	LDfnVe6U01sKaojn2D2toEyjytOsAQIg7Dd7sfvCg/Sjg4jW1ZdLntttowvbvVsxtt8aJCGdZgb
	NAu3v7jD1H/eORg2aJxDAoEJFoOUI3yFkxOs0XfvbKoZoiTSV/A0qszGfCgCPINM2pEbm1Ockhr
	AXOBw10g8JkSGRBLmDjU8G18uaszDQmyI8cNPiWU0ZW+K5+nK4OIWImm/PyV442U12iAIgrg==
X-Received: by 2002:a05:600c:8b38:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490b5e51b8amr2908685e9.20.1780427598127;
        Tue, 02 Jun 2026 12:13:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm1282853f8f.25.2026.06.02.12.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:13:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] selftes: test_testimage_virgl_gtk_sdl: run only if gtk or sdl are enabled in base config
Date: Tue,  2 Jun 2026 21:13:12 +0200
Message-ID: <20260602191312.3257535-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260602191312.3257535-1-alex.kanavin@gmail.com>
References: <20260602191312.3257535-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 19:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238069

From: Alexander Kanavin <alex@linutronix.de>

The test was forcibly enabling both gtk and sdl in qemu and then running the test.

This changes the logic to skip the test if neither is enabled,
and run gtk and/or sdl tests only if either is already enabled
in the base config that was in place before running the selftest.

Together with disabling sdl support in qemu by default this effectively
skips the test on the yocto autobuilder, resolving the selftest
failures seen with qemu 11.0.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 32 +++++++++++---------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index a3c3126036..d332dac707 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -249,25 +249,29 @@ TEST_RUNQEMUPARAMS += " slirp"
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'IMAGE_CLASSES += "testimage"\n'
-        if 'gtk+' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG:append:pn-qemu-system-native = " gtk+"\n'
-        if 'sdl' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG:append:pn-qemu-system-native = " sdl"\n'
+
+        if 'gtk+' not in qemu_packageconfig and 'sdl' not in qemu_packageconfig:
+            self.skipTest("Neither gtk+ nor sdl enabled in qemu-system-native; the test requires at least one")
+
         if 'opengl' not in qemu_distrofeatures:
             features += 'DISTRO_FEATURES:append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
-        features_gtk = features + 'TEST_RUNQEMUPARAMS += " gtk gl"\n'
-        self.write_config(features_gtk)
-        with mock.patch.dict(os.environ, {"DISPLAY": display}):
-            bitbake('core-image-minimal')
-            bitbake('-c testimage core-image-minimal')
-        features_sdl = features + 'TEST_RUNQEMUPARAMS += " sdl gl"\n'
-        self.write_config(features_sdl)
-        with mock.patch.dict(os.environ, {"DISPLAY": display}):
-            bitbake('core-image-minimal')
-            bitbake('-c testimage core-image-minimal')
+
+        if 'gtk+' in qemu_packageconfig:
+            features_gtk = features + 'TEST_RUNQEMUPARAMS += " gtk gl"\n'
+            self.write_config(features_gtk)
+            with mock.patch.dict(os.environ, {"DISPLAY": display}):
+                bitbake('core-image-minimal')
+                bitbake('-c testimage core-image-minimal')
+
+        if 'sdl' in qemu_packageconfig:
+            features_sdl = features + 'TEST_RUNQEMUPARAMS += " sdl gl"\n'
+            self.write_config(features_sdl)
+            with mock.patch.dict(os.environ, {"DISPLAY": display}):
+                bitbake('core-image-minimal')
+                bitbake('-c testimage core-image-minimal')
 
     @skipIfNotMachine("qemux86-64", "test needs qemux86-64")
     def test_testimage_virgl_headless(self):
-- 
2.47.3


