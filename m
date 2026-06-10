Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BE6CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 08:01:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15029.1781078497056490361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 01:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jUKmiAtZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b613a17bso63007595e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781078495; x=1781683295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHiDW1vNqVVloyUF/FYJd1g9ko2dovEOT1v0z+ntSC0=;
        b=jUKmiAtZJ62vzrj/swij1NlFyDe8KFbs94+PG6sCjPj2rs8S6DcpfjI27skdzEBZXn
         ZhD2lJa6Pfo5YF2KvVCuXjBHCsmOoxL7+0eRpPQOrfW+e0jlorAMK4Se1ozPvJxTWVhR
         SS+qxqPimfSJQ51tr8qrQiPnfe2/bU2q0K7WopiS9J/QUmejJY3FdoK0zqZZrsm6umdS
         d7Z+q8DAD9Ujn4H1gah31gWG4E5o5FT3Q8a/tCiki2MZsxYMNL+oFHOjeDSTxEOE9tW3
         dN6T1Rkidn03gGtaOhFELEen2Up3GNW/3ZJxqYiLOswgagnOVddDpE25Zg/BM2DnKhkg
         iRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078495; x=1781683295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHiDW1vNqVVloyUF/FYJd1g9ko2dovEOT1v0z+ntSC0=;
        b=q+VP6oqkw4Zpj9CkKAFwnwGXjcLWwFKFEUxaVqKrGVC1jzTKzacRvVrui/5S1I5Urx
         sALDFaFr0+5L8fhtLFpVrMl3OrYDxT/hygdsjn863BI54Qw/Y5HnzELtNhi+twrdC1pp
         nRGsACK+4pGBdHx3RDrVvhZEeSoghoaHTAKhVIJ+w+SINig9FIcKeVjUBqWZF8EaHUx5
         AFPKNqGFLo4Y745qCO/sJDG2yXJBaF5NHg1vUpsIWUD8k2Eb6nZA74mLG/OnswqsqZFw
         n8wpdyJhuvIktzNs59uye3t4Hh/VBgX+LSX6VsHpSTvZO/8i//sbQUkRjzRlXAZQC/Ng
         bZ5Q==
X-Gm-Message-State: AOJu0YxqD85Wyq72eUaOVuVbyuVIu1iQ9IKpZ1qnZ7/ObtUpR4SKZtRI
	/S+UZu2hcqr4m0lZYhxS0RQEq6lmZ9qFmAdrfsxZOk7lVbmLdgoPsbfFLQj9SiZj
X-Gm-Gg: Acq92OECK5wflgkhSDwLMMj89NPw6VfrUPepMy4SDaG184S4HUQumVP+FH93y6ekViO
	gahJE0OizQ15w4o1k/2W/YhtHdgAlIiWRQp2P3odC4oCUF7OWbFG9HtenPprBikNOEpL1X2OveS
	l5yyNaYRGHmr2Isqahy5vvxJwqn2F8OCYHQ3k4MolyzkuuUgNHad1N4yZ9+bpip9DPGIuoLEbcc
	ESGnBn+JscJtL/2mW1XTJ5K3LNuUudiaTXUC/S7Hl+slsgPgisvBMPtFzni4VTupOSpwVc6eT/6
	6U/oj6Vx1ZsVQ4eqe8802Sv6hVl+RzFEh8LRjRi9jzvSED1/TiOVebihLJ/czYSGB+nJEUFBLOT
	1+OaMdbiyCObHWc16Hprqcw+St9+vuQ5e4MBwOoY72PrMNyWeoJiFx8x2pFzhY/hrStkhBlFw2e
	O0ewNp19gKBwigZxQ5VRaDCufbjcgiO2G+Swqqv22ZRIpW4eAgcdb5iHcfNRjGpTZ3yGL2pw==
X-Received: by 2002:a05:600c:638d:b0:490:bde2:666a with SMTP id 5b1f17b1804b1-490d72241ccmr80182555e9.16.1781078494914;
        Wed, 10 Jun 2026 01:01:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e5a00sm537125725e9.15.2026.06.10.01.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:01:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] Revert "oeqa/selftest: test_testimage_virgl_gtk_sdl: run only if gtk or sdl are enabled in base config"
Date: Wed, 10 Jun 2026 10:01:30 +0200
Message-ID: <20260610080130.645648-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 08:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238320

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


