Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BB9C433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.2073.1633893012402506578
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aCmD0fzQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id u18so48709277wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcL6Uso5gblnTOlIKsgtVmkaNw0FV07LNb66fNZFFAk=;
        b=aCmD0fzQdF8zaYCkOsY7Ga9ZX/6w71Tu+l7vyBCvwFSg/fLY51SMi/+A9xdFXFs1jk
         PBCZsYQg9/iiNUq1zb5hOwd2QhuA+31Nf14L4u6+KjM0uNsPvs7ay6ggcK53bzo7YpZx
         q8+NY9BqgRSTCYR4O+QuzUJwkrlgmmZkEwpx1Nb8i5e+kzo0gLlAfSX4elomsqkG/9P9
         VjKNVC6nxagHqIMeyFYPM4EpuIVTzo2BF1BGqiCoG2HvF7wZxdfqFwYZlnsGF7A1InOq
         VOYDpqNVoPcgFZ8+kQVrY0q7LKg+z7OrDUKynPRYYUeka4ToJVu7i+JgHb5rPUX2EHxt
         8D8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcL6Uso5gblnTOlIKsgtVmkaNw0FV07LNb66fNZFFAk=;
        b=u2rmdD/dbIuNLLTaC0H1dNXsCQHYkdQE1+imxeaLn17/yCRKg2HNuymCnX4XWHm5u9
         w58a1BgTNr4H6UzdE2MaCOErEW+S8dKym3wgoe6JNH/CtX/Tr9b9WaaMTVqlRJW6e0Gv
         icgAavppr0+kL7Iz/grF8eBMqwvveIMZab4ti0maHk7BC/tkloHt/eB/xODwsKTPWExh
         xPFQg68reqMfrnSqYENtlT/4iW00vaA83pH1TFxChTc/5YU8LcUxkEhuspwNtvmuYj0o
         oHVCW9xtnV4TRdYgfyCAxL3as+AgNZ78GIcYndqTdAqsrgHbadr+VSOyK/pk8UvJY9Cx
         nxxA==
X-Gm-Message-State: AOAM532/KzbP+Krg/qfiYL96QuNfzI+KkDB2T+8tJ7DXsFdkqPlM96LB
	3XcwFjEkzw8B2txio+pkq+QJD+xSQwE=
X-Google-Smtp-Source: 
 ABdhPJyiwnjy3P35zRozXLEwAP+hTRAmjqio94/c2BslTW7bEAy9FslWcPueLW6622nuzPRTB1cbjw==
X-Received: by 2002:a1c:7fd0:: with SMTP id
 a199mr17097716wmd.96.1633893010813;
        Sun, 10 Oct 2021 12:10:10 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/13] rust: drop PV from include file names
Date: Sun, 10 Oct 2021 21:09:56 +0200
Message-Id: <20211010191008.4122049-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156794

