Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452B0C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:02 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.16703.1690487032507090983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HBcfbaIL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-563dfffea87so945627a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487031; x=1691091831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=59DSionXdRETLGMCXeRsMP6vRalrNg4Pncm0gFJeiuo=;
        b=HBcfbaILjErObNsZTwWniZV/LtXRBKkjoZs7QlnU3mhb3Mg+SzP9ukcAXh7nywbtS5
         9H0Im1e/DihnX0gGxqZZThCEfj+1yCR5hkRDlk7Yon/vr6vgFFTKJOXhuLtdJENYXAMb
         QFHrUgGKfmsVP3MR3SP7m5X1JpxHmSc+aooicRlMPv/L5873n+aZLEgM5DlLKlktbS+x
         +8xgZWLWKH5b9b8qkP85muxd8MfT/O0XRK4isc5D9iN1wUGR6HGKupTDxYvr3d7aJ52h
         1w5j9+mKszPGxm+e3zBdcjFkx/a6+Nh8dYJrSQOEwcVp1IZwQBjV7yehdDQLvHxejAem
         kyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487031; x=1691091831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59DSionXdRETLGMCXeRsMP6vRalrNg4Pncm0gFJeiuo=;
        b=aqyOMysMvMVGqBwFhs6kRmWZ5jHo3cID3BZvxf9qPh2LnAAOt6ZI5Si+KMFhVFty/E
         84CRZIZ2veanrhqHjSOevmMjm6P7W0zFMyCgDRD6zjWG8mPoL5qgjMu+GnpqjHlCPYba
         Dv7kf4MKhtkDrOqu8RLFk24uQIGBFXiJjH+Dnwe9dnTaH/PK4MtbvzdQkP+/xDk1cZ/U
         SlVOMKsXEPp7S3HCPHoSQqDRNea2CRBvCr4tqifzFxJZKbrMFLZN0BHEtozpw4VdY9B/
         tftg1+Lwudu4nO3lF7F7yEVA7/lGfkJdVJSzeN7cHlWkqaXcHpbcCm6ygpl72JI8u7rv
         o2eg==
X-Gm-Message-State: ABy/qLYVedSd0XQtcbBfShJ/SDCAow9UPlnP2l821s391fagMVmc7wKe
	GqBULmoVLIN7cKTE+hV5RlN4ptmsslfRy1eSdDI=
X-Google-Smtp-Source: APBJJlH4zWHOInKwGAOW6B8mxgvwBWLNZUeRaQPIllUAYd5dStGoGrkqd13zNi8ZY8rbMI5WXX1k6Q==
X-Received: by 2002:a17:90a:bf81:b0:268:300b:ee81 with SMTP id d1-20020a17090abf8100b00268300bee81mr282810pjs.15.1690487031274;
        Thu, 27 Jul 2023 12:43:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.43.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:43:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/27] Patch review
Date: Thu, 27 Jul 2023 09:43:18 -1000
Message-Id: <cover.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184975

Please review this set of changes for mickledore and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5657

The following changes since commit 4724b382d183a2b3b8426c77c23b368f509411e7:

  acpica: Update SRC_URI (2023-07-21 07:41:18 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Benjamin Bouvier (1):
  util-linux: add alternative links for ipcs,ipcrm

Bruce Ashfield (3):
  linux-yocto/6.1: update to v6.1.36
  linux-yocto/6.1: update to v6.1.37
  linux-yocto/6.1: update to v6.1.38

Jose Quaresma (3):
  kernel-module-split add systemd modulesloaddir and modprobedir config
  openssl: add PERLEXTERNAL path to test its existence
  openssl: use a glob on the PERLEXTERNAL to track updates on the path

Khem Raj (1):
  meson.bbclass: Point to llvm-config from native sysroot

Mingli Yu (2):
  cups: Fix CVE-2023-34241
  ruby: Fix CVE-2023-36617

Ovidiu Panait (5):
  mdadm: fix util-linux ptest dependency
  mdadm: fix 07revert-inplace ptest
  mdadm: fix segfaults when running ptests
  mdadm: skip running known broken ptests
  mdadm: re-add mdadm-ptest to PTESTS_SLOW

Peter Marko (2):
  libjpeg-turbo: patch CVE-2023-2804
  python3: ignore CVE-2023-36632

Quentin Schulz (1):
  uboot-extlinux-config.bbclass: fix old override syntax in comment

Ross Burton (4):
  pkgconf: update SRC_URI
  python3: fix missing comma in get_module_deps3.py
  oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case
  rootfs_rpm: don't depend on opkg-native for update-alternatives

Stéphane Veyret (1):
  scripts/oe-setup-builddir: copy conf-notes.txt to build dir

Wang Mingyu (2):
  taglib: upgrade 1.13 -> 1.13.1
  libwebp: upgrade 1.3.0 -> 1.3.1

Yoann Congal (1):
  oeqa/selftest/devtool: add unit test for "devtool add -b"

Yuta Hayama (1):
  systemd-systemctl: fix errors in instance name expansion

 .../kernel-module-split.bbclass               |   4 +-
 meta/classes-recipe/meson.bbclass             |   1 +
 meta/classes-recipe/rootfs_rpm.bbclass        |   4 +-
 .../uboot-extlinux-config.bbclass             |   8 +-
 .../distro/include/ptest-packagelists.inc     |   3 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |   4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  32 ++
 .../openssl/openssl_3.1.1.bb                  |   4 +-
 meta/recipes-core/images/core-image-ptest.bb  |   1 +
 .../systemd/systemd-systemctl/systemctl       |   2 +-
 .../util-linux/util-linux_2.38.1.bb           |   2 +
 .../recipes-devtools/pkgconf/pkgconf_1.9.5.bb |   2 +-
 .../python/python3/get_module_deps3.py        |   2 +-
 .../recipes-devtools/python/python3_3.11.2.bb |   2 +
 .../ruby/ruby/CVE-2023-36617_1.patch          |  56 +++
 .../ruby/ruby/CVE-2023-36617_2.patch          |  52 ++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |   2 +
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2023-34241.patch            |  70 +++
 ...anup-validate_geometry_ddf_container.patch | 148 ++++++
 ...nter-dereference-in-validate_geometr.patch |  56 +++
 ...se-after-close-bug-by-closing-after-.patch |  91 ++++
 ...gfault-when-calling-NULL-get_bad_blo.patch |  42 ++
 ...Mark-and-ignore-broken-test-failures.patch | 128 +++++
 ...dd-broken-files-for-all-broken-tests.patch | 454 ++++++++++++++++++
 meta/recipes-extended/mdadm/files/run-ptest   |   2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   9 +-
 .../jpeg/files/CVE-2023-2804-1.patch          | 103 ++++
 .../jpeg/files/CVE-2023-2804-2.patch          |  75 +++
 .../jpeg/libjpeg-turbo_2.1.5.1.bb             |   2 +
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +-
 .../webp/files/CVE-2023-1999.patch            |  55 ---
 .../{libwebp_1.3.0.bb => libwebp_1.3.1.bb}    |   6 +-
 .../{taglib_1.13.bb => taglib_1.13.1.bb}      |   2 +-
 scripts/oe-setup-builddir                     |  14 +-
 37 files changed, 1373 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-34241.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
 delete mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
 rename meta/recipes-multimedia/webp/{libwebp_1.3.0.bb => libwebp_1.3.1.bb} (93%)
 rename meta/recipes-support/taglib/{taglib_1.13.bb => taglib_1.13.1.bb} (95%)

-- 
2.34.1


