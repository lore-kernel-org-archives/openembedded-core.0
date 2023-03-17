Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA35C7618E
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.466.1679092964067638986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LRW2KXm9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so10701446pjv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9DdXqV8JeHi/XIGQ7qimg4wIyV8NQjxXZ3IV3ib+zrM=;
        b=LRW2KXm9CRIL3dNVQAE3qQ/z5nNnhBDPo7DTOsXYKSO3/hO/gYi8Sb34mi7EaVeicU
         xgQPIDBctGw1sj2SbE0AagLKjO+/85J9LvTCJ7nblXP4WU8eb3sJ5PQnCjZv9whLRH3L
         a3g8Jz4NeHMBJvnNCMRUH+p1FEkH2/YTYgNEjsfRudsa1r/R3ESLbPhABsbtkaIcB9J1
         jEFJCHJwUcptjP3uMOsxyTBftR/kg2jxa1DWOx3eekzBAPIWZUfmFa9va94KU4Ch0Mkk
         4gkorQBUQx/iCoE015hZmoEZYuGeSLMX0u+czqklsV7bFFjkRXo7hBXvPxGP1DnPhXLU
         Z25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DdXqV8JeHi/XIGQ7qimg4wIyV8NQjxXZ3IV3ib+zrM=;
        b=4I+n//eeZiFaZ9fONraTrlDWi1J0yVeAQIg7zrO5i1GOfJIl4qhWO+8NwbnJbWW6Cl
         Wxfk2PN17iTXsDCA+PIC3p1kREwO8LSYb4g5/F2VS0b/23TwsUl/NgYMXxhO3d7/fLn+
         h/GvWXbQkNzEfwEBKxjarRHNjcL/u379j4aOfkPJpC/Uqs8TRKjpE05zhMwZbNHvMEE0
         AxzVpClRJHCTavRfyp55S1q5wUR0wv/no4Tm4ZFwRyatYPWx5oxqzA4NROOYR3UpG9kE
         MPVRxDr3jTRsGSFXTV5wgb9F3e/rONTMA8U6soq9WyuUr2HEZYXzD32//mj0m91V11PN
         IamA==
X-Gm-Message-State: AO0yUKUhS37mQyedVsgX+feh1kvVtMOP/K1KFJIwfumCuxgNCBEuT7nK
	O337LNvscmyUwTVcGKhOb5TW99O/lK0ReDoDgd8=
X-Google-Smtp-Source: AK7set+v3NGJJnXA+97HVfXJl/mQ4TTUM3NUfQK/+4YtGv1S1fNIBMIXYfyRx5t4Bod6qhoaP1bceg==
X-Received: by 2002:a17:902:f547:b0:1a0:6a47:184e with SMTP id h7-20020a170902f54700b001a06a47184emr12087391plf.42.1679092963002;
        Fri, 17 Mar 2023 15:42:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/21] Patch review
Date: Fri, 17 Mar 2023 12:42:14 -1000
Message-Id: <cover.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178761

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5063

The following changes since commit 8b41b5d2e423636942e34723ad940f6f143640c9:

  vala: Fix install conflict when enable multilib. (2023-03-14 05:40:43 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hongxu Jia (1):
  pkgconf: fix CVE-2023-24056

Joe Slater (1):
  python3: fix CVE-2023-24329

Kai Kang (1):
  python3-git: fix indent error

Kenfe-Mickael Laventure (3):
  buildtools-tarball: Handle spaces within user $PATH
  toolchain-scripts: Handle spaces within user $PATH
  populate_sdk_ext: Handle spaces within user $PATH

Michael Halstead (1):
  selftest/runtime_test/virgl: Disable for all Rocky Linux

Mingli Yu (3):
  mdadm: Fix testcase 06wrmostly
  mdadm: fix tests/02lineargrow
  mdadm: Fix raid0 tests

Richard Purdie (5):
  staging: Separate out different multiconfig manifests
  staging/multilib: Fix manifest corruption
  glibc: Add missing binutils dependency
  selftest/recipetool: Stop test corrupting tinfoil class
  base-files: Drop localhost.localdomain from hosts file

Ross Burton (2):
  vim: upgrade to 9.0.1403
  vim: set modified-by to the recipe MAINTAINER

Trevor Woerner (3):
  cups: use BUILDROOT instead of DESTDIR
  cups: check PACKAGECONFIG for pam feature
  cups: add/fix web interface packaging

Wang Mingyu (1):
  dhcpcd: Fix install conflict when enable multilib.

 meta/classes/multilib.bbclass                 |   1 +
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/classes/staging.bbclass                  |   4 +
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |   5 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   3 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...-conflict-error-when-enable-multilib.patch |  46 ++++++++
 meta/recipes-core/base-files/base-files/hosts |   2 +-
 meta/recipes-core/glibc/glibc.inc             |   4 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +-
 ...nd-stop-string-processing-on-truncat.patch |  75 +++++++++++++
 .../recipes-devtools/pkgconf/pkgconf_1.8.0.bb |   1 +
 ...-git-CVE-2022-24439-fix-from-PR-1521.patch |   2 +-
 .../python/python3/cve-2023-24329.patch       |  50 +++++++++
 .../recipes-devtools/python/python3_3.10.9.bb |   1 +
 meta/recipes-extended/cups/cups.inc           |  16 ++-
 ...-Fix-optional-write-behind-parameter.patch |  45 ++++++++
 ...d-a-test-that-validates-raid0-with-l.patch |  41 +++++++
 ...-Run-udevadm-settle-before-setting-r.patch |  39 +++++++
 ...ow-clear-the-superblock-at-every-ite.patch |  33 ++++++
 ...metadata-avoid-passing-chunk-size-to.patch |  41 +++++++
 ...ts-fix-raid0-tests-for-0.90-metadata.patch | 102 ++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   6 ++
 meta/recipes-support/vim/vim.inc              |   8 +-
 25 files changed, 511 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch
 create mode 100644 meta/recipes-devtools/python/python3/cve-2023-24329.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch

-- 
2.34.1


