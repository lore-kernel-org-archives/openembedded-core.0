Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034B5C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:37 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.8314.1745414434025497041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qfP2uZQw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so4074409a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414433; x=1746019233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KtLvIFwlQaeC+ZsfCbsusrLmBUlgyQfeypU0qO+6hag=;
        b=qfP2uZQw8zdM7dZa6PhcQYXnRlLggB9FuTMj0xfUFK2ejWitOEtQVQuPZZwqf8OGq/
         Snqg9mUZMPYmaVX7euUji7EmlqZFPEQ730AfjmHOclUfVs8zg/H5/9FMyh6UpZa6VxC6
         fR7el1o/OxUawI+UED39CodXi9k/axkieLuOTrL2uUhJLaakcZ0ZLRojTKPrnEYBczaH
         yhxML+Mg/pd24ixK4ljFNtoFdFQPFi+mAbTYpVP9ZHe26v2py7AZ4NSQ2SMi6P31Okg5
         YS4okgRtE48SaAeGLOlmQO9pO0Ji8CkMhtv7xB15LHWMw7IlC6ZOXsWDNBySXnb2DZ5j
         U2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414433; x=1746019233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtLvIFwlQaeC+ZsfCbsusrLmBUlgyQfeypU0qO+6hag=;
        b=oUoQDsuf05nPQ7e8PRQhg3BX1aR2klitsSttLEBa1OGuL2XE+jrHIlpPAB+WSgOAcm
         osrMr7E2JZ3rbUKhs+gGjQ32NKzhpruizvVu90kTLAkYju5ULLWBi35GGiAfn8m6Tyfa
         /7n3xIAvzbyTNkEKvUJUyFMNkl2ff7aqwYttNmVzOa2aWobr1BDMd0BN/Hymdb7bfQCR
         r0G+tPuD3K8OnqR5MKIOtdTuw6xvSFcWDt9oVLFo7ICahk4Bu3da3uNsUnM5DenSF+6m
         +LWEAvXuS52dHqYKgv0S0b9wnYFAAwFKK3M0glr8ewejrzGckVyIUDeQndIIVEnR8oLZ
         2RXw==
X-Gm-Message-State: AOJu0Yz6h56Tlf1edGMJ54qBx+EEChuCeTOJEhIHDOt9zmQ/Y7W9SXmv
	bo+CuHU/Mcyd7PKRYQuYXju58rsEETl8Q/zF+lmp97rWaMSXyBXb2cPHHEqOHGjbuIZjMJLA2AH
	f
X-Gm-Gg: ASbGnctGGmzKxgbuzHAl8BtrBAhsf831E7/088JS004ozS/46xTdBH0Aj3GUjNgkeRT
	EZlc5UMWqHwxdxB7PQzNl5i8IGggxMjKkHep6/bPOdEpyoWZ/DhYLuNdHWUJc7vdcFa2yXD5dlk
	1AAUW8d8ctIUxFkPQoj5JyfN8vxZcsJfqP9FfCMIUQ05Pj0yXnDbLnwdlIFQyzypQswPzYcTBgr
	GXTQ2+VgE1bb8FQnFwhzvl+h+lNriEoWnZPM+GnEIwtg4mEAuv+JWE0P+Ud/Iw+EV4p+EKLoDqt
	alpx7O2fH90GMb+A/ZZAc1bloWNK72c=
X-Google-Smtp-Source: AGHT+IEExCSUlqoViKDwEdRN/uSEar9TTfOH4bXLrH3Fp+ijD/2krgrb4OL1LsuvmTcBKr5ngmd/fQ==
X-Received: by 2002:a05:6a21:1643:b0:1f5:9330:2a18 with SMTP id adf61e73a8af0-203cbc712damr27543771637.23.1745414431782;
        Wed, 23 Apr 2025 06:20:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/14] Patch review
Date: Wed, 23 Apr 2025 06:20:11 -0700
Message-ID: <cover.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215293

Please review this set of changes for scarthgap and have comments back by
end of day Friday, April 25

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1437

