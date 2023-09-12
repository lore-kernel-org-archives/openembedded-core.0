Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B8CCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:32:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.22551.1694518365458070791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FFC2v2QR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso5665260f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694518363; x=1695123163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Trx5bdCgHo4gRojTzkTyk/pNuKRXpCcyyVQKRd0nT0U=;
        b=FFC2v2QRSB+EtXVQvp0xJQOgPHXeh8tTwR49R7l+V/YH8uVlwWQFwbirP2A/FxVC4n
         3hHjD1jJpO05gRdoXCLbksoQM2Zeis4Af9MKYD9+38W3ak+239ijiYZ/YZ2o1EQbYJOV
         x21RIVqKJCMKVflncXhFPHwbLL0L6Ix2nXFXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694518363; x=1695123163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Trx5bdCgHo4gRojTzkTyk/pNuKRXpCcyyVQKRd0nT0U=;
        b=nXRYlFdt2U3uV5s5exyKmN+gMr39896WINqQYRqGeeMHqN8NVg8MHINUBt/vsMsUEO
         DD4eWw3DB2CDiPiDXqjJrJS1zi/JNPOxV1HSit/ojUZ7IDySLFXZitdDEJzjQ8+oW3n8
         XNaGYg4TcZNYjT9EPQvUU4lQlbiZtbeS5vaXv4sYTWqQi2q468XXVERc4Kj2IJdBLxZ7
         7fuWjdtwgpJogpqFfMfPzgOr+hsG7CeHklgyoQHGHZ1ZrnxWbl5JOmBxdPLxaUHQRh3X
         pZVNO/fiQ7I8Qt962n9nMWcDQPn88gaT5JkBhffqcGldfRWxJsXgzgfnfpvXOMxb3SmS
         tKrw==
X-Gm-Message-State: AOJu0Yxu8sAovab9aKL03SX2mDaVggtsVc1K8aH6mT2RxJyGoR/G6mwK
	+nLtAph4e4IuOXFNyt5X8hBJX3JT0deTiPeVT2o=
X-Google-Smtp-Source: AGHT+IFxGY4P371banOmAMWgexgKKEIrq3HgpVFJTWPhpjqgTcoQRYKi7XdVyQYccKbmRRN6g3oRtg==
X-Received: by 2002:a5d:598f:0:b0:31f:b9ea:769 with SMTP id n15-20020a5d598f000000b0031fb9ea0769mr1539836wri.66.1694518363358;
        Tue, 12 Sep 2023 04:32:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c19a:2e97:b04:7abd])
        by smtp.gmail.com with ESMTPSA id l18-20020adff492000000b0031f729d883asm12606550wro.42.2023.09.12.04.32.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 04:32:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/runtime_test: No need to use append with TEST_RUNQEMUPARAMS
Date: Tue, 12 Sep 2023 12:32:42 +0100
Message-Id: <20230912113242.3994352-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187507

A simple += operation is fine for working with TEST_RUNQEMUPARAMS so remove
the heavier append override usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 57d3852d579..12000aac16e 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -138,7 +138,7 @@ class TestImage(OESelftestTestCase):
 IMAGE_CLASSES:append = " testimage"
 IMAGE_FEATURES:append = " ssh-server-dropbear"
 IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("IMAGE_CLASSES", "testimage", " + 5120", "", d)}"
-TEST_RUNQEMUPARAMS:append = " slirp"
+TEST_RUNQEMUPARAMS += " slirp"
 '''
         self.write_config(features)
 
@@ -252,11 +252,11 @@ TEST_RUNQEMUPARAMS:append = " slirp"
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
-        features_gtk = features + 'TEST_RUNQEMUPARAMS:append = " gtk gl"\n'
+        features_gtk = features + 'TEST_RUNQEMUPARAMS += " gtk gl"\n'
         self.write_config(features_gtk)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
-        features_sdl = features + 'TEST_RUNQEMUPARAMS:append = " sdl gl"\n'
+        features_sdl = features + 'TEST_RUNQEMUPARAMS += " sdl gl"\n'
         self.write_config(features_sdl)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
@@ -284,7 +284,7 @@ TEST_RUNQEMUPARAMS:append = " slirp"
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
-        features += 'TEST_RUNQEMUPARAMS:append = " egl-headless"\n'
+        features += 'TEST_RUNQEMUPARAMS += " egl-headless"\n'
         self.write_config(features)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
-- 
2.39.2


