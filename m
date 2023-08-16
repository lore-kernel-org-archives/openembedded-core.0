Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C00FC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 10:33:48 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.157544.1692182022908195526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 03:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PxOO6Vav;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3175f17a7baso5316155f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692182021; x=1692786821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwB1kL/+w1B6NYL8Pi/HQKy27PwkVe5qT9o30TuAC2U=;
        b=PxOO6VavwNwmNCvehieW2PZxsKsNiLJ8OUTVd+52eIkxLJ4EdRqPFv0xjRrttBsYu5
         jNQoXZusVJfjEF1GVNdeLs0iKYsMIY8VqTthXLn1nhZarFUH7hHOp6WMDufmjP6Sgj9A
         9dSMCbHWxznplV11WE/mak0aThMxUUGrPs6U0bLhJS/0CrYGc08Aq6Hy/IlvD4XZBWcG
         wYKR0/53zpPkGVAdVQW//wHduXEdX8Rk/jIpBORy39cMyzmsgQCjBr1ca7o32eungoFy
         B7bfU/nIVOwbmS8HpxuxZhIPLEIRoQEAiksiID/mWk74OyeF38gDsIsJL/TOGQEx1Dfw
         cz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182021; x=1692786821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwB1kL/+w1B6NYL8Pi/HQKy27PwkVe5qT9o30TuAC2U=;
        b=eEBK6WkZk5dA3Vl2UClCBg78awOOJFGUZpY/FG7YXBIkwi8/RSSONoF4gssrqea9HJ
         cUWqQSW8ljf+hdGSjONyxxj7P5XnYqGMM47aaLAhZLQSoKZVXqhqsHwVQ2/yNAIbkyq2
         ENvbA/chh2fTIakg6+XHr1wren8EenqKuqwvrktOK4zP9QCC07aRDj355iVKwxJtnzRf
         QhXKmAkCSM5lhCgpFoSEQn+SPg6zIdNEWRGyq35K1RSr0qeD2NMBfmb7Et7p7bA/4QbN
         rGEDRBuN5UXPV8u4ECoDNkjaomLF0lvwqKgp4AQDDA3GZcDgCWH+ugbOqil+lnX29xOM
         OSXQ==
X-Gm-Message-State: AOJu0Yz3QRSEUBX1Dbk0BXgocqgWm8z2GF+HxnhyRtfPh1lqAzYCoWlg
	ameIGpvDHDb8F3eM2iQFCWuSAWl7fl4=
X-Google-Smtp-Source: AGHT+IElzYEeeKzN70azXY1IShZo1E1cUJqyeKH1NBQxu5TS1omp7Kx3PFImcQ4+bXAdWWZXAYPj3g==
X-Received: by 2002:a5d:69d0:0:b0:314:311d:1b9 with SMTP id s16-20020a5d69d0000000b00314311d01b9mr1098696wrw.47.1692182020670;
        Wed, 16 Aug 2023 03:33:40 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:bd52:73a6:cb33:609])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b00317f70240afsm20889582wrz.27.2023.08.16.03.33.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 03:33:40 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V5 0/4] Introduction of cargo-c class and recipe
Date: Wed, 16 Aug 2023 12:33:29 +0200
Message-Id: <cover.1692181166.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 10:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186125

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
 .../cargo-c/0001-Add-Cargo.lock-file.patch    | 2180 +++++++++++++++++
 9 files changed, 2826 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
 create mode 100644 meta/classes-recipe/cargo_c.bbclass
 create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc
 create mode 100644 meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
 create mode 100644 meta/recipes-devtools/rust/cargo-c/0001-Add-Cargo.lock-file.patch

-- 
2.34.1


