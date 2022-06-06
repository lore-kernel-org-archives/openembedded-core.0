Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEE2C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:38:55 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.32694.1654526325989290157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zvszTgow;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so18061908pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM4rMr6Y+2A84VJUhx1i8Wnt7eCcCAaF6cHbSHX4joI=;
        b=zvszTgowEMKbYW7l/e6pXqcTpRaCEOA4DiwubuRSDlnvdHDXx2Oo0+5ljUMoBJp9xv
         ej5m6YRdDy7w9maroEfgQPLCkG3L96ioiMCyGu1L6VyfH29IONDtP9yFf8blXVMgfALb
         I4bNj7TDBC4Y0f/RHFGhpA6XHH3tJl8ZH9LMHKmA3CsI+LHsNx+PMLdJPRQmrDpyvf6x
         hOwC15lJRIVX1ROZ2GAPiGVh5KlRBqWi6GaJAaJIJaby8k7NI6lHHPuEGj/v95vNGNLJ
         y4kkjWTCE9QrQXMPfAMBJufYaAVvquvURH/Y42OU62717bDXjk82rjw7M33ILxcSXqQ1
         L78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM4rMr6Y+2A84VJUhx1i8Wnt7eCcCAaF6cHbSHX4joI=;
        b=WWHb6ocP3cKjUEOHtM1h0cNHgj4Ab8UCVco/6kY0eRjEpoxCuDlUU61GfgAznUF+fS
         BHca727klAUgyy4IbrZr9rT+4Z1kS0/KL+0iG3wdz+vzgwxSZCoFIcfzbywe0oXTkZ2R
         UAIlOJU+kPtFoKRPZ0X2Su1loaasar8DaabWNdtG5UJV0z+q6UgJ/ZhbmgB9uzljBUhA
         xZIX4BEGYGh57+qWmixuLnpbHJqLJLqSa4nctDzs1t+BTnpvhpd/uaR846iCrx4KeaTq
         KinZdrTFRhUuk/7pj/Ck9O0UWGyLsAsJyTD4D24H0MK/hP38NW9ho5eliP8OJGLmvDkv
         3sYA==
X-Gm-Message-State: AOAM533lHUXcLN68rYewG/ZPDvYTFdgybT0sQDCArtdFxCQQoq/VFl4O
	pKQ4d5z122qzekR/3ZoP7F5kuSf8ZGU47vQG
X-Google-Smtp-Source: 
 ABdhPJw+eRMIsW6aLlQF1RGiQbGzyYpEdXqozl5Oxf2l+3FVy7ZlVgi1PeNioZ8MHZ/I3a+vTjSJSg==
X-Received: by 2002:a17:902:7c90:b0:167:8898:f82b with SMTP id
 y16-20020a1709027c9000b001678898f82bmr2566220pll.171.1654526324437;
        Mon, 06 Jun 2022 07:38:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.38.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:38:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Mon,  6 Jun 2022 04:38:18 -1000
Message-Id: <cover.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166633

Please review this set of patches for kirkstone and have comments back by end
of day Wednesday.

This is a set of "housekeeping" commits: updating the Upstream-Status of patches
and removing obsolete patches.

The following changes since commit e63013cc38b82659658365da53b14952711d6701:

  gcc: Upgrade to 11.3 release (2022-06-02 06:48:32 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (3):
  bash: submit patch upstream
  valgrind: submit arm patches upstream
  zip/unzip: mark all submittable patches as Inactive-Upstream

Jiaqing Zhao (4):
  systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
  systemd: Remove __compare_fn_t type in musl-specific patch
  systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
  systemd: Correct path returned in sd_path_lookup()

Khem Raj (4):
  systemd: Drop redundant musl patches
  systemd: Document future actions needed for set of musl patches
  systemd: Drop
    0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
  systemd: Update patch status

Martin Jansa (1):
  makedevs: Don't use COPYING.patch just to add license file into ${S}

Richard Purdie (1):
  lzo: Add further info to a patch and mark as Inactive-Upstream

 ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  73 ++++
 ...se-ROOTPREFIX-without-suffixed-slash.patch |  42 ---
 ...test-parse-argument-Include-signal.h.patch |  27 --
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   2 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ---------
 ...-missing_type.h-add-comparison_fn_t.patch} |  41 +--
 ...missing.h-check-for-missing-strndupa.patch |  14 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   3 +
 ..._register_atfork-for-non-glibc-build.patch |   3 +
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  33 --
 ...ype.h-add-__compar_d_fn_t-definition.patch |  28 --
 .../systemd/0019-Handle-missing-LOCK_EX.patch |  24 --
 ...ible-pointer-type-struct-sockaddr_un.patch |  38 --
 .../0021-test-json.c-define-M_PIl.patch       |   4 +
 meta/recipes-core/systemd/systemd_250.5.bb    |  10 +-
 .../makedevs/makedevs/COPYING.patch           | 346 ------------------
 .../makedevs/makedevs/makedevs.c              |   4 +
 .../makedevs/makedevs_1.0.1.bb                |   5 +-
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch |   2 +-
 ...n-for-targets-which-don-t-support-it.patch |   2 +-
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |   2 +-
 .../bash/bash/makerace2.patch                 |   2 +-
 ...ass-LDFLAGS-to-tests-doing-link-step.patch |   2 +-
 .../unzip/unzip/CVE-2021-4217.patch           |   2 +-
 .../unzip/unzip/avoid-strip.patch             |   2 +-
 .../unzip/unzip/define-ldflags.patch          |   2 +-
 .../unzip/unzip/fix-security-format.patch     |   2 +-
 .../unzip/unzip/symlink.patch                 |   2 +-
 ...LAGS-and-LDFLAGS-when-doing-link-tes.patch |   2 +-
 .../zip/zip-3.0/10-remove-build-date.patch    |   2 +-
 .../zip/zip-3.0/fix-security-format.patch     |   2 +-
 .../zipnote-crashes-with-segfault.patch       |   2 +-
 ...Use-memcpy-instead-of-reinventing-it.patch |  10 +-
 33 files changed, 136 insertions(+), 762 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
 rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (63%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
 delete mode 100644 meta/recipes-devtools/makedevs/makedevs/COPYING.patch

-- 
2.25.1


