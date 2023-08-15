Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373F0C04A6A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:36:03 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.137392.1692113755779537826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 08:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LyXTtowb;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-307d20548adso4947136f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692113754; x=1692718554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZWOmBzdMDbryHRxsNJwDFBBj4YF4PbR7CJ4z7QMMJk=;
        b=LyXTtowbtK528BCMXuGdVwCrJNZWVQMKem4OPQngOfCIWPZ+AVBby77OjLlsFl1XKT
         DvytLPDeJv46J+KQe3Gkb9KlXnwSBbByb6cDeRA55fJSunSerwaxNEjeOTgrkaeGOF8Z
         VtXUSurR4JZTgwWW2R7cl8d8qGDkBCyNLvcxtHpy7fVi58iNBI/IsuXDT3FWFWMiCPV5
         KHgbz2n7dwGiaconVg2rhpjc/dcvt//ZVT7jhxxAy3G24oys1ua49s2ManW2zIABSafs
         MJWMmzIXIGNMDrmJ6O0Hr29Cs0a9+VOx8cEeQuovckutRkoT4160i/kkZe9a1oroGesp
         +F9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692113754; x=1692718554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZWOmBzdMDbryHRxsNJwDFBBj4YF4PbR7CJ4z7QMMJk=;
        b=iOGwSb/94HixM4psQc0NvscIboKea9YvkJg7CSg4YeuRqdYGtSdH7UMWxaoIpsaA4K
         HQp0+Xi4606qj8hPkod/wECVYGdKp0VgpyzqzCgahBDPARV3EDe7oLN6ykxRGa51oYOJ
         YFFg22+JsgNUGByJ3ibhxaMGlyZ7VTBjVRrD8FwaSA4N8f3I1Vj0UT0PJQAV3ikR2yzg
         LcRC9LUF3KEVgvQhyW6PWyMG+0kPC/0EF2ihjy8X4hWy0P7vIozg+PdYbsJUjz0TmJI4
         dmIl5PXklJQWvfToNKF8dsd3Lwd6h4+UDNPfjZFaEQWrU2xwJHL2KFepY5yyGOM3U7BG
         e3hw==
X-Gm-Message-State: AOJu0YyFoZag2/JKfKZBAUy/y2/aV2i3DrQXvDVgwTwWqL+8d1YwuwrV
	e9iaeuNkz1YUqHtoDrk6VsCxGSQtwxg=
X-Google-Smtp-Source: AGHT+IHkM9xvfYJtZwB11obWiVqiN794kZH3Ot+pk3mprCYRWb4eKbH9Sy34pCsK0/ieSk+QvhaaLg==
X-Received: by 2002:adf:e706:0:b0:319:6d3c:c5e5 with SMTP id c6-20020adfe706000000b003196d3cc5e5mr6828825wrm.58.1692113753541;
        Tue, 15 Aug 2023 08:35:53 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:fa4d:a159:cb9e:8fc4])
        by smtp.gmail.com with ESMTPSA id f6-20020adffcc6000000b0031984b370f2sm3046241wrs.47.2023.08.15.08.35.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:35:53 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V3 0/4] Introduction of cargo-c class and recipe
Date: Tue, 15 Aug 2023 17:35:33 +0200
Message-Id: <cover.1692099121.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186072

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series introduces a cargo-c.bbclass and cargo-c-native package
that help building C-ABI compatible header and library around
rust code.

The third patch add examples and test to demonstrate
the usage and the good working of this use case.

The fourth patch correct previous rust test by requiring
scp package.

Tests have been passed with the following in local.conf:

CORE_IMAGE_EXTRA_INSTALL:append = " openssh-sshd openssh-scp cargo rust rust-c-lib-example-bin"
IMAGE_CLASSES += "testimage"
TEST_SUITES = "ping ssh rust"
# To use slirp option in testimage.bbclass
TEST_RUNQEMUPARAMS = "slirp"
TEST_SERVER_IP = "127.0.0.1"
QEMU_USE_SLIRP = "1"

and the following commands:

bitbake core-image-minimal -c testimage
and
bitbake core-image-sato -c testimage

The following changes since commit ed1789638d025447db8f28d71d119de85a696b09:

  qemu: Upgrade 8.0.3 -> 8.0.4 (2023-08-15 08:14:32 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-c-introduction

Frederic Martinsons (4):
  rust: add cargo-c native recipe
  classes-recipe: add cargo_c.bbclass
  rust: provide examples for C library generation in rust
  oeqa/runtime/rust: correct rust test

 .../rust/rust-c-lib-example-bin_git.bb        |   16 +
 .../rust/rust-c-lib-example-crates.inc        |   79 +
 .../rust/rust-c-lib-example_git.bb            |   15 +
 meta/classes-recipe/cargo_c.bbclass           |   41 +
 meta/conf/distro/include/maintainers.inc      |    3 +
 meta/lib/oeqa/runtime/cases/rust.py           |   18 +-
 meta/recipes-devtools/rust/cargo-c-crates.inc |  453 ++++
 .../rust/cargo-c-native_0.9.18.bb             |   23 +
 .../rust/files/0001-Add-Cargo.lock-file.patch | 2180 +++++++++++++++++
 9 files changed, 2826 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
 create mode 100644 meta/classes-recipe/cargo_c.bbclass
 create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc
 create mode 100644 meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
 create mode 100644 meta/recipes-devtools/rust/files/0001-Add-Cargo.lock-file.patch

-- 
2.34.1


