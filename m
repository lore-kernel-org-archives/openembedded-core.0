Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D994DCD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9524.1777739485102215546
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S1x4yzQb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso1143929f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739483; x=1778344283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBHUjE44qQJUd2w5C2f5HDORE/y6n/eKxsMm1GiqlBQ=;
        b=S1x4yzQb0Fo5bSGu2L6STsopPKH+vXcJDMEBonoDlh6Ma7f5eyBoAokGxAFawlj07+
         34fE+IGczuwG9GiPjczX5Pn0/TxLbNB6G7JK7+VQYJkHCNpr1X2ZTX7FqTMG2CYfKPl4
         +WrU7duApLXKd2aMeh+lkPMvkbGlw5wq7M5IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739483; x=1778344283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBHUjE44qQJUd2w5C2f5HDORE/y6n/eKxsMm1GiqlBQ=;
        b=a0xBNMJgPm/WUCJQkuyXxVJK4osTX6rV4r+NBuXF64Z9gpoimfIZup7KPmcY0qJN0J
         AB87yDpG4tAt9PSl2XdmLnUBw601eJt6zlu4eCCBNEK26WkjC5cxm9B4KhbEc/CfQkPb
         JTSGNna7n/MhC/hoE2ciA73PRy0hOfd0hbWlCM12wlhV2Wa14ZCbdgLq1g4fMNesZ/LY
         EyR3Kl4wmxCgeCM5NyvHW4yO4WYFqeUtGWEg2MDQBAeFnFaYoKXE+bHBpFeE415JCTuB
         Af30KlVQCt1uhpYm9yJcuFkvvDCHw80n17INQUgGAgJ9zUjkeA5Qv/lPBBiYvuGG7tOP
         wYrw==
X-Gm-Message-State: AOJu0YxXsO4Vp4EKQ0FARysPRksilR0+4Z2vm/5MNocgXue35O3ilr1D
	CXkM5RhJscmJ/taWqc72JzZuLyYM41/ieGC45L6O9UJvRlDidubcRJqgJLvstfZwwp77SdDohfc
	XkA0wAXUFhp1h3BsM49acWbR4pTYz0/AOLvwDtHSAXDmBDTsMWfcUh/12diInhHGW4FMGkpdCGz
	CoUA3rGVBiNwD+9jk=
X-Gm-Gg: AeBDietBEABHj8t+8uTjNbh5RFMhpm08mJoHV6SYA+xw+s5wZmv7onPNVgepJeGxkxD
	0NAijc7SU1EHbfmzrMKkui85hpis9aBa41bxGjFdvBFdEMu6FgtJVGu29sGkxHeVgSchgHLUqcS
	Nc8TCmoo0XpIC6rJtzicv8ugIeQkD9ADA3hF7VNQnRWkQTwx0X1C61uROZA8450HMpzbikw0/D6
	Tib96M66ODgvyXYpVusg3OsMtxjSLcbNFpIKrSBRS2EtDUzXm/a+uTU8ce5+O5HARQx1yx9vsRz
	pAYqltQ6tiARthVa72yU2jUpuAVoDrqDdir32lDY9CjmRv3jpwAPsV6aSlOnHDwSQKRwo7iiEvK
	hNU5nBnOnmG/9QiRNkDbFH0+ER4iUJclBaYwDmwAoVp1SPwf6LXII8NPeOowJtJiw2KHAMzzg3d
	fvoOHTHfBKJ5bNl2s6/3g2Cp4IWPsDvWnKDO2RnpKJzadeumBWhNziew5IWlVoRK8=
X-Received: by 2002:a05:6000:1869:b0:43d:7d24:b506 with SMTP id ffacd0b85a97d-44bb6e8e21dmr5626930f8f.38.1777739482422;
        Sat, 02 May 2026 09:31:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 54/62] rpm-sequoia: upgrade 1.10.1 -> 1.10.2
Date: Sat,  2 May 2026 17:29:14 +0100
Message-ID: <20260502162929.1377831-54-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236363

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vars-to-force-runtime-paths-in-test.patch |   2 +-
 .../rpm-sequoia/rpm-sequoia-crates.inc        | 212 +++++++++---------
 ...equoia_1.10.1.bb => rpm-sequoia_1.10.2.bb} |   2 +-
 3 files changed, 110 insertions(+), 106 deletions(-)
 rename meta/recipes-devtools/rpm-sequoia/{rpm-sequoia_1.10.1.bb => rpm-sequoia_1.10.2.bb} (98%)

diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch b/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
index 9dbe70bcbf4..b1f1e668cf4 100644
--- a/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
+++ b/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
@@ -1,4 +1,4 @@
-From 55c7c95e47e383af8df5eed88f207eed82be9b52 Mon Sep 17 00:00:00 2001
+From 9b7031f633fe9e269555f4ddd21f023d4d8917c3 Mon Sep 17 00:00:00 2001
 From: Ines KCHELFI <ines.kchelfi@smile.fr>
 Date: Thu, 10 Apr 2025 15:14:11 +0200
 Subject: [PATCH] Use optional env vars to force runtime paths in tests
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
index e6306e658b4..b12f44d8273 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
@@ -7,19 +7,19 @@ SRC_URI += " \
     crate://crates.io/aes-gcm/0.10.3 \
     crate://crates.io/aho-corasick/1.1.4 \
     crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/anstyle/1.0.13 \
-    crate://crates.io/anyhow/1.0.101 \
+    crate://crates.io/anstyle/1.0.14 \
+    crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/argon2/0.5.3 \
     crate://crates.io/ascii-canvas/4.0.0 \
-    crate://crates.io/assert_cmd/2.1.2 \
+    crate://crates.io/assert_cmd/2.2.1 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base16ct/0.2.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/base64ct/1.8.3 \
-    crate://crates.io/bindgen/0.70.1 \
+    crate://crates.io/bindgen/0.72.1 \
     crate://crates.io/bit-set/0.8.0 \
     crate://crates.io/bit-vec/0.8.0 \
-    crate://crates.io/bitflags/2.10.0 \
+    crate://crates.io/bitflags/2.11.1 \
     crate://crates.io/blake2/0.10.6 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block-padding/0.3.3 \
@@ -28,17 +28,17 @@ SRC_URI += " \
     crate://crates.io/botan-sys/0.11.1 \
     crate://crates.io/bstr/1.12.1 \
     crate://crates.io/buffered-reader/1.4.0 \
-    crate://crates.io/bumpalo/3.19.1 \
+    crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/camellia/0.1.0 \
     crate://crates.io/cast5/0.11.1 \
     crate://crates.io/cbc/0.1.2 \
-    crate://crates.io/cc/1.2.56 \
+    crate://crates.io/cc/1.2.61 \
     crate://crates.io/cdylib-link-lines/0.1.5 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfb-mode/0.8.2 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/chrono/0.4.43 \
+    crate://crates.io/chrono/0.4.44 \
     crate://crates.io/cipher/0.4.4 \
     crate://crates.io/clang-sys/1.8.1 \
     crate://crates.io/cmac/0.7.2 \
@@ -69,7 +69,7 @@ SRC_URI += " \
     crate://crates.io/ena/0.14.4 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
-    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/fastrand/2.4.1 \
     crate://crates.io/ff/0.13.1 \
     crate://crates.io/fiat-crypto/0.2.9 \
     crate://crates.io/find-msvc-tools/0.1.9 \
@@ -78,14 +78,15 @@ SRC_URI += " \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/generic-array/1.3.5 \
     crate://crates.io/getrandom/0.2.17 \
     crate://crates.io/getrandom/0.3.4 \
-    crate://crates.io/getrandom/0.4.1 \
+    crate://crates.io/getrandom/0.4.2 \
     crate://crates.io/ghash/0.5.1 \
     crate://crates.io/glob/0.3.3 \
     crate://crates.io/group/0.13.0 \
     crate://crates.io/hashbrown/0.15.5 \
-    crate://crates.io/hashbrown/0.16.1 \
+    crate://crates.io/hashbrown/0.17.0 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hkdf/0.12.4 \
     crate://crates.io/hmac/0.12.1 \
@@ -102,30 +103,30 @@ SRC_URI += " \
     crate://crates.io/idea/0.5.1 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/indexmap/2.13.0 \
