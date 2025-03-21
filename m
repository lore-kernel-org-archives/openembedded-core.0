Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED5BC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:20 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.21086.1742563570730143326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BUTgcpuy;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54998f865b8so1950159e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563569; x=1743168369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7I96RY5HJq72tfigXOgg6a/AbJBsfULA6D40J4yHnXY=;
        b=BUTgcpuyrkOhR3HFJULHTG3EaKpiKhbdBKHJCetZYhlMDEbqhFkqGgEL2hFerR1lW2
         vxytOy9PvIxcC+sUHEEFL6hUM6eqTBYpYdfmM3rdROrwpGqBmd/44z0FS7FKAqE4RlSr
         ie/EkjkXdmgLfbZQxAozEdW1OlMaLEL7HA1qtTxHa4SpqQU9uy2NFP+cbKs3TsklPFTs
         sIYsyJ7O95Qudhp12y8Qlf5FdOmB2jAHVstTAtwU9c1Gi0xi9U+KpcimLTGMCi9lIWss
         0yNY4ay14UvZWynN1Z4gd63H8CB3gCop1jmZyxlPvt52B5No5wqX8RnvkM0/R4TGainK
         WfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563569; x=1743168369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7I96RY5HJq72tfigXOgg6a/AbJBsfULA6D40J4yHnXY=;
        b=AQ53ItZhzvPbgvhblQEC+zqbpmb7V8O5aMVTXPTMIBppAVhG6Kuic+ykk56K3C0Yri
         hIOUbkgY6vFxPnXD5lJk4pmDLCV0k2ZLnkwS+cQquj5jr3Fmz2b0V9ZNOCnoJozNR1IL
         ssAwhtxRBSI6V0kiMTWRgGHztPpf64dHdyUPgITGremEnwxkeLMhcAxXnB3FY4ppbZeT
         7VCk5QxD5YgG+pOxSuLRGd3+Xj2EGiyEd4JBD/ze+d9sEcaeJqsDOTu8qdDyxvKZquKm
         waYyBin088jAotGI/C9rtRHUuRVZZ53PgygZu7M6Zklw7shrYbjD4125gbmDVNYDR6Un
         Mi8g==
X-Gm-Message-State: AOJu0YyjKlWwRWDly48H0gf1UOWxEdvC3gXMhysmtHW9alHXh6LZAJhI
	Y5FhQlkxXIF45SkMBQWrItu+SfHrTQ9YHBk5J3DUqAgVi3L1s4tl5Qv4J6DkCTS8BlrhuHFRc7r
	nQyk=
X-Gm-Gg: ASbGncu75eWnqQexWD+NZWWT61uQcp4w9t+KL2yZmttFtAiYFURT0Z5PM2xieg5EokY
	z2EFNmKh3/bgxo03dufHhqxNWjNY/vU1Qvvfbu+y87UWhwg9VKtF5s9chkQgpHyEenEfW23qz78
	OeowfjN1ucLB4sfVTIxHheKq32cYIMiRVzn/N3h1jS7X5FjpeuevqT9NVz5O7RzCKyL9sDpDnBz
	RNsFG6Pnv00H28OQE66WGsdHAZiI5i+tDDDWQUEFL4yMggpz+YhYGQHEcw+/0zCfsms8t/bBQQj
	wPo1+WjvJ8/y+bHgqfTynzkwY2nXkeJZGUHWm9bcERm9+0Mp27IfETka8/MosqUkYn6qD0xUbDo
	5CyluNAESJ3jSvuHD4Zgj6PAKcBok84EV
X-Google-Smtp-Source: AGHT+IG3Juwg82VC8Fa/zV+4Gk8a4Kw80uqnXLbIUi7Bk6z7fl+eAxY/2pXJvcP3ro8+mqfxBSR6eQ==
X-Received: by 2002:a05:6512:3a95:b0:540:1f7d:8bce with SMTP id 2adb3069b0e04-54ad64ef585mr1072951e87.38.1742563568709;
        Fri, 21 Mar 2025 06:26:08 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:26:08 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 11/11] image_types_wic.bbclass: depend on grub-efi and systemd-boot on aarch64, systemd-boot on arm
Date: Fri, 21 Mar 2025 15:25:17 +0200
Message-ID: <20250321132517.670372-12-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213467

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


