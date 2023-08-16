Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26903C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 05:42:17 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.154702.1692164528432957948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 22:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=p8iyL1Ky;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso92355621fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 22:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692164526; x=1692769326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZWOmBzdMDbryHRxsNJwDFBBj4YF4PbR7CJ4z7QMMJk=;
        b=p8iyL1KyLNbt90r1ZLzmXFLWidC5ptnvm/qrsbaUMqBzIbTep1qqocnegCTRmGX8cn
         tGdldDkKse59w71WL4ONtGycoU61aR11o9hnMiyBynY4t/PombClMWNLm6uxchcGD12s
         0yYx7gsRnsLB/ji65RPTr8KMacw8/byQTjOBt7tB9ZVpmVqlQzAQWmuL9A8/Xh3YnFaI
         X9+OnvAG9T4gnH38P5eYalzNC7biA1rnJk32yUbvDj0sJl7t2Mdw0/x3KB8auJGXQ3eC
         sfAGOTTDbcyFFicPQ2N2cAJVORIj0eGLTy7rfo0DU8QrLkTaM3fcJh34aAOWFCTf+6Xr
         aRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164526; x=1692769326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZWOmBzdMDbryHRxsNJwDFBBj4YF4PbR7CJ4z7QMMJk=;
        b=hKB86eGFBDvWJT5bBbP2lfYhXN7v3cta84qPMSLb9qMqpVDtL0pdgJ3kFje59hVJsC
         JcTPL/7cnUaIaDZQ5tYxJ0xDMRaY59PvihjAPc/tYhxARqbceR+qhcpQh2cQqvqxV0X4
         1bZqv7I/SIb/CAsXG4GCwYWnrAkQDyd1+Eofor/UUf+mq2mKWNx4hyzUlJkdN2IN5QfO
         nuXQND/CCeiXnPkmO9Jbm5kZKa4IFCP3qOpDehLFdGLjx4BkCfX1S7y8hZCzNBF/QAfq
         pwfLhWyVtLP7Tby4E+pVhN95PQq5CvnayraussPWFj08DpOchmlxUIOe+3W7Cp4EvLR+
         H6UA==
X-Gm-Message-State: AOJu0Yx4D9uurpqlPB10sagA/++j3AbIBJ/XZnv3/sag1q/gXasaGG2R
	xLkIxXxmUa0or1G3NUbZQXir9LUBnoA=
X-Google-Smtp-Source: AGHT+IFVJeb1gseeXrdtvpYljCuTuhG8YLEPDw1C6qR8CwNFdfhLi/F+lvMnwMRu9CAd5t0EnsxJCA==
X-Received: by 2002:a2e:9447:0:b0:2b6:da1e:d063 with SMTP id o7-20020a2e9447000000b002b6da1ed063mr598561ljh.45.1692164526015;
        Tue, 15 Aug 2023 22:42:06 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:bd52:73a6:cb33:609])
        by smtp.gmail.com with ESMTPSA id h18-20020a1ccc12000000b003fbd9e390e1sm23053371wmb.47.2023.08.15.22.42.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 22:42:05 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V4 0/4] Introduction of cargo-c class and recipe
Date: Wed, 16 Aug 2023 07:41:58 +0200
Message-Id: <cover.1692164369.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186109

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


