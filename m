Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D02DC27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:07:58 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.4340.1719778073923732915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fA/NJt0U;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.176, mailfrom: steve@sakoman.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3760121ad45so11382465ab.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778073; x=1720382873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMLWLqUiAorl+yh6ISYfExpjteysTl7Z6w0vJBSpkqk=;
        b=fA/NJt0UwqvDjKGY6eZMNfHlkMEZZnz00OnGpzS4qZAXWgCf+vhMFAfOcRKOpxYzRP
         oupubYvwp2C3hT3fItpxF1APSymeBx8nL4UeMuQBHRmwBTOlXSQF3nxQW2O0hdsZ7hbo
         +tjcibxxwxE2IKJP1ONz6H7yrwGiq4u/SleNMwgHmr63K6OAdIWzwmW2jO0pTBssvE2I
         eIHAmncZhA/f1fzkb+rcbRvniOkew+QEseYUQHeLUK9biNltcN+CbmgpkomGJXAJVq+2
         FcdYGZ1xNykmyaeKvKk13jNqp/7vjxFxHoi6bpw3MLRY/YsQsQ70owtKNVTdgd3i5sT2
         JMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778073; x=1720382873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMLWLqUiAorl+yh6ISYfExpjteysTl7Z6w0vJBSpkqk=;
        b=TfiDkUPEB1hziyNjK9aD0fQB4WOMy6noF5apEiL+8DYY4sPWt8CA/4KJJZ11jtWO+B
         0SWQELDxvh4Oxdr3XlusiAIfZux4mTarPBtbVcyIaD7/V6Ix2p0EueYvRqfCthoX606f
         5h6EyS7kclurnJJcjzCjhvN9UuLMHiqT6KmeWHmm4CrgI91ewyLdMa5EYm+zi8DzHQXS
         66Po0ipmzlUDxNGViujSOCGxrq3Lk8RrhDQA6mVrWHYxWvTYIxvjn89+uTjrae7w+mO/
         Io2VYu7ypZaI+NFTLXIbg+ZYc5s8skLGwH3YIhtUnz4jJDXVt+4j1ZmoTr/LJ0AxYsn/
         3alw==
X-Gm-Message-State: AOJu0YxbqFkqMxkf3gU5ZN4xdEJ9ClUWLo6zOt+ozg4HNXwFZ6vDDn8B
	7/hs7/WP4/j/9WJD33XBkomdHs+tZSL5Y1F5VM/Qgv3a/sD0K7rHy3tye476wsYxRF7rFjjICKv
	XjPQ=
X-Google-Smtp-Source: AGHT+IHLcPPsmqARAatuK6YTJEBQLuA6jvQSIBJio4Ppd1RrXxw4KmvWDBcf8yG3TiDAi6jergKmpA==
X-Received: by 2002:a05:6e02:1685:b0:376:1264:d82d with SMTP id e9e14a558f8ab-37cd31b6d20mr56596225ab.30.1719778072771;
        Sun, 30 Jun 2024 13:07:52 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.07.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:07:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/35] Patch review
Date: Sun, 30 Jun 2024 13:07:12 -0700
Message-Id: <cover.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201237

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, July 2

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7092

