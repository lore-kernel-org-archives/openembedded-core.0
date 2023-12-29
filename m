Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1969C46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.144928.1703850284317406129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=feA2Gl+3;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d5aa35b60so26903215e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850282; x=1704455082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNMt0wafo7tqibKwKU3zSK5Q/lmsxAz5rl5ecEhdWFQ=;
        b=feA2Gl+3bI3pP7eXT8APmJtrGX3w8103lDlsmA/1KpWn/KFNuMXYRdlTYvSE37uOkV
         vwvM/yhjcY9gdJ8A6EvILSVvD3RIMfULdyLCEvya2oQljU85BEoexcxBiKqHwQdsrCKi
         3QLvWxBBWC08vK8CZzkf1RMvw/5KIjjxN3h2f4cj6e602j1SMtdNcSz28jn30UicqQm5
         8qs+wJNzHePG+KLcZponFR6+BFCrhFLMqjtUSqKskeMM9YruT5gQ9QKYy8moChaxeOJM
         fZzfeRLntHYacdCEV3QmAX6YjT/k1dxplcnZ6In3skkaB3aICjgOWSc9WvK+kaQMsNR5
         vRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850282; x=1704455082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNMt0wafo7tqibKwKU3zSK5Q/lmsxAz5rl5ecEhdWFQ=;
        b=xSU99ehIfgyYdwL3+EL+KZxHtjgRFtb+7LpebiPkZYz80JbL/+dPRVSSz3FPeSL1x2
         AnnHnHigpRIszqN9shaPn81PUzs9w1r0DZwH61wH4k1PphRXO3IeUBBrvciZ5bpTZIxM
         UEB4hih0gbVhgLHXbIZNPwO5HLEa0GSmVw5/77JEfiEvWkjuU9AZRSlzmJNvuzTrsPF4
         xBgzzhZ2RFS53TXKeWBtUuxAk33YZ9UGE0C98W71J4Snp1zgcrRuUsnwwDIiyB0WJGNZ
         4YgjSLr+h7wp0/N2sgPCV3xIRfkHYyt8kfJ+1CMhSW9FKKzn8hL9ywlbfWykBSpfeVwA
         0cdA==
X-Gm-Message-State: AOJu0Yxa0LU7RFOHBsZLpvKtTtNIjvS23TFSjPnGAxIR0fFa5Zl+sCP6
	biTARIDMGiytdG6cuo3NaR/RvzYKn9s=
X-Google-Smtp-Source: AGHT+IGuPcmi4iMvjGPABlxOFQSckJWfjmkwHSksT5vxg7ZSRySQmkHHUZF5SjBnUBUiQyZ9HT4mbg==
X-Received: by 2002:a05:600c:3d16:b0:40d:5c9c:1628 with SMTP id bh22-20020a05600c3d1600b0040d5c9c1628mr1213268wmb.158.1703850281775;
        Fri, 29 Dec 2023 03:44:41 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:41 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 00/10] Stepwise rust upgrade 1.71.1 -> 1.74.1
Date: Fri, 29 Dec 2023 11:44:25 +0000
Message-Id: <20231229114435.27810-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193003

This is the 1.74.1 rust series rebased to include a revert of
https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d1d08a8ec
which I'm pretty sure is what's causing our filename churn. I've checked
1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
which had the issue) and in both cases we're not generating the dirname
based prefix - hopefully that means that the interim commits are fine
too, if not we can do the step back through the commits to find the next
issue.

Changes in v4:
- Mark hello-rs as EXCLUDE_FROM_WORLD as it's not reproducible

Changes in v3:
- Add hello-rs as a replacement for the tests which used zvariant

Changes in v2:
- Skip zvariant based test rather than deleting it.

Alex Kiernan (10):
  devtool: selftest: Fix test_devtool_modify_git_crates_subpath
    inequality
  devtool: selftest: Fix test_devtool_modify_git_crates_subpath bbappend
    check
  meta-selftest: hello-rs: Simple rust test recipe
  devtool: selftest: Swap to hello-rs for crates testing
  zvariant: Drop recipe
  rust: Upgrade 1.71.1 -> 1.72.0
  rust: Upgrade 1.72.0 -> 1.72.1
  rust: Upgrade 1.72.1 -> 1.73.0
  rust: Upgrade 1.73.0 -> 1.74.0
  rust: Upgrade 1.74.0 -> 1.74.1

 .../hello-rs/hello-rs-crates.inc              |    8 +
 .../hello-rs/0001-Greet-OE-Core.patch         |   24 +
 .../hello-rs/hello-rs_0.1.0.bb                |   22 +
 .../zvariant/zvariant-crates.inc              |  258 ----
 .../zvariant/zvariant-git-crates.inc          |   14 -
 .../0001-Tweak-zvariant-crate-config.patch    | 1292 -----------------
 .../zvariant/zvariant_3.12.0.bb               |   37 -
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |    6 +-
 .../rust/{cargo_1.71.1.bb => cargo_1.74.1.bb} |    0
 ...-Do-not-use-LFS64-on-linux-with-musl.patch |  164 ---
 ...0001-Don-t-use-LFS64-symbols-on-musl.patch |  163 +++
 ...e-absolute-paths-to-OUT_DIR-as-relat.patch |   67 +
 ...Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch |  122 ++
 ...efine-SOCK_SEQPACKET-in-common-place.patch |  114 --
 ...ine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch |   41 +
 ...GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch |  205 +++
 ...-musl-Define-O_LARGEFILE-for-riscv32.patch |   32 +
 ...efine-SOCK_SEQPACKET-in-common-place.patch |  115 ++
 .../rust/files/getrandom-open64.patch         |   50 -
 .../rust/files/hardcodepaths.patch            |   14 +-
 .../rust/files/zlib-off64_t.patch             |   17 +-
 ...ibstd-rs_1.71.1.bb => libstd-rs_1.74.1.bb} |    0
 ....71.1.bb => rust-cross-canadian_1.74.1.bb} |    0
 ...ust-llvm_1.71.1.bb => rust-llvm_1.74.1.bb} |    0
 meta/recipes-devtools/rust/rust-snapshot.inc  |   64 +-
 meta/recipes-devtools/rust/rust-source.inc    |   12 +-
 .../rust/{rust_1.71.1.bb => rust_1.74.1.bb}   |    1 +
 28 files changed, 859 insertions(+), 1985 deletions(-)
 create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
 create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
 create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
 delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
 delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
 delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
 delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
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
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.1.bb => rust-cross-canadian_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.71.1.bb => rust-llvm_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.71.1.bb => rust_1.74.1.bb} (99%)

-- 
2.39.0