+    crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/inout/0.1.4 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
-    crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/js-sys/0.3.85 \
-    crate://crates.io/keccak/0.1.5 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/js-sys/0.3.95 \
+    crate://crates.io/keccak/0.1.6 \
     crate://crates.io/lalrpop/0.22.2 \
     crate://crates.io/lalrpop-util/0.22.2 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.182 \
+    crate://crates.io/libc/0.2.186 \
     crate://crates.io/libloading/0.8.9 \
     crate://crates.io/libm/0.2.16 \
-    crate://crates.io/linux-raw-sys/0.11.0 \
-    crate://crates.io/litemap/0.8.1 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
+    crate://crates.io/litemap/0.8.2 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
     crate://crates.io/md-5/0.10.6 \
     crate://crates.io/memchr/2.8.0 \
     crate://crates.io/memsec/0.7.0 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/nettle/7.4.0 \
-    crate://crates.io/nettle-sys/2.3.1 \
+    crate://crates.io/nettle/7.5.0 \
+    crate://crates.io/nettle-sys/2.3.2 \
     crate://crates.io/new_debug_unreachable/1.0.6 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/num-bigint-dig/0.8.6 \
@@ -133,11 +134,11 @@ SRC_URI += " \
     crate://crates.io/num-iter/0.1.45 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/ocb3/0.1.0 \
-    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/opaque-debug/0.3.1 \
-    crate://crates.io/openssl/0.10.75 \
+    crate://crates.io/openssl/0.10.78 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.111 \
+    crate://crates.io/openssl-sys/0.9.114 \
     crate://crates.io/p256/0.13.2 \
     crate://crates.io/p384/0.13.1 \
     crate://crates.io/p521/0.13.3 \
@@ -149,9 +150,9 @@ SRC_URI += " \
     crate://crates.io/phf_shared/0.11.3 \
     crate://crates.io/pkcs1/0.7.5 \
     crate://crates.io/pkcs8/0.10.2 \
-    crate://crates.io/pkg-config/0.3.32 \
+    crate://crates.io/pkg-config/0.3.33 \
     crate://crates.io/polyval/0.6.2 \
-    crate://crates.io/potential_utf/0.1.4 \
+    crate://crates.io/potential_utf/0.1.5 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/precomputed-hash/0.1.1 \
     crate://crates.io/predicates/3.1.4 \
@@ -160,28 +161,29 @@ SRC_URI += " \
     crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/primeorder/0.13.6 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/quote/1.0.44 \
+    crate://crates.io/quote/1.0.45 \
     crate://crates.io/r-efi/5.3.0 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand/0.9.2 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/rand/0.8.6 \
+    crate://crates.io/rand/0.9.4 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_core/0.9.5 \
     crate://crates.io/redox_syscall/0.5.18 \
     crate://crates.io/regex/1.12.3 \
     crate://crates.io/regex-automata/0.4.14 \
-    crate://crates.io/regex-syntax/0.8.9 \
+    crate://crates.io/regex-syntax/0.8.10 \
     crate://crates.io/rfc6979/0.4.0 \
     crate://crates.io/ripemd/0.1.3 \
     crate://crates.io/rsa/0.9.10 \
-    crate://crates.io/rustc-hash/1.1.0 \
+    crate://crates.io/rustc-hash/2.1.2 \
     crate://crates.io/rustc_version/0.4.1 \
-    crate://crates.io/rustix/1.1.3 \
+    crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/sec1/0.7.3 \
-    crate://crates.io/semver/1.0.27 \
+    crate://crates.io/semver/1.0.28 \
     crate://crates.io/sequoia-openpgp/2.2.0 \
     crate://crates.io/sequoia-policy-config/0.8.1 \
     crate://crates.io/serde/1.0.228 \
@@ -190,7 +192,7 @@ SRC_URI += " \
     crate://crates.io/serde_json/1.0.149 \
     crate://crates.io/sha1collisiondetection/0.3.4 \
     crate://crates.io/sha2/0.10.9 \
-    crate://crates.io/sha3/0.10.8 \
+    crate://crates.io/sha3/0.10.9 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/signature/2.2.0 \
     crate://crates.io/siphasher/1.0.2 \
