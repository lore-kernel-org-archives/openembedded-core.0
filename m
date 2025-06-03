Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9658CC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 12:30:18 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.10040.1748953814476248633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 05:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eEwRMzfH;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5533c562608so4201927e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953813; x=1749558613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXyUfC+oVeICC7a5NDBDoeLDjSTWKC0GgrYexlvwDEs=;
        b=eEwRMzfHxsbijajEOtpgbw2gw4UKrXqRFaRdFFr39/AfybAar3UrDHjaQwKjPcrr5i
         F0cqLhEKjYGt/pt/N/y/cWbsUsFobShcjllinw3l+5vwH0csOd22+hRs3qeoVmR71uH5
         PV2nM1E1TBZUb3Jz1LZqCX8w3MiYUhHQIO2XfGaK6XDw2ua+cIS32xH5F/tEcII0/ZRM
         BctRFU5y8syk/zxDbiIMcKAMzczAPCvXgOhm6oN9QaebWr24yr5gtG5qkxAe+mynWVYw
         bh4P+9QLITPwdUjfODdzZ7C/lKXqmi12wGbzN0ig9OKLO8t/ZLlkSBOflgwpowbl4QgZ
         y9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953813; x=1749558613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXyUfC+oVeICC7a5NDBDoeLDjSTWKC0GgrYexlvwDEs=;
        b=BtS7raDivnrUf9zBmmbbLOxnu5LCurVMm4OizM0OFUB1ZDn9Ku48Zht4Hw0Oa5Qne+
         LlSBrQRX998HU0cNE5uS6aFa+JL9A5DXY+JBMVZomrPTEkq01Hha9/6dK6E6i0jQZ6X0
         ud+mS0BtgqVIIwz2LqUfLs5FEVrF6w1GQv3rK3lRcfR+CcF4KlF4Lttj1ewn0eBgc16T
         55g0lCqqfa7BOIGFo7gDn7C2tCuTTy/0X/RquB7Y0gN8pmHjBh8CLTf+8AVGr2/nr5Gg
         W9eU3Bz178wPC5grAxLil1z5yjwKJFuNW4i1AYdKuhzAq93OTQKnjUEd3NBpwjGSW7hS
         JBQQ==
X-Gm-Message-State: AOJu0YyraMfx3mq7c4Wxgh6SQY3og5uyUszNQhGBVaZ+qVg3H7Pij6kT
	lYbEZbQGwm/tuF7tiiMcpCPzxULjASVu2EZvYRvyzs/jXQJxwA2ol1yh34OUJxF8ACToyP7MSA2
	KdUlHFT8=
X-Gm-Gg: ASbGncvpLx13P4QQit/uWjyYR1nv8JsPDiEb4hG/2xPaz9RHnnN0Tymgw/osPgg3Jj8
	rKQ7+QB1UniOykrD242EAl7vo1bdgom080eZS6BxQGidETaAo1tWoyikXFOoyt2vnt3/CAhM0h0
	omdlM75YY+NC9Vj/at+kuMOmHtk9ych81C6kF8GwR6QpUmC3rqZVlQoMRmD8BdoHhaYyy/LmAWE
	TMAuUTCq0F4iG8FdifZ4V4fpfylPFdgMAlenVi8m6EaP7ts/g5dOl1Ilj/coZ/TJNqdVznIdg+u
	CL1Dk/m0X2d+rtl+emWtWP71BFyFL4PH5uGlNFp5kXlxnH/lUdhApeZJaFHc0kXWkgph/+ojUIJ
	KYLWziw54EBaFCM7x0g/EzVlBEYY3FUdfG13UFgg=
X-Google-Smtp-Source: AGHT+IGTzOYoPKcahIa4tqFySTv2B2QKGGu92+8v5+poIigtgOLo2YrJTrRhWCxHNahjCeq1gE8b8A==
X-Received: by 2002:a05:6512:b17:b0:553:20f2:2e77 with SMTP id 2adb3069b0e04-5533d1c5a9bmr4197033e87.55.1748953812520;
        Tue, 03 Jun 2025 05:30:12 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d0bcsm1920295e87.208.2025.06.03.05.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 05:30:12 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 2/4] u-boot: disable USB support on qemuarm64 and genericarm64
Date: Tue,  3 Jun 2025 15:29:37 +0300
Message-ID: <20250603122939.1027947-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603122939.1027947-1-mikko.rapeli@linaro.org>
References: <20250603122939.1027947-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 12:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217811

qemu USB devices under KVM currently cause reset loop
in u-boot. If u-boot USB support is disabled then
u-boot just ignores the qemu USB devices which
then work with Linux kernel as before.

Issue has been reported to u-boot upstream in:

https://lists.denx.de/pipermail/u-boot/2025-June/591233.html

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg | 1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc            | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg

v6: changed from qemu options override "qemuarm64.conf: allow overriding QB_OPT_APPEND"
    to disabling USB support in u-boot

v5: https://lists.openembedded.org/g/openembedded-core/topic/113322399#msg217801

v4: https://lists.openembedded.org/g/openembedded-core/topic/113306017#msg217349

diff --git a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg b/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
new file mode 100644
index 000000000000..1d2509982be1
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
@@ -0,0 +1 @@
+# CONFIG_USB is not set
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a77c49cb8b7f..6cd9c39430f4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,9 +16,9 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
-# workaround for aarch64 kvm qemu boot regression
-SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
-SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
+# workarounds for aarch64 kvm qemu boot regressions
+SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg file://disable_CONFIG_USB.cfg"
+SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg file://disable_CONFIG_USB.cfg"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.43.0


