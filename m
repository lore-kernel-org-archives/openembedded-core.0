Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C178C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:00 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.21066.1742563550934813092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VeOfCyT7;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2554795e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563549; x=1743168349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ3KA8XBXOb873950h1w3JQeb0On5NMVFauIgvLGGoI=;
        b=VeOfCyT7Zu+TWdgTMN9CXAXRl/TMvE2B3t4mleeDjM7R3xQHZjLfQ15/OrO01j6OY/
         3OIAuuW1ahQqis2rM5bV/RAAKTBaoRVSrgkdZ6aWNF73UbXdtf6KNzh0paWfiJhr3QLW
         AQRsVbI+acd4TlKHP1HC0CKHvAWmQR6U1CS4/ew+i7niRdaRxAYDBz92USnJTebmu58I
         XG/bdCkSRYZbhZKYDG8zGHhOMp8RNAnkTwUthkWvB6/9P7ZR4BvTGqKWMzYYumC/DJd/
         QWT2fuVLYxkK3nVJXOkA3FgvZ8j3gJy6mWxJNDkS8ufN0IMP491wIsnv4eccFrUWiN2w
         Ji1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563549; x=1743168349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZ3KA8XBXOb873950h1w3JQeb0On5NMVFauIgvLGGoI=;
        b=kGitPJ4uk9YM9btqTkNc0dlBgQdnoshYmEl69ndETwV5VODUOX5S+a4EPq2xcbuAHC
         eXBjbJEDz8iJwhsUlUzPfl6cE6SfWWy0P/JZsNstSrGtIyLGTkd4MFAET2c+qw91X768
         D5Q8QxeId6T6R/Il82pp8H1cMiGNBCsWrEoo4zjkdbAPaOYTr82XdPZuERF7qFYbJdyf
         d31N1QqLMpikahJUUYTCjewVnnzVfACIcXiU1n+XFtJPEaRMA24ocYAJKVrAAZxh1bpm
         N4gNpBrji1hRvPyddUMJN025Vh58DucbtAlqBc/GP6hLMrXLGGFbNOYjjWmbk7n5OCTw
         UtYA==
X-Gm-Message-State: AOJu0Yxv2lk76L5PTHEvneC7taB+egFtvFx7mIq/q3BMVasrYaY6xUSc
	WiTQSOgaJtZTWeRm10NV57/XChfTB1BhaJvHNrScwqd9e+1Kv+z150msHbyOVOp+lOzzLdKtCDW
	MW5g=
X-Gm-Gg: ASbGncuRIjAt4TziitaVRjMnIK99m5lGRouZiDyOmvLBR6EFztmGKxHOcWTqqMJ13zQ
	8BLUhi4/l3GZidmJ71knnVj3couE/rE+GxxyMHfPJ3MjV5z3FqGnS1n/emZYFKwt4S2Dv0SfOPf
	HcWns3zN/liFesV4Q5NQADKAaYWj+DQrQj713sh+oVneoQ98pLZpLbOfpyPqZeqg22hvrfu0vyh
	7YE5NhQWohPUdFqn0KLN5jAnwYCw5tdPUDWkeQJeU+0qh8FWxkVQ7bVdVvDrrtHWVA5y0F4zUmU
	wwdi6sjZ99H4ZaX8zayhzFSHDIvDjGTU3BA0Tf15t5yYllBVKbbBZZAh+9dqUjKCUN3ES5/n+7c
	qJN4LT8o5Wu8AZvk8HMJdBw==
X-Google-Smtp-Source: AGHT+IH4LsoTEh9tWObvh9YaOQN0drQi2CASwCePf5Q56tchgrpooIaWhgQDO/OPEEQ2ZTmJg94CpA==
X-Received: by 2002:a05:6512:3a95:b0:540:1f7d:8bce with SMTP id 2adb3069b0e04-54ad64ef585mr1072621e87.38.1742563548955;
        Fri, 21 Mar 2025 06:25:48 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:48 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 04/11] core-image-initramfs-boot: add option to build systemd based initrd
Date: Fri, 21 Mar 2025 15:25:10 +0200
Message-ID: <20250321132517.670372-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213460

If "systemd-initramfs" is in DISTRO_FEATURES then convert
core-image-initramfs-boot from shell scripts to systemd.
The resulting initramfs is much bigger than shell script one but
supports much more features like disk encryption and TPM devices.
Also includes udev which can load any drivers needed to mount
rootfs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../images/core-image-initramfs-boot.bb       | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
index 7258944751..c66c28db76 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -4,7 +4,23 @@ LICENSE = "MIT"
 
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
+        os-release-initrd \
+        util-linux-blkid \
+        util-linux-mount \
+        util-linux-umount \
+        ${VIRTUAL-RUNTIME_init_manager} \
+        ${VIRTUAL-RUNTIME_dev_manager} \
+    ', '${INITRAMFS_SCRIPTS}', d)} \
+    base-passwd \
+"
 
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES = ""
@@ -18,5 +34,3 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 IMAGE_NAME_SUFFIX ?= ""
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
-
-inherit image
-- 
2.43.0


