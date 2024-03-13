Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6719AC54E71
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:47 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.2085.1710351224935120724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XuMjWpaB;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5139d80f8b6so147329e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351223; x=1710956023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4t2M8IloZOmdz3h6js/txpGRIZ269ke/8MmeRzkNkA=;
        b=XuMjWpaBBW9tfZn9D3otWOaDrxM+2dyW2DsifE9/Q15dT8do43/b2hX/eQrkzqOhh2
         pKX/YU6J97XJz4ESSWAIXvx9oHqtf6mf49vtTSFPd5wSwdSoyNuk+MxMcwXokP26ULXE
         QwHSFy/FgpKec14GzO2RuoJNAUeAS72n9ahgvAt0w27aqa0PjR5gI5iusX7m3lKOuYXU
         Vhj9i4nqhSMXb4cd5ys9N9yIdWcdxZK3E+L1GJb2GiHakyXGIEWOPT/DOhAYoYISWvIJ
         nXO0CCVBjC6jrYv8ECb6j4f1S/gw/f2f5nY7yGG3PtcHqKuKm6uT2HTKrRT7oyp9ksS6
         wMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351223; x=1710956023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4t2M8IloZOmdz3h6js/txpGRIZ269ke/8MmeRzkNkA=;
        b=PPiiQFpB0b8O5wrILMEmVbYpThIou93toJ+eaECEZs3/2wa7pn5KerdT9NneTFUQjf
         Z2T9bnmjvdo8bbfCZdw6jqibrdKmGnDefkAIo9I9aRxpRdxDFdBy6Gafa7F/85fd760O
         Wi6h4IFWJeigLVxHEr1q6C1jTbl1Gn7ddGNqlmBc2CaFWE4IYGkDMQ95NSDWi88bJ54v
         XDEIGNRO3wcWzDZnDcq9nSCW8nkN7I/ajSBB0bimPA6Ve7uEmB3om8cHj2hPLbNb9dRe
         ldL+G5asU5A/zCTzja9Ar8S9NS0w5YhULt1sddxuu/MTYp/8SA64TsDti12Exo+hrsp8
         Qjmw==
X-Gm-Message-State: AOJu0Yx18WQxHCVNEeOTZtIgsRy3aUZvbuGP2GLuMTT1WzDm7MAaAK5S
	IrOLwZmxaRD3ZKKatEJjrcGFK6awlLyYfG2zXTlLZFuHVrmcnNZgk+Fg9L1q
X-Google-Smtp-Source: AGHT+IHjFNwYs66IqiqCoh1cJ8BxfYwjkKTHlonbC3oQcRTxq8TTUg/AcQ8/gqvKTCrmhb7ukXtnKA==
X-Received: by 2002:a19:f809:0:b0:512:a9b7:c637 with SMTP id a9-20020a19f809000000b00512a9b7c637mr8697999lff.29.1710351222278;
        Wed, 13 Mar 2024 10:33:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/21] cargo-c-native: update 0.9.18 -> 0.9.30
Date: Wed, 13 Mar 2024 18:33:19 +0100
Message-Id: <20240313173336.3900178-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197058

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/cargo-c-crates.inc | 866 +++++++++++-------
 ... => cargo-c-native_0.9.30+cargo-0.77.0.bb} |   2 +-
 2 files changed, 531 insertions(+), 337 deletions(-)
 rename meta/recipes-devtools/rust/{cargo-c-native_0.9.18+cargo-0.69.bb => cargo-c-native_0.9.30+cargo-0.77.0.bb} (82%)

diff --git a/meta/recipes-devtools/rust/cargo-c-crates.inc b/meta/recipes-devtools/rust/cargo-c-crates.inc
index 079e0f03639..f6da3e654e6 100644
--- a/meta/recipes-devtools/rust/cargo-c-crates.inc
+++ b/meta/recipes-devtools/rust/cargo-c-crates.inc
@@ -3,458 +3,652 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
-    crate://crates.io/aho-corasick/0.7.20 \
-    crate://crates.io/anstream/0.2.6 \
-    crate://crates.io/anstyle/0.3.5 \
-    crate://crates.io/anstyle-parse/0.1.1 \
-    crate://crates.io/anstyle-wincon/0.2.0 \
-    crate://crates.io/anyhow/1.0.70 \
-    crate://crates.io/arrayvec/0.5.2 \
-    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/ahash/0.8.7 \
+    crate://crates.io/aho-corasick/1.1.2 \
+    crate://crates.io/allocator-api2/0.2.16 \
+    crate://crates.io/anstream/0.6.11 \
+    crate://crates.io/anstyle/1.0.6 \
+    crate://crates.io/anstyle-parse/0.2.3 \
+    crate://crates.io/anstyle-query/1.0.2 \
+    crate://crates.io/anstyle-wincon/3.0.2 \
+    crate://crates.io/anyhow/1.0.79 \
+    crate://crates.io/arc-swap/1.6.0 \
     crate://crates.io/autocfg/1.1.0 \
     crate://crates.io/base16ct/0.2.0 \
-    crate://crates.io/base64/0.13.1 \
+    crate://crates.io/base64/0.21.7 \
     crate://crates.io/base64ct/1.6.0 \
     crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.4.2 \
     crate://crates.io/bitmaps/2.1.0 \
     crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/bstr/1.4.0 \
-    crate://crates.io/bumpalo/3.12.0 \
-    crate://crates.io/bytes/1.4.0 \
-    crate://crates.io/bytesize/1.2.0 \
-    crate://crates.io/cargo/0.69.1 \
-    crate://crates.io/cargo-platform/0.1.2 \
-    crate://crates.io/cargo-util/0.2.3 \
-    crate://crates.io/cbindgen/0.24.3 \
-    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/bstr/1.9.0 \
+    crate://crates.io/btoi/0.4.3 \
+    crate://crates.io/bumpalo/3.14.0 \
+    crate://crates.io/bytes/1.5.0 \
+    crate://crates.io/bytesize/1.3.0 \
+    crate://crates.io/cargo/0.77.0 \
+    crate://crates.io/cargo-credential/0.4.2 \
+    crate://crates.io/cargo-credential-libsecret/0.4.2 \
+    crate://crates.io/cargo-credential-macos-keychain/0.4.2 \
+    crate://crates.io/cargo-credential-wincred/0.4.2 \
+    crate://crates.io/cargo-platform/0.1.7 \
+    crate://crates.io/cargo-util/0.2.9 \
+    crate://crates.io/cbindgen/0.26.0 \
+    crate://crates.io/cc/1.0.83 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clap/3.2.23 \
-    crate://crates.io/clap/4.2.1 \
-    crate://crates.io/clap_builder/4.2.1 \
-    crate://crates.io/clap_derive/4.2.0 \
-    crate://crates.io/clap_lex/0.2.4 \
-    crate://crates.io/clap_lex/0.4.1 \
-    crate://crates.io/combine/4.6.6 \
-    crate://crates.io/commoncrypto/0.2.0 \
-    crate://crates.io/commoncrypto-sys/0.2.0 \
-    crate://crates.io/concolor-override/1.0.0 \
-    crate://crates.io/concolor-query/0.3.3 \
-    crate://crates.io/const-oid/0.9.2 \
-    crate://crates.io/core-foundation/0.9.3 \
-    crate://crates.io/core-foundation-sys/0.8.4 \
-    crate://crates.io/cpufeatures/0.2.6 \
-    crate://crates.io/crates-io/0.35.1 \
+    crate://crates.io/clap/4.5.0 \
+    crate://crates.io/clap_builder/4.5.0 \
+    crate://crates.io/clap_derive/4.5.0 \
+    crate://crates.io/clap_lex/0.7.0 \
+    crate://crates.io/clru/0.6.1 \
+    crate://crates.io/color-print/0.3.5 \
+    crate://crates.io/color-print-proc-macro/0.3.5 \
+    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/const-oid/0.9.6 \
+    crate://crates.io/core-foundation/0.9.4 \
+    crate://crates.io/core-foundation-sys/0.8.6 \
+    crate://crates.io/cpufeatures/0.2.12 \
+    crate://crates.io/crates-io/0.39.2 \
     crate://crates.io/crc32fast/1.3.2 \
-    crate://crates.io/crypto-bigint/0.5.1 \
+    crate://crates.io/crossbeam-channel/0.5.11 \
+    crate://crates.io/crossbeam-deque/0.8.5 \
+    crate://crates.io/crossbeam-epoch/0.9.18 \
+    crate://crates.io/crossbeam-utils/0.8.19 \
+    crate://crates.io/crypto-bigint/0.5.5 \
     crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/crypto-hash/0.3.4 \
     crate://crates.io/ct-codecs/1.1.1 \
-    crate://crates.io/curl/0.4.44 \
-    crate://crates.io/curl-sys/0.4.61+curl-8.0.1 \
-    crate://crates.io/der/0.7.3 \
-    crate://crates.io/digest/0.10.6 \
-    crate://crates.io/ecdsa/0.16.6 \
-    crate://crates.io/ed25519-compact/2.0.4 \
-    crate://crates.io/either/1.8.1 \
-    crate://crates.io/elliptic-curve/0.13.4 \
-    crate://crates.io/env_logger/0.10.0 \
-    crate://crates.io/errno/0.3.1 \
-    crate://crates.io/errno-dragonfly/0.1.2 \
-    crate://crates.io/fastrand/1.9.0 \
+    crate://crates.io/curl/0.4.45 \
+    crate://crates.io/curl-sys/0.4.72+curl-8.6.0 \
+    crate://crates.io/der/0.7.8 \
+    crate://crates.io/deranged/0.3.11 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/dunce/1.0.4 \
+    crate://crates.io/ecdsa/0.16.9 \
+    crate://crates.io/ed25519-compact/2.1.1 \
+    crate://crates.io/either/1.9.0 \
+    crate://crates.io/elliptic-curve/0.13.8 \
+    crate://crates.io/encoding_rs/0.8.33 \
+    crate://crates.io/equivalent/1.0.1 \
+    crate://crates.io/erased-serde/0.4.2 \
+    crate://crates.io/errno/0.3.8 \
+    crate://crates.io/fallible-iterator/0.3.0 \
+    crate://crates.io/fallible-streaming-iterator/0.1.9 \
+    crate://crates.io/faster-hex/0.9.0 \
+    crate://crates.io/fastrand/2.0.1 \
     crate://crates.io/ff/0.13.0 \
