Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CA5D2124F
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:13 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.44630.1729154767728558582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YpRoVFWf;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f2b95775so874688e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154766; x=1729759566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWhKhFc3aKwerFUBC12NHN77/QaiUXWTtyZEzCl45T4=;
        b=YpRoVFWfvgZYhsIBQpunAC7B6eiIfikzhxwY75hGS3ckngbbOtyuG/jOGUWnNEDjF0
         hsup4rnJk5u1LVgGGh9msGsWovma+ADnuc1OqXtdLECa0cGMpJV1o06jUWB+B0KQmwo1
         OAONfAz0aHJjdnFC6vzMcjyihMepljWI1CgMhqU6i18NLn5NWfjR+b+J6QGimcCwKB5J
         6sN6nveIWCsPIOW/YK3BZ73ZYDrruJWiLBovjGKkGUdskvA+UOmuvY6rjSq7WkTxsVKJ
         q7suw6lYPvNHU9gW1xKSh22YakZ7JZpup9HK6dZfxJVIQgPgVoOJEcHPa/x4f8fCkJVj
         werQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154766; x=1729759566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWhKhFc3aKwerFUBC12NHN77/QaiUXWTtyZEzCl45T4=;
        b=xJVTVbe1QIUhfhsPpxjc6AdHJ8uOCzo+MlA99f/X2vCt07hYSWDGvpQ1kOr5hN+Kh4
         4AiWl0GqykLiCfPBcMp4QT5vSieOkwZgxol6gVxgOwPQlo3l1i6HH/53wIcllzKciCfW
         4dMxfEpVoe6IO97yPzv3Vj5SBslzju59s9NE5jN5PsQ2EDcDRNdxQumSVtref/5w6yTZ
         eLzozvaUhINNcJ7GjF4MKgtTbQznc+R+IjTBWiCPZj2rVolzNnBetVSW+PMXYSxKq/rL
         hT5b+4Btotm3lTQsKLsAxDHewdOSxL4iKWSDClaHQYkg8XMgcvHAPXm1Hsme0Fmg5gDL
         lkBw==
X-Gm-Message-State: AOJu0Ywu51Ak3p7f2ONNrmlBqCeChEsRJ0FTMG95mzYt+5OTozWMxPrH
	57YijZaiyzCXh7P1DTfp5CtzQuHQ1DJD9DQr4VVD3XBEEb4iZFQCPzPkt1IsLnFpnL9cbqAJshM
	YFIM=
X-Google-Smtp-Source: AGHT+IE+7iCkld44+rQGSYqjmyKOx5+9d+3oPrqVUazpWR6bIdXyi13FNytgWMkKKsrgdQf6EkAhIg==
X-Received: by 2002:a05:6512:b9a:b0:536:54ff:51c8 with SMTP id 2adb3069b0e04-539e54e8231mr13937176e87.17.1729154765739;
        Thu, 17 Oct 2024 01:46:05 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:03 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 00/11] systemd uki support
Date: Thu, 17 Oct 2024 11:45:41 +0300
Message-ID: <20241017084552.182136-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205995

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

v9: Fixed unrelated ext4 rawcopy wic test on genericarm64. Enabled new aarch64 target
    wic test on x86_64 build host only since boot with qemu is currently
    failing on aarch64 build host. Tested wic, uki and efibootpartition selftests
    with target machines qemux86_64, qemuarm64 and genericarm64 on x86_64 build host.

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

Mikko Rapeli (10):
  wic bootimg-efi.py: keep timestamps and add debug prints
  wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
  oeqa selftest uki.py: add tests for uki.bbclass
  oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi
    test
  oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
  oeqa selftest wic.py: support UKIs via uki.bbclass
  oeqa data.py: add skipIfNotBuildArch decorator
  oeqa selftest wic.py: mark efi tests to run on x86_64 build host only
  oeqa selftest wic.py: fix missing ext4 image

 meta-selftest/wic/test_efi_plugin.wks         |   5 +-
 .../test_efi_plugin_plain_systemd-boot.wks    |   5 +
 meta/classes-recipe/image_types_wic.bbclass   |   3 +-
 meta/classes-recipe/uki.bbclass               | 195 ++++++++++++++++++
 meta/lib/oeqa/core/decorator/data.py          |  12 ++
 .../oeqa/selftest/cases/efibootpartition.py   |  11 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 133 ++++++++++++
 meta/lib/oeqa/selftest/cases/wic.py           | 138 +++++++++++--
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 scripts/lib/wic/plugins/source/bootimg-efi.py | 183 +++++-----------
 10 files changed, 529 insertions(+), 159 deletions(-)
 create mode 100644 meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

-- 
2.34.1


