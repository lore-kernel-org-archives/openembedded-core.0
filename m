Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C13CC3601A
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.1440.1743784196152479222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dtuMt5FD;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b1095625dso2577091e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784194; x=1744388994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ3KA8XBXOb873950h1w3JQeb0On5NMVFauIgvLGGoI=;
        b=dtuMt5FDNwOFc3FN5ouSCe6lbtilZfzBbahjIR2+PxIgb3BuqNi8aGqMUHaGZ2M5yB
         lIqU4QwTmn1098/Xevr0Su4hM7UTlHHU7rysR7BnwV+uvYgneMuwYV23ElcTfPJU0D66
         x0ExK7HFYZWjGv52oQyXor7pVmlnf3WOWMyt+8sZz4V7MW+qIsHszjK1aFve5RtR1dGo
         86G/j6s78A1rRYUZwIfsGmTu+m2TZh9AeTHqY8F5e8z9aEGBRKJgUHuHP261EJ0QGXT/
         1hpq/o5EytzVdfvBbuJsIZyuxOGnGYjEnLnjXGinQJoggw1/exEpu50rEV/ODKJSpQzs
         jd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784194; x=1744388994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZ3KA8XBXOb873950h1w3JQeb0On5NMVFauIgvLGGoI=;
        b=hd3BvQBvhbeJYarZIXUCs6Oc7Bt5f8wWppB1PotgbcxSpJNkR2GGsnhXPq8Px5MHbt
         Q8LSJMpq91tGAzf2Zuy0bHX+M5/Wl8UqImTn7Bjgpt+iV1SoY+c4d77NH63aSjVPI8B2
         2VyKXzO3m1Dz/Ql89BQGX4yNGM+Kf31lS+lId3hTY4Lyokep4vB8JkiOXT4gcPOb/5/w
         V/k4VcHNGXK0N/0mwDTEJjoq1CxOE08WCGMkMEeGss5Gs28Qjy3j8aNLqAlGDmDbtknJ
         BWy2lkuIOBVfvCLvbte+aHVQY9IYD9XP5gf/njQG6+U+nKoNC/A9jZaQRgaLfNhQeEkk
         CnzQ==
X-Gm-Message-State: AOJu0YwpUxHzJ88DEig17oBZU+Ei8y51TM2v0xsHtDBpIo2skOxPUp6+
	jv2q+mvEgHh9MSlgP5vhJ3+9ab7WeQv7ES0DRuFp4UqwzU4n1VLMReEkGXDOnICsM0uGYoyZDzT
	Ubak=
X-Gm-Gg: ASbGncvhVf3Oj6in/CzCzzpInRy0DBrb082N8WHhyfdXqd1g/kvbZQ9yfh7NH4mXAoH
	cO+FU1rmQP/tAgW6Qku2Lu9cdepAcsGkhYzWaQ6xvCCuS7JY+SoTDUl2ARFMgBSaoz6xUeLKV4t
	zOXEm9mC8REhaGG/2tZ3EnWxrmwSAaN/0W8mqtLJ7GrvpJ/d1Y1C0p3oOviNNfvMEQviD3p2ulo
	EPZPrprOBwOzFmXamJQWcZbK0W7m7gGzpROSoiD0cZ9DQTHdP4tREt7Nj9ehNy6rgeq0ar9yNZP
	Q2bkDoxZ85tvPstRVKZJuoqSdQ3+IZeHmFXc/jq/XlYKRmJL1zXtLp7gadEOjT/H7x+fq6NTdFe
	c1bwnKcEeuHfKmIF69KaE4A==
X-Google-Smtp-Source: AGHT+IGxldQ/XkCoBw6CwcaD3CEUiZEub8aaobtVRbLF0YtHxJ0pURIGDjSEuqeq8EndgtCD3gj85w==
X-Received: by 2002:a05:6512:3048:b0:549:b28b:17bd with SMTP id 2adb3069b0e04-54c227f91c8mr1226597e87.35.1743784194322;
        Fri, 04 Apr 2025 09:29:54 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 04/11] core-image-initramfs-boot: add option to build systemd based initrd
Date: Fri,  4 Apr 2025 19:29:25 +0300
Message-ID: <20250404162932.447699-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214355

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