-    crate://crates.io/fiat-crypto/0.1.20 \
-    crate://crates.io/filetime/0.2.21 \
-    crate://crates.io/flate2/1.0.25 \
-    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/fiat-crypto/0.2.6 \
+    crate://crates.io/filetime/0.2.23 \
+    crate://crates.io/flate2/1.0.28 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/form_urlencoded/1.1.0 \
-    crate://crates.io/fwdansi/1.1.0 \
+    crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.9 \
-    crate://crates.io/git2/0.16.0 \
-    crate://crates.io/git2-curl/0.17.0 \
+    crate://crates.io/getrandom/0.2.12 \
+    crate://crates.io/git2/0.18.2 \
+    crate://crates.io/git2-curl/0.19.0 \
+    crate://crates.io/gix/0.56.0 \
+    crate://crates.io/gix-actor/0.28.1 \
+    crate://crates.io/gix-attributes/0.20.1 \
+    crate://crates.io/gix-bitmap/0.2.10 \
+    crate://crates.io/gix-chunk/0.4.7 \
+    crate://crates.io/gix-command/0.3.4 \
+    crate://crates.io/gix-commitgraph/0.22.1 \
+    crate://crates.io/gix-config/0.32.1 \
+    crate://crates.io/gix-config-value/0.14.4 \
+    crate://crates.io/gix-credentials/0.22.0 \
+    crate://crates.io/gix-date/0.8.3 \
+    crate://crates.io/gix-diff/0.38.0 \
+    crate://crates.io/gix-discover/0.27.0 \
+    crate://crates.io/gix-features/0.35.0 \
+    crate://crates.io/gix-features/0.36.1 \
+    crate://crates.io/gix-filter/0.7.0 \
+    crate://crates.io/gix-fs/0.8.1 \
+    crate://crates.io/gix-glob/0.14.1 \
+    crate://crates.io/gix-hash/0.13.3 \
+    crate://crates.io/gix-hashtable/0.4.1 \
+    crate://crates.io/gix-ignore/0.9.1 \
+    crate://crates.io/gix-index/0.27.1 \
+    crate://crates.io/gix-lock/11.0.1 \
+    crate://crates.io/gix-macros/0.1.3 \
+    crate://crates.io/gix-negotiate/0.10.0 \
+    crate://crates.io/gix-object/0.39.0 \
+    crate://crates.io/gix-odb/0.55.0 \
+    crate://crates.io/gix-pack/0.45.0 \
+    crate://crates.io/gix-packetline/0.17.3 \
+    crate://crates.io/gix-packetline-blocking/0.17.3 \
+    crate://crates.io/gix-path/0.10.5 \
+    crate://crates.io/gix-pathspec/0.4.1 \
+    crate://crates.io/gix-prompt/0.8.2 \
+    crate://crates.io/gix-protocol/0.42.0 \
+    crate://crates.io/gix-quote/0.4.10 \
+    crate://crates.io/gix-ref/0.39.1 \
+    crate://crates.io/gix-refspec/0.20.0 \
+    crate://crates.io/gix-revision/0.24.0 \
+    crate://crates.io/gix-revwalk/0.10.0 \
+    crate://crates.io/gix-sec/0.10.4 \
+    crate://crates.io/gix-submodule/0.6.0 \
+    crate://crates.io/gix-tempfile/11.0.1 \
+    crate://crates.io/gix-trace/0.1.7 \
+    crate://crates.io/gix-transport/0.39.0 \
+    crate://crates.io/gix-traverse/0.35.0 \
+    crate://crates.io/gix-url/0.25.2 \
+    crate://crates.io/gix-utils/0.1.9 \
+    crate://crates.io/gix-validate/0.8.3 \
+    crate://crates.io/gix-worktree/0.28.0 \
     crate://crates.io/glob/0.3.1 \
-    crate://crates.io/globset/0.4.10 \
+    crate://crates.io/globset/0.4.14 \
     crate://crates.io/group/0.13.0 \
     crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/hashbrown/0.14.3 \
+    crate://crates.io/hashlink/0.8.4 \
     crate://crates.io/heck/0.4.1 \
-    crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hermit-abi/0.3.1 \
-    crate://crates.io/hex/0.3.2 \
+    crate://crates.io/hermit-abi/0.3.5 \
     crate://crates.io/hex/0.4.3 \
-    crate://crates.io/hkdf/0.12.3 \
+    crate://crates.io/hkdf/0.12.4 \
     crate://crates.io/hmac/0.12.1 \
-    crate://crates.io/home/0.5.4 \
-    crate://crates.io/http-auth/0.1.8 \
+    crate://crates.io/home/0.5.9 \
+    crate://crates.io/http-auth/0.1.9 \
     crate://crates.io/humantime/2.1.0 \
-    crate://crates.io/idna/0.3.0 \
-    crate://crates.io/ignore/0.4.20 \
+    crate://crates.io/idna/0.5.0 \
+    crate://crates.io/ignore/0.4.22 \
     crate://crates.io/im-rc/15.1.0 \
     crate://crates.io/indexmap/1.9.3 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/io-lifetimes/1.0.10 \
-    crate://crates.io/is-terminal/0.4.7 \
-    crate://crates.io/itertools/0.10.5 \
-    crate://crates.io/itoa/1.0.6 \
-    crate://crates.io/jobserver/0.1.26 \
-    crate://crates.io/js-sys/0.3.61 \
+    crate://crates.io/indexmap/2.2.2 \
+    crate://crates.io/is-terminal/0.4.11 \
+    crate://crates.io/itertools/0.12.1 \
+    crate://crates.io/itoa/1.0.10 \
+    crate://crates.io/jobserver/0.1.28 \
+    crate://crates.io/js-sys/0.3.68 \
     crate://crates.io/kstring/2.0.0 \
     crate://crates.io/lazy_static/1.4.0 \
     crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.141 \
-    crate://crates.io/libgit2-sys/0.14.1+1.5.0 \
-    crate://crates.io/libnghttp2-sys/0.1.7+1.45.0 \
-    crate://crates.io/libssh2-sys/0.2.23 \
-    crate://crates.io/libz-sys/1.1.8 \
-    crate://crates.io/linux-raw-sys/0.3.1 \
-    crate://crates.io/log/0.4.17 \
-    crate://crates.io/memchr/2.5.0 \
-    crate://crates.io/miniz_oxide/0.6.2 \
-    crate://crates.io/miow/0.5.0 \
-    crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/once_cell/1.17.1 \
-    crate://crates.io/opener/0.5.2 \
-    crate://crates.io/openssl/0.10.50 \
+    crate://crates.io/libc/0.2.153 \
+    crate://crates.io/libgit2-sys/0.16.2+1.7.2 \
+    crate://crates.io/libloading/0.8.1 \
+    crate://crates.io/libnghttp2-sys/0.1.9+1.58.0 \
+    crate://crates.io/libsqlite3-sys/0.27.0 \
+    crate://crates.io/libssh2-sys/0.3.0 \
+    crate://crates.io/libz-sys/1.1.15 \
+    crate://crates.io/linux-raw-sys/0.4.13 \
+    crate://crates.io/lock_api/0.4.11 \
+    crate://crates.io/log/0.4.20 \
+    crate://crates.io/matchers/0.1.0 \
+    crate://crates.io/maybe-async/0.2.9 \
+    crate://crates.io/memchr/2.7.1 \
+    crate://crates.io/memmap2/0.9.4 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/miniz_oxide/0.7.2 \
+    crate://crates.io/miow/0.6.0 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/normpath/1.1.1 \
+    crate://crates.io/nu-ansi-term/0.46.0 \
+    crate://crates.io/num-conv/0.1.0 \
+    crate://crates.io/num-traits/0.2.18 \
+    crate://crates.io/num_threads/0.1.6 \
+    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/opener/0.6.1 \
+    crate://crates.io/openssl/0.10.63 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.1.5 \
-    crate://crates.io/openssl-src/111.25.2+1.1.1t \
-    crate://crates.io/openssl-sys/0.9.85 \
-    crate://crates.io/ordered-float/2.10.0 \
-    crate://crates.io/orion/0.17.4 \
+    crate://crates.io/openssl-src/300.2.2+3.2.1 \
+    crate://crates.io/openssl-sys/0.9.99 \
+    crate://crates.io/ordered-float/2.10.1 \
+    crate://crates.io/orion/0.17.6 \
     crate://crates.io/os_info/3.7.0 \
-    crate://crates.io/os_str_bytes/6.5.0 \
+    crate://crates.io/overload/0.1.1 \
     crate://crates.io/p384/0.13.0 \
-    crate://crates.io/pasetors/0.6.6 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.9 \
+    crate://crates.io/pasetors/0.6.8 \
     crate://crates.io/pathdiff/0.2.1 \
     crate://crates.io/pem-rfc7468/0.7.0 \
-    crate://crates.io/percent-encoding/2.2.0 \
+    crate://crates.io/percent-encoding/2.3.1 \
+    crate://crates.io/pin-project-lite/0.2.13 \
     crate://crates.io/pkcs8/0.10.2 \
-    crate://crates.io/pkg-config/0.3.26 \
-    crate://crates.io/primeorder/0.13.1 \
-    crate://crates.io/proc-macro2/1.0.56 \
-    crate://crates.io/quote/1.0.26 \
+    crate://crates.io/pkg-config/0.3.29 \
+    crate://crates.io/powerfmt/0.2.0 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/primeorder/0.13.6 \
+    crate://crates.io/proc-macro2/1.0.78 \
+    crate://crates.io/prodash/26.2.2 \
+    crate://crates.io/pulldown-cmark/0.9.6 \
+    crate://crates.io/quote/1.0.35 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_xoshiro/0.6.0 \
-    crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/redox_syscall/0.3.5 \
-    crate://crates.io/regex/1.7.3 \
+    crate://crates.io/redox_syscall/0.4.1 \
+    crate://crates.io/regex/1.10.3 \
     crate://crates.io/regex-automata/0.1.10 \
+    crate://crates.io/regex-automata/0.4.5 \
     crate://crates.io/regex-syntax/0.6.29 \
+    crate://crates.io/regex-syntax/0.8.2 \
     crate://crates.io/rfc6979/0.4.0 \
