Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA83E6ADEF
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87836.1766434131469216409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PtTG7F6D;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b736d883ac4so772974966b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434130; x=1767038930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkaov6IElremsIWUk76HVC8APrkhmptsLnw35PhLyI8=;
        b=PtTG7F6DHaiW8uFi9mdgb1w08z0ywtx8FhnkpeGIhgA8oi3qmYpczHaBBAcvS0K5pb
         NVhaSWnVbO9PwcSBzgphxvWij36gcrBP/OeA7bTWuqIVTOK6HV0QhpcKKD1NHw9HKABd
         deWCbz/MxT86m2FF7VdqPs8Sh9S6SteegoZAwalOc08ql6S5AVnYvtE3bcKPdYNNWy7W
         a4FuevPhL4v+VG63e48RitiWC5YDeKAdhVhqK8BGMQsRWA7Cd7Eum/+RqkYtuRNais+x
         q/if5ZODzgJG1chOfalOjtB7qPPKkInkqCVC1U+daLZBo7+LLtRSMAiHsulW2okOCrCC
         nRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434130; x=1767038930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkaov6IElremsIWUk76HVC8APrkhmptsLnw35PhLyI8=;
        b=cs8ywB56wTE/7UnEJS657z0OXEmkHRfz5YFO5IGYqxDeC/lP53hvvpd3OYK2A7IObE
         4oHwFWifRD6gKLKZLsT0BW5sGIZ49w8F2DTKLX6biqETM7Jjw6iV+OgUNVM8oxOOXq9a
         CibM51BynMFZZmul0RMRVphN1xj4ZNdiW9+W2gFukD2Ucwl7jF+niLSI4VPk41O3Wg86
         f/Ox66/sgt4EKtyNYQ0CrHT5910cRZqEG3oCemDwaJMd4opqc9AHa1/2UbffY74afD5N
         Wzkin6T6hIoKB5nbYIAmYrk1WZr+IeyzHnM6ZehG17LuJ7X/Tnw9bswY0aaHH5JmPW19
         RP1A==
X-Gm-Message-State: AOJu0Yxzqztp7haU2ApeUv4xQSQxXaUUyvx/0uP29QLiEjKEofSP/D2v
	AnPn7mxuq6H81nOId6BHoY7vV3nhlO9unCfLNUFV50/oW47Pt5hnrM585v72FQ==
X-Gm-Gg: AY/fxX7D5OqDfi309uLGXVuVpXqjLbKKX/pBSt6o+SZXsXpod7RLtilu6TaFJm/b4ks
	aiQipb63ZyZuuLJL5lDIoQeVnfVloAuDwou5RVw7twedtG9NKjT+CtLl6efXLH2GosPNrjslCe/
	Jxn8teZc6Kybs9GZleccmg83Y+R36JrwfD4YlyHX3foBvw1NrUT0t+34AqVv53Czk/q/LnoZ28/
	9/cVEkvde2tNYpQfuiyEbzaYqRH1zO+WzbMCfvHhVTRR0YGamzbhK5HCvpATPrJBn0YaxycvTG4
	xNzKxmiK5XSn7cfS5z5UHhD/FH2fgsxUT7WdkciUM9xJRD1CymNnxWXWLa/qSEMeR6uKVchmm07
	BavsoJgQVm/egLY3ufjq9hgQi/ByDihu7y/2ix+qHbycRLHUuqzn4naHkFWreKGb51tZAUBa9Ja
	WhzYb4bqsM9m6p9xhiRrww+GOCBCMR/lN6MnqkDrjuyi/wmng=
X-Google-Smtp-Source: AGHT+IEadBW4Xgx2rXapMzljvjA5NE/uKLQywJmQTD6ujVsJLx950v8WKk3AOzg1xlerxQFF+kdkDw==
X-Received: by 2002:a17:907:3e1c:b0:b79:e974:4060 with SMTP id a640c23a62f3a-b80371d7db3mr1397393566b.48.1766434129153;
        Mon, 22 Dec 2025 12:08:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 093/114] rpm-sequoia: upgrade 1.9.0 -> 1.10.0
Date: Mon, 22 Dec 2025 21:07:15 +0100
Message-ID: <20251222200739.2278706-93-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228419

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-vars-to-force-runtime-paths-in-test.patch |   8 +-
 ...-lib-for-symbols-tests-conditionally.patch |  41 -
 .../rpm-sequoia/rpm-sequoia-crates.inc        | 702 +++++++++---------
 ...sequoia_1.9.0.bb => rpm-sequoia_1.10.0.bb} |   3 +-
 4 files changed, 339 insertions(+), 415 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch
 rename meta/recipes-devtools/rpm-sequoia/{rpm-sequoia_1.9.0.bb => rpm-sequoia_1.10.0.bb} (95%)

diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch b/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
index d0179fc53c..9dbe70bcbf 100644
--- a/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
+++ b/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
@@ -1,4 +1,4 @@
-From 590937523deea4ad2a2ee0e1ae4412a8f59e0170 Mon Sep 17 00:00:00 2001
+From 55c7c95e47e383af8df5eed88f207eed82be9b52 Mon Sep 17 00:00:00 2001
 From: Ines KCHELFI <ines.kchelfi@smile.fr>
 Date: Thu, 10 Apr 2025 15:14:11 +0200
 Subject: [PATCH] Use optional env vars to force runtime paths in tests
@@ -10,10 +10,10 @@ Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm-sequo
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/tests/symbols.rs b/tests/symbols.rs
-index c16dd9b..dc4a42c 100644
+index 0c4d268..00038dc 100644
 --- a/tests/symbols.rs
 +++ b/tests/symbols.rs
