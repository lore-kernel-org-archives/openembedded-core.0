Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DD9C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:19:53 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.4692.1747808392162719510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGG3iidn;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742b0840d98so3658226b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808391; x=1748413191; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGN2JmQMJTlTSuLY9pnp9Hfa8TmD9QOIa0W4uLBgF3k=;
        b=eGG3iidnrw1Mry/SAZ6wyO7MyyMTO7SRU39s1R+flH/zWXL6EZ9nETCs3DU+RpPiB4
         1foAnqH18dm74f6RiXlQWjXfSWH/vp4GbEXGRIty1s1y9wH2UWWvMafw0g0NOJ4pSvRr
         qwQDGlCOKJ8LL9I1kweKwZ2Go0gPaS3j0nAWYxHPUb2+XdaJn7/7pCy9PrDr6LAPGVB/
         frlLiwj0ClMSeznPYBCnUh55QJHYShZJcxspNiTVRGA8bUAoyNMhIjoASdRXAFcLv6tl
         VdqQGLSaE8m4Mtl54510Ow2V5KjY7aIjKOp1GEDiwdeXaSG0xfbxTOMpSshpaDggkxUp
         vTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808391; x=1748413191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGN2JmQMJTlTSuLY9pnp9Hfa8TmD9QOIa0W4uLBgF3k=;
        b=Vqk8J9emXHuf4Vi8CLVXtEG4UHi8EyUXdc2/3MqaY4UEJNm9uK5SiosiX4b93AzBr/
         tz0w0QNRH/qtbcskhiQVtZaalY6+IQwftKRe7A9QaaPToXHUitM9R+g0dePjfkQKsYx6
         SqwqrO4tvG6PGVytfWvaNS357e0ggPjFzmJBWTt+sIlqIri92td2JtfC1qGzNe/wNXLQ
         REgTutOpxZIezVYyGCTowq/d5D6KkO2gfe43cFrOa6VphH0eJawjmW0vyabt0Yt9dDeH
         oyMB25n5IVe/gFI/88xHtc+cg2yc7cV8EhE1J6vyWZhGKTGNuJAHcnA0y+Hwcz5JPT0D
         iFpQ==
X-Gm-Message-State: AOJu0YxTIciL/KXThFfAKf9daMTF8KH8HhI/6XXlrDceEgWzhVk9KrYj
	Pn/Z0CiIIcMaf7GfKDezq+32S7dNeSMNFA08C65CfFpBOXZlNYxDrQX7kxP8NbcP
X-Gm-Gg: ASbGncu40KqQo2Iyz6unsHZWTi/9IWfNp+zCKnsfGt1dDR+M2TSVjNLPrVnTAbsPe2Q
	znCFOT/qb/bbSG1NSGS2KiW7Zf/yEvBsmx3fK7R5Jd4dmq+eex114VWFJG32pioXdHbMLuzJx+Z
	29cd9RGhMQvCU/WfO43CAVhuy1WoIdqE6Uls12K7NfCbPfOnvFtE8NPIdgQ5cOyrA1eZYqQrEKy
	gvn6JHn7tow6L4/ujTawqgR+EgMXC9g0EGoAdv0mzKNkhgqq3fLSRoUUS2vuMPOPbkChT+tEhbO
	yMUC/aAkTF+t5CVZb2Pa2J4peAPcUr20bP9sa3rmilA=
X-Google-Smtp-Source: AGHT+IGZp2RojPdoTctw5pg5htZzxjMXFclOS7QdjB3UErYyw9Zh9Vy7G/ZP/IL3OEC1R8xekJ5Vhg==
X-Received: by 2002:a05:6a21:3a89:b0:215:d9fc:382e with SMTP id adf61e73a8af0-2170cc5f59bmr27642635637.13.1747808391036;
        Tue, 20 May 2025 23:19:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 00/28] clang: Add clang C/C++ toolchain
Date: Tue, 20 May 2025 23:19:36 -0700
Message-Id: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlwLWgC/3WNQQ7CIBREr9L8td8AloquvIfpAhHan1Aw0BBNw
 93F7l2+N5mZDbJNZDNcuw2SLZQphgbi0IGZdZgs0rMxCCYkk1yh8c3iGqNvOQV0F600k2dxYgO
 01itZR+998T42nimvMX32g8J/9v9W4chQPmw/OGV67eRtWjT5o4kLjLXWL+XyXVKuAAAA
