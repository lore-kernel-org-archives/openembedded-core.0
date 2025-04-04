Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF359C369A6
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.1466.1743784198153766063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qrwOjin1;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499bd3084aso1988954e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784196; x=1744388996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEdcHTXNTo7S4AHroNTI64Bs0zK9/f0xYWd5QZeIfJM=;
        b=qrwOjin1sZRk7VYHY62On9sRqORFdOgozruxC96WC7L+2yc39bMuqp2sGqNmBWd2e2
         pIypuoRis7gvVJe/alxiwmOjfg0DB4p2RDgftkyJLPZHmjKsRwIkHCHsAEHKMq/8Q4H1
         nBtpRxhV4q+hoeX0ZByIQXAGWcJ9uteHSasGzLhLxySIQ4j6hbeYph+sAhKP7jkQfxlp
         0VzAKe961soB2S4ewitgW+pvz+MnXm80AvAnBBeFSNIO8P+tRj/ENwIjo0QX0qHFHq9v
         gV0KtUvsm1HtRx+0fu41LCk37xzEclsTPbANMTGRuW0HCDRLWq2AWHOFzTwsGCR2osYs
         hG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784196; x=1744388996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEdcHTXNTo7S4AHroNTI64Bs0zK9/f0xYWd5QZeIfJM=;
        b=gNPKmMy6EkdQbEdXTVN8RfyxrnDQpJ5aaVELrfqLGo6BiqgQUfIt9hs8DquCpD0q2s
         7ogLFf56TDYDImn7+grTOQ9x3wrHGLyqsUKuUSh1iS3xzUuaYJR7a6P0t0gvy6bgQrx/
         m1N7NYVAVC+QHD3HTB/vpbrB8vFpQN/2dhkucOo90HXbfVRyJJCV+jrR5K57io93+Kk+
         MUlCznCYijh5hydmiisyELrXRnyHZJwptky4J2KfuBRjDg+JLhRR7Rx0c30Vk5MFhufD
         ejdBu0EYI8CPKXfhOQKejlKxJISlDlc1or4lrBJC8asJJGnMrQgoi4H5Vha9vQcIR83n
         s8+g==
X-Gm-Message-State: AOJu0YyCld4IBcnXcgDWz5/TvUtwJ+9LhPl0HNc9eegHQQ0OmjERV0hj
	v0jkAfL2aJrlv1DAl6oFqGgCXRUPZYlmIezmb3EfsrJQJ1o6JwevBpZsmUAhO8x1zKCTfnBcuC/
	MrWQ=
X-Gm-Gg: ASbGncsC2IuEMD1Lg6yjTnJdzDy/YgOrWD8y6MUA0VfV0hN7R5TPOCezSMl4/5DUFlv
	VyBrJyaZMP0HvfH9kp2vA15mCX43dG+dXOVBh7F3RMXT4FIdvzOaea0o3nsFC9kdkKOe2h+yPR6
	sWFJX4YW44Tx5WLSOQ+nwBcv/N5Pfx0uIWRDHQnflsya2KDPbPaKN6kNYxOxyYxEd0BqBrVHthH
	qFaSl+KpX6aMSijY0XhghE0vZ+sHhTSqqDs2ylA1Sc3j37oLrR3ap9XJi9k664heEfdt1dYojyb
	8RAfJLbpUt+KLF6kD0lEU0SKOvubNKHOjaHxJI31tHA1cSsdCldWkuqBsHERemrZ4tWYFF3Q5CE
	7fYiGr9WiavfTZgBWLGQkNw==
X-Google-Smtp-Source: AGHT+IFITs+1plSt0KJq8WyXiRFX8JowREoUTeREq6dCCCkArOM9HqkRSZylJn8KNogVZBXJBnpHxg==
X-Received: by 2002:a05:6512:3d2a:b0:545:c33:4099 with SMTP id 2adb3069b0e04-54c2278c23emr1056523e87.27.1743784196233;
        Fri, 04 Apr 2025 09:29:56 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:56 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 06/11] core-image-initramfs-boot: install kernel-initrd-modules by default
Date: Fri,  4 Apr 2025 19:29:27 +0300
Message-ID: <20250404162932.447699-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214357

Most real machines in core set

MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"

which means that all images including initrd have all kernel
modules by default. Only default qemu machines don't do this
and instead the kernel configs there seem to include enough
drivers built-in to mount the rootfs, and this may be
reflected in qemu machine configuration e.g. which
block device emulation is used.

Since for initrd "boot to rootfs" usecase full set
of kernel modules way too much, use the subset
from kernel-initrd-modules which should work
on all machines. If not, then the KERNEL_INITRD_MODULES_REGEX
needs to be fixed for the machine or for everyone
to include any missing driver classes.

Same could be achieved by introducing a
MACHINE_EXTRA_INITRD or similar variable for machine
configs to define extra packages for initrd usecase
of mounting target rootfs. I have not done this for now
since currently only user is kernel-initrd-modules.
Installing kernel-initrd-modules by default enables
the machine specific kernel configs to move drivers
from built-in to modules. The other e.g. firmware packages
installed via MACHINE_EXTRA variables in core machines
are not needed to mount the rootfs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/images/core-image-initramfs-boot.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
index 99388476ac..743e0da132 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -21,6 +21,7 @@ PACKAGE_INSTALL = " \
     ', '${INITRAMFS_SCRIPTS}', d)} \
     base-passwd \
     busybox-udhcpc \
+    kernel-initrd-modules \
     libkmod \
 "
 
-- 
2.43.0


