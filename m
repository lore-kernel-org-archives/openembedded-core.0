Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FAECF07CE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:57:18 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.38949.1728550628942080276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PNHxqvZX;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so5970021fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550627; x=1729155427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMueBiNC5o8PY+uMevO0sbBUYWdOAf4lC0Qq9ipb2+0=;
        b=PNHxqvZXZDC4wT1NwN79fDEm+YpXU+xrhcWpApN9+8GLfdPJQ/CjxQWt4N3ccML9ux
         9/ZwrSJs9UMML0wscsBlwSX2XVzHEVkIvZNuDAAnuVNtv6ISfyrfmcUIoDrPVTfiBewG
         xsewiQ78/NorHhmgyMFFuJp7dUk9EQlTpAOFcjrlmE5TW1MAOjH2InlllYlop6WEY1AO
         9n79qYEnfWETj0plXG5pDrMudrMK/K6HgVApXU1Vs/LzUEMeSFRyMIZKcUClKbPQiRju
         5hg6VNGSrVB+0NNkg1MXeJ9WEWm12iicRppE+gJaemG+7ybEFskAzfnbnGF01yMlM6LF
         O0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550627; x=1729155427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMueBiNC5o8PY+uMevO0sbBUYWdOAf4lC0Qq9ipb2+0=;
        b=ID/nrCgFaR+86J2AuIpDXwED1ZHgXsJG8zqNOHdNTIWwHwm99PmJss3DPxXgJtbj8/
         /09aD6A1+XifjVUz0/AtVvwy7qbyllxyF/H9H472I5H/QinWGNH9dIaGXRLfICldJnDR
         6id1SUvPLQurVs9fMse56gFWM04BUZLnVQ/BCzYd7b5tXM4HpkPawAn2UTGNGU3H8Tr9
         /HpZUC2oh1mBdDvVfZBw6kl6FkHlE/AtRyMjZpCAdT8vUsFhpM1Oe5AqWIuKtpekCchK
         +WcCxp4ffhUHHvzIMlOlrA6hPYyU3vBb63N8k/LMyZEuIHekQ+P44DZcGuN88naLTdVL
         /NYw==
X-Gm-Message-State: AOJu0Yx6GOohgKSCUsCHm3uH5+JA5lUaszz+YWJZezXe0U4AYaohdR0B
	4x67HiynDRKiFiNl9jSDRZUNmyx4PAx2awsp1Rw7KHBwLiwRw/USQuNkp7rvfblbpXnbVK7ex/V
	b9V8=
X-Google-Smtp-Source: AGHT+IEkkdfPJldUrpKprUM45a1qtN3bNcT/SPXSgFfnTP+t5vFbhQ9eOfKLSxlNI8pcGwMUxakmhw==
X-Received: by 2002:a05:651c:a0b:b0:2fb:266b:e3b2 with SMTP id 38308e7fff4ca-2fb266be401mr4041741fa.36.1728550626948;
        Thu, 10 Oct 2024 01:57:06 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2459cb82sm1397621fa.56.2024.10.10.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:57:05 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 0/8] systemd uki support
Date: Thu, 10 Oct 2024 11:56:39 +0300
Message-ID: <20241010085647.439990-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 08:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205389

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