-@@ -14,7 +14,8 @@ fn symbols() -> anyhow::Result<()> {
+@@ -20,7 +20,8 @@ fn symbols() -> anyhow::Result<()> {
      // OUT_DIR gives us
      // `/tmp/rpm-sequoia/debug/build/rpm-sequoia-HASH/out`.
  
@@ -23,7 +23,7 @@ index c16dd9b..dc4a42c 100644
      let mut build_dir = out_dir;
      let lib = loop {
          let mut lib = build_dir.clone();
-@@ -53,7 +54,8 @@ fn symbols() -> anyhow::Result<()> {
+@@ -59,7 +60,8 @@ fn symbols() -> anyhow::Result<()> {
      }
  
      let mut expected_symbols_txt_fn
diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch b/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch
deleted file mode 100644
index ddc897b86c..0000000000
--- a/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-tests-conditionally.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From aaae1cc05c906b1d413e02f9da0b908e4cf9456d Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Fri, 8 Aug 2025 18:17:39 +0200
-Subject: [PATCH] tests: build lib for symbols tests conditionally
-
-When the tests are executed, cargo might not be available,
-however the library could be built already.
-
-An example of when this could happen is cross-compiling for
-embedded systems: when the library is compiled for a different
-(potentially low powered) system, then at runtime frequently
-there is no rust toolchain available to build the library;
-however the library is usually already built and installed.
-
-To be able to run the test on pre-built artifacts, introduce
-an environment variable, "DONT_BUILD_TEST_LIB", which, if
-present with any value, will skip building the library.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm-sequoia/pull/99]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- tests/symbols.rs | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/symbols.rs b/tests/symbols.rs
-index c532a15..0c4d268 100644
---- a/tests/symbols.rs
-+++ b/tests/symbols.rs
-@@ -9,7 +9,10 @@ use assert_cmd::assert::OutputAssertExt;
- #[test]
- fn symbols() -> anyhow::Result<()> {
-     // Make sure the library is built.
--    Command::new("cargo").arg("build").ok()?;
-+    let skip_build_library = env::var("TEST_DONT_BUILD_LIB").is_ok();
-+    if ! skip_build_library {
-+        Command::new("cargo").arg("build").ok()?;
-+    }
- 
-     // We want the location of the build directory (e.g.,
-     // `/tmp/rpm-sequoia/debug`).
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
index b97e27a34f..ebd72161b8 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
@@ -2,282 +2,264 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/aead/0.5.2 \
-    crate://crates.io/aes/0.8.4 \
-    crate://crates.io/aes-gcm/0.10.3 \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/android-tzdata/0.1.1 \
-    crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/anstyle/1.0.11 \
-    crate://crates.io/anyhow/1.0.98 \
-    crate://crates.io/argon2/0.5.3 \
-    crate://crates.io/ascii-canvas/3.0.0 \
-    crate://crates.io/assert_cmd/2.0.17 \
-    crate://crates.io/autocfg/1.5.0 \
-    crate://crates.io/base16ct/0.2.0 \
-    crate://crates.io/base64/0.22.1 \
-    crate://crates.io/base64ct/1.8.0 \
-    crate://crates.io/bindgen/0.70.1 \
-    crate://crates.io/bit-set/0.5.3 \
-    crate://crates.io/bit-vec/0.6.3 \
-    crate://crates.io/bitflags/2.9.1 \
-    crate://crates.io/blake2/0.10.6 \
-    crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/block-padding/0.3.3 \
-    crate://crates.io/blowfish/0.9.1 \
-    crate://crates.io/botan/0.11.1 \
-    crate://crates.io/botan-sys/0.11.1 \
-    crate://crates.io/bstr/1.12.0 \
-    crate://crates.io/buffered-reader/1.4.0 \
-    crate://crates.io/bumpalo/3.19.0 \
-    crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/camellia/0.1.0 \
-    crate://crates.io/cast5/0.11.1 \
-    crate://crates.io/cc/1.2.27 \
-    crate://crates.io/cdylib-link-lines/0.1.5 \
-    crate://crates.io/cexpr/0.6.0 \
-    crate://crates.io/cfb-mode/0.8.2 \
-    crate://crates.io/cfg-if/1.0.1 \
-    crate://crates.io/chrono/0.4.41 \
-    crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/cmac/0.7.2 \
-    crate://crates.io/const-oid/0.9.6 \
-    crate://crates.io/core-foundation-sys/0.8.7 \
-    crate://crates.io/cpufeatures/0.2.17 \
-    crate://crates.io/crunchy/0.2.4 \
-    crate://crates.io/crypto-bigint/0.5.5 \
-    crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/ctr/0.9.2 \
-    crate://crates.io/curve25519-dalek/4.1.3 \
-    crate://crates.io/curve25519-dalek-derive/0.1.1 \
-    crate://crates.io/dbl/0.3.2 \
-    crate://crates.io/der/0.7.10 \
-    crate://crates.io/des/0.8.1 \
-    crate://crates.io/difflib/0.4.0 \
-    crate://crates.io/digest/0.10.7 \
-    crate://crates.io/dirs-next/2.0.0 \
-    crate://crates.io/dirs-sys-next/0.1.2 \
-    crate://crates.io/displaydoc/0.2.5 \
-    crate://crates.io/doc-comment/0.3.3 \
-    crate://crates.io/dsa/0.6.3 \
-    crate://crates.io/dyn-clone/1.0.19 \
-    crate://crates.io/eax/0.5.0 \
-    crate://crates.io/ecb/0.1.2 \
-    crate://crates.io/ecdsa/0.16.9 \
-    crate://crates.io/ed25519/2.2.3 \
-    crate://crates.io/ed25519-dalek/2.1.1 \
-    crate://crates.io/either/1.15.0 \
-    crate://crates.io/elliptic-curve/0.13.8 \
-    crate://crates.io/ena/0.14.3 \
-    crate://crates.io/equivalent/1.0.2 \
-    crate://crates.io/errno/0.3.13 \
-    crate://crates.io/fastrand/2.3.0 \
-    crate://crates.io/ff/0.13.1 \
-    crate://crates.io/fiat-crypto/0.2.9 \
-    crate://crates.io/fixedbitset/0.4.2 \
-    crate://crates.io/foreign-types/0.3.2 \
-    crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.16 \
-    crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/ghash/0.5.1 \
-    crate://crates.io/glob/0.3.2 \
-    crate://crates.io/group/0.13.0 \
-    crate://crates.io/hashbrown/0.15.4 \
-    crate://crates.io/hkdf/0.12.4 \
-    crate://crates.io/hmac/0.12.1 \
-    crate://crates.io/iana-time-zone/0.1.63 \
-    crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/icu_collections/2.0.0 \
-    crate://crates.io/icu_locale_core/2.0.0 \
-    crate://crates.io/icu_normalizer/2.0.0 \
-    crate://crates.io/icu_normalizer_data/2.0.0 \
-    crate://crates.io/icu_properties/2.0.1 \
-    crate://crates.io/icu_properties_data/2.0.1 \
-    crate://crates.io/icu_provider/2.0.0 \
-    crate://crates.io/idea/0.5.1 \
-    crate://crates.io/idna/1.0.3 \
-    crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/indexmap/2.10.0 \
-    crate://crates.io/inout/0.1.4 \
-    crate://crates.io/itertools/0.11.0 \
-    crate://crates.io/itertools/0.13.0 \
-    crate://crates.io/js-sys/0.3.77 \
-    crate://crates.io/keccak/0.1.5 \
-    crate://crates.io/lalrpop/0.20.2 \
-    crate://crates.io/lalrpop-util/0.20.2 \
-    crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.174 \
-    crate://crates.io/libloading/0.8.8 \
-    crate://crates.io/libm/0.2.15 \
-    crate://crates.io/libredox/0.1.4 \
-    crate://crates.io/linux-raw-sys/0.9.4 \
-    crate://crates.io/litemap/0.8.0 \
-    crate://crates.io/lock_api/0.4.13 \
-    crate://crates.io/log/0.4.27 \
-    crate://crates.io/md-5/0.10.6 \
-    crate://crates.io/memchr/2.7.5 \
-    crate://crates.io/memsec/0.7.0 \
-    crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/nettle/7.4.0 \
-    crate://crates.io/nettle-sys/2.3.1 \
-    crate://crates.io/new_debug_unreachable/1.0.6 \
-    crate://crates.io/nom/7.1.3 \
-    crate://crates.io/num-bigint-dig/0.8.4 \
-    crate://crates.io/num-integer/0.1.46 \
-    crate://crates.io/num-iter/0.1.45 \
-    crate://crates.io/num-traits/0.2.19 \
-    crate://crates.io/ocb3/0.1.0 \
-    crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/opaque-debug/0.3.1 \
-    crate://crates.io/openssl/0.10.73 \
-    crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.109 \
-    crate://crates.io/p256/0.13.2 \
-    crate://crates.io/p384/0.13.1 \
-    crate://crates.io/p521/0.13.3 \
-    crate://crates.io/parking_lot/0.12.4 \
-    crate://crates.io/parking_lot_core/0.9.11 \
-    crate://crates.io/password-hash/0.5.0 \
-    crate://crates.io/pem-rfc7468/0.7.0 \
-    crate://crates.io/petgraph/0.6.5 \
-    crate://crates.io/phf_shared/0.11.3 \
-    crate://crates.io/pkcs1/0.7.5 \
-    crate://crates.io/pkcs8/0.10.2 \
-    crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/polyval/0.6.2 \
-    crate://crates.io/potential_utf/0.1.2 \
-    crate://crates.io/ppv-lite86/0.2.21 \
-    crate://crates.io/precomputed-hash/0.1.1 \
-    crate://crates.io/predicates/3.1.3 \
-    crate://crates.io/predicates-core/1.0.9 \
-    crate://crates.io/predicates-tree/1.0.12 \
-    crate://crates.io/primeorder/0.13.6 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/quote/1.0.40 \
-    crate://crates.io/r-efi/5.3.0 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand_chacha/0.3.1 \
-    crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/redox_syscall/0.5.13 \
-    crate://crates.io/redox_users/0.4.6 \
-    crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.4.9 \
-    crate://crates.io/regex-syntax/0.8.5 \
-    crate://crates.io/rfc6979/0.4.0 \
-    crate://crates.io/ripemd/0.1.3 \
-    crate://crates.io/rsa/0.9.8 \
-    crate://crates.io/rustc-hash/1.1.0 \
-    crate://crates.io/rustc_version/0.4.1 \
-    crate://crates.io/rustix/1.0.7 \
-    crate://crates.io/rustversion/1.0.21 \
-    crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/sec1/0.7.3 \
-    crate://crates.io/semver/1.0.26 \
-    crate://crates.io/sequoia-openpgp/2.0.0 \
-    crate://crates.io/sequoia-policy-config/0.8.0 \
-    crate://crates.io/serde/1.0.219 \
-    crate://crates.io/serde_derive/1.0.219 \
-    crate://crates.io/sha1collisiondetection/0.3.4 \
-    crate://crates.io/sha2/0.10.9 \
-    crate://crates.io/sha3/0.10.8 \
-    crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/signature/2.2.0 \
-    crate://crates.io/siphasher/1.0.1 \
-    crate://crates.io/smallvec/1.15.1 \
-    crate://crates.io/spin/0.9.8 \
-    crate://crates.io/spki/0.7.3 \
-    crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/string_cache/0.8.9 \
-    crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.104 \
-    crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tempfile/3.20.0 \
-    crate://crates.io/term/0.7.0 \
-    crate://crates.io/termtree/0.5.1 \
-    crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/tiny-keccak/2.0.2 \
-    crate://crates.io/tinystr/0.8.1 \
-    crate://crates.io/toml/0.5.11 \
-    crate://crates.io/twofish/0.7.1 \
-    crate://crates.io/typenum/1.18.0 \
-    crate://crates.io/unicode-ident/1.0.18 \
-    crate://crates.io/unicode-xid/0.2.6 \
-    crate://crates.io/universal-hash/0.5.1 \
-    crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/vcpkg/0.2.15 \
-    crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wait-timeout/0.2.1 \
-    crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
-    crate://crates.io/wasm-bindgen/0.2.100 \
-    crate://crates.io/wasm-bindgen-backend/0.2.100 \
-    crate://crates.io/wasm-bindgen-macro/0.2.100 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
-    crate://crates.io/wasm-bindgen-shared/0.2.100 \
-    crate://crates.io/win-crypto-ng/0.5.1 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.9 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-core/0.61.2 \
-    crate://crates.io/windows-implement/0.60.0 \
-    crate://crates.io/windows-interface/0.59.1 \
-    crate://crates.io/windows-link/0.1.3 \
-    crate://crates.io/windows-result/0.3.4 \
-    crate://crates.io/windows-strings/0.4.2 \
-    crate://crates.io/windows-sys/0.59.0 \
-    crate://crates.io/windows-sys/0.60.2 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows-targets/0.53.2 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.53.0 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.53.0 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.53.0 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.53.0 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.53.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.53.0 \
-    crate://crates.io/wit-bindgen-rt/0.39.0 \
-    crate://crates.io/writeable/0.6.1 \
-    crate://crates.io/x25519-dalek/2.0.1 \
-    crate://crates.io/xxhash-rust/0.8.15 \
-    crate://crates.io/yoke/0.8.0 \
-    crate://crates.io/yoke-derive/0.8.0 \
-    crate://crates.io/zerocopy/0.8.26 \
-    crate://crates.io/zerocopy-derive/0.8.26 \
-    crate://crates.io/zerofrom/0.1.6 \
-    crate://crates.io/zerofrom-derive/0.1.6 \
-    crate://crates.io/zeroize/1.8.1 \
-    crate://crates.io/zeroize_derive/1.4.2 \
-    crate://crates.io/zerotrie/0.2.2 \
-    crate://crates.io/zerovec/0.11.2 \
-    crate://crates.io/zerovec-derive/0.11.1 \
-"
+           crate://crates.io/aead/0.5.2 \
+           crate://crates.io/aes/0.8.4 \
+           crate://crates.io/aes-gcm/0.10.3 \
+           crate://crates.io/aho-corasick/1.1.4 \
+           crate://crates.io/android_system_properties/0.1.5 \
+           crate://crates.io/anstyle/1.0.13 \
+           crate://crates.io/anyhow/1.0.100 \
+           crate://crates.io/argon2/0.5.3 \
+           crate://crates.io/ascii-canvas/3.0.0 \
+           crate://crates.io/assert_cmd/2.1.1 \
+           crate://crates.io/autocfg/1.5.0 \
+           crate://crates.io/base16ct/0.2.0 \
+           crate://crates.io/base64/0.22.1 \
+           crate://crates.io/base64ct/1.8.0 \
+           crate://crates.io/bindgen/0.70.1 \
+           crate://crates.io/bit-set/0.5.3 \
+           crate://crates.io/bit-vec/0.6.3 \
+           crate://crates.io/bitflags/2.10.0 \
+           crate://crates.io/blake2/0.10.6 \
+           crate://crates.io/block-buffer/0.10.4 \
+           crate://crates.io/block-padding/0.3.3 \
+           crate://crates.io/blowfish/0.9.1 \
+           crate://crates.io/botan/0.11.1 \
+           crate://crates.io/botan-sys/0.11.1 \
+           crate://crates.io/bstr/1.12.1 \
+           crate://crates.io/buffered-reader/1.4.0 \
+           crate://crates.io/bumpalo/3.19.0 \
+           crate://crates.io/byteorder/1.5.0 \
+           crate://crates.io/camellia/0.1.0 \
+           crate://crates.io/cast5/0.11.1 \
+           crate://crates.io/cc/1.2.47 \
+           crate://crates.io/cdylib-link-lines/0.1.5 \
+           crate://crates.io/cexpr/0.6.0 \
+           crate://crates.io/cfb-mode/0.8.2 \
+           crate://crates.io/cfg-if/1.0.4 \
+           crate://crates.io/chrono/0.4.42 \
+           crate://crates.io/cipher/0.4.4 \
+           crate://crates.io/clang-sys/1.8.1 \
+           crate://crates.io/cmac/0.7.2 \
+           crate://crates.io/const-oid/0.9.6 \
+           crate://crates.io/core-foundation-sys/0.8.7 \
+           crate://crates.io/cpufeatures/0.2.17 \
+           crate://crates.io/crunchy/0.2.4 \
+           crate://crates.io/crypto-bigint/0.5.5 \
+           crate://crates.io/crypto-common/0.1.7 \
+           crate://crates.io/ctr/0.9.2 \
+           crate://crates.io/curve25519-dalek/4.1.3 \
+           crate://crates.io/curve25519-dalek-derive/0.1.1 \
+           crate://crates.io/dbl/0.3.2 \
+           crate://crates.io/der/0.7.10 \
+           crate://crates.io/des/0.8.1 \
+           crate://crates.io/difflib/0.4.0 \
+           crate://crates.io/digest/0.10.7 \
+           crate://crates.io/dirs-next/2.0.0 \
+           crate://crates.io/dirs-sys-next/0.1.2 \
+           crate://crates.io/displaydoc/0.2.5 \
+           crate://crates.io/doc-comment/0.3.4 \
+           crate://crates.io/dsa/0.6.3 \
+           crate://crates.io/dyn-clone/1.0.20 \
+           crate://crates.io/eax/0.5.0 \
+           crate://crates.io/ecb/0.1.2 \
+           crate://crates.io/ecdsa/0.16.9 \
+           crate://crates.io/ed25519/2.2.3 \
+           crate://crates.io/ed25519-dalek/2.2.0 \
+           crate://crates.io/either/1.15.0 \
+           crate://crates.io/elliptic-curve/0.13.8 \
+           crate://crates.io/ena/0.14.3 \
+           crate://crates.io/equivalent/1.0.2 \
+           crate://crates.io/errno/0.3.14 \
+           crate://crates.io/fastrand/2.3.0 \
+           crate://crates.io/ff/0.13.1 \
+           crate://crates.io/fiat-crypto/0.2.9 \
+           crate://crates.io/find-msvc-tools/0.1.5 \
+           crate://crates.io/fixedbitset/0.4.2 \
+           crate://crates.io/foreign-types/0.3.2 \
+           crate://crates.io/foreign-types-shared/0.1.1 \
+           crate://crates.io/generic-array/0.14.7 \
+           crate://crates.io/getrandom/0.2.16 \
+           crate://crates.io/getrandom/0.3.4 \
+           crate://crates.io/ghash/0.5.1 \
+           crate://crates.io/glob/0.3.3 \
+           crate://crates.io/group/0.13.0 \
+           crate://crates.io/hashbrown/0.16.1 \
+           crate://crates.io/hkdf/0.12.4 \
+           crate://crates.io/hmac/0.12.1 \
+           crate://crates.io/iana-time-zone/0.1.64 \
+           crate://crates.io/iana-time-zone-haiku/0.1.2 \
+           crate://crates.io/icu_collections/2.1.1 \
+           crate://crates.io/icu_locale_core/2.1.1 \
+           crate://crates.io/icu_normalizer/2.1.1 \
+           crate://crates.io/icu_normalizer_data/2.1.1 \
+           crate://crates.io/icu_properties/2.1.1 \
+           crate://crates.io/icu_properties_data/2.1.1 \
+           crate://crates.io/icu_provider/2.1.1 \
+           crate://crates.io/idea/0.5.1 \
+           crate://crates.io/idna/1.1.0 \
+           crate://crates.io/idna_adapter/1.2.1 \
+           crate://crates.io/indexmap/2.12.1 \
+           crate://crates.io/inout/0.1.4 \
+           crate://crates.io/itertools/0.11.0 \
+           crate://crates.io/itertools/0.13.0 \
+           crate://crates.io/js-sys/0.3.82 \
+           crate://crates.io/keccak/0.1.5 \
+           crate://crates.io/lalrpop/0.20.2 \
+           crate://crates.io/lalrpop-util/0.20.2 \
+           crate://crates.io/lazy_static/1.5.0 \
+           crate://crates.io/libc/0.2.177 \
+           crate://crates.io/libloading/0.8.9 \
+           crate://crates.io/libm/0.2.15 \
+           crate://crates.io/libredox/0.1.10 \
+           crate://crates.io/linux-raw-sys/0.11.0 \
+           crate://crates.io/litemap/0.8.1 \
+           crate://crates.io/lock_api/0.4.14 \
+           crate://crates.io/log/0.4.28 \
+           crate://crates.io/md-5/0.10.6 \
+           crate://crates.io/memchr/2.7.6 \
+           crate://crates.io/memsec/0.7.0 \
+           crate://crates.io/minimal-lexical/0.2.1 \
+           crate://crates.io/nettle/7.4.0 \
+           crate://crates.io/nettle-sys/2.3.1 \
+           crate://crates.io/new_debug_unreachable/1.0.6 \
+           crate://crates.io/nom/7.1.3 \
+           crate://crates.io/num-bigint-dig/0.8.6 \
+           crate://crates.io/num-integer/0.1.46 \
+           crate://crates.io/num-iter/0.1.45 \
+           crate://crates.io/num-traits/0.2.19 \
+           crate://crates.io/ocb3/0.1.0 \
+           crate://crates.io/once_cell/1.21.3 \
+           crate://crates.io/opaque-debug/0.3.1 \
+           crate://crates.io/openssl/0.10.75 \
+           crate://crates.io/openssl-macros/0.1.1 \
+           crate://crates.io/openssl-sys/0.9.111 \
+           crate://crates.io/p256/0.13.2 \
+           crate://crates.io/p384/0.13.1 \
+           crate://crates.io/p521/0.13.3 \
+           crate://crates.io/parking_lot/0.12.5 \
+           crate://crates.io/parking_lot_core/0.9.12 \
+           crate://crates.io/password-hash/0.5.0 \
+           crate://crates.io/pem-rfc7468/0.7.0 \
+           crate://crates.io/petgraph/0.6.5 \
+           crate://crates.io/phf_shared/0.11.3 \
+           crate://crates.io/pkcs1/0.7.5 \
+           crate://crates.io/pkcs8/0.10.2 \
+           crate://crates.io/pkg-config/0.3.32 \
+           crate://crates.io/polyval/0.6.2 \
+           crate://crates.io/potential_utf/0.1.4 \
+           crate://crates.io/ppv-lite86/0.2.21 \
+           crate://crates.io/precomputed-hash/0.1.1 \
+           crate://crates.io/predicates/3.1.3 \
+           crate://crates.io/predicates-core/1.0.9 \
+           crate://crates.io/predicates-tree/1.0.12 \
+           crate://crates.io/primeorder/0.13.6 \
+           crate://crates.io/proc-macro2/1.0.103 \
+           crate://crates.io/quote/1.0.42 \
+           crate://crates.io/r-efi/5.3.0 \
+           crate://crates.io/rand/0.8.5 \
+           crate://crates.io/rand_chacha/0.3.1 \
+           crate://crates.io/rand_core/0.6.4 \
+           crate://crates.io/redox_syscall/0.5.18 \
+           crate://crates.io/redox_users/0.4.6 \
+           crate://crates.io/regex/1.12.2 \
+           crate://crates.io/regex-automata/0.4.13 \
+           crate://crates.io/regex-syntax/0.8.8 \
+           crate://crates.io/rfc6979/0.4.0 \
+           crate://crates.io/ripemd/0.1.3 \
+           crate://crates.io/rsa/0.9.9 \
+           crate://crates.io/rustc-hash/1.1.0 \
+           crate://crates.io/rustc_version/0.4.1 \
+           crate://crates.io/rustix/1.1.2 \
+           crate://crates.io/rustversion/1.0.22 \
+           crate://crates.io/same-file/1.0.6 \
+           crate://crates.io/scopeguard/1.2.0 \
+           crate://crates.io/sec1/0.7.3 \
+           crate://crates.io/semver/1.0.27 \
+           crate://crates.io/sequoia-openpgp/2.0.0 \
+           crate://crates.io/sequoia-policy-config/0.8.0 \
+           crate://crates.io/serde/1.0.228 \
+           crate://crates.io/serde_core/1.0.228 \
+           crate://crates.io/serde_derive/1.0.228 \
+           crate://crates.io/sha1collisiondetection/0.3.4 \
+           crate://crates.io/sha2/0.10.9 \
+           crate://crates.io/sha3/0.10.8 \
+           crate://crates.io/shlex/1.3.0 \
+           crate://crates.io/signature/2.2.0 \
+           crate://crates.io/siphasher/1.0.1 \
+           crate://crates.io/smallvec/1.15.1 \
+           crate://crates.io/spin/0.9.8 \
+           crate://crates.io/spki/0.7.3 \
+           crate://crates.io/stable_deref_trait/1.2.1 \
+           crate://crates.io/string_cache/0.8.9 \
+           crate://crates.io/subtle/2.6.1 \
+           crate://crates.io/syn/2.0.111 \
+           crate://crates.io/synstructure/0.13.2 \
+           crate://crates.io/tempfile/3.23.0 \
+           crate://crates.io/term/0.7.0 \
+           crate://crates.io/termtree/0.5.1 \
+           crate://crates.io/thiserror/1.0.69 \
+           crate://crates.io/thiserror/2.0.17 \
+           crate://crates.io/thiserror-impl/1.0.69 \
+           crate://crates.io/thiserror-impl/2.0.17 \
+           crate://crates.io/tiny-keccak/2.0.2 \
+           crate://crates.io/tinystr/0.8.2 \
+           crate://crates.io/toml/0.5.11 \
+           crate://crates.io/twofish/0.7.1 \
+           crate://crates.io/typenum/1.19.0 \
+           crate://crates.io/unicode-ident/1.0.22 \
+           crate://crates.io/unicode-xid/0.2.6 \
+           crate://crates.io/universal-hash/0.5.1 \
+           crate://crates.io/utf8_iter/1.0.4 \
+           crate://crates.io/vcpkg/0.2.15 \
+           crate://crates.io/version_check/0.9.5 \
+           crate://crates.io/wait-timeout/0.2.1 \
+           crate://crates.io/walkdir/2.5.0 \
+           crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+           crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
+           crate://crates.io/wasm-bindgen/0.2.105 \
+           crate://crates.io/wasm-bindgen-macro/0.2.105 \
+           crate://crates.io/wasm-bindgen-macro-support/0.2.105 \
+           crate://crates.io/wasm-bindgen-shared/0.2.105 \
+           crate://crates.io/win-crypto-ng/0.5.1 \
+           crate://crates.io/winapi/0.3.9 \
+           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+           crate://crates.io/winapi-util/0.1.11 \
+           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+           crate://crates.io/windows-core/0.62.2 \
+           crate://crates.io/windows-implement/0.60.2 \
+           crate://crates.io/windows-interface/0.59.3 \
+           crate://crates.io/windows-link/0.2.1 \
+           crate://crates.io/windows-result/0.4.1 \
+           crate://crates.io/windows-strings/0.5.1 \
+           crate://crates.io/windows-sys/0.61.2 \
+           crate://crates.io/wit-bindgen/0.46.0 \
+           crate://crates.io/writeable/0.6.2 \
+           crate://crates.io/x25519-dalek/2.0.1 \
+           crate://crates.io/xxhash-rust/0.8.15 \
+           crate://crates.io/yoke/0.8.1 \
+           crate://crates.io/yoke-derive/0.8.1 \
+           crate://crates.io/zerocopy/0.8.30 \
+           crate://crates.io/zerocopy-derive/0.8.30 \
+           crate://crates.io/zerofrom/0.1.6 \
+           crate://crates.io/zerofrom-derive/0.1.6 \
+           crate://crates.io/zeroize/1.8.2 \
+           crate://crates.io/zeroize_derive/1.4.2 \
+           crate://crates.io/zerotrie/0.2.3 \
+           crate://crates.io/zerovec/0.11.5 \
+           crate://crates.io/zerovec-derive/0.11.2 \
+           "
 
 SRC_URI[aead-0.5.2.sha256sum] = "d122413f284cf2d62fb1b7db97e02edb8cda96d769b16e443a4f6195e35662b0"
 SRC_URI[aes-0.8.4.sha256sum] = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
 SRC_URI[aes-gcm-0.10.3.sha256sum] = "831010a0f742e1209b3bcea8fab6a8e149051ba6099432c8cb2cc117dec3ead1"
-SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
+SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
-SRC_URI[anstyle-1.0.11.sha256sum] = "862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd"
-SRC_URI[anyhow-1.0.98.sha256sum] = "e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487"
+SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[anyhow-1.0.100.sha256sum] = "a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61"
 SRC_URI[argon2-0.5.3.sha256sum] = "3c3610892ee6e0cbce8ae2700349fcf8f98adb0dbfbee85aec3c9179d29cc072"
 SRC_URI[ascii-canvas-3.0.0.sha256sum] = "8824ecca2e851cec16968d54a01dd372ef8f95b244fb84b84e70128be347c3c6"
-SRC_URI[assert_cmd-2.0.17.sha256sum] = "2bd389a4b2970a01282ee455294913c0a43724daedcd1a24c3eb0ec1c1320b66"
+SRC_URI[assert_cmd-2.1.1.sha256sum] = "bcbb6924530aa9e0432442af08bbcafdad182db80d2e560da42a6d442535bf85"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
@@ -285,25 +267,25 @@ SRC_URI[base64ct-1.8.0.sha256sum] = "55248b47b0caf0546f7988906588779981c43bb1bc9
 SRC_URI[bindgen-0.70.1.sha256sum] = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
 SRC_URI[bit-set-0.5.3.sha256sum] = "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
 SRC_URI[bit-vec-0.6.3.sha256sum] = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
-SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
+SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
 SRC_URI[blake2-0.10.6.sha256sum] = "46502ad458c9a52b69d4d4d32775c788b7a1b85e8bc9d482d92250fc0e3f8efe"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-padding-0.3.3.sha256sum] = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[botan-0.11.1.sha256sum] = "24d4c7647d67c53194fa0740404c6c508880aef2bfe99a9868dbb4b86f090377"
 SRC_URI[botan-sys-0.11.1.sha256sum] = "04285fa0c094cc9961fe435b1b279183db9394844ad82ce483aa6196c0e6da38"
-SRC_URI[bstr-1.12.0.sha256sum] = "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
+SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[buffered-reader-1.4.0.sha256sum] = "db26bf1f092fd5e05b5ab3be2f290915aeb6f3f20c4e9f86ce0f07f336c2412f"
 SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[camellia-0.1.0.sha256sum] = "3264e2574e9ef2b53ce6f536dea83a69ac0bc600b762d1523ff83fe07230ce30"
 SRC_URI[cast5-0.11.1.sha256sum] = "26b07d673db1ccf000e90f54b819db9e75a8348d6eb056e9b8ab53231b7a9911"
-SRC_URI[cc-1.2.27.sha256sum] = "d487aa071b5f64da6f19a3e848e3578944b726ee5a4854b82172f02aa876bfdc"
+SRC_URI[cc-1.2.47.sha256sum] = "cd405d82c84ff7f35739f175f67d8b9fb7687a0e84ccdc78bd3568839827cf07"
 SRC_URI[cdylib-link-lines-0.1.5.sha256sum] = "d98eabef08bbdf5afd0b9c0cabb1ac335f7c70447ef095eed85dffd9628b20bc"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfb-mode-0.8.2.sha256sum] = "738b8d467867f80a71351933f70461f5b56f24d5c93e0cf216e59229c968d330"
-SRC_URI[cfg-if-1.0.1.sha256sum] = "9555578bc9e57714c812a1f84e4fc5b4d21fcb063490c624de019f7464c91268"
-SRC_URI[chrono-0.4.41.sha256sum] = "c469d952047f47f91b68d1cba3f10d63c11d73e4636f24f08daf0278abf01c4d"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
+SRC_URI[chrono-0.4.42.sha256sum] = "145052bdd345b87320e369255277e3fb5152762ad123a901ef5c262dd38fe8d2"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
 SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
 SRC_URI[cmac-0.7.2.sha256sum] = "8543454e3c3f5126effff9cd44d562af4e31fb8ce1cc0d3dcd8f084515dbc1aa"
@@ -312,7 +294,7 @@ SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f28077744574
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
-SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[ctr-0.9.2.sha256sum] = "0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835"
 SRC_URI[curve25519-dalek-4.1.3.sha256sum] = "97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be"
 SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] = "f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
@@ -324,86 +306,87 @@ SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff424
 SRC_URI[dirs-next-2.0.0.sha256sum] = "b98cf8ebf19c3d1b223e151f99a4f9f0690dca41414773390fc824184ac833e1"
 SRC_URI[dirs-sys-next-0.1.2.sha256sum] = "4ebda144c4fe02d1f7ea1a7d9641b6fc6b580adcfa024ae48797ecdeb6825b4d"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
-SRC_URI[doc-comment-0.3.3.sha256sum] = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
+SRC_URI[doc-comment-0.3.4.sha256sum] = "780955b8b195a21ab8e4ac6b60dd1dbdcec1dc6c51c0617964b08c81785e12c9"
 SRC_URI[dsa-0.6.3.sha256sum] = "48bc224a9084ad760195584ce5abb3c2c34a225fa312a128ad245a6b412b7689"
-SRC_URI[dyn-clone-1.0.19.sha256sum] = "1c7a8fb8a9fbf66c1f703fe16184d10ca0ee9d23be5b4436400408ba54a95005"
+SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
 SRC_URI[eax-0.5.0.sha256sum] = "9954fabd903b82b9d7a68f65f97dc96dd9ad368e40ccc907a7c19d53e6bfac28"
 SRC_URI[ecb-0.1.2.sha256sum] = "1a8bfa975b1aec2145850fcaa1c6fe269a16578c44705a532ae3edc92b8881c7"
 SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
 SRC_URI[ed25519-2.2.3.sha256sum] = "115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53"
-SRC_URI[ed25519-dalek-2.1.1.sha256sum] = "4a3daa8e81a3963a60642bcc1f90a670680bd4a77535faa384e9d1c79d620871"
+SRC_URI[ed25519-dalek-2.2.0.sha256sum] = "70e796c081cee67dc755e1a36a0a172b897fab85fc3f6bc48307991f64e4eca9"
 SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
 SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
 SRC_URI[ena-0.14.3.sha256sum] = "3d248bdd43ce613d87415282f69b9bb99d947d290b10962dd6c56233312c2ad5"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
-SRC_URI[errno-0.3.13.sha256sum] = "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
+SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
 SRC_URI[ff-0.13.1.sha256sum] = "c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393"
 SRC_URI[fiat-crypto-0.2.9.sha256sum] = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
+SRC_URI[find-msvc-tools-0.1.5.sha256sum] = "3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844"
 SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
-SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[ghash-0.5.1.sha256sum] = "f0d8a4362ccb29cb0b265253fb0a2728f592895ee6854fd9bc13f2ffda266ff1"
-SRC_URI[glob-0.3.2.sha256sum] = "a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2"
+SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
 SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
-SRC_URI[hashbrown-0.15.4.sha256sum] = "5971ac85611da7067dbfcabef3c70ebb5606018acd9e2a3903a0da507521e0d5"
+SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
 SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
 SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
-SRC_URI[iana-time-zone-0.1.63.sha256sum] = "b0c919e5debc312ad217002b8048a17b7d83f80703865bbfcfebb0458b0b27d8"
+SRC_URI[iana-time-zone-0.1.64.sha256sum] = "33e57f83510bb73707521ebaffa789ec8caf86f9657cad665b092b581d40e9fb"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[icu_collections-2.0.0.sha256sum] = "200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47"
-SRC_URI[icu_locale_core-2.0.0.sha256sum] = "0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a"
-SRC_URI[icu_normalizer-2.0.0.sha256sum] = "436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979"
-SRC_URI[icu_normalizer_data-2.0.0.sha256sum] = "00210d6893afc98edb752b664b8890f0ef174c8adbb8d0be9710fa66fbbf72d3"
-SRC_URI[icu_properties-2.0.1.sha256sum] = "016c619c1eeb94efb86809b015c58f479963de65bdb6253345c1a1276f22e32b"
-SRC_URI[icu_properties_data-2.0.1.sha256sum] = "298459143998310acd25ffe6810ed544932242d3f07083eee1084d83a71bd632"
-SRC_URI[icu_provider-2.0.0.sha256sum] = "03c80da27b5f4187909049ee2d72f276f0d9f99a42c306bd0131ecfe04d8e5af"
+SRC_URI[icu_collections-2.1.1.sha256sum] = "4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43"
+SRC_URI[icu_locale_core-2.1.1.sha256sum] = "edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6"
+SRC_URI[icu_normalizer-2.1.1.sha256sum] = "5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599"
+SRC_URI[icu_normalizer_data-2.1.1.sha256sum] = "7aedcccd01fc5fe81e6b489c15b247b8b0690feb23304303a9e560f37efc560a"
+SRC_URI[icu_properties-2.1.1.sha256sum] = "e93fcd3157766c0c8da2f8cff6ce651a31f0810eaa1c51ec363ef790bbb5fb99"
+SRC_URI[icu_properties_data-2.1.1.sha256sum] = "02845b3647bb045f1100ecd6480ff52f34c35f82d9880e029d329c21d1054899"
+SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
 SRC_URI[idea-0.5.1.sha256sum] = "075557004419d7f2031b8bb7f44bb43e55a83ca7b63076a8fb8fe75753836477"
-SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[indexmap-2.10.0.sha256sum] = "fe4cd85333e22411419a0bcae1297d25e58c9443848b11dc6a86fefe8c78a661"
+SRC_URI[indexmap-2.12.1.sha256sum] = "0ad4bb2b565bca0645f4d68c5c9af97fba094e9791da685bf83cb5f3ce74acf2"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
 SRC_URI[itertools-0.11.0.sha256sum] = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
-SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
+SRC_URI[js-sys-0.3.82.sha256sum] = "b011eec8cc36da2aab2d5cff675ec18454fad408585853910a202391cf9f8e65"
 SRC_URI[keccak-0.1.5.sha256sum] = "ecc2af9a1119c51f12a14607e783cb977bde58bc069ff0c3da1095e635d70654"
 SRC_URI[lalrpop-0.20.2.sha256sum] = "55cb077ad656299f160924eb2912aa147d7339ea7d69e1b5517326fdcec3c1ca"
 SRC_URI[lalrpop-util-0.20.2.sha256sum] = "507460a910eb7b32ee961886ff48539633b788a36b65692b95f225b844c82553"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.174.sha256sum] = "1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"