@@ -200,20 +202,20 @@ SRC_URI += " \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/string_cache/0.8.9 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.115 \
+    crate://crates.io/syn/2.0.117 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tempfile/3.25.0 \
+    crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/term/1.2.1 \
     crate://crates.io/termtree/0.5.1 \
     crate://crates.io/thiserror/1.0.69 \
     crate://crates.io/thiserror/2.0.18 \
     crate://crates.io/thiserror-impl/1.0.69 \
     crate://crates.io/thiserror-impl/2.0.18 \
-    crate://crates.io/tinystr/0.8.2 \
+    crate://crates.io/tinystr/0.8.3 \
     crate://crates.io/toml/0.5.11 \
     crate://crates.io/twofish/0.7.1 \
-    crate://crates.io/typenum/1.19.0 \
-    crate://crates.io/unicode-ident/1.0.23 \
+    crate://crates.io/typenum/1.20.0 \
+    crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/universal-hash/0.5.1 \
     crate://crates.io/utf8_iter/1.0.4 \
@@ -224,10 +226,10 @@ SRC_URI += " \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
     crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
-    crate://crates.io/wasm-bindgen/0.2.108 \
-    crate://crates.io/wasm-bindgen-macro/0.2.108 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.108 \
-    crate://crates.io/wasm-bindgen-shared/0.2.108 \
+    crate://crates.io/wasm-bindgen/0.2.118 \
+    crate://crates.io/wasm-bindgen-macro/0.2.118 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.118 \
+    crate://crates.io/wasm-bindgen-shared/0.2.118 \
     crate://crates.io/wasm-encoder/0.244.0 \
     crate://crates.io/wasm-metadata/0.244.0 \
     crate://crates.io/wasmparser/0.244.0 \
@@ -250,20 +252,20 @@ SRC_URI += " \
     crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
     crate://crates.io/wit-component/0.244.0 \
     crate://crates.io/wit-parser/0.244.0 \
-    crate://crates.io/writeable/0.6.2 \
+    crate://crates.io/writeable/0.6.3 \
     crate://crates.io/x25519-dalek/2.0.1 \
     crate://crates.io/xxhash-rust/0.8.15 \
-    crate://crates.io/yoke/0.8.1 \
-    crate://crates.io/yoke-derive/0.8.1 \
-    crate://crates.io/zerocopy/0.8.39 \
-    crate://crates.io/zerocopy-derive/0.8.39 \
-    crate://crates.io/zerofrom/0.1.6 \
-    crate://crates.io/zerofrom-derive/0.1.6 \
+    crate://crates.io/yoke/0.8.2 \
+    crate://crates.io/yoke-derive/0.8.2 \
+    crate://crates.io/zerocopy/0.8.48 \
+    crate://crates.io/zerocopy-derive/0.8.48 \
+    crate://crates.io/zerofrom/0.1.7 \
+    crate://crates.io/zerofrom-derive/0.1.7 \
     crate://crates.io/zeroize/1.8.2 \
     crate://crates.io/zeroize_derive/1.4.3 \
-    crate://crates.io/zerotrie/0.2.3 \
-    crate://crates.io/zerovec/0.11.5 \
-    crate://crates.io/zerovec-derive/0.11.2 \
+    crate://crates.io/zerotrie/0.2.4 \
+    crate://crates.io/zerovec/0.11.6 \
+    crate://crates.io/zerovec-derive/0.11.3 \
     crate://crates.io/zmij/1.0.21 \
 "
 
@@ -272,19 +274,19 @@ SRC_URI[aes-0.8.4.sha256sum] = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1
 SRC_URI[aes-gcm-0.10.3.sha256sum] = "831010a0f742e1209b3bcea8fab6a8e149051ba6099432c8cb2cc117dec3ead1"
 SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
-SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
-SRC_URI[anyhow-1.0.101.sha256sum] = "5f0e0fee31ef5ed1ba1316088939cea399010ed7731dba877ed44aeb407a75ea"
+SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
+SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[argon2-0.5.3.sha256sum] = "3c3610892ee6e0cbce8ae2700349fcf8f98adb0dbfbee85aec3c9179d29cc072"
 SRC_URI[ascii-canvas-4.0.0.sha256sum] = "ef1e3e699d84ab1b0911a1010c5c106aa34ae89aeac103be5ce0c3859db1e891"
