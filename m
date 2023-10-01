Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE4CE748EE
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.62137.1696176020225976585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FWp27gNj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c3f97f2239so142063035ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176019; x=1696780819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2+PrhD5ym/n+BrLq8055V2ROe7jXbYsJEd2t5jx6eE=;
        b=FWp27gNjSDzOLOJlRZfcyJ3ZRUzUfHBNaiw5ptVYHM6nNYkXwD/hOSo+4GfrS2vgfb
         uW2SX9bFy7fOv/jDCfbxBRPM/MKKGe3IiAFY6GHBfQ3SqBz3NWt2HMtKoYwrvI3op3NW
         gRUnR8mVf8XRo7GTpkc3o+a5Q1cs/fhMsNmCYDf+r8WeRLWvZnA4Q4FD32xd91y/sm7R
         E0FAHZH5NDLuRz7bffL4XfmYo0CGfk1GEClh3/aPidIqozBtSJ4zK00kTOji7T2PL/j6
         XC74cMlooaeKewgQViISaXM3SiLRY/tO5JkqhXgmqxSQohONWWslf4LABsOWLCze5qFM
         mYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176019; x=1696780819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2+PrhD5ym/n+BrLq8055V2ROe7jXbYsJEd2t5jx6eE=;
        b=rW3jhT7QDo4CMd7DBaWLxNJFY9kotuN0X0G1/2LDi92/LlUskC5M0N9g6Sqg9ZlHyn
         BkZU17IbSumyzZ+8GZ4lw64krbKQBcvK9NbzBuy9XYZYr8G8fCUQF4kj+OoZoanxubpW
         cSMSD9AdUpkv7z0UeechmzeCkkhNpWknoekK157bdLyANg1G49hk3sUMtg/rgTLM6n8W
         g4Vxlye+Lda/BYnP/y1aOH0eCSe3LSYYanpJ4Bssv/N+h/dX+Bim725T/Z+5PbJm6H6l
         UvzaOodX8oyvNGeraGB3LxtXULMI6SI817UFnWwok2DjC+/Hn9CockH2ydx6D+1D3XOf
         ocIA==
X-Gm-Message-State: AOJu0YwKRqomd1xYLJb+SSx4XYxpszg8IEgEtpmcj9LG78h6189kkmdi
	SZ05oJj4AT02SbJ+2I5Jpj8UukTuPpcmSm7LVqp0CQ==
X-Google-Smtp-Source: AGHT+IGIm84iASh45PkG4h0+RnMlzDkS/AfjdSu/vGlWCzAGM8QccaqO5mTQwk5zznQ7h4ZVjEXoTQ==
X-Received: by 2002:a17:902:d2ce:b0:1c3:ed30:ce0a with SMTP id n14-20020a170902d2ce00b001c3ed30ce0amr12440634plc.19.1696176017434;
        Sun, 01 Oct 2023 09:00:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/23] Patch review
Date: Sun,  1 Oct 2023 05:59:47 -1000
Message-Id: <cover.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188489

Please review this set of changes for mickledore and have comments back by
end of day Tuesday, October 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5970

The following changes since commit 75f8485d7862b08e2f96f919e992d203df6c8d9c:

  cml1: Fix KCONFIG_CONFIG_COMMAND not conveyed fully in do_menuconfig (2023-09-26 04:16:48 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alberto Planas (1):
  bitbake.conf: add bunzip2 in HOSTTOOLS

Alexander Kanavin (1):
  systemd-bootchart: musl fixes have been rejected upstream

Bruce Ashfield (6):
  linux-yocto/5.15: update to v5.15.125
  linux-yocto/5.15: update to v5.15.126
  linux-yocto/5.15: update to v5.15.127
  linux-yocto/5.15: update to v5.15.128
  linux-yocto/5.15: update to v5.15.129
  linux-yocto/5.15: update to v5.15.133

Chen Qi (1):
  oe-depends-dot: improve '-w' behavior

Colin McAllister (1):
  libwebp: Fix CVE-2023-5129

Dmitry Baryshkov (3):
  linux-firmware: upgrade 20230625 -> 20230804
  linux-firmware: package audio topology for Lenovo X13s
  linux-firmware: package Dragonboard 845c sensors DSP firmware

Joe Slater (1):
  file: fix call to localtime_r()

Joshua Watt (1):
  buildtools-tarball: Add libacl

Julien Stephan (1):
  patch.py: use --absolute-git-dir instead of --show-toplevel to
    retrieve gitdir

Khem Raj (1):
  core-image-ptest: Define a fallback for SUMMARY field

Richard Purdie (1):
  README: Update to point to new contributor guide

Ross Burton (2):
  inetutils: don't guess target paths
  inetutils: remove obsolete cruft from do_configure

Ryan Eatmon (1):
  kernel.bbclass: Add force flag to rm calls

Tom Hochstein (1):
  linux-firmware: add firmware files for NXP BT chipsets

Yash Shinde (1):
  glibc: fix CVE-2023-4806

 README.OE-Core.md                             |  10 +-
 meta/classes-recipe/kernel.bbclass            |   4 +-
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oe/patch.py                          |   5 +-
 .../inetutils-1.9-PATH_PROCNET_DEV.patch      |  37 --
 .../inetutils/inetutils_2.4.bb                |  25 +-
 .../glibc/glibc/0024-CVE-2023-4806.patch      | 342 ++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
 meta/recipes-core/images/core-image-ptest.bb  |   1 +
 meta/recipes-core/meta/buildtools-tarball.bb  |   1 +
 meta/recipes-devtools/file/file_5.45.bb       |   4 +-
 .../recipes-devtools/file/files/print_c.patch |  27 ++
 ...is-glibc-specific-use-raw-signature-.patch |   2 +-
 .../0002-musl-does-not-provide-printf-h.patch |   2 +-
 ...s-not-provide-canonicalize_file_name.patch |   2 +-
 ...20230625.bb => linux-firmware_20230804.bb} |  65 +++-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../webp/files/CVE-2023-5129.patch            | 364 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.3.1.bb |   4 +-
 scripts/oe-depends-dot                        |  13 +-
 22 files changed, 866 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch
 create mode 100644 meta/recipes-devtools/file/files/print_c.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (94%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch

-- 
2.34.1


