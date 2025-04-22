Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF826C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.41496.1745332528126354378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gn5zTz/O;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54af20849adso5036713e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332526; x=1745937326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7I96RY5HJq72tfigXOgg6a/AbJBsfULA6D40J4yHnXY=;
        b=gn5zTz/Om/r1WK9IxyqkCwYwM4SCAiNjscH+mi2wOjVTEDWqz7r4x3hcgixDLblbNn
         kj6VSViQXmZaKzOBCmItZMBIDRoar5z+MjMzq7sRMX7TrrEjpDcTxOFFE+5RtDuphmV/
         tkueJL4IXUiHbk8EfS+wTm8yad3IY3bBFbpWw12Y5eIgT7B3sgrFx3LAtesmwPxu1luA
         I1GUuNGEeVajEFN46xpuMX6Em1zfIbxEIXQtYFp956LHQx+TFA0MozJq5MQtUDHV/63Q
         gGmgGzi8ODTe75y2TqWBcmHlSseeNEMWc935wcwUirBFmLkAcvGP6l69/VCoU4pymqHX
         Lt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332526; x=1745937326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7I96RY5HJq72tfigXOgg6a/AbJBsfULA6D40J4yHnXY=;
        b=xNRY6p1mOsZ02/UhCwbZ/7sXFdYZ9b0gSE2bAFVhIyNb4LCcsWE1bebcAi+56VyyMs
         gPyzyFTV94qqHc9uIVCgpbLAwU9n0H71hAboiZPkdlnprxvdKay1wh/VajtbJFMfyNMN
         5JpccUnBI0uG1O01xDLWgre6dRt5X7PccsIuPWP18+3Y3ehiGz5uzcciAvGV0U1T43J4
         f2dtQk7qP0BFlOvHSGo2ICuJVxIid3Ay5SqO7aohNnr6+QqPwMz3PMYriAsn4W6nadWN
         0DfFIkBdQivY0qBWTZygx/KRK6OEA6fwopFx7xxsBsxRDriSg1XPrtZJcQ6XXSukj2EV
         XeBg==
X-Gm-Message-State: AOJu0YwxvgSeHGYgSDuEGy4nYGSMdRArOLMtlYzQZuSVuYs2BY4SNYH4
	kBVxr383pmjbk3j9pDB7lXq9tS3Ton18scw2p8cpc25CaLwziLQ5dYDmaep3ccBruXd6N6RbWGm
	V5gs=
X-Gm-Gg: ASbGncvtiERL6D6dWRCHav72bqCNgfOUEUyWVGcFn2MdQOTs4fQrJQrZfcQBauoXNtN
	+ptF322G98TkjXtjAS1/YugX4fz6Ux9Fg5c2ThsG4+80pV7IGs4Mz0dQwWkiJAFDzqCgNiY6NG1
	Qag/IR9Co7F3MrEOcAHfRFmMqfMnB7j6Pp6GkrX2BsHNh+v1GMhAx/zJfC3/XN2ygKOPUyWUpej
	gzf0WSuRrkbjs7TG9+dFifgC2mOvjtL8eEIPax+3FxamMzKoKg3ypupQNxkaAdU/QattHf/nrx/
	QBswtRXEWFgWSnNM3AJERjqTle2jBG5m3aRrNzPDx/2KvYd0nZHFpimULGKSG4SGW+3QF81uwdu
	BolLDxSnxn39jHLYxgQ==
X-Google-Smtp-Source: AGHT+IF4D26/hURwRr4lXEz7BdYKh7HtkJzjHW82+a3hIFezh1QBvmDMbAiZs+S1r3cmk8QCyAz65g==
X-Received: by 2002:a05:6512:128f:b0:54d:6a90:5ba6 with SMTP id 2adb3069b0e04-54d6e7071ecmr4700211e87.0.1745332526265;
        Tue, 22 Apr 2025 07:35:26 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:26 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 9/9] image_types_wic.bbclass: depend on grub-efi and systemd-boot on aarch64, systemd-boot on arm
Date: Tue, 22 Apr 2025 17:35:01 +0300
Message-ID: <20250422143501.99565-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215223

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


