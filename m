Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EF8CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8328.1782310636008416485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qpPGWbwK;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a0e4f0342aso817613eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310635; x=1782915435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxnLKSe+U84H+E798KYZ1vrCSh9Q/KwJtgJMVpjVg1Y=;
        b=qpPGWbwKMioFeFkUX2avbnYn4GvWsghMmtrUnKdlYbS7GM5M1Y16QrpkJh+R5ALR8C
         TwgSoJz6R29MEapUI6WOYaJw2d39xxwGQ5KjnrXiesA0L4WsjxFS+/UcynWD3KyoRldX
         gUQIAQ+6fyMXBthHbD65KQtczwMGAEAupNLm0OHmTIWGFOXb29cSLsj329KHM+vxNYnR
         vQdAK2OquzQGhUhQnacJT+eaTKAQCK5m087BtaETijIcphCnpe1PAX750/W5pDCGIYfr
         tAG1zB5kin3T2vmwYHDUOuvDBuF3OsPrPCoM3nScaGEVovG94y+4b4UcLwwehGyZKtU3
         rlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310635; x=1782915435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxnLKSe+U84H+E798KYZ1vrCSh9Q/KwJtgJMVpjVg1Y=;
        b=Qf4b41AmSwDO6Elk04GRg/1Y1fUahrQkRLByV6EHBWQhlxgPyVhwmDUzkKFF9WP9YY
         EEepeLCQXO0qp+DLnF3wUptXcesbcA3wUvJrvcTfs50OgcrqjQ3UBIxtqjtR5lxXuvLJ
         oZZxvUSzCpAXZJQgzNOWN733kSNU/wL+qsMArlx3BGhvhATPN1vfoOmkC6vJU26RpikV
         rD7sHtpdf9kx4BQoXX7IEJiDxhuWFNl3pXRGNwqfaDnMqqojxH62bvPyuJhy4+NFm7lb
         tMprBGo874Lr2+hhustHen7fjZJ3DgmZk1etbt/EJHURLIWSLw7UhmYf88cVmBgiY+nA
         5NYg==
X-Gm-Message-State: AOJu0YyU20U8GRhGhHFwdDGIlzmxuLDRj+HPVPoWztRDEFIdrJTSB6Lt
	tgkKIO7tAT3NUpj68HrrwTEqBCsWBCzxRWmMALNkF/X3Y0Y9TExuH9QnHWKdvw==
X-Gm-Gg: AfdE7ckssm4nhEeeBxFfiXIA5HxkTHM/8mmA9I9zYCuAkKTQgLYV0vqW60GignELdnB
	DL0LoOCG05cAUK2Hr9dbmgH28LrJgnZCFQ7109e/KIKaNyOY8KhvRtLrXhJMF8XialMgp9tavLg
	+BkHEt6cm04D+Jn/fGA2t/1ILzJFixXa5lau4vloALAy7NHCKIcZ6VylbAybwbAgCJ+OJFiyMgM
	nXYfLb8+tmYbavwDhhRdfVwo+W0r05qzEKts0z0LAxqp1VcplVphwqYNBi5o/oitjNtTN8YDWsw
	aDL34T5I9d3NJ0a2MPS6z10KRvr8424D5HyTTBPqsZTyMOwp2cBkJvwtIERFwXGrOghoOVaJic+
	8g8+kGQdTqbpixdQVCDP03ZwO/gBFgWFanPejn6RuS/imVqGw9aUMVjwwaa/UfVRvyOWcubq55y
	hhA5/wTbXdDQDsQESaBJWH
X-Received: by 2002:a05:6820:6ae3:b0:6a1:1fde:c846 with SMTP id 006d021491bc7-6a122fe6259mr2206196eaf.43.1782310635194;
        Wed, 24 Jun 2026 07:17:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 7/8] grub-efi: Change to MACHINE_ARCH
Date: Wed, 24 Jun 2026 08:15:24 -0600
Message-ID: <20260624141706.2164567-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239516

Machines can change EFI_PROVIDER which changes the way grub-efi is
built, meaning two machine may not build it the same way. As such, the
arch should be MACHINE_ARCH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index e535d99710..8d8671614a 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -41,6 +41,8 @@ python __anonymous () {
     d.setVar("GRUB_IMAGE_PREFIX", prefix)
 }
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit deploy
 
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
-- 
2.54.0


