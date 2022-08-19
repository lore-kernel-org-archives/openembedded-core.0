Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B86C00140
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:15 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.50675.1660876985505791286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4mgwypV1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id w14so3023943plp.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=eqmRivMlMCZ4K528MVDZddvbJcahS/p1RKARtUCQruc=;
        b=4mgwypV1P0NdpeLfMa5deUHsVwKs1SeuGGJtr3e3NM/SV+IGDawu4maqVI1wgqhUcf
         4LOmY5WrMsF3vADbGLK4dh6sQy4budaXs8F7WEpTceAoR4VHd506x1Qch8x2JiJ3YmGx
         BizF6OMVSAdnkUILjY/Skl7v33X4z2hjC5+EH91SIv5y8UH193wBaZEDaXqoTE8NGWv7
         RQTi6x1oT0mWKEIP67bmgzTlfuSEzVTGCZBVxqjHiFhx+kBzYIM2Hnu3S3HNITuvGA8P
         1jjl6KrSOL4UTiOPri04R9l3q+LZYmeI7CwTD/3HWMPMSA7CXNj1f3wPbZaP8LPvQFyp
         Pq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=eqmRivMlMCZ4K528MVDZddvbJcahS/p1RKARtUCQruc=;
        b=3I3oBfXo/1eimzcW/zquLmNCwb2EwLn323MKP4ahSgKRKd/TRzxyPQ2dZJ6FE6tS+9
         VrbwrRtEfE8FTsCdGgr/6mbjynnCY1oRuOgQyzlUOHjj/cTEwidpUgueJ0aDDDsV4wga
         nQZSLjW+o9/QgMHcl+8xUwBOVtbEPSxA0DI8dTep8lAuGn9rKlH36kumuFTq4j4D5Igi
         hqr+Vnh1APkujt1XDXSChHRqbe184GAbFlXcXdJ/BOLVWmoVU7OM5NA9cmGK8XmbzP6V
         uPuFdDfa2UZmJQ+CCUr/i+oSGZN1BgFkbcGXtUQ8wL746pO75Ay5EOl7+HwSEqRXKk04
         JPVA==
X-Gm-Message-State: ACgBeo2MsQrvrx4UVNGrKuPi63qSXKJqsMR9RzU+Rok97rgc1jAwH31d
	BJCgEAsgSLKZiMUm92fYBuBLs5/nQ1x/wfE+
X-Google-Smtp-Source: 
 AA6agR7P+3UlXyACIQi46bbJmA2j3qo43+UVD8KVK17cdwE6DdQtlU9JJPR1gS7R0DBsf2Ph/WVxcA==
X-Received: by 2002:a17:90b:4f47:b0:1f5:6919:8868 with SMTP id
 pj7-20020a17090b4f4700b001f569198868mr5977556pjb.131.1660876983835;
        Thu, 18 Aug 2022 19:43:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/26] Patch review
Date: Thu, 18 Aug 2022 16:42:22 -1000
Message-Id: <cover.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169543

Please review this set of patches for kirkstone and have comments back by end
of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4106

The following changes since commit 2cafa6ed5f0aa9df5a120b6353755d56c7c7800d:

  build-appliance-image: Update to kirkstone head revision (2022-08-10 14:59:51 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (3):
  devtool/upgrade: correctly clean up when recipe filename isn't yet
    known
  devtool/upgrade: catch bb.fetch2.decodeurl errors
  scripts/oe-setup-builddir: make it known where configurations come
    from

Bruce Ashfield (3):
  lttng-modules: fix 5.19+ build
  lttng-modules: fix build against mips and v5.19 kernel
  lttng-modules: replace mips compaction fix with upstream change

Hitendra Prajapati (3):
  gdk-pixbuf: CVE-2021-46829 a heap-based buffer overflow
  gnutls: CVE-2022-2509 Double free during gnutls_pkcs7_verify
  zlib: CVE-2022-37434 a heap-based buffer over-read

Jose Quaresma (2):
  archiver.bbclass: remove unsed do_deploy_archives[dirs]
  create-spdx: ignore packing control files from ipk and deb

Mark Hatle (1):
  runqemu: Add missing space on default display option

Martin Beeger (1):
  cmake: remove CMAKE_ASM_FLAGS variable in toolchain file

Mihai Lindner (1):
  create-spdx: Fix supplier field

Mikko Rapeli (1):
  boost: fix install of fiber shared libraries

Paul Eggleton (1):
  relocate_sdk.py: ensure interpreter size error causes relocation to
    fail

Randy MacLeod (1):
  vim: update from 9.0.0063 to 9.0.0115

Richard Purdie (2):
  nativesdk: Clear TUNE_FEATURES
  selftest/wic: Tweak test case to not depend on kernel size

Roland Hieber (1):
  devtool: error out when workspace is using old override syntax

Sakib Sajal (6):
  qemu: fix CVE-2021-3507
  qemu: fix CVE-2021-3929
  qemu: fix CVE-2021-4158
  qemu: fix CVE-2022-0358
  qemu: fix CVE-2022-0216
  u-boot: fix CVE-2022-33103

 meta/classes/archiver.bbclass                 |   1 -
 meta/classes/create-spdx.bbclass              |   7 +-
 meta/classes/nativesdk.bbclass                |   1 +
 meta/lib/oe/spdx.py                           |   2 +-
 meta/lib/oeqa/selftest/cases/wic.py           |   2 +-
 ..._read-Prevent-arbitrary-code-executi.patch |  80 +++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 .../zlib/zlib/CVE-2022-37434.patch            |  44 +++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 .../cmake/cmake/OEToolchainConfig.cmake       |   1 -
 meta/recipes-devtools/qemu/qemu.inc           |   7 +
 .../qemu/qemu/CVE-2021-3507_1.patch           |  92 ++++++
 .../qemu/qemu/CVE-2021-3507_2.patch           | 115 +++++++
 .../qemu/qemu/CVE-2021-3929.patch             |  70 +++++
 .../qemu/qemu/CVE-2021-4158.patch             |  46 +++
 .../qemu/qemu/CVE-2022-0216_1.patch           |  42 +++
 .../qemu/qemu/CVE-2022-0216_2.patch           |  52 ++++
 .../qemu/qemu/CVE-2022-0358.patch             | 106 +++++++
 .../gdk-pixbuf/CVE-2021-46829.patch           |  61 ++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.6.bb           |   1 +
 .../lttng-modules/0001-fix-compaction.patch   |  68 +++++
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 +++++++
 ...ags-parameter-from-aops-write_begin-.patch |  76 +++++
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ++++++++
 .../lttng/lttng-modules_2.13.4.bb             |   4 +
 ...ll-targets-if-there-s-build-no-in-ur.patch |  82 +++++
 meta/recipes-support/boost/boost_1.78.0.bb    |   1 +
 .../gnutls/gnutls/CVE-2022-2509.patch         | 282 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 .../vim/files/crosscompile.patch              |  51 ----
 meta/recipes-support/vim/files/racefix.patch  |  37 ---
 meta/recipes-support/vim/vim.inc              |   6 +-
 scripts/devtool                               |  10 +-
 scripts/lib/devtool/upgrade.py                |  33 +-
 scripts/oe-setup-builddir                     |  12 +-
 scripts/relocate_sdk.py                       |  10 +-
 scripts/runqemu                               |   2 +-
 37 files changed, 1511 insertions(+), 126 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch
 delete mode 100644 meta/recipes-support/vim/files/crosscompile.patch
 delete mode 100644 meta/recipes-support/vim/files/racefix.patch

-- 
2.25.1


