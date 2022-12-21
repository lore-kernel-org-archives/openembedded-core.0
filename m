Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8895FC4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.30729.1671657433841671591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jMeugVsO;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id i7so16184276wrv.8
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXb46HEf994XMf0wJdctjkH5R8xrkv5Ai4txvj4FPmI=;
        b=jMeugVsOiVqeXNYeLsWAf8twAf9zyxpf09S81BUTMJx2y4cdsKsLvxVqB4Cz5FRRUd
         eLlv45fWjpkR1X7Wwx4ihonSCLw+/ARW6XuP+ymA8sKw0I8TtR1pqU95m/tbvehx5UKF
         35nX2byJDn/JIHlINqBFbP5IJGuzj9o6lZ1bVN2BmqZ2I6fpWUHCedSEDVDHeXBZsT+L
         ExV9QrYM0A7VGQc4/ZP2zARZQBGJvlcXzF/VQMVXpwlQbSkNCwrLY8C4BbFEhV44Tn1L
         XhEf7c8PgxXwEJyM+Y8tlGT9RBem1Eh+f4w3idNlYFxbpQEHRSHUv5BNUhgR3lxL51jY
         E0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXb46HEf994XMf0wJdctjkH5R8xrkv5Ai4txvj4FPmI=;
        b=mCe+3HQwbABtkiHll95sQUUVBwSWQECQDbA2pnf3q/OtqmCk9TAFCvgp0RWXjiflIY
         qI2RjzeOunzON6nqXLVdQW8x++krN/xHU3a/WtgwY2rktR+WtrP4Hhe0ZNLjch0uF79G
         4W+fcHFhmzobQndRHI4LOMgxaNjeJnmi5cjzR8ezmp+5twX8QBfeDDqTGpnNQ80nMwvn
         3Tx2czAHaN1Fga+whw1enS/wG9FJm5GYgYv7b3ALz7QHlXvWMDBWFlMY89hKoskVC963
         lBbdKfv9/i1zHNX/ia8fFeMmxhhRt5gQLtvdiFmVaOcaOxPcSfu+OOi2edfNSx5gND4C
         U8hg==
X-Gm-Message-State: AFqh2krZicA91k39+t7MpWRFKIkevC0iMxTDBI69NB21Li5bgqeMtQ69
	NxzYjkGy9Ucuvnr+ScjIsIMK+voXn38=
X-Google-Smtp-Source: AMrXdXvwlV3LGPGqYUOGmEesMXh+yZ5XzuQWjmEBV0v7IAKIF6tsqNVEaUHURWJ08mOJ+kdyimOvZA==
X-Received: by 2002:a5d:6548:0:b0:242:15d5:2c0b with SMTP id z8-20020a5d6548000000b0024215d52c0bmr2181668wrv.22.1671657431999;
        Wed, 21 Dec 2022 13:17:11 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:11 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 00/10] Add rust runtime tests
Date: Wed, 21 Dec 2022 21:16:56 +0000
Message-Id: <20221221211706.25347-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174940


This series adds runtime tests for rust and cargo, merges (most of) the
include files into the base recipes and fixes target cargo builds.

Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
of packagegroup-core-sdk.

Changes in v3:
- Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
  (which defaults to SDK_TOOLCHAIN_LANGS)

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


