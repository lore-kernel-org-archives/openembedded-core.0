Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CABCC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.37974.1747603851087401293
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yd6JDF+k;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af6a315b491so3226792a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603850; x=1748208650; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzltuIBg7EHwpUdPioZEpKWJcIN2rLxUu6ik7JOYTXA=;
        b=Yd6JDF+ks4MRn0NSDRnBSELa/bHEUQPEH1uZNKSggrPVpl1jHmV1bDSjX1UCZwuMko
         YIVhT1O25ZvsAdxDm5HrV6dwqqugSYEZY92Ogdp2r/6dKvYo3Iq1NXf27twbnhWB4HM0
         7V7f8OWYER4865bxHPI50PD5dqRzbRNrmBGnXaOeJDD1pCGoJTbCNAZQg+UjR3l6uqXu
         u68fj3Zx7BDUuI7zJryWaV6u1Zn+o6m5t/0Cs8F78Vd6TlLX4TozCpnvqquk2e0WyTyE
         ah15swaMNjxojp/QyvbhASrXk0ImBjaXlNoI+nLAP0dCWuX0YVrNI5CYubFSk7IFX/am
         u79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603850; x=1748208650;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzltuIBg7EHwpUdPioZEpKWJcIN2rLxUu6ik7JOYTXA=;
        b=ZwuIIX1rr6Uc/nBCo6eyv3ZbbCSS1GNNFw0vIdbb8HnbfC7c/4X/l1GCdN7riPLZfb
         VmdPSMGfl288/br4y9WKE6Hboj8CpaOAqF3ZyNEjPJiUUrUOFD81BAk8VhQypFwAg1x3
         XA5KrmzHZMq8WF0/IyzzPr69kpCqF0OBKVgkDkBogfSdEOPzSsVR5MmjpXBb1HZUWDeA
         LjYQGxrFSIHM+Og3eRNZ6CatU1c2j3ejFE2+DosStaqgBLteX9pt0a9KbRynY7ocIl4y
         OgpUxfM0nUIVJQ5D3UiTMq+au5TSvXhx8hP3Ckv+OSx4cHfISUHRxAiZMV4jjOa1J6RF
         sMpw==
X-Gm-Message-State: AOJu0Yw5Woe04Rlsn6rR+A+pZqHuaqyXYIICBJifwWOyMocrD3CDdiVZ
	DZ4d+ppWHJhFxUFQ4pcfMaljyhGqoj318QkJE1jzuBTQt1iXN6QGNCttE9F4w50x
X-Gm-Gg: ASbGnctyIX+2t5pS4657uj3A3nXTzljDpWKnPX8deLNk0o/PzOG6kuFXNVS+jZ5dGkq
	g1oC1gUK8CxrS6BSiMEwTUKFCnWDJPadtva0e39qlb8kppMaScH3SXXXl7e6+vtllZaqG5XjQdT
	SzcgNiIuXd5bSnBQQFoPM1rPeSPR7sR+ihHD+IV4D/f6l5GyKdIkxq+WnV6M39dchA3TvhzrYa0
	fTrh5FQ5lAaQ5UJNwzfQ26z5+Z5RFy7pidbSibI5aacLWI4KIoMVNWoszh4u+lgya1y/oI0usUc
	H+LnQYdRGKAzHETgPjUiJJqyTrcu4s2RW12Gx1O/Gc0=
X-Google-Smtp-Source: AGHT+IFQA2VEodiR9oKBd1GZSCh8CClknq7K7J8HHpnX3Zd61wePHzDCGdXKW/5i95lW03f97JLUbQ==
X-Received: by 2002:a05:6a21:31c8:b0:20d:df67:4830 with SMTP id adf61e73a8af0-216f85ac739mr14644948637.0.1747603849860;
        Sun, 18 May 2025 14:30:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 00/21] clang: Add clang C/C++ toolchain