The following changes since commit 803cc32e72b4fc2fc28d92090e61f5dd288a10cb:

  build-appliance-image: Update to scarthgap head revision (2024-06-24 06:47:53 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adithya Balakumar (1):
  wic/partition.py: Set hash_seed for empty ext partition

Bruce Ashfield (17):
  linux-yocto/6.6: update to v6.6.24
  linux-yocto/6.6: update CVE exclusions (6.6.24)
  linux-yocto/6.6: update to v6.6.25
  linux-yocto/6.6: update CVE exclusions (6.6.25)
  linux-yocto/6.6: nft: enable veth
  linux-yocto/6.6: update to v6.6.27
  linux-yocto/6.6: update CVE exclusions (6.6.27)
  linux-yocto/6.6: cfg: drop obselete options
  linux-yocto/6.6: update to v6.6.28
  linux-yocto/6.6: update CVE exclusions (6.6.28)
  linux-yocto/6.6: update to v6.6.29
  linux-yocto/6.6: update CVE exclusions (6.6.29)
  linux-yocto/6.6: fix kselftest failures
  linux-yocto/6.6: update to v6.6.30
  linux-yocto/6.6: intel configuration changes
  linux-yocto/6.6: update to v6.6.32
  linux-yocto/6.6: cfg: introduce Intel NPU fragment

Dmitry Baryshkov (2):
  ffmpeg: backport patches to use new Vulkan AV1 codec API
  ffmpeg: backport patch to fix errors with GCC 14

Jonas Gorski (1):
  linuxloader: add -armhf on arm only for TARGET_FPU 'hard'

Jose Quaresma (3):
  go: upgrade 1.22.2 -> 1.22.3
  go: upgrade 1.22.3 -> 1.22.4
  go: drop the old 1.4 bootstrap C version

Richard Purdie (2):
  maintainers: Drop go-native as recipe removed
  linux-yocto-custom: Fix comment override syntax

Ross Burton (4):
  expect: fix configure with GCC 14
  libxcrypt: correct the check for a working libucontext.h
  bash: fix configure checks that fail with GCC 14.1
  insane: handle dangling symlinks in the libdir QA check

Siddharth Doshi (1):
  libxml2: Upgrade 2.12.6 -> 2.12.8

Sundeep KOKKONDA (1):
  binutils: stable 2.42 branch updates

Trevor Gamblin (1):
  python3: upgrade 3.12.3 -> 3.12.4

Vijay Anusuri (1):
  wget: Fix for CVE-2024-38428

joshua Watt (1):
  classes/create-spdx-2.2: Fix SPDX Namespace Prefix

 .../linux/linux-yocto-custom.bb               |    2 +-
 meta/classes-global/insane.bbclass            |    4 +-
 meta/classes-recipe/linuxloader.bbclass       |    2 +-
 meta/classes/create-spdx-2.2.bbclass          |    2 +-
 meta/conf/distro/include/maintainers.inc      |    1 -
 .../libxcrypt/files/configure-c99.patch       |   39 +
 meta/recipes-core/libxcrypt/libxcrypt.inc     |    3 +-
 .../{libxml2_2.12.6.bb => libxml2_2.12.8.bb}  |    2 +-
 .../binutils/binutils-2.42.inc                |    3 +-
 ...sserts-from-operand-qualifier-decode.patch |  382 ---
 .../expect/expect/expect-configure-c99.patch  |  201 ++
 meta/recipes-devtools/expect/expect_5.45.4.bb |    1 +
 .../go/{go-1.22.2.inc => go-1.22.4.inc}       |    2 +-
 ...e_1.22.2.bb => go-binary-native_1.22.4.bb} |    6 +-
 ..._1.22.2.bb => go-cross-canadian_1.22.4.bb} |    0
 ...{go-cross_1.22.2.bb => go-cross_1.22.4.bb} |    0
 ...osssdk_1.22.2.bb => go-crosssdk_1.22.4.bb} |    0
 meta/recipes-devtools/go/go-native_1.22.2.bb  |   58 -
 ...runtime_1.22.2.bb => go-runtime_1.22.4.bb} |    0
 .../go/{go_1.22.2.bb => go_1.22.4.bb}         |    0
 .../{python3_3.12.3.bb => python3_3.12.4.bb}  |    2 +-
 .../bash/bash/0001-fix-c99.patch              |   41 +
 meta/recipes-extended/bash/bash_5.2.21.bb     |    1 +
 .../wget/wget/CVE-2024-38428.patch            |   79 +
 meta/recipes-extended/wget/wget_1.21.4.bb     |    1 +
 .../linux/cve-exclusion_6.6.inc               | 2720 ++++++++++++-----
 .../linux/linux-yocto-rt_6.6.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
 .../ffmpeg/ffmpeg/av1_ordering_info.patch     |   91 +
 .../ffmpeg/ffmpeg/vulkan_av1_stable_API.patch | 1382 +++++++++
 .../ffmpeg/ffmpeg/vulkan_fix_gcc14.patch      |  102 +
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |    7 +-
 scripts/lib/wic/partition.py                  |   37 +-
 34 files changed, 3999 insertions(+), 1212 deletions(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/configure-c99.patch
 rename meta/recipes-core/libxml/{libxml2_2.12.6.bb => libxml2_2.12.8.bb} (97%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
 create mode 100644 meta/recipes-devtools/expect/expect/expect-configure-c99.patch
 rename meta/recipes-devtools/go/{go-1.22.2.inc => go-1.22.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.2.bb => go-binary-native_1.22.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.2.bb => go-cross-canadian_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.2.bb => go-cross_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.2.bb => go-crosssdk_1.22.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go-native_1.22.2.bb
 rename meta/recipes-devtools/go/{go-runtime_1.22.2.bb => go-runtime_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.2.bb => go_1.22.4.bb} (100%)
 rename meta/recipes-devtools/python/{python3_3.12.3.bb => python3_3.12.4.bb} (99%)
 create mode 100644 meta/recipes-extended/bash/bash/0001-fix-c99.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2024-38428.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/av1_ordering_info.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch

-- 
2.34.1


