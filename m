Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270CAC5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:25:45 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.3995.1748604335805403167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qxNRBpk/;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5532f9ac219so2366547e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748604334; x=1749209134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0LIsHBlqDPzcvHAwp3bRNPaus0BcGwVLlL23WCve04=;
        b=qxNRBpk/MjS+/RQJIFEJC0X0beQc6rY1C9+TLvqzQbgRXt+bHvCGNn/GVZ9Pv+jDwI
         PCoqsuYdzI98Uxdq52PZ1ECo8J2V6RrwseakrdIAGJzdrHynXNb7rRCWwwNC4ZOMgtjy
         QNpu33pmFQAO+vRcz76CsDFZSJhf/FjLSULQonkw4QapKpfykVVdo+/XuMdYVRhnNIfB
         57nItmUFyMGM8DlqI/Y58BoLzc7TQ6UNbQikMT+piiP46Jr7P6u+0gzlISeNq7gtm+DE
         KN2NLuszNsQ9p2M3r9dNmcM+5jHWt//sB28hcW/09eec/QRbAUjq46HYzdYHrKccBu2i
         JZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604334; x=1749209134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0LIsHBlqDPzcvHAwp3bRNPaus0BcGwVLlL23WCve04=;
        b=pFpkNY2hIJ3wWcxYy3D0etkq5tnmu6Uhrjts7DCxoLdXD6QSeRBvzfdLYr4sBks9ZO
         SFOOek+ViFef6dlvOQUc2nd1hYJ7iJqpSqsTs1fJMyLJC3/RzfNdjIu82vjh55fy/SUg
         nA9urh65zuFNy5d2XeNL5BeSwEkaoVSyfaQfYj2CkMhICWURB7fKMnpeWbdNgh+hpm9f
         GS0IPbHm7R18oLPjdI5jyeLrJOzWDgwytPzpOImg+3hnISTtu9qb2XoDstsmYUs7hqTo
         V6AicXYQq0FXYZ4bm4rP60WmvKZl837BMqNIzuKy2mIrHlh8WieppfpX0/5x7VFFrWgH
         4FEg==
X-Gm-Message-State: AOJu0YyX2A+kjEOLaXLvY53g0gsX2RRjSjmOGajffPVX0q/oVh/D2I0k
	Xb+tSu2ZuN5/kvY/RVnp4nPmlIKNqr9eopEAOGYvnFb3pcYSDLUG5oKv564DGMw15cSAh8brx19
	3ek88SRQ=
X-Gm-Gg: ASbGncu00hopHuUFXSOxeiBbFU7UecRoeHVBiwcwWL4keiY32zE9N2f7plaG9Hcryor
	AhBHhAYPfpr9PA+RxAwBVsnU8cQRtAauj0NxCIjWFKW0qWdTYCrBbn0hFmv4XRTdL09JjzkH2nK
	lDr7C8/t/wx/IlKwwGyT+w/QzR5MzLtXGKvvhxKlHKO21hxdecZUD0VzrFWvr1Dx0G3cbqdT2LE
	mzUMzORYAo+cQLBcJJTP3Jf6nriKp0fqdGDvkJrEPod2oSjwfMnKKPGnXIUu8IUN3PVW2cKpxVZ
	V0Ik7RmZ3Myr/dpzoa5+E97/89CU283/xp96jqS426V1oDkkNvPBKpQofJgbffr6/mgR2C0LasP
	psBacSFoA35Z3SoaAriJRdr/PZQ4Lyf6F5xjoNbc=
X-Google-Smtp-Source: AGHT+IGBPv6hYPZAZsV3K1zcqE0l6K4ikRRigGpQgDTjchHz9Zk+KW2jDaF0tdW7MPrlocdncloNcw==
X-Received: by 2002:a05:6512:3d28:b0:553:2c58:f967 with SMTP id 2adb3069b0e04-5533b93b8f9mr926103e87.56.1748604333882;
        Fri, 30 May 2025 04:25:33 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d35dsm667377e87.46.2025.05.30.04.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:25:33 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 5/5] image_types_wic.bbclass: add "grub-efi" back to WKS_FILE_DEPENDS_BOOTLOADERS on x86-64
Date: Fri, 30 May 2025 14:24:59 +0300
Message-ID: <20250530112459.776330-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530112459.776330-1-mikko.rapeli@linaro.org>
References: <20250530112459.776330-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217496

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


