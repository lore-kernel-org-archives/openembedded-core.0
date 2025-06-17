Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03DFC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:02 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.22999.1750176000541292471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z9x6ZcYk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2d46760950so6178299a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750175999; x=1750780799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LevAWZpUfmO//79bVw6RIHgkoLOoJZqx2QvOqUMUeV8=;
        b=z9x6ZcYklYp/D428CRnPvbl8y63mChFtI4vHX84GMxVThPqZ+V0T0LRd9Kw/fHxOHW
         QA9tE2NZfxi5N50wHKTJfFzRyhVhci9wxb2zgvrQPWuLy4tNc0m02AEjMaTmg7JIXUkX
         pzT1TMIgmeITr4jV94jbyG32lPI58Y+moQUEIabUOfPdRnaXVaMLLxNEWrnG9iDztA/Z
         CSei9vn7/Y3BQk1taOfFtpt+FeiTZqNLYtnGzQjETPPC2U6CJ9dmAj4JCta8+6tLTD5y
         VmFLX3juDHOiUo0PVJAmgfCFz8veEvV8Q1/2NtMkVed+FiOcfLtiSbKdX5nzvUubbYQg
         2w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175999; x=1750780799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LevAWZpUfmO//79bVw6RIHgkoLOoJZqx2QvOqUMUeV8=;
        b=WdGZUXQd60rWrf9lbfP8AWW3b990L6mBEOgxVnhyjBSVsMAwn6ur+wzkkuJrP6/1OV
         A7Ab0QLUZOGChfhhsd9TyJHJlyEizPUzgUu/i77W7KCPqFR0WgcDJWUdk+4nJ4cC9wH4
         mG296O2Trm4cpO+AZXymF4hhns2L8gwFPeh1cod8q1g51rH+Bswxyknu3Ss0mPbh53eC
         FWNiKKslQNXBRF5e/JaE1A5Eoon8DwnFt4lDc3TDgHlh+Wyr0m2jMDSryJnN78vFzHZL
         SDkJoamyzazGKFeaAsQZTAio+LihC6hpkk2bftjfLxn8e1vkAIxkFXrawEW40icjqDBe
         6lOQ==
X-Gm-Message-State: AOJu0YzuUEopThuKf2h/gXlyQHlyRCklSS3732xF4Kk28weTPqOMmiaY
	i5vF9yPIlpAEhpSEVKD25ICSpwaUMCiIKYBeIrHHz7IvZnRv1ZsBWDRZTjZNG91mt/9xMFChj4e
	QnZo8
X-Gm-Gg: ASbGncv16osV/aFc1L9ilwIuggG3Lu8sahi//zIZmheZ9vir534jZ+8y3kI9tHFZqdA
	H3hrlifGF9cYJoRZSkHQpF/rck7hNAT9UyWAZ5FauoiAndRutHYy6wIAxnLiLkKfuvCVz+orHVB
	nFxjzMwSoW1dAaERsgC7v5Jf79mTO+Ms88M6G11bjw87R1omT4qT1E/VFHjVZsAfa9aAkAEjQLf
	TBP1i5mDdrzMikUEWAFdwmgezLOU2gHj7dT/gW2rHpxjnuU3U5QqLiM8fhZOG1h+9Uhm0upJVvf
	dx1z+5B7BfY5KNlJIq2agW7rwKExZuaV5uvr3Sk9WRlsIKIIKS1c7A==
X-Google-Smtp-Source: AGHT+IHlVoXrgpmln2fAxPQXVDwSGolCM4C5cFMzgJlYfJoJSdc6zy0NsVjdxU8tdQ6Ks0iJw7OQTQ==
X-Received: by 2002:a17:90b:33cc:b0:312:959:dc41 with SMTP id 98e67ed59e1d1-313f1e1a926mr21785858a91.27.1750175999487;
        Tue, 17 Jun 2025 08:59:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.08.59.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:59:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/12] Patch review
Date: Tue, 17 Jun 2025 08:59:40 -0700
Message-ID: <cover.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218888

Please review this set of changes for walnascar and have comments back by
end of day Thursday, June 19.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1821