-    crate://crates.io/rustc-workspace-hack/1.0.0 \
-    crate://crates.io/rustfix/0.6.1 \
-    crate://crates.io/rustix/0.37.11 \
-    crate://crates.io/ryu/1.0.13 \
+    crate://crates.io/rusqlite/0.30.0 \
+    crate://crates.io/rustfix/0.7.0 \
+    crate://crates.io/rustix/0.38.31 \
+    crate://crates.io/ryu/1.0.16 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schannel/0.1.21 \
-    crate://crates.io/sec1/0.7.2 \
-    crate://crates.io/semver/1.0.17 \
-    crate://crates.io/serde/1.0.160 \
+    crate://crates.io/schannel/0.1.23 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/sec1/0.7.3 \
+    crate://crates.io/security-framework/2.9.2 \
+    crate://crates.io/security-framework-sys/2.9.1 \
+    crate://crates.io/semver/1.0.21 \
+    crate://crates.io/serde/1.0.196 \
+    crate://crates.io/serde-untagged/0.1.5 \
     crate://crates.io/serde-value/0.7.0 \
-    crate://crates.io/serde_derive/1.0.160 \
-    crate://crates.io/serde_ignored/0.1.7 \
-    crate://crates.io/serde_json/1.0.95 \
-    crate://crates.io/serde_spanned/0.6.1 \
-    crate://crates.io/sha1/0.10.5 \
-    crate://crates.io/sha2/0.10.6 \
+    crate://crates.io/serde_derive/1.0.196 \
+    crate://crates.io/serde_ignored/0.1.10 \
+    crate://crates.io/serde_json/1.0.113 \
+    crate://crates.io/serde_spanned/0.6.5 \
+    crate://crates.io/sha1/0.10.6 \
+    crate://crates.io/sha1_smol/1.0.0 \
+    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shell-escape/0.1.5 \
-    crate://crates.io/signature/2.1.0 \
+    crate://crates.io/shell-words/1.1.0 \
+    crate://crates.io/signature/2.2.0 \
     crate://crates.io/sized-chunks/0.6.5 \
-    crate://crates.io/socket2/0.4.9 \
-    crate://crates.io/spki/0.7.1 \
+    crate://crates.io/smallvec/1.13.1 \
+    crate://crates.io/socket2/0.5.5 \
+    crate://crates.io/spki/0.7.3 \
     crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strip-ansi-escapes/0.1.1 \
-    crate://crates.io/strsim/0.10.0 \
-    crate://crates.io/subtle/2.4.1 \
+    crate://crates.io/strsim/0.11.0 \
+    crate://crates.io/subtle/2.5.0 \
+    crate://crates.io/supports-hyperlinks/2.1.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.13 \
-    crate://crates.io/tar/0.4.38 \
-    crate://crates.io/tempfile/3.5.0 \
-    crate://crates.io/termcolor/1.2.0 \
-    crate://crates.io/textwrap/0.16.0 \
+    crate://crates.io/syn/2.0.48 \
+    crate://crates.io/tar/0.4.40 \
+    crate://crates.io/tempfile/3.10.0 \
+    crate://crates.io/terminal_size/0.3.0 \
+    crate://crates.io/thiserror/1.0.56 \
+    crate://crates.io/thiserror-impl/1.0.56 \
     crate://crates.io/thread_local/1.1.7 \
-    crate://crates.io/time/0.3.20 \
-    crate://crates.io/time-core/0.1.0 \
-    crate://crates.io/time-macros/0.2.8 \
+    crate://crates.io/time/0.3.34 \
+    crate://crates.io/time-core/0.1.2 \
+    crate://crates.io/time-macros/0.2.17 \
     crate://crates.io/tinyvec/1.6.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/toml/0.5.11 \
-    crate://crates.io/toml/0.7.3 \
-    crate://crates.io/toml_datetime/0.5.1 \
-    crate://crates.io/toml_datetime/0.6.1 \
-    crate://crates.io/toml_edit/0.15.0 \
-    crate://crates.io/toml_edit/0.19.8 \
-    crate://crates.io/typenum/1.16.0 \
-    crate://crates.io/unicode-bidi/0.3.13 \
-    crate://crates.io/unicode-ident/1.0.8 \
+    crate://crates.io/toml/0.8.10 \
+    crate://crates.io/toml_datetime/0.6.5 \
+    crate://crates.io/toml_edit/0.21.1 \
+    crate://crates.io/toml_edit/0.22.4 \
+    crate://crates.io/tracing/0.1.40 \
+    crate://crates.io/tracing-attributes/0.1.27 \
+    crate://crates.io/tracing-core/0.1.32 \
+    crate://crates.io/tracing-log/0.2.0 \
+    crate://crates.io/tracing-subscriber/0.3.18 \
+    crate://crates.io/typenum/1.17.0 \
+    crate://crates.io/unicase/2.7.0 \
+    crate://crates.io/unicode-bidi/0.3.15 \
+    crate://crates.io/unicode-bom/2.0.3 \
+    crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unicode-normalization/0.1.22 \
-    crate://crates.io/unicode-width/0.1.10 \
+    crate://crates.io/unicode-width/0.1.11 \
     crate://crates.io/unicode-xid/0.2.4 \
-    crate://crates.io/url/2.3.1 \
+    crate://crates.io/url/2.5.0 \
     crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/valuable/0.1.0 \
     crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/vte/0.10.1 \
-    crate://crates.io/vte_generate_state_changes/0.1.1 \
-    crate://crates.io/walkdir/2.3.3 \
+    crate://crates.io/walkdir/2.4.0 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.84 \
-    crate://crates.io/wasm-bindgen-backend/0.2.84 \
-    crate://crates.io/wasm-bindgen-macro/0.2.84 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.84 \
-    crate://crates.io/wasm-bindgen-shared/0.2.84 \
+    crate://crates.io/wasm-bindgen/0.2.91 \
+    crate://crates.io/wasm-bindgen-backend/0.2.91 \
+    crate://crates.io/wasm-bindgen-macro/0.2.91 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.91 \
+    crate://crates.io/wasm-bindgen-shared/0.2.91 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-util/0.1.6 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.42.0 \
-    crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.48.0 \
-    crate://crates.io/windows-targets/0.42.2 \
-    crate://crates.io/windows-targets/0.48.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
-    crate://crates.io/windows_aarch64_msvc/0.42.2 \
-    crate://crates.io/windows_aarch64_msvc/0.48.0 \
-    crate://crates.io/windows_i686_gnu/0.42.2 \
-    crate://crates.io/windows_i686_gnu/0.48.0 \
-    crate://crates.io/windows_i686_msvc/0.42.2 \
-    crate://crates.io/windows_i686_msvc/0.48.0 \
-    crate://crates.io/windows_x86_64_gnu/0.42.2 \
-    crate://crates.io/windows_x86_64_gnu/0.48.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
-    crate://crates.io/windows_x86_64_msvc/0.42.2 \
-    crate://crates.io/windows_x86_64_msvc/0.48.0 \
-    crate://crates.io/winnow/0.4.1 \
-    crate://crates.io/zeroize/1.6.0 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.0 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.0 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.0 \
+    crate://crates.io/winnow/0.5.39 \
+    crate://crates.io/zerocopy/0.7.32 \
+    crate://crates.io/zerocopy-derive/0.7.32 \
+    crate://crates.io/zeroize/1.7.0 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
-SRC_URI[aho-corasick-0.7.20.sha256sum] = "cc936419f96fa211c1b9166887b38e5e40b19958e5b895be7c1f93adec7071ac"
-SRC_URI[anstream-0.2.6.sha256sum] = "342258dd14006105c2b75ab1bd7543a03bdf0cfc94383303ac212a04939dff6f"
-SRC_URI[anstyle-0.3.5.sha256sum] = "23ea9e81bd02e310c216d080f6223c179012256e5151c41db88d12c88a1684d2"
-SRC_URI[anstyle-parse-0.1.1.sha256sum] = "a7d1bb534e9efed14f3e5f44e7dd1a4f709384023a4165199a4241e18dff0116"
-SRC_URI[anstyle-wincon-0.2.0.sha256sum] = "c3127af6145b149f3287bb9a0d10ad9c5692dba8c53ad48285e5bec4063834fa"
-SRC_URI[anyhow-1.0.70.sha256sum] = "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
-SRC_URI[arrayvec-0.5.2.sha256sum] = "23b62fc65de8e4e7f52534fb52b0f3ed04746ae267519eef2a83941e8085068b"
-SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
+SRC_URI[ahash-0.8.7.sha256sum] = "77c3a9648d43b9cd48db467b3f87fdd6e146bcc88ab0180006cef2179fe11d01"
+SRC_URI[aho-corasick-1.1.2.sha256sum] = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
+SRC_URI[allocator-api2-0.2.16.sha256sum] = "0942ffc6dcaadf03badf6e6a2d0228460359d5e34b57ccdc720b7382dfbd5ec5"
+SRC_URI[anstream-0.6.11.sha256sum] = "6e2e1ebcb11de5c03c67de28a7df593d32191b44939c482e97702baaaa6ab6a5"
+SRC_URI[anstyle-1.0.6.sha256sum] = "8901269c6307e8d93993578286ac0edf7f195079ffff5ebdeea6a59ffb7e36bc"
+SRC_URI[anstyle-parse-0.2.3.sha256sum] = "c75ac65da39e5fe5ab759307499ddad880d724eed2f6ce5b5e8a26f4f387928c"
+SRC_URI[anstyle-query-1.0.2.sha256sum] = "e28923312444cdd728e4738b3f9c9cac739500909bb3d3c94b43551b16517648"
+SRC_URI[anstyle-wincon-3.0.2.sha256sum] = "1cd54b81ec8d6180e24654d0b371ad22fc3dd083b6ff8ba325b72e00c87660a7"
+SRC_URI[anyhow-1.0.79.sha256sum] = "080e9890a082662b09c1ad45f567faeeb47f22b5fb23895fbe1e651e718e25ca"
+SRC_URI[arc-swap-1.6.0.sha256sum] = "bddcadddf5e9015d310179a59bb28c4d4b9920ad0f11e8e14dbadf654890c9a6"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
 SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
-SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
+SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[base64ct-1.6.0.sha256sum] = "8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
 SRC_URI[bitmaps-2.1.0.sha256sum] = "031043d04099746d8db04daf1fa424b2bc8bd69d92b25962dcde24da39ab64a2"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[bstr-1.4.0.sha256sum] = "c3d4260bcc2e8fc9df1eac4919a720effeb63a3f0952f5bf4944adfa18897f09"
-SRC_URI[bumpalo-3.12.0.sha256sum] = "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535"
-SRC_URI[bytes-1.4.0.sha256sum] = "89b2fd2a0dcf38d7971e2194b6b6eebab45ae01067456a7fd93d5547a61b70be"
-SRC_URI[bytesize-1.2.0.sha256sum] = "38fcc2979eff34a4b84e1cf9a1e3da42a7d44b3b690a40cdcb23e3d556cfb2e5"
-SRC_URI[cargo-0.69.1.sha256sum] = "2ecf1ab9246253733b30352b5194b4c3a7038a1c7729e1a18b3ba00e479c4d54"
-SRC_URI[cargo-platform-0.1.2.sha256sum] = "cbdb825da8a5df079a43676dbe042702f1707b1109f713a01420fbb4cc71fa27"
-SRC_URI[cargo-util-0.2.3.sha256sum] = "e4e0cd00582e110eb8d99de768521d36fce9e24a286babf3cea68824ae09948f"
-SRC_URI[cbindgen-0.24.3.sha256sum] = "a6358dedf60f4d9b8db43ad187391afe959746101346fe51bb978126bec61dfb"
-SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[bstr-1.9.0.sha256sum] = "c48f0051a4b4c5e0b6d365cd04af53aeaa209e3cc15ec2cdb69e73cc87fbd0dc"
+SRC_URI[btoi-0.4.3.sha256sum] = "9dd6407f73a9b8b6162d8a2ef999fe6afd7cc15902ebf42c5cd296addf17e0ad"
+SRC_URI[bumpalo-3.14.0.sha256sum] = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec"
+SRC_URI[bytes-1.5.0.sha256sum] = "a2bd12c1caf447e69cd4528f47f94d203fd2582878ecb9e9465484c4148a8223"
+SRC_URI[bytesize-1.3.0.sha256sum] = "a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc"
+SRC_URI[cargo-0.77.0.sha256sum] = "4a399e5bde59d144aa2c7ba643765e2f8c6c3c601daa2da03202caf66f2552b3"
+SRC_URI[cargo-credential-0.4.2.sha256sum] = "ec27ad011c37339b865c765fa28096cd63d5b25fab680c04d9e410cb586c327d"
+SRC_URI[cargo-credential-libsecret-0.4.2.sha256sum] = "26b0ff7a44dd0af0fcd8d09bb1a6d7f7652847cba10aad017a6ea0a25ba7f00f"
+SRC_URI[cargo-credential-macos-keychain-0.4.2.sha256sum] = "4b7cf89a47dc2c20ae3a7c94335e151be32c20f85cc2790defdb1f5dac818de5"
+SRC_URI[cargo-credential-wincred-0.4.2.sha256sum] = "341df45dc893bdffa36e2f7cbe3da90b38c5c74e7f4c0088ac801fd055b6df5b"
+SRC_URI[cargo-platform-0.1.7.sha256sum] = "694c8807f2ae16faecc43dc17d74b3eb042482789fd0eb64b39a2e04e087053f"
+SRC_URI[cargo-util-0.2.9.sha256sum] = "74862c3c6e53a1c1f8f0178f9d38ab41e49746cd3a7cafc239b3d0248fd4e342"
+SRC_URI[cbindgen-0.26.0.sha256sum] = "da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49"
+SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clap-3.2.23.sha256sum] = "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
-SRC_URI[clap-4.2.1.sha256sum] = "046ae530c528f252094e4a77886ee1374437744b2bff1497aa898bbddbbb29b3"
-SRC_URI[clap_builder-4.2.1.sha256sum] = "223163f58c9a40c3b0a43e1c4b50a9ce09f007ea2cb1ec258a687945b4b7929f"
-SRC_URI[clap_derive-4.2.0.sha256sum] = "3f9644cd56d6b87dbe899ef8b053e331c0637664e9e21a33dfcdc36093f5c5c4"
-SRC_URI[clap_lex-0.2.4.sha256sum] = "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
-SRC_URI[clap_lex-0.4.1.sha256sum] = "8a2dd5a6fe8c6e3502f568a6353e5273bbb15193ad9a89e457b9970798efbea1"
-SRC_URI[combine-4.6.6.sha256sum] = "35ed6e9d84f0b51a7f52daf1c7d71dd136fd7a3f41a8462b8cdb8c78d920fad4"
-SRC_URI[commoncrypto-0.2.0.sha256sum] = "d056a8586ba25a1e4d61cb090900e495952c7886786fc55f909ab2f819b69007"
-SRC_URI[commoncrypto-sys-0.2.0.sha256sum] = "1fed34f46747aa73dfaa578069fd8279d2818ade2b55f38f22a9401c7f4083e2"
-SRC_URI[concolor-override-1.0.0.sha256sum] = "a855d4a1978dc52fb0536a04d384c2c0c1aa273597f08b77c8c4d3b2eec6037f"
-SRC_URI[concolor-query-0.3.3.sha256sum] = "88d11d52c3d7ca2e6d0040212be9e4dbbcd78b6447f535b6b561f449427944cf"
-SRC_URI[const-oid-0.9.2.sha256sum] = "520fbf3c07483f94e3e3ca9d0cfd913d7718ef2483d2cfd91c0d9e91474ab913"
-SRC_URI[core-foundation-0.9.3.sha256sum] = "194a7a9e6de53fa55116934067c844d9d749312f75c6f6d0980e8c252f8c2146"
-SRC_URI[core-foundation-sys-0.8.4.sha256sum] = "e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa"
-SRC_URI[cpufeatures-0.2.6.sha256sum] = "280a9f2d8b3a38871a3c8a46fb80db65e5e5ed97da80c4d08bf27fb63e35e181"
-SRC_URI[crates-io-0.35.1.sha256sum] = "e2dfb6077da60207264ab2eb0e3734f02e0a0c50c347b32c728e42c6fbbf7e2e"
+SRC_URI[clap-4.5.0.sha256sum] = "80c21025abd42669a92efc996ef13cfb2c5c627858421ea58d5c3b331a6c134f"
+SRC_URI[clap_builder-4.5.0.sha256sum] = "458bf1f341769dfcf849846f65dffdf9146daa56bcd2a47cb4e1de9915567c99"
+SRC_URI[clap_derive-4.5.0.sha256sum] = "307bc0538d5f0f83b8248db3087aa92fe504e4691294d0c96c0eabc33f47ba47"
+SRC_URI[clap_lex-0.7.0.sha256sum] = "98cc8fbded0c607b7ba9dd60cd98df59af97e84d24e49c8557331cfc26d301ce"
+SRC_URI[clru-0.6.1.sha256sum] = "b8191fa7302e03607ff0e237d4246cc043ff5b3cb9409d995172ba3bea16b807"
+SRC_URI[color-print-0.3.5.sha256sum] = "7a858372ff14bab9b1b30ea504f2a4bc534582aee3e42ba2d41d2a7baba63d5d"
+SRC_URI[color-print-proc-macro-0.3.5.sha256sum] = "57e37866456a721d0a404439a1adae37a31be4e0055590d053dfe6981e05003f"
+SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
+SRC_URI[core-foundation-0.9.4.sha256sum] = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
+SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
+SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
+SRC_URI[crates-io-0.39.2.sha256sum] = "6622f902c3c338eced1f000091f034846ae36aadaf35d0acd1ab0469a2d8ef1f"
 SRC_URI[crc32fast-1.3.2.sha256sum] = "b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d"
-SRC_URI[crypto-bigint-0.5.1.sha256sum] = "7c2538c4e68e52548bacb3e83ac549f903d44f011ac9d5abb5e132e67d0808f7"
+SRC_URI[crossbeam-channel-0.5.11.sha256sum] = "176dc175b78f56c0f321911d9c8eb2b77a78a4860b9c19db83835fea1a46649b"
+SRC_URI[crossbeam-deque-0.8.5.sha256sum] = "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
+SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
+SRC_URI[crossbeam-utils-0.8.19.sha256sum] = "248e3bacc7dc6baa3b21e405ee045c3047101a49145e7e9eca583ab4c2ca5345"
+SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[crypto-hash-0.3.4.sha256sum] = "8a77162240fd97248d19a564a565eb563a3f592b386e4136fb300909e67dddca"
 SRC_URI[ct-codecs-1.1.1.sha256sum] = "f3b7eb4404b8195a9abb6356f4ac07d8ba267045c8d6d220ac4dc992e6cc75df"
-SRC_URI[curl-0.4.44.sha256sum] = "509bd11746c7ac09ebd19f0b17782eae80aadee26237658a6b4808afb5c11a22"
-SRC_URI[curl-sys-0.4.61+curl-8.0.1.sha256sum] = "14d05c10f541ae6f3bc5b3d923c20001f47db7d5f0b2bc6ad16490133842db79"
-SRC_URI[der-0.7.3.sha256sum] = "82b10af9f9f9f2134a42d3f8aa74658660f2e0234b0eb81bd171df8aa32779ed"
-SRC_URI[digest-0.10.6.sha256sum] = "8168378f4e5023e7218c89c891c0fd8ecdb5e5e4f18cb78f38cf245dd021e76f"
-SRC_URI[ecdsa-0.16.6.sha256sum] = "a48e5d537b8a30c0b023116d981b16334be1485af7ca68db3a2b7024cbc957fd"
-SRC_URI[ed25519-compact-2.0.4.sha256sum] = "6a3d382e8464107391c8706b4c14b087808ecb909f6c15c34114bc42e53a9e4c"
-SRC_URI[either-1.8.1.sha256sum] = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
-SRC_URI[elliptic-curve-0.13.4.sha256sum] = "75c71eaa367f2e5d556414a8eea812bc62985c879748d6403edabd9cb03f16e7"
-SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
-SRC_URI[errno-0.3.1.sha256sum] = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a"
-SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
-SRC_URI[fastrand-1.9.0.sha256sum] = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
+SRC_URI[curl-0.4.45.sha256sum] = "f8e5123ab8c31200ce725939049ecd4a090b242608f24048131dedf9dd195aed"
+SRC_URI[curl-sys-0.4.72+curl-8.6.0.sha256sum] = "29cbdc8314c447d11e8fd156dcdd031d9e02a7a976163e396b548c03153bc9ea"
+SRC_URI[der-0.7.8.sha256sum] = "fffa369a668c8af7dbf8b5e56c9f744fbd399949ed171606040001947de40b1c"
+SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
+SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
+SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
+SRC_URI[ed25519-compact-2.1.1.sha256sum] = "e9b3460f44bea8cd47f45a0c70892f1eff856d97cd55358b2f73f663789f6190"
+SRC_URI[either-1.9.0.sha256sum] = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
+SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
+SRC_URI[encoding_rs-0.8.33.sha256sum] = "7268b386296a025e474d5140678f75d6de9493ae55a5d709eeb9dd08149945e1"
+SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+SRC_URI[erased-serde-0.4.2.sha256sum] = "55d05712b2d8d88102bc9868020c9e5c7a1f5527c452b9b97450a1d006140ba7"
+SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
+SRC_URI[fallible-iterator-0.3.0.sha256sum] = "2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649"
+SRC_URI[fallible-streaming-iterator-0.1.9.sha256sum] = "7360491ce676a36bf9bb3c56c1aa791658183a54d2744120f27285738d90465a"
+SRC_URI[faster-hex-0.9.0.sha256sum] = "a2a2b11eda1d40935b26cf18f6833c526845ae8c41e58d09af6adeb6f0269183"
+SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
 SRC_URI[ff-0.13.0.sha256sum] = "ded41244b729663b1e574f1b4fb731469f69f79c17667b5d776b16cda0479449"
