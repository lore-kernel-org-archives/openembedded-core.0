Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BF8C369D3
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:03:35 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.3324.1745395404684822969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lTGGlbeG;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso59507421fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745395403; x=1746000203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEjtpU4iEaFjXnZjYRoaSWzmu4EfgZRGCccvVsZvGCk=;
        b=lTGGlbeGKaT3mWHSAwhr81xmesVs6cHmb0N5WIms+xSg5eHK45sMwHxyYYK8XY9hNb
         ObS1jzSSmLs0B+7PnbqM8DENfsfGleqw5hVxvnpLPJld27Y0ZMTRtUZ9tA+zCHi/k3I/
         NIYwIiI11n7FhkPCd26TjfTdhQNb0pZsh6zTTK7ReWEZDRrfwrCTnKkkT/IYZD9Or4mQ
         vZuRN09Lz0e87B1xeaKBGRMGjrfSVhlHbM/AriQccKQTkXbxuMalmr3R5GKhxMdM3BwQ
         zgwjHUwsV5PYiXeC0BS08Fql0bWTRaHrS3aKLe+xZnQBZVBjXmu1R1lEPkbcVlUt+JDd
         9z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395403; x=1746000203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEjtpU4iEaFjXnZjYRoaSWzmu4EfgZRGCccvVsZvGCk=;
        b=eu0QZbxIb5zECz/4Z+HCoJjsrswLL7kMA9HvTJxZTkpal4sNUpVdiACTCV38XU0HCe
         Txg0p8EEclxnwdP4Eu9vg7cxC4IcTy2B2ESNK2j0cpHYMfXN+cp4dPpel2Lul0rXuQs+
         /xV7aLsBaKaGwl2bNj2YQm+vkfkuoY2mTeCf4ekIY1LKmahv5Sw0zXFwzHjKhBs/bLJM
         DWynzIy5HWYu3PqBrMMVyVt9xYSlotJuYlVhfaLO7RAcxggmhkSItnyUi2UgWji6zFrK
         lPtacjVImqfh1LNFEJcH/S+FhYY5sTkVNeuDqksRD3t0JhGOw44Y7g+tNSHVOaryCjhl
         Jc6g==
X-Gm-Message-State: AOJu0Yz6QOml6NRZ4Gn8O7xOrGwAUM2xwxjKKWhe5SCkqZy861tzexcv
	4RN3MW1Pf6XVT9/taFx2jcGx/bPQRDDLgQv+5xilMUYIUQ0HBngyI9SdeC1rmZcHkfGsOZjjSML
	Y+K4=
X-Gm-Gg: ASbGncuagznqePuYBH/9IAwSW43ma0j++Su8shh+ucAX8AyO2gALLD5FZ9yM6LDuge7
	1zJ+BOCe2eoeD91kbRE7InIqFdZCWHsbm/iPla7vhTo34VlsTCvlO55AAQSdpXG5Vp77adFUEhU
	2UFaCN1ZnyIpE0TY4DEiCkEa0XydbKNDk2C8w7+jJU96s0L++LJcooRpQcqVJTdjVxgvBh1uiWr
	VNnwvx/dwxNmVH+95K5TzIje1VgRmJYOgPMRAJcW36ERCZhe7oIjchidirRSZ4gXX7GK8Mh5i60
	XTO4z1Jw8MXgrfdO/KXxBMV8v6J89Q399cQR63RmCmVAlj5hru4+8Td19kAM3/sZZFeSKvPpWw6
	zksGKNIi5lhQQ9y4erYOnhWfdoGIx
X-Google-Smtp-Source: AGHT+IETV3Oaa3H17PJsF3xhEnT5aa67g1+nqdyHKEA+2suXWyi/Ts4Sw261qMhwQNfSajecAXSL7A==
X-Received: by 2002:a2e:ad86:0:b0:30b:d44d:e76a with SMTP id 38308e7fff4ca-31090553ed6mr69344741fa.25.1745395402826;
        Wed, 23 Apr 2025 01:03:22 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075f2aesm16951581fa.23.2025.04.23.01.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:03:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: poky@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/3] linux-yocto: build modular kernel on genericarm64
Date: Wed, 23 Apr 2025 11:02:46 +0300
Message-ID: <20250423080246.128723-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423080246.128723-1-mikko.rapeli@linaro.org>
References: <20250423080246.128723-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215266

genericarm64 inteds to support many devices which are not even
know at compile time and uses initramfs by default. Thus many
drivers can be build as modules to reduce kernel binary size
and boot time.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend
index 831cb556be..cda7fef449 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend
@@ -9,3 +9,5 @@ KMACHINE:genericx86-64 ?= "common-pc-64"
 
 FILESEXTRAPATHS:prepend:genericarm64 := "${THISDIR}/files:"
 SRC_URI:append:genericarm64 = " file://0001-Revert-serial-8250_omap-Drop-pm_runtime_irq_safe.patch"
+
+MODULAR_KERNEL:genericarm64 = "true"
-- 
2.43.0


