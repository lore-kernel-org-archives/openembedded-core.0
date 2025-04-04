Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA78C369A2
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.1480.1743784203758427791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YJtfHorU;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54addb5a139so2500882e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784202; x=1744389002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7I96RY5HJq72tfigXOgg6a/AbJBsfULA6D40J4yHnXY=;
        b=YJtfHorUwrIMY9FUTHiw+dStdm7M3PAywA5CEZXK2KlgtDgmLAC+PAwEfcTn8MRx+/
         RBl1DnbIkAoAajRGyoYKt7nxLmZ6QVRiJDS0rWlEYXbVoyiQ0/sOtQy/ZuS5e+Ul+hXw
         pTGBd8enCllUk4EW1aFyvuFbFcG7s13dIklGwVNYzRjb5qXbIRQ7tiO+BUfJfXQYmI1R
         DPeiUekStKnKoONdrEDmXvvguOe3kzwlJ2OPWqgC71IpwdrGKTEv+k/DuWDHu0P54ZdU
         7ajmAhjn4clkBS9d7dWWGMiGtoJXYAXd4CsD5m7Yxl4EFHeo5gs5ts5eh+FPA4h5ONyf
         SJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784202; x=1744389002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7I96RY5HJq72tfigXOgg6a/AbJBsfULA6D40J4yHnXY=;
        b=MmDEGv0GcFt4sIgfiNnDDYed2R1Fmb8pwp1mpBnwmzjwKqYWJ/tHOygtc6jJoaPaS0
         xug6qOOQnNFrbbdu2aYuGPV9ynasbGuwoBwjHbahBNakMpsOj1J/GP4fDNvkmLd5l1LH
         AQcn7FZHa51dWAdPRFQgUfp3WvbyN0fNVG1XGkAvN09jeBnvI/YQSauTrWgWTnV1RshG
         3R6uWuluie0eZIvV+Uy64iRg5FbEiATtnE7eNg2kjawlESF1yDZaSfPFfG+46IiIjxq/
         eAmqbpRMZ0jLdzJrZwTu+LTuBeTw7ObnQiYKTIQQiPOUd84Q2qOTUi8VU0ZeXdNor6m8
         OvWw==
X-Gm-Message-State: AOJu0Yxh4RyrswuSuyILVDy7aOEo0cIBpnOyCa4oR9juLRKOeErMR64C
	KH4/C0Fq/IwPXlzyAfoxKYMWgapgyJJ6bJPzs+k4QHzifbp7B+GavPNTJnV95svSHAeXD0c5bNo
	+dBM=
X-Gm-Gg: ASbGnctYynor4GV4gcGnkjaJ8YHE0tjZGZ/CVRi+zgJ+vjXYhef5fGAdzbsaMumSy61
	K8U0kWbEFvld3w/JQgNiZnEEICA1G9m6T6CEOrf9zMm6gcylPsLt55OduXibZmn431u+/QiLyhM
	5/tSY2cblz6uXpH5EmftsFcv5RAok92oT7O7lwXg/nKORkUt7ZW3kmpdQ65S/8SLgaU6VfyKpkG
	zHcqSCmTdH+dpSHhkqlp7E9NBvF0okRaf/Iu5y/5XrvtBd8uUXkKe+YUYvC2aBSlzkTAti5Y2/P
	0j8CRT6+LbieSDSjh/IZkeduKKxNKn1rPqpVlpb4nxgaRVnRsGPbPwSqJI7VIZss8CxN9+uoTop
	QdDpMcODOCb5sLIY6MH+EnQ==
X-Google-Smtp-Source: AGHT+IGe5o0LnQEbOJ4doJe1VB5mGrbSb4dRKIfRcUWZhD7nH/s1LpxequWwYGtzBf4q//JH8LXjWA==
X-Received: by 2002:a05:6512:a8b:b0:549:38d5:8858 with SMTP id 2adb3069b0e04-54c22776e8emr1168638e87.20.1743784201871;
        Fri, 04 Apr 2025 09:30:01 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:30:01 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 11/11] image_types_wic.bbclass: depend on grub-efi and systemd-boot on aarch64, systemd-boot on arm
Date: Fri,  4 Apr 2025 19:29:32 +0300
Message-ID: <20250404162932.447699-12-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214362

On x86 family builds, grub and systemd-boot are always included and thus
get built and deployed before wic image builds. On aarch64 builds
that was not the case. Result is that some builds added systemd-boot binaries
to the wic image ESP partition and some not, though bugs in wic plugins
contributed here too since missing files were silently ignored.
Boot of such images fails since firmware is not able to load the
default EFI binaries.

Adding EFI_PROVIDER to WKS_FILE_DEPENDS_BOOTLOADERS is not possible
because of parsing order so adding grub-efi and systemd-boot
to aarch64 and systemd-boot to arm depends
which makes sure their do_deploy is always executed
before wic image is generated. Thus systemd-boot and grub
binaries will get copied from deploy directory to the wic
image ESP partition, and boot of the images succeeds.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 10888bc12b..b2f450026d 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -113,6 +113,8 @@ WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
+WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
+WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
-- 
2.43.0