-SRC_URI[fiat-crypto-0.1.20.sha256sum] = "e825f6987101665dea6ec934c09ec6d721de7bc1bf92248e1d5810c8cd636b77"
-SRC_URI[filetime-0.2.21.sha256sum] = "5cbc844cecaee9d4443931972e1289c8ff485cb4cc2767cb03ca139ed6885153"
-SRC_URI[flate2-1.0.25.sha256sum] = "a8a2db397cb1c8772f31494cb8917e48cd1e64f0fa7efac59fbd741a0a8ce841"
-SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
+SRC_URI[fiat-crypto-0.2.6.sha256sum] = "1676f435fc1dadde4d03e43f5d62b259e1ce5f40bd4ffb21db2b42ebe59c1382"
+SRC_URI[filetime-0.2.23.sha256sum] = "1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd"
+SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[form_urlencoded-1.1.0.sha256sum] = "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8"
-SRC_URI[fwdansi-1.1.0.sha256sum] = "08c1f5787fe85505d1f7777268db5103d80a7a374d2316a7ce262e57baf8f208"
+SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.9.sha256sum] = "c85e1d9ab2eadba7e5040d4e09cbd6d072b76a557ad64e797c2cb9d4da21d7e4"
-SRC_URI[git2-0.16.0.sha256sum] = "be36bc9e0546df253c0cc41fd0af34f5e92845ad8509462ec76672fac6997f5b"
-SRC_URI[git2-curl-0.17.0.sha256sum] = "7577f4e6341ba7c90d883511130a45b956c274ba5f4d205d9f9da990f654cd33"
+SRC_URI[getrandom-0.2.12.sha256sum] = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5"
+SRC_URI[git2-0.18.2.sha256sum] = "1b3ba52851e73b46a4c3df1d89343741112003f0f6f13beb0dfac9e457c3fdcd"
+SRC_URI[git2-curl-0.19.0.sha256sum] = "78e26b61608c573ffd26fc79061a823aa5147449a1afe1f61679a21e2031f7c3"
+SRC_URI[gix-0.56.0.sha256sum] = "5b0dcdc9c60d66535897fa40a7ea2a635e72f99456b1d9ae86b7e170e80618cb"
+SRC_URI[gix-actor-0.28.1.sha256sum] = "2eadca029ef716b4378f7afb19f7ee101fde9e58ba1f1445971315ac866db417"
+SRC_URI[gix-attributes-0.20.1.sha256sum] = "0f395469d38c76ec47cd1a6c5a53fbc3f13f737b96eaf7535f4e6b367e643381"
+SRC_URI[gix-bitmap-0.2.10.sha256sum] = "78b6cd0f246180034ddafac9b00a112f19178135b21eb031b3f79355891f7325"
+SRC_URI[gix-chunk-0.4.7.sha256sum] = "003ec6deacf68076a0c157271a127e0bb2c031c1a41f7168cbe5d248d9b85c78"
+SRC_URI[gix-command-0.3.4.sha256sum] = "c82b5e9494e61983e61049bbd15fe0fa6b70672dd236362bdb5b2b50fc428f10"
+SRC_URI[gix-commitgraph-0.22.1.sha256sum] = "85a7007ba021f059803afaf6f8a48872422abc20550ac12ede6ddea2936cec36"
+SRC_URI[gix-config-0.32.1.sha256sum] = "0341471d55d8676e98b88e121d7065dfa4c9c5acea4b6d6ecdd2846e85cce0c3"
+SRC_URI[gix-config-value-0.14.4.sha256sum] = "5b8a1e7bfb37a46ed0b8468db37a6d8a0a61d56bdbe4603ae492cb322e5f3958"
+SRC_URI[gix-credentials-0.22.0.sha256sum] = "513dac42450b27946bd0a0535a3a5a88e473d6522e5e3439a129cab779c88f3d"
+SRC_URI[gix-date-0.8.3.sha256sum] = "fb7f3dfb72bebe3449b5e642be64e3c6ccbe9821c8b8f19f487cf5bfbbf4067e"
+SRC_URI[gix-diff-0.38.0.sha256sum] = "8119a985887cfe68f4bdf92e51bd64bc758a73882d82fcfc03ebcb164441c85d"
+SRC_URI[gix-discover-0.27.0.sha256sum] = "6fad89416ebe0b3b7df78464124e2a02417b6cd3743d48ad93df86f4d2929c07"
+SRC_URI[gix-features-0.35.0.sha256sum] = "9b9ff423ae4983f762659040d13dd7a5defbd54b6a04ac3cc7347741cec828cd"
+SRC_URI[gix-features-0.36.1.sha256sum] = "4d46a4a5c6bb5bebec9c0d18b65ada20e6517dbd7cf855b87dd4bbdce3a771b2"
+SRC_URI[gix-filter-0.7.0.sha256sum] = "6d6a5c9d8e55c364e7c226919c19c9a28be1392d6208b5008059fa94ff7e2bf0"
+SRC_URI[gix-fs-0.8.1.sha256sum] = "20e86eb040f5776a5ade092282e51cdcad398adb77d948b88d17583c2ae4e107"
+SRC_URI[gix-glob-0.14.1.sha256sum] = "5db19298c5eeea2961e5b3bf190767a2d1f09b8802aeb5f258e42276350aff19"
+SRC_URI[gix-hash-0.13.3.sha256sum] = "1f8cf8c2266f63e582b7eb206799b63aa5fa68ee510ad349f637dfe2d0653de0"
+SRC_URI[gix-hashtable-0.4.1.sha256sum] = "feb61880816d7ec4f0b20606b498147d480860ddd9133ba542628df2f548d3ca"
+SRC_URI[gix-ignore-0.9.1.sha256sum] = "a215cc8cf21645bca131fcf6329d3ebd46299c47dbbe27df71bb1ca9e328b879"
+SRC_URI[gix-index-0.27.1.sha256sum] = "f3f308f5cd2992e96a274b0d1931e9a0e44fdcba87695ead3f6df30d8a697e9c"
+SRC_URI[gix-lock-11.0.1.sha256sum] = "7e5c65e6a29830a435664891ced3f3c1af010f14900226019590ee0971a22f37"
+SRC_URI[gix-macros-0.1.3.sha256sum] = "d75e7ab728059f595f6ddc1ad8771b8d6a231971ae493d9d5948ecad366ee8bb"
+SRC_URI[gix-negotiate-0.10.0.sha256sum] = "979f6accd9c051b3dd018b50adf29c0a2459edddf6105cc70b767976cd6f8014"
+SRC_URI[gix-object-0.39.0.sha256sum] = "febf79c5825720c1c63fe974c7bbe695d0cb54aabad73f45671c60ce0e501e33"
+SRC_URI[gix-odb-0.55.0.sha256sum] = "1fae5f971540c99c6ecc8d4368ecc9d18a9dc8b9391025c68c4399747dc93bac"
+SRC_URI[gix-pack-0.45.0.sha256sum] = "4569491c92446fddf373456ff360aff9a9effd627b40a70f2d7914dcd75a3205"
+SRC_URI[gix-packetline-0.17.3.sha256sum] = "09ff45eef7747bde4986429a3e813478d50c2688b8f239e57bd3aa81065b285f"
+SRC_URI[gix-packetline-blocking-0.17.3.sha256sum] = "ca8ef6dd3ea50e26f3bf572e90c034d033c804d340cd1eb386392f184a9ba2f7"
+SRC_URI[gix-path-0.10.5.sha256sum] = "97e9ad649bf5e109562d6acba657ca428661ec08e77eaf3a755d8fa55485be9c"
+SRC_URI[gix-pathspec-0.4.1.sha256sum] = "1dbbb92f75a38ef043c8bb830b339b38d0698d7f3746968b5fcbade7a880494d"
+SRC_URI[gix-prompt-0.8.2.sha256sum] = "02bd89d058258e53e0fd6c57f13ee16c5673a83066a68e11f88626fc8cfda5f6"
+SRC_URI[gix-protocol-0.42.0.sha256sum] = "95736ef407db0bd15a5bdea791fbfcf523b9f13b96c852c240cd86a9ee0ef817"
+SRC_URI[gix-quote-0.4.10.sha256sum] = "9f7dc10303d73a960d10fb82f81188b036ac3e6b11b5795b20b1a60b51d1321f"
+SRC_URI[gix-ref-0.39.1.sha256sum] = "3b2069adc212cf7f3317ef55f6444abd06c50f28479dbbac5a86acf3b05cbbfe"
+SRC_URI[gix-refspec-0.20.0.sha256sum] = "76d9d3b82e1ee78fc0dc1c37ea5ea76c2dbc73f407db155f0dfcea285e583bee"
+SRC_URI[gix-revision-0.24.0.sha256sum] = "fe5dd51710ce5434bc315ea30394fab483c5377276494edd79222b321a5a9544"
+SRC_URI[gix-revwalk-0.10.0.sha256sum] = "69d4ed2493ca94a475fdf147138e1ef8bab3b6ebb56abf3d9bda1c05372ec1dd"
+SRC_URI[gix-sec-0.10.4.sha256sum] = "f8d9bf462feaf05f2121cba7399dbc6c34d88a9cad58fc1e95027791d6a3c6d2"
+SRC_URI[gix-submodule-0.6.0.sha256sum] = "02a3d7f60a95bdcaeb8981663c99d1c9f4de42aab1169524c949e948989809f9"
+SRC_URI[gix-tempfile-11.0.1.sha256sum] = "388dd29114a86ec69b28d1e26d6d63a662300ecf61ab3f4cc578f7d7dc9e7e23"
+SRC_URI[gix-trace-0.1.7.sha256sum] = "02b202d766a7fefc596e2cc6a89cda8ad8ad733aed82da635ac120691112a9b1"
+SRC_URI[gix-transport-0.39.0.sha256sum] = "f731cfefc4d62468c6dd2053f5c6707828256a6d2f5488c1811e3f42c178b144"
+SRC_URI[gix-traverse-0.35.0.sha256sum] = "df2112088122a0206592c84fbd42020db63b2ccaed66a0293779f2e5fbf80474"
+SRC_URI[gix-url-0.25.2.sha256sum] = "0c427a1a11ccfa53a4a2da47d9442c2241deee63a154bc15cc14b8312fbc4005"
+SRC_URI[gix-utils-0.1.9.sha256sum] = "56e839f3d0798b296411263da6bee780a176ef8008a5dfc31287f7eda9266ab8"
+SRC_URI[gix-validate-0.8.3.sha256sum] = "ac7cc36f496bd5d96cdca0f9289bb684480725d40db60f48194aa7723b883854"
+SRC_URI[gix-worktree-0.28.0.sha256sum] = "7f1d0ae01dee14abe8c8117d78d7518f9a507de2dc4522546fbf4c444e9860b4"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
-SRC_URI[globset-0.4.10.sha256sum] = "029d74589adefde59de1a0c4f4732695c32805624aec7b68d91503d4dba79afc"
+SRC_URI[globset-0.4.14.sha256sum] = "57da3b9b5b85bd66f31093f8c408b90a74431672542466497dcbdfdc02034be1"
 SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
 SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
+SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
+SRC_URI[hashlink-0.8.4.sha256sum] = "e8094feaf31ff591f651a2664fb9cfd92bba7a60ce3197265e9482ebe753c8f7"
 SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hermit-abi-0.3.1.sha256sum] = "fed44880c466736ef9a5c5b5facefb5ed0785676d0c02d612db14e54f0d84286"
-SRC_URI[hex-0.3.2.sha256sum] = "805026a5d0141ffc30abb3be3173848ad46a1b1664fe632428479619a3644d77"
+SRC_URI[hermit-abi-0.3.5.sha256sum] = "d0c62115964e08cb8039170eb33c1d0e2388a256930279edca206fff675f82c3"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
-SRC_URI[hkdf-0.12.3.sha256sum] = "791a029f6b9fc27657f6f188ec6e5e43f6911f6f878e0dc5501396e09809d437"
+SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
 SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
-SRC_URI[home-0.5.4.sha256sum] = "747309b4b440c06d57b0b25f2aee03ee9b5e5397d288c60e21fc709bb98a7408"
-SRC_URI[http-auth-0.1.8.sha256sum] = "5430cacd7a1f9a02fbeb350dfc81a0e5ed42d81f3398cb0ba184017f85bdcfbc"
+SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
+SRC_URI[http-auth-0.1.9.sha256sum] = "643c9bbf6a4ea8a656d6b4cd53d34f79e3f841ad5203c1a55fb7d761923bc255"
 SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
-SRC_URI[idna-0.3.0.sha256sum] = "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
-SRC_URI[ignore-0.4.20.sha256sum] = "dbe7873dab538a9a44ad79ede1faf5f30d49f9a5c883ddbab48bce81b64b7492"
+SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
+SRC_URI[ignore-0.4.22.sha256sum] = "b46810df39e66e925525d6e38ce1e7f6e1d208f72dc39757880fcb66e2c58af1"
 SRC_URI[im-rc-15.1.0.sha256sum] = "af1955a75fa080c677d3972822ec4bad316169ab1cfc6c257a942c2265dbe5fe"
 SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
-SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[io-lifetimes-1.0.10.sha256sum] = "9c66c74d2ae7e79a5a8f7ac924adbe38ee42a859c6539ad869eb51f0b52dc220"
-SRC_URI[is-terminal-0.4.7.sha256sum] = "adcf93614601c8129ddf72e2d5633df827ba6551541c6d8c59520a371475be1f"
-SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
-SRC_URI[itoa-1.0.6.sha256sum] = "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6"
-SRC_URI[jobserver-0.1.26.sha256sum] = "936cfd212a0155903bcbc060e316fb6cc7cbf2e1907329391ebadc1fe0ce77c2"
-SRC_URI[js-sys-0.3.61.sha256sum] = "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730"
+SRC_URI[indexmap-2.2.2.sha256sum] = "824b2ae422412366ba479e8111fd301f7b5faece8149317bb81925979a53f520"
+SRC_URI[is-terminal-0.4.11.sha256sum] = "fe8f25ce1159c7740ff0b9b2f5cdf4a8428742ba7c112b9f20f22cd5219c7dab"
+SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
+SRC_URI[itoa-1.0.10.sha256sum] = "b1a46d1a171d865aa5f83f92695765caa047a9b4cbae2cbf37dbd613a793fd4c"
+SRC_URI[jobserver-0.1.28.sha256sum] = "ab46a6e9526ddef3ae7f787c06f0f2600639ba80ea3eade3d8e670a2230f51d6"
+SRC_URI[js-sys-0.3.68.sha256sum] = "406cda4b368d531c842222cf9d2600a9a4acce8d29423695379c6868a143a9ee"
 SRC_URI[kstring-2.0.0.sha256sum] = "ec3066350882a1cd6d950d055997f379ac37fd39f81cd4d8ed186032eb3c5747"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
 SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.141.sha256sum] = "3304a64d199bb964be99741b7a14d26972741915b3649639149b2479bb46f4b5"
-SRC_URI[libgit2-sys-0.14.1+1.5.0.sha256sum] = "4a07fb2692bc3593bda59de45a502bb3071659f2c515e28c71e728306b038e17"
-SRC_URI[libnghttp2-sys-0.1.7+1.45.0.sha256sum] = "57ed28aba195b38d5ff02b9170cbff627e336a20925e43b4945390401c5dc93f"
-SRC_URI[libssh2-sys-0.2.23.sha256sum] = "b094a36eb4b8b8c8a7b4b8ae43b2944502be3e59cd87687595cf6b0a71b3f4ca"
-SRC_URI[libz-sys-1.1.8.sha256sum] = "9702761c3935f8cc2f101793272e202c72b99da8f4224a19ddcf1279a6450bbf"
-SRC_URI[linux-raw-sys-0.3.1.sha256sum] = "d59d8c75012853d2e872fb56bc8a2e53718e2cafe1a4c823143141c6d90c322f"
-SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
-SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
-SRC_URI[miniz_oxide-0.6.2.sha256sum] = "b275950c28b37e794e8c55d88aeb5e139d0ce23fdbbeda68f8d7174abdf9e8fa"
-SRC_URI[miow-0.5.0.sha256sum] = "52ffbca2f655e33c08be35d87278e5b18b89550a37dbd598c20db92f6a471123"
-SRC_URI[num-traits-0.2.15.sha256sum] = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
-SRC_URI[once_cell-1.17.1.sha256sum] = "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
-SRC_URI[opener-0.5.2.sha256sum] = "293c15678e37254c15bd2f092314abb4e51d7fdde05c2021279c12631b54f005"
-SRC_URI[openssl-0.10.50.sha256sum] = "7e30d8bc91859781f0a943411186324d580f2bbeb71b452fe91ae344806af3f1"
+SRC_URI[libc-0.2.153.sha256sum] = "9c198f91728a82281a64e1f4f9eeb25d82cb32a5de251c6bd1b5154d63a8e7bd"
+SRC_URI[libgit2-sys-0.16.2+1.7.2.sha256sum] = "ee4126d8b4ee5c9d9ea891dd875cfdc1e9d0950437179104b183d7d8a74d24e8"
+SRC_URI[libloading-0.8.1.sha256sum] = "c571b676ddfc9a8c12f1f3d3085a7b163966a8fd8098a90640953ce5f6170161"
+SRC_URI[libnghttp2-sys-0.1.9+1.58.0.sha256sum] = "b57e858af2798e167e709b9d969325b6d8e9d50232fcbc494d7d54f976854a64"
+SRC_URI[libsqlite3-sys-0.27.0.sha256sum] = "cf4e226dcd58b4be396f7bd3c20da8fdee2911400705297ba7d2d7cc2c30f716"
+SRC_URI[libssh2-sys-0.3.0.sha256sum] = "2dc8a030b787e2119a731f1951d6a773e2280c660f8ec4b0f5e1505a386e71ee"
+SRC_URI[libz-sys-1.1.15.sha256sum] = "037731f5d3aaa87a5675e895b63ddff1a87624bc29f77004ea829809654e48f6"
+SRC_URI[linux-raw-sys-0.4.13.sha256sum] = "01cda141df6706de531b6c46c3a33ecca755538219bd484262fa09410c13539c"
+SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
+SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[matchers-0.1.0.sha256sum] = "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
+SRC_URI[maybe-async-0.2.9.sha256sum] = "afc95a651c82daf7004c824405aa1019723644950d488571bd718e3ed84646ed"
+SRC_URI[memchr-2.7.1.sha256sum] = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
+SRC_URI[memmap2-0.9.4.sha256sum] = "fe751422e4a8caa417e13c3ea66452215d7d63e19e604f4980461212f3ae1322"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[miniz_oxide-0.7.2.sha256sum] = "9d811f3e15f28568be3407c8e7fdb6514c1cda3cb30683f15b6a1a1dc4ea14a7"
+SRC_URI[miow-0.6.0.sha256sum] = "359f76430b20a79f9e20e115b3428614e654f04fab314482fc0fda0ebd3c6044"
+SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
+SRC_URI[normpath-1.1.1.sha256sum] = "ec60c60a693226186f5d6edf073232bfb6464ed97eb22cf3b01c1e8198fd97f5"
+SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
+SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
+SRC_URI[num-traits-0.2.18.sha256sum] = "da0df0e5185db44f69b44f26786fe401b6c293d1907744beaa7fa62b2e5a517a"
+SRC_URI[num_threads-0.1.6.sha256sum] = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[opener-0.6.1.sha256sum] = "6c62dcb6174f9cb326eac248f07e955d5d559c272730b6c03e396b443b562788"
+SRC_URI[openssl-0.10.63.sha256sum] = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.1.5.sha256sum] = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
-SRC_URI[openssl-src-111.25.2+1.1.1t.sha256sum] = "320708a054ad9b3bf314688b5db87cf4d6683d64cfc835e2337924ae62bf4431"
-SRC_URI[openssl-sys-0.9.85.sha256sum] = "0d3d193fb1488ad46ffe3aaabc912cc931d02ee8518fe2959aea8ef52718b0c0"
-SRC_URI[ordered-float-2.10.0.sha256sum] = "7940cf2ca942593318d07fcf2596cdca60a85c9e7fab408a5e21a4f9dcd40d87"
-SRC_URI[orion-0.17.4.sha256sum] = "cbe74a766292f94f7e69db5a7bf010eadd944f24186c463fe578a7e637582066"
+SRC_URI[openssl-src-300.2.2+3.2.1.sha256sum] = "8bbfad0063610ac26ee79f7484739e2b07555a75c42453b89263830b5c8103bc"
+SRC_URI[openssl-sys-0.9.99.sha256sum] = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
+SRC_URI[ordered-float-2.10.1.sha256sum] = "68f19d67e5a2795c94e73e0bb1cc1a7edeb2e28efd39e2e1c9b7a40c1108b11c"
+SRC_URI[orion-0.17.6.sha256sum] = "7abdb10181903c8c4b016ba45d6d6d5af1a1e2a461aa4763a83b87f5df4695e5"
 SRC_URI[os_info-3.7.0.sha256sum] = "006e42d5b888366f1880eda20371fedde764ed2213dc8496f49622fa0c99cd5e"
