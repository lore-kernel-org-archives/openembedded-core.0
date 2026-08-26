Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F6EC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 23:35:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25206.1787787314141088768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 16:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oeZViikL;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1223373f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787787312; x=1788392112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKTYs9lyCcNRmYEsmaSqJfiCdy1eSfgmbWdv/G/vUMs=;
        b=oeZViikL7ZGQI48hTFcbMHhvhmmpNA5UllNlroh6SgztErwicgNVuAVywXi3cAoTI1
         C8UFg79QdWgIN+1ahheFFlNCQZZwag6gj/p54KRNsK2PNW4zuAwS6/CzPSOx9FvdJ6t2
         pyKD8gCAbaqTAzue2puqHKo9MOH3XlTx3qDiGx2S4sa60ztAOlQKyLZtRulVbM/vJZVj
         nsHNu6WdFTiM3xvHGToAcP0efjDwN1HO7fatXOdPFmOCXhkS3KqeyuZrMKwpLuNgjhmS
         oREMP1GyMZl2HCwwo01yk1nzyq/IJvP46VsC8illQREMtP+S34FlY/d2V1hp0TK9bYUb
         Tg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787312; x=1788392112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKTYs9lyCcNRmYEsmaSqJfiCdy1eSfgmbWdv/G/vUMs=;
        b=VRshoVMK0Qh0EQwxFGZ9bctNYdmPMWFmb0uFRo7i1oylfZCvSiEA6UqYo3F3wsd9fZ
         yhi/Qk/zSMUKIhQwIKHFZq++AkaTI/LCqu5rfbaXQwwI6KHsk90LNL3cY+dME1jAjwCZ
         i1xeGnp+dp1QO6zdmheZ3TE5mC64Dr10SkkeEqsIIDLrR/w12X+HhmpSowQB+32C8Sq3
         C4Lyl239mGfDz1Sc/hNMiQ0QazwV1F0eaSqOvKQVVRey43ftVk7AFbZpc+XL0lYzyY9O
         gr4so2AcBgnJf9HQrRVK8MgJ5VaKsQoXnJvMaoTct9C95E1Lh3HCFEjjZhk/YTKZi3ti
         qESw==
X-Gm-Message-State: AFuF++nUjnzeWBbKhGgPsRt83BtftjM5pI9/yIoJM4LFQqnvr4hvbHvr
	yWTfLUfsLzzTa7Yiu6LfoyX/1kqt8MtNJ7fhSvQwQIdN55i4kB76CpwPACfcUmw38S4=
X-Gm-Gg: AR+sD11zR3Qean0dkchN3WAhVvEiRguVE9J5dHBaHQP1EPmXpQtTQ5Pio55Kckv0I+1
	rS3CFdy6xr8FHV89Z1nyIeCNWyGVBQRpjJtIdW+BDFR6ceNOLUVyeBFt8WdaVlJ1eFACjfTBcQ2
	AOd7SCdCUeAgUU+MZtK7pIf9mdOLl9uMJArgCqXRndMPjgj1HJLgWCnYDn/bV2nw5p2II2VU0P8
	dONjdSY3VN8OkCiKsEBwl64BkS+SjsX7f3acWC8Cm+nnYZuVlYGw8kCXHfsrgjAb78DyZED9Z6D
	dVOClDrvTuw6DfnZMpi7+SVtkVq2KBTeLPMEeTHDEjAuEZuNjKk0auisJYjVrVar119W29PkpY1
	R6TeZRXSlypgtkOAWX85tuvOX3oiHAQATEosz8rhwm+r7jae8MIbtz+xy9aPny++gWchCr41rll
	8rKgdH26/a9qK6AmX9+3ty/JcKRjLdAK1DgRMBc/152tasUSJFMgeHULXp4TdGh7sZnJJnIRiSz
	u+lJblbVcg8WRK3l4nsvLrgXDvcXD0nwbkmPr+i5rGdv3CuXtz/KxO5g1AD1kUNheeX2KUvG0mW
	zUS5czUhWqEB
X-Received: by 2002:a05:6000:2f89:b0:47f:d011:f644 with SMTP id ffacd0b85a97d-482e26963f8mr12158740f8f.4.1787787312367;
        Wed, 26 Aug 2026 16:35:12 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm4586872f8f.16.2026.08.26.16.35.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 16:35:12 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v7 5/5] documentation.conf: add documentation for KERNEL_MODULE_INSTALL_PREFIX variable
Date: Thu, 27 Aug 2026 01:34:16 +0200
Message-ID: <20260826233416.37047-6-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826233416.37047-1-anis.bougrine10@gmail.com>
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244440

Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 72513296e2..93949c7ff8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -239,6 +239,7 @@ KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kern
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
 KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a device, usually set by the machine configuration files and defaults to KERNEL_IMAGETYPE."
 KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
+KERNEL_MODULE_INSTALL_PREFIX[doc] = "When a recipe inherits the module class, this variable specifies the directory to which kernel modules are installed on target."
 KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
 KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
-- 
2.50.1 (Apple Git-155)


