Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C90ECF0457
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:27:00 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.13909.1728473218952120858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TogfGgRN;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5399675e14cso7834122e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728473217; x=1729078017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yqhcUKNBsfE9HuAGg25f5hYsEYp5Bp0X1Svsu9wzSo8=;
        b=TogfGgRNH7pa4mcXr+YkY5m1T2+Y1pfv3stZSPilFKpJT2+p4KlEFOf68ctXiTGF4g
         7JGD5I3PfYR578nG1vMTdN/rirshTYBcreL49JKGHQIhyPHBT4eAHSyE8/Aw4J3tmsqM
         je7QR/QrGTPZcuKYSJaXMMdf/4clTl4PNeq7Gk4++6FE3m0l+Q4kyy9EvdVybNQ7RUY2
         2nc0lOLLRKWiHtpx+1tC7LF5ZrmPvyUH+bqAQvZFzRX0U9VGbtTTDj49Y2bX4keAgPlJ
         7bojAwLoIVGO5rrADu15+I2mFA4gI9tnqlyQySl48tQIN0a/kzCYcXdfbAp+fHQXXw/t
         xWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473217; x=1729078017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqhcUKNBsfE9HuAGg25f5hYsEYp5Bp0X1Svsu9wzSo8=;
        b=jNvzlM8r4FbMznfOStjsQ4Aq8O+CAMfZkvlvwcI7QcYAN385P/YHRtnpf3tIbenFjL
         ZpiDx/lPpUWYMPObB+i4utBvoa91n9DW2u5mhYcho8oUpI/9zSwQSaUB+V5cB9Ds/Q6F
         Usqxeg15OemxOylSugg8VhhRiB9bcj0yv6m+4G/93V56Nz9Y5a2GSLtX3Xc3/snHyXoU
         ArQn0lZz1jPCjmhzWr3bZ92fJQ8a2f74HiVuLQnYCj/PRoqjgMZG7l817vQlve/e/0GS
         OMlwvZAn8k608vXj/eLerrGainGj2UJQOlwCZQMAOBs1BLfAXrI4t+U7eMALsSmyt9X3
         ihcg==
X-Gm-Message-State: AOJu0YwZ3PzqiPe0NZE0Y0cbFCBWxDUHPDPBSK7gYcbciezBtjWfVaKY
	sty0ITIkp8ZAt+bL0A8bfQsWlQz3mQ7jpX2nHIkzSWE8uFgqErRaZ7AfNBrLyH2MYqAk/yPvKD6
	7gNY=
X-Google-Smtp-Source: AGHT+IEmrjlM5DzbsuLkfu8FLXe+GEaE9YFnMj0yCreP2dahDJRSD5rPsG4icntP/ZpRV1tgJy8pNQ==
X-Received: by 2002:a05:6512:2348:b0:52e:9e70:d068 with SMTP id 2adb3069b0e04-539c48924b6mr1288864e87.4.1728473216659;
        Wed, 09 Oct 2024 04:26:56 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff234e2sm1449220e87.223.2024.10.09.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:26:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 0/8] systemd uki support
Date: Wed,  9 Oct 2024 14:26:26 +0300
Message-ID: <20241009112634.402123-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 11:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205348

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

v6: fixed wic refactoring botch which broken non-uki systemd-boot usage on
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
 meta/classes-recipe/uki.bbclass               | 197 ++++++++++++++++++
 .../oeqa/selftest/cases/efibootpartition.py   |  11 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 138 ++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           | 124 +++++++++--
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 scripts/lib/wic/plugins/source/bootimg-efi.py | 183 +++++-----------
 9 files changed, 511 insertions(+), 158 deletions(-)
 create mode 100644 meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

-- 
2.34.1


