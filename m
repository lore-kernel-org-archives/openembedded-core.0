Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE14C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.41481.1745332516522671622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FbQdM63I;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5896229e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332515; x=1745937315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXshFCzrWm5x4SQPFDoxUHUjCigb01yT75x1yn3RhMg=;
        b=FbQdM63IvLHJv5JSfMpDstlm+0kCGg8iGKf3b4r3h9g5kN9PjwO69eIQI8tBMGR5Pi
         dcNFC2qdkim8CndocqgKAGQu31IibUsAoHA0Edh2kiG8s/dJ78kj3exDD5eNC58rOU6I
         7YrOCaxraYfom8V3Hsu33a5eFLF7q2ReUTttT9KzMJA66Qb4KFydStjAem0jtjPoJOoT
         yFz1sO9LT3PWgALLTY8cAfPnER7xKhvlw2VsKrSF/TW/qoT727SK54+agdAstJkzE1+S
         zZebOaSFqVt9V4rusxurZRYSnjlCyAwIsV9kZ3cZqCjiswFG265VqTc1hv9cWk/a1bSo
         Rykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332515; x=1745937315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXshFCzrWm5x4SQPFDoxUHUjCigb01yT75x1yn3RhMg=;
        b=jl+eDOWIt1JSLnEYLk5Nt48fgdX/gjd7OYB1IjXKffmED9Jgud8uBARcHjhGj9w4vA
         m0a0RwTHFBcNYiaylHDQtw0zuGFAad0M0ggP1mFJFG1XfPa7KvJRL2EcWQjfWlYjmyxD
         mhfXKaSKiRq06V0FLrMphVhJ0hm96v2zeUEWFLhqKJneuyLLdz89DBIotMZtObrrzSDn
         vGW4DPN3VP+o5RzhVMIAjR4WIp8yXWw7q+QE+weiLZuPsGTRJCnT4jkP18lnCxtnFKjh
         cMZjUqAGHsKBv8Gw3R+uXH7d5rcMXLnwIULls8m42MflbPxO4E2fCOuVKCsYxBOcfB82
         JIwg==
X-Gm-Message-State: AOJu0Yxlrq8o5eU8FroKkU5GSNlcihD96qIS9a6y6HmM8Q9OrfZN4bL+
	M1KHSup1hqRitg59ZeaqM9pM9ke3iRx3oQ132BG3Z4VEJkrD6ZEphzaRxJe1cgls5kq+vBNEidl
	KyPg=
X-Gm-Gg: ASbGncthcw8PfheFtQyY+1nOP2wddvHF8klmV5QW9tIJZppGthg6jkDWmwEO956AXWg
	bP6jhe64A7+2BlXehlYFrz4NBkJ4G2UArDuU/RgOceDKwW5EN7x4xbuTOSpcYlOtzNo8Q8S8LMX
	qGjiN+vkDJx5p3ONwfUtSGtrav/678p6RP4uI9sIAORXE8ChmroaG0PIkn6TH3DQ/z3WgXojclf
	Ah0KbSlsVDYdu/8FBzhFuBJJSK/je8/DX0onsAj5MrbdZpzH1lKcwaHOLIutOjKoyVWqiFHHUVE
	VQh+WxoutYAc5qxkjnbvhPDPmURxrJIPrgeiY2NTbSiqIjT4ggciIDj9ZSJU0J2EBhP+aGEeiHP
	wIK59S8t5VDt2PQzRcQ==
X-Google-Smtp-Source: AGHT+IFj3uTDED7qpKABusUae6nEuJb8lHYeDOjcdL8Vq8OXDo23CwQqXydOSvExtA0HtUU9Y6ED/w==
X-Received: by 2002:a05:6512:3088:b0:549:b1c1:4d76 with SMTP id 2adb3069b0e04-54d6e61a6a7mr3985739e87.5.1745332513599;
        Tue, 22 Apr 2025 07:35:13 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 0/9] systemd based initrd and modular kernel support
Date: Tue, 22 Apr 2025 17:34:52 +0300
Message-ID: <20250422143501.99565-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215214

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

v4: systemd "efi" support enabled with distro feature in poky-altcfg,
    kernel-initrd-module meta package config via .inc file,
    core-image-initramfs-boot uses "systemd-initramfs" in IMAGE_FEATURES to enable
    systemd based initrd instead of distro features,
    wic patches as in v3 as I think this is the right thing to do
    but they are unrelated to modular kernel or systemd initrd and
    can be taken out of this series

Mikko Rapeli (9):
  poky-altcfg.conf: enable "efi" in DISTRO_FEATURES
  kernel.bbclass: add kernel-initrd-modules meta package
  core-image-initramfs-boot: add option to build systemd based initrd
  core-image-initramfs-boot: don't install RRECOMMENDS to reduce size
  core-image-initramfs-boot: install kernel-initrd-modules by default
  oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
  image_types_wic.bbclass: capture verbose wic output by default
  wic bootimg-efi.py: fail build if no binaries installed
  image_types_wic.bbclass: depend on grub-efi and systemd-boot on
    aarch64, systemd-boot on arm

 meta-poky/conf/distro/poky-altcfg.conf        |  3 +
 meta/classes-recipe/image_types_wic.bbclass   |  4 +-
 .../kernel-module-split.bbclass               | 18 +++++
 meta/classes-recipe/kernel.bbclass            |  5 +-
 meta/classes-recipe/module.bbclass            |  3 +
 .../distro/include/kernel-initrd-modules.inc  | 37 +++++++++
 meta/lib/oeqa/selftest/cases/uki.py           | 76 +++++++++++++++++++
 .../images/core-image-initramfs-boot.bb       | 34 ++++++++-
 scripts/lib/wic/plugins/source/bootimg-efi.py |  3 +
 9 files changed, 177 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/distro/include/kernel-initrd-modules.inc

-- 
2.43.0