-SRC_URI[libloading-0.8.8.sha256sum] = "07033963ba89ebaf1584d767badaa2e8fcec21aedea6b8c0346d487d49c28667"
+SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
+SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[libm-0.2.15.sha256sum] = "f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de"
-SRC_URI[libredox-0.1.4.sha256sum] = "1580801010e535496706ba011c15f8532df6b42297d2e471fec38ceadd8c0638"
-SRC_URI[linux-raw-sys-0.9.4.sha256sum] = "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
-SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
-SRC_URI[lock_api-0.4.13.sha256sum] = "96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765"
-SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
+SRC_URI[libredox-0.1.10.sha256sum] = "416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb"
+SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
+SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
+SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
+SRC_URI[log-0.4.28.sha256sum] = "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
-SRC_URI[memchr-2.7.5.sha256sum] = "32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0"
+SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
 SRC_URI[memsec-0.7.0.sha256sum] = "c797b9d6bb23aab2fc369c65f871be49214f5c759af65bde26ffaaa2b646b492"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[nettle-7.4.0.sha256sum] = "44e6ff4a94e5d34a1fd5abbd39418074646e2fa51b257198701330f22fcd6936"
 SRC_URI[nettle-sys-2.3.1.sha256sum] = "61a3f5406064d310d59b1a219d3c5c9a49caf4047b6496032e3f930876488c34"
 SRC_URI[new_debug_unreachable-1.0.6.sha256sum] = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
