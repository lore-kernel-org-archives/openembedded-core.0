Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16CDCD5BD4
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:13 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3172.1695249063887562447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YNuIZxH3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso176260b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249063; x=1695853863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzD/g0s3GK2i/p5RgsY5LLf9i2PVWXyZq26NECzVRz0=;
        b=YNuIZxH3wvZJDFbLv9PEa/FETzJtJFNL5rlgoAjlOfEXgmL1VczgZOR0Xkt1fUok8a
         hvG/mpP2bKTtWQqODG9TwujES5V/rwqLjcQEKSJ842j87/NSUOQv8nsuXxUF6aSH4ovr
         tXn/+R96ICCW8qUNVWJpTUGxyXvzLjvf4lqVxDXFV1aNEmYf45MZUq6+eAEbRmFW0DNn
         fnlxbq+OVmRpKCXfJXx0oMghsgG6nPMGMi93OV7JgDBJC8ZLow0VJPyPMJ6L5U5pc7r/
         NOsQpJEjMlfUb50iEBpTdKsVhEc1j+kXi9kIM3U9U/HspyDRb3NKtEzxeCxgBNBIMxyz
         JvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249063; x=1695853863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzD/g0s3GK2i/p5RgsY5LLf9i2PVWXyZq26NECzVRz0=;
        b=jLk+0+5If72B5DKTjSOtstMEljt2gBdh8dGBHpBin2iVWpvIK3DcgiNlsPTmVdKerb
         0l3/NSe3lemF43gV/vUcpTIlxB7Pg/kxZ80b3hh6xgnFrcQOR++bXhekdJW5dR3USRj5
         Ae/W8Y52Z31gHoMl8zF1/Rx2y9d+GJAvi3HBDMAixD790/gDqOm0e/ZtBJfQzIeIHSs2
         bPkmChJdQP7QVynO6nETw10GIur5IY8OChhmgXueX2Yu3rjzvHU1DvIHyVR2Jeuaz7U1
         5pwzE1FgmxSSo4G5c0wO9Uh1ThIvPl1YPArvqM+zcb7RPCmtneQizeTmLq2IpwnrZBMG
         jY/g==
X-Gm-Message-State: AOJu0YzUvzhsOLDAefP2lkGOi9o1V3np4X2+G4GJxywrzgenU4rof4za
	0WyFCQOXCv1j76ZGg+Cke4sCaY7po0xpk/wXLXg=
X-Google-Smtp-Source: AGHT+IFQTfccOgmSVPH3YUxKpTqnKptgjBsWImv7oHF9YExFlgOpEu0binxr/C3sRYHUJfJCuPC1UA==
X-Received: by 2002:a05:6a00:b85:b0:68f:ce6a:8685 with SMTP id g5-20020a056a000b8500b0068fce6a8685mr6072126pfj.14.1695249062668;
        Wed, 20 Sep 2023 15:31:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/20] Patch review
Date: Wed, 20 Sep 2023 12:30:37 -1000
Message-Id: <cover.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187948

Please review this set of changes for kirkstone and have comments back by
end of day Friday, September 22.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5927

The following changes since commit 26309ba6ef5b776d6bc45b984261b91e6c8c5a94:

  yocto-uninative: Update to 4.3 (2023-09-12 12:47:53 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  cargo.bbclass: set up cargo environment in common do_compile

Alexis Lothoré (1):
  oeqa/utils/gitarchive: fix tag computation when creating archive

Archana Polampalli (1):
  vim: upgrade 9.0.1592 -> 9.0.1664

Etienne Cordonnier (1):
  vim: update obsolete comment

Khem Raj (1):
  build-sysroots: Add SUMMARY field

Markus Niebel (1):
  wic: fix wrong attempt to create file system in upartitioned regions

Martin Jansa (1):
  tcl: prevent installing another copy of tzdata

Michael Opdenacker (1):
  scripts/create-pull-request: update URLs to git repositories

Pavel Zhukov (1):
  dbus: Specify runstatedir configure option

Peter Suti (1):
  externalsrc: fix dependency chain issues

Richard Purdie (3):
  vim: Upgrade 9.0.1664 -> 9.0.1894
  pseudo: Fix to work with glibc 2.38
  resulttool/report: Avoid divide by zero

Ross Burton (1):
  gcc: Fix -fstack-protector issue on aarch64

Sanjana (3):
  binutils: Fix CVE-2022-48065
  glibc: stable 2.35 branch updates
  binutils: stable 2.38 branch updates

Soumya Sambu (1):
  go: Fix CVE-2023-39319

Wang Mingyu (1):
  tar: upgrade 1.34 -> 1.35

Yogita Urade (1):
  cups: fix CVE-2023-32360

 meta/classes/cargo.bbclass                    |    1 -
 meta/classes/cargo_common.bbclass             |    4 +
 meta/classes/externalsrc.bbclass              |    7 +-
 meta/lib/oeqa/utils/gitarchive.py             |    6 +-
 meta/recipes-core/dbus/dbus_1.14.8.bb         |    3 +-
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 meta/recipes-core/meta/build-sysroots.bb      |    3 +-
 .../binutils/binutils-2.38.inc                |    5 +-
 .../binutils/0029-CVE-2022-48065-1.patch      |   31 +
 .../binutils/0029-CVE-2022-48065-2.patch      |  115 +
 .../binutils/0029-CVE-2022-48065-3.patch      |  122 +
 meta/recipes-devtools/gcc/gcc-11.4.inc        |    1 +
 .../gcc/gcc/CVE-2023-4039.patch               | 2893 +++++++++++++++++
 meta/recipes-devtools/go/go-1.17.13.inc       |    3 +-
 .../go/go-1.20/CVE-2023-39319.patch           |  254 ++
 .../pseudo/files/glibc238.patch               |   72 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    1 +
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb     |    6 +
 meta/recipes-extended/cups/cups.inc           |    1 +
 .../cups/cups/CVE-2023-32360.patch            |   35 +
 .../tar/tar/CVE-2022-48303.patch              |   43 -
 .../tar/{tar_1.34.bb => tar_1.35.bb}          |    8 +-
 meta/recipes-support/vim/vim.inc              |   11 +-
 scripts/create-pull-request                   |    7 +-
 scripts/lib/resulttool/report.py              |    5 +-
 scripts/lib/wic/partition.py                  |    2 +-
 26 files changed, 3568 insertions(+), 73 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-3.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32360.patch
 delete mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-extended/tar/{tar_1.34.bb => tar_1.35.bb} (87%)

-- 
2.34.1