This complicates (semi) automated upgrades, and isn't necessary
as we carry only a single version of the toolchain.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cargo/cargo-cross-canadian_1.54.0.bb       |  4 ++--
 meta/recipes-devtools/cargo/cargo_1.54.0.bb    |  4 ++--
 ...initions-for-riscv64-musl-libc-0.2.93.patch |  0
 ...l-mod.rs-add-riscv64-to-b64-set-libc-.patch |  0
 ...definitions-to-match-musl-libc-0.2.93.patch |  0
 ...s-for-modified-files-for-rust-1.54.0-.patch |  0
 meta/recipes-devtools/rust/libstd-rs_1.54.0.bb |  2 +-
 .../rust/rust-cross-canadian_1.54.0.bb         |  4 ++--
 .../recipes-devtools/rust/rust-cross_1.54.0.bb |  2 +-
 meta/recipes-devtools/rust/rust-llvm_1.54.0.bb |  2 +-
 .../rust/rust-snapshot-1.54.0.inc              | 18 ------------------
 meta/recipes-devtools/rust/rust-snapshot.inc   | 16 ++++++++++++++++
 .../rust/rust-source-1.54.0.inc                |  3 ---
 meta/recipes-devtools/rust/rust-source.inc     |  1 +
 .../rust/rust-tools-cross-canadian_1.54.0.bb   |  4 ++--
 meta/recipes-devtools/rust/rust_1.54.0.bb      |  4 ++--
 16 files changed, 30 insertions(+), 34 deletions(-)
 rename meta/recipes-devtools/rust/{libstd-rs-1.54.0 => libstd-rs}/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch (100%)
 rename meta/recipes-devtools/rust/{libstd-rs-1.54.0 => libstd-rs}/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch (100%)
 rename meta/recipes-devtools/rust/{libstd-rs-1.54.0 => libstd-rs}/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch (100%)
 rename meta/recipes-devtools/rust/{libstd-rs-1.54.0 => libstd-rs}/0008-Update-checksums-for-modified-files-for-rust-1.54.0-.patch (100%)
 delete mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.54.0.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-source-1.54.0.inc

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.54.0.bb b/meta/recipes-devtools/cargo/cargo-cross-canadian_1.54.0.bb
index dba400bcfb7..63fd69107be 100644
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.54.0.bb
+++ b/meta/recipes-devtools/cargo/cargo-cross-canadian_1.54.0.bb
@@ -1,5 +1,5 @@
-require recipes-devtools/rust/rust-source-${PV}.inc
-require recipes-devtools/rust/rust-snapshot-${PV}.inc
+require recipes-devtools/rust/rust-source.inc
+require recipes-devtools/rust/rust-snapshot.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/cargo-${PV}:"
 
diff --git a/meta/recipes-devtools/cargo/cargo_1.54.0.bb b/meta/recipes-devtools/cargo/cargo_1.54.0.bb
index 175f544d660..eee58fc2452 100644
--- a/meta/recipes-devtools/cargo/cargo_1.54.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.54.0.bb
@@ -1,4 +1,4 @@
-require recipes-devtools/rust/rust-source-${PV}.inc
-require recipes-devtools/rust/rust-snapshot-${PV}.inc
+require recipes-devtools/rust/rust-source.inc
+require recipes-devtools/rust/rust-snapshot.inc
 require cargo.inc
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rust/libstd-rs-1.54.0/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch b/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs-1.54.0/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
rename to meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
diff --git a/meta/recipes-devtools/rust/libstd-rs-1.54.0/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch b/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs-1.54.0/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
rename to meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
diff --git a/meta/recipes-devtools/rust/libstd-rs-1.54.0/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch b/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs-1.54.0/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
rename to meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
diff --git a/meta/recipes-devtools/rust/libstd-rs-1.54.0/0008-Update-checksums-for-modified-files-for-rust-1.54.0-.patch b/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modified-files-for-rust-1.54.0-.patch
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs-1.54.0/0008-Update-checksums-for-modified-files-for-rust-1.54.0-.patch
rename to meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modified-files-for-rust-1.54.0-.patch
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb
index 1239f6a176f..cc30158d222 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb
@@ -1,4 +1,4 @@
-require rust-source-${PV}.inc
+require rust-source.inc
 require libstd-rs.inc
 
 SRC_URI += " \
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.54.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.54.0.bb
index a5d02eb8d77..766912c019b 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian_1.54.0.bb
+++ b/meta/recipes-devtools/rust/rust-cross-canadian_1.54.0.bb
@@ -1,6 +1,6 @@
 require rust-cross-canadian.inc
-require rust-source-${PV}.inc
-require rust-snapshot-${PV}.inc
+require rust-source.inc
+require rust-snapshot.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/rust:"
 
diff --git a/meta/recipes-devtools/rust/rust-cross_1.54.0.bb b/meta/recipes-devtools/rust/rust-cross_1.54.0.bb
index ddc25d36b58..3179d395d25 100644
--- a/meta/recipes-devtools/rust/rust-cross_1.54.0.bb
+++ b/meta/recipes-devtools/rust/rust-cross_1.54.0.bb
@@ -1,2 +1,2 @@
 require rust-cross.inc
-require rust-source-${PV}.inc
+require rust-source.inc
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb
index 81b2bd12b76..5e37798edd2 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb
@@ -1,5 +1,5 @@
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
 LLVM_RELEASE = "12.0.1"