-SRC_URI[assert_cmd-2.1.2.sha256sum] = "9c5bcfa8749ac45dd12cb11055aeeb6b27a3895560d60d71e3c23bf979e60514"
+SRC_URI[assert_cmd-2.2.1.sha256sum] = "39bae1d3fa576f7c6519514180a72559268dd7d1fe104070956cb687bc6673bd"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[base64ct-1.8.3.sha256sum] = "2af50177e190e07a26ab74f8b1efbfe2ef87da2116221318cb1c2e82baf7de06"
-SRC_URI[bindgen-0.70.1.sha256sum] = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
+SRC_URI[bindgen-0.72.1.sha256sum] = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
 SRC_URI[bit-set-0.8.0.sha256sum] = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
 SRC_URI[bit-vec-0.8.0.sha256sum] = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
-SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
+SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
 SRC_URI[blake2-0.10.6.sha256sum] = "46502ad458c9a52b69d4d4d32775c788b7a1b85e8bc9d482d92250fc0e3f8efe"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-padding-0.3.3.sha256sum] = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
@@ -293,17 +295,17 @@ SRC_URI[botan-0.11.1.sha256sum] = "24d4c7647d67c53194fa0740404c6c508880aef2bfe99
 SRC_URI[botan-sys-0.11.1.sha256sum] = "04285fa0c094cc9961fe435b1b279183db9394844ad82ce483aa6196c0e6da38"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[buffered-reader-1.4.0.sha256sum] = "db26bf1f092fd5e05b5ab3be2f290915aeb6f3f20c4e9f86ce0f07f336c2412f"
-SRC_URI[bumpalo-3.19.1.sha256sum] = "5dd9dc738b7a8311c7ade152424974d8115f2cdad61e8dab8dac9f2362298510"
+SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[camellia-0.1.0.sha256sum] = "3264e2574e9ef2b53ce6f536dea83a69ac0bc600b762d1523ff83fe07230ce30"
 SRC_URI[cast5-0.11.1.sha256sum] = "26b07d673db1ccf000e90f54b819db9e75a8348d6eb056e9b8ab53231b7a9911"
 SRC_URI[cbc-0.1.2.sha256sum] = "26b52a9543ae338f279b96b0b9fed9c8093744685043739079ce85cd58f289a6"
-SRC_URI[cc-1.2.56.sha256sum] = "aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2"
+SRC_URI[cc-1.2.61.sha256sum] = "d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d"
 SRC_URI[cdylib-link-lines-0.1.5.sha256sum] = "d98eabef08bbdf5afd0b9c0cabb1ac335f7c70447ef095eed85dffd9628b20bc"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfb-mode-0.8.2.sha256sum] = "738b8d467867f80a71351933f70461f5b56f24d5c93e0cf216e59229c968d330"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[chrono-0.4.43.sha256sum] = "fac4744fb15ae8337dc853fee7fb3f4e48c0fbaa23d0afe49c447b4fab126118"
+SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
 SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
 SRC_URI[cmac-0.7.2.sha256sum] = "8543454e3c3f5126effff9cd44d562af4e31fb8ce1cc0d3dcd8f084515dbc1aa"
@@ -334,7 +336,7 @@ SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b68
 SRC_URI[ena-0.14.4.sha256sum] = "eabffdaee24bd1bf95c5ef7cec31260444317e72ea56c4c91750e8b7ee58d5f1"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
-SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
 SRC_URI[ff-0.13.1.sha256sum] = "c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393"
 SRC_URI[fiat-crypto-0.2.9.sha256sum] = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
@@ -343,14 +345,15 @@ SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cb
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[generic-array-1.3.5.sha256sum] = "eaf57c49a95fd1fe24b90b3033bee6dc7e8f1288d51494cb44e627c295e38542"
 SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
-SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec"
+SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
 SRC_URI[ghash-0.5.1.sha256sum] = "f0d8a4362ccb29cb0b265253fb0a2728f592895ee6854fd9bc13f2ffda266ff1"
 SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
 SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
-SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
+SRC_URI[hashbrown-0.17.0.sha256sum] = "4f467dd6dccf739c208452f8014c75c18bb8301b050ad1cfb27153803edb0f51"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
 SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