The following changes since commit 04038ecd1edd6592b826665a2b787387bb7074fa:

  build-appliance-image: Update to scarthgap head revision (2025-04-19 14:43:09 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Ashish Sharma (1):
  binutils: patch CVE-2025-1182

Guðni Már Gilbert (2):
  systemd: upgrade 255.17 -> 255.18
  bluez5: add missing tools to noinst-tools package

Igor Opaniuk (1):
  wic: bootimg-efi: Support + symbol in filenames

Peter Marko (2):
  sqlite3: patch CVE-2025-3277
  sqlite3: patch CVE-2025-29088

Soumya Sambu (1):
  python3-jinja2: upgrade 3.1.4 -> 3.1.6

Vijay Anusuri (5):
  libsoup: Fix CVE-2025-32910
  libsoup: Fix CVE-2025-32909
  libsoup: Fix CVE-2025-32911 & CVE-2025-32913
  libsoup: Fix CVE-2025-32912
  libsoup: Fix CVE-2025-32906

Yogita Urade (2):
  curl: fix CVE-2024-11053
  curl: fix CVE-2025-0167

 .../bluez5/bluez5_5.72.bb                     |   8 +-
 ...55.17.bb => systemd-boot-native_255.18.bb} |   0
 ...-boot_255.17.bb => systemd-boot_255.18.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...1-missing_type.h-add-comparison_fn_t.patch |   2 +-
 ...k-parse_printf_format-implementation.patch |   4 +-
 ...tall-dependency-links-at-install-tim.patch |   2 +-
 ...missing.h-check-for-missing-strndupa.patch |   6 +-
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   4 +-
 ...005-add-missing-FTW_-macros-for-musl.patch |   2 +-
 ...06-Use-uintmax_t-for-handling-rlim_t.patch |   2 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |   2 +-
 ...patible-basename-for-non-glibc-syste.patch |   2 +-
 ...implment-systemd-sysv-install-for-OE.patch |   2 +-
 ...uffering-when-writing-to-oom_score_a.patch |   4 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 ...-not-disable-buffer-in-writing-files.patch |   2 +-
 .../0013-Handle-__cpu_mask-usage.patch        |   2 +-
 .../systemd/0014-Handle-missing-gshadow.patch |   8 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   2 +-
 ...ass-correct-parameters-to-getdents64.patch |   4 +-
 .../0017-Adjust-for-musl-headers.patch        |   2 +-
 ...trerror-is-assumed-to-be-GNU-specifi.patch |   2 +-
 ...util-Make-STRERROR-portable-for-musl.patch |   2 +-
 ...ake-malloc_trim-conditional-on-glibc.patch |   2 +-
 ...hared-Do-not-use-malloc_info-on-musl.patch |   2 +-
 ...22-avoid-missing-LOCK_EX-declaration.patch |   2 +-
 .../{systemd_255.17.bb => systemd_255.18.bb}  |   0
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2025-1182.patch     |  33 +
 ...inja2_3.1.4.bb => python3-jinja2_3.1.6.bb} |   5 +-
 .../curl/curl/CVE-2024-11053-0001.patch       | 353 +++++++++
 .../curl/curl/CVE-2024-11053-0002.patch       | 728 ++++++++++++++++++
 .../curl/curl/CVE-2024-11053-0003.patch       | 130 ++++
 .../curl/curl/CVE-2025-0167.patch             | 178 +++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   4 +
 .../libsoup-3.4.4/CVE-2025-32906-1.patch      |  61 ++
 .../libsoup-3.4.4/CVE-2025-32906-2.patch      |  83 ++
 .../libsoup-3.4.4/CVE-2025-32909.patch        |  36 +
 .../libsoup-3.4.4/CVE-2025-32910-1.patch      |  98 +++
 .../libsoup-3.4.4/CVE-2025-32910-2.patch      | 149 ++++
 .../libsoup-3.4.4/CVE-2025-32910-3.patch      |  27 +
 .../CVE-2025-32911_CVE-2025-32913-1.patch     |  72 ++
 .../CVE-2025-32911_CVE-2025-32913-2.patch     |  44 ++
 .../libsoup-3.4.4/CVE-2025-32912-1.patch      |  41 +
 .../libsoup-3.4.4/CVE-2025-32912-2.patch      |  30 +
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  10 +
 .../sqlite/sqlite3/CVE-2025-29088.patch       | 179 +++++
 .../sqlite/sqlite3/CVE-2025-3277.patch        |  28 +
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   5 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py |   2 +-
 52 files changed, 2335 insertions(+), 38 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.17.bb => systemd-boot-native_255.18.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.17.bb => systemd-boot_255.18.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.17.bb => systemd_255.18.bb} (100%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb} (81%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0003.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-0167.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-29088.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch

-- 
2.43.0