Date: Sun, 18 May 2025 14:30:35 -0700
Message-Id: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHtRKmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0ML3eQcoKhuSX5+DlA+M083zTLRItHA1NzI2MBMCairoCg1LbMCbGJ
 0bG0tAHYU/JBhAAAA
X-Change-ID: 20250518-clang-toolchain-f9a8a0572306
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216784

Clang also provided a full fledged C/C++ cross compiler which is
capable of building any C/C++ components.

A mechanism is added to select the toolchain using

TOOLCHAIN = "clang"

in config metadata. This will also add an entry into OVERRIDES
'toolchain-<COMPILER>', e.g. toolchain-clang which can be used
to define clang-specific aspects in metadata.

All packages are not full buildable with clang, e.g. glibc which
rely on some extentions which are only available in gcc. Such
exceptions are made in config metadata using a global file called

meta/conf/distro/include/default-toolchain.inc

This file can be added in every layer to define these details themselves
bitbake will include all such files auotmaticlally.

Defaults are kept as it is, nothing is expected to change if its not
enabled

World builds for qemuarm/qemuarm64/qemuppc/qemumips/qemux86_64
are successful with some exceptions

vulkan-samples - qemuarm64/qemux86-64
bluez - qemuppc
compiler-rt-sanitizers - qemumips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Khem Raj (21):
      toolchain: Provide abstraction for choosing per-recipe toolchain
      default-toolchains.inc: Add a global file to pin TOOLCHAIN variable
      clang.bbclass: Specify ldso when using usermerge
      pulseaudio: Pin to use GCC compiler
      vte: Disable gi data generation when using clang on arm
      rpm: Add openmp dependency when using clang
      clang: Add compiler-rt to default deps when using clang compiler
      rpm: Always use gcc compiler
      pseudo: Pin to using GCC compiler
      webkitgtk: Use gcc to compile for arm target
      gnu-efi: Use objcopy from GNU binutils with clang
      tcf-agent: Fix ranlib call when using llvm-ranlib
      systemtap: Pin to build with GCC
      valgrind: Use gcc to compile on riscv64
      pulseaudio: Treat -Wunused-command-line-argument as error
      syslinux: Pin to using GCC toolchain
      libjpeg-turbo: Fix build on mips/clang
      pixman: Fix build with mips/clang
      systemd-boot: Remove -mfpmath=sse option from cflags
      vulkan-samples: Disable overriding-option as error
      grub,grub-efi: Pin to using gcc on aarch64

 meta/classes-global/base.bbclass                   |  5 ++
 meta/classes-recipe/cross-canadian.bbclass         |  2 +
 meta/classes-recipe/cross.bbclass                  |  2 +
 meta/classes-recipe/crosssdk.bbclass               |  2 +
 meta/classes-recipe/native.bbclass                 |  2 +
 meta/classes-recipe/nativesdk.bbclass              |  2 +
 meta/classes/clang-native.bbclass                  | 28 +++++++++++
 .../toolchain/clang.inc => classes/clang.bbclass}  | 17 +++++--
 .../build-gcc.inc => classes/gcc-native.bbclass}   |  1 -
 .../toolchain/gcc.inc => classes/gcc.bbclass}      |  1 +
 meta/conf/bitbake.conf                             |  7 ++-
 meta/conf/distro/defaultsetup.conf                 |  1 +
 meta/conf/distro/include/default-toolchains.inc    | 55 ++++++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb          |  4 ++
 meta/recipes-core/systemd/systemd-boot_257.5.bb    |  5 ++
 meta/recipes-devtools/rpm/rpm_4.20.0.bb            |  1 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  5 ++
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb  |  6 +++
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb |  4 ++
 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb    |  3 ++
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  3 ++
 meta/recipes-support/vte/vte_0.78.2.bb             |  4 ++
 22 files changed, 151 insertions(+), 9 deletions(-)
---
base-commit: e3d24e5cd8eee5d0d232abdfef33cacf0ad96787
change-id: 20250518-clang-toolchain-f9a8a0572306

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


