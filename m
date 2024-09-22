Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B93CF9C6F
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11627.1726994528375675191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yVe5t1KF;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5344ab30508so3845386e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994526; x=1727599326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJNo4wGhLEtqK+sIgiiDtzQuGcRIfZ4uZOnsGWSPLew=;
        b=yVe5t1KFNcnx760fNLcAQL9mwKiRjJlURbzleT+Q38wZZHhZy2ei5SGebIiYQDddWV
         LTZMNX1zA8v+Q65bn2tNXzbyGvMqgcxgsQI2Y8sMfIJn4nXwmHacW2p4TxVi5vmlGbiJ
         kAA6jBItlxR1ndPceVax7kOp6fpaxKbUyW+sLamEYLUHsGFN/r6uJ+j0XM2lApVsVp1l
         QtNySVj6JOEQ8HJiOdTgc6Y9GklCeTvtgApga7r8MbdokPJSWPW/DYNWg46G9Nyz+Kty
         nXACMrOu6Mg39bXY3BOVnHBxOwel3X2/ASzuxxBkEk0m/qJ4ob/I+ajhAHLH7cOFVUdI
         0E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994526; x=1727599326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJNo4wGhLEtqK+sIgiiDtzQuGcRIfZ4uZOnsGWSPLew=;
        b=Z3vUInZQ7/hs4fOC8WqeS3MLO271mkeCLFk52u0tq6eLsfG38WEK8+af/F6KFTNpdy
         odzc6tBbf2mVkzaijg/EyuSBNPZ/99VKjiEXtcd9g7/2dKgB0Iicgp19AUDzddJGy5RN
         4LHQy8rLmSRJU/QmDkrB4suvj8n2Rc5IztxX8NzCWnUZvn1gedzVlah8xFAs/Sckwvzn
         dn2J3Ti2U1MIyCWZ/7qv9PXGPg0Enz8jmrzJ/gwVFqhFq1AtgquiZnq27VCw6yiMHRG0
         c7h35MXSoCmMfaI8TqJ77IFO9nrXVbLAa/7VLI288bZQDmUE2tS/JhpB08Kra/xyJ3Tn
         vtiw==
X-Gm-Message-State: AOJu0Yy3rDz0DUcPby6Ii3an7yZzlmvG8te+8eNywatepdIi/oNveun1
	PtCP64bTXgCQl8HiSPOQ60svhuKfxoDtz30rgu6YAuH358Ow8xtt1P2SD/f/3rhBkRR2ToBzlM+
	lpB0=
X-Google-Smtp-Source: AGHT+IH9lwDe+0/g7jNm8vXsUQgLuaTk1BX1RFM27DCHyM1D+uOHxWcMsQDPWMRaO0i+BLS+7OhPIA==
X-Received: by 2002:a05:6512:2807:b0:52e:8161:4ce6 with SMTP id 2adb3069b0e04-536abb649afmr2662940e87.25.1726994526447;
        Sun, 22 Sep 2024 01:42:06 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:42:04 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 05/12] image_types_wic.bbclass: set systemd-boot and os-release dependency for all archs
Date: Sun, 22 Sep 2024 11:41:21 +0300
Message-ID: <20240922084128.9648-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204777

These work on all archs not just x86.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 86f40633eb..e02eb0b367 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -110,7 +110,7 @@ WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', '
 WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
-WKS_FILE_DEPENDS_BOOTLOADERS = ""
+WKS_FILE_DEPENDS_BOOTLOADERS ?= "systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
-- 
2.34.1