X-Change-ID: 20250518-clang-toolchain-f9a8a0572306
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216968

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
Changes in v2:
- Move the changed from default-toolchains.inc file into respective recipes
- Drop adding libomp as toolchain-clang dependency for rpm, it will be
  needed when clang is used for rpm, as of now it does not
- Fix musl world builds for qemuarm/qemuarm64/qemuriscv64/qemuriscv32
- Link to v1: https://lore.kernel.org/r/20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com

---
Khem Raj (28):
      toolchain: Provide abstraction for choosing per-recipe toolchain
      clang.bbclass: Specify ldso when using usermerge
      vte: Disable gi data generation when using clang on arm
      clang: Add compiler-rt to default deps when using clang compiler
      gnu-efi: Use objcopy from GNU binutils with clang
      tcf-agent: Fix ranlib call when using llvm-ranlib
      pulseaudio: Treat -Wunused-command-line-argument as error
      libjpeg-turbo: Fix build on mips/clang
      pixman: Fix build with mips/clang
      systemd-boot: Remove -mfpmath=sse option from cflags
      vulkan-samples: Disable overriding-option as error
      openssl: Link with libatomic on x86/clang
      qemu: Link with libatomic on x86/clang
      bluez: Disable invalid-pp-token warning with clang
      gcc: Always use GCC toolchain
      glibc: Always use GCC toolchain
      grub,grub-efi: Pin to using gcc on aarch64
      valgrind: Use gcc to compile on riscv64
      syslinux: Pin to using GCC toolchain
      systemtap: Pin to build with GCC
      webkitgtk: Use gcc to compile for arm target
      pseudo: Pin to using GCC compiler
      rpm: Always use gcc compiler
      pulseaudio: Pin to use GCC compiler
      seatd: Disable sign-compare warning as error on clang
      busybox: Fix build on architectures without SYS_settimeofday
      systemd-boot: Use gcc on musl/arm
      perf: Do not treat maybe-uninitialized warnings as errors

 meta/classes-global/base.bbclass                   |  5 +++
 meta/classes-recipe/cross-canadian.bbclass         |  2 +
 meta/classes-recipe/cross.bbclass                  |  2 +
 meta/classes-recipe/crosssdk.bbclass               |  2 +
 meta/classes-recipe/native.bbclass                 |  2 +
 meta/classes-recipe/nativesdk.bbclass              |  2 +
 meta/classes/clang-native.bbclass                  | 28 ++++++++++++
 .../toolchain/clang.inc => classes/clang.bbclass}  | 17 +++++--
 .../build-gcc.inc => classes/gcc-native.bbclass}   |  1 -
 .../toolchain/gcc.inc => classes/gcc.bbclass}      |  1 +
 meta/conf/bitbake.conf                             |  7 ++-
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb          |  4 ++
 meta/recipes-bsp/grub/grub2.inc                    |  4 ++
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 meta/recipes-connectivity/openssl/openssl_3.5.0.bb |  3 ++
 ...ck-for-SYS_settimeofday-before-calling-sy.patch | 52 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb        |  1 +
 meta/recipes-core/glibc/glibc-common.inc           |  2 +
 meta/recipes-core/seatd/seatd_0.9.1.bb             |  8 ++++
 meta/recipes-core/systemd/systemd-boot_257.5.bb    |  8 ++++
 meta/recipes-devtools/gcc/gcc-15.1.inc             |  2 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  7 +++
 meta/recipes-devtools/qemu/qemu_10.0.0.bb          |  1 +
 meta/recipes-devtools/rpm/rpm_4.20.0.bb            |  4 ++
 .../syslinux/syslinux_6.04-pre2.bb                 |  5 +++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  5 +++
 meta/recipes-devtools/valgrind/valgrind_3.25.0.bb  |  8 ++++
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb  |  6 +++
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb |  4 ++
 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb    |  3 ++
 meta/recipes-kernel/perf/perf.bb                   | 10 +++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  4 ++
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  8 ++++
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb       |  2 +
 meta/recipes-support/vte/vte_0.78.2.bb             |  4 ++
 35 files changed, 216 insertions(+), 9 deletions(-)
---
base-commit: e3402fe00ca5602dbcfd151ab3fd4bfb3371f76c
change-id: 20250518-clang-toolchain-f9a8a0572306

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


