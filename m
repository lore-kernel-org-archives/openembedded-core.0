Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55F6C3601A
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:29:54 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.1455.1743784190181314703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nKiqifMV;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54996d30bfbso2065586e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784188; x=1744388988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AHVcgVJewMVOreS7WL1mez3pihX5FJLLtUk7rxArac4=;
        b=nKiqifMVfGwQUXI1qo2siRebq26ujcDR/QIODF5YWu8fQ/chN6SaskSNF6bQY6QHWA
         Ek5uroFxp4z7b1bZxdDaMM8yy8PG42I31XyE09302xMry9WtNhF5qMq8rE6PwzKDu7sS
         uy1c9GCtRDHlkm98rPeD1qrDdRIJs/uTN060Hsi7dOb3kIXCdaqcD1Lm8XHMkNcleWVJ
         unoldHxv3UcF6u37yiHmNlmdv8sgXlWgl5g2WDek+fe+gQK4UgIlrsK1fEJiTHSXP5VJ
         w/WKrocNWuATDoiUiHvSdFdJAsws1XR3t6sWunnlc9Uf9ouWD0Bk6xR/T2ycKOOSAWk6
         lonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784188; x=1744388988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHVcgVJewMVOreS7WL1mez3pihX5FJLLtUk7rxArac4=;
        b=qehkGhY+p3KhlrDsYbPFBxOnpa6yEciHwFv+sh3sYJSJE8+KKgBwBJGCkwqBZKTnN5
         RyQwZy+a/hwLZA+ybldLqraMLIGCauwQg/r1Ca8E0q+9MFS1wM81XREWeVdhmiw1ioNH
         yAdKv/pCSq6w4cV12S538wR76QyitJUgadOZGvh5GuPAuVBkIXlMQ5tdwGHSH5K7ViVx
         uZDJuJ02dvAngN+aLOYEUh9H/Bhbc4MKJ0s/9MKqjLwp5ODlqGh+zXrkoO5f1thCql84
         MX0c1F2bP8/kdNaeJ5r30sBV4xQuQnpaVN6xaKUHpCK52tys0BFghRRUJPe9pVU/eLZn
         Lpkg==
X-Gm-Message-State: AOJu0YxWGuyeUUdWQifnbUZGbRMMpCDjPqtpr8bL1ewCZprhtBsYIE3Q
	Xhzv+KOIa20dQPshN62oDNozCYNmPEEucLYyCsISfndmEOk2crwlVuTaaIUWQnrAqiX6hWgx+5d
	P9zs=
X-Gm-Gg: ASbGncvFASg8DvVmAm7nM2XOmuVW11ugyKA2RPGRzXqaWpq7o7G9ze97rt0Czlw+mLC
	CMf5UP/bOO4dlijb6FmuLH2Ew2rUuMKSW4Y3LFc2QmbjOLqMAYv3ag/hUvP1KqefCR3tYjiPPud
	6dYsIPQyAbFyJ50+nn4/QjXTPfVM28jSrYcffqmeNE66zDlQjaDEN0XPPUlIK+YnjgW42MReqkN
	wTV2KO4sLR85F1kx+oIeL0eofM7D1rxB6rU+F1ONSPJoxkDqkjLS1RDyexs8aJd92W66LsfYgj0
	or25Bg035PCD5x+Zrp/U+puUP3NNlD0s1TOtw7ZNtad4ubJi2x6EjFLhusL7ppzFpSYc5npZO32
	IyMbl47Szq0J7Q7ixZlKSAg==
X-Google-Smtp-Source: AGHT+IGzmboJBl2K/QqkziEjL4c1fMRNKGB3k3/jaKDcJPfvAzFCY7GTxSCAn3LuTMKlBDGdjVo21A==
X-Received: by 2002:a05:6512:e98:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-54c2277ab0dmr1163211e87.22.1743784187939;
        Fri, 04 Apr 2025 09:29:47 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:47 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 00/11] systemd based initrd and modular kernel support
