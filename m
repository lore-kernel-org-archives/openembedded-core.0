Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ABCCD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 14:12:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21330.1781100747260008064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 07:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sw8eJGUE;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso4687977f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781100746; x=1781705546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHiDW1vNqVVloyUF/FYJd1g9ko2dovEOT1v0z+ntSC0=;
        b=Sw8eJGUEfLAI/k0s13+9s1mAYjwGPGFLRz0sgE8QY7BzO6udLaDdmQN6yWhvSbavmR
         G2gfDB0XjC6ffkbGJ2DgAleRuRcJZe4E+MK50ovTOq/jDpkaMAHUsgUgeIYhSyW4W+8W
         XC7E39+E696f2qfGA2uH/DFkNsbpmfsP0PiFE5+IEFdnu4c/+tVYenWdZrr8GWtjuoeC
         lu9ISJMtNvLo60fKhMNUtUB01eFr7PzplRXpJ4NJNwuVD7YwCCuUf85ZFgI5tnT4xf+h
         44tei8sZg0fp8yXJ67Xldafqx0AItvNOV0C5s6yw8mukiFxa0w5vTNMBI2FwnCZtJRUg
         HGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100746; x=1781705546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHiDW1vNqVVloyUF/FYJd1g9ko2dovEOT1v0z+ntSC0=;
        b=S2HZcxhVfNuyWOB4gv37otBle+Ix6yKlCMaAgwPR1N9PTtNQsXOYeVRA4XYaVh/IJZ
         oUurY2Gll59EIrS0l0pY2PzB52jiGJ6/4qfuje4HO5lcixcNUVSR3BiS5XMWLKFxtqTk
         z4G/JRSJ4okV2gFPA1oevJMnNXuA3m+ImdpG0yWdrjGjbzdR+18FuJ5UnuPwA82oJzf/
         h5LB08pvdEuxtsf3BULdhNKw6PlOZ8RlySa7WIfFYSjm+F+CfsXYSGN+R+NayEdKYebO
         3Uawm5WEooFDaRDnjzBBJ7sn5WuSCK3eRRDvCrLaicrVNvR4okcZZ+PhTjgBfUQhB7yi
         tAsw==
X-Gm-Message-State: AOJu0YzJBLxREUaurd2/L4wAsjbTHoXQZj79eKwrQ1kVgjSF+97wuERJ
	vYhN0EfDHAhLPKdzU4sfg4YkOZ6jTNjgnYfv8byTIdPbmEuXDSllErs7qKrC9SKy
X-Gm-Gg: Acq92OHj6OmbJw8oSgSA8a40h4rMuyhNuLm/ZRSSkVlR2/F0CuaJY/bMiZ1LCxOeVG3
	cpd231ukTz4innzDjMWt4/u47Ztf37v2UHsny2Mp4BGKxsEMToQi/AZxYislQ9sii1BbwMxbSKK
	VIy7DJ9grVd8x5dD1IlRoltHEIyxL8KWqGVguM4S42pNg5H593py/vbC1098GZHmYGGBQw0XOqx
	6C55fTjILY/2ot2vz48q5MnU6ExnSLVx5hV4nvpFcaPQL+pRHNLPTdQ0SB0INHXFZ+Z5ThVrDTC
	m8IInwOZcjxR9EKcJbzkQ3+DJbQ+uduLQXdOnGjnN/jhVCVqZHeufo8wCqn+Dfl5OnCYbR4qkMu
	rWNORNDLIl6fi7GJdST6rlEbKBA84wI0jquFVB7foc8Buj5B7A4WrbxjvOxUuE/YPC1W5gyTO35
	S64Fa4sYoTlgPb2FL5H5BbdK0T5QGXplBTrWl3fdiPN/+wEuvSEieSYHjd3unUqBSQf0sEOxNqm
	XqzjWYk
X-Received: by 2002:a5d:504e:0:b0:45e:f302:95b with SMTP id ffacd0b85a97d-46030767c03mr28932056f8f.37.1781100745280;
        Wed, 10 Jun 2026 07:12:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm73090471f8f.2.2026.06.10.07.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:12:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] Revert "oeqa/selftest: test_testimage_virgl_gtk_sdl: run only if gtk or sdl are enabled in base config"
Date: Wed, 10 Jun 2026 16:12:06 +0200
Message-ID: <20260610141220.709884-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238362

From: Alexander Kanavin <alex@linutronix.de>

This reverts commit 617a0eb86219bb183202503e4f79c08030661f85.

This was merged in master, assuming that SDL UI frontend would be disabled next,
to allow update to qemu 11.x where that fronted has a regression.

Now that it was decided we should try and fix (or help fix) the actual issue
in that frontend [1], keeping this change would effectively disable testing
of the Gtk+ UI frontend (which is not enabled by default), which is an
undesirable regression in testing.

[1] https://lists.openembedded.org/g/openembedded-architecture/message/2393

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 32 +++++++++-----------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d332dac707..a3c3126036 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -249,29 +249,25 @@ TEST_RUNQEMUPARAMS += " slirp"
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'IMAGE_CLASSES += "testimage"\n'
-
-        if 'gtk+' not in qemu_packageconfig and 'sdl' not in qemu_packageconfig:
-            self.skipTest("Neither gtk+ nor sdl enabled in qemu-system-native; the test requires at least one")
-
+        if 'gtk+' not in qemu_packageconfig:
+            features += 'PACKAGECONFIG:append:pn-qemu-system-native = " gtk+"\n'
+        if 'sdl' not in qemu_packageconfig:
+            features += 'PACKAGECONFIG:append:pn-qemu-system-native = " sdl"\n'
         if 'opengl' not in qemu_distrofeatures:
             features += 'DISTRO_FEATURES:append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
-
-        if 'gtk+' in qemu_packageconfig:
-            features_gtk = features + 'TEST_RUNQEMUPARAMS += " gtk gl"\n'
-            self.write_config(features_gtk)
-            with mock.patch.dict(os.environ, {"DISPLAY": display}):
-                bitbake('core-image-minimal')
-                bitbake('-c testimage core-image-minimal')
-
-        if 'sdl' in qemu_packageconfig:
-            features_sdl = features + 'TEST_RUNQEMUPARAMS += " sdl gl"\n'
-            self.write_config(features_sdl)
-            with mock.patch.dict(os.environ, {"DISPLAY": display}):
-                bitbake('core-image-minimal')
-                bitbake('-c testimage core-image-minimal')
+        features_gtk = features + 'TEST_RUNQEMUPARAMS += " gtk gl"\n'
+        self.write_config(features_gtk)
+        with mock.patch.dict(os.environ, {"DISPLAY": display}):
+            bitbake('core-image-minimal')
+            bitbake('-c testimage core-image-minimal')
+        features_sdl = features + 'TEST_RUNQEMUPARAMS += " sdl gl"\n'
+        self.write_config(features_sdl)
+        with mock.patch.dict(os.environ, {"DISPLAY": display}):
+            bitbake('core-image-minimal')
+            bitbake('-c testimage core-image-minimal')
 
     @skipIfNotMachine("qemux86-64", "test needs qemux86-64")
     def test_testimage_virgl_headless(self):
-- 
2.47.3


