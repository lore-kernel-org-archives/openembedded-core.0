Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6577C46CD3
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 23:09:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.35970.1703459380114422298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Dec 2023 15:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CLA7PfBL;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33697e6fc4aso2131230f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 15:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703459378; x=1704064178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8OckJV4arT1tOKgU2dx46qzQCHwXauuLK6qaJRWhaB4=;
        b=CLA7PfBLRbokmI0krie0KlcKMSqjX+PwVKCfFijY64I0BuPIo10zPmgUx+UsfAiam8
         o44jSknF4IIssVwQ2daIKQZencu+mRgeEScs92OYEi6iknpLhbTwH5N2EN6OftMxM0jT
         qc8ycv+zIbKFf3NEUwWFCPL345yIRfiKU6hE6LAQNygGATAtIe+mCeyZBAu4athpXrmM
         awVROJ32F+eDkSmxlFBbfMoUoQ6Rrb2Du1hUQK5szDnhY/SM5SSGGn2CTL7hRIfKlf64
         /oi0IJA/zbBw7zhozkROufWJJTVgvZReGDDxcBA/rJsMub+Ntmn+FgEl9HfzLGdSgf57
         obpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703459378; x=1704064178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OckJV4arT1tOKgU2dx46qzQCHwXauuLK6qaJRWhaB4=;
        b=VS9LOjg1MTx605WjhaRSLofCaepVviukRzJcDuN2oUtrKBEcN9AUuRp/b302u2wO2g
         e/Merl08T8XBxPyUfcZ1Rd2vKBLy1aUigCaKCssMIND+lfmHVve6pSjh1SRb86dc8kjX
         4P50C7i+Pa3w/csVf0GPRJqTg88Cqe9F1P4x6DYsQvJaoCTyOmjinJKExebRWmfYhJ+3
         FkD7+zRDHjIsqL5MqI++rEoBYEbBn8go4lj8Q0bY+4BM6+UKQeRvHt6uZ33YWPz7m68t
         2J5fCiApV08TFG8oPA5mwDD/gH0ZkYMAUR/mnzj6cEBHk6Es3DhQm4640jBVQ6Cjq+DM
         Em7g==
X-Gm-Message-State: AOJu0YzxY6KFodOS+GKH4hrqMpQSRqLc33AAiCzLxa8Ay39rOUP/jwP5
	eyS1O3XrcJorhxp39Ky48m5slgr8p4E=
X-Google-Smtp-Source: AGHT+IFEUZsXYP7Qv8uBx+VXkRDihDE+dz75y90vzuuTbvdgK87V0LTTH2XSQG8zvEIiPKZgp6R5lg==
X-Received: by 2002:a5d:5005:0:b0:336:8940:c4e1 with SMTP id e5-20020a5d5005000000b003368940c4e1mr1867701wrt.30.1703459377492;
        Sun, 24 Dec 2023 15:09:37 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id b6-20020adfee86000000b00336344c3c3fsm9122309wro.90.2023.12.24.15.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 15:09:37 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 0/6] Stepwise rust upgrade 1.71.1 -> 1.74.1
Date: Sun, 24 Dec 2023 23:09:28 +0000
Message-Id: <20231224230934.831-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 23:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192895

This is the 1.74.1 rust series rebased to include a revert of
https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d1d08a8ec
which I'm pretty sure is what's causing our filename churn. I've checked
1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
which had the issue) and in both cases we're not generating the dirname
based prefix - hopefully that means that the interim commits are fine
too, if not we can do the step back through the commits to find the next
issue.

I've dropped the zvariant tests as upgrading it isn't useful (since it
no longer includes git crate dependency) and spurious oe-selftest
failures aren't helpful. I guess we need to include either something
synthetic which tests git crates, or pull in
https://github.com/jthornber/thin-provisioning-tools/ from
meta-openembedded which includes a live example (though who knows for
how long!)

Assuming this does actually fix the reproducibility issue, I'll look at
how we fix the issue properly, rather than just reverting the commit
which I think is our problem, but I'd like to try and get us back on the
rust release train if we can!


Alex Kiernan (6):
  meta-selftest: Drop zvariant recipe
  rust: Upgrade 1.71.1 -> 1.72.0
  rust: Upgrade 1.72.0 -> 1.72.1
  rust: Upgrade 1.72.1 -> 1.73.0
  rust: Upgrade 1.73.0 -> 1.74.0
  rust: Upgrade 1.74.0 -> 1.74.1

 .../zvariant/zvariant-crates.inc              |  258 ----
 .../zvariant/zvariant-git-crates.inc          |   14 -
 .../0001-Tweak-zvariant-crate-config.patch    | 1292 -----------------
 .../zvariant/zvariant_3.12.0.bb               |   37 -
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   93 --
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
 25 files changed, 802 insertions(+), 2075 deletions(-)
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


