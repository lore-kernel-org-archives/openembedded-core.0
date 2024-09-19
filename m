Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7F5CF394F
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:37:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.21508.1726756648323655390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Es9rxTmD;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53653ee23adso840950e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756646; x=1727361446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geJl7jPNJ2H8D7w/iYtytV95M3RYXp7DlmkVYdekc5Q=;
        b=Es9rxTmDTML9BzRzS4PNcbiLIreVhHTuFPOqfa0tySQpX2cv0PtkQzVQvyaR1FSVbb
         B87EVmRPr0+cZoGaoC4soMAm8Ls2w5h7GIoYRdo//w9YbIK3cIe1EMseJrIBOckt/ZkP
         2BYkKzwcvOPyXd5qj0WbrxD/EgIc7Uyh/IfdnxedpMIlCnSilOz7YB9hesCcBVv65xrJ
         NkPWiUKhIFltQmG4A1SyiSMMduOuOuJ+FglZoAtr140aPDpFwp4ifJhREayk0oe/th9H
         9UjEYMEh5cQwbRfEHbG4iy3SaSmtnsJcZXIKyNjrg9HKXk8IDgAK4VXj2sdsEYLGZ0gD
         9D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756646; x=1727361446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geJl7jPNJ2H8D7w/iYtytV95M3RYXp7DlmkVYdekc5Q=;
        b=ohelxVVdc3kdqWVIKQNw4M1aY++hV3pYVK+wcWASQ1eXykNjmA8uRqgGaV2kVrdR3i
         /FtygVq7N4tySPm8PtCQajADh1gEs5sQVSykUdQdnLIo+6zSknwssN54z4X1KjVfuzCW
         7g6v4i4HSoKNkCKdYUr9NRNo/c00ZgU89LhsA07LCkU+KZ8tu9tFYe4mcJsZFZXNiORK
         q2YzKprlBI9CUtU4FQkmcGpMEETXlkP/Bte4IbJYTwu07sHbAoPlfW0EoPVDTFBQ5Qbi
         ZuWDgYTGOBFaZZIuZS7Jt2o5HOzKTIfClMOD4iPdOu1pwzJv1twL3KwWxKrfqZzbYDIM
         vnpA==
X-Gm-Message-State: AOJu0YwnjymTShudFfWCFw/ad0srL4ZOQIm+OW8uMVh4cJe9ySyBQ4Xy
	2tUjK2rPPsQ+jyH+1vNuvNcLPzT9lm/gWVQ+Y4OsidszvBeFE4Hob825ygdcscKI2I0HYIdbrHb
	Hqls=
X-Google-Smtp-Source: AGHT+IGqRgwt2UKFjn+dOAi2jsoNg7eZPhOjSPKAEaueUsg+01ZBeygKeyHLAveQIztuwojIaIqUpg==
X-Received: by 2002:a05:6512:ea2:b0:535:6ba7:7725 with SMTP id 2adb3069b0e04-53678fb1cd4mr15714645e87.3.1726756646370;
        Thu, 19 Sep 2024 07:37:26 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 00/12] systemd uki support
Date: Thu, 19 Sep 2024 17:36:54 +0300
Message-ID: <20240919143706.6074-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204692

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
 .../oeqa/selftest/cases/efibootpartition.py   |  11 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 138 ++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           |  58 ++++--
 .../systemd/systemd-boot-native_256.5.bb      |   2 +
 .../python/python3-pefile/run-ptest           |   3 +
 .../python/python3-pefile_2023.2.7.bb         |  28 +++
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 scripts/lib/wic/plugins/source/bootimg-efi.py | 187 +++++------------
 12 files changed, 481 insertions(+), 157 deletions(-)
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

-- 
2.34.1