-SRC_URI[os_str_bytes-6.5.0.sha256sum] = "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
+SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
 SRC_URI[p384-0.13.0.sha256sum] = "70786f51bcc69f6a4c0360e063a4cac5419ef7c5cd5b3c99ad70f3be5ba79209"
-SRC_URI[pasetors-0.6.6.sha256sum] = "824bf633b85dc1dece2eb07161627ba5d90a951597cd5dbf8d85f4d82b7aea69"
+SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
+SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
+SRC_URI[pasetors-0.6.8.sha256sum] = "6b36d47c66f2230dd1b7143d9afb2b4891879020210eddf2ccb624e529b96dba"
 SRC_URI[pathdiff-0.2.1.sha256sum] = "8835116a5c179084a830efb3adc117ab007512b535bc1a21c991d3b32a6b44dd"
 SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
-SRC_URI[percent-encoding-2.2.0.sha256sum] = "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e"
+SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+SRC_URI[pin-project-lite-0.2.13.sha256sum] = "8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58"
 SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
-SRC_URI[pkg-config-0.3.26.sha256sum] = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
-SRC_URI[primeorder-0.13.1.sha256sum] = "cf8d3875361e28f7753baefef104386e7aa47642c93023356d97fdef4003bfb5"
-SRC_URI[proc-macro2-1.0.56.sha256sum] = "2b63bdb0cd06f1f4dedf69b254734f9b45af66e4a031e42a7480257d9898b435"
-SRC_URI[quote-1.0.26.sha256sum] = "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
+SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
+SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
+SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
+SRC_URI[prodash-26.2.2.sha256sum] = "794b5bf8e2d19b53dcdcec3e4bba628e20f5b6062503ba89281fa7037dd7bbcf"
+SRC_URI[pulldown-cmark-0.9.6.sha256sum] = "57206b407293d2bcd3af849ce869d52068623f19e1b5ff8e8778e3309439682b"
+SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_xoshiro-0.6.0.sha256sum] = "6f97cdb2a36ed4183de61b2f824cc45c9f1037f28afe0a322e9fff4c108b5aaa"
-SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
-SRC_URI[regex-1.7.3.sha256sum] = "8b1f693b24f6ac912f4893ef08244d70b6067480d2f1a46e950c9691e6749d1d"
+SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+SRC_URI[regex-1.10.3.sha256sum] = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15"
 SRC_URI[regex-automata-0.1.10.sha256sum] = "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
+SRC_URI[regex-automata-0.4.5.sha256sum] = "5bb987efffd3c6d0d8f5f89510bb458559eab11e4f869acb20bf845e016259cd"
 SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
+SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
 SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
-SRC_URI[rustc-workspace-hack-1.0.0.sha256sum] = "fc71d2faa173b74b232dedc235e3ee1696581bb132fc116fa3626d6151a1a8fb"
-SRC_URI[rustfix-0.6.1.sha256sum] = "ecd2853d9e26988467753bd9912c3a126f642d05d229a4b53f5752ee36c56481"
-SRC_URI[rustix-0.37.11.sha256sum] = "85597d61f83914ddeba6a47b3b8ffe7365107221c2e557ed94426489fefb5f77"
-SRC_URI[ryu-1.0.13.sha256sum] = "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041"
+SRC_URI[rusqlite-0.30.0.sha256sum] = "a78046161564f5e7cd9008aff3b2990b3850dc8e0349119b98e8f251e099f24d"
+SRC_URI[rustfix-0.7.0.sha256sum] = "7ec10cbeb92a2e494ef354d66126882da8c0a244ad769e2a7193efc5de625175"
+SRC_URI[rustix-0.38.31.sha256sum] = "6ea3e1a662af26cd7a3ba09c0297a31af215563ecf42817c98df621387f4e949"
+SRC_URI[ryu-1.0.16.sha256sum] = "f98d2aa92eebf49b69786be48e4477826b256916e84a57ff2a4f21923b48eb4c"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schannel-0.1.21.sha256sum] = "713cfb06c7059f3588fb8044c0fad1d09e3c01d225e25b9220dbfdcf16dbb1b3"
-SRC_URI[sec1-0.7.2.sha256sum] = "f0aec48e813d6b90b15f0b8948af3c63483992dee44c03e9930b3eebdabe046e"
-SRC_URI[semver-1.0.17.sha256sum] = "bebd363326d05ec3e2f532ab7660680f3b02130d780c299bca73469d521bc0ed"
-SRC_URI[serde-1.0.160.sha256sum] = "bb2f3770c8bce3bcda7e149193a069a0f4365bda1fa5cd88e03bca26afc1216c"
+SRC_URI[schannel-0.1.23.sha256sum] = "fbc91545643bcf3a0bbb6569265615222618bdf33ce4ffbbd13c4bbd4c093534"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
+SRC_URI[security-framework-2.9.2.sha256sum] = "05b64fb303737d99b81884b2c63433e9ae28abebe5eb5045dcdd175dc2ecf4de"
+SRC_URI[security-framework-sys-2.9.1.sha256sum] = "e932934257d3b408ed8f30db49d85ea163bfe74961f017f405b025af298f0c7a"
+SRC_URI[semver-1.0.21.sha256sum] = "b97ed7a9823b74f99c7742f5336af7be5ecd3eeafcb1507d1fa93347b1d589b0"
+SRC_URI[serde-1.0.196.sha256sum] = "870026e60fa08c69f064aa766c10f10b1d62db9ccd4d0abb206472bee0ce3b32"
+SRC_URI[serde-untagged-0.1.5.sha256sum] = "6a160535368dfc353348e7eaa299156bd508c60c45a9249725f5f6d370d82a66"
 SRC_URI[serde-value-0.7.0.sha256sum] = "f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c"
-SRC_URI[serde_derive-1.0.160.sha256sum] = "291a097c63d8497e00160b166a967a4a79c64f3facdd01cbd7502231688d77df"
-SRC_URI[serde_ignored-0.1.7.sha256sum] = "94eb4a4087ba8bdf14a9208ac44fddbf55c01a6195f7edfc511ddaff6cae45a6"
-SRC_URI[serde_json-1.0.95.sha256sum] = "d721eca97ac802aa7777b701877c8004d950fc142651367300d21c1cc0194744"
-SRC_URI[serde_spanned-0.6.1.sha256sum] = "0efd8caf556a6cebd3b285caf480045fcc1ac04f6bd786b09a6f11af30c4fcf4"
-SRC_URI[sha1-0.10.5.sha256sum] = "f04293dc80c3993519f2d7f6f511707ee7094fe0c6d3406feb330cdb3540eba3"
-SRC_URI[sha2-0.10.6.sha256sum] = "82e6b795fe2e3b1e845bafcb27aa35405c4d47cdfc92af5fc8d3002f76cebdc0"
+SRC_URI[serde_derive-1.0.196.sha256sum] = "33c85360c95e7d137454dc81d9a4ed2b8efd8fbe19cee57357b32b9771fccb67"
+SRC_URI[serde_ignored-0.1.10.sha256sum] = "a8e319a36d1b52126a0d608f24e93b2d81297091818cd70625fcf50a15d84ddf"
+SRC_URI[serde_json-1.0.113.sha256sum] = "69801b70b1c3dac963ecb03a364ba0ceda9cf60c71cfe475e99864759c8b8a79"
+SRC_URI[serde_spanned-0.6.5.sha256sum] = "eb3622f419d1296904700073ea6cc23ad690adbd66f13ea683df73298736f0c1"
+SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
+SRC_URI[sha1_smol-1.0.0.sha256sum] = "ae1a47186c03a32177042e55dbc5fd5aee900b8e0069a8d70fba96a9375cd012"
+SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shell-escape-0.1.5.sha256sum] = "45bb67a18fa91266cc7807181f62f9178a6873bfad7dc788c42e6430db40184f"
-SRC_URI[signature-2.1.0.sha256sum] = "5e1788eed21689f9cf370582dfc467ef36ed9c707f073528ddafa8d83e3b8500"
+SRC_URI[shell-words-1.1.0.sha256sum] = "24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde"
+SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
 SRC_URI[sized-chunks-0.6.5.sha256sum] = "16d69225bde7a69b235da73377861095455d298f2b970996eec25ddbb42b3d1e"
