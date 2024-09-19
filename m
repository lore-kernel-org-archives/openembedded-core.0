Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7BECF3953
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:37:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.21254.1726756663627106446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=poA9ML7Z;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365cf5de24so1200158e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756662; x=1727361462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJNo4wGhLEtqK+sIgiiDtzQuGcRIfZ4uZOnsGWSPLew=;
        b=poA9ML7ZjoBz0kPwZzgXn41qb/wDPEYwgir+6qTyPvQ0HDZ92K+TSXwbLxCN+eazez
         Hpy8ENlBmzNVqgA/Ys4ACrL7DdkSqoAC87b4p/VPrMFqvG2xbMjecaeFOmoe2Up3o0yf
         WrATtBbw8sOfJUE9ydKIRFURbxvmllyGw3589X1p2hVwK6dcrXeEPXoHdJ+A5Kv/mN7d
         Yi4xhHB+VjGWnQPsSSlORXji961Lex8QFMr9qlXg4eygcyu1ALrjulXlVhKtlPJT9Htc
         sV6OgYfvpR5UyMmilspuqAG6mGvhhJGg5rF3OgW0xPm4Y76+JYN9vISONFmkcU4I8s/s
         SPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756662; x=1727361462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJNo4wGhLEtqK+sIgiiDtzQuGcRIfZ4uZOnsGWSPLew=;
        b=cfr2sDIT04h+FFNJhjEIf8BDz+mpGN45xgodv93qQFc31h6Jv1QT3gU4cNrT9Saif6
         WPE2Y6JaehGntOYlpzMYfeBiXx3haBElyLuJEXwVPVjDq0bPfybBr7BmQQ7RIQHOnpJi
         Ib40YvuaeoyTxJ86AM9xZ+u+FTqen1TIY+5dQVGmogW7Hf6QVT0+TzZzseFfUgi24I9V
         Jb82MDkZmqI/AmyQGHV5Sx6e6rAuqAXxGg8SePwAWfcky2Ap3HBXcodNTcCvBpMsi+Jq
         Kfgd4Hb5XxnCURo8DE607kiqh7Jj+xllu96D1DOfTu5kvduocaDu6jEpGWmc9AlmvW3E
         WN0w==
X-Gm-Message-State: AOJu0YyTOsvi5TKK9kjWmajU7eCv3jLvVuj7AGxkBmI4Rja7gB5/DtDl
	xS1yRggn21AFrAWMvzrCGcp7cGr92lvIZR/xEWAKdfpFZNRC0xXX7qKMHcpx+jnQepHNnNCVdkJ
	xQSo=
X-Google-Smtp-Source: AGHT+IH/PCZ5UqdPSWb/L1chRcf2TaE4QmVLKfBVBx9LiPgcq3IeVmHGx03TTIhmVaiNOnNYm/AR2g==
X-Received: by 2002:a05:6512:220c:b0:52f:df:db40 with SMTP id 2adb3069b0e04-53678fec496mr13470487e87.56.1726756661669;
        Thu, 19 Sep 2024 07:37:41 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:41 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 05/12] image_types_wic.bbclass: set systemd-boot and os-release dependency for all archs
Date: Thu, 19 Sep 2024 17:36:59 +0300
Message-ID: <20240919143706.6074-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204697

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


