Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8033C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:42:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.107171.1703702513103697901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdKb21JH;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d5ab2f9f1so15752205e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702510; x=1704307310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4wf5HPgYsQGx5uqSinrEIiXGyIsUirDMUX+mpXhXZnw=;
        b=UdKb21JHs35Dk151kYTfFmqGBttdhGfRT6XK3vzDPryBoP0lStiyE6FXPvGvwU1vFu
         OddRF5OOj35RG82Yhp5JNSWBHwL6FspJNCMObLfNVcysmxCajQbXAo5p+HZ3Dzd12D0u
         B8q09aGBjGq2/rReqnKn7dAny2zkeB2qpm1msPD8tI1H3N1Vbfh1zcTBXjsoneGyUap9
         Jdmm2bbjqzDteU0yAK8xKFZX4ZDTQcN8W27yfhJ+CCV8UiGGMIl457JUg4oARcnaGR4A
         dMveLv7fz+MrHdMY329A1o32EkWjFk0f9xojunJdXRQM1EfkFox16mN6GM1yR5lYXtP6
         ZqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702510; x=1704307310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wf5HPgYsQGx5uqSinrEIiXGyIsUirDMUX+mpXhXZnw=;
        b=sn6hdl1V/IkJTNhEPFML2dNy6SVb6kqA1Qop6PBQnr9QUhTmx52jYKyqregfgX4QPC
         p/kGedBLU0JkGjffBbQWtz3KLxI7drSVfyfopeYEVCH559H8G2DKMFnAfCrE/C20v9TO
         AWbE61a+wJ+5GxdP1AHRJ2pVmsVrk8TMtTyN6Gm3K0mhPMRystEkMSkOPkxcx+BJ2hHS
         BuxoIxNTwoB2Kbv1KAIOIpBH5IAVC6za/e/bNnuVHjc+9EyQmpFCp1vC5Evscd4uZpI/
         FE5fi+8rXY34gbK1RKGygeMExDQ9Gk5tnkBXRbGaQH7LwTnePd/p/+j7W7UtnlqcLbO3
         JuOA==
X-Gm-Message-State: AOJu0YygY8pMJNycadzeKqv2Qcdt3IhAgjVP65vIgs1bfK3qed4ZlEhy
	pqR/hB8smIpWlQbhDLwub9qFagz/nfs=
X-Google-Smtp-Source: AGHT+IGfg4m31QeSrfkiRiy4VPOeOoe9AvZkR57TOd7DcF3HghZ00QExHhHrBOVwgG0MwkGU/p/F6g==
X-Received: by 2002:a05:600c:5409:b0:40d:60f6:909 with SMTP id he9-20020a05600c540900b0040d60f60909mr201849wmb.216.1703702510357;
        Wed, 27 Dec 2023 10:41:50 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm32680977wmb.7.2023.12.27.10.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 10:41:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 0/8] Stepwise rust upgrade 1.71.1 -> 1.74.1
Date: Wed, 27 Dec 2023 18:41:40 +0000
Message-Id: <20231227184148.4374-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192957

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

Alex Kiernan (8):
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
 ....71.1.bb => rust-cross-canadian_1.74.1.bb} |   0
 ...ust-llvm_1.71.1.bb => rust-llvm_1.74.1.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  |  64 +++---
 meta/recipes-devtools/rust/rust-source.inc    |  12 +-
 .../rust/{rust_1.71.1.bb => rust_1.74.1.bb}   |   1 +
 21 files changed, 806 insertions(+), 383 deletions(-)
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


