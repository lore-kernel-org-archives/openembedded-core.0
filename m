Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B30CC001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 08:24:15 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.82037.1691915047929733849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 01:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=p3IHLwix;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso2996597f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691915046; x=1692519846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KaE6jAI7BEvGp1aVt1QI5rx2mwCCZh62umNh7R3OEK8=;
        b=p3IHLwixe0oaTfSl/TF6/ZF5GDcdLXsErxIij59zzyIrWVQoU6kaVjIG8c3yq6eiTJ
         pI9qWTBTm+YKbzhJ0syMcRDwzelekdEvY+heQfeZraOZhwUm1rcbnxJjM9e9LkAa0s4K
         1yjKdUUqBOVVEunXl3QYBvCJyEUfe9cN2v2oMIPGG3tYqoCA1aPKHhZ1h3H/WfVVK02h
         pO75i4Mla6D2qgO0PdJ4aghkYV/gTAfoa8oz7MgIuZ3m5nARy6E3IKiAlfcFuhdf8h9F
         IfvCFbrrE2o5siPwbfGqpuDBcsUzHUxhZ72ZZHTGWK07rylBJb4TS9kDxF8k0DgeU++w
         igEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691915046; x=1692519846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KaE6jAI7BEvGp1aVt1QI5rx2mwCCZh62umNh7R3OEK8=;
        b=gXMosT+5Y8dZeQrykkobjgo3fLW7iuFH7JKYL2GtwP6yiR7ldAwDzOb6a+sK9CFKOo
         GajmAd2iGO3CooOV8ohlbX18TdyQ2jdYYrBplNjt/LVB/90ffjip55gi6udYeGfQ9ckk
         Wd4pCneatU7bhBqjDnzbR2OEwYw0goAotjLO0vpjk2cAUWLRzA4D7zbUxYZzVx8lYdrh
         +xKShxkBUwD5LBmvP+QLVUAexF4yRvcHhW3gN1V+q0mC6dAgCO37UoDHhXjAgc0KDtf7
         y+25QE1gWtVO7S4QevB+kBUEWa10td03ejElgn3/GBCtOmz/rHIsOx4vopmGNMU7dfDH
         BWNg==
X-Gm-Message-State: AOJu0YzSz4O1OKPF9IkuqfFxJVCInbFsrPCEqaZ8CMdKolkkqS8Yjz0O
	E+Gb3hyqN99dbL3Spof3xWWHLhqBpHw=
X-Google-Smtp-Source: AGHT+IFrAaJgFzP+rR37Zhe/8eCmAzCVBr6/+QNfs0LUvzSAsZECtPF/eGXcijrwgBS34DDlsg/MZA==
X-Received: by 2002:adf:efca:0:b0:314:34dd:aaec with SMTP id i10-20020adfefca000000b0031434ddaaecmr4873205wrp.8.1691915045481;
        Sun, 13 Aug 2023 01:24:05 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:e135:6fa3:a98f:aed0])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d480b000000b00318147fd2d3sm10601450wrq.41.2023.08.13.01.24.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 01:24:04 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCHV2 0/4] Introduction of cargo-c class and recipe
Date: Sun, 13 Aug 2023 10:23:53 +0200
Message-Id: <cover.1691914589.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 08:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185863

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This is an RFC for introducing a new class and recipes that
help building C-ABI compatible header and library around
rust code.

The third patch add examples and test to demonstrate
the usage and the good working of this use case.

Test have been passed with the following in local.conf:

CORE_IMAGE_EXTRA_INSTALL:append = " openssh-sshd openssh-scp cargo rust rust-c-lib-example-bin"
IMAGE_CLASSES += "testimage"
TEST_SUITES = "ping ssh rust"
# To use slirp option in testimage.bbclass
TEST_RUNQEMUPARAMS = "slirp"
TEST_SERVER_IP = "127.0.0.1"
QEMU_USE_SLIRP = "1"

The following changes since commit 05095c116602d1a8c388cc02afffcc36230138f7:

  qemuboot: Update hardcoded path to match new layout (2023-08-11 13:21:31 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-c-introduction

Frederic Martinsons (4):
  rust: add cargo-c recipe
  classes-recipe: add cargo_c.bbclass
  rust: provide examples for C library generation in rust
  oeqa/runtime/rust: correct rust test

 .../rust/rust-c-lib-example-bin_git.bb        |   16 +
 .../rust/rust-c-lib-example-crates.inc        |   79 +
 .../rust/rust-c-lib-example_git.bb            |   15 +
 meta/classes-recipe/cargo_c.bbclass           |   41 +
 meta/conf/distro/include/maintainers.inc      |    2 +
 meta/lib/oeqa/runtime/cases/rust.py           |   16 +-
 meta/recipes-devtools/rust/cargo-c-crates.inc |  453 ++++
 meta/recipes-devtools/rust/cargo-c_0.9.18.bb  |   22 +
 .../rust/files/0001-Add-Cargo.lock-file.patch | 2180 +++++++++++++++++
 9 files changed, 2822 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example-crates.inc
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
 create mode 100644 meta/classes-recipe/cargo_c.bbclass
 create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc
 create mode 100644 meta/recipes-devtools/rust/cargo-c_0.9.18.bb
 create mode 100644 meta/recipes-devtools/rust/files/0001-Add-Cargo.lock-file.patch

-- 
2.34.1