Date: Fri,  4 Apr 2025 19:29:21 +0300
Message-ID: <20250404162932.447699-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214351

systemd based initrd supports more security, encryption etc features
than custom shell script ones but oe-core lacks support for it.
Convert core-image-initramfs-boot to create systemd based initrd
if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
for this initrd to mount rootfs via Unified Kernel Image uki.py.

Sadly the boot time is really slow, e.g. over 30 seconds with
systemd based initrd. One of the major reasons is the large
amount of kernel modules built into the linux-yocto kernel and
processing of their udev events in userspace. Thus add
kernel-initrd-modules meta package to easily install
subset of all kernel modules to initrd. The subset
supports "mount rootfs from any block device" but
doesn't include graphics, UBS etc support. Without this
generated meta package, initrd recipe needs to manually define
which exact kernel modules to include which breaks if
those modules are built into the kernel. Thus the initrd
becomes machine and kernel config specific and hard to maintain.
With this meta package a generic initrd can be created.

Separate changes to linux-yocto compile a lot more drivers
as modules but they depend on these initrd changes.

v1: https://lists.openembedded.org/g/openembedded-core/message/212832

v2: split initrd size reduction and kernel modules addition
    to separate commits, added packages exclicitly back to fix
    rootfs mount visible as wic selftest failures,
    fixed wic bugs which resulted in broken boot due to missing
    EFI bootloader binaries in some builds, moved
    "systemd: use serial-getty-generator on genericarm64" to separate
    series since it's not strictly needed and goes to a different mailing
    list

v3: enable "efi" support in systemd by default not via MACHINE_FEATURES,
    disable kernel-initrd-modules meta package generation if
    KERNEL_INITRD_MODULES_REGEX is not set at all, keeping
    default KERNEL_INITRD_MODULES_REGEX in classes to support
    external kernel recipes (which could be compatible with default
    images to e.g. run upstream tests), tested (with pmem and
    modular kernel RFC patches sent out separately) using genericarm64
    machine config on:
    qemu u-boot https://ledge.validation.linaro.org/scheduler/job/106701
    qemu edk2 https://ledge.validation.linaro.org/scheduler/job/106703
    AMD zcu102 https://ledge.validation.linaro.org/scheduler/job/106702
    AMD kv260 https://ledge.validation.linaro.org/scheduler/job/106700
    rpi4 https://ledge.validation.linaro.org/scheduler/job/106705

Mikko Rapeli (11):
  systemd: enable efi support by default
  uki.bbclass: drop serial console from kernel command line
  kernel.bbclass: add kernel-initrd-modules meta package
  core-image-initramfs-boot: add option to build systemd based initrd
  core-image-initramfs-boot: don't install RRECOMMENDS to reduce size
  core-image-initramfs-boot: install kernel-initrd-modules by default
  oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
  test_efi_plugin_plain_systemd-boot: don't set console
  image_types_wic.bbclass: capture verbose wic output by default
  wic bootimg-efi.py: fail build if no binaries installed
  image_types_wic.bbclass: depend on grub-efi and systemd-boot on
    aarch64, systemd-boot on arm

 .../test_efi_plugin_plain_systemd-boot.wks    |  2 +-
 meta/classes-recipe/image_types_wic.bbclass   |  4 +-
 .../kernel-module-split.bbclass               | 48 ++++++++++++
 meta/classes-recipe/kernel.bbclass            |  5 +-
 meta/classes-recipe/module.bbclass            | 37 +++++++++
 meta/classes-recipe/uki.bbclass               |  2 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 76 +++++++++++++++++++
 .../images/core-image-initramfs-boot.bb       | 32 +++++++-
 meta/recipes-core/systemd/systemd_257.4.bb    |  3 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py |  3 +
 10 files changed, 203 insertions(+), 9 deletions(-)

-- 
2.43.0


