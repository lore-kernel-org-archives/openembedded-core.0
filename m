Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D129C10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.17929.1671627193831878430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OPPfb4MH;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so1362830wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A57yRQzEbDRysMX7JsaduI3kudY7ER/Crto3rkoqCvM=;
        b=OPPfb4MHu4pR76NSKfG6zfIiaJ5A3ZkBfRwRpNGrQDaBjb6NxJMhtYTqD3M8kVGqa0
         9oh42ZMRlbHKmUHfa3B7Eol56hYO8VWMxDXatxixsF1+rJDErtauoS2A/5FKPE79w2L3
         bxjYwtsNlh38xwJmZfI167CLRYeL2FdFkmat7mtxvK8qQbly+nDgZGmDDF3huBIL+fFu
         wCFl5qekZ4QBonvRxRKPo7DgMklrlnpGYo9TwFqonD7e9a13AWJZBkDkW+XSgdeA/tfQ
         5QCW1NGq9dzOpuctzuTnrZPiwOep6v/PpZCmN2nJnU2VsVLMq6gsG2fz2V7UO/eH8qmd
         VwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A57yRQzEbDRysMX7JsaduI3kudY7ER/Crto3rkoqCvM=;
        b=vjldJXMB6ArVzljOqpC9J378OnokN0fkanpm0/UwuHTSm9gOjPGCNF7aOhV8TTaTh1
         T9WW40+jP4qfnvl36BMXa/mmzQPm9rIIGxnrrxbt8bZ5dTgw5JFFvAv0LCM2DgE/WqsN
         RWeGAGCYwgX8gxe9bcBM246Ao/IVihrhB8UdUKJe1nnvvhn++MQB7nfnumn9HvmnFv2+
         L1JZWkuju0yvgkzPG4PM7XuSMOtsbVc4wNIz4X/n9F9zbPZD5i9rLpEiFgAiUKO2MnEt
         8pMZIL7beLc2wuEg+TwRaHuBljCODLtoCDn4sqVUoiSVsCPsIp69aPlMMObzi4Fy3A8x
         9nZw==
X-Gm-Message-State: AFqh2ko7mDsuewurwZAZ+gRZLhI/d5jpKxhrVm3vu/7rfoTAwghVM2S+
	BPz6iUvJPJlqdnhmP360LtLeWTWmS+k=
X-Google-Smtp-Source: AMrXdXuSUDC4nVw8vG6Ao1i4BMbBndXfisaNZG4k1Bxs4fBD+N8y1SoZxB8GS+Wu247DMeNNatqrzg==
X-Received: by 2002:a05:600c:4f83:b0:3d2:3f55:f73f with SMTP id n3-20020a05600c4f8300b003d23f55f73fmr1288682wmq.8.1671627192014;
        Wed, 21 Dec 2022 04:53:12 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:11 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 00/10] Add rust runtime tests
Date: Wed, 21 Dec 2022 12:52:55 +0000
Message-Id: <20221221125306.13779-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174906


This series adds runtime tests for rust and cargo, merges (most of) the
include files into the base recipes and fixes target cargo builds.

Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
of packagegroup-core-sdk.

Changes in v2:
- Drop rust.inc/rust.bb merge, not actually made use of in the change
  set
- Reorder so cargo test goes after build fixes

Alex Kiernan (10):
  oeqa/runtime/rust: Add basic compile/run test
  libstd-rs: Merge .inc into .bb
  libstd-rs: Move source directory to library/test
  rust-llvm: Merge .inc into .bb
  rust-llvm: Update LLVM_VERSION to match embedded version
  cargo: Merge .inc into .bb
  cargo: Extend DEBUG_PREFIX_MAP to cover vendor
  packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
  packagegroup-core-sdk: Add SDK toolchain language selection support
  oeqa/runtime/rust: Add cargo test

 meta/lib/oeqa/files/test.rs                   |  2 +
 meta/lib/oeqa/runtime/cases/rust.py           | 41 ++++++++++
 .../packagegroups/packagegroup-core-sdk.bb    | 10 ++-
 .../packagegroup-rust-sdk-target.bb           | 14 ++++
 meta/recipes-devtools/cargo/cargo.inc         | 69 ----------------
 meta/recipes-devtools/cargo/cargo_1.66.0.bb   | 73 ++++++++++++++++-
 meta/recipes-devtools/rust/libstd-rs.inc      | 40 ---------
 .../recipes-devtools/rust/libstd-rs_1.66.0.bb | 46 ++++++++++-
 meta/recipes-devtools/rust/rust-llvm.inc      | 78 ------------------
 .../recipes-devtools/rust/rust-llvm_1.66.0.bb | 82 ++++++++++++++++++-
 10 files changed, 260 insertions(+), 195 deletions(-)
 create mode 100644 meta/lib/oeqa/files/test.rs
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
 delete mode 100644 meta/recipes-devtools/cargo/cargo.inc
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc

-- 
2.39.0


