Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6E1C3DA7A
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:35 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.126055.1672005572286435701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=miR3f1gT;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id u19so23077409ejm.8
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO4zSE6iF3+fdYCuQY+uk3GOEogOGMVcNs1eXkboAVA=;
        b=miR3f1gTEb5KIrE4k0H3rpdToG3TkMSEz11MZTr9n5w3F43cv1qkf3oK/w4+fkkhS3
         d9B2ryMEDRqUjh2Fv/HrgizLxaxDc8ScRny7EMPCjLkHyO/oO6t7Pob42GrL2zevTcvx
         ApaNf2e+KxirfWVgE4MRh2ENmaC2clIsRxgvyZcLd5QXdirl+XLwX4drpGsa6OcDSMOH
         mOTexlC46lpVTpNrqoKXMnMVWPujSQ2HFKz9+FhCrE0CTki2cV42D3qRvju/S3+qMVuz
         fi06ZuPs/1PTj7uODZ1pDpcRx1mn1JDizHXgAgBFD7NRov3zgGl3sF7AaTdDbmf8rhws
         Dz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZO4zSE6iF3+fdYCuQY+uk3GOEogOGMVcNs1eXkboAVA=;
        b=uePJ1OIYbM7gtW7ace4dKxHJ1AZX9iaYaQrnEGH8P0eTyWAMIY+OPGrWsqNjulcQkt
         OaQ/5kF7/hx0s/yAkckLUqMYsAcDh4JbUAXfrcYJ0qTzR6M9JqEXTmlc/9Gh9pfiAnXS
         7TaS6t6+xQmRqtPcT5TmBjFsb3gHwTaM0UYDdANtXevDbhNld5Vq/dSiltQMsg2i2TBz
         Eug/FJwKWVUlFQ2G9bqXx8L+N/8NAAoFJCu2lGMVqRJgcfQeTQCXp4kw58y0wxHSvP8v
         tW7vN/XDaQCOLnQGxD99ymMNebTquyVc3gkdL7E5WBuXAHXlscl2ckK88ek4FfB8eIWJ
         3srQ==
X-Gm-Message-State: AFqh2kobEw8cJVPnMzHyHVn41PV9I74T2jayEp9Sw3AWxIkRwLw9eq23
	OXNmr8tSQmaG0djpiPCavhLQ456Ka7U=
X-Google-Smtp-Source: AMrXdXvHWKSm83Jd0a+sSC7QTyMMNxGV/NwG2xd9UxPEUjh8ITpUYfs+62HdPBpBoNBNY1u13CZBBg==
X-Received: by 2002:a17:906:2245:b0:844:436f:8c24 with SMTP id 5-20020a170906224500b00844436f8c24mr11967666ejr.10.1672005570291;
        Sun, 25 Dec 2022 13:59:30 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:29 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 00/11] Add rust runtime tests
Date: Sun, 25 Dec 2022 21:59:10 +0000
Message-Id: <20221225215921.12868-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174995


This series adds runtime tests for rust and cargo, merges (most of) the
include files into the base recipes and fixes target cargo builds.

Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
of packagegroup-core-sdk.

Changes in v4:
- Fixup `__stack_chk_fail_local` in musl-x86
- Add crossbeam atomics fixes for ppc/mips

Changes in v3:
- Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
  (which defaults to SDK_TOOLCHAIN_LANGS)

Changes in v2:
- Drop rust.inc/rust.bb merge, not actually made use of in the change
  set
- Reorder so cargo test goes after build fixes

Alex Kiernan (11):
  rust-llvm: Merge .inc into .bb
  rust-llvm: Update LLVM_VERSION to match embedded version
  packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
  packagegroup-core-sdk: Add SDK toolchain language selection support
  cargo: Merge .inc into .bb
  cargo: Extend DEBUG_PREFIX_MAP to cover vendor
  rust: Merge .inc into .bb
  rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
  cargo: Override crossbeam-utils with 0.8.14
  packagegroup-rust-sdk-target: Add cargo
  oeqa/runtime/rust: Add cargo test

 meta/lib/oeqa/runtime/cases/rust.py           |  17 ++
 .../packagegroups/packagegroup-core-sdk.bb    |  10 +-
 .../packagegroup-rust-sdk-target.bb           |  14 ++
 meta/recipes-devtools/cargo/cargo.inc         |  69 ------
 meta/recipes-devtools/cargo/cargo_1.66.0.bb   |  80 ++++++-
 meta/recipes-devtools/rust/rust-llvm.inc      |  78 ------
 .../recipes-devtools/rust/rust-llvm_1.66.0.bb |  82 ++++++-
 meta/recipes-devtools/rust/rust-source.inc    |   5 +
 meta/recipes-devtools/rust/rust-target.inc    |  10 -
 meta/recipes-devtools/rust/rust.inc           | 223 ------------------
 meta/recipes-devtools/rust/rust_1.66.0.bb     | 223 +++++++++++++++++-
 11 files changed, 420 insertions(+), 391 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
 delete mode 100644 meta/recipes-devtools/cargo/cargo.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-target.inc
 delete mode 100644 meta/recipes-devtools/rust/rust.inc

-- 
2.39.0