The following changes since commit 55a9cd748531c75d46f5d6d53af692a38c6b6716:

  python3: upgrade 3.13.3 -> 3.13.4 (2025-06-09 07:55:16 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.2.1

Deepesh Varatharajan (1):
  gcc: Upgrade to GCC 14.3

Harish Sadineni (1):
  binutils: Fix for CVE-2025-3198

Jiaying Song (1):
  python3-requests: upgrade 2.32.3 -> 2.32.4

Peter Marko (4):
  net-tools: patch CVE-2025-46836
  go: upgrade 1.24.3 -> 1.24.4
  systemd: upgrade 257.5 -> 257.6
  testimage: get real os-release file

Sandeep Gundlupet Raju (1):
  tune-cortexr52: Remove aarch64 for ARM Cortex-R52

Wang Mingyu (1):
  systemd: upgrade 257.4 -> 257.5

Yi Zhao (1):
  kea: upgrade 2.6.1 -> 2.6.3

Yongxin Liu (1):
  util-linux: fix agetty segfault issue

 meta/classes-recipe/testimage.bbclass         |   4 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../include/arm/armv8r/tune-cortexr52.inc     |   5 +-
 .../0001-Avoid-assert-on-empty-packet.patch   | 148 -----
 ...me-NameString-with-vector-of-uint8_t.patch |  90 ---
 .../0001-Update-asiolink-for-boost-1.87.patch | 190 ------
 ...po-in-Name-Name-append-to-ndata_-not.patch |  36 --
 .../kea/{kea_2.6.1.bb => kea_2.6.3.bb}        |   8 +-
 ..._257.4.bb => systemd-boot-native_257.6.bb} |   0
 ...md-boot_257.4.bb => systemd-boot_257.6.bb} |   0
 ...4.bb => systemd-systemctl-native_257.6.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 ...k-parse_printf_format-implementation.patch |   2 +-
 ...-not-disable-buffer-in-writing-files.patch |  14 +-
 .../systemd/0014-Handle-missing-gshadow.patch |   4 +-
 ...util-Make-STRERROR-portable-for-musl.patch |   7 +-
 .../{systemd_257.4.bb => systemd_257.6.bb}    |   0
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 ...tty-fix-stdin-conversion-to-tty-name.patch |  40 ++
 .../binutils/binutils-2.44.inc                |   1 +
 .../binutils/0016-CVE-2025-3198.patch         |  28 +
 .../gcc/{gcc-14.2.inc => gcc-14.3.inc}        |  11 +-
 ...ian_14.2.bb => gcc-cross-canadian_14.3.bb} |   0
 .../{gcc-cross_14.2.bb => gcc-cross_14.3.bb}  |   0
 ...-crosssdk_14.2.bb => gcc-crosssdk_14.3.bb} |   0
 ...cc-runtime_14.2.bb => gcc-runtime_14.3.bb} |   0
 ...itizers_14.2.bb => gcc-sanitizers_14.3.bb} |   0
 ...{gcc-source_14.2.bb => gcc-source_14.3.bb} |   0
 ...m-Fix-LDRD-register-overlap-PR117675.patch | 148 -----
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ----
 ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 --------------
 ...-incorrect-preprocessor-line-numbers.patch | 475 ---------------
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ------------------
 .../gcc/{gcc_14.2.bb => gcc_14.3.bb}          |   0
 ...initial_14.2.bb => libgcc-initial_14.3.bb} |   0
 .../gcc/{libgcc_14.2.bb => libgcc_14.3.bb}    |   0
 ...ibgfortran_14.2.bb => libgfortran_14.3.bb} |   0
 .../go/{go-1.24.3.inc => go-1.24.4.inc}       |   2 +-
 ...e_1.24.3.bb => go-binary-native_1.24.4.bb} |   6 +-
 ..._1.24.3.bb => go-cross-canadian_1.24.4.bb} |   0
 ...{go-cross_1.24.3.bb => go-cross_1.24.4.bb} |   0
 ...osssdk_1.24.3.bb => go-crosssdk_1.24.4.bb} |   0
 ...runtime_1.24.3.bb => go-runtime_1.24.4.bb} |   0
 .../go/{go_1.24.3.bb => go_1.24.4.bb}         |   0
 ...s_2.32.3.bb => python3-requests_2.32.4.bb} |   2 +-
 .../net-tools/CVE-2025-46836-01.patch         |  91 +++
 .../net-tools/CVE-2025-46836-02.patch         |  31 +
 .../net-tools/net-tools_2.10.bb               |   2 +
 scripts/install-buildtools                    |   4 +-
 49 files changed, 227 insertions(+), 2239 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
 rename meta/recipes-connectivity/kea/{kea_2.6.1.bb => kea_2.6.3.bb} (87%)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.4.bb => systemd-boot-native_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.4.bb => systemd-boot_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.4.bb => systemd-systemctl-native_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.4.bb => systemd_257.6.bb} (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch
 rename meta/recipes-devtools/gcc/{gcc-14.2.inc => gcc-14.3.inc} (90%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_14.2.bb => gcc-cross-canadian_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_14.2.bb => gcc-cross_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_14.2.bb => gcc-crosssdk_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_14.2.bb => gcc-runtime_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_14.2.bb => gcc-sanitizers_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_14.2.bb => gcc-source_14.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap-PR117675.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-preprocessor-line-numbers.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
 rename meta/recipes-devtools/gcc/{gcc_14.2.bb => gcc_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_14.2.bb => libgcc-initial_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_14.2.bb => libgcc_14.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_14.2.bb => libgfortran_14.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-1.24.3.inc => go-1.24.4.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.3.bb => go-binary-native_1.24.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.3.bb => go-cross-canadian_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.3.bb => go-cross_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.3.bb => go-crosssdk_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.3.bb => go-runtime_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.3.bb => go_1.24.4.bb} (100%)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (91%)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-01.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-02.patch

-- 
2.43.0


