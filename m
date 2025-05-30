Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF27C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:38:35 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.4276.1748605112479004880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iZJRifjc;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5532f6d184eso2649469e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748605111; x=1749209911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5pK56p6iC0Z26KB1uEbG9XW8rWxtG5WhgMWISzm9nk=;
        b=iZJRifjcJgqMbsdTHXhYVTWA/y3P65qnXNvamaaZMcn/QIotwCiK5qyKKWHudP60t1
         Wig0sWPUUIAdE+HgC/uT/lg/T6cxKPcNCYmkmuMynuThsAv3U6l9zdkdCbdK8W3Mymbs
         D+WHR3mni/5dyzQ9j1/Lwds1RMqfq5Hvfl9pTVC8xPwBTE0KTgGjTNOWYctDTRlB4men
         YBQcBEZrg860VVUVSMED39fCQzcJPhlz6ufQK6hMeEUMBXlX0RAFTTJRwocjphIoWBgF
         gibgRR4HlHZAUxakmEk6p5LKJrf37IiULOK8YipzNBIz5zbrrooyeJqIcp5GKOV1iS47
         X+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748605111; x=1749209911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5pK56p6iC0Z26KB1uEbG9XW8rWxtG5WhgMWISzm9nk=;
        b=G/KHxF7zrVKe5Oz9LdklZmbrT1m2nnsJAP0a886kl9r/00QNO4hxGeYM4eFrwaZYIQ
         //c/FvoI3nd1t8qVWpmXARExn5bm0vHfkoKtFEgw/RhflQ7IsaH+itoVck9yltqkMkMi
         rRizavDLhZ8dNt5amALK//xnqV5gljca65XrVN7FIsDpXe/RrBcxCaEsArEMspLPmTZW
         ArP4WXBau4vUkHSOO7ff/oa7sQPQyYusPXqv7lr909/6OIsdgNhimGp+huLdzuJPS7Vq
         wFh6N4U3O9aKKZIUBHlV1xKbcHpvCQiTCJ0iMPaJ7XTMXsGDQ0BJtRrFwS62XS6Cxwkr
         Cc6w==
X-Gm-Message-State: AOJu0YyPig1C0igBzXZ2TIqwhRbTPwQkaRnRVcK1Q4C1ZZBxILpgW/YB
	sDhp/Veb5Ki/8q0L4qNsA5YZ9B5FmgcKyrCeYDQU/XwS9U2PzUqhfDHtGnyrDXZ1C8qdM9oVYHy
	r0fJeg1s=
X-Gm-Gg: ASbGnctM7CGW/JBgAe3/ihW4flGd07ePUP/fIqidEvspYrexSPM7tBv7JcEhZouslAK
	ZPWg+G09ffboGHMfeYcjjIyevpM2wacG6TI+qx04pBgSxrnIU9Gt3ekYod3yR6KyB1op33ciSDM
	x1DvOR8cWT61vf759ckXWPZ3yW2rm02V4qc2wvSOLHks1rybRv0puFS0w8cw/LTZlS+CBimnHJY
	+7A/a8dHT9aydKqwMcFt/GaaM6v/x43w+w9qyAsgsZZ9lhIJQy9xj8lPS3b2Zwy4nRSxI19lW12
	raYgKilYBtohS27n7JJWF6tUWpf1Jq6UcvXuG453Pdky1JeY/ARfWqJMDD9U9J3ejetEWHv4lP2
	plmnoaYKUazAgQ7yJ+E7myLyTiwj8
X-Google-Smtp-Source: AGHT+IF1tkyYU/Xfjt7GTT2jdGBUA5eacYPCq9VUGelBGaPoIv5sPv/codcZcv8B1athkrZOZJ+LLw==
X-Received: by 2002:a05:6512:b8c:b0:553:23bf:bb26 with SMTP id 2adb3069b0e04-5533b8e1115mr1080560e87.11.1748605110564;
        Fri, 30 May 2025 04:38:30 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378f7sm676469e87.244.2025.05.30.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:38:30 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 5/5] image_types_wic.bbclass: add "grub-efi" back to WKS_FILE_DEPENDS_BOOTLOADERS on x86-64
Date: Fri, 30 May 2025 14:37:45 +0300
Message-ID: <20250530113745.778397-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530113745.778397-1-mikko.rapeli@linaro.org>
References: <20250530113745.778397-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217501

This was removed by me without good reasons in commit
2f0ef8cd0e61c34e67ad9c7508094da3c23f5fce
"wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass"
and results in grub-efi binaries missing from
genereted ESP partition on qemux86-64.

Fixes oeqa selftest
overlayfs.OverlayFSEtcRunTimeTests.test_image_feature_is_missing
after wic detects missing EFI loader files on ESP partition.

Test case was passing due qemu syslinux boot using kernel directly
from /boot and not using UEFI firmware to boot.

Fixes: 2f0ef8cd0e61 ("wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass")

WKS_FILE_DEPENDS_BOOTLOADERS needs to list all EFI loaders because
it's used in DEPENDS and thus can't use conditional python macros
to select which loader is actually needed in sysroot when
wic builds the images and ESP partition.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v7: no changes

v6: new changes in series, fixes missing grub-efi binaries
    on qemux86-64 overlayfs selftest

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 7c6a6f2e2307..740ed946f8fa 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -114,7 +114,7 @@ WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot"
-WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot"
+WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
 
 WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
-- 
2.43.0