-SRC_URI[num-bigint-dig-0.8.4.sha256sum] = "dc84195820f291c7697304f3cbdadd1cb7199c0efc917ff5eafd71225c136151"
+SRC_URI[num-bigint-dig-0.8.6.sha256sum] = "e661dda6640fad38e827a6d4a310ff4763082116fe217f279885c97f511bb0b7"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-iter-0.1.45.sha256sum] = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[ocb3-0.1.0.sha256sum] = "c196e0276c471c843dd5777e7543a36a298a4be942a2a688d8111cd43390dedb"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[opaque-debug-0.3.1.sha256sum] = "c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381"
-SRC_URI[openssl-0.10.73.sha256sum] = "8505734d46c8ab1e19a1dce3aef597ad87dcb4c37e7188231769bd6bd51cebf8"
+SRC_URI[openssl-0.10.75.sha256sum] = "08838db121398ad17ab8531ce9de97b244589089e290a384c900cb9ff7434328"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.109.sha256sum] = "90096e2e47630d78b7d1c20952dc621f957103f8bc2c8359ec81290d75238571"
+SRC_URI[openssl-sys-0.9.111.sha256sum] = "82cab2d520aa75e3c58898289429321eb788c3106963d0dc886ec7a5f4adc321"
 SRC_URI[p256-0.13.2.sha256sum] = "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
 SRC_URI[p384-0.13.1.sha256sum] = "fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6"
 SRC_URI[p521-0.13.3.sha256sum] = "0fc9e2161f1f215afdfce23677034ae137bbd45016a880c2eb3ba8eb95f085b2"