@@ -367,30 +370,30 @@ SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928e
 SRC_URI[idea-0.5.1.sha256sum] = "075557004419d7f2031b8bb7f44bb43e55a83ca7b63076a8fb8fe75753836477"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
+SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
-SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[js-sys-0.3.85.sha256sum] = "8c942ebf8e95485ca0d52d97da7c5a2c387d0e7f0ba4c35e93bfcaee045955b3"
-SRC_URI[keccak-0.1.5.sha256sum] = "ecc2af9a1119c51f12a14607e783cb977bde58bc069ff0c3da1095e635d70654"
+SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+SRC_URI[js-sys-0.3.95.sha256sum] = "2964e92d1d9dc3364cae4d718d93f227e3abb088e747d92e0395bfdedf1c12ca"
+SRC_URI[keccak-0.1.6.sha256sum] = "cb26cec98cce3a3d96cbb7bced3c4b16e3d13f27ec56dbd62cbc8f39cfb9d653"
 SRC_URI[lalrpop-0.22.2.sha256sum] = "ba4ebbd48ce411c1d10fb35185f5a51a7bfa3d8b24b4e330d30c9e3a34129501"
 SRC_URI[lalrpop-util-0.22.2.sha256sum] = "b5baa5e9ff84f1aefd264e6869907646538a52147a755d494517a8007fb48733"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.182.sha256sum] = "6800badb6cb2082ffd7b6a67e6125bb39f18782f793520caee8cb8846be06112"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
-SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
-SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
+SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
 SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[memsec-0.7.0.sha256sum] = "c797b9d6bb23aab2fc369c65f871be49214f5c759af65bde26ffaaa2b646b492"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[nettle-7.4.0.sha256sum] = "44e6ff4a94e5d34a1fd5abbd39418074646e2fa51b257198701330f22fcd6936"
-SRC_URI[nettle-sys-2.3.1.sha256sum] = "61a3f5406064d310d59b1a219d3c5c9a49caf4047b6496032e3f930876488c34"
+SRC_URI[nettle-7.5.0.sha256sum] = "2578a3627c28fefb60f1680e20e85f38bd8c8bf98c288b370489a573b0640907"
+SRC_URI[nettle-sys-2.3.2.sha256sum] = "f35502358aa77e598570bbf9a79ad19c4985a1bcd157b5d70197688dafca9b48"
 SRC_URI[new_debug_unreachable-1.0.6.sha256sum] = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[num-bigint-dig-0.8.6.sha256sum] = "e661dda6640fad38e827a6d4a310ff4763082116fe217f279885c97f511bb0b7"
@@ -398,11 +401,11 @@ SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbc
 SRC_URI[num-iter-0.1.45.sha256sum] = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[ocb3-0.1.0.sha256sum] = "c196e0276c471c843dd5777e7543a36a298a4be942a2a688d8111cd43390dedb"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[opaque-debug-0.3.1.sha256sum] = "c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381"
-SRC_URI[openssl-0.10.75.sha256sum] = "08838db121398ad17ab8531ce9de97b244589089e290a384c900cb9ff7434328"
+SRC_URI[openssl-0.10.78.sha256sum] = "f38c4372413cdaaf3cc79dd92d29d7d9f5ab09b51b10dded508fb90bb70b9222"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.111.sha256sum] = "82cab2d520aa75e3c58898289429321eb788c3106963d0dc886ec7a5f4adc321"
+SRC_URI[openssl-sys-0.9.114.sha256sum] = "13ce1245cd07fcc4cfdb438f7507b0c7e4f3849a69fd84d52374c66d83741bb6"
 SRC_URI[p256-0.13.2.sha256sum] = "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
 SRC_URI[p384-0.13.1.sha256sum] = "fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6"
 SRC_URI[p521-0.13.3.sha256sum] = "0fc9e2161f1f215afdfce23677034ae137bbd45016a880c2eb3ba8eb95f085b2"
@@ -414,9 +417,9 @@ SRC_URI[petgraph-0.7.1.sha256sum] = "3672b37090dbd86368a4145bc067582552b29c27377
 SRC_URI[phf_shared-0.11.3.sha256sum] = "67eabc2ef2a60eb7faa00097bd1ffdb5bd28e62bf39990626a582201b7a754e5"
 SRC_URI[pkcs1-0.7.5.sha256sum] = "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
 SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
-SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
+SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
 SRC_URI[polyval-0.6.2.sha256sum] = "9d1fe60d06143b2430aa532c94cfe9e29783047f06c0d7fd359a9a51b729fa25"
-SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
+SRC_URI[potential_utf-0.1.5.sha256sum] = "0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[precomputed-hash-0.1.1.sha256sum] = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
 SRC_URI[predicates-3.1.4.sha256sum] = "ada8f2932f28a27ee7b70dd6c1c39ea0675c55a36879ab92f3a715eaa1e63cfe"
@@ -425,28 +428,29 @@ SRC_URI[predicates-tree-1.0.13.sha256sum] = "d0de1b847b39c8131db0467e9df1ff60e6d
 SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
+SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
-SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
-SRC_URI[rand-0.9.2.sha256sum] = "6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1"
+SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[rand-0.8.6.sha256sum] = "5ca0ecfa931c29007047d1bc58e623ab12e5590e8c7cc53200d5202b69266d8a"
+SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_core-0.9.5.sha256sum] = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
 SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
 SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
-SRC_URI[regex-syntax-0.8.9.sha256sum] = "a96887878f22d7bad8a3b6dc5b7440e0ada9a245242924394987b21cf2210a4c"
+SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
 SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
 SRC_URI[ripemd-0.1.3.sha256sum] = "bd124222d17ad93a644ed9d011a40f4fb64aa54275c08cc216524a9ea82fb09f"
 SRC_URI[rsa-0.9.10.sha256sum] = "b8573f03f5883dcaebdfcf4725caa1ecb9c15b2ef50c43a07b816e06799bb12d"
-SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
+SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
-SRC_URI[rustix-1.1.3.sha256sum] = "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
+SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
-SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
+SRC_URI[semver-1.0.28.sha256sum] = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
 SRC_URI[sequoia-openpgp-2.2.0.sha256sum] = "0620e44a7d514adf7df87b44db235f13b81fed7ddc265adb26f014d42626ac47"
 SRC_URI[sequoia-policy-config-0.8.1.sha256sum] = "c8c2be5e64986e3192d5714c2334fbfb9e22c8cb41d7ad4583847eb590a8cea1"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
@@ -455,7 +459,7 @@ SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6
 SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
 SRC_URI[sha1collisiondetection-0.3.4.sha256sum] = "1f606421e4a6012877e893c399822a4ed4b089164c5969424e1b9d1e66e6964b"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
-SRC_URI[sha3-0.10.8.sha256sum] = "75872d278a8f37ef87fa0ddbda7802605cb18344497949862c0d4dcb291eba60"
+SRC_URI[sha3-0.10.9.sha256sum] = "77fd7028345d415a4034cf8777cd4f8ab1851274233b45f84e3d955502d93874"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
 SRC_URI[siphasher-1.0.2.sha256sum] = "b2aa850e253778c88a04c3d7323b043aeda9d3e30d5971937c1855769763678e"
@@ -465,20 +469,20 @@ SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[string_cache-0.8.9.sha256sum] = "bf776ba3fa74f83bf4b63c3dcbbf82173db2632ed8452cb2d891d33f459de70f"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.115.sha256sum] = "6e614ed320ac28113fa64972c4262d5dbc89deacdfd00c34a3e4cea073243c12"
+SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tempfile-3.25.0.sha256sum] = "0136791f7c95b1f6dd99f9cc786b91bb81c3800b639b3478e561ddb7be95e5f1"
+SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[term-1.2.1.sha256sum] = "d8c27177b12a6399ffc08b98f76f7c9a1f4fe9fc967c784c5a071fa8d93cf7e1"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
 SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
 SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
-SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
+SRC_URI[tinystr-0.8.3.sha256sum] = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
 SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
 SRC_URI[twofish-0.7.1.sha256sum] = "a78e83a30223c757c3947cd144a31014ff04298d8719ae10d03c31c0448c8013"
-SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
-SRC_URI[unicode-ident-1.0.23.sha256sum] = "537dd038a89878be9b64dd4bd1b260315c1bb94f4d784956b81e27a088d9a09e"
+SRC_URI[typenum-1.20.0.sha256sum] = "40ce102ab67701b8526c123c1bab5cbe42d7040ccfd0f64af1a385808d2f43de"
+SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[universal-hash-0.5.1.sha256sum] = "fc1de2c688dc15305988b563c3854064043356019f97a4b46276fe734c4f07ea"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
@@ -489,10 +493,10 @@ SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
 SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
