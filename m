Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CA0C02192
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:26 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.7726.1738205482571673360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uMJnCN/6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f42992f608so372919a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205481; x=1738810281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaxgvvH5J32wDrPAIdeANg2t7vWg8B0sk+zVGuyKNdM=;
        b=uMJnCN/6U248SmGjXGrRSjJAgRlxgIXmNmmwIXaKb4W/wbXHX3QjF19Og0NRvUkB5+
         aiOmfdqtKKm9zu29Rzk2K5n9uot8+cXH9vYSb1yBuRbmHjH/VfkhaQGbPcLnH3/KAVZY
         3S1z5PwhQaALLplcrTeCua6EX/fl0AyteEaAEL2pLN71YrWYrUnkkgjz7Fij+g2VxHQq
         rkgNfRNdEoqOR8qgM01I5DxXrsGb079E5WiCZHBJkOXHeA42YZBIup1eRRqV4RjwTULJ
         N66uv7ixGdR2uOQamQrfrHekYQbuLk4Xvl2KOWQa0NUYQ+k+nvOhT6mZDJFwHVg42taG
         15Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205481; x=1738810281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QaxgvvH5J32wDrPAIdeANg2t7vWg8B0sk+zVGuyKNdM=;
        b=Z4VUkwK5udgthVVI3aNTuXeC3Yv2OAsTT/6jEfb4oK5CPu+uZ/vxDeo+rryqB4kuWd
         ATIkHm8pvreSJGx6BDWWDjXdLG1S5lciGWD3W3i3WVsHmlTDHPFAnbhGiaM1em4s5wCt
         wP6zoZGNKRfRIMy3TlaQoLPu1+bxIZsTItA03y4xPgs5hE/hWFQDjnwY2SA5rRIy4IJ9
         +k5aBrDHv9C8F4JGyEiOi4QNg111n/TTihZzx0GIXXKcUYuOqWbb765ffCigWYvz5YIz
         U+/6+v8XOCfgBmNhZbfPvvuLAPfdzJduuBqkkE6kiVF4IXXqKMVGmQyd/RITgi/wQfUx
         X5Tg==
X-Gm-Message-State: AOJu0YzUFpqDLho1cvKsies1BJwJKUjeD++E2agedvPDlQI1ivRC/6er
	nLEDzFKsQfuz3FBGENM9HB6WkGA1ctzP+c0lhk/xdRq+qZOLqKR/isYI/dN5Ua3EUFeZuMiHzhz
	c3Rk=
X-Gm-Gg: ASbGnctk/byRyF/Y06w9dy+SCePNHWmT9HkoaXYeBGntfkS3G09rhF4EEftcfKbkYS3
	HC56Qbf31N/l+yzV57N6TyHOSgGAPS9LFF9hiTxcN8DVsjlmfPiwCynPofTWo0dAK2BFoZaNQUA
	LDkzLMO6cwc7u90Q/TN3ocmRlrmLnPc8t6lNxTm9AYv+wTCwL6qMExVWaIxZXywpVareuxEOU/p
	ZLqSKbdJPzIkqTl03BlooQF7cLpnjqaKcFd1DeqtFv8AK+kKVbH+OQTg7cVPQqEil7P15hArgI7
	7qFJ
X-Google-Smtp-Source: AGHT+IGrP2y/uPaT+ZsZwNpob2OGDr9UFJMJgIAY9Yliwqs/qg+mPEgGotHzXrW9VEm72wI+6ka5Xw==
X-Received: by 2002:a05:6a00:3e24:b0:725:4109:5b5f with SMTP id d2e1a72fcca58-72fd0bf3cd5mr9612329b3a.8.1738205481134;
        Wed, 29 Jan 2025 18:51:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/12] Patch review
Date: Wed, 29 Jan 2025 18:51:01 -0800
Message-ID: <cover.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210421

Please review this set of changes for scarthgap and have comments back by
end of day Friday, January 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/907