-SRC_URI[parking_lot-0.12.4.sha256sum] = "70d58bf43669b5795d1576d0641cfb6fbb2057bf629506267a92807158584a13"
-SRC_URI[parking_lot_core-0.9.11.sha256sum] = "bc838d2a56b5b1a6c25f55575dfc605fabb63bb2365f6c2353ef9159aa69e4a5"
+SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
+SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
 SRC_URI[password-hash-0.5.0.sha256sum] = "346f04948ba92c43e8469c1ee6736c7563d71012b17d40745260fe106aac2166"
 SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
 SRC_URI[petgraph-0.6.5.sha256sum] = "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
@@ -412,39 +395,40 @@ SRC_URI[pkcs1-0.7.5.sha256sum] = "c8ffb9f10fa047879315e6625af03c164b16962a5368d7
 SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[polyval-0.6.2.sha256sum] = "9d1fe60d06143b2430aa532c94cfe9e29783047f06c0d7fd359a9a51b729fa25"
-SRC_URI[potential_utf-0.1.2.sha256sum] = "e5a7c30837279ca13e7c867e9e40053bc68740f988cb07f7ca6df43cc734b585"
+SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[precomputed-hash-0.1.1.sha256sum] = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
 SRC_URI[predicates-3.1.3.sha256sum] = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
 SRC_URI[predicates-core-1.0.9.sha256sum] = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
 SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7caee39fc8503f74e7dc0be0531b425c"
 SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-SRC_URI[redox_syscall-0.5.13.sha256sum] = "0d04b7d0ee6b4a0207a0a7adb104d23ecb0b47d6beae7152d0fa34b692b29fd6"
+SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
 SRC_URI[redox_users-0.4.6.sha256sum] = "ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43"
-SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
-SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
+SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
+SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
+SRC_URI[regex-syntax-0.8.8.sha256sum] = "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
 SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
 SRC_URI[ripemd-0.1.3.sha256sum] = "bd124222d17ad93a644ed9d011a40f4fb64aa54275c08cc216524a9ea82fb09f"
-SRC_URI[rsa-0.9.8.sha256sum] = "78928ac1ed176a5ca1d17e578a1825f3d81ca54cf41053a592584b020cfd691b"
+SRC_URI[rsa-0.9.9.sha256sum] = "40a0376c50d0358279d9d643e4bf7b7be212f1f4ff1da9070a7b54d22ef75c88"
 SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
-SRC_URI[rustix-1.0.7.sha256sum] = "c71e83d6afe7ff64890ec6b71d6a69bb8a610ab78ce364b3352876bb4c801266"
-SRC_URI[rustversion-1.0.21.sha256sum] = "8a0d197bd2c9dc6e53b84da9556a69ba4cdfab8619eb41a8bd1cc2027a0f6b1d"
+SRC_URI[rustix-1.1.2.sha256sum] = "cd15f8a2c5551a84d56efdc1cd049089e409ac19a3072d5037a17fd70719ff3e"
+SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
-SRC_URI[semver-1.0.26.sha256sum] = "56e6fa9c48d24d85fb3de5ad847117517440f6beceb7798af16b4a87d616b8d0"
+SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
 SRC_URI[sequoia-openpgp-2.0.0.sha256sum] = "015e5fc3d023418b9db98ca9a7f3e90b305872eeafe5ca45c5c32b5eb335c1e8"
 SRC_URI[sequoia-policy-config-0.8.0.sha256sum] = "8e016b708d64857b6a97e1a331d9471b73e30ed450d247628e1a0ce236b1e597"
-SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
-SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[sha1collisiondetection-0.3.4.sha256sum] = "1f606421e4a6012877e893c399822a4ed4b089164c5969424e1b9d1e66e6964b"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sha3-0.10.8.sha256sum] = "75872d278a8f37ef87fa0ddbda7802605cb18344497949862c0d4dcb291eba60"
@@ -454,22 +438,24 @@ SRC_URI[siphasher-1.0.1.sha256sum] = "56199f7ddabf13fe5074ce809e7d3f42b42ae71180
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
 SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
-SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
+SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[string_cache-0.8.9.sha256sum] = "bf776ba3fa74f83bf4b63c3dcbbf82173db2632ed8452cb2d891d33f459de70f"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.104.sha256sum] = "17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40"
+SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tempfile-3.20.0.sha256sum] = "e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1"
+SRC_URI[tempfile-3.23.0.sha256sum] = "2d31c77bdf42a745371d260a26ca7163f1e0924b64afa0b688e61b5a9fa02f16"
 SRC_URI[term-0.7.0.sha256sum] = "c59df8ac95d96ff9bede18eb7300b0fda5e5d8d90960e76f8e14ae765eedbf1f"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
+SRC_URI[thiserror-2.0.17.sha256sum] = "f63587ca0f12b72a0600bcba1d40081f830876000bb46dd2337a3051618f4fc8"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
+SRC_URI[thiserror-impl-2.0.17.sha256sum] = "3ff15c8ecd7de3849db632e14d18d2571fa09dfc5ed93479bc4485c7a517c913"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
-SRC_URI[tinystr-0.8.1.sha256sum] = "5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b"
+SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
 SRC_URI[twofish-0.7.1.sha256sum] = "a78e83a30223c757c3947cd144a31014ff04298d8719ae10d03c31c0448c8013"
-SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
-SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[universal-hash-0.5.1.sha256sum] = "fc1de2c688dc15305988b563c3854064043356019f97a4b46276fe734c4f07ea"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
@@ -478,55 +464,35 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
-SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
-SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
-SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
-SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
-SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
+SRC_URI[wasm-bindgen-0.2.105.sha256sum] = "da95793dfc411fbbd93f5be7715b0578ec61fe87cb1a42b12eb625caa5c5ea60"
+SRC_URI[wasm-bindgen-macro-0.2.105.sha256sum] = "04264334509e04a7bf8690f2384ef5265f05143a4bff3889ab7a3269adab59c2"
+SRC_URI[wasm-bindgen-macro-support-0.2.105.sha256sum] = "420bc339d9f322e562942d52e115d57e950d12d88983a14c79b86859ee6c7ebc"
+SRC_URI[wasm-bindgen-shared-0.2.105.sha256sum] = "76f218a38c84bcb33c25ec7059b07847d465ce0e0a76b995e134a45adcb6af76"
 SRC_URI[win-crypto-ng-0.5.1.sha256sum] = "99abfb435a71e54ab2971d8d8c32f1a7e006cdbf527f71743b1d45b93517bb92"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
+SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-core-0.61.2.sha256sum] = "c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3"
-SRC_URI[windows-implement-0.60.0.sha256sum] = "a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836"
-SRC_URI[windows-interface-0.59.1.sha256sum] = "bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8"
-SRC_URI[windows-link-0.1.3.sha256sum] = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
-SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
-SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
-SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
-SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows-targets-0.53.2.sha256sum] = "c66f69fcc9ce11da9966ddb31a40968cad001c5bedeb5c2b82ede4253ab48aef"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] = "86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] = "c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnu-0.53.0.sha256sum] = "c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] = "9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_i686_msvc-0.53.0.sha256sum] = "581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] = "2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] = "0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] = "271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486"
-SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
-SRC_URI[writeable-0.6.1.sha256sum] = "ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb"
+SRC_URI[windows-core-0.62.2.sha256sum] = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
+SRC_URI[windows-implement-0.60.2.sha256sum] = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
+SRC_URI[windows-interface-0.59.3.sha256sum] = "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-result-0.4.1.sha256sum] = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
+SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[wit-bindgen-0.46.0.sha256sum] = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
+SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[x25519-dalek-2.0.1.sha256sum] = "c7e468321c81fb07fa7f4c636c3972b9100f0346e5b6a9f2bd0603a52f7ed277"
 SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
-SRC_URI[yoke-0.8.0.sha256sum] = "5f41bb01b8226ef4bfd589436a297c53d118f65921786300e427be8d487695cc"
-SRC_URI[yoke-derive-0.8.0.sha256sum] = "38da3c9736e16c5d3c8c597a9aaa5d1fa565d0532ae05e27c24aa62fb32c0ab6"
-SRC_URI[zerocopy-0.8.26.sha256sum] = "1039dd0d3c310cf05de012d8a39ff557cb0d23087fd44cad61df08fc31907a2f"
-SRC_URI[zerocopy-derive-0.8.26.sha256sum] = "9ecf5b4cc5364572d7f4c329661bcc82724222973f2cab6f050a4e5c22f75181"
+SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
+SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
+SRC_URI[zerocopy-0.8.30.sha256sum] = "4ea879c944afe8a2b25fef16bb4ba234f47c694565e97383b36f3a878219065c"
+SRC_URI[zerocopy-derive-0.8.30.sha256sum] = "cf955aa904d6040f70dc8e9384444cb1030aed272ba3cb09bbc4ab9e7c1f34f5"
 SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
 SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
-SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
+SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0"
 SRC_URI[zeroize_derive-1.4.2.sha256sum] = "ce36e65b0d2999d2aafac989fb249189a141aee1f53c612c1f37d72631959f69"
-SRC_URI[zerotrie-0.2.2.sha256sum] = "36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595"
-SRC_URI[zerovec-0.11.2.sha256sum] = "4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350f99f34e338d5fdd294428"
-SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
+SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851"
+SRC_URI[zerovec-0.11.5.sha256sum] = "6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002"
+SRC_URI[zerovec-derive-0.11.2.sha256sum] = "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.0.bb
similarity index 95%
rename from meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
rename to meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.0.bb
index 577acfdc86..a89ae4f2a6 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.0.bb
@@ -14,10 +14,9 @@ inherit pkgconfig rust cargo cargo-update-recipe-crates ptest-cargo
 
 SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
-           file://0001-tests-build-lib-for-symbols-tests-conditionally.patch \
            file://run-ptest \
 "
-SRCREV = "cd090b02119565c6d171fa9a892790c966cf10ef"
+SRCREV = "eb3cd2bfaf42a8806cba5bd060c7458654625c94"
 
 require ${BPN}-crates.inc
 
-- 
2.47.3


