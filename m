Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AD4C3DA7D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.182560.1672241022601839846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AB5PfVEk;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h16so15188409wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ukvBZ1c1ecfdU6GWpIrPv6y99Ir5cxG2yeMP1ggJZus=;
        b=AB5PfVEkk2MHfG/5j7zR9WITmE4eh6MOnBax9/tSi3QODTA95BxE7kyy1hhEbrE7eC
         NBlmHGTT1eCTsh5MxHAY6KNR3moj1QPO4R6Pr23RyUkvwb3JlbQ3Ii7Yam0wI0GZ0OcH
         weY1Ys8i8fQFG59W9d1/GIW3OWGjTEKKg7d9cTEw7R9IcbwbxaDFR1Kmlgz2aMQEsfkV
         GlqzyCtuhudFIwNcdokL5BuyOYg+tZ3FJQFl+XRh7fIuiCEeB4JjFZ6wj8CjNey8Kki4
         6nKtN/DHOq2UKwpdVDBKAJ87RBnW/Xgc6lg2TrcCH/lIP/nCJymnaryJ4+1q1TK9K1+j
         I7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukvBZ1c1ecfdU6GWpIrPv6y99Ir5cxG2yeMP1ggJZus=;
        b=bkCWSf3i8OvnUVzROcGdA+MQod5jWW38Z5WqDD7St8qIJRqkM2lo8ga0ZmpI/z/Tza
         Q8DPc5GtpIDpDJ8UZZfLSi7jMsqvd4XtpVS48o/HdJjKnyUZV2wGunA/r+BZmBzgEThl
         Qres8HQrlMSSIYgNopwzHj/6ePhfE65d3axgmtMKq2Mn9xjQZ76DDe4sNxtJR9sh5UGr
         27zOzG7ZsSgiRVaY+o+L2V0njxBArg3O22c0m/C1kTWqa21JLswjF7GOMCOkIPcI0ZMk
         nCAj0Bd5q768Ytn0OXw3MO7dynGfE6dswwYaTHFeEh6uRvyMaMHCHaQ5lmygcohtaYil
         rT0A==
X-Gm-Message-State: AFqh2kqk3HAPFm2TXXDkfWZTRjQAonp/AdTe+JH6HWIu2347jZCGQ2X4
	8hTSssJmMr1Yd3Z1XPxErdj8RDOuwpI=
X-Google-Smtp-Source: AMrXdXuz5Wp4yaOMeggLoYdEemMiC93idLoDtNVflsG2lZckpGfhR7bVNC9ayRgeJ92zEVZ7yNyo9w==
X-Received: by 2002:adf:eb43:0:b0:242:1809:7e12 with SMTP id u3-20020adfeb43000000b0024218097e12mr15162780wrn.70.1672241020497;
        Wed, 28 Dec 2022 07:23:40 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:39 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 00/12] Add rust runtime tests
Date: Wed, 28 Dec 2022 15:23:22 +0000
Message-Id: <20221228152334.25449-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175070


This series adds runtime tests for rust and cargo, merges (most of) the
include files into the base recipes and fixes target cargo builds.

Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
of packagegroup-core-sdk.

Changes in v5:
- Switch from cargo patching to bitbake patching (https://github.com/rust-lang/rust/issues/98185)

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

Alex Kiernan (12):
  rust-llvm: Merge .inc into .bb
  rust-llvm: Update LLVM_VERSION to match embedded version
  packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
  packagegroup-core-sdk: Add SDK toolchain language selection support
  rust: Merge .inc into .bb
  rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
  cargo: Merge .inc into .bb
  cargo: Extend DEBUG_PREFIX_MAP to cover vendor
  cargo: Include crossbeam-utils patch
  cargo: Drop exclude from world
  packagegroup-rust-sdk-target: Add cargo
  oeqa/runtime/rust: Add cargo test

 meta/lib/oeqa/runtime/cases/rust.py           |  17 ++
 .../packagegroups/packagegroup-core-sdk.bb    |  10 +-
 .../packagegroup-rust-sdk-target.bb           |  14 ++
 meta/recipes-devtools/cargo/cargo_1.66.0.bb   |   5 -
 .../{cargo/cargo.inc => rust/cargo_1.66.0.bb} |  13 +-
 .../{rust => files}/crossbeam_atomic.patch    |   0
 meta/recipes-devtools/rust/rust-llvm.inc      |  78 ------
 .../recipes-devtools/rust/rust-llvm_1.66.0.bb |  82 ++++++-
 meta/recipes-devtools/rust/rust-source.inc    |   5 +
 meta/recipes-devtools/rust/rust-target.inc    |  10 -
 meta/recipes-devtools/rust/rust.inc           | 223 ------------------
 meta/recipes-devtools/rust/rust_1.66.0.bb     | 223 +++++++++++++++++-
 12 files changed, 353 insertions(+), 327 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
 delete mode 100644 meta/recipes-devtools/cargo/cargo_1.66.0.bb
 rename meta/recipes-devtools/{cargo/cargo.inc => rust/cargo_1.66.0.bb} (88%)
 rename meta/recipes-devtools/rust/{rust => files}/crossbeam_atomic.patch (100%)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-target.inc
 delete mode 100644 meta/recipes-devtools/rust/rust.inc

-- 
2.39.0


