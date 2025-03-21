Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4A7C36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:00 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.21071.1742563557128146752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wBvEJl5P;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548430564d9so1942817e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563555; x=1743168355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEdcHTXNTo7S4AHroNTI64Bs0zK9/f0xYWd5QZeIfJM=;
        b=wBvEJl5P6QwGWdahXIi09I+/NlvsL9Qax6ynXCPdPWIQ/zHKSTVDDGhC4MJ6FMh04c
         1Faekpqw6vEkZlXOWQA+Fa19ykZ8o5SYEdj4OtptCOGp2sDX2AH9EbsEKj7v4ujlGSNG
         uLCRLFtBRVAdQ29Tf50jkfO7bn92QadAv0A/H1kw/auWvlx9LqaPMH8IXNPrWSt5dBcQ
         GaFUVuY1/pgAjBJ5zif4VGKFH5alwdGvCm4YRKalyL7P0TuXO+JOpgn87ZYRnqb2Nd/c
         Zio0vAweXMtqAT9qsBGRP4CZtqFx4Jr7trVr/UgYmFSGegKYSDavyCT3SrkVg8DqvsD8
         +0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563555; x=1743168355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEdcHTXNTo7S4AHroNTI64Bs0zK9/f0xYWd5QZeIfJM=;
        b=oWws1f9pz/eRl/a2toPFx6bXE05hJw3Uh4cpNzLD6N+EQ5R/jUEupK1yQ9+wTQz7rx
         Q8jAc8QdfvN9CoqE59SfMjYLvh/QkCcoJLA814psaNnKDGvQ5biE6+yNwxJLq4/XPic1
         ngyvrvu2sw9TiZpUJQo86wqFpVyEKUH21e+bZtlgclZ1LMsdxGdHVwejBblTdoYQo5bg
         CJsygyt/FnjMtWqMY/7ITvUDbUxuFIKTvofu9OJSdaW53ousxsa2Dr++xqpC0tN22oLi
         jzzVzS1c6vYBPwEWccQqq2n8QONW6wxgMJXKfjBx4m8KST0rikld+HnhTtSezikqWEOM
         inWA==
X-Gm-Message-State: AOJu0YxkqtXnujhTIVPq782I5x7CGwfkqBiBVt3KzqypfZlncuo12jL1
	b5juGF35tiZtV9n6OcVjNV/F36oRQNdIYbMG8HvD6oBM/CY2Z4jp/tDSlRx95o5bW4RXeqa5i9c
	rJy4=
X-Gm-Gg: ASbGncuR5KZ5YTn82P7527yC4RaaI3UjEAGwGyzk8Nufyu6nEw7ZSmME/hld6hRwEmi
	6jqyLULiy3Tl/qie2/mIWRSxkGTnbN+7fHDIvkglJJCjbWTRSMie0RqBtSDHvffS5kLhoFs03/9
	ZSRQPKrlI/+LxI5zT96YIwuDbdK53/d0kHzL8VNkQbT9GI+FTUqfXzQ6BXaFn2Tt8JTHZez2Vwg
	QH/83/O0lCFgqkHBPyey5HFkY+f6WFQkk5vNc1VHr7T5vBd3WZp8EbB447vCVGgKwcGKP1rVVXf
	eoRIN/Z84doJmhfNx6wvOY7GnZqursf/JKG0NrYTzxdovpSmJxCRGK57E5osW8evm8WRb/lbXZ1
	uNUMMkOIFz4WxSgORhsAgh1EVtrxX1Dyt
X-Google-Smtp-Source: AGHT+IGfWO+mL/SxEDiF9sRm3nrw6m7cPYrkhJBSGFgx6yMEYKCOA5z3RSPZbgS/fv2iPqU3RgdwYQ==
X-Received: by 2002:a05:6512:3c9b:b0:549:4e79:d4c0 with SMTP id 2adb3069b0e04-54ad650972bmr984909e87.53.1742563555244;
        Fri, 21 Mar 2025 06:25:55 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:53 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 06/11] core-image-initramfs-boot: install kernel-initrd-modules by default
Date: Fri, 21 Mar 2025 15:25:12 +0200
Message-ID: <20250321132517.670372-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213462

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


