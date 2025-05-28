Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9354C5B543
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 12:57:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.14918.1748437017752346269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 05:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=H79Rew7k;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5532f6d184eso849287e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748437016; x=1749041816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NBfdZowu+K3O2+oZIs0IQvHG3GEuMAWCCsl8bak33k=;
        b=H79Rew7koUM6IctVf7jwVQ7P9KagTewE/eSZ/fdVrBprItvQkwD0qXiDPivX7q/chF
         8JOdWyjIghCrsrN4/WFML6M0WSBoDjMOX2AZ2uo9m0IZdoMg+OY4+b87hcWRZgL2nF3M
         ENih3qiy1sWwCPKoShW71CE4MeVN9z1svfC0XaI69gC4zDyQkvbCJiGtsl4cynYG/KbW
         zawPDOyKyoW6u1jer3NXsb7Ck9MCmipCGMzWkkqtly1oO6idNsOhFWUDJcUtb+ayT6x3
         h7VVh2s4devopj0mVtluD8+7D77glRg4iFb4Ayjwr3PzdTxNfM6cuBGFI/wNcy+RwQtS
         Cuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437016; x=1749041816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NBfdZowu+K3O2+oZIs0IQvHG3GEuMAWCCsl8bak33k=;
        b=TbEWTviHmpBV+60WtxVrmjEGxJwaFrxKndXJTIRfJ8jtXaXN13Mjqe9pzafU6jOLXt
         i4c9uzcHHPSbv/q/acCrx+4OnsB4YBD2QCJ67gHJvM11W+wDZ6XgrpJaCddkddw1sk2f
         PObAhtPZWj1FpO9OJ9oWHGxcT4f9k3Nz1TdS8uLd0T7qIvfL3dKmy54lfKxcBKJc8QrD
         QD9Cck/AdyF8t5Q76d3NEG8XyiNF58efugLRS4L8Qhx034ZuoVGEByJTo4IdFrIaMbS6
         d6j93DXWWzQH7olf08b7xbsSayIl/SCbNoBzeOeSIEDzIs7gixoY5aAA+hqhFxiBYiRS
         cggQ==
X-Gm-Message-State: AOJu0Yx7Ba7HCgLjXsxRL5EPFHNVC3WjWTxzil06PiN59JaT+oLm9wcm
	VFK9fPI20jRW3isN/fJsKKGF45G4ATOjprften4k5QAOewgCWPn3hdBCdy65r4IiAY+fnSYein1
	xqx7dEX8=
X-Gm-Gg: ASbGncuYLLJQYObQZOC4MI0tdIx2qxvC1h5BGSFvi3ZB5XNYc1R10Npx8cRUYEMGjOs
	kuxWPVRgO0+7hjWNr33TzZFuMlpndObHUWBBOdE8FcqDjRZ0owVuRyNGMV0kQPMl8uMhvAcXu6q
	ewIfDj7kttAcRIeybSqEB6v9tGRvXfqVNlxczzLyIzBfYnJsKScaQQrc5mhxA/8BVk5xFpHzA29
	XVEnSPMudznX3ygz1DoYf16gR6tUJ43g+crRFbD9kw5oKQAWLqRnpoJu+SAay9Edp0qyShu3pPL
	x35/u/ISgeclqMLXmZebcjRuxeJ5iJwqhdHEnU1XDYyabi0kkm8m7K2ZitAufwA2xiGMKJFgPcL
	XWkxwS+6EI4Hsa3w0i5N+vlxeLO9q
X-Google-Smtp-Source: AGHT+IGD2VHyNb+mcGwDsKyAPjQ3qNTRbWdGaFAhd8wBmEQ31Ix6/4b8DdQtY1OipBSeNtPMk46eCw==
X-Received: by 2002:a05:6512:1188:b0:553:23fb:595 with SMTP id 2adb3069b0e04-55323fb05e5mr3543574e87.14.1748437015807;
        Wed, 28 May 2025 05:56:55 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a504sm267869e87.146.2025.05.28.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:56:55 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 2/4] image_types_wic.bbclass: depend on grub-efi and systemd-boot on aarch64, systemd-boot on arm
Date: Wed, 28 May 2025 15:56:33 +0300
Message-ID: <20250528125635.684302-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528125635.684302-1-mikko.rapeli@linaro.org>
References: <20250528125635.684302-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217345

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

v5: separated from modular kernel/systemd initrd series, os-release
    removal added as separate commit

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 61f028bd7b..90bf8c7a60 100644
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


