Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FE8C5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:38:35 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.4273.1748605107633103392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=icuff/nw;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so2265880e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748605106; x=1749209906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjUHs9nb7bavCpeuukQOPRRWSCF/saJplSuNvUvvSlg=;
        b=icuff/nwGxhb9VdCKvZYst6rPHdk0OhGJxV8vkdLBwOT1dPPuMHeWX7RGwWjZ3uYww
         6zw1Qm/q3d1VxRnER++G77E/gUDOaV+ko2VzACfczbNCKP287kQPL8l6WVl389oispa4
         7KRvDXQeBKxLla7xg2rwy8WA8ArhoMtXPvCnm34SAfkEIRenXZipM56kl5CwO+g3adQJ
         rUOyDfQ76qcMVoKGlpEtplyZOvbweHhQ2T9khwZ8HVhQmezvhAAEXgilDzkHptXzLYX9
         ybVc/5dlE6IiSpIpXQcJlb76t7pxF9p0SUvuKdbMcXq+j/+SDxPn8ycxwnc+8EyOU7BZ
         jgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748605106; x=1749209906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjUHs9nb7bavCpeuukQOPRRWSCF/saJplSuNvUvvSlg=;
        b=BeeQFqGlsF9i9KM80OWDAJgvhET/V1aRnlcje0OEuW2O1U10b5Rxs+9xh1B9qKGrRV
         7xrZZfORR6pNT/lrmBzxw4WrpvxjuLAjWusLN2MD2K5dbOGYBchcY9I8Fuvrt75iIBVc
         7D7m1juUpGd7iSwdfDH/EgzuRIL8LJzeOdoBS64T2oQ4dPqxs9QrOr7goQyaGsyHUhmp
         TrEgp6ZKm+vJmOL0BakGiLHs47DeM3FVZV+1MjBNnJwv24vQ2j00zMwHdbf633K9QAo8
         3tEt8MZA9zt2m2Y0Z80PBlkc5o+u/ZTpD7a4GSJ17UlhtDhU/m7QoFoiZW7yhHZooLVY
         i7iA==
X-Gm-Message-State: AOJu0YwVQHwUbaqt4yp134HJYanpQMYE9IKUNNSTwajiL8qspSjmutD+
	XhMoF1ZrsHKGwwUskWVRGU5/IObNb6r8OR6ByAQJOfBHdXyctwannAQifXGOpKH8xYkKDMi/86u
	H7hkEBSg=
X-Gm-Gg: ASbGncse9rUiD8OHYwETEq3d/gnAmG/VRTEBByuqbV3pKqXbsllgV5y6SHgYMQ2MuXn
	OuRfWgkoFhXztM6Eetdc5fOWQH+/2XR9HMp6+p3xzfcN13kadw/xQw2V6XCzajxj/TevpLuU05b
	y4/gnkfgAvv2WjzC1WoAYPh/AHW45waowXK0pdnS3Z587LyhHPvvJQ0URjhkhg865rztsxhP9bA
	SR+cyEHoQMmu5jb/KOVw/f1n+4VMDFSXM4+XVfZY76Lg7artV95VzsM2MDl+lo4O+p+cDARsBT+
	7QjxkCqR/1wty4Qy4u++m/Sz9pFYt+qB6MxvViIT3zwQ6oPcXt3KctbmB6s+lLDlihzqaHtM6J3
	DKu1Xm6//AcSVA0uAcmr4PM0PTzTp
X-Google-Smtp-Source: AGHT+IF7mYg9qLxG+6Ly/mb3jYJjlSjeuX/7Q0TRHruPnuV72ZJfs36QMpXM0y9zVha2dAWpoS+QBQ==
X-Received: by 2002:a05:6512:39cb:b0:553:23c4:6825 with SMTP id 2adb3069b0e04-5533b8f40femr855393e87.19.1748605105700;
        Fri, 30 May 2025 04:38:25 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378f7sm676469e87.244.2025.05.30.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:38:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 2/5] image_types_wic.bbclass: depend on grub-efi and systemd-boot on aarch64, systemd-boot on arm
Date: Fri, 30 May 2025 14:37:42 +0300
Message-ID: <20250530113745.778397-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530113745.778397-1-mikko.rapeli@linaro.org>
References: <20250530113745.778397-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217498

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

v7: no changes

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