The following changes since commit 62cb12967391db709315820d48853ffa4c6b4740:

  build-appliance-image: Update to scarthgap head revision (2025-01-26 14:05:12 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adrian Freihofer (6):
  devtool: modify support debug-builds
  devtool: ide-sdk sort cmake preset
  devtool: ide-sdk recommend DEBUG_BUILD
  oe-selftest: devtool ide-sdk use modify debug-build
  devtool: ide-sdk remove the plugin from eSDK installer
  uboot-config: fix devtool modify with kernel-fitimage

Guðni Már Gilbert (1):
  systemd: upgrade 255.13 -> 255.17

Marek Vasut (1):
  u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and
    UBOOT_ENV enabled

Peter Marko (4):
  openssl: patch CVE-2024-13176
  go: upgrade 1.22.8 -> 1.22.9
  go: upgrade 1.22.9 -> 1.22.10
  go: upgrade 1.22.10 -> 1.22.11

 meta/classes-recipe/kernel-fitimage.bbclass   |  53 +-------
 meta/classes-recipe/uboot-config.bbclass      |  17 ++-
 meta/classes-recipe/uboot-sign.bbclass        |  26 ++--
 meta/conf/image-fitimage.conf                 |  53 ++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
 .../openssl/openssl/CVE-2024-13176.patch      | 126 ++++++++++++++++++
 .../openssl/openssl_3.2.3.bb                  |   1 +
 ...55.13.bb => systemd-boot-native_255.17.bb} |   0
 ...-boot_255.13.bb => systemd-boot_255.17.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...1-missing_type.h-add-comparison_fn_t.patch |   2 +-
 ...k-parse_printf_format-implementation.patch |   6 +-
 ...tall-dependency-links-at-install-tim.patch |   2 +-
 ...missing.h-check-for-missing-strndupa.patch |  33 +++--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   2 +-
 ...005-add-missing-FTW_-macros-for-musl.patch |   2 +-
 ...06-Use-uintmax_t-for-handling-rlim_t.patch |   6 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |   2 +-
 ...patible-basename-for-non-glibc-syste.patch |   2 +-
 ...implment-systemd-sysv-install-for-OE.patch |   2 +-
 ...uffering-when-writing-to-oom_score_a.patch |   4 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 ...-not-disable-buffer-in-writing-files.patch |  34 ++---
 .../0013-Handle-__cpu_mask-usage.patch        |   2 +-
 .../systemd/0014-Handle-missing-gshadow.patch |   2 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   2 +-
 ...ass-correct-parameters-to-getdents64.patch |   2 +-
 .../0017-Adjust-for-musl-headers.patch        |   6 +-
 ...trerror-is-assumed-to-be-GNU-specifi.patch |   2 +-
 ...util-Make-STRERROR-portable-for-musl.patch |   2 +-
 ...ake-malloc_trim-conditional-on-glibc.patch |   4 +-
 ...hared-Do-not-use-malloc_info-on-musl.patch |   2 +-
 ...22-avoid-missing-LOCK_EX-declaration.patch |   4 +-
 .../{systemd_255.13.bb => systemd_255.17.bb}  |   0
 .../go/{go-1.22.8.inc => go-1.22.11.inc}      |   2 +-
 ..._1.22.8.bb => go-binary-native_1.22.11.bb} |   6 +-
 ...1.22.8.bb => go-cross-canadian_1.22.11.bb} |   0
 ...go-cross_1.22.8.bb => go-cross_1.22.11.bb} |   0
 ...sssdk_1.22.8.bb => go-crosssdk_1.22.11.bb} |   0
 ...untime_1.22.8.bb => go-runtime_1.22.11.bb} |   0
 .../go/{go_1.22.8.bb => go_1.22.11.bb}        |   0
 scripts/lib/devtool/ide_sdk.py                |  63 +++------
 scripts/lib/devtool/standard.py               |   3 +
 44 files changed, 301 insertions(+), 182 deletions(-)
 create mode 100644 meta/conf/image-fitimage.conf
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
 rename meta/recipes-core/systemd/{systemd-boot-native_255.13.bb => systemd-boot-native_255.17.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.13.bb => systemd-boot_255.17.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.13.bb => systemd_255.17.bb} (100%)
 rename meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.11.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.8.bb => go-binary-native_1.22.11.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.8.bb => go-cross-canadian_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.8.bb => go-cross_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.8.bb => go-runtime_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.11.bb} (100%)

-- 
2.43.0


