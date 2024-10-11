Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F7BCFD371
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:21:10 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.10166.1728649263648920891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UdBDtq5m;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398b589032so3373836e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728649262; x=1729254062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uvp8OWolpPQffR83mWzZc3sMQvo5Y2I/MDTEuVsVz0=;
        b=UdBDtq5mbNZDLBdk/wor7z08Kld2sk96y0ro3uCTyZED1WOnNgQ1OlIfSd0i1qaNWg
         viPOyjS/JGIRB3aJEEeQiqy8pMdARylnm1bG0YL0ssE2ngr5TVIlMMpKsmQxP6u+EgVz
         5VeuCDM5EAYWtybbpJ6ds2QXiOiqKUUZxS+Epoi5xDsb7E4tvIA+avEAziglPcZ57F7L
         TKPjIBg3+9QkDoXHXjRGatARE5ts0l3nkGEpX20l6P13+rFihCkIiNI9qaMsajBtyesz
         ZrrJEgvz0wIRYxFdTJZp384fu08HrtLg4d0oKBh2BNZ40DbUI8+dEjKC+ijN/lVVEXrd
         8c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649262; x=1729254062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uvp8OWolpPQffR83mWzZc3sMQvo5Y2I/MDTEuVsVz0=;
        b=kWy/q5K6Lzc/nEcdvOZN2Z+f9FtBC5ovtzgdPgyaX6WvwKjz0fZ899AsgsUgtlXhdL
         UBz+d8rMbr+cNrfVw71ARNVqPKAEkw9QQj6gTbkM6uF7ZWnicIgJ/kVjoLPP/w92rhVD
         WGLfGEmHUL8jgqFinJAczXCoi9ATtcTFPk0cGsqeplkkQ5eVBl/pAwb9kyTVb+wQniZX
         0x2lGoAX2BVv6DryQaS3DjbHpI4Hv6eE0/IkIDv2744eWnEQzLLVRLQqEWgNlsw84oZN
         bYc3Z3/igVZBqhyOOV/mTlRKSAfLfqywSKNa4MfYzASso5kQlzCxCviseh6vLwHCvqmj
         F6mQ==
X-Gm-Message-State: AOJu0Ywy7jECcOeTEhQMgqXIoGfTdGGxzqwX8hNAIHDfkwjN07q7Z/Su
	VsfU9lIbp0x644REPxjzzXcVc/a2tBZlYbCR+4Dl4Mg1CrA8udLLkXfU00PEWj47/PSrM7XSvbG
	A+3E=
X-Google-Smtp-Source: AGHT+IGvem0cDRQGBk6DddUqNQ5hQaJL7paMqAJ8TkG4XdYvCCGw4Fx0losbKyCdiUvQQ7nSFl2Fug==
X-Received: by 2002:a05:6512:3052:b0:536:54ff:51c8 with SMTP id 2adb3069b0e04-539da3c4bc8mr1862961e87.17.1728649261603;
        Fri, 11 Oct 2024 05:21:01 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8608sm591336e87.89.2024.10.11.05.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:20:59 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v8 0/8] systemd uki support
Date: Fri, 11 Oct 2024 15:20:36 +0300
Message-ID: <20241011122044.12222-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205685

These changes enable building systemd uki images which combine
kernel, kernel command line, initrd and possibly signatures to
a single UEFI binary. This binary can be booted with UEFI firmware
and systemd-boot. No grub is needed and UEFI firmware and/or
systemd-boot provide possibilities for boot menus.
The uki binary can also be signed for UEFI secure boot
so the secure boot extends from firmware to kernel and initrd.
Binding secure boot to full userspace is then easier since for example
kernel command line and initrd contain the support needed to mount
encrypted dm-verity etc partitions, and/or create partitions on demand
with systemd-repart using device specific TPM devices for encryption.

Tested on qemuarm64-secureboot machine from meta-arm with changes to
support secure boot. Slightly different configuration tested on
multiple arm64 System Ready boards with UEFI firmware, real and firmware
based TPM devices. Tested with ovmf firmware on x86_64 with selftests but
without secure boot which seems to be harder to setup in ovmf.

Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu and
wic.Wic2.test_expand_mbr_image, failing when executing all wic selftests
on a build machine with zfs filesystem. Will investigate this further.
The issue seems to be in mkfs.ext4 producing broken filesystem, and partially
in the tests which don't run the correct rootfs file (.ext4 vs .wic).
Will debug this further and it is IMO unrelated to these changes since
they reproduce on pure master branch without this series.

v8: fixed comments from Ross Burton: debug print from warning to debug,
    dropped duplicate DISTRO_FEATURE setting for systemd in tests,
    removed aarch64 comment from tests which are currently x86 only.
    Fixed the new aarch64 wic selftest to run on both genericarm64
    and qemuarm64 by adding bios, virtio disk driver etc settings
    for runqemu (already set in genericarm64 but missing from qemuarm64).

v7: add missing "ovmf" to runqemu argument to
    test_efi_plugin_plain_systemd_boot_qemu_x86 to fix boot hang

v6: fixes wic refactoring botch which broken non-uki systemd-boot usage on
    genericarm64 reported by Ross Burton <Ross.Burton@arm.com>, added
    selftest to cover this wks usage on x86 and aarch64

v5: drop patch "image_types_wic.bbclass: set systemd-boot and os-release
    dependency for all archs" since systemd-boot does not support all
    architectures

v4: handle missing runqemu variable from build config, add
python3-pefile to fast ptest list

v3: rebased, fixed and added more sefltests, removed wic plugin side uki
support

v2: https://lists.openembedded.org/g/openembedded-core/message/204090

Michelle Lin (1):
  uki.bbclass: add class for building Unified Kernel Images (UKI)

Mikko Rapeli (7):
  wic bootimg-efi.py: keep timestamps and add debug prints
  wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
  oeqa selftest uki.py: add tests for uki.bbclass
  oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi
    test
  oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest wic.py: support UKIs via uki.bbclass

 meta-selftest/wic/test_efi_plugin.wks         |   5 +-
 .../test_efi_plugin_plain_systemd-boot.wks    |   5 +
 meta/classes-recipe/image_types_wic.bbclass   |   3 +-
 meta/classes-recipe/uki.bbclass               | 195 ++++++++++++++++++
 .../oeqa/selftest/cases/efibootpartition.py   |  11 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 133 ++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           | 131 ++++++++++--
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 scripts/lib/wic/plugins/source/bootimg-efi.py | 183 +++++-----------
 9 files changed, 511 insertions(+), 158 deletions(-)
 create mode 100644 meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

-- 
2.34.1


