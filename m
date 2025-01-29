Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF88CC02194
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 08:09:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8153.1738138160869838139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 00:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jVjmKi2k;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43622267b2eso66593675e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 00:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738138159; x=1738742959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxOWAofMGUt9Hj9a4qj96N7nuazCl4Dd+4eYUrX7+YM=;
        b=jVjmKi2k6ZWhvvErsA+gjdV+rMxsg4EBIeVltIEWRXqEAN3QRmJu5NTvu7dB1bMAho
         joHpTU4zKAU38zc+wsVG5kTtGhHO9HbaG2mNg9UB3/IZLFEGDrNV3Gygi/Ex5Roqj5tO
         mM1RsqtEgBKobYzZpLG/g/9N+gMAgNI6icoxf55dAcxny1B1qpotKC/G+/p4MfhQTzys
         Vll034dKTD9AQr5ZEbnfRxdesp95aieJTLpyoXABox5oOkN7QGX9b2pPOkXqfXRD8HeP
         spkN0VgxoUiLHg7iz4SN9WNqrodehAEDU6LgDxsIekmCAWENvu5pF1g1dpdThI7GcYPu
         xyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138159; x=1738742959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxOWAofMGUt9Hj9a4qj96N7nuazCl4Dd+4eYUrX7+YM=;
        b=OCELY0dfpm0rnf1sTXoluZ+Ah7jQOoqIH2XskhFYH4MvGuvGAqnnQIZF0iZegS4Vd+
         Byvk1o8ryF4R44bwULsrH+iN6xeCMriVUmlkIyr15zPxMG9ZKvtLABTQB4gCNTeDusGI
         h9UkIp9Ri4jng3ijgY/II35NQkyDm7x2l8TjPvKN8zqQLbW7UMKytb1GauKq68HAQOWz
         kkA64LSB9NL8UiFxULaTCu7rjFpIClknDixC8+i95CXCm5v+2AwW1JuIRrtwVweprIM5
         kXPg7ZCSVY5LtotekSJd0YcSAMzivogcvyOZqlYgE4AbQMpvMnBYdeGA9iZW+ZAoG7zo
         Owjg==
X-Gm-Message-State: AOJu0YzLMkpYfCUrzdvlaaECe9tfhYOWdGt+6mDdWozITmJsarXgQFgC
	8Dvh/ZRUziYjFbA38xnOJeKN6cmiLVoWa0FoBWxp4id0R5WxzKY1z1bz7Q==
X-Gm-Gg: ASbGncvvKp+CBX6K7e7lp/mDtU9CcsyH4wzfi8fYGXtoDGHGhJyWpqxEdwM2Ht+uupz
	ryY0zZmG7IP9wCg+AEZ1yBXRYZCvEMpLys8AVfUDeTpkVJsg8xYEYrKpzetHAhn2EwXes75pdLZ
	Qo1yaN8Mc63kna3aTvVmtO9zq8L5XLPILBuRVdTjQDuMdB6dhDizrclHnRsVdzCzn1OesFGfgyd
	rlWAXxICJkRdbRePlsAqENPJbOWu08DBfe7xPuCemIEtPKITj5caLl9sF+HC6d5H7xl9UQdHOeM
	D2EHDz2D1HdKbUJx0aUKa6bGkPdzd0gnRrejCfSrCCb83w==
X-Google-Smtp-Source: AGHT+IGuqAgXNm06KzfwsZgLBzZK5p1dnvGVRoR8UDmwUy7XBti+YoRkDhjBwvZFIT4Tn+0EDHzDhg==
X-Received: by 2002:a5d:5f50:0:b0:386:32ca:aa12 with SMTP id ffacd0b85a97d-38c520bc528mr1803553f8f.49.1738138157838;
        Wed, 29 Jan 2025 00:09:17 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188fd0sm16618394f8f.58.2025.01.29.00.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:09:17 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH 2/3] rpm-sequoia: New recipe for version 1.6.0
Date: Wed, 29 Jan 2025 09:09:01 +0100
Message-ID: <20250129080902.1863054-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129080902.1863054-1-zboszor@gmail.com>
References: <20250129080902.1863054-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210349

rpm 4.20 removed the built-in code to handle signed packages
and uses rpm-sequoia as a more feature complete library.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../rpm-sequoia/rpm-sequoia-crates.inc        |  484 ++++
 ...e-openssl-the-default-signing-crypto.patch |   63 +
 ...e-Cargo.lock-after-the-crypto-change.patch | 2076 +++++++++++++++++
 .../rpm-sequoia/rpm-sequoia_1.6.0.bb          |   40 +
 4 files changed, 2663 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0001-Make-openssl-the-default-signing-crypto.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0002-Update-Cargo.lock-after-the-crypto-change.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
