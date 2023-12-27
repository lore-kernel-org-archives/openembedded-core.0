Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDA8C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:40:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.107814.1703702430169010977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zn3sDITJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d5a41143fso14690155e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702428; x=1704307228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j2C1VZf4K08HmT6YQPYg4MrROA4WaJoC0rwYwHkdtPk=;
        b=Zn3sDITJd4U/rredcuytDETGZRYkzTymYdgpgd7FD4GrQQymZT7FUNbMEQazT31CQs
         9QPVv27YKPBSs6FiymUgiOLZDGkX1FEWOSRSbwgQcxfBk64knI1KJG8Efo7PpNhlspgI
         u3SYkxqiHsKI580bSDL7h+jUBoDBW7LncdJYeAGXXl7Btx08WvoA485z6C6xBHgUBQg+
         3WzyzhrhIyT7apXt/bbFaBMw1bj7lRKXmmhYnFBe2xBlfouFX2LxrTWBsTXaI/Z2kEhg
         J6IrVVSO0yiT17R9o49kNSUYKslN/CAJ7w//MBiSKvUsfIpZyQoVDvslr+jU3pCUa8lQ
         dtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702428; x=1704307228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2C1VZf4K08HmT6YQPYg4MrROA4WaJoC0rwYwHkdtPk=;
        b=gRWgei4rfRd5yU36dBMR5QY1QdRm/SOqvcltnTK6bEOsHMR3oXEAQY2s6yAbtSppZg
         8RpsoUmqYxFScdH5K6J/ayf1gARxsokTu3YSGkiyv423nfmRbXRP93CVteH3F82EvOrh
         O0toBDiWhX941M9i3og63Xg1p9RwuvxgJHbG0d+CxkLjcQHyIQY1vEfBVRGf5dMJyBLx
         VxV8zlX9lz1PVAw5kOSoAsJNd3b61JZrYa+VrXfLy5LSD18F01uzMOpKTi0EJi/6nj1n
         zFW0TM5k8UrJuCtdKvuRkwDDlfrEOjHku8BRiCQ86BtlZxedNxRQtxEo/CoNpe84NC/o
         QdqQ==
X-Gm-Message-State: AOJu0Yy6NNblW+7pgf3hVzPbL7IF+lK1d/XVCvfDrZ8tEppj1i+3Q2Nx
	vkyg6KkxEyree1iln0SG6IfJVZEedew=
X-Google-Smtp-Source: AGHT+IGGJb9DJGYSg1xsfLn7c99Vbqd/4IoaOtbJ3fPd+1GiONPbmOZkAe5fFjit4XHMFN9ZQB/SqA==
X-Received: by 2002:a05:600c:1912:b0:40d:5f62:5cc5 with SMTP id j18-20020a05600c191200b0040d5f625cc5mr674467wmq.66.1703702427549;
        Wed, 27 Dec 2023 10:40:27 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c4e8b00b0040d5118e42esm15695700wmq.22.2023.12.27.10.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 10:40:27 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 00/10] Stepwise rust upgrade 1.71.1 -> 1.74.1
Date: Wed, 27 Dec 2023 18:40:14 +0000
Message-Id: <20231227184024.4225-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192956

This is the 1.74.1 rust series rebased to include a revert of
https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d1d08a8ec
which I'm pretty sure is what's causing our filename churn. I've checked
1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
which had the issue) and in both cases we're not generating the dirname
based prefix - hopefully that means that the interim commits are fine
too, if not we can do the step back through the commits to find the next
issue.

I've skipped the zvariant tests as upgrading it isn't useful (since it
no longer includes git crate dependency) and spurious oe-selftest
failures aren't helpful. The right fix here is to include something
synthetic which tests git crates, but there appear to be other issues
that exposes in the infrastructure here.

Changes in v2:
- Skip zvariant based test rather than deleting it.

Alex Kiernan (10):
  devtool: selftest: Fix test_devtool_modify_git_crates_subpath
    inequality
  devtool: selftest: Fix test_devtool_modify_git_crates_subpath bbappend
    check
  devtool: selftest: Skip test_devtool_modify_git_crates_subpath
  rust: Upgrade 1.71.1 -> 1.72.0
  rust: Upgrade 1.72.0 -> 1.72.1
  rust: Upgrade 1.72.1 -> 1.73.0
  rust: Upgrade 1.73.0 -> 1.74.0
  rust: Upgrade 1.74.0 -> 1.74.1
  cargo-update-recipe-crates: Start search in CARGO_LOCK_PATH
  rust: Move RUST_DIST_SERVER to rust-config.inc

 .../cargo-update-recipe-crates.bbclass        |   4 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   6 +-
 .../rust/{cargo_1.71.1.bb => cargo_1.74.1.bb} |   0
 ...-Do-not-use-LFS64-on-linux-with-musl.patch | 164 --------------
 ...0001-Don-t-use-LFS64-symbols-on-musl.patch | 163 ++++++++++++++
 ...e-absolute-paths-to-OUT_DIR-as-relat.patch |  67 ++++++
 ...Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch | 122 +++++++++++
 ...efine-SOCK_SEQPACKET-in-common-place.patch | 114 ----------
 ...ine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch |  41 ++++
 ...GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch | 205 ++++++++++++++++++
 ...-musl-Define-O_LARGEFILE-for-riscv32.patch |  32 +++
 ...efine-SOCK_SEQPACKET-in-common-place.patch | 115 ++++++++++
 .../rust/files/getrandom-open64.patch         |  50 -----
 .../rust/files/hardcodepaths.patch            |  14 +-
 .../rust/files/zlib-off64_t.patch             |  17 +-
 ...ibstd-rs_1.71.1.bb => libstd-rs_1.74.1.bb} |   0
 meta/recipes-devtools/rust/rust-config.inc    |   1 +
 ....71.1.bb => rust-cross-canadian_1.74.1.bb} |   0
 ...ust-llvm_1.71.1.bb => rust-llvm_1.74.1.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  |  66 +++---
 meta/recipes-devtools/rust/rust-source.inc    |  14 +-
 .../rust/{rust_1.71.1.bb => rust_1.74.1.bb}   |  12 +-
 23 files changed, 820 insertions(+), 389 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.71.1.bb => cargo_1.74.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch
 create mode 100644 meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-symbols-on-musl.patch
 create mode 100644 meta/recipes-devtools/rust/files/0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch
 create mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch
 create mode 100644 meta/recipes-devtools/rust/files/0002-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
 create mode 100644 meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
 create mode 100644 meta/recipes-devtools/rust/files/0004-musl-Define-O_LARGEFILE-for-riscv32.patch
 create mode 100644 meta/recipes-devtools/rust/files/0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch
 delete mode 100644 meta/recipes-devtools/rust/files/getrandom-open64.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.71.1.bb => libstd-rs_1.74.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/rust/rust-config.inc
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.1.bb => rust-cross-canadian_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.71.1.bb => rust-llvm_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.71.1.bb => rust_1.74.1.bb} (98%)

-- 
2.39.0


