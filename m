Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E858C2FC04
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 05:04:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.180177.1692248663344997155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 22:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=spePTK1N;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe8a1591c7so58518835e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692248661; x=1692853461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuINJpA6Y/Vqk/O76GF2CPJm9AFAQD7/6Agt80E4zMQ=;
        b=spePTK1Ngue796egcPwnnDvr4G9fybUk1P8pnaVZYdby+TTf49MwZCEC1J2ONb7rOK
         9FXf7kdC2WBr9L7deotCw1+09At6IXjKOZmy1M62H9PUwYK3Q8wdnkjBJSpcLEyl07jm
         Oyxh9WxZ+/y7HQ2Gy70RC17VvzpOb8UgdQ2K0SKh5G0CQF02E8j90DlQyCrlatk11//p
         JfbZ5RXheyFPzqGQ6zmTaMdwb5ZYScmSvCUv+QUEcWZja0SAU2z+IzaexhZ7ue7RJGgA
         PA4+zQbVuZw4ka7BCV9NucpZ6POVjE8cPTTCnbZgWNTpdxVV7eTr7EI/jPrNZXFowvJ/
         j5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692248661; x=1692853461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuINJpA6Y/Vqk/O76GF2CPJm9AFAQD7/6Agt80E4zMQ=;
        b=Bw20APxILy8GADStq3jgKUO+ccnFDRBOkq6x6+ZilpkK9vIoMRZ5MZdl+5bWh5/JZQ
         XQha+H6ny9UieerxVn02/IGqV53bA3tHMfZ/GMGBz2hwfq4dOQsrdkj8kz3v+s0smSde
         Uy2QMBCeFAef9NLRG4tRoWpZ2YlQoHuWsX/NG90P6ZTPW+GOdRkVt40SZ/mJAiFnKl35
         LHOGUMadnJOk4o0wWUuUoqHDKFVT0Nz6O7XnhIFVgCNQBMZovQBqCdSWO9zc+I4SQo7N
         yyRajmwcghqnKdCl0013ppO2T/iNrqP6FaiEtSJtKn4f3NftjtBy2ku43tBc5VbkhrOO
         r44w==
X-Gm-Message-State: AOJu0YwWwIHx6/dunb+43IheSzvEkkK7mypYXO3GM/hMi4Ohhgz/aRnp
	QmVKltX6H3kRRjqSusF/+w84DLTFYSY=
X-Google-Smtp-Source: AGHT+IEU2mFXaMwV3c8M/Pfi6t99AZAbqfjOGX/HaVjECfX9yY9+ZhYemW9HGzG0HF8FUO/2VqeGRg==
X-Received: by 2002:a7b:cb91:0:b0:3fe:22a9:910 with SMTP id m17-20020a7bcb91000000b003fe22a90910mr3002629wmi.14.1692248660608;
        Wed, 16 Aug 2023 22:04:20 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:67b0:818b:2f62:9f02])
        by smtp.gmail.com with ESMTPSA id s17-20020a7bc391000000b003fd2e89620asm1503040wmj.40.2023.08.16.22.04.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 22:04:19 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V6 0/4] Introduction of cargo-c class and recipe
Date: Thu, 17 Aug 2023 07:04:12 +0200
Message-Id: <cover.1692248342.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 05:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186282

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
 meta/conf/distro/include/maintainers.inc      |    1 +
 meta/lib/oeqa/runtime/cases/rust.py           |   18 +-
 meta/recipes-devtools/rust/cargo-c-crates.inc |  453 ++++
 .../rust/cargo-c-native_0.9.18.bb             |   23 +
 .../cargo-c/0001-Add-Cargo.lock-file.patch    | 2180 +++++++++++++++++
 9 files changed, 2824 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
 create mode 100644 meta/classes-recipe/cargo_c.bbclass
 create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc
 create mode 100644 meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
 create mode 100644 meta/recipes-devtools/rust/cargo-c/0001-Add-Cargo.lock-file.patch

-- 
2.34.1


