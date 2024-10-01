Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53128CE7CE8
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:28:38 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.76637.1727771313686334842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f7/mbqDo;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facaa16826so19121951fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727771312; x=1728376112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rxkS29BLdelHNwlVZULbA2ObRUmv9AiLK/iKgZUQUI=;
        b=f7/mbqDoPcYVXDBT4Hnhee/L3gbTjMZhk2FGQBLFhWYFFRTAXgNMcC7LEMudA5stof
         T7p2oT8TQrnNMiCSJ6mZu/UWkAYumVCa98c3+yhtjAeXgqhLwkuS2Fz9wJdxLLE/KEbJ
         WwNQHMdqg6E9+fYm+t7IY207ArQwfTWJg58vH5/wF4lJimt7P0vWYicJtYo4iTiiKEa3
         qG8wnJW7u+T1U2IhkjxBVw9ySL8Nugy7LCnMooZtTzEZyxbuRLOflHPwjYs5TAmDoLq/
         5ZmHeAxsuRfRKgM5c4a2e9miNxfneZQF2qnbw5839wc654w6OYrcVFeoK42TIgmBSg5h
         3JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771312; x=1728376112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rxkS29BLdelHNwlVZULbA2ObRUmv9AiLK/iKgZUQUI=;
        b=BRmf9lAGT8oBd8lJ4LnE2b1kcCplKWch3Yak72/9S9Ijr6CR2r6na43uqPP6eyE6tT
         unVYyVCEiWAb2o1dEfryYDQiPDPejP6eEZNSl922fKdITy9/V7qzKtXDasvT3li+rD8h
         zpW1Kfbo3wemyGkggtUbyjeRBJBc2siUUX9gRerRxpevRfGYv024BFc/KUH+kk9jSw34
         TQWOkbuF0iIsCaN2N2nplrhwToNv+FHIc5nOD3y9Qop1w7OqvUurvwMmvzOFSQc2b4f+
         lQEfhGAVy4EwcnfJDOLTot9GSwuMpqVi6oLEJqKbgur2hhZKJhN53y/gbPgJoX28AZ9z
         Sb1w==
X-Gm-Message-State: AOJu0YxhlDULrcJRstuldWTeuKR/I94TXg5W4akchGWwbivUlyipsTZ/
	Y7pggRCkGv91HcYTaTJzhDdnZ1mZjCJrRkzmBtXJDLAClDWrvY/pmPhxpwCegk84rTae45Hy34Q
	/JTY=
X-Google-Smtp-Source: AGHT+IHTHOOvf1DWkSWWLLsECqXvfkolfUixS0pKmnff6sGYvhkNbttRP1IL1xn4TVzAmFgrizalIQ==
X-Received: by 2002:a2e:a595:0:b0:2fa:bf3e:ce80 with SMTP id 38308e7fff4ca-2fabf3ed04bmr44196781fa.18.1727771311541;
        Tue, 01 Oct 2024 01:28:31 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2facb2ce928sm7734221fa.76.2024.10.01.01.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:28:29 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 00/11] systemd uki support
Date: Tue,  1 Oct 2024 11:28:10 +0300
Message-ID: <20241001082821.26115-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205134

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

Mikko Rapeli (10):
  python3-pefile: add recipe from meta-openembedded
  maintainers.inc: add python3-pefile
  systemd-boot-native: add runtime dependency to python3-pefile-native
  wic bootimg-efi.py: keep timestamps and add debug prints
  wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
  oeqa selftest uki.py: add tests for uki.bbclass
  oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi
    test
  oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest wic.py: support UKIs via uki.bbclass

 meta-selftest/wic/test_efi_plugin.wks         |   5 +-
 meta/classes-recipe/image_types_wic.bbclass   |   3 +-
 meta/classes-recipe/uki.bbclass               | 197 ++++++++++++++++++
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../distro/include/ptest-packagelists.inc     |   1 +
 .../oeqa/selftest/cases/efibootpartition.py   |  11 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 138 ++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           |  58 ++++--
 .../systemd/systemd-boot-native_256.6.bb      |   2 +
 .../python/python3-pefile/run-ptest           |   3 +
 .../python/python3-pefile_2023.2.7.bb         |  28 +++
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 scripts/lib/wic/plugins/source/bootimg-efi.py | 187 +++++------------
 13 files changed, 481 insertions(+), 156 deletions(-)
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

-- 
2.34.1


