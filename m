Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145F8F433F7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:54:20 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7107.1776318858494779169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YRnRpLJy;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so9089796eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 22:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318858; x=1776923658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0371+0n5gvAFCIRKnlZ0Gw/57QS47PLtod5pXxMGHkw=;
        b=YRnRpLJyTu3NJiBAgAwEJxpi+c6KO4i4RErAqUFwz45EehXbuEqidkf1UTrqb+wBJY
         phImYzgH9S0sQak1GeLRCCxwKtOh9NSHPc0X9FiECb5XL4UNpeEavPCN2cue0aVDalgi
         UwZ+INsQJlF/Yi6j6LDYEyBGJW03OWoy7zeC5HwAFI1hPXiHFiQ39F2LvpGm4Ksc+gAd
         CdU1gplCc0JjcdQW1YioLoY9ayCC5N4qJhtR/QbaLXTFkBg7aIcrrgHKntS12Ra2v8BQ
         trmm0lPGESp0XJ8kd95i2MKgGQ70vSTFXmixupdDegH52nThEMyYKxSYbSoscFYSdOoc
         wAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318858; x=1776923658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0371+0n5gvAFCIRKnlZ0Gw/57QS47PLtod5pXxMGHkw=;
        b=CxgYTb7vrhaXvms2lJZjT6eJ/ym2v1eNS6hPrp5rTJ7PXOsJm7zW0SkOl/mm7L4VxR
         gLLcSXMqGZ3wfOjiI9+CshPAcF5Nhm3W+ryDquC+bmW68+7ClmlTrIk+RZgfN6/1RlYd
         03aeVPtCHgPaqzUisYMAbUCu8Jb6nsL/tjEh0v1g4qVAPBPCoXpP7Hb0K62A9a3NoAlO
         WjpUNVlpPHTu2tkqYx/7FfViIq2kMZ1CA/5D38HW7lg/3CYgnF82PZAlkukI29BuTZ8M
         YfTxItnyLuQuJqR2xn0jCpeA+XTcyN107SgthUXAb3vqjfgdftgGHcBaQ3v3El06MmyK
         yl3g==
X-Gm-Message-State: AOJu0YzMFu5miCiItX88Fc4nCi6Ny0wNucaeqsAyOjwpCkfQfAk40Fp0
	TF5+Q5AVNdOY/33cyXjyOYanHiINHvM0l15OE5TFw5sSE6hQxfmU0z9jV6ZXF75Z
X-Gm-Gg: AeBDiesJaOoeVIdQDwPpkdoRYn9CP1j1rz1K03XtB9+OGsr6K6eV+GlHsVPbRCcxzbm
	ussGK930a/MNZzhyo6Mx6bE0yn8oYwFck2xpy59Zs7TbEVBBcr0Wv30bggD2q2cKGoiGzgqSV2x
	VPD7OfB1FiJSfEzTjQ1aCU2y5Zjc/Dv1ICdzAVdjE+VlFWLwsZ3siCk12olIDfA08LDG0zzcv5j
	sbZZvAmlgLDtWdhCP8QEvWh05VJjwy18axO0CDJEGintxMYvbuKogdJsTka70WpKK68C3FFpBKz
	C0mttYDvS/VnWlLnSRFpMW4XEfsTM74Wexgj5zK0O5ZXuOH4OOIwpc0wFAhN5ONxzhuXXuw8EuE
	2L2KO/Nz6qq3SWpMmKoP4ZYw0GRjYIqTQkI2E2d4RJadwp8evhZ42hwHQdpImKDZpNwTemUFNDY
	BmvAyIs/l7zDDDmuc/1g3prYfKptihKLqxXYEMW6DSH8Cl874Smy3OypxbwpuR96XpPHX0Zpm8n
	Wh2lUUn+ubC1OOiY6KXH/W1ubaYQGO6ZWcaGl2uKlS0uzzQ8I7QmHzM2f6bR4Z4m+wDsEYMo2Cw
	nwTEO7HAnKm1S3kZnwJA1UNz1X0WOWAoJ7aR2wKGu8UM1wBwdOQ=
X-Received: by 2002:a05:7301:4586:b0:2c5:220c:5673 with SMTP id 5a478bee46e88-2d586380bf9mr13468936eec.5.1776318857503;
        Wed, 15 Apr 2026 22:54:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm6060212eec.14.2026.04.15.22.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:54:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 7/7] libmpc: Upgrade to 1.4.0
Date: Wed, 15 Apr 2026 22:54:07 -0700
Message-ID: <20260416055407.795016-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
References: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235339

- Add mpc_exp10, mpc_exp2, mpc_log2 functions
- Fix mpc_tan/mpc_tanh for large imaginary parts
- Fix mpc_pow imaginary sign with real inputs
- Fix mpc_fr_div/mpc_ui_div zero sign handling per C2Y draft
- Add pkg-config support

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libmpc/{libmpc_1.3.1.bb => libmpc_1.4.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.3.1.bb => libmpc_1.4.0.bb} (58%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.3.1.bb b/meta/recipes-support/libmpc/libmpc_1.4.0.bb
similarity index 58%
rename from meta/recipes-support/libmpc/libmpc_1.3.1.bb
rename to meta/recipes-support/libmpc/libmpc_1.4.0.bb
index b3853fc964..78ce0bfe88 100644
--- a/meta/recipes-support/libmpc/libmpc_1.3.1.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.4.0.bb
@@ -3,9 +3,9 @@ require libmpc.inc
 DEPENDS = "gmp mpfr"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
-SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8"
+SRC_URI[sha256sum] = "3210b3a546b1cb00c296ca360891d7740ee6ff06deb02a27a35b20cd3c0bb1a5"
 
 S = "${UNPACKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"

