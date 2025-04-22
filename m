Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C70EC369DC
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.41490.1745332523778065129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SR1qyPCy;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54298ec925bso7677349e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332522; x=1745937322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pxH9T4IEFNYYxy7CvsJ72BR4Rb2Hp0n9sew5/cBFRw=;
        b=SR1qyPCy81ABVANGm9m+ah2h1kDhjxLaTd9pzvuQ+42GkJhxjJUIei4otnCTeKaJiS
         JUOMoI9OFPLj42sqXNphGOVxQVXFDQZjc6Cnw5FraSXrpG5ttjdZ7TNLR3HQMl6INAbC
         /ACVLr+TP702u2uncm7FK+5/QgZ/fugnH/cRTez7dEgKDTBXIxtMvxPeLS2GUivxiWxZ
         YkOLiXv+SKunHPlXy/mdL5Ifr5/sckC418bqrIe3RbzcrmPeOBxS6/pdyXyQCZ6R3HnZ
         V9NTZw+ug4SstJwpWKpJfhq5m+OCJNcXGhBbMS9U04fPc2sNqV5QSsKdADQW5YLOJiVa
         FfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332522; x=1745937322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pxH9T4IEFNYYxy7CvsJ72BR4Rb2Hp0n9sew5/cBFRw=;
        b=bMZN8xFKfnh3hlx0dXNAtehPysSXrwyxCAYcX4E7OrPi1nbCdY8Llpx569p7uSaIeM
         j7/HcuZgvCpwphltvTx5ONBd3AoiK69ZNgmLj1Itwja3s8yU3A5CNnACqbMnrU8fl8KL
         6NGWpV/B1gFaMKFU5b6p/62gWRuXyg0PmdCdkxQRlquDHfZ/h0HUKQ1iXr1ZUQosenOS
         +xi31AnRS4RQbM+0XA1rwiBRMTw/3aL+B2Q8dnVvZcWaRlSh/zjRZ/p77lz25uiak1mh
         e9tIHJqPblqjyA9X9xg4WM2G2JRUcWVurpDojD4WE2a8ITs2VmDlorNIV+3TFxcVHGK9
         NqZA==
X-Gm-Message-State: AOJu0YydHryRJHA83Ml7SwQhM9VLUKXXj17Ud1TsV6UQB6KJAucTX1JV
	Hw5zhJELakTNY5hRlhngK0Sjpq30wbHp+2/aRXmKfkTs9ax2UjfKO5Hm2oQfmXZlCNcs8Bhgd1Q
	h5hI=
X-Gm-Gg: ASbGnctIp6H/lVbTDKlncOGtkv4XFzt02bVh3k3G+muB0gVw2zwVc2w20SCzWq3dSqf
	LAmsnj9dNiwBGjqviMyeBqSpNjwmx/v1sHq9IHD5Wo9UY9Zcj0HMIkAWBSNX3GQIzvo1W5PYbU4
	N+7MENmc2FNpRT73wCIKt8WQc0KzyYqa4RILbu79uAnCPtsc9icp4+KPm9ORhpRxhNZBK2eKsJR
	4ivbI4izDrQidjVpHr+rgLJxybYmINn2DCJ933qwuEBljFgvj9srHLmWyM+Lm4mHmZu330gw9LS
	WJKfOb+gC8wmTJOfgfJUHJkZcpFpb8+d3v62aZoQtl1U6dGFedUktFNsg8OmS7Y1c7RkbUcIiP0
	aYWlnku00wU3fKPfjig==
X-Google-Smtp-Source: AGHT+IGnwKB4/S+fxd7LaXS+IJ4xI04NvkLqgGcBsgAM9SrW8B/qe99khVPH9QtyocJx2UkoH4bTPA==
X-Received: by 2002:a05:6512:6cb:b0:545:ea9:1a19 with SMTP id 2adb3069b0e04-54d6e61a9camr4020357e87.5.1745332521890;
        Tue, 22 Apr 2025 07:35:21 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:21 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 5/9] core-image-initramfs-boot: install kernel-initrd-modules by default
Date: Tue, 22 Apr 2025 17:34:57 +0300
Message-ID: <20250422143501.99565-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215219

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
index e72efab55d..1690a51d42 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -23,6 +23,7 @@ PACKAGE_INSTALL = " \
     ', '${INITRAMFS_SCRIPTS}', d)} \
     base-passwd \
     busybox-udhcpc \
+    kernel-initrd-modules \
     libkmod \
 "
 
-- 
2.43.0


