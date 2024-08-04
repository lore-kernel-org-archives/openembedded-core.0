Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA88BC52D71
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:31 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.30108.1722791369232762718
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qrN0Jg6I;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3db35ec5688so4873648b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791368; x=1723396168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzhDJaP1VPa8mENH7bFMIhJytAlnSnYeHXwVwPV6ZDg=;
        b=qrN0Jg6IjkATelaNpa3J2ml8PrqieNaOcIAVDaKU/dgnUgpne7v+QYqdtNWyxNeqES
         aPtslM/5Qb1K22d/24MA6LrGVfPBBLkPGCWmw27vjzCeeTgkUnSIBmVWpmrNKxDgc3N4
         RFGPLAT8F+OlzuaOTrymbWsVktaK9vxV387QCCyB1pxV9b7syk61kebWIbclL7AlhI3p
         qSXDDh5f7xMEkrLjjf91/Xv0EquC6lFhd2ZCgQtaIrmaBA3z4urQ1vWQPBFoRF+V42BR
         8W/4Y7QfiQUePMduleMJyIl3jSTrXQ+z4cr4mNe+BjwoKzJ2T/ucUi/TVV+FHBOzl9PL
         DMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791368; x=1723396168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzhDJaP1VPa8mENH7bFMIhJytAlnSnYeHXwVwPV6ZDg=;
        b=doKHTVGxX6vu29R21a2YfVyxrimnqUFWT78wSFp9TBmY7loHqe7dPut6ZFgDXi6Jxv
         xBTuxe4nhJ5AkzqGJULp0s3VFs/BGzQq02I5wtHTTV7zsk6xaFtTjUzn2Gudd5lCKFDz
         z7Yoze+Joe9/bcHQ/Xj74EMta9hP1dks27JCI9k8+k/LJhsaay/glVinTU+zBWeGXmlP
         c4B5icJ7iUnCZq+wjXkJFO4McOnIoHtqxvM1bb8dKspO9ZwU2/zSYzQLpCMbtixdqmnO
         s1emNQ/tVdJ19swqmJW79YUSatNr9Yk8cxCzAzZ9bBK+c9p1CT8HJiLOroy/hijD4rNT
         0KAA==
X-Gm-Message-State: AOJu0Ywr+rurV8m+0NIEukBAMjBmZLc8aax8o2g55+l8WedhICfDvNV0
	ulyIimhQ75rMY9jZTEBwwxFmF6v2GNx1au6iKICq/DUSKmt9m+Vl6lNEG9+CxdtqhvjtSZFDsFW
	m7DRXEQ==
X-Google-Smtp-Source: AGHT+IHLSx699g3dT/SAvaSsZEy3qCwyGs1kXihUc6Kq+jAf3ZuiMBgoEtgO+BpccLAxU4w3RfE4/A==
X-Received: by 2002:a05:6870:7187:b0:260:e611:c09 with SMTP id 586e51a60fabf-26891f27131mr11747797fac.47.1722791368241;
        Sun, 04 Aug 2024 10:09:28 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/18] libstd-rs,rust-cross-canadian: set CVE_PRODUCT to rust
Date: Sun,  4 Aug 2024 10:09:04 -0700
Message-Id: <91bfe1f64ee3e2b8534baa8a3eb2fb7fa3521657.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202960

From: Peter Marko <peter.marko@siemens.com>

These recipes come from rust sources and CVEs are reported for them
under rust-lang:rust vendor:product touple.
Especially libstd-rs needs correct CVE_PRODUCT as is it installed on
target devices (being statically linked to rust compiled binaries).

before:
cargo: CVE_PRODUCT="cargo"
cargo-c-native: CVE_PRODUCT="cargo-c"
libstd-rs: CVE_PRODUCT="libstd-rs"
rust: CVE_PRODUCT="rust"
rust-cross-canadian: CVE_PRODUCT="rust-cross-canadian-<arch>"
rust-llvm: CVE_PRODUCT="rust-llvm"

after:
cargo: CVE_PRODUCT="cargo"
cargo-c-native: CVE_PRODUCT="cargo-c"
libstd-rs: CVE_PRODUCT="rust"
rust: CVE_PRODUCT="rust"
rust-cross-canadian-x86-64: CVE_PRODUCT="rust"
rust-llvm: CVE_PRODUCT="rust-llvm"

Product for rust-llvm is uncertain and, should be handled in another
commit if it is desired to align it, too.

sqlite> select vendor, product, count(product) from products where vendor="rust-lang" group by product;
rust-lang|async-h1|2
rust-lang|cargo|5
rust-lang|future-utils|2
rust-lang|futures-task|2
rust-lang|mdbook|1
rust-lang|regex|2
rust-lang|rsa|2
rust-lang|rust|45
rust-lang|socket2|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8cf1df16a6ec2785cacaf608bec5cd8496103af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/libstd-rs_1.75.0.bb     | 2 ++
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
index d2bf266f9d..fe016e72d4 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
@@ -15,6 +15,8 @@ S = "${RUSTSRC}/library/sysroot"
 RUSTLIB_DEP = ""
 inherit cargo
 
+CVE_PRODUCT = "rust"
+
 DEPENDS:append:libc-musl = " libunwind"
 # rv32 does not have libunwind ported yet
 DEPENDS:remove:riscv32 = "libunwind"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bfef6d175..8a51a02293 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -1,5 +1,6 @@
 SUMMARY = "Rust compiler and runtime libaries (cross-canadian for ${TARGET_ARCH} target)"
 PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+CVE_PRODUCT = "rust"
 
 inherit rust-target-config
 inherit rust-common
-- 
2.34.1


