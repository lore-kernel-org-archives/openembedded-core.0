Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860DFC36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:50 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.20997.1742563541095914070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vXaL8Vbg;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso18346711fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563539; x=1743168339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLwfrTtHwbnrp6eX5+qZevw3Irga89K5dy4VLcQPVy8=;
        b=vXaL8VbgmUPz8wFNnfnTqodRdZBPsUtaW3MNFXKu4X7wEoJyx9OJMgTlO/AjPvx1id
         8oRbmkQh/zikiK1Po2Q2ZSVO5bRTikgC6p7YODk4so3ZTwsb5yqkzJwlYCXEd1t5iteK
         JZRTZCjJPPixKsTqjT0ED/lE3ZIIoTGF09iM92MVwtWll4LuIinqpLn9/rW7cmHVZmIx
         WF+OSswYyY9M7aQ3ONdOgo1sFEZSwrjgnb9dTKI0oK96V1JuMAy0p7z9b4H6oMFiLGt0
         8QP822FaTvD50RZFpB/TEWYatDDNKa/WBOn1gra8OuVQ+5glo8B8gqKwXtnOJnfI0SwO
         TVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563539; x=1743168339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLwfrTtHwbnrp6eX5+qZevw3Irga89K5dy4VLcQPVy8=;
        b=ZCceIuRvWgs+M9IRoGfFHmFQE6clSZHQ83Xc52g+5/ipb+M8FPdXbi7MHqbcPtIqSd
         pJQRlmhgllE8ThxyFhlETCnyTzA1OzP94SR80IefU3YM2qaJY+XJmBEk9jMJJpM+gLK4
         3z8WFFzb4ebUr0hq42cLftpngmGB+DLR9MM7ejed4qqDUjOzeOE12VPlHWEysy8OSos6
         Ysoxl9CGPt52VMTQ8zogtWeV6DdoYSxAWU3Qgy5WiT+cEKtBKQBUSPalSWd0IaEDOiic
         OgGvBgfBBzL+AOZojQ1nuR9MUwlgSw1W4SoAUxYCvp/q05VwbRa725+z0NN4z96avQAa
         95SQ==
X-Gm-Message-State: AOJu0YxteBhGVljEHj/zaENJpYMXL9+VeAECo1PQfnOGadfq83uXmUvy
	WsmnDyw03UtxbAuN/u27GlWVz03pFfYf0uGGQKOrmzPE0uGjrqlkTg98KQywH+fPy/cq1IlqjBs
	2cGQ=
X-Gm-Gg: ASbGncsjxFMIIvUoiJ0Yuz2U3oWqQULhqnOKcjAzRWCf+H3bMAzfNrHkZmGboFJEwNF
	TdW0CZ7VV/OOU8D1NOnKOU6+CejPFz4PNnEyJNC2ASYqNAjuXjXLs6+qteyKKLn2ALYfZLqGwJ/
	LMmAorBD+LrLUzJAHOCrYGG693SiEClB4A+qqtNmbt7DPcPKqaYxO4AECF0zk6VuuXlDvtQ7wrC
	81LPIg5DW8H1QjpHZ7Bd2Sk7d0Ic0toyZ6OJ/9LR1gY519lzJBVtjXzDv67aihrx0BHh7xwoJtl
	i+SQv+cLiA12QY//z40SRh8yUii/qORuGM3Ivho1YZVRcmwj6p1wN6dkE2uJoU6rE7gAdsOhyEm
	L6svZG2fYwnKvlNXEz/oJaKdYFTSppwal
X-Google-Smtp-Source: AGHT+IGmVG/OSYJyQB8uWvFhUUrr4VQGSc1BNXVkErNsAGLVnlg6ZT6rd9nNMBh6Ngnixxp0DlXtzw==
X-Received: by 2002:a05:6512:1149:b0:549:7145:5d24 with SMTP id 2adb3069b0e04-54ad6500471mr1157125e87.46.1742563538980;
        Fri, 21 Mar 2025 06:25:38 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:38 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 00/11] systemd based initrd and modular kernel support
Date: Fri, 21 Mar 2025 15:25:06 +0200
Message-ID: <20250321132517.670372-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213456

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

Mikko Rapeli (11):
  systemd: enable efi support if in MACHINE_FEATURES too
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
 .../kernel-module-split.bbclass               | 46 +++++++++++
 meta/classes-recipe/kernel.bbclass            |  5 +-
 meta/classes-recipe/module.bbclass            | 37 +++++++++
 meta/classes-recipe/uki.bbclass               |  2 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 76 +++++++++++++++++++
 .../images/core-image-initramfs-boot.bb       | 32 +++++++-
 meta/recipes-core/systemd/systemd_257.3.bb    |  1 +
 scripts/lib/wic/plugins/source/bootimg-efi.py |  3 +
 10 files changed, 200 insertions(+), 8 deletions(-)

-- 
2.43.0