-SRC_URI[socket2-0.4.9.sha256sum] = "64a4a911eed85daf18834cfaa86a79b7d266ff93ff5ba14005426219480ed662"
-SRC_URI[spki-0.7.1.sha256sum] = "37a5be806ab6f127c3da44b7378837ebf01dadca8510a0e572460216b228bd0e"
+SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
+SRC_URI[socket2-0.5.5.sha256sum] = "7b5fac59a5cb5dd637972e5fca70daf0523c9067fcdc4842f053dae04a18f8e9"
+SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strip-ansi-escapes-0.1.1.sha256sum] = "011cbb39cf7c1f62871aea3cc46e5817b0937b49e9447370c93cacbe93a766d8"
-SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
-SRC_URI[subtle-2.4.1.sha256sum] = "6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601"
+SRC_URI[strsim-0.11.0.sha256sum] = "5ee073c9e4cd00e28217186dbe12796d692868f432bf2e97ee73bed0c56dfa01"
+SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
+SRC_URI[supports-hyperlinks-2.1.0.sha256sum] = "f84231692eb0d4d41e4cdd0cabfdd2e6cd9e255e65f80c9aa7c98dd502b4233d"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.13.sha256sum] = "4c9da457c5285ac1f936ebd076af6dac17a61cfe7826f2076b4d015cf47bc8ec"
-SRC_URI[tar-0.4.38.sha256sum] = "4b55807c0344e1e6c04d7c965f5289c39a8d94ae23ed5c0b57aabac549f871c6"
-SRC_URI[tempfile-3.5.0.sha256sum] = "b9fbec84f381d5795b08656e4912bec604d162bff9291d6189a78f4c8ab87998"
-SRC_URI[termcolor-1.2.0.sha256sum] = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6"
-SRC_URI[textwrap-0.16.0.sha256sum] = "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
+SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
+SRC_URI[tar-0.4.40.sha256sum] = "b16afcea1f22891c49a00c751c7b63b2233284064f11a200fc624137c51e2ddb"
+SRC_URI[tempfile-3.10.0.sha256sum] = "a365e8cd18e44762ef95d87f284f4b5cd04107fec2ff3052bd6a3e6069669e67"
+SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
+SRC_URI[thiserror-1.0.56.sha256sum] = "d54378c645627613241d077a3a79db965db602882668f9136ac42af9ecb730ad"
+SRC_URI[thiserror-impl-1.0.56.sha256sum] = "fa0faa943b50f3db30a20aa7e265dbc66076993efed8463e8de414e5d06d3471"
 SRC_URI[thread_local-1.1.7.sha256sum] = "3fdd6f064ccff2d6567adcb3873ca630700f00b5ad3f060c25b5dcfd9a4ce152"
-SRC_URI[time-0.3.20.sha256sum] = "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
-SRC_URI[time-core-0.1.0.sha256sum] = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
-SRC_URI[time-macros-0.2.8.sha256sum] = "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
+SRC_URI[time-0.3.34.sha256sum] = "c8248b6521bb14bc45b4067159b9b6ad792e2d6d754d6c41fb50e29fefe38749"
+SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
+SRC_URI[time-macros-0.2.17.sha256sum] = "7ba3a3ef41e6672a2f0f001392bb5dcd3ff0a9992d618ca761a11c3121547774"
 SRC_URI[tinyvec-1.6.0.sha256sum] = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
-SRC_URI[toml-0.7.3.sha256sum] = "b403acf6f2bb0859c93c7f0d967cb4a75a7ac552100f9322faf64dc047669b21"
-SRC_URI[toml_datetime-0.5.1.sha256sum] = "4553f467ac8e3d374bc9a177a26801e5d0f9b211aa1673fb137a403afd1c9cf5"
-SRC_URI[toml_datetime-0.6.1.sha256sum] = "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"
-SRC_URI[toml_edit-0.15.0.sha256sum] = "b1541ba70885967e662f69d31ab3aeca7b1aaecfcd58679590b893e9239c3646"
-SRC_URI[toml_edit-0.19.8.sha256sum] = "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13"
-SRC_URI[typenum-1.16.0.sha256sum] = "497961ef93d974e23eb6f433eb5fe1b7930b659f06d12dec6fc44a8f554c0bba"
-SRC_URI[unicode-bidi-0.3.13.sha256sum] = "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
-SRC_URI[unicode-ident-1.0.8.sha256sum] = "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
+SRC_URI[toml-0.8.10.sha256sum] = "9a9aad4a3066010876e8dcf5a8a06e70a558751117a145c6ce2b82c2e2054290"
+SRC_URI[toml_datetime-0.6.5.sha256sum] = "3550f4e9685620ac18a50ed434eb3aec30db8ba93b0287467bca5826ea25baf1"
+SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
+SRC_URI[toml_edit-0.22.4.sha256sum] = "0c9ffdf896f8daaabf9b66ba8e77ea1ed5ed0f72821b398aba62352e95062951"
+SRC_URI[tracing-0.1.40.sha256sum] = "c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef"
+SRC_URI[tracing-attributes-0.1.27.sha256sum] = "34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7"
+SRC_URI[tracing-core-0.1.32.sha256sum] = "c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54"
+SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
+SRC_URI[tracing-subscriber-0.3.18.sha256sum] = "ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b"
+SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
+SRC_URI[unicase-2.7.0.sha256sum] = "f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89"
+SRC_URI[unicode-bidi-0.3.15.sha256sum] = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
+SRC_URI[unicode-bom-2.0.3.sha256sum] = "7eec5d1121208364f6793f7d2e222bf75a915c19557537745b195b253dd64217"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unicode-normalization-0.1.22.sha256sum] = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
-SRC_URI[unicode-width-0.1.10.sha256sum] = "c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b"
+SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85"
 SRC_URI[unicode-xid-0.2.4.sha256sum] = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
-SRC_URI[url-2.3.1.sha256sum] = "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643"
+SRC_URI[url-2.5.0.sha256sum] = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
 SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[valuable-0.1.0.sha256sum] = "830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[vte-0.10.1.sha256sum] = "6cbce692ab4ca2f1f3047fcf732430249c0e971bfdd2b234cf2c47ad93af5983"
-SRC_URI[vte_generate_state_changes-0.1.1.sha256sum] = "d257817081c7dffcdbab24b9e62d2def62e2ff7d00b1c20062551e6cccc145ff"
-SRC_URI[walkdir-2.3.3.sha256sum] = "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698"
+SRC_URI[walkdir-2.4.0.sha256sum] = "d71d857dc86794ca4c280d616f7da00d2dbfd8cd788846559a6813e6aa4b54ee"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[wasm-bindgen-0.2.84.sha256sum] = "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b"
-SRC_URI[wasm-bindgen-backend-0.2.84.sha256sum] = "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9"
-SRC_URI[wasm-bindgen-macro-0.2.84.sha256sum] = "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5"
-SRC_URI[wasm-bindgen-macro-support-0.2.84.sha256sum] = "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
-SRC_URI[wasm-bindgen-shared-0.2.84.sha256sum] = "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
+SRC_URI[wasm-bindgen-0.2.91.sha256sum] = "c1e124130aee3fb58c5bdd6b639a0509486b0338acaaae0c84a5124b0f588b7f"
+SRC_URI[wasm-bindgen-backend-0.2.91.sha256sum] = "c9e7e1900c352b609c8488ad12639a311045f40a35491fb69ba8c12f758af70b"
+SRC_URI[wasm-bindgen-macro-0.2.91.sha256sum] = "b30af9e2d358182b5c7449424f017eba305ed32a7010509ede96cdc4696c46ed"
+SRC_URI[wasm-bindgen-macro-support-0.2.91.sha256sum] = "642f325be6301eb8107a83d12a8ac6c1e1c54345a7ef1a9261962dfefda09e66"
+SRC_URI[wasm-bindgen-shared-0.2.91.sha256sum] = "4f186bd2dcf04330886ce82d6f33dd75a7bfcf69ecf5763b89fcde53b6ac9838"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-util-0.1.6.sha256sum] = "f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.42.0.sha256sum] = "5a3e1820f08b8513f676f7ab6c1f99ff312fb97b553d30ff4dd86f9f15728aa7"
-SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
-SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
-SRC_URI[windows-targets-0.48.0.sha256sum] = "7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5"
-SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
-SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
-SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
-SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
-SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
-SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
-SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
-SRC_URI[winnow-0.4.1.sha256sum] = "ae8970b36c66498d8ff1d66685dc86b91b29db0c7739899012f63a63814b4b28"
-SRC_URI[zeroize-1.6.0.sha256sum] = "2a0956f1ba7c7909bfb66c2e9e4124ab6f6482560f6628b5aaeba39207c9aad9"
+SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.0.sha256sum] = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.0.sha256sum] = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
+SRC_URI[winnow-0.5.39.sha256sum] = "5389a154b01683d28c77f8f68f49dea75f0a4da32557a58f68ee51ebba472d29"
+SRC_URI[zerocopy-0.7.32.sha256sum] = "74d4d3961e53fa4c9a25a8637fc2bfaf2595b3d3ae34875568a5cf64787716be"
+SRC_URI[zerocopy-derive-0.7.32.sha256sum] = "9ce1b18ccd8e73a9321186f97e46f9f04b778851177567b1975109d26a08d2a6"
+SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.9.18+cargo-0.69.bb b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
similarity index 82%
rename from meta/recipes-devtools/rust/cargo-c-native_0.9.18+cargo-0.69.bb
rename to meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
index 78fcabb207d..8e17606b73d 100644
--- a/meta/recipes-devtools/rust/cargo-c-native_0.9.18+cargo-0.69.bb
+++ b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c"
-SRC_URI[cargo-c.sha256sum] = "3089672953dd474200fde35da3db9a7401705d7ed323185878a2923702022da4"
+SRC_URI[cargo-c.sha256sum] = "ec77e3635cdb0d211f88f22d0460eef0ba031eb616ded57f2ffb98a90365c445"
 S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
 
 inherit cargo cargo-update-recipe-crates pkgconfig native
-- 
2.39.2


