Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB9EEFD20B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:04:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41711.1772010266691477151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nI5RZw/0;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43767807cf3so4774924f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 01:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772010264; x=1772615064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPvdmwzWzFgmr9qW4D9ClAEa0ISeyyh97nnmH1VoEOk=;
        b=nI5RZw/0Aw+YsAqBKX+ecK1bsVdPkGgZZijIdJSXbaYmsdnMuF0NLs6t90Aei3w96L
         EuBKd8kbO2xp26Ymgl1Cco8K7iLZM2LOYb5IANrz5ZhhayX6/j28yquJRvv5BXHlsFnO
         v/Sb8vRUmTe08s+pLeF4KFy5f5pwzx+AiN4+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772010264; x=1772615064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPvdmwzWzFgmr9qW4D9ClAEa0ISeyyh97nnmH1VoEOk=;
        b=Sttgn9JkamOMn8t+yMTCMUbmfbKKJbPR14VxyWWAE1mhRHbkWrvnaN0N0LKRyF3eDL
         EQ30MiePNZKiV3zWP51T++kvJ4JgMxWom3Rkna0oq3lINsQRG+xN7Y/qRVPvvI9BJINo
         ler07upo2gtIKc+POrrylqeIiwUOTt0UWitB+pm2BKuDnmSw35riomBsGj7mekHXeTJd
         wSPGKU9XlTOVZ414rjZUq5FVsqzKd8pudoM8d1huHj6F6j9wDH1yYXfouFpZqYZU+Nt/
         SOJCMTI0Uq4YDAulfLvM6R27cdvhYDYlzf8ni6PhYRHAJLgI1Vt7IUyXnzX73o8/xtmd
         YiZQ==
X-Gm-Message-State: AOJu0YwBVmF7bqHBr1b9HG/DI5SS7tLAZlKIyEGCRl5Qfzz/4OCV4oHj
	aOy/TGWUPnNiybz6uKToB9xC8hXtMZpMY82XlJ65NGMcWYTp0Fnx5CGn8IHCHRbs//iu3aOv3dY
	+4tNe
X-Gm-Gg: ATEYQzwrTYPmAyf8DR7VjL8f21deU7e7+l9tsPbIr+a9bawwr3og31ukN3P83o0YqjL
	SBtBLqiscvWShc4I1jU3A9ZaQD2duJ2s4JeBc1HPvZzPsMxWhdKuBoP/mR5SNbdhtT5979ZowVC
	tlND6Zd+nP8JTkpM4H/MkSDp2ku1DMyxuzEzIGNedssBPNMlaHt2iyhQvhccwxjMrJ/QOssHGvc
	XaSCoZwTSQiX7DqobnEmoYn/Yu9Ue+ZHOviZVrSyNBj5zdt/VuuxpqvHDO7NN8HdkrEhCScShJd
	/G8swTvilTDhCQCftRHxW/J7U9ZJ6gAx1z0gNK/Zz0CONbUR4/HxgRRz+R5Ar+ATSOs24/LHhMj
	HhnLTj/N0RgnSgffi4L3yaL4hVDfPIx9Btnrv3wBJRmN9Lsel3wKGgrL6dgbjciTGVxgZIcv1MB
	6cBeRtgeATBQIY3jp9Hp46Z6O8K3fR0D/rIsWI
X-Received: by 2002:a05:6000:22c3:b0:439:5ebf:df29 with SMTP id ffacd0b85a97d-4398fb2d130mr2850394f8f.48.1772010263854;
        Wed, 25 Feb 2026 01:04:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff1csm31759641f8f.20.2026.02.25.01.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:04:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-certifi: Upgrade 2026.1.4 -> 2026.2.25
Date: Wed, 25 Feb 2026 11:04:20 +0200
Message-ID: <20260225090420.1631450-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231943

Upgrade to release 2026.2.25:

- Updated dependencies

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-certifi_2026.1.4.bb => python3-certifi_2026.2.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.1.4.bb => python3-certifi_2026.2.25.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
index 7a753f5b2d..7034f7a6f1 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120"
+SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


