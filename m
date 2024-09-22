Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6C9CF9C69
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:41:54 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.11622.1726994509145231584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=soHFGrbd;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53568ffc525so3966907e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994507; x=1727599307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQvg/UKbej3tgFl6nwoGfqOebkxCIS6p3Ow/RZ2t8dc=;
        b=soHFGrbdkz4Ki0DOAOeN5YdIkr9n5S9zbzpQEfaOc3hZK/awSm1pPxr+GTt1bKtY4W
         2IEo1AzjJA+CvoWg5Ii5egbA4r4yz+7jERCosVQkCwP+gmqkbE7z3FTeAZapeU3U/mMB
         jR0PFhuE3gsJZOjQn1+90W6qTTdw6puUo49wMGN6WZMInFaRd1qpMdKzjQMwPef/2X2Z
         wPK/4ZS3J0/nISo1e+3MzLr4Tza4aIEaii6q7+5Q2LAd/LVYQCOjWpfADv4p03rIkOpb
         bOuroYNWsGoUDMBpdwXNJGmo+2PTMq/Ucn6/2BeiHVFfcw9F623+A65wbiq4/Qd+Ks84
         VL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994507; x=1727599307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQvg/UKbej3tgFl6nwoGfqOebkxCIS6p3Ow/RZ2t8dc=;
        b=b24bIAou0luWDT+Llbgs7SicQnPRnllEYCcGy60SyaDwX5OSB6jH1gA4vm2gs227MN
         5/qAQ5OLbNvKerEiStNCWx86kaVJDE4V8a0Nf/A/iW0W3DntNxOU1Yb0E11dgHfVI3zL
         AFTG7kHMb+8RNkF4JtUVhkUw386IBaGGgOu3pt/9/Cf2UpuN4ckANdSHLqzkQ1tK+TKJ
         4hiclH8WFBYkqlS252P4S4EtbnV5Ako5P1yhDz/psZyNocp0dGkumwEclktL5fIZ/34V
         VPl+EkiuTtFsY2KcC77bf7UC7QYYgWNpsSELq3Y15OjjkmvBnMgPDEauIiLCZ6wvVkm3
         V5IA==
X-Gm-Message-State: AOJu0YxPKyfu0cq9wBor/1twCiza7g9UfzKqaJ5EWXZwhhwYsvgjVS6L
	d1qlJwo2gsaxecLtX8Bh1MyXFnspnAofox7ST6xDFEo1MG24u4QB0IElcB/QmtVDob/dOk2gkN3
	THJM=
X-Google-Smtp-Source: AGHT+IGatvXp10T6dBRt4PxJ/OFCZ7wYxj+Ryufl+Z2/RuWAqvjNZv/Op10WR8zrcCSTvFliqkRmgw==
X-Received: by 2002:a05:6512:3d87:b0:536:5530:af46 with SMTP id 2adb3069b0e04-536ac338b02mr3210385e87.52.1726994507208;
        Sun, 22 Sep 2024 01:41:47 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:41:44 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 00/12] systemd uki support
Date: Sun, 22 Sep 2024 11:41:16 +0300
Message-ID: <20240922084128.9648-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204772

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

v4: handle missing runqemu variable from build config, add
python3-pefile to fast ptest list

v3: rebased, fixed and added more sefltests, removed wic plugin side uki
support

v2: https://lists.openembedded.org/g/openembedded-core/message/204090


Michelle Lin (1):
  uki.bbclass: add class for building Unified Kernel Images (UKI)

Mikko Rapeli (11):
  python3-pefile: add recipe from meta-openembedded
  maintainers.inc: add python3-pefile
  systemd-boot-native: add runtime dependency to python3-pefile-native
  image_types_wic.bbclass: set systemd-boot and os-release dependency
    for all archs
  wic bootimg-efi.py: keep timestamps and add debug prints
  wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
  oeqa selftest uki.py: add tests for uki.bbclass
  oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi
    test
  oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest wic.py: support UKIs via uki.bbclass

 meta-selftest/wic/test_efi_plugin.wks         |   5 +-
 meta/classes-recipe/image_types_wic.bbclass   |   5 +-
 meta/classes-recipe/uki.bbclass               | 197 ++++++++++++++++++
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../distro/include/ptest-packagelists.inc     |   1 +
 .../oeqa/selftest/cases/efibootpartition.py   |  11 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 138 ++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           |  58 ++++--
 .../systemd/systemd-boot-native_256.5.bb      |   2 +
 .../python/python3-pefile/run-ptest           |   3 +
 .../python/python3-pefile_2023.2.7.bb         |  28 +++
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 scripts/lib/wic/plugins/source/bootimg-efi.py | 187 +++++------------
 13 files changed, 482 insertions(+), 157 deletions(-)
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

-- 
2.34.1


