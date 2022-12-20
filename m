Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8384C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.57301.1671559619464030938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WGheXFMi;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso1176334wmb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z2fH24JfjJb/bBLxehZh2UDhNR/7Qu5R2NepyaCvus=;
        b=WGheXFMiWoK2+WZpqB8bSKdKgTEqt7+2BiMeZ3cl25M53qG35zCoEsSZJ9GMy0sHbh
         SUuKwmLAky9vqLYc7u6cIWaOdJVbzboeai3C+s5WIiFpjjCqi8WUXce52Bx+6cDZbQC3
         n0uV715DrVHqSIsHbmdvLlaqCBUpc1dj4ge2/Zl+H/HLO6FN6t8pLjZtD3FLCZ0YF8iC
         ZHq8A5ksTDf7+xz6qbp1ffr2si7Dy5kqoVKJuQrrtnlQt4fvL01xF8vealguivWRBha8
         20RKQw3ICdd5pB0jcgN/3GgMtRPHNTuWNolv6nZ44Ld1pROf9g4LAR7vHjpk5El04v+I
         ScAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Z2fH24JfjJb/bBLxehZh2UDhNR/7Qu5R2NepyaCvus=;
        b=8O8p4yW6RHiLU56Wg9JOqJzM/p3ijWfX6jvbxCTCNsJrlrnk6SLfebQv11WE2bhwZH
         oKDV/Kz2OWkgR1FL/qCbylWkPRTwswAQKaHbfJfkTsnZ33kJfYw0AHYdIn+JtmBfgA6x
         A9TrFGXc2P8nyYH9j3olUlzX0Uzenm4lqPWtE0SC9pxY+qALzH975c5QUaIVpMfGDveW
         A8uKcBuuC1vxPzuAezdLR/eQLT2IPE+6ixBd+G9ozDRd9qAozT0FiM2wSuIDMq7+rDVp
         NrVzHQ0Ej0tm30qmqanLQNzB5f9eyH0/VqQw3Iz80YIVXSILVi8r0XLkF+0L3Lu7Wffu
         a7Fw==
X-Gm-Message-State: ANoB5plm4OokpmpTADQRP+sw0hZxxDkdYyqXC3/m8cKvbNm2Sagim3TF
	kBi82eiafY9tmLR8aQCc/4nbVs6RKgg=
X-Google-Smtp-Source: AA0mqf4mabjuTYojeDm7QI5FOc4xSppX9GQC1pPivxE4kKcPTdcBu3jrUYzi3UNYVBA9UjAYSBb2kg==
X-Received: by 2002:a05:600c:1e18:b0:3d2:26e1:bd45 with SMTP id ay24-20020a05600c1e1800b003d226e1bd45mr35172393wmb.29.1671559617615;
        Tue, 20 Dec 2022 10:06:57 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:06:56 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 00/11] Add rust runtime tests
Date: Tue, 20 Dec 2022 18:06:01 +0000
Message-Id: <20221220180612.24555-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174860


This series adds runtime tests for rust and cargo, merges (most of) the
include files into the base recipes and fixes target cargo builds.

Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
of packagegroup-core-sdk.


Alex Kiernan (11):
  oeqa/runtime/rust: Add basic compile/run test
  libstd-rs: Merge .inc into .bb
  libstd-rs: Move source directory to library/test
  rust-llvm: Merge .inc into .bb
  rust-llvm: Update LLVM_VERSION to match embedded version
  packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
  packagegroup-core-sdk: Add SDK toolchain language selection support
  oeqa/runtime/rust: Add cargo test
  cargo: Merge .inc into .bb
  rust: Merge .inc into .bb
  cargo: Extend DEBUG_PREFIX_MAP to cover vendor

 meta/lib/oeqa/files/test.rs                   |   2 +
 meta/lib/oeqa/runtime/cases/rust.py           |  41 ++++
 .../packagegroups/packagegroup-core-sdk.bb    |  10 +-
 .../packagegroup-rust-sdk-target.bb           |  14 ++
 meta/recipes-devtools/cargo/cargo.inc         |  69 ------
 meta/recipes-devtools/cargo/cargo_1.66.0.bb   |  73 +++++-
 meta/recipes-devtools/rust/libstd-rs.inc      |  40 ----
 .../recipes-devtools/rust/libstd-rs_1.66.0.bb |  46 +++-
 meta/recipes-devtools/rust/rust-llvm.inc      |  78 -------
 .../recipes-devtools/rust/rust-llvm_1.66.0.bb |  82 ++++++-
 meta/recipes-devtools/rust/rust-target.inc    |  10 -
 meta/recipes-devtools/rust/rust.inc           | 219 ------------------
 meta/recipes-devtools/rust/rust_1.66.0.bb     | 215 ++++++++++++++++-
 13 files changed, 474 insertions(+), 425 deletions(-)
 create mode 100644 meta/lib/oeqa/files/test.rs
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
 delete mode 100644 meta/recipes-devtools/cargo/cargo.inc
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-target.inc
 delete mode 100644 meta/recipes-devtools/rust/rust.inc

-- 
2.39.0


