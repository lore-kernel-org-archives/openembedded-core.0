Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D856C5B556
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:25:35 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.3993.1748604332525657335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ae6M9SV/;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5533302b49bso2635438e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748604330; x=1749209130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCBzfsKiAcKNKGKcZS+HN3AnjGOGh6rvqC9+btkMIyU=;
        b=ae6M9SV/jGUWj4xXyDg5H6Zmousk8bTHh0ghSYjo8BM1mhxc/0MpTIEY+8ArukEIbX
         6zOnpxxyqh1L3fqY72MQbP41tCt2Tp2x/pZJLf6Hw7ceRkUEfomqTUik/wy04EnT4Csl
         zSmJgM60RF2M6Ow3OghCYZBskW6/dt4Gj4YdTIyej9u4r2sQCReUn8gusm0uIZ43lUmt
         Uv/WZjazmbBiYUX+YpI1Ggqrz7zNRnVa50F+i96B92NcMGjtiLbGJv0R+KqV0V++/jse
         +bHGzQJbN7LD4eb9PGBeRmyWXHEU2i60tdveO2PE6h1xffDmEuCtutWKmuk0yWWTC78P
         EJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604330; x=1749209130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCBzfsKiAcKNKGKcZS+HN3AnjGOGh6rvqC9+btkMIyU=;
        b=l6OjtxX72UphndXD+LEWgq9zGYgckwkil+aK7WKiUPSjJdUvXkzB9Z3p1d8zRthFY6
         bqYm5LT8AYW+cDFxZyz/IRP5yslfpl5YJhJezRf24qz4l5M7aVMtpd38PW/AcM2KMEn4
         +Gq0Ns2xcUC1aI3cF2Yeuan3vYX0hRgD1SLLmsTqtw+tsDrOAotTBLwdV3yxU67YvPu8
         ezizMpiaWLU7GhldvjxpwUEBVenehj2bcOsMTFG3T8ES0jsfEkaD36fT6bYmpjJKHSIo
         M6pFBWESo5oeq7uXII1pzTQE86yiWgRc8I7ZAE51kG5QsO7VUHYD02quwAPi4xtMZKun
         a95Q==
X-Gm-Message-State: AOJu0YwlKimMSAHGKGv6m3QBfSKx1iFNgjQJlRy4WE0We24gs1lp1c7S
	hGYrlTxaOxYB4RmwUIk2bid6ZkP6VdOqge8YOOJkddMptgA8HLRLCA7jpMcv/ZTp+A+Wr0h6V5G
	zn1lqgGs=
X-Gm-Gg: ASbGncuqebk/exZX73xA0sxCkLt2dmVznqNwMWH/zlR+xtRQJrP1V5cCzyrXUyaDEeh
	dTaWJHdi/Hj7HF+KpacFH8LBtHS6D8Fiy46AcEsJSiGg366mjDBO9BKFrtmpq39rBLvTFzu6D8x
	o/6T8tdOwPGD6eioA5S6rlVYFWHXmLBqbju5qETs7EiVevB/xig23sTeTaWLp7HX+qQjA5GBOs4
	WBInIduy25eIL8CKV0EbSxU5cWdCKFriQ4cn5Q81S0jjbBgHgbpm+hWmU/KX6pmwD0+2YoKjZyf
	9jW1r5W7JOZ+yupetp4lJCfi/ZiJrReqxrn4q7k71+P6egj4zlo159gQBwTxllwVLYR16nlubNh
	VLuj0Vz06J6T0WkrV9vc0/gz//l1Rd0aAyC2kFas=
X-Google-Smtp-Source: AGHT+IFaGu3RyPRi9EU8h7GvKRTJU+ITcWR6aUzdftf/KZZ9cpHg1xdPe8+rBCSSWwB+sYAt+ilqOQ==
X-Received: by 2002:a05:6512:3d22:b0:553:2cfd:5958 with SMTP id 2adb3069b0e04-5533b8e10c4mr1002742e87.8.1748604330479;
        Fri, 30 May 2025 04:25:30 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d35dsm667377e87.46.2025.05.30.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:25:30 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 2/5] image_types_wic.bbclass: depend on grub-efi and systemd-boot on aarch64, systemd-boot on arm
Date: Fri, 30 May 2025 14:24:56 +0300
Message-ID: <20250530112459.776330-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530112459.776330-1-mikko.rapeli@linaro.org>
References: <20250530112459.776330-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217493

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

v6: no changes

v5: separated from modular kernel/systemd initrd series, os-release
    removal added as separate commit

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 61f028bd7bdc..90bf8c7a60bc 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -111,6 +111,8 @@ WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native
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


