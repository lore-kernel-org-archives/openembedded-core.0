Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544D6C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.124148.1703775580346765821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bGXDZ93N;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d5aef534eso20598835e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775578; x=1704380378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9oxVAAqFtMelsxKjK+xqE0HdVLK3neFPcBe/yKa/J4=;
        b=bGXDZ93NjCGwMa5OTNunJy7M9rz86QcU9HjuMeSfi+aKqWyr3FQaO35kjF3ohFljzE
         bCv9tzNT8AQFmXBWwNYAuL0eTXJb2eqSYqysbkJk/im+b3iRxR+OoL0/dUkgQlUFzI6v
         Axm8lRuQ6Z1Amr+qVt+WDaxQ9B6rec5J74TYXmqGYnlSChYTiO2zibTksVBxgX/2JY6W
         eXK5o052yxu9lAqEyaGIsF1SzeP+8MowWE0GywpUMplp3zm3b5QvbYs2myLp0EaC4jFg
         Tyl3dkxDm+tKVL8drtu1OZyQl+Ev9hNZ19QM8VetJBVMQYK8wEHKHDVHhUQcVPh3ZepL
         bJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775578; x=1704380378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9oxVAAqFtMelsxKjK+xqE0HdVLK3neFPcBe/yKa/J4=;
        b=cQPNHfMqHFqJfY0dxIqEy5pV3OjRVqV3jag/s0Sn8Jx2X0LsJxgy0b4JekGkCdDbFh
         OVD/3MD1U6SQlFQ5PW6AmX4Z3JxazxGQOPxxmI1XmZ9XyzoxVA7etWcLaxsBKY/7cKvD
         sLsGXa6hYD+bze+4mQRMsukBxswLmDIFWAAjNaiG573EpUd0+1GbrZfOnDNWqz4HKUXu
         +6RhOv+SxTAgbGCHMqG57E0Cxr2qR1oFpQdG3RexioOo64/9lutapYiY5q9grzwA5LqA
         wzyxQxjTJHzVnkaxZwQSGPHN8u7nI2AWxrmD1Oxdpkabb+PKvvifL9DKDd6ok99eIwaq
         YfVQ==
X-Gm-Message-State: AOJu0YwLU2gTqrBvpLektpYb5Q03zMFUV6zxR0Nxiirq/fkMlWmUfJFc
	qzXR1myL6pAwbk18UZrv0FF/GoGjdx0=
X-Google-Smtp-Source: AGHT+IHc3JH+aKWrRdrsuNDfNpXrP1WsuenDVRb8ypMgzS6KWLuy7PNK9y6KgLsdmesyFRDJu2Qw1A==
X-Received: by 2002:a05:600c:4f14:b0:40d:4c54:a405 with SMTP id l20-20020a05600c4f1400b0040d4c54a405mr4734812wmq.80.1703775577791;
        Thu, 28 Dec 2023 06:59:37 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040d6ffae526sm1461523wmq.39.2023.12.28.06.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:59:37 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 00/10] Stepwise rust upgrade 1.71.1 -> 1.74.1
Date: Thu, 28 Dec 2023 14:59:07 +0000
Message-Id: <20231228145917.18147-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192981

This is the 1.74.1 rust series rebased to include a revert of
https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d1d08a8ec
which I'm pretty sure is what's causing our filename churn. I've checked
1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
which had the issue) and in both cases we're not generating the dirname
based prefix - hopefully that means that the interim commits are fine
too, if not we can do the step back through the commits to find the next
issue.

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
 .../hello-rs/hello-rs_0.1.0.bb                |   19 +
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
 28 files changed, 856 insertions(+), 1985 deletions(-)
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


