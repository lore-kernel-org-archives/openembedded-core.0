Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F807CDDE72
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:09:11 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.7123.1729685349087843766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sEUeqlyc;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so61053881fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729685347; x=1730290147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPCsD6jow3Pt4v2wUUsRq3n8Ic+iwMwTi6pflg4HgSA=;
        b=sEUeqlycuWsZMCOW/WXvtphia7adeKIbP1hNayz8NUQ3wZTtZR/ukKLUeNThcNV7eK
         fxtDWGSiUhzGWXM95rVurQtlNzbfVnXJDscgNLxWg4/MqnXR8+sUmZP2oXvoDK9MeuRY
         NsGvdm15qG1zpbmHKcFjKNPv1zXglcmohM2ixwgHLtt1sAnamnSa6SSWmg+DcBa/EgGW
         XA1DUeKmKN6JtW6DgVFDWDP5DIGhDyhpR1gehFUadlgjm1JeEdZgyFUWBBby/oOCIOYN
         vxBbLoDntXTG7IrpNgMbjWi3JpEQRjfAApE+C/QfOGDOYbW9w3XQ30n16JvMTu/7YSFH
         TpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685347; x=1730290147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPCsD6jow3Pt4v2wUUsRq3n8Ic+iwMwTi6pflg4HgSA=;
        b=CNwIAeQ6CL7C49uRevw9A8MpYmWyBBV5IHUqZZ2JTDFuVnvjJB2uTRvV2Dj40ciWJ7
         exXIrsde3x4bEJDWxPGAAXwj9KDHwp5A6Sll+4n6KeuNYNkTaQdTlmjh88DlQz8odh1v
         WoN3uauDNiQgWkYsDjssf0252fEf/+k0jeHvRoMkAOZFPxVMSyemVs5S0V6ukfLaNCEk
         VIFs0QX+mWHXLjjRqSTZm4izeTm+DG2NGiC0G8mIij4Qo8FSxFFKIGQ2j5Z7ROj1bQMy
         75LXFFvFPgcjw2o3Dy1YArgpr9jgiHDsGHhUKhQF71QpJkWei9DY3xKrvoK2leFkikur
         UuYw==
X-Gm-Message-State: AOJu0YwSiuc1dkj7bdFxwO0i1AZ+6IZeUNjLCF1sKVWQxwZm1USdNEzb
	LUhya+N5+trbPPGBBCUbNMzjJse5IyIVK2wVpQkMtROogVzfe2bcLPm3p8+rwNgH04jEEWxSMXI
	cGpE=
X-Google-Smtp-Source: AGHT+IFinT6clLpEBw2hpGLfxzmNJIewme8s6TyUmchzx59rhsQOArzSYP021vWfV41is5SX/iLtnw==
X-Received: by 2002:a2e:4602:0:b0:2fb:4c08:be08 with SMTP id 38308e7fff4ca-2fc9d33e35fmr9660371fa.11.1729685347059;
        Wed, 23 Oct 2024 05:09:07 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae25d87sm10763801fa.139.2024.10.23.05.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:09:05 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v10 0/9] systemd uki support
Date: Wed, 23 Oct 2024 15:08:30 +0300
Message-ID: <20241023120839.437771-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206201

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

v10: disabled kvm support in new tests since it breaks qemu boot on aarch64
     build machine, removed "testimage" from IMAGE_CLASS as well since
     can end up testing qemu machine during build.

v9: Fixed wic test on genericarm64. Disabled new aarch64 wic test on
    aarch64 build host since boot with qemu is currently failing.
    Tested wic, uki and efibootpartition selftests with target machines qemux86_64,
    qemuarm64 and genericarm64 on x86_64 build host.

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

*** BLURB HERE ***

Michelle Lin (1):
  uki.bbclass: add class for building Unified Kernel Images (UKI)

Mikko Rapeli (8):
  wic bootimg-efi.py: keep timestamps and add debug prints
  wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
  oeqa selftest uki.py: add tests for uki.bbclass
  oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi
    test
  oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest wic.py: support UKIs via uki.bbclass
  oeqa selftest wic.py: fix missing ext4 image

 meta-selftest/wic/test_efi_plugin.wks         |   5 +-
 .../test_efi_plugin_plain_systemd-boot.wks    |   5 +
 meta/classes-recipe/image_types_wic.bbclass   |   3 +-
 meta/classes-recipe/uki.bbclass               | 195 ++++++++++++++++++
 .../oeqa/selftest/cases/efibootpartition.py   |  11 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 142 +++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           | 140 +++++++++++--
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 scripts/lib/wic/plugins/source/bootimg-efi.py | 183 +++++-----------
 9 files changed, 529 insertions(+), 158 deletions(-)
 create mode 100644 meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

-- 
2.34.1


