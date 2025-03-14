Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F709C35FF1
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 11:20:34 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.11883.1741951225224114303
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 04:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FObWs24a;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30795988ebeso20514811fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741951223; x=1742556023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrYTZ0UYaDGzIgttQfHHAHXWlScCm1Z633XLhm7jJYI=;
        b=FObWs24aXsmAhB48lkDhfNqaAm2JPqdkpKX354GqiO3w0XLQCsXstsOLyIcx1qVQmq
         BsD+QcwFaArFJOUglpTKaAtX0MXJdMPPV1XLOQZrRt1Q9T4L74q+HljPG1G44/kI6LKX
         5nDUAnjjKXU3kNJyqlYOS3qAn501Rv0TP990lnMY0gDSswYsnTijc7nWDIexnBB9Nh5s
         GcVlvoWU5pQNVSxh03yku3Pl4Oyddt4D8+kvgnhh3Jtk0iEzSKS55PMn6NuXptNWx2fa
         kJ7uRBSQH0SSDLAWCJL006I4TrhFeN/JRm85wbJ3nbL7cVAuVbUJXPvMwMxS9VTdPxlX
         gCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951223; x=1742556023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrYTZ0UYaDGzIgttQfHHAHXWlScCm1Z633XLhm7jJYI=;
        b=SH60fDS9RZQ5+kuiDafbGZe4jXqHyzuICLDZh4WNZGmxhBosq5lokM04rYwEexjCgb
         om4IGbnBY9R9NXPsKcnz3TrlUzulybHiPAZbMfcPwrsQTdH/+jdwy2YBwkrMs9ubQ6xa
         InIm1nynpRFyOvptL9t1wHMoLrQJcduxBKNtaRKFrPrfe2avEWdZJr2EL/XZd5wg9yo6
         SUADg3fk4WPSknMIeFs6g7CGO7F4MFm4fnO8uPKgflKJ4WZhpH4HHKxcHGHNGIJgrm3+
         +6NZprPKpdTLkpbUeIOLLVmLIdE4hivnVJqaYye48Th7bcAht9e2oRM5z2xgHkrqVVC9
         Bxrg==
X-Gm-Message-State: AOJu0YyaJHC9yFg8JWcrR6NreCnaRElYyD0oN5mkhxNVRoqGW95MI9wc
	2xfCB1c8Mi+o7uUrtza9593g4kbrYltKonDEI0BPFJ174UYMDgyokdnH1qQitD6SDu9a0WCJsdm
	y86w=
X-Gm-Gg: ASbGncsAPnCf1PJaYBQgE0pckuhQ0TDlIoSfUGAG0+JiZuLf2WmuDs6r4ZVp0400sp2
	7fKUNI1TqqCVNeRdmL61DASmiLodXZPvJ9R3w6riIFzgxzaWJh8YEj0yQJCFyiWlwdeZdbFLrnI
	M/cceEZBco5KRFEyoEHeKLmqjRxY0qYA/iGfzp4wbpvzjMYb/re08qs2Tj47uXJ6Z4MR49s9PfR
	dM1UD2WH/th8MMDyWizGk/NrsrTQ8uW+PLfekGpow4WnhM51G20Z5MSUQomo/II9WUuMqiE+PDh
	HEbQUEEF9r3z2PMZE/ab6Dx/72ISkwn6moYOz0+CZZ/rCih6hj2BMGB8IOa4CcZLnAIwM85gYDU
	I0WqyFLtvbjlBCA==
X-Google-Smtp-Source: AGHT+IFBKusO5WB7XQtlkqnc4ob/PFQZLUSOLpEN9W1rfPgQNFwxX+BGw3DAL6zoez7eILfi7ActsQ==
X-Received: by 2002:a05:651c:1a0a:b0:30b:efa5:6988 with SMTP id 38308e7fff4ca-30c4a876ccbmr7296141fa.20.1741951223140;
        Fri, 14 Mar 2025 04:20:23 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d26e5sm5364391fa.20.2025.03.14.04.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:20:21 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 5/6] core-image-initramfs-boot: add option to build systemd based initrd
Date: Fri, 14 Mar 2025 13:19:41 +0200
Message-ID: <20250314111942.304800-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212836

If "systemd-initramfs" is in DISTRO_FEATURES then convert
core-image-initramfs-boot from shell scripts to systemd.
The resulting initramfs is much bigger than shell script one but
supports much more features like disk encryption and TPM devices.
Also includes udev which can load any drivers needed to mount
rootfs. Uses kernel-initrd-modules meta package to install a
subset of kernel modules needed for mounting rootfs on multiple
platforms.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../images/core-image-initramfs-boot.bb       | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
index 7258944751..215d32fd3d 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -4,7 +4,31 @@ LICENSE = "MIT"
 
 INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev"
 
-PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
+inherit image
+
+PACKAGE_INSTALL = " \
+    ${VIRTUAL-RUNTIME_base-utils} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd-initramfs', ' \
+        base-files \
+        coreutils \
+        e2fsprogs-mke2fs \
+        kernel-initrd-modules \
+        os-release-initrd \
+        util-linux-blkid \
+        util-linux-mount \
+        util-linux-umount \
+        ${VIRTUAL-RUNTIME_init_manager} \
+        ${VIRTUAL-RUNTIME_dev_manager} \
+    ', '${INITRAMFS_SCRIPTS}', d)} \
+    base-passwd \
+"
+
+# reduce size
+NO_RECOMMENDATIONS = "1"
+
+# don't install automatically, pick manually instead
+MACHINE_EXTRA_RDEPENDS = ""
+MACHINE_EXTRA_RRECOMMENDS = ""
 
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES = ""
@@ -18,5 +42,3 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 IMAGE_NAME_SUFFIX ?= ""
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
-
-inherit image
-- 
2.43.0