new file mode 100644
index 0000000000..157fd78460
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
@@ -0,0 +1,484 @@
+# Autogenerated with 'bitbake -c update_crates rpm-sequoia'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aead/0.5.2 \
+    crate://crates.io/aes/0.8.4 \
+    crate://crates.io/aes-gcm/0.10.3 \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/android-tzdata/0.1.1 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/anstyle/1.0.10 \
+    crate://crates.io/anyhow/1.0.95 \
+    crate://crates.io/ascii-canvas/3.0.0 \
+    crate://crates.io/assert_cmd/2.0.16 \
+    crate://crates.io/autocfg/1.4.0 \
+    crate://crates.io/base16ct/0.2.0 \
+    crate://crates.io/base64/0.22.1 \
+    crate://crates.io/base64ct/1.6.0 \
+    crate://crates.io/bindgen/0.70.1 \
+    crate://crates.io/bit-set/0.5.3 \
+    crate://crates.io/bit-vec/0.6.3 \
+    crate://crates.io/bitflags/2.8.0 \
+    crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/block-padding/0.3.3 \
+    crate://crates.io/blowfish/0.9.1 \
+    crate://crates.io/bstr/1.11.3 \
+    crate://crates.io/buffered-reader/1.3.2 \
+    crate://crates.io/bumpalo/3.16.0 \
+    crate://crates.io/byteorder/1.5.0 \
+    crate://crates.io/camellia/0.1.0 \
+    crate://crates.io/cast5/0.11.1 \
+    crate://crates.io/cc/1.2.10 \
+    crate://crates.io/cdylib-link-lines/0.1.5 \
+    crate://crates.io/cexpr/0.6.0 \
+    crate://crates.io/cfb-mode/0.8.2 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.39 \
+    crate://crates.io/cipher/0.4.4 \
+    crate://crates.io/clang-sys/1.8.1 \
+    crate://crates.io/cmac/0.7.2 \
+    crate://crates.io/const-oid/0.9.6 \
+    crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/cpufeatures/0.2.17 \
+    crate://crates.io/crunchy/0.2.3 \
+    crate://crates.io/crypto-bigint/0.5.5 \
+    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/ctr/0.9.2 \
+    crate://crates.io/curve25519-dalek/4.1.3 \
+    crate://crates.io/curve25519-dalek-derive/0.1.1 \
+    crate://crates.io/dbl/0.3.2 \
+    crate://crates.io/der/0.7.9 \
+    crate://crates.io/des/0.8.1 \
+    crate://crates.io/difflib/0.4.0 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/dirs-next/2.0.0 \
+    crate://crates.io/dirs-sys-next/0.1.2 \
+    crate://crates.io/displaydoc/0.2.5 \
+    crate://crates.io/doc-comment/0.3.3 \
+    crate://crates.io/dsa/0.6.3 \
+    crate://crates.io/dyn-clone/1.0.17 \
+    crate://crates.io/eax/0.5.0 \
+    crate://crates.io/ecb/0.1.2 \
+    crate://crates.io/ecdsa/0.16.9 \
+    crate://crates.io/ed25519/2.2.3 \
+    crate://crates.io/ed25519-dalek/2.1.1 \
+    crate://crates.io/either/1.13.0 \
+    crate://crates.io/elliptic-curve/0.13.8 \
+    crate://crates.io/ena/0.14.3 \
+    crate://crates.io/equivalent/1.0.1 \
+    crate://crates.io/errno/0.3.10 \
+    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/ff/0.13.0 \
+    crate://crates.io/fiat-crypto/0.2.9 \
+    crate://crates.io/fixedbitset/0.4.2 \
+    crate://crates.io/foreign-types/0.3.2 \
+    crate://crates.io/foreign-types-shared/0.1.1 \
+    crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/generic-array/1.2.0 \
+    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/ghash/0.5.1 \
+    crate://crates.io/glob/0.3.2 \
+    crate://crates.io/group/0.13.0 \
+    crate://crates.io/hashbrown/0.15.2 \
+    crate://crates.io/hkdf/0.12.4 \
+    crate://crates.io/hmac/0.12.1 \
+    crate://crates.io/iana-time-zone/0.1.61 \
+    crate://crates.io/iana-time-zone-haiku/0.1.2 \
+    crate://crates.io/icu_collections/1.5.0 \
+    crate://crates.io/icu_locid/1.5.0 \
+    crate://crates.io/icu_locid_transform/1.5.0 \
+    crate://crates.io/icu_locid_transform_data/1.5.0 \
+    crate://crates.io/icu_normalizer/1.5.0 \
+    crate://crates.io/icu_normalizer_data/1.5.0 \
+    crate://crates.io/icu_properties/1.5.1 \
+    crate://crates.io/icu_properties_data/1.5.0 \
+    crate://crates.io/icu_provider/1.5.0 \
+    crate://crates.io/icu_provider_macros/1.5.0 \
+    crate://crates.io/idea/0.5.1 \
+    crate://crates.io/idna/1.0.3 \
+    crate://crates.io/idna_adapter/1.2.0 \
+    crate://crates.io/indexmap/2.7.1 \
+    crate://crates.io/inout/0.1.3 \
+    crate://crates.io/itertools/0.11.0 \
+    crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/js-sys/0.3.77 \
+    crate://crates.io/lalrpop/0.20.2 \
+    crate://crates.io/lalrpop-util/0.20.2 \
+    crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/libc/0.2.169 \
+    crate://crates.io/libloading/0.8.6 \
+    crate://crates.io/libm/0.2.11 \
+    crate://crates.io/libredox/0.1.3 \
+    crate://crates.io/linux-raw-sys/0.4.15 \
+    crate://crates.io/litemap/0.7.4 \
+    crate://crates.io/lock_api/0.4.12 \
+    crate://crates.io/log/0.4.25 \
+    crate://crates.io/md-5/0.10.6 \
+    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/memsec/0.7.0 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/nettle/7.4.0 \
+    crate://crates.io/nettle-sys/2.3.1 \
+    crate://crates.io/new_debug_unreachable/1.0.6 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/num-bigint-dig/0.8.4 \
+    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-iter/0.1.45 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/once_cell/1.20.2 \
+    crate://crates.io/opaque-debug/0.3.1 \
+    crate://crates.io/openssl/0.10.69 \
+    crate://crates.io/openssl-macros/0.1.1 \
+    crate://crates.io/openssl-sys/0.9.104 \
+    crate://crates.io/p256/0.13.2 \
+    crate://crates.io/p384/0.13.0 \
+    crate://crates.io/p521/0.13.3 \
+    crate://crates.io/parking_lot/0.12.3 \
+    crate://crates.io/parking_lot_core/0.9.10 \
+    crate://crates.io/pem-rfc7468/0.7.0 \
+    crate://crates.io/petgraph/0.6.5 \
+    crate://crates.io/phf_shared/0.10.0 \
+    crate://crates.io/pkcs1/0.7.5 \
+    crate://crates.io/pkcs8/0.10.2 \
+    crate://crates.io/pkg-config/0.3.31 \
+    crate://crates.io/polyval/0.6.2 \
+    crate://crates.io/ppv-lite86/0.2.20 \
+    crate://crates.io/precomputed-hash/0.1.1 \
+    crate://crates.io/predicates/3.1.3 \
+    crate://crates.io/predicates-core/1.0.9 \
+    crate://crates.io/predicates-tree/1.0.12 \
+    crate://crates.io/primeorder/0.13.6 \
+    crate://crates.io/proc-macro2/1.0.93 \
+    crate://crates.io/quote/1.0.38 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/redox_syscall/0.5.8 \
+    crate://crates.io/redox_users/0.4.6 \
+    crate://crates.io/regex/1.11.1 \
+    crate://crates.io/regex-automata/0.4.9 \
+    crate://crates.io/regex-syntax/0.8.5 \
+    crate://crates.io/rfc6979/0.4.0 \
+    crate://crates.io/ripemd/0.1.3 \
+    crate://crates.io/rsa/0.9.7 \
+    crate://crates.io/rustc-hash/1.1.0 \
+    crate://crates.io/rustc_version/0.4.1 \
+    crate://crates.io/rustix/0.38.44 \
+    crate://crates.io/rustversion/1.0.19 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/sec1/0.7.3 \
+    crate://crates.io/semver/1.0.25 \
+    crate://crates.io/sequoia-openpgp/1.22.0 \
+    crate://crates.io/sequoia-policy-config/0.6.0 \
+    crate://crates.io/serde/1.0.217 \
+    crate://crates.io/serde_derive/1.0.217 \
+    crate://crates.io/sha1collisiondetection/0.3.3 \
+    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/signature/2.2.0 \
+    crate://crates.io/siphasher/0.3.11 \
+    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/spin/0.9.8 \
+    crate://crates.io/spki/0.7.3 \
+    crate://crates.io/stable_deref_trait/1.2.0 \
+    crate://crates.io/string_cache/0.8.7 \
+    crate://crates.io/subtle/2.6.1 \
+    crate://crates.io/syn/2.0.96 \
+    crate://crates.io/synstructure/0.13.1 \
+    crate://crates.io/tempfile/3.15.0 \
+    crate://crates.io/term/0.7.0 \
+    crate://crates.io/termtree/0.5.1 \
+    crate://crates.io/thiserror/1.0.69 \
+    crate://crates.io/thiserror-impl/1.0.69 \
+    crate://crates.io/tiny-keccak/2.0.2 \
+    crate://crates.io/tinystr/0.7.6 \
+    crate://crates.io/toml/0.5.11 \
+    crate://crates.io/twofish/0.7.1 \
+    crate://crates.io/typenum/1.17.0 \
+    crate://crates.io/unicode-ident/1.0.16 \
+    crate://crates.io/unicode-xid/0.2.6 \
+    crate://crates.io/universal-hash/0.5.1 \
+    crate://crates.io/utf16_iter/1.0.5 \
+    crate://crates.io/utf8_iter/1.0.4 \
+    crate://crates.io/vcpkg/0.2.15 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/wait-timeout/0.2.0 \
+    crate://crates.io/walkdir/2.5.0 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen/0.2.100 \
+    crate://crates.io/wasm-bindgen-backend/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
+    crate://crates.io/wasm-bindgen-shared/0.2.100 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.9 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-core/0.52.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/write16/1.0.0 \
+    crate://crates.io/writeable/0.5.5 \
+    crate://crates.io/x25519-dalek/2.0.1 \
+    crate://crates.io/xxhash-rust/0.8.15 \
+    crate://crates.io/yoke/0.7.5 \
+    crate://crates.io/yoke-derive/0.7.5 \
+    crate://crates.io/zerocopy/0.7.35 \
+    crate://crates.io/zerocopy-derive/0.7.35 \
+    crate://crates.io/zerofrom/0.1.5 \
+    crate://crates.io/zerofrom-derive/0.1.5 \
+    crate://crates.io/zeroize/1.8.1 \
+    crate://crates.io/zeroize_derive/1.4.2 \
+    crate://crates.io/zerovec/0.10.4 \
+    crate://crates.io/zerovec-derive/0.10.3 \
+"
+
+SRC_URI[aead-0.5.2.sha256sum] = "d122413f284cf2d62fb1b7db97e02edb8cda96d769b16e443a4f6195e35662b0"
+SRC_URI[aes-0.8.4.sha256sum] = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
+SRC_URI[aes-gcm-0.10.3.sha256sum] = "831010a0f742e1209b3bcea8fab6a8e149051ba6099432c8cb2cc117dec3ead1"
+SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
+SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[anstyle-1.0.10.sha256sum] = "55cc3b69f167a1ef2e161439aa98aed94e6028e5f9a59be9a6ffb47aef1651f9"
+SRC_URI[anyhow-1.0.95.sha256sum] = "34ac096ce696dc2fcabef30516bb13c0a68a11d30131d3df6f04711467681b04"
+SRC_URI[ascii-canvas-3.0.0.sha256sum] = "8824ecca2e851cec16968d54a01dd372ef8f95b244fb84b84e70128be347c3c6"
+SRC_URI[assert_cmd-2.0.16.sha256sum] = "dc1835b7f27878de8525dc71410b5a31cdcc5f230aed5ba5df968e09c201b23d"
+SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
+SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
+SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[base64ct-1.6.0.sha256sum] = "8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b"
+SRC_URI[bindgen-0.70.1.sha256sum] = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
+SRC_URI[bit-set-0.5.3.sha256sum] = "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
+SRC_URI[bit-vec-0.6.3.sha256sum] = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
+SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
+SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[block-padding-0.3.3.sha256sum] = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
+SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
+SRC_URI[bstr-1.11.3.sha256sum] = "531a9155a481e2ee699d4f98f43c0ca4ff8ee1bfd55c31e9e98fb29d2b176fe0"
+SRC_URI[buffered-reader-1.3.2.sha256sum] = "fabd1c5e55587a8e8526172d63ad2ba665fa18c8acb39ec9a77af1708c982b9b"
+SRC_URI[bumpalo-3.16.0.sha256sum] = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
+SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
+SRC_URI[camellia-0.1.0.sha256sum] = "3264e2574e9ef2b53ce6f536dea83a69ac0bc600b762d1523ff83fe07230ce30"
+SRC_URI[cast5-0.11.1.sha256sum] = "26b07d673db1ccf000e90f54b819db9e75a8348d6eb056e9b8ab53231b7a9911"
+SRC_URI[cc-1.2.10.sha256sum] = "13208fcbb66eaeffe09b99fffbe1af420f00a7b35aa99ad683dfc1aa76145229"
+SRC_URI[cdylib-link-lines-0.1.5.sha256sum] = "d98eabef08bbdf5afd0b9c0cabb1ac335f7c70447ef095eed85dffd9628b20bc"
+SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
+SRC_URI[cfb-mode-0.8.2.sha256sum] = "738b8d467867f80a71351933f70461f5b56f24d5c93e0cf216e59229c968d330"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[chrono-0.4.39.sha256sum] = "7e36cc9d416881d2e24f9a963be5fb1cd90966419ac844274161d10488b3e825"
+SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
+SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
+SRC_URI[cmac-0.7.2.sha256sum] = "8543454e3c3f5126effff9cd44d562af4e31fb8ce1cc0d3dcd8f084515dbc1aa"
+SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
+SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
+SRC_URI[crunchy-0.2.3.sha256sum] = "43da5946c66ffcc7745f48db692ffbb10a83bfe0afd96235c5c2a4fb23994929"
+SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
+SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+SRC_URI[ctr-0.9.2.sha256sum] = "0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835"
+SRC_URI[curve25519-dalek-4.1.3.sha256sum] = "97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be"
+SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] = "f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
+SRC_URI[dbl-0.3.2.sha256sum] = "bd2735a791158376708f9347fe8faba9667589d82427ef3aed6794a8981de3d9"
+SRC_URI[der-0.7.9.sha256sum] = "f55bf8e7b65898637379c1b74eb1551107c8294ed26d855ceb9fd1a09cfc9bc0"
+SRC_URI[des-0.8.1.sha256sum] = "ffdd80ce8ce993de27e9f063a444a4d53ce8e8db4c1f00cc03af5ad5a9867a1e"
+SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
+SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[dirs-next-2.0.0.sha256sum] = "b98cf8ebf19c3d1b223e151f99a4f9f0690dca41414773390fc824184ac833e1"
+SRC_URI[dirs-sys-next-0.1.2.sha256sum] = "4ebda144c4fe02d1f7ea1a7d9641b6fc6b580adcfa024ae48797ecdeb6825b4d"
+SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
+SRC_URI[doc-comment-0.3.3.sha256sum] = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
+SRC_URI[dsa-0.6.3.sha256sum] = "48bc224a9084ad760195584ce5abb3c2c34a225fa312a128ad245a6b412b7689"
+SRC_URI[dyn-clone-1.0.17.sha256sum] = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
+SRC_URI[eax-0.5.0.sha256sum] = "9954fabd903b82b9d7a68f65f97dc96dd9ad368e40ccc907a7c19d53e6bfac28"
+SRC_URI[ecb-0.1.2.sha256sum] = "1a8bfa975b1aec2145850fcaa1c6fe269a16578c44705a532ae3edc92b8881c7"
+SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
+SRC_URI[ed25519-2.2.3.sha256sum] = "115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53"
+SRC_URI[ed25519-dalek-2.1.1.sha256sum] = "4a3daa8e81a3963a60642bcc1f90a670680bd4a77535faa384e9d1c79d620871"
+SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
+SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
+SRC_URI[ena-0.14.3.sha256sum] = "3d248bdd43ce613d87415282f69b9bb99d947d290b10962dd6c56233312c2ad5"
+SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+SRC_URI[errno-0.3.10.sha256sum] = "33d852cb9b869c2a9b3df2f71a3074817f01e1844f839a144f5fcef059a4eb5d"
+SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[ff-0.13.0.sha256sum] = "ded41244b729663b1e574f1b4fb731469f69f79c17667b5d776b16cda0479449"
+SRC_URI[fiat-crypto-0.2.9.sha256sum] = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
+SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
+SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
+SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
+SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[generic-array-1.2.0.sha256sum] = "e8c8444bc9d71b935156cc0ccab7f622180808af7867b1daae6547d773591703"
+SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[ghash-0.5.1.sha256sum] = "f0d8a4362ccb29cb0b265253fb0a2728f592895ee6854fd9bc13f2ffda266ff1"
+SRC_URI[glob-0.3.2.sha256sum] = "a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2"
+SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
+SRC_URI[hashbrown-0.15.2.sha256sum] = "bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289"
+SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
+SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
+SRC_URI[iana-time-zone-0.1.61.sha256sum] = "235e081f3925a06703c2d0117ea8b91f042756fd6e7a6e5d901e8ca1a996b220"
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
+SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
+SRC_URI[icu_locid-1.5.0.sha256sum] = "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637"
+SRC_URI[icu_locid_transform-1.5.0.sha256sum] = "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e"
+SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] = "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e"
+SRC_URI[icu_normalizer-1.5.0.sha256sum] = "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f"
+SRC_URI[icu_normalizer_data-1.5.0.sha256sum] = "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516"
+SRC_URI[icu_properties-1.5.1.sha256sum] = "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5"
+SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
+SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
+SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
+SRC_URI[idea-0.5.1.sha256sum] = "075557004419d7f2031b8bb7f44bb43e55a83ca7b63076a8fb8fe75753836477"
+SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
+SRC_URI[indexmap-2.7.1.sha256sum] = "8c9c992b02b5b4c94ea26e32fe5bccb7aa7d9f390ab5c1221ff895bc7ea8b652"
+SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
+SRC_URI[itertools-0.11.0.sha256sum] = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
+SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
+SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
+SRC_URI[lalrpop-0.20.2.sha256sum] = "55cb077ad656299f160924eb2912aa147d7339ea7d69e1b5517326fdcec3c1ca"
+SRC_URI[lalrpop-util-0.20.2.sha256sum] = "507460a910eb7b32ee961886ff48539633b788a36b65692b95f225b844c82553"
+SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
+SRC_URI[libc-0.2.169.sha256sum] = "b5aba8db14291edd000dfcc4d620c7ebfb122c613afb886ca8803fa4e128a20a"
+SRC_URI[libloading-0.8.6.sha256sum] = "fc2f4eb4bc735547cfed7c0a4922cbd04a4655978c09b54f1f7b228750664c34"
+SRC_URI[libm-0.2.11.sha256sum] = "8355be11b20d696c8f18f6cc018c4e372165b1fa8126cef092399c9951984ffa"
+SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
+SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
+SRC_URI[litemap-0.7.4.sha256sum] = "4ee93343901ab17bd981295f2cf0026d4ad018c7c31ba84549a4ddbb47a45104"
+SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
+SRC_URI[log-0.4.25.sha256sum] = "04cbf5b083de1c7e0222a7a51dbfdba1cbe1c6ab0b15e29fff3f6c077fd9cd9f"
+SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
+SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[memsec-0.7.0.sha256sum] = "c797b9d6bb23aab2fc369c65f871be49214f5c759af65bde26ffaaa2b646b492"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[nettle-7.4.0.sha256sum] = "44e6ff4a94e5d34a1fd5abbd39418074646e2fa51b257198701330f22fcd6936"
+SRC_URI[nettle-sys-2.3.1.sha256sum] = "61a3f5406064d310d59b1a219d3c5c9a49caf4047b6496032e3f930876488c34"
+SRC_URI[new_debug_unreachable-1.0.6.sha256sum] = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
+SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
+SRC_URI[num-bigint-dig-0.8.4.sha256sum] = "dc84195820f291c7697304f3cbdadd1cb7199c0efc917ff5eafd71225c136151"
+SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-iter-0.1.45.sha256sum] = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
+SRC_URI[opaque-debug-0.3.1.sha256sum] = "c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381"
+SRC_URI[openssl-0.10.69.sha256sum] = "f5e534d133a060a3c19daec1eb3e98ec6f4685978834f2dbadfe2ec215bab64e"
+SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
+SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
+SRC_URI[p256-0.13.2.sha256sum] = "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
+SRC_URI[p384-0.13.0.sha256sum] = "70786f51bcc69f6a4c0360e063a4cac5419ef7c5cd5b3c99ad70f3be5ba79209"
+SRC_URI[p521-0.13.3.sha256sum] = "0fc9e2161f1f215afdfce23677034ae137bbd45016a880c2eb3ba8eb95f085b2"
+SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
+SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
+SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
+SRC_URI[petgraph-0.6.5.sha256sum] = "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
+SRC_URI[phf_shared-0.10.0.sha256sum] = "b6796ad771acdc0123d2a88dc428b5e38ef24456743ddb1744ed628f9815c096"
+SRC_URI[pkcs1-0.7.5.sha256sum] = "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
+SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
+SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
+SRC_URI[polyval-0.6.2.sha256sum] = "9d1fe60d06143b2430aa532c94cfe9e29783047f06c0d7fd359a9a51b729fa25"
+SRC_URI[ppv-lite86-0.2.20.sha256sum] = "77957b295656769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04"
+SRC_URI[precomputed-hash-0.1.1.sha256sum] = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
+SRC_URI[predicates-3.1.3.sha256sum] = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
+SRC_URI[predicates-core-1.0.9.sha256sum] = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
+SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7caee39fc8503f74e7dc0be0531b425c"
+SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
+SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
+SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[redox_syscall-0.5.8.sha256sum] = "03a862b389f93e68874fbf580b9de08dd02facb9a788ebadaf4a3fd33cf58834"
+SRC_URI[redox_users-0.4.6.sha256sum] = "ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43"
+SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
+SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
+SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
+SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
+SRC_URI[ripemd-0.1.3.sha256sum] = "bd124222d17ad93a644ed9d011a40f4fb64aa54275c08cc216524a9ea82fb09f"
+SRC_URI[rsa-0.9.7.sha256sum] = "47c75d7c5c6b673e58bf54d8544a9f432e3a925b0e80f7cd3602ab5c50c55519"
+SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
+SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
+SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
+SRC_URI[rustversion-1.0.19.sha256sum] = "f7c45b9784283f1b2e7fb61b42047c2fd678ef0960d4f6f1eba131594cc369d4"
+SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
+SRC_URI[semver-1.0.25.sha256sum] = "f79dfe2d285b0488816f30e700a7438c5a73d816b5b7d3ac72fbc48b0d185e03"
+SRC_URI[sequoia-openpgp-1.22.0.sha256sum] = "e858e4e9e48ff079cede92e1b45c942a5466ce9a4e3cc0c2a7e66586a718ef59"
+SRC_URI[sequoia-policy-config-0.6.0.sha256sum] = "757d45d308f2bd9c0d6fdd640f320998ad24856bdf2890ddd28d3c3b85808274"
+SRC_URI[serde-1.0.217.sha256sum] = "02fc4265df13d6fa1d00ecff087228cc0a2b5f3c0e87e258d8b94a156e984c70"
+SRC_URI[serde_derive-1.0.217.sha256sum] = "5a9bf7cf98d04a2b28aead066b7496853d4779c9cc183c440dbac457641e19a0"
+SRC_URI[sha1collisiondetection-0.3.3.sha256sum] = "f1d5c4be690002e8a5d7638b0b7323f03c268c7a919bd8af69ce963a4dc83220"
+SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
+SRC_URI[siphasher-0.3.11.sha256sum] = "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
+SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
+SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
+SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
+SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
+SRC_URI[string_cache-0.8.7.sha256sum] = "f91138e76242f575eb1d3b38b4f1362f10d3a43f47d182a5b359af488a02293b"
+SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
+SRC_URI[syn-2.0.96.sha256sum] = "d5d0adab1ae378d7f53bdebc67a39f1f151407ef230f0ce2883572f5d8985c80"
+SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
+SRC_URI[tempfile-3.15.0.sha256sum] = "9a8a559c81686f576e8cd0290cd2a24a2a9ad80c98b3478856500fcbd7acd704"
+SRC_URI[term-0.7.0.sha256sum] = "c59df8ac95d96ff9bede18eb7300b0fda5e5d8d90960e76f8e14ae765eedbf1f"
+SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
+SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
+SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
+SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
+SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
+SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
+SRC_URI[twofish-0.7.1.sha256sum] = "a78e83a30223c757c3947cd144a31014ff04298d8719ae10d03c31c0448c8013"
+SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
+SRC_URI[unicode-ident-1.0.16.sha256sum] = "a210d160f08b701c8721ba1c726c11662f877ea6b7094007e1ca9a1041945034"
+SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
+SRC_URI[universal-hash-0.5.1.sha256sum] = "fc1de2c688dc15305988b563c3854064043356019f97a4b46276fe734c4f07ea"
+SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
+SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
+SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
+SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
+SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
+SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
+SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
+SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
+SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-core-0.52.0.sha256sum] = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
+SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
+SRC_URI[x25519-dalek-2.0.1.sha256sum] = "c7e468321c81fb07fa7f4c636c3972b9100f0346e5b6a9f2bd0603a52f7ed277"
+SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
+SRC_URI[yoke-0.7.5.sha256sum] = "120e6aef9aa629e3d4f52dc8cc43a015c7724194c97dfaf45180d2daf2b77f40"
+SRC_URI[yoke-derive-0.7.5.sha256sum] = "2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e229154"
+SRC_URI[zerocopy-0.7.35.sha256sum] = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
+SRC_URI[zerocopy-derive-0.7.35.sha256sum] = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
+SRC_URI[zerofrom-0.1.5.sha256sum] = "cff3ee08c995dee1859d998dea82f7374f2826091dd9cd47def953cae446cd2e"
+SRC_URI[zerofrom-derive-0.1.5.sha256sum] = "595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f295808"
+SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
+SRC_URI[zeroize_derive-1.4.2.sha256sum] = "ce36e65b0d2999d2aafac989fb249189a141aee1f53c612c1f37d72631959f69"
+SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
+SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0001-Make-openssl-the-default-signing-crypto.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0001-Make-openssl-the-default-signing-crypto.patch
new file mode 100644
index 0000000000..fc989b0b09
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0001-Make-openssl-the-default-signing-crypto.patch
@@ -0,0 +1,63 @@
+From ae82f60d7f9dcb81469148b2fef6b3e9d9686315 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 29 Jan 2025 08:41:53 +0100
+Subject: [PATCH 1/2] Make openssl the default signing crypto
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Idea taken from the Fedora 41 rpm specfile, extended to build.rs
+to make it actually build. Give credit where credit is due: the
+Cargo.toml part of this patch is identical to the Fedora version.
+
+Signed-off-by: Fabio Valentini <decathorpe@gmail.com>
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [Yocto specific]
+---
+ Cargo.toml | 5 +----
+ build.rs   | 8 +-------
+ 2 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index 7832878..1024cad 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -43,11 +43,8 @@ crate-type = ["cdylib"]
+ 
+ # We explicitly do not want to enable Sequoia's decompression support.
+ # Hence we only select a crypto backend.
+-default = ["crypto-nettle"]
++default = ["crypto-openssl"]
+ crypto-nettle = ["sequoia-openpgp/crypto-nettle"]
+ crypto-rust = ["sequoia-openpgp/crypto-rust"]
+-crypto-cng = ["sequoia-openpgp/crypto-cng"]
+ crypto-openssl = ["sequoia-openpgp/crypto-openssl"]
+-crypto-botan = ["sequoia-openpgp/crypto-botan"]
+-crypto-botan2 = ["sequoia-openpgp/crypto-botan2"]
+ 
+diff --git a/build.rs b/build.rs
+index 1fdef4e..cdbbe88 100644
+--- a/build.rs
++++ b/build.rs
+@@ -30,16 +30,10 @@ impl PkgConfigTemplate {
+             ("VERSION".to_string(), env!("CARGO_PKG_VERSION").to_string()),
+             ("HOMEPAGE".to_string(), env!("CARGO_PKG_HOMEPAGE").to_string()),
+             ("REQUIRES".to_string(),
+-             if cfg!(feature = "crypto-botan") {
+-                 "botan-3"
+-             } else if cfg!(feature = "crypto-botan2") {
+-                 "botan-2"
+-             } else if cfg!(feature = "crypto-nettle") {
++             if cfg!(feature = "crypto-nettle") {
+                  "nettle"
+              } else if cfg!(feature = "crypto-openssl") {
+                  "libssl"
+-             } else if cfg!(feature = "crypto-cng") {
+-                 ""
+              } else if cfg!(feature = "crypto-rust") {
+                  ""
+              } else {
+-- 
+2.48.1
+
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0002-Update-Cargo.lock-after-the-crypto-change.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0002-Update-Cargo.lock-after-the-crypto-change.patch
new file mode 100644
index 0000000000..7ccd981eeb
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/0002-Update-Cargo.lock-after-the-crypto-change.patch
@@ -0,0 +1,2076 @@
+From 2dec135affcca06b8bab3360a865af20342112eb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 29 Jan 2025 08:44:53 +0100
+Subject: [PATCH 2/2] Update Cargo.lock after the crypto change
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [Yocto specific]
+---
+ Cargo.lock | 1049 +++++++++++++++++++++++++++++++---------------------
+ 1 file changed, 618 insertions(+), 431 deletions(-)
+
+diff --git a/Cargo.lock b/Cargo.lock
+index 7e3839b..434309a 100644
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -9,14 +9,14 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "d122413f284cf2d62fb1b7db97e02edb8cda96d769b16e443a4f6195e35662b0"
+ dependencies = [
+  "crypto-common",
+- "generic-array",
++ "generic-array 0.14.7",
+ ]
+ 
+ [[package]]
+ name = "aes"
+-version = "0.8.3"
++version = "0.8.4"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "ac1f845298e95f983ff1944b728ae08b8cebab80d684f0a832ed0fc74dfa27e2"
++checksum = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
+ dependencies = [
+  "cfg-if",
+  "cipher",
+@@ -40,9 +40,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "aho-corasick"
+-version = "1.1.2"
++version = "1.1.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
++checksum = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+ dependencies = [
+  "memchr",
+ ]
+@@ -64,15 +64,15 @@ dependencies = [
+ 
+ [[package]]
+ name = "anstyle"
+-version = "1.0.4"
++version = "1.0.10"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "7079075b41f533b8c61d2a4d073c4676e1f8b249ff94a393b0595db304e0dd87"
++checksum = "55cc3b69f167a1ef2e161439aa98aed94e6028e5f9a59be9a6ffb47aef1651f9"
+ 
+ [[package]]
+ name = "anyhow"
+-version = "1.0.79"
++version = "1.0.95"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "080e9890a082662b09c1ad45f567faeeb47f22b5fb23895fbe1e651e718e25ca"
++checksum = "34ac096ce696dc2fcabef30516bb13c0a68a11d30131d3df6f04711467681b04"
+ 
+ [[package]]
+ name = "ascii-canvas"
+@@ -85,13 +85,14 @@ dependencies = [
+ 
+ [[package]]
+ name = "assert_cmd"
+-version = "2.0.13"
++version = "2.0.16"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "00ad3f3a942eee60335ab4342358c161ee296829e0d16ff42fc1d6cb07815467"
++checksum = "dc1835b7f27878de8525dc71410b5a31cdcc5f230aed5ba5df968e09c201b23d"
+ dependencies = [
+  "anstyle",
+  "bstr",
+  "doc-comment",
++ "libc",
+  "predicates",
+  "predicates-core",
+  "predicates-tree",
+@@ -100,9 +101,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "autocfg"
+-version = "1.1.0"
++version = "1.4.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
++checksum = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
+ 
+ [[package]]
+ name = "base16ct"
+@@ -112,9 +113,9 @@ checksum = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
+ 
+ [[package]]
+ name = "base64"
+-version = "0.21.7"
++version = "0.22.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
++checksum = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+ 
+ [[package]]
+ name = "base64ct"
+@@ -124,16 +125,14 @@ checksum = "8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b"
+ 
+ [[package]]
+ name = "bindgen"
+-version = "0.68.1"
++version = "0.70.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "726e4313eb6ec35d2730258ad4e15b547ee75d6afaa1361a922e78e59b7d8078"
++checksum = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
+ dependencies = [
+- "bitflags 2.4.2",
++ "bitflags",
+  "cexpr",
+  "clang-sys",
+- "lazy_static",
+- "lazycell",
+- "peeking_take_while",
++ "itertools 0.13.0",
+  "proc-macro2",
+  "quote",
+  "regex",
+@@ -159,15 +158,9 @@ checksum = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
+ 
+ [[package]]
+ name = "bitflags"
+-version = "1.3.2"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+-
+-[[package]]
+-name = "bitflags"
+-version = "2.4.2"
++version = "2.8.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
++checksum = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
+ 
+ [[package]]
+ name = "block-buffer"
+@@ -175,7 +168,7 @@ version = "0.10.4"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+ dependencies = [
+- "generic-array",
++ "generic-array 0.14.7",
+ ]
+ 
+ [[package]]
+@@ -184,7 +177,7 @@ version = "0.3.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
+ dependencies = [
+- "generic-array",
++ "generic-array 0.14.7",
+ ]
+ 
+ [[package]]
+@@ -197,26 +190,11 @@ dependencies = [
+  "cipher",
+ ]
+ 
+-[[package]]
+-name = "botan"
+-version = "0.10.7"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "350081af1a3c6883f8a1f863ac553bfe6922589aad60008a70947765ed57c53e"
+-dependencies = [
+- "botan-sys",
+-]
+-
+-[[package]]
+-name = "botan-sys"
+-version = "0.10.5"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "9f49dde1b8ebd2996cc41c55c39f6ef8b54e38148d8973aeba0792b87b1621ca"
+-
+ [[package]]
+ name = "bstr"
+-version = "1.9.0"
++version = "1.11.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "c48f0051a4b4c5e0b6d365cd04af53aeaa209e3cc15ec2cdb69e73cc87fbd0dc"
++checksum = "531a9155a481e2ee699d4f98f43c0ca4ff8ee1bfd55c31e9e98fb29d2b176fe0"
+ dependencies = [
+  "memchr",
+  "regex-automata",
+@@ -225,9 +203,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "buffered-reader"
+-version = "1.3.0"
++version = "1.3.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "2b9b0a25eb06e83579bc985d836e1e3b957a7201301b48538764d2b2e78090d4"
++checksum = "fabd1c5e55587a8e8526172d63ad2ba665fa18c8acb39ec9a77af1708c982b9b"
+ dependencies = [
+  "lazy_static",
+  "libc",
+@@ -235,9 +213,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "bumpalo"
+-version = "3.14.0"
++version = "3.16.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec"
++checksum = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
+ 
+ [[package]]
+ name = "byteorder"
+@@ -266,23 +244,18 @@ dependencies = [
+ 
+ [[package]]
+ name = "cc"
+-version = "1.0.83"
++version = "1.2.10"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
++checksum = "13208fcbb66eaeffe09b99fffbe1af420f00a7b35aa99ad683dfc1aa76145229"
+ dependencies = [
+- "libc",
++ "shlex",
+ ]
+ 
+ [[package]]
+ name = "cdylib-link-lines"
+-version = "0.1.4"
++version = "0.1.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "a317db7ea5b455731e51d7f632762716fa5c0b1098dcaa6221e55e2386d170f2"
+-dependencies = [
+- "serde",
+- "serde_derive",
+- "toml",
+-]
++checksum = "d98eabef08bbdf5afd0b9c0cabb1ac335f7c70447ef095eed85dffd9628b20bc"
+ 
+ [[package]]
+ name = "cexpr"
+@@ -310,16 +283,16 @@ checksum = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+ 
+ [[package]]
+ name = "chrono"
+-version = "0.4.32"
++version = "0.4.39"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "41daef31d7a747c5c847246f36de49ced6f7403b4cdabc807a97b5cc184cda7a"
++checksum = "7e36cc9d416881d2e24f9a963be5fb1cd90966419ac844274161d10488b3e825"
+ dependencies = [
+  "android-tzdata",
+  "iana-time-zone",
+  "js-sys",
+  "num-traits",
+  "wasm-bindgen",
+- "windows-targets 0.52.0",
++ "windows-targets",
+ ]
+ 
+ [[package]]
+@@ -335,9 +308,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "clang-sys"
+-version = "1.7.0"
++version = "1.8.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "67523a3b4be3ce1989d607a828d036249522dd9c1c8de7f4dd2dae43a37369d1"
++checksum = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
+ dependencies = [
+  "glob",
+  "libc",
+@@ -363,24 +336,24 @@ checksum = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
+ 
+ [[package]]
+ name = "core-foundation-sys"
+-version = "0.8.6"
++version = "0.8.7"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
++checksum = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
+ 
+ [[package]]
+ name = "cpufeatures"
+-version = "0.2.12"
++version = "0.2.17"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
++checksum = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
+ dependencies = [
+  "libc",
+ ]
+ 
+ [[package]]
+ name = "crunchy"
+-version = "0.2.2"
++version = "0.2.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
++checksum = "43da5946c66ffcc7745f48db692ffbb10a83bfe0afd96235c5c2a4fb23994929"
+ 
+ [[package]]
+ name = "crypto-bigint"
+@@ -388,7 +361,7 @@ version = "0.5.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
+ dependencies = [
+- "generic-array",
++ "generic-array 0.14.7",
+  "rand_core",
+  "subtle",
+  "zeroize",
+@@ -400,7 +373,7 @@ version = "0.1.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+ dependencies = [
+- "generic-array",
++ "generic-array 0.14.7",
+  "rand_core",
+  "typenum",
+ ]
+@@ -416,16 +389,15 @@ dependencies = [
+ 
+ [[package]]
+ name = "curve25519-dalek"
+-version = "4.1.1"
++version = "4.1.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "e89b8c6a2e4b1f45971ad09761aafb85514a84744b67a95e32c3cc1352d1f65c"
++checksum = "97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be"
+ dependencies = [
+  "cfg-if",
+  "cpufeatures",
+  "curve25519-dalek-derive",
+  "digest",
+  "fiat-crypto",
+- "platforms",
+  "rustc_version",
+  "subtle",
+  "zeroize",
+@@ -448,14 +420,14 @@ version = "0.3.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "bd2735a791158376708f9347fe8faba9667589d82427ef3aed6794a8981de3d9"
+ dependencies = [
+- "generic-array",
++ "generic-array 0.14.7",
+ ]
+ 
+ [[package]]
+ name = "der"
+-version = "0.7.8"
++version = "0.7.9"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "fffa369a668c8af7dbf8b5e56c9f744fbd399949ed171606040001947de40b1c"
++checksum = "f55bf8e7b65898637379c1b74eb1551107c8294ed26d855ceb9fd1a09cfc9bc0"
+ dependencies = [
+  "const-oid",
+  "pem-rfc7468",
+@@ -471,12 +443,6 @@ dependencies = [
+  "cipher",
+ ]
+ 
+-[[package]]
+-name = "diff"
+-version = "0.1.13"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
+-
+ [[package]]
+ name = "difflib"
+ version = "0.4.0"
+@@ -516,6 +482,17 @@ dependencies = [
+  "winapi",
+ ]
+ 
++[[package]]
++name = "displaydoc"
++version = "0.2.5"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
++dependencies = [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
++
+ [[package]]
+ name = "doc-comment"
+ version = "0.3.3"
+@@ -524,9 +501,9 @@ checksum = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
+ 
+ [[package]]
+ name = "dsa"
+-version = "0.6.2"
++version = "0.6.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "d88afbb2443ba68ef8593de497e830b2e276434e1408f85cd760b1107b44ead0"
++checksum = "48bc224a9084ad760195584ce5abb3c2c34a225fa312a128ad245a6b412b7689"
+ dependencies = [
+  "digest",
+  "num-bigint-dig",
+@@ -540,9 +517,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "dyn-clone"
+-version = "1.0.16"
++version = "1.0.17"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "545b22097d44f8a9581187cdf93de7a71e4722bf51200cfaba810865b49a495d"
++checksum = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
+ 
+ [[package]]
+ name = "eax"
+@@ -592,9 +569,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "ed25519-dalek"
+-version = "2.1.0"
++version = "2.1.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "1f628eaec48bfd21b865dc2950cfa014450c01d2fa2b69a86c2fd5844ec523c0"
++checksum = "4a3daa8e81a3963a60642bcc1f90a670680bd4a77535faa384e9d1c79d620871"
+ dependencies = [
+  "curve25519-dalek",
+  "ed25519",
+@@ -607,9 +584,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "either"
+-version = "1.9.0"
++version = "1.13.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
++checksum = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
+ 
+ [[package]]
+ name = "elliptic-curve"
+@@ -621,7 +598,7 @@ dependencies = [
+  "crypto-bigint",
+  "digest",
+  "ff",
+- "generic-array",
++ "generic-array 0.14.7",
+  "group",
+  "hkdf",
+  "pem-rfc7468",
+@@ -634,9 +611,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "ena"
+-version = "0.14.2"
++version = "0.14.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "c533630cf40e9caa44bd91aadc88a75d75a4c3a12b4cfde353cbed41daa1e1f1"
++checksum = "3d248bdd43ce613d87415282f69b9bb99d947d290b10962dd6c56233312c2ad5"
+ dependencies = [
+  "log",
+ ]
+@@ -649,19 +626,19 @@ checksum = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+ 
+ [[package]]
+ name = "errno"
+-version = "0.3.8"
++version = "0.3.10"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
++checksum = "33d852cb9b869c2a9b3df2f71a3074817f01e1844f839a144f5fcef059a4eb5d"
+ dependencies = [
+  "libc",
+- "windows-sys 0.52.0",
++ "windows-sys",
+ ]
+ 
+ [[package]]
+ name = "fastrand"
+-version = "2.0.1"
++version = "2.3.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
++checksum = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+ 
+ [[package]]
+ name = "ff"
+@@ -675,9 +652,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "fiat-crypto"
+-version = "0.2.5"
++version = "0.2.9"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "27573eac26f4dd11e2b1916c3fe1baa56407c83c71a773a8ba17ec0bca03b6b7"
++checksum = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
+ 
+ [[package]]
+ name = "fixedbitset"
+@@ -711,11 +688,20 @@ dependencies = [
+  "zeroize",
+ ]
+ 
++[[package]]
++name = "generic-array"
++version = "1.2.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "e8c8444bc9d71b935156cc0ccab7f622180808af7867b1daae6547d773591703"
++dependencies = [
++ "typenum",
++]
++
+ [[package]]
+ name = "getrandom"
+-version = "0.2.12"
++version = "0.2.15"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5"
++checksum = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+ dependencies = [
+  "cfg-if",
+  "js-sys",
+@@ -726,9 +712,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "ghash"
+-version = "0.5.0"
++version = "0.5.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "d930750de5717d2dd0b8c0d42c076c0e884c81a73e6cab859bbd2339c71e3e40"
++checksum = "f0d8a4362ccb29cb0b265253fb0a2728f592895ee6854fd9bc13f2ffda266ff1"
+ dependencies = [
+  "opaque-debug",
+  "polyval",
+@@ -736,9 +722,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "glob"
+-version = "0.3.1"
++version = "0.3.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
++checksum = "a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2"
+ 
+ [[package]]
+ name = "group"
+@@ -753,15 +739,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "hashbrown"
+-version = "0.14.3"
++version = "0.15.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
+-
+-[[package]]
+-name = "hermit-abi"
+-version = "0.3.4"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "5d3d0e0f38255e7fa3cf31335b3a56f05febd18025f4db5ef7a0cfb4f8da651f"
++checksum = "bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289"
+ 
+ [[package]]
+ name = "hkdf"
+@@ -783,9 +763,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "iana-time-zone"
+-version = "0.1.59"
++version = "0.1.61"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b6a67363e2aa4443928ce15e57ebae94fd8949958fd1223c4cfc0cd473ad7539"
++checksum = "235e081f3925a06703c2d0117ea8b91f042756fd6e7a6e5d901e8ca1a996b220"
+ dependencies = [
+  "android_system_properties",
+  "core-foundation-sys",
+@@ -804,6 +784,124 @@ dependencies = [
+  "cc",
+ ]
+ 
++[[package]]
++name = "icu_collections"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
++dependencies = [
++ "displaydoc",
++ "yoke",
++ "zerofrom",
++ "zerovec",
++]
++
++[[package]]
++name = "icu_locid"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637"
++dependencies = [
++ "displaydoc",
++ "litemap",
++ "tinystr",
++ "writeable",
++ "zerovec",
++]
++
++[[package]]
++name = "icu_locid_transform"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e"
++dependencies = [
++ "displaydoc",
++ "icu_locid",
++ "icu_locid_transform_data",
++ "icu_provider",
++ "tinystr",
++ "zerovec",
++]
++
++[[package]]
++name = "icu_locid_transform_data"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e"
++
++[[package]]
++name = "icu_normalizer"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f"
++dependencies = [
++ "displaydoc",
++ "icu_collections",
++ "icu_normalizer_data",
++ "icu_properties",
++ "icu_provider",
++ "smallvec",
++ "utf16_iter",
++ "utf8_iter",
++ "write16",
++ "zerovec",
++]
++
++[[package]]
++name = "icu_normalizer_data"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516"
++
++[[package]]
++name = "icu_properties"
++version = "1.5.1"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5"
++dependencies = [
++ "displaydoc",
++ "icu_collections",
++ "icu_locid_transform",
++ "icu_properties_data",
++ "icu_provider",
++ "tinystr",
++ "zerovec",
++]
++
++[[package]]
++name = "icu_properties_data"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
++
++[[package]]
++name = "icu_provider"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
++dependencies = [
++ "displaydoc",
++ "icu_locid",
++ "icu_provider_macros",
++ "stable_deref_trait",
++ "tinystr",
++ "writeable",
++ "yoke",
++ "zerofrom",
++ "zerovec",
++]
++
++[[package]]
++name = "icu_provider_macros"
++version = "1.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
++dependencies = [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
++
+ [[package]]
+ name = "idea"
+ version = "0.5.1"
+@@ -815,19 +913,30 @@ dependencies = [
+ 
+ [[package]]
+ name = "idna"
+-version = "0.4.0"
++version = "1.0.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c"
++checksum = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+ dependencies = [
+- "unicode-bidi",
+- "unicode-normalization",
++ "idna_adapter",
++ "smallvec",
++ "utf8_iter",
++]
++
++[[package]]
++name = "idna_adapter"
++version = "1.2.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
++dependencies = [
++ "icu_normalizer",
++ "icu_properties",
+ ]
+ 
+ [[package]]
+ name = "indexmap"
+-version = "2.1.0"
++version = "2.7.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "d530e1a18b1cb4c484e6e34556a0d948706958449fca0cab753d649f2bce3d1f"
++checksum = "8c9c992b02b5b4c94ea26e32fe5bccb7aa7d9f390ab5c1221ff895bc7ea8b652"
+ dependencies = [
+  "equivalent",
+  "hashbrown",
+@@ -840,125 +949,125 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
+ dependencies = [
+  "block-padding",
+- "generic-array",
++ "generic-array 0.14.7",
+ ]
+ 
+ [[package]]
+-name = "is-terminal"
+-version = "0.4.10"
++name = "itertools"
++version = "0.11.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "0bad00257d07be169d870ab665980b06cdb366d792ad690bf2e76876dc503455"
++checksum = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
+ dependencies = [
+- "hermit-abi",
+- "rustix",
+- "windows-sys 0.52.0",
++ "either",
+ ]
+ 
+ [[package]]
+ name = "itertools"
+-version = "0.10.5"
++version = "0.13.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
++checksum = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
+ dependencies = [
+  "either",
+ ]
+ 
+ [[package]]
+ name = "js-sys"
+-version = "0.3.67"
++version = "0.3.77"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "9a1d36f1235bc969acba30b7f5990b864423a6068a10f7c90ae8f0112e3a59d1"
++checksum = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
+ dependencies = [
++ "once_cell",
+  "wasm-bindgen",
+ ]
+ 
+ [[package]]
+ name = "lalrpop"
+-version = "0.20.0"
++version = "0.20.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "da4081d44f4611b66c6dd725e6de3169f9f63905421e8626fcb86b6a898998b8"
++checksum = "55cb077ad656299f160924eb2912aa147d7339ea7d69e1b5517326fdcec3c1ca"
+ dependencies = [
+  "ascii-canvas",
+  "bit-set",
+- "diff",
+  "ena",
+- "is-terminal",
+- "itertools",
++ "itertools 0.11.0",
+  "lalrpop-util",
+  "petgraph",
+  "regex",
+- "regex-syntax 0.7.5",
++ "regex-syntax",
+  "string_cache",
+  "term",
+  "tiny-keccak",
+  "unicode-xid",
++ "walkdir",
+ ]
+ 
+ [[package]]
+ name = "lalrpop-util"
+-version = "0.20.0"
++version = "0.20.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3f35c735096c0293d313e8f2a641627472b83d01b937177fe76e5e2708d31e0d"
++checksum = "507460a910eb7b32ee961886ff48539633b788a36b65692b95f225b844c82553"
++dependencies = [
++ "regex-automata",
++]
+ 
+ [[package]]
+ name = "lazy_static"
+-version = "1.4.0"
++version = "1.5.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
++checksum = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
+ dependencies = [
+  "spin",
+ ]
+ 
+-[[package]]
+-name = "lazycell"
+-version = "1.3.0"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
+-
+ [[package]]
+ name = "libc"
+-version = "0.2.152"
++version = "0.2.169"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
++checksum = "b5aba8db14291edd000dfcc4d620c7ebfb122c613afb886ca8803fa4e128a20a"
+ 
+ [[package]]
+ name = "libloading"
+-version = "0.8.1"
++version = "0.8.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "c571b676ddfc9a8c12f1f3d3085a7b163966a8fd8098a90640953ce5f6170161"
++checksum = "fc2f4eb4bc735547cfed7c0a4922cbd04a4655978c09b54f1f7b228750664c34"
+ dependencies = [
+  "cfg-if",
+- "windows-sys 0.48.0",
++ "windows-targets",
+ ]
+ 
+ [[package]]
+ name = "libm"
+-version = "0.2.8"
++version = "0.2.11"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
++checksum = "8355be11b20d696c8f18f6cc018c4e372165b1fa8126cef092399c9951984ffa"
+ 
+ [[package]]
+ name = "libredox"
+-version = "0.0.1"
++version = "0.1.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "85c833ca1e66078851dba29046874e38f08b2c883700aa29a03ddd3b23814ee8"
++checksum = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
+ dependencies = [
+- "bitflags 2.4.2",
++ "bitflags",
+  "libc",
+- "redox_syscall",
+ ]
+ 
+ [[package]]
+ name = "linux-raw-sys"
+-version = "0.4.13"
++version = "0.4.15"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "01cda141df6706de531b6c46c3a33ecca755538219bd484262fa09410c13539c"
++checksum = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
++
++[[package]]
++name = "litemap"
++version = "0.7.4"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "4ee93343901ab17bd981295f2cf0026d4ad018c7c31ba84549a4ddbb47a45104"
+ 
+ [[package]]
+ name = "lock_api"
+-version = "0.4.11"
++version = "0.4.12"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
++checksum = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
+ dependencies = [
+  "autocfg",
+  "scopeguard",
+@@ -966,9 +1075,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "log"
+-version = "0.4.20"
++version = "0.4.25"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
++checksum = "04cbf5b083de1c7e0222a7a51dbfdba1cbe1c6ab0b15e29fff3f6c077fd9cd9f"
+ 
+ [[package]]
+ name = "md-5"
+@@ -982,15 +1091,15 @@ dependencies = [
+ 
+ [[package]]
+ name = "memchr"
+-version = "2.7.1"
++version = "2.7.4"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
++checksum = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+ 
+ [[package]]
+ name = "memsec"
+-version = "0.6.3"
++version = "0.7.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "0fa0916b001582d253822171bd23f4a0229d32b9507fae236f5da8cad515ba7c"
++checksum = "c797b9d6bb23aab2fc369c65f871be49214f5c759af65bde26ffaaa2b646b492"
+ 
+ [[package]]
+ name = "minimal-lexical"
+@@ -1000,9 +1109,9 @@ checksum = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+ 
+ [[package]]
+ name = "nettle"
+-version = "7.3.0"
++version = "7.4.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b9fdccf3eae7b161910d2daa2f0155ca35041322e8fe5c5f1f2c9d0b12356336"
++checksum = "44e6ff4a94e5d34a1fd5abbd39418074646e2fa51b257198701330f22fcd6936"
+ dependencies = [
+  "getrandom",
+  "libc",
+@@ -1013,9 +1122,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "nettle-sys"
+-version = "2.3.0"
++version = "2.3.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b495053a10a19a80e3a26bf1212e92e29350797b5f5bdc58268c3f3f818e66ec"
++checksum = "61a3f5406064d310d59b1a219d3c5c9a49caf4047b6496032e3f930876488c34"
+ dependencies = [
+  "bindgen",
+  "cc",
+@@ -1027,9 +1136,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "new_debug_unreachable"
+-version = "1.0.4"
++version = "1.0.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "e4a24736216ec316047a1fc4252e27dabb04218aa4a3f37c6e7ddbf1f9782b54"
++checksum = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
+ 
+ [[package]]
+ name = "nom"
+@@ -1060,19 +1169,18 @@ dependencies = [
+ 
+ [[package]]
+ name = "num-integer"
+-version = "0.1.45"
++version = "0.1.46"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
++checksum = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+ dependencies = [
+- "autocfg",
+  "num-traits",
+ ]
+ 
+ [[package]]
+ name = "num-iter"
+-version = "0.1.43"
++version = "0.1.45"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "7d03e6c028c5dc5cac6e2dec0efda81fc887605bb3d884578bb6d6bf7514e252"
++checksum = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
+ dependencies = [
+  "autocfg",
+  "num-integer",
+@@ -1081,9 +1189,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "num-traits"
+-version = "0.2.17"
++version = "0.2.19"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
++checksum = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+ dependencies = [
+  "autocfg",
+  "libm",
+@@ -1091,23 +1199,23 @@ dependencies = [
+ 
+ [[package]]
+ name = "once_cell"
+-version = "1.19.0"
++version = "1.20.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
++checksum = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
+ 
+ [[package]]
+ name = "opaque-debug"
+-version = "0.3.0"
++version = "0.3.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5"
++checksum = "c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381"
+ 
+ [[package]]
+ name = "openssl"
+-version = "0.10.63"
++version = "0.10.69"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
++checksum = "f5e534d133a060a3c19daec1eb3e98ec6f4685978834f2dbadfe2ec215bab64e"
+ dependencies = [
+- "bitflags 2.4.2",
++ "bitflags",
+  "cfg-if",
+  "foreign-types",
+  "libc",
+@@ -1129,9 +1237,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "openssl-sys"
+-version = "0.9.99"
++version = "0.9.104"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
++checksum = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
+ dependencies = [
+  "cc",
+  "libc",
+@@ -1151,11 +1259,37 @@ dependencies = [
+  "sha2",
+ ]
+ 
++[[package]]
++name = "p384"
++version = "0.13.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "70786f51bcc69f6a4c0360e063a4cac5419ef7c5cd5b3c99ad70f3be5ba79209"
++dependencies = [
++ "ecdsa",
++ "elliptic-curve",
++ "primeorder",
++ "sha2",
++]
++
++[[package]]
++name = "p521"
++version = "0.13.3"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "0fc9e2161f1f215afdfce23677034ae137bbd45016a880c2eb3ba8eb95f085b2"
++dependencies = [
++ "base16ct",
++ "ecdsa",
++ "elliptic-curve",
++ "primeorder",
++ "rand_core",
++ "sha2",
++]
++
+ [[package]]
+ name = "parking_lot"
+-version = "0.12.1"
++version = "0.12.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
++checksum = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
+ dependencies = [
+  "lock_api",
+  "parking_lot_core",
+@@ -1163,23 +1297,17 @@ dependencies = [
+ 
+ [[package]]
+ name = "parking_lot_core"
+-version = "0.9.9"
++version = "0.9.10"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
++checksum = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
+ dependencies = [
+  "cfg-if",
+  "libc",
+  "redox_syscall",
+  "smallvec",
+- "windows-targets 0.48.5",
++ "windows-targets",
+ ]
+ 
+-[[package]]
+-name = "peeking_take_while"
+-version = "0.1.2"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+-
+ [[package]]
+ name = "pem-rfc7468"
+ version = "0.7.0"
+@@ -1191,9 +1319,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "petgraph"
+-version = "0.6.4"
++version = "0.6.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "e1d3afd2628e69da2be385eb6f2fd57c8ac7977ceeff6dc166ff1657b0e386a9"
++checksum = "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
+ dependencies = [
+  "fixedbitset",
+  "indexmap",
+@@ -1231,21 +1359,15 @@ dependencies = [
+ 
+ [[package]]
+ name = "pkg-config"
+-version = "0.3.29"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+-
+-[[package]]
+-name = "platforms"
+-version = "3.3.0"
++version = "0.3.31"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "626dec3cac7cc0e1577a2ec3fc496277ec2baa084bebad95bb6fdbfae235f84c"
++checksum = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
+ 
+ [[package]]
+ name = "polyval"
+-version = "0.6.1"
++version = "0.6.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "d52cff9d1d4dee5fe6d03729099f4a310a41179e0a10dbf542039873f2e826fb"
++checksum = "9d1fe60d06143b2430aa532c94cfe9e29783047f06c0d7fd359a9a51b729fa25"
+ dependencies = [
+  "cfg-if",
+  "cpufeatures",
+@@ -1255,9 +1377,12 @@ dependencies = [
+ 
+ [[package]]
+ name = "ppv-lite86"
+-version = "0.2.17"
++version = "0.2.20"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
++checksum = "77957b295656769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04"
++dependencies = [
++ "zerocopy",
++]
+ 
+ [[package]]
+ name = "precomputed-hash"
+@@ -1267,9 +1392,9 @@ checksum = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
+ 
+ [[package]]
+ name = "predicates"
+-version = "3.1.0"
++version = "3.1.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "68b87bfd4605926cdfefc1c3b5f8fe560e3feca9d5552cf68c466d3d8236c7e8"
++checksum = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
+ dependencies = [
+  "anstyle",
+  "difflib",
+@@ -1278,15 +1403,15 @@ dependencies = [
+ 
+ [[package]]
+ name = "predicates-core"
+-version = "1.0.6"
++version = "1.0.9"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
++checksum = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
+ 
+ [[package]]
+ name = "predicates-tree"
+-version = "1.0.9"
++version = "1.0.12"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
++checksum = "72dd2d6d381dfb73a193c7fca536518d7caee39fc8503f74e7dc0be0531b425c"
+ dependencies = [
+  "predicates-core",
+  "termtree",
+@@ -1303,18 +1428,18 @@ dependencies = [
+ 
+ [[package]]
+ name = "proc-macro2"
+-version = "1.0.78"
++version = "1.0.93"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
++checksum = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
+ dependencies = [
+  "unicode-ident",
+ ]
+ 
+ [[package]]
+ name = "quote"
+-version = "1.0.35"
++version = "1.0.38"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
++checksum = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
+ dependencies = [
+  "proc-macro2",
+ ]
+@@ -1325,7 +1450,6 @@ version = "0.8.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+ dependencies = [
+- "libc",
+  "rand_chacha",
+  "rand_core",
+ ]
+@@ -1351,18 +1475,18 @@ dependencies = [
+ 
+ [[package]]
+ name = "redox_syscall"
+-version = "0.4.1"
++version = "0.5.8"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
++checksum = "03a862b389f93e68874fbf580b9de08dd02facb9a788ebadaf4a3fd33cf58834"
+ dependencies = [
+- "bitflags 1.3.2",
++ "bitflags",
+ ]
+ 
+ [[package]]
+ name = "redox_users"
+-version = "0.4.4"
++version = "0.4.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "a18479200779601e498ada4e8c1e1f50e3ee19deb0259c25825a98b5603b2cb4"
++checksum = "ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43"
+ dependencies = [
+  "getrandom",
+  "libredox",
+@@ -1371,38 +1495,32 @@ dependencies = [
+ 
+ [[package]]
+ name = "regex"
+-version = "1.10.3"
++version = "1.11.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15"
++checksum = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
+ dependencies = [
+  "aho-corasick",
+  "memchr",
+  "regex-automata",
+- "regex-syntax 0.8.2",
++ "regex-syntax",
+ ]
+ 
+ [[package]]
+ name = "regex-automata"
+-version = "0.4.4"
++version = "0.4.9"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3b7fa1134405e2ec9353fd416b17f8dacd46c473d7d3fd1cf202706a14eb792a"
++checksum = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
+ dependencies = [
+  "aho-corasick",
+  "memchr",
+- "regex-syntax 0.8.2",
++ "regex-syntax",
+ ]
+ 
+ [[package]]
+ name = "regex-syntax"
+-version = "0.7.5"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "dbb5fb1acd8a1a18b3dd5be62d25485eb770e05afb408a9627d14d451bae12da"
+-
+-[[package]]
+-name = "regex-syntax"
+-version = "0.8.2"
++version = "0.8.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
++checksum = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
+ 
+ [[package]]
+ name = "rfc6979"
+@@ -1441,9 +1559,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "rsa"
+-version = "0.9.6"
++version = "0.9.7"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "5d0e5124fcb30e76a7e79bfee683a2746db83784b86289f6251b54b7950a0dfc"
++checksum = "47c75d7c5c6b673e58bf54d8544a9f432e3a925b0e80f7cd3602ab5c50c55519"
+ dependencies = [
+  "const-oid",
+  "digest",
+@@ -1467,31 +1585,40 @@ checksum = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
+ 
+ [[package]]
+ name = "rustc_version"
+-version = "0.4.0"
++version = "0.4.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
++checksum = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
+ dependencies = [
+  "semver",
+ ]
+ 
+ [[package]]
+ name = "rustix"
+-version = "0.38.30"
++version = "0.38.44"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "322394588aaf33c24007e8bb3238ee3e4c5c09c084ab32bc73890b99ff326bca"
++checksum = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
+ dependencies = [
+- "bitflags 2.4.2",
++ "bitflags",
+  "errno",
+  "libc",
+  "linux-raw-sys",
+- "windows-sys 0.52.0",
++ "windows-sys",
+ ]
+ 
+ [[package]]
+ name = "rustversion"
+-version = "1.0.14"
++version = "1.0.19"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "7ffc183a10b4478d04cbbbfc96d0873219d962dd5accaff2ffbd4ceb7df837f4"
++checksum = "f7c45b9784283f1b2e7fb61b42047c2fd678ef0960d4f6f1eba131594cc369d4"
++
++[[package]]
++name = "same-file"
++version = "1.0.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
++dependencies = [
++ "winapi-util",
++]
+ 
+ [[package]]
+ name = "scopeguard"
+@@ -1507,7 +1634,7 @@ checksum = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
+ dependencies = [
+  "base16ct",
+  "der",
+- "generic-array",
++ "generic-array 0.14.7",
+  "pkcs8",
+  "subtle",
+  "zeroize",
+@@ -1515,15 +1642,15 @@ dependencies = [
+ 
+ [[package]]
+ name = "semver"
+-version = "1.0.21"
++version = "1.0.25"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b97ed7a9823b74f99c7742f5336af7be5ecd3eeafcb1507d1fa93347b1d589b0"
++checksum = "f79dfe2d285b0488816f30e700a7438c5a73d816b5b7d3ac72fbc48b0d185e03"
+ 
+ [[package]]
+ name = "sequoia-openpgp"
+-version = "1.17.0"
++version = "1.22.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "2ea026cf8a70d331c742e3ad7e68fd405d0743ff86630fb4334a1bf8d0e194c7"
++checksum = "e858e4e9e48ff079cede92e1b45c942a5466ce9a4e3cc0c2a7e66586a718ef59"
+ dependencies = [
+  "aes",
+  "aes-gcm",
+@@ -1531,7 +1658,6 @@ dependencies = [
+  "base64",
+  "block-padding",
+  "blowfish",
+- "botan",
+  "buffered-reader",
+  "camellia",
+  "cast5",
+@@ -1562,10 +1688,12 @@ dependencies = [
+  "openssl",
+  "openssl-sys",
+  "p256",
++ "p384",
++ "p521",
+  "rand",
+  "rand_core",
+  "regex",
+- "regex-syntax 0.8.2",
++ "regex-syntax",
+  "ripemd",
+  "rsa",
+  "sha1collisiondetection",
+@@ -1573,8 +1701,6 @@ dependencies = [
+  "thiserror",
+  "twofish",
+  "typenum",
+- "win-crypto-ng",
+- "winapi",
+  "x25519-dalek",
+  "xxhash-rust",
+ ]
+@@ -1595,18 +1721,18 @@ dependencies = [
+ 
+ [[package]]
+ name = "serde"
+-version = "1.0.195"
++version = "1.0.217"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "63261df402c67811e9ac6def069e4786148c4563f4b50fd4bf30aa370d626b02"
++checksum = "02fc4265df13d6fa1d00ecff087228cc0a2b5f3c0e87e258d8b94a156e984c70"
+ dependencies = [
+  "serde_derive",
+ ]
+ 
+ [[package]]
+ name = "serde_derive"
+-version = "1.0.195"
++version = "1.0.217"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "46fe8f8603d81ba86327b23a2e9cdf49e1255fb94a4c5f297f6ee0547178ea2c"
++checksum = "5a9bf7cf98d04a2b28aead066b7496853d4779c9cc183c440dbac457641e19a0"
+ dependencies = [
+  "proc-macro2",
+  "quote",
+@@ -1659,15 +1785,15 @@ checksum = "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
+ 
+ [[package]]
+ name = "smallvec"
+-version = "1.13.1"
++version = "1.13.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
++checksum = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
+ 
+ [[package]]
+ name = "spin"
+-version = "0.5.2"
++version = "0.9.8"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "6e63cff320ae2c57904679ba7cb63280a3dc4613885beafb148ee7bf9aa9042d"
++checksum = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
+ 
+ [[package]]
+ name = "spki"
+@@ -1679,6 +1805,12 @@ dependencies = [
+  "der",
+ ]
+ 
++[[package]]
++name = "stable_deref_trait"
++version = "1.2.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
++
+ [[package]]
+ name = "string_cache"
+ version = "0.8.7"
+@@ -1694,32 +1826,44 @@ dependencies = [
+ 
+ [[package]]
+ name = "subtle"
+-version = "2.5.0"
++version = "2.6.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
++checksum = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
+ 
+ [[package]]
+ name = "syn"
+-version = "2.0.48"
++version = "2.0.96"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
++checksum = "d5d0adab1ae378d7f53bdebc67a39f1f151407ef230f0ce2883572f5d8985c80"
+ dependencies = [
+  "proc-macro2",
+  "quote",
+  "unicode-ident",
+ ]
+ 
++[[package]]
++name = "synstructure"
++version = "0.13.1"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
++dependencies = [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
++
+ [[package]]
+ name = "tempfile"
+-version = "3.9.0"
++version = "3.15.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "01ce4141aa927a6d1bd34a041795abd0db1cccba5d5f24b009f694bdf3a1f3fa"
++checksum = "9a8a559c81686f576e8cd0290cd2a24a2a9ad80c98b3478856500fcbd7acd704"
+ dependencies = [
+  "cfg-if",
+  "fastrand",
+- "redox_syscall",
++ "getrandom",
++ "once_cell",
+  "rustix",
+- "windows-sys 0.52.0",
++ "windows-sys",
+ ]
+ 
+ [[package]]
+@@ -1735,24 +1879,24 @@ dependencies = [
+ 
+ [[package]]
+ name = "termtree"
+-version = "0.4.1"
++version = "0.5.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
++checksum = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
+ 
+ [[package]]
+ name = "thiserror"
+-version = "1.0.56"
++version = "1.0.69"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "d54378c645627613241d077a3a79db965db602882668f9136ac42af9ecb730ad"
++checksum = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
+ dependencies = [
+  "thiserror-impl",
+ ]
+ 
+ [[package]]
+ name = "thiserror-impl"
+-version = "1.0.56"
++version = "1.0.69"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "fa0faa943b50f3db30a20aa7e265dbc66076993efed8463e8de414e5d06d3471"
++checksum = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
+ dependencies = [
+  "proc-macro2",
+  "quote",
+@@ -1769,20 +1913,15 @@ dependencies = [
+ ]
+ 
+ [[package]]
+-name = "tinyvec"
+-version = "1.6.0"
++name = "tinystr"
++version = "0.7.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
++checksum = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
+ dependencies = [
+- "tinyvec_macros",
++ "displaydoc",
++ "zerovec",
+ ]
+ 
+-[[package]]
+-name = "tinyvec_macros"
+-version = "0.1.1"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
+-
+ [[package]]
+ name = "toml"
+ version = "0.5.11"
+@@ -1807,32 +1946,17 @@ version = "1.17.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
+ 
+-[[package]]
+-name = "unicode-bidi"
+-version = "0.3.15"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
+-
+ [[package]]
+ name = "unicode-ident"
+-version = "1.0.12"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+-
+-[[package]]
+-name = "unicode-normalization"
+-version = "0.1.22"
++version = "1.0.16"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
+-dependencies = [
+- "tinyvec",
+-]
++checksum = "a210d160f08b701c8721ba1c726c11662f877ea6b7094007e1ca9a1041945034"
+ 
+ [[package]]
+ name = "unicode-xid"
+-version = "0.2.4"
++version = "0.2.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
++checksum = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
+ 
+ [[package]]
+ name = "universal-hash"
+@@ -1844,6 +1968,18 @@ dependencies = [
+  "subtle",
+ ]
+ 
++[[package]]
++name = "utf16_iter"
++version = "1.0.5"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
++
++[[package]]
++name = "utf8_iter"
++version = "1.0.4"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
++
+ [[package]]
+ name = "vcpkg"
+ version = "0.2.15"
+@@ -1852,9 +1988,9 @@ checksum = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
+ 
+ [[package]]
+ name = "version_check"
+-version = "0.9.4"
++version = "0.9.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
++checksum = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+ 
+ [[package]]
+ name = "wait-timeout"
+@@ -1865,6 +2001,16 @@ dependencies = [
+  "libc",
+ ]
+ 
++[[package]]
++name = "walkdir"
++version = "2.5.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
++dependencies = [
++ "same-file",
++ "winapi-util",
++]
++
+ [[package]]
+ name = "wasi"
+ version = "0.11.0+wasi-snapshot-preview1"
+@@ -1873,23 +2019,24 @@ checksum = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+ 
+ [[package]]
+ name = "wasm-bindgen"
+-version = "0.2.90"
++version = "0.2.100"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b1223296a201415c7fad14792dbefaace9bd52b62d33453ade1c5b5f07555406"
++checksum = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
+ dependencies = [
+  "cfg-if",
++ "once_cell",
++ "rustversion",
+  "wasm-bindgen-macro",
+ ]
+ 
+ [[package]]
+ name = "wasm-bindgen-backend"
+-version = "0.2.90"
++version = "0.2.100"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "fcdc935b63408d58a32f8cc9738a0bffd8f05cc7c002086c6ef20b7312ad9dcd"
++checksum = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
+ dependencies = [
+  "bumpalo",
+  "log",
+- "once_cell",
+  "proc-macro2",
+  "quote",
+  "syn",
+@@ -1898,9 +2045,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "wasm-bindgen-macro"
+-version = "0.2.90"
++version = "0.2.100"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3e4c238561b2d428924c49815533a8b9121c664599558a5d9ec51f8a1740a999"
++checksum = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
+ dependencies = [
+  "quote",
+  "wasm-bindgen-macro-support",
+@@ -1908,9 +2055,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "wasm-bindgen-macro-support"
+-version = "0.2.90"
++version = "0.2.100"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "bae1abb6806dc1ad9e560ed242107c0f6c84335f1749dd4e8ddb012ebd5e25a7"
++checksum = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
+ dependencies = [
+  "proc-macro2",
+  "quote",
+@@ -1921,21 +2068,11 @@ dependencies = [
+ 
+ [[package]]
+ name = "wasm-bindgen-shared"
+-version = "0.2.90"
+-source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "4d91413b1c31d7539ba5ef2451af3f0b833a005eb27a631cec32bc0635a8602b"
+-
+-[[package]]
+-name = "win-crypto-ng"
+-version = "0.5.1"
++version = "0.2.100"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "99abfb435a71e54ab2971d8d8c32f1a7e006cdbf527f71743b1d45b93517bb92"
++checksum = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
+ dependencies = [
+- "cipher",
+- "doc-comment",
+- "rand_core",
+- "winapi",
+- "zeroize",
++ "unicode-ident",
+ ]
+ 
+ [[package]]
+@@ -1954,6 +2091,15 @@ version = "0.4.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+ 
++[[package]]
++name = "winapi-util"
++version = "0.1.9"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
++dependencies = [
++ "windows-sys",
++]
++
+ [[package]]
+ name = "winapi-x86_64-pc-windows-gnu"
+ version = "0.4.0"
+@@ -1966,163 +2112,182 @@ version = "0.52.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
+ dependencies = [
+- "windows-targets 0.52.0",
++ "windows-targets",
+ ]
+ 
+ [[package]]
+ name = "windows-sys"
+-version = "0.48.0"
++version = "0.59.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
++checksum = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+ dependencies = [
+- "windows-targets 0.48.5",
++ "windows-targets",
+ ]
+ 
+ [[package]]
+-name = "windows-sys"
+-version = "0.52.0"
++name = "windows-targets"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
++checksum = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+ dependencies = [
+- "windows-targets 0.52.0",
++ "windows_aarch64_gnullvm",
++ "windows_aarch64_msvc",
++ "windows_i686_gnu",
++ "windows_i686_gnullvm",
++ "windows_i686_msvc",
++ "windows_x86_64_gnu",
++ "windows_x86_64_gnullvm",
++ "windows_x86_64_msvc",
+ ]
+ 
+ [[package]]
+-name = "windows-targets"
+-version = "0.48.5"
++name = "windows_aarch64_gnullvm"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+-dependencies = [
+- "windows_aarch64_gnullvm 0.48.5",
+- "windows_aarch64_msvc 0.48.5",
+- "windows_i686_gnu 0.48.5",
+- "windows_i686_msvc 0.48.5",
+- "windows_x86_64_gnu 0.48.5",
+- "windows_x86_64_gnullvm 0.48.5",
+- "windows_x86_64_msvc 0.48.5",
+-]
++checksum = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+ 
+ [[package]]
+-name = "windows-targets"
+-version = "0.52.0"
++name = "windows_aarch64_msvc"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+-dependencies = [
+- "windows_aarch64_gnullvm 0.52.0",
+- "windows_aarch64_msvc 0.52.0",
+- "windows_i686_gnu 0.52.0",
+- "windows_i686_msvc 0.52.0",
+- "windows_x86_64_gnu 0.52.0",
+- "windows_x86_64_gnullvm 0.52.0",
+- "windows_x86_64_msvc 0.52.0",
+-]
++checksum = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+ 
+ [[package]]
+-name = "windows_aarch64_gnullvm"
+-version = "0.48.5"
++name = "windows_i686_gnu"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
++checksum = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+ 
+ [[package]]
+-name = "windows_aarch64_gnullvm"
+-version = "0.52.0"
++name = "windows_i686_gnullvm"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
++checksum = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+ 
+ [[package]]
+-name = "windows_aarch64_msvc"
+-version = "0.48.5"
++name = "windows_i686_msvc"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
++checksum = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+ 
+ [[package]]
+-name = "windows_aarch64_msvc"
+-version = "0.52.0"
++name = "windows_x86_64_gnu"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
++checksum = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+ 
+ [[package]]
+-name = "windows_i686_gnu"
+-version = "0.48.5"
++name = "windows_x86_64_gnullvm"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
++checksum = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+ 
+ [[package]]
+-name = "windows_i686_gnu"
+-version = "0.52.0"
++name = "windows_x86_64_msvc"
++version = "0.52.6"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
++checksum = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+ 
+ [[package]]
+-name = "windows_i686_msvc"
+-version = "0.48.5"
++name = "write16"
++version = "1.0.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
++checksum = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
+ 
+ [[package]]
+-name = "windows_i686_msvc"
+-version = "0.52.0"
++name = "writeable"
++version = "0.5.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
++checksum = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
+ 
+ [[package]]
+-name = "windows_x86_64_gnu"
+-version = "0.48.5"
++name = "x25519-dalek"
++version = "2.0.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
++checksum = "c7e468321c81fb07fa7f4c636c3972b9100f0346e5b6a9f2bd0603a52f7ed277"
++dependencies = [
++ "curve25519-dalek",
++ "rand_core",
++ "zeroize",
++]
+ 
+ [[package]]
+-name = "windows_x86_64_gnu"
+-version = "0.52.0"
++name = "xxhash-rust"
++version = "0.8.15"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
++checksum = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
+ 
+ [[package]]
+-name = "windows_x86_64_gnullvm"
+-version = "0.48.5"
++name = "yoke"
++version = "0.7.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
++checksum = "120e6aef9aa629e3d4f52dc8cc43a015c7724194c97dfaf45180d2daf2b77f40"
++dependencies = [
++ "serde",
++ "stable_deref_trait",
++ "yoke-derive",
++ "zerofrom",
++]
+ 
+ [[package]]
+-name = "windows_x86_64_gnullvm"
+-version = "0.52.0"
++name = "yoke-derive"
++version = "0.7.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
++checksum = "2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e229154"
++dependencies = [
++ "proc-macro2",
++ "quote",
++ "syn",
++ "synstructure",
++]
+ 
+ [[package]]
+-name = "windows_x86_64_msvc"
+-version = "0.48.5"
++name = "zerocopy"
++version = "0.7.35"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
++checksum = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
++dependencies = [
++ "byteorder",
++ "zerocopy-derive",
++]
+ 
+ [[package]]
+-name = "windows_x86_64_msvc"
+-version = "0.52.0"
++name = "zerocopy-derive"
++version = "0.7.35"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
++checksum = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
++dependencies = [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
+ 
+ [[package]]
+-name = "x25519-dalek"
+-version = "2.0.0"
++name = "zerofrom"
++version = "0.1.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "fb66477291e7e8d2b0ff1bcb900bf29489a9692816d79874bea351e7a8b6de96"
++checksum = "cff3ee08c995dee1859d998dea82f7374f2826091dd9cd47def953cae446cd2e"
+ dependencies = [
+- "curve25519-dalek",
+- "rand_core",
+- "zeroize",
++ "zerofrom-derive",
+ ]
+ 
+ [[package]]
+-name = "xxhash-rust"
+-version = "0.8.8"
++name = "zerofrom-derive"
++version = "0.1.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "53be06678ed9e83edb1745eb72efc0bbcd7b5c3c35711a860906aed827a13d61"
++checksum = "595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f295808"
++dependencies = [
++ "proc-macro2",
++ "quote",
++ "syn",
++ "synstructure",
++]
+ 
+ [[package]]
+ name = "zeroize"
+-version = "1.7.0"
++version = "1.8.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
++checksum = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
+ dependencies = [
+  "zeroize_derive",
+ ]
+@@ -2137,3 +2302,25 @@ dependencies = [
+  "quote",
+  "syn",
+ ]
++
++[[package]]
++name = "zerovec"
++version = "0.10.4"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
++dependencies = [
++ "yoke",
++ "zerofrom",
++ "zerovec-derive",
++]
++
++[[package]]
++name = "zerovec-derive"
++version = "0.10.3"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
++dependencies = [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
+-- 
+2.48.1
+
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
new file mode 100644
index 0000000000..9c1e36cd72
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "An OpenPGP backend for rpm using Sequoia PGP"
+HOMEPAGE = "https://sequoia-pgp.org/"
+LICENSE = "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ff5ff7747cf7d394079c6ae87f5f0c"
+
+DEPENDS = "openssl"
+
+inherit pkgconfig rust cargo cargo-update-recipe-crates
+
+CARGO_USE_OFFLINE_FLAG = "1"
+
+export CARGO_PROFILE_RELEASE_BUILD_OVERRIDE_DEBUG = "true"
+
+SRC_URI = " \
+	git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main \
+	file://0001-Make-openssl-the-default-signing-crypto.patch \
+	file://0002-Update-Cargo.lock-after-the-crypto-change.patch \
+"
+
+SRCREV = "739a606da6ea1e836a415a1fd7899f36b7fd5a38"
+
+S = "${UNPACKDIR}/git"
+
+require ${BPN}-crates.inc
+
+do_compile:prepend () {
+	mkdir -p ${S}/target/release
+}
+
+do_install () {
+	mkdir -p ${D}${libdir}
+	install -m0755 ${B}/target/${RUST_TARGET_SYS}/release/librpm_sequoia.so ${D}${libdir}/librpm_sequoia.so.1
+	ln -s librpm_sequoia.so.1 ${D}${libdir}/librpm_sequoia.so
+
+	mkdir -p ${D}${libdir}/pkgconfig
+	install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pkgconfig
+}
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