-require rust-source-${PV}.inc
+require rust-source.inc
 require rust-llvm.inc
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.54.0.inc b/meta/recipes-devtools/rust/rust-snapshot-1.54.0.inc
deleted file mode 100644
index 598f4ed1097..00000000000
--- a/meta/recipes-devtools/rust/rust-snapshot-1.54.0.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-require rust-snapshot.inc
-
-## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0.txt
-## TODO: find a way to add additional SRC_URIs based on the contents of an
-##       earlier SRC_URI.
-RS_VERSION = "1.53.0"
-CARGO_VERSION = "1.53.0"
-
-# TODO: Add hashes for other architecture toolchains as well. Make a script?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "66d5257bbd194db08e67ca63a74cc80cdc4a36eaa30bf7dfe65861d9deaff7f7"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "9c2f0443a546dd18f1f020c7711a7b9864432545ceb812e79315c1e76508b193"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "e4437f6c83574fc60e183f4df439190f7610e4a669476802795645da66fbb83b"
-
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "fc261d0ff057c58b36057c30217bad1a29a9a3f257c70f5df88ad3f1d982386e"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "a857e5c615f6b5b3afc6b707ae007b3b4624585b0b2ba9b38b553114db37f8d5"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "4fa425a2d4633aeca67fa42695b3b9100f8b988dd1c21e60d6b2aa1164e55c0c"
-
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 79d03afd1ba..d448ffc7af1 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -1,3 +1,19 @@
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0.txt
+## TODO: find a way to add additional SRC_URIs based on the contents of an
+##       earlier SRC_URI.
+RS_VERSION = "1.53.0"
+CARGO_VERSION = "1.53.0"
+
+# TODO: Add hashes for other architecture toolchains as well. Make a script?
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "66d5257bbd194db08e67ca63a74cc80cdc4a36eaa30bf7dfe65861d9deaff7f7"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "9c2f0443a546dd18f1f020c7711a7b9864432545ceb812e79315c1e76508b193"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "e4437f6c83574fc60e183f4df439190f7610e4a669476802795645da66fbb83b"
+
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "fc261d0ff057c58b36057c30217bad1a29a9a3f257c70f5df88ad3f1d982386e"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "a857e5c615f6b5b3afc6b707ae007b3b4624585b0b2ba9b38b553114db37f8d5"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "4fa425a2d4633aeca67fa42695b3b9100f8b988dd1c21e60d6b2aa1164e55c0c"
+
 SRC_URI += " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
     https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source-1.54.0.inc b/meta/recipes-devtools/rust/rust-source-1.54.0.inc
deleted file mode 100644
index 335c7ceb450..00000000000
--- a/meta/recipes-devtools/rust/rust-source-1.54.0.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-require rust-source.inc
-
-SRC_URI[rust.sha256sum] = "a2934f85f76a35a3796c0fefd31e91f5b6dd8377cd8c3769c1c10e7ce7a495f4"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 1529ecfafe6..a1042d5f87a 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,3 +1,4 @@
+SRC_URI[rust.sha256sum] = "a2934f85f76a35a3796c0fefd31e91f5b6dd8377cd8c3769c1c10e7ce7a495f4"
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
 
 RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.54.0.bb b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.54.0.bb
index 053147ba46c..2d809d68f52 100644
--- a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.54.0.bb
+++ b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.54.0.bb
@@ -1,6 +1,6 @@
 require rust-tools-cross-canadian.inc
-require rust-source-${PV}.inc
-require rust-snapshot-${PV}.inc
+require rust-source.inc
+require rust-snapshot.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/rust:"
 
diff --git a/meta/recipes-devtools/rust/rust_1.54.0.bb b/meta/recipes-devtools/rust/rust_1.54.0.bb
index e7d8d70c261..036fb43334a 100644
--- a/meta/recipes-devtools/rust/rust_1.54.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.54.0.bb
@@ -1,6 +1,6 @@
 require rust-target.inc
-require rust-source-${PV}.inc
-require rust-snapshot-${PV}.inc
+require rust-source.inc
+require rust-snapshot.inc
 
 INSANE_SKIP:${PN}:class-native = "already-stripped"
 
-- 
2.20.1