-SRC_URI[wasm-bindgen-0.2.108.sha256sum] = "64024a30ec1e37399cf85a7ffefebdb72205ca1c972291c51512360d90bd8566"
-SRC_URI[wasm-bindgen-macro-0.2.108.sha256sum] = "008b239d9c740232e71bd39e8ef6429d27097518b6b30bdf9086833bd5b6d608"
-SRC_URI[wasm-bindgen-macro-support-0.2.108.sha256sum] = "5256bae2d58f54820e6490f9839c49780dff84c65aeab9e772f15d5f0e913a55"
-SRC_URI[wasm-bindgen-shared-0.2.108.sha256sum] = "1f01b580c9ac74c8d8f0c0e4afb04eeef2acf145458e52c03845ee9cd23e3d12"
+SRC_URI[wasm-bindgen-0.2.118.sha256sum] = "0bf938a0bacb0469e83c1e148908bd7d5a6010354cf4fb73279b7447422e3a89"
+SRC_URI[wasm-bindgen-macro-0.2.118.sha256sum] = "eeff24f84126c0ec2db7a449f0c2ec963c6a49efe0698c4242929da037ca28ed"
+SRC_URI[wasm-bindgen-macro-support-0.2.118.sha256sum] = "9d08065faf983b2b80a79fd87d8254c409281cf7de75fc4b773019824196c904"
+SRC_URI[wasm-bindgen-shared-0.2.118.sha256sum] = "5fd04d9e306f1907bd13c6361b5c6bfc7b3b3c095ed3f8a9246390f8dbdee129"
 SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
 SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
 SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
@@ -515,18 +519,18 @@ SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da
 SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
 SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
 SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
-SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
+SRC_URI[writeable-0.6.3.sha256sum] = "1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4"
 SRC_URI[x25519-dalek-2.0.1.sha256sum] = "c7e468321c81fb07fa7f4c636c3972b9100f0346e5b6a9f2bd0603a52f7ed277"
 SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
-SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
-SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
-SRC_URI[zerocopy-0.8.39.sha256sum] = "db6d35d663eadb6c932438e763b262fe1a70987f9ae936e60158176d710cae4a"
-SRC_URI[zerocopy-derive-0.8.39.sha256sum] = "4122cd3169e94605190e77839c9a40d40ed048d305bfdc146e7df40ab0f3e517"
-SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
-SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
+SRC_URI[yoke-0.8.2.sha256sum] = "abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed36e445a1a48e66f9ca"
+SRC_URI[yoke-derive-0.8.2.sha256sum] = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
+SRC_URI[zerocopy-0.8.48.sha256sum] = "eed437bf9d6692032087e337407a86f04cd8d6a16a37199ed57949d415bd68e9"
+SRC_URI[zerocopy-derive-0.8.48.sha256sum] = "70e3cd084b1788766f53af483dd21f93881ff30d7320490ec3ef7526d203bad4"
+SRC_URI[zerofrom-0.1.7.sha256sum] = "69faa1f2a1ea75661980b013019ed6687ed0e83d069bc1114e2cc74c6c04c4df"
+SRC_URI[zerofrom-derive-0.1.7.sha256sum] = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
 SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0"
 SRC_URI[zeroize_derive-1.4.3.sha256sum] = "85a5b4158499876c763cb03bc4e49185d3cccbabb15b33c627f7884f43db852e"
-SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851"
-SRC_URI[zerovec-0.11.5.sha256sum] = "6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002"
-SRC_URI[zerovec-derive-0.11.2.sha256sum] = "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
+SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
+SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
+SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
 SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.1.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
similarity index 98%
rename from meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.1.bb
rename to meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
index a639e807f75..d190db88b6d 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.1.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=htt
            file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
            file://run-ptest \
 "
-SRCREV = "140fd7eea182d8d58718572f89a85fe3eec29741"
+SRCREV = "401dbd9ae2eca087a82b7c15c0379f878aea02da"
 
 require ${BPN}-crates.inc
 

