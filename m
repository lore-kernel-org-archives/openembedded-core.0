Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59587C54745
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:20 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.71674.1724736249756692712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WqlNSGVO;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a86cc0d10aaso233796466b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736248; x=1725341048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvgozeLl7eNGleIWP7tLSeBx5zzhlXe6d6efZfmAHQU=;
        b=WqlNSGVOKhZViI1iQG/XYA/EU/MQgavFegW4ZOjjjO7pOWIm8obOfzMVaw/oMCghc2
         XUBRe4jiB4X2K9+Xa+d/LCetcLBICsY8NPaf9eUT/9Yc+Q9ohbNjM4PVWOKz/L+fx5B3
         7Q7ak2/qFxVMGUUaAWXDb9mmiiw4gUQVBgpmazaZMtQz2mPRoAHvQSGLZtI/vQTuXda1
         /bIneZ1R/IuMPSYiTzqNvHUjmtmljxF2daC5et1yjL8RTaEhIS6sD3BhmNV4MEgM+S2I
         Bdi+302m5IAAiiQ11h1hvscntJ0IW0bkLEZbryAv8brcr7XTaFe77D1K7BIk2WJpQ2GH
         ArJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736248; x=1725341048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvgozeLl7eNGleIWP7tLSeBx5zzhlXe6d6efZfmAHQU=;
        b=D/rGnmNtNqSHvvRGnsgrebs1Gja1lKAa3/teuakcVEmsypvFXrKyEOveqySwMRdWNn
         hAf+jnl5Sa3awQkxHYD4N4P4TlKlbfmvQau74gVbhMicgl0ZTOBIHnrCOd2ABAhlL+Z6
         TIsu3Vg8PrHa9ao/WqvxqEbXTSuKeGJo+9ytzLFnolREWq2prCmnjZAZJGhGPxJIfmrM
         g2QjjnxSdhr2pr4gSeMuCCPAqXOu43koaa4DTTBFZCwKs7wAtDJYsibG2Ii+yWYyzJ0w
         yNRUmGYUwbqsbX8eN9QeL00h3wvfA9G/h59fmANfWAo97mAraGyKYRKqXB/Rk4cePEUI
         I8xw==
X-Gm-Message-State: AOJu0YzTbWnAkei6W1PHYA5r0UCwCQM/ivHSmABCrZs/7ZnhfvImKbDR
	ugk6U8qvQYPGNeT390BK4UsGgKihXG+ErUA5L3z+R/fSKNiEWMJA4tyoyQ==
X-Google-Smtp-Source: AGHT+IEkEJ5L5wjYsieLsMwXlrzUUAFF77pUS0kMMJoH2p9LB8PSIlknU7/TFgeyi2Zjhd5b7Ww6vw==
X-Received: by 2002:a17:907:7e95:b0:a77:e1fb:7dec with SMTP id a640c23a62f3a-a86a5192a1amr1020582866b.17.1724736247289;
        Mon, 26 Aug 2024 22:24:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/34] cargo-c-native: update 0.9.30 -> 0.10.3
Date: Tue, 27 Aug 2024 07:23:37 +0200
Message-Id: <20240827052354.1319810-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203794

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/cargo-c-crates.inc | 798 +++++++++---------
 ... => cargo-c-native_0.10.3+cargo-0.81.0.bb} |   2 +-
 2 files changed, 411 insertions(+), 389 deletions(-)
 rename meta/recipes-devtools/rust/{cargo-c-native_0.9.30+cargo-0.77.0.bb => cargo-c-native_0.10.3+cargo-0.81.0.bb} (82%)

diff --git a/meta/recipes-devtools/rust/cargo-c-crates.inc b/meta/recipes-devtools/rust/cargo-c-crates.inc
index f6da3e654e6..2c84c326a1e 100644
--- a/meta/recipes-devtools/rust/cargo-c-crates.inc
+++ b/meta/recipes-devtools/rust/cargo-c-crates.inc
@@ -3,146 +3,150 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
-    crate://crates.io/ahash/0.8.7 \
-    crate://crates.io/aho-corasick/1.1.2 \
-    crate://crates.io/allocator-api2/0.2.16 \
-    crate://crates.io/anstream/0.6.11 \
-    crate://crates.io/anstyle/1.0.6 \
-    crate://crates.io/anstyle-parse/0.2.3 \
-    crate://crates.io/anstyle-query/1.0.2 \
-    crate://crates.io/anstyle-wincon/3.0.2 \
-    crate://crates.io/anyhow/1.0.79 \
-    crate://crates.io/arc-swap/1.6.0 \
-    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/ahash/0.8.11 \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/allocator-api2/0.2.18 \
+    crate://crates.io/annotate-snippets/0.11.4 \
+    crate://crates.io/anstream/0.6.15 \
+    crate://crates.io/anstyle/1.0.8 \
+    crate://crates.io/anstyle-parse/0.2.5 \
+    crate://crates.io/anstyle-query/1.1.1 \
+    crate://crates.io/anstyle-wincon/3.0.4 \
+    crate://crates.io/anyhow/1.0.86 \
+    crate://crates.io/arc-swap/1.7.1 \
+    crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/base16ct/0.2.0 \
-    crate://crates.io/base64/0.21.7 \
+    crate://crates.io/base64/0.22.1 \
     crate://crates.io/base64ct/1.6.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.4.2 \
+    crate://crates.io/bitflags/2.6.0 \
     crate://crates.io/bitmaps/2.1.0 \
     crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/bstr/1.9.0 \
-    crate://crates.io/btoi/0.4.3 \
-    crate://crates.io/bumpalo/3.14.0 \
-    crate://crates.io/bytes/1.5.0 \
+    crate://crates.io/bstr/1.10.0 \
+    crate://crates.io/bumpalo/3.16.0 \
+    crate://crates.io/byteorder/1.5.0 \
+    crate://crates.io/bytes/1.6.1 \
     crate://crates.io/bytesize/1.3.0 \
-    crate://crates.io/cargo/0.77.0 \
-    crate://crates.io/cargo-credential/0.4.2 \
-    crate://crates.io/cargo-credential-libsecret/0.4.2 \
-    crate://crates.io/cargo-credential-macos-keychain/0.4.2 \
-    crate://crates.io/cargo-credential-wincred/0.4.2 \
-    crate://crates.io/cargo-platform/0.1.7 \
-    crate://crates.io/cargo-util/0.2.9 \
+    crate://crates.io/cargo/0.81.0 \
+    crate://crates.io/cargo-credential/0.4.6 \
+    crate://crates.io/cargo-credential-libsecret/0.4.6 \
+    crate://crates.io/cargo-credential-macos-keychain/0.4.6 \
+    crate://crates.io/cargo-credential-wincred/0.4.6 \
+    crate://crates.io/cargo-platform/0.1.8 \
+    crate://crates.io/cargo-util/0.2.13 \
+    crate://crates.io/cargo-util-schemas/0.4.0 \
     crate://crates.io/cbindgen/0.26.0 \
-    crate://crates.io/cc/1.0.83 \
+    crate://crates.io/cc/1.1.7 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clap/4.5.0 \
-    crate://crates.io/clap_builder/4.5.0 \
-    crate://crates.io/clap_derive/4.5.0 \
-    crate://crates.io/clap_lex/0.7.0 \
-    crate://crates.io/clru/0.6.1 \
-    crate://crates.io/color-print/0.3.5 \
-    crate://crates.io/color-print-proc-macro/0.3.5 \
-    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/clap/4.5.11 \
+    crate://crates.io/clap_builder/4.5.11 \
+    crate://crates.io/clap_derive/4.5.11 \
+    crate://crates.io/clap_lex/0.7.2 \
+    crate://crates.io/clru/0.6.2 \
+    crate://crates.io/color-print/0.3.6 \
+    crate://crates.io/color-print-proc-macro/0.3.6 \
+    crate://crates.io/colorchoice/1.0.2 \
     crate://crates.io/const-oid/0.9.6 \
     crate://crates.io/core-foundation/0.9.4 \
     crate://crates.io/core-foundation-sys/0.8.6 \
     crate://crates.io/cpufeatures/0.2.12 \
-    crate://crates.io/crates-io/0.39.2 \
-    crate://crates.io/crc32fast/1.3.2 \
-    crate://crates.io/crossbeam-channel/0.5.11 \
+    crate://crates.io/crates-io/0.40.3 \
+    crate://crates.io/crc32fast/1.4.2 \
+    crate://crates.io/crossbeam-channel/0.5.13 \
     crate://crates.io/crossbeam-deque/0.8.5 \
     crate://crates.io/crossbeam-epoch/0.9.18 \
-    crate://crates.io/crossbeam-utils/0.8.19 \
+    crate://crates.io/crossbeam-utils/0.8.20 \
     crate://crates.io/crypto-bigint/0.5.5 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/ct-codecs/1.1.1 \
-    crate://crates.io/curl/0.4.45 \
-    crate://crates.io/curl-sys/0.4.72+curl-8.6.0 \
-    crate://crates.io/der/0.7.8 \
+    crate://crates.io/curl/0.4.46 \
+    crate://crates.io/curl-sys/0.4.73+curl-8.8.0 \
+    crate://crates.io/dbus/0.9.7 \
+    crate://crates.io/der/0.7.9 \
     crate://crates.io/deranged/0.3.11 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/dunce/1.0.4 \
     crate://crates.io/ecdsa/0.16.9 \
     crate://crates.io/ed25519-compact/2.1.1 \
-    crate://crates.io/either/1.9.0 \
+    crate://crates.io/either/1.13.0 \
     crate://crates.io/elliptic-curve/0.13.8 \
-    crate://crates.io/encoding_rs/0.8.33 \
+    crate://crates.io/encoding_rs/0.8.34 \
     crate://crates.io/equivalent/1.0.1 \
-    crate://crates.io/erased-serde/0.4.2 \
-    crate://crates.io/errno/0.3.8 \
+    crate://crates.io/erased-serde/0.4.5 \
+    crate://crates.io/errno/0.3.9 \
     crate://crates.io/fallible-iterator/0.3.0 \
     crate://crates.io/fallible-streaming-iterator/0.1.9 \
     crate://crates.io/faster-hex/0.9.0 \
-    crate://crates.io/fastrand/2.0.1 \
+    crate://crates.io/fastrand/2.1.0 \
     crate://crates.io/ff/0.13.0 \
-    crate://crates.io/fiat-crypto/0.2.6 \
+    crate://crates.io/fiat-crypto/0.2.9 \
     crate://crates.io/filetime/0.2.23 \
-    crate://crates.io/flate2/1.0.28 \
+    crate://crates.io/flate2/1.0.30 \
+    crate://crates.io/fnv/1.0.7 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.12 \
-    crate://crates.io/git2/0.18.2 \
+    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/git2/0.18.3 \
     crate://crates.io/git2-curl/0.19.0 \
-    crate://crates.io/gix/0.56.0 \
-    crate://crates.io/gix-actor/0.28.1 \
-    crate://crates.io/gix-attributes/0.20.1 \
-    crate://crates.io/gix-bitmap/0.2.10 \
-    crate://crates.io/gix-chunk/0.4.7 \
-    crate://crates.io/gix-command/0.3.4 \
-    crate://crates.io/gix-commitgraph/0.22.1 \
-    crate://crates.io/gix-config/0.32.1 \
-    crate://crates.io/gix-config-value/0.14.4 \
-    crate://crates.io/gix-credentials/0.22.0 \
-    crate://crates.io/gix-date/0.8.3 \
-    crate://crates.io/gix-diff/0.38.0 \
-    crate://crates.io/gix-discover/0.27.0 \
-    crate://crates.io/gix-features/0.35.0 \
-    crate://crates.io/gix-features/0.36.1 \
-    crate://crates.io/gix-filter/0.7.0 \
-    crate://crates.io/gix-fs/0.8.1 \
-    crate://crates.io/gix-glob/0.14.1 \
-    crate://crates.io/gix-hash/0.13.3 \
-    crate://crates.io/gix-hashtable/0.4.1 \
-    crate://crates.io/gix-ignore/0.9.1 \
-    crate://crates.io/gix-index/0.27.1 \
-    crate://crates.io/gix-lock/11.0.1 \
-    crate://crates.io/gix-macros/0.1.3 \
-    crate://crates.io/gix-negotiate/0.10.0 \
-    crate://crates.io/gix-object/0.39.0 \
-    crate://crates.io/gix-odb/0.55.0 \
-    crate://crates.io/gix-pack/0.45.0 \
-    crate://crates.io/gix-packetline/0.17.3 \
-    crate://crates.io/gix-packetline-blocking/0.17.3 \
-    crate://crates.io/gix-path/0.10.5 \
-    crate://crates.io/gix-pathspec/0.4.1 \
-    crate://crates.io/gix-prompt/0.8.2 \
-    crate://crates.io/gix-protocol/0.42.0 \
-    crate://crates.io/gix-quote/0.4.10 \
-    crate://crates.io/gix-ref/0.39.1 \
-    crate://crates.io/gix-refspec/0.20.0 \
-    crate://crates.io/gix-revision/0.24.0 \
-    crate://crates.io/gix-revwalk/0.10.0 \
-    crate://crates.io/gix-sec/0.10.4 \
-    crate://crates.io/gix-submodule/0.6.0 \
-    crate://crates.io/gix-tempfile/11.0.1 \
-    crate://crates.io/gix-trace/0.1.7 \
-    crate://crates.io/gix-transport/0.39.0 \
-    crate://crates.io/gix-traverse/0.35.0 \
-    crate://crates.io/gix-url/0.25.2 \
-    crate://crates.io/gix-utils/0.1.9 \
-    crate://crates.io/gix-validate/0.8.3 \
-    crate://crates.io/gix-worktree/0.28.0 \
+    crate://crates.io/gix/0.63.0 \
+    crate://crates.io/gix-actor/0.31.5 \
+    crate://crates.io/gix-attributes/0.22.3 \
+    crate://crates.io/gix-bitmap/0.2.11 \
+    crate://crates.io/gix-chunk/0.4.8 \
+    crate://crates.io/gix-command/0.3.8 \
+    crate://crates.io/gix-commitgraph/0.24.3 \
+    crate://crates.io/gix-config/0.37.0 \
+    crate://crates.io/gix-config-value/0.14.7 \
+    crate://crates.io/gix-credentials/0.24.4 \
+    crate://crates.io/gix-date/0.8.7 \
+    crate://crates.io/gix-diff/0.44.1 \
+    crate://crates.io/gix-dir/0.5.0 \
+    crate://crates.io/gix-discover/0.32.0 \
+    crate://crates.io/gix-features/0.38.2 \
+    crate://crates.io/gix-filter/0.11.3 \
+    crate://crates.io/gix-fs/0.11.2 \
+    crate://crates.io/gix-glob/0.16.4 \
+    crate://crates.io/gix-hash/0.14.2 \
+    crate://crates.io/gix-hashtable/0.5.2 \
+    crate://crates.io/gix-ignore/0.11.3 \
+    crate://crates.io/gix-index/0.33.1 \
+    crate://crates.io/gix-lock/14.0.0 \
+    crate://crates.io/gix-macros/0.1.5 \
+    crate://crates.io/gix-negotiate/0.13.2 \
+    crate://crates.io/gix-object/0.42.3 \
+    crate://crates.io/gix-odb/0.61.1 \
+    crate://crates.io/gix-pack/0.51.1 \
+    crate://crates.io/gix-packetline/0.17.5 \
+    crate://crates.io/gix-packetline-blocking/0.17.4 \
+    crate://crates.io/gix-path/0.10.9 \
+    crate://crates.io/gix-pathspec/0.7.6 \
+    crate://crates.io/gix-prompt/0.8.6 \
+    crate://crates.io/gix-protocol/0.45.2 \
+    crate://crates.io/gix-quote/0.4.12 \
+    crate://crates.io/gix-ref/0.44.1 \
+    crate://crates.io/gix-refspec/0.23.1 \
+    crate://crates.io/gix-revision/0.27.2 \
+    crate://crates.io/gix-revwalk/0.13.2 \
+    crate://crates.io/gix-sec/0.10.7 \
+    crate://crates.io/gix-submodule/0.11.0 \
+    crate://crates.io/gix-tempfile/14.0.1 \
+    crate://crates.io/gix-trace/0.1.9 \
+    crate://crates.io/gix-transport/0.42.2 \
+    crate://crates.io/gix-traverse/0.39.2 \
+    crate://crates.io/gix-url/0.27.4 \
+    crate://crates.io/gix-utils/0.1.12 \
+    crate://crates.io/gix-validate/0.8.5 \
+    crate://crates.io/gix-worktree/0.34.1 \
     crate://crates.io/glob/0.3.1 \
     crate://crates.io/globset/0.4.14 \
     crate://crates.io/group/0.13.0 \
     crate://crates.io/hashbrown/0.12.3 \
-    crate://crates.io/hashbrown/0.14.3 \
-    crate://crates.io/hashlink/0.8.4 \
+    crate://crates.io/hashbrown/0.14.5 \
+    crate://crates.io/hashlink/0.9.1 \
     crate://crates.io/heck/0.4.1 \
-    crate://crates.io/hermit-abi/0.3.5 \
+    crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/hkdf/0.12.4 \
     crate://crates.io/hmac/0.12.1 \
@@ -153,322 +157,333 @@ SRC_URI += " \
     crate://crates.io/ignore/0.4.22 \
     crate://crates.io/im-rc/15.1.0 \
     crate://crates.io/indexmap/1.9.3 \
-    crate://crates.io/indexmap/2.2.2 \
-    crate://crates.io/is-terminal/0.4.11 \
+    crate://crates.io/indexmap/2.2.6 \
+    crate://crates.io/is_terminal_polyfill/1.70.1 \
     crate://crates.io/itertools/0.12.1 \
-    crate://crates.io/itoa/1.0.10 \
-    crate://crates.io/jobserver/0.1.28 \
-    crate://crates.io/js-sys/0.3.68 \
-    crate://crates.io/kstring/2.0.0 \
-    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/itoa/1.0.11 \
+    crate://crates.io/jobserver/0.1.32 \
+    crate://crates.io/js-sys/0.3.69 \
+    crate://crates.io/kstring/2.0.2 \
+    crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.153 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/libdbus-sys/0.2.5 \
     crate://crates.io/libgit2-sys/0.16.2+1.7.2 \
-    crate://crates.io/libloading/0.8.1 \
-    crate://crates.io/libnghttp2-sys/0.1.9+1.58.0 \
-    crate://crates.io/libsqlite3-sys/0.27.0 \
+    crate://crates.io/libloading/0.8.5 \
+    crate://crates.io/libnghttp2-sys/0.1.10+1.61.0 \
+    crate://crates.io/libsqlite3-sys/0.28.0 \
     crate://crates.io/libssh2-sys/0.3.0 \
-    crate://crates.io/libz-sys/1.1.15 \
-    crate://crates.io/linux-raw-sys/0.4.13 \
-    crate://crates.io/lock_api/0.4.11 \
-    crate://crates.io/log/0.4.20 \
+    crate://crates.io/libz-sys/1.1.18 \
+    crate://crates.io/linux-raw-sys/0.4.14 \
+    crate://crates.io/lock_api/0.4.12 \
+    crate://crates.io/log/0.4.22 \
     crate://crates.io/matchers/0.1.0 \
-    crate://crates.io/maybe-async/0.2.9 \
-    crate://crates.io/memchr/2.7.1 \
+    crate://crates.io/maybe-async/0.2.10 \
+    crate://crates.io/memchr/2.7.4 \
     crate://crates.io/memmap2/0.9.4 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.7.2 \
+    crate://crates.io/miniz_oxide/0.7.4 \
     crate://crates.io/miow/0.6.0 \
     crate://crates.io/nom/7.1.3 \
-    crate://crates.io/normpath/1.1.1 \
+    crate://crates.io/normpath/1.2.0 \
     crate://crates.io/nu-ansi-term/0.46.0 \
     crate://crates.io/num-conv/0.1.0 \
-    crate://crates.io/num-traits/0.2.18 \
-    crate://crates.io/num_threads/0.1.6 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/num_threads/0.1.7 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/opener/0.6.1 \
-    crate://crates.io/openssl/0.10.63 \
+    crate://crates.io/opener/0.7.1 \
+    crate://crates.io/openssl/0.10.66 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.1.5 \
-    crate://crates.io/openssl-src/300.2.2+3.2.1 \
-    crate://crates.io/openssl-sys/0.9.99 \
+    crate://crates.io/openssl-src/300.3.1+3.3.1 \
+    crate://crates.io/openssl-sys/0.9.103 \
     crate://crates.io/ordered-float/2.10.1 \
     crate://crates.io/orion/0.17.6 \
-    crate://crates.io/os_info/3.7.0 \
+    crate://crates.io/os_info/3.8.2 \
     crate://crates.io/overload/0.1.1 \
     crate://crates.io/p384/0.13.0 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.9 \
+    crate://crates.io/parking_lot/0.12.3 \
+    crate://crates.io/parking_lot_core/0.9.10 \
     crate://crates.io/pasetors/0.6.8 \
     crate://crates.io/pathdiff/0.2.1 \
     crate://crates.io/pem-rfc7468/0.7.0 \
     crate://crates.io/percent-encoding/2.3.1 \
-    crate://crates.io/pin-project-lite/0.2.13 \
+    crate://crates.io/pin-project-lite/0.2.14 \
     crate://crates.io/pkcs8/0.10.2 \
-    crate://crates.io/pkg-config/0.3.29 \
+    crate://crates.io/pkg-config/0.3.30 \
     crate://crates.io/powerfmt/0.2.0 \
-    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/ppv-lite86/0.2.18 \
     crate://crates.io/primeorder/0.13.6 \
-    crate://crates.io/proc-macro2/1.0.78 \
-    crate://crates.io/prodash/26.2.2 \
-    crate://crates.io/pulldown-cmark/0.9.6 \
-    crate://crates.io/quote/1.0.35 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/prodash/28.0.0 \
+    crate://crates.io/quote/1.0.36 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_xoshiro/0.6.0 \
     crate://crates.io/redox_syscall/0.4.1 \
-    crate://crates.io/regex/1.10.3 \
+    crate://crates.io/redox_syscall/0.5.3 \
+    crate://crates.io/regex/1.10.5 \
     crate://crates.io/regex-automata/0.1.10 \
-    crate://crates.io/regex-automata/0.4.5 \
+    crate://crates.io/regex-automata/0.4.7 \
     crate://crates.io/regex-syntax/0.6.29 \
-    crate://crates.io/regex-syntax/0.8.2 \
+    crate://crates.io/regex-syntax/0.8.4 \
     crate://crates.io/rfc6979/0.4.0 \
-    crate://crates.io/rusqlite/0.30.0 \
-    crate://crates.io/rustfix/0.7.0 \
-    crate://crates.io/rustix/0.38.31 \
-    crate://crates.io/ryu/1.0.16 \
+    crate://crates.io/rusqlite/0.31.0 \
+    crate://crates.io/rustfix/0.8.4 \
+    crate://crates.io/rustix/0.38.34 \
+    crate://crates.io/ryu/1.0.18 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/schannel/0.1.23 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/sec1/0.7.3 \
-    crate://crates.io/security-framework/2.9.2 \
-    crate://crates.io/security-framework-sys/2.9.1 \
-    crate://crates.io/semver/1.0.21 \
-    crate://crates.io/serde/1.0.196 \
-    crate://crates.io/serde-untagged/0.1.5 \
+    crate://crates.io/security-framework/2.11.1 \
+    crate://crates.io/security-framework-sys/2.11.1 \
+    crate://crates.io/semver/1.0.23 \
+    crate://crates.io/serde/1.0.204 \
+    crate://crates.io/serde-untagged/0.1.6 \
     crate://crates.io/serde-value/0.7.0 \
-    crate://crates.io/serde_derive/1.0.196 \
+    crate://crates.io/serde_derive/1.0.204 \
     crate://crates.io/serde_ignored/0.1.10 \
-    crate://crates.io/serde_json/1.0.113 \
-    crate://crates.io/serde_spanned/0.6.5 \
+    crate://crates.io/serde_json/1.0.121 \
+    crate://crates.io/serde_spanned/0.6.7 \
     crate://crates.io/sha1/0.10.6 \
-    crate://crates.io/sha1_smol/1.0.0 \
+    crate://crates.io/sha1_smol/1.0.1 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shell-escape/0.1.5 \
     crate://crates.io/shell-words/1.1.0 \
     crate://crates.io/signature/2.2.0 \
     crate://crates.io/sized-chunks/0.6.5 \
-    crate://crates.io/smallvec/1.13.1 \
-    crate://crates.io/socket2/0.5.5 \
+    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/socket2/0.5.7 \
     crate://crates.io/spki/0.7.3 \
     crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strsim/0.11.0 \
-    crate://crates.io/subtle/2.5.0 \
-    crate://crates.io/supports-hyperlinks/2.1.0 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/subtle/2.6.1 \
+    crate://crates.io/supports-hyperlinks/3.0.0 \
+    crate://crates.io/supports-unicode/3.0.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.48 \
-    crate://crates.io/tar/0.4.40 \
-    crate://crates.io/tempfile/3.10.0 \
+    crate://crates.io/syn/2.0.72 \
+    crate://crates.io/tar/0.4.41 \
+    crate://crates.io/tempfile/3.10.1 \
     crate://crates.io/terminal_size/0.3.0 \
-    crate://crates.io/thiserror/1.0.56 \
-    crate://crates.io/thiserror-impl/1.0.56 \
-    crate://crates.io/thread_local/1.1.7 \
-    crate://crates.io/time/0.3.34 \
+    crate://crates.io/thiserror/1.0.63 \
+    crate://crates.io/thiserror-impl/1.0.63 \
+    crate://crates.io/thread_local/1.1.8 \
+    crate://crates.io/time/0.3.36 \
     crate://crates.io/time-core/0.1.2 \
-    crate://crates.io/time-macros/0.2.17 \
-    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/time-macros/0.2.18 \
+    crate://crates.io/tinyvec/1.8.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/toml/0.5.11 \
-    crate://crates.io/toml/0.8.10 \
-    crate://crates.io/toml_datetime/0.6.5 \
-    crate://crates.io/toml_edit/0.21.1 \
-    crate://crates.io/toml_edit/0.22.4 \
+    crate://crates.io/toml/0.8.16 \
+    crate://crates.io/toml_datetime/0.6.7 \
+    crate://crates.io/toml_edit/0.22.17 \
     crate://crates.io/tracing/0.1.40 \
     crate://crates.io/tracing-attributes/0.1.27 \
+    crate://crates.io/tracing-chrome/0.7.2 \
     crate://crates.io/tracing-core/0.1.32 \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-subscriber/0.3.18 \
+    crate://crates.io/typeid/1.0.0 \
     crate://crates.io/typenum/1.17.0 \
     crate://crates.io/unicase/2.7.0 \
     crate://crates.io/unicode-bidi/0.3.15 \
     crate://crates.io/unicode-bom/2.0.3 \
     crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unicode-normalization/0.1.22 \
-    crate://crates.io/unicode-width/0.1.11 \
+    crate://crates.io/unicode-normalization/0.1.23 \
+    crate://crates.io/unicode-width/0.1.13 \
     crate://crates.io/unicode-xid/0.2.4 \
-    crate://crates.io/url/2.5.0 \
-    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/url/2.5.2 \
+    crate://crates.io/utf8parse/0.2.2 \
     crate://crates.io/valuable/0.1.0 \
     crate://crates.io/vcpkg/0.2.15 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/walkdir/2.4.0 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.91 \
-    crate://crates.io/wasm-bindgen-backend/0.2.91 \
-    crate://crates.io/wasm-bindgen-macro/0.2.91 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.91 \
-    crate://crates.io/wasm-bindgen-shared/0.2.91 \
+    crate://crates.io/wasm-bindgen/0.2.92 \
+    crate://crates.io/wasm-bindgen-backend/0.2.92 \
+    crate://crates.io/wasm-bindgen-macro/0.2.92 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.92 \
+    crate://crates.io/wasm-bindgen-shared/0.2.92 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.6 \
+    crate://crates.io/winapi-util/0.1.8 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows-targets/0.52.0 \
+    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.52.0 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.52.0 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.52.0 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.52.0 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.52.0 \
-    crate://crates.io/winnow/0.5.39 \
-    crate://crates.io/zerocopy/0.7.32 \
-    crate://crates.io/zerocopy-derive/0.7.32 \
-    crate://crates.io/zeroize/1.7.0 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/winnow/0.6.16 \
+    crate://crates.io/zerocopy/0.6.6 \
+    crate://crates.io/zerocopy/0.7.35 \
+    crate://crates.io/zerocopy-derive/0.6.6 \
+    crate://crates.io/zerocopy-derive/0.7.35 \
+    crate://crates.io/zeroize/1.8.1 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
-SRC_URI[ahash-0.8.7.sha256sum] = "77c3a9648d43b9cd48db467b3f87fdd6e146bcc88ab0180006cef2179fe11d01"
-SRC_URI[aho-corasick-1.1.2.sha256sum] = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
-SRC_URI[allocator-api2-0.2.16.sha256sum] = "0942ffc6dcaadf03badf6e6a2d0228460359d5e34b57ccdc720b7382dfbd5ec5"
-SRC_URI[anstream-0.6.11.sha256sum] = "6e2e1ebcb11de5c03c67de28a7df593d32191b44939c482e97702baaaa6ab6a5"
-SRC_URI[anstyle-1.0.6.sha256sum] = "8901269c6307e8d93993578286ac0edf7f195079ffff5ebdeea6a59ffb7e36bc"
-SRC_URI[anstyle-parse-0.2.3.sha256sum] = "c75ac65da39e5fe5ab759307499ddad880d724eed2f6ce5b5e8a26f4f387928c"
-SRC_URI[anstyle-query-1.0.2.sha256sum] = "e28923312444cdd728e4738b3f9c9cac739500909bb3d3c94b43551b16517648"
-SRC_URI[anstyle-wincon-3.0.2.sha256sum] = "1cd54b81ec8d6180e24654d0b371ad22fc3dd083b6ff8ba325b72e00c87660a7"
-SRC_URI[anyhow-1.0.79.sha256sum] = "080e9890a082662b09c1ad45f567faeeb47f22b5fb23895fbe1e651e718e25ca"
-SRC_URI[arc-swap-1.6.0.sha256sum] = "bddcadddf5e9015d310179a59bb28c4d4b9920ad0f11e8e14dbadf654890c9a6"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[ahash-0.8.11.sha256sum] = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011"
+SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[allocator-api2-0.2.18.sha256sum] = "5c6cb57a04249c6480766f7f7cef5467412af1490f8d1e243141daddada3264f"
+SRC_URI[annotate-snippets-0.11.4.sha256sum] = "24e35ed54e5ea7997c14ed4c70ba043478db1112e98263b3b035907aa197d991"
+SRC_URI[anstream-0.6.15.sha256sum] = "64e15c1ab1f89faffbf04a634d5e1962e9074f2741eef6d97f3c4e322426d526"
+SRC_URI[anstyle-1.0.8.sha256sum] = "1bec1de6f59aedf83baf9ff929c98f2ad654b97c9510f4e70cf6f661d49fd5b1"
+SRC_URI[anstyle-parse-0.2.5.sha256sum] = "eb47de1e80c2b463c735db5b217a0ddc39d612e7ac9e2e96a5aed1f57616c1cb"
+SRC_URI[anstyle-query-1.1.1.sha256sum] = "6d36fc52c7f6c869915e99412912f22093507da8d9e942ceaf66fe4b7c14422a"
+SRC_URI[anstyle-wincon-3.0.4.sha256sum] = "5bf74e1b6e971609db8ca7a9ce79fd5768ab6ae46441c572e46cf596f59e57f8"
+SRC_URI[anyhow-1.0.86.sha256sum] = "b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da"
+SRC_URI[arc-swap-1.7.1.sha256sum] = "69f7f8c3906b62b754cd5326047894316021dcfe5a194c8ea52bdd94934a3457"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
-SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
+SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[base64ct-1.6.0.sha256sum] = "8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
+SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
 SRC_URI[bitmaps-2.1.0.sha256sum] = "031043d04099746d8db04daf1fa424b2bc8bd69d92b25962dcde24da39ab64a2"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[bstr-1.9.0.sha256sum] = "c48f0051a4b4c5e0b6d365cd04af53aeaa209e3cc15ec2cdb69e73cc87fbd0dc"
-SRC_URI[btoi-0.4.3.sha256sum] = "9dd6407f73a9b8b6162d8a2ef999fe6afd7cc15902ebf42c5cd296addf17e0ad"
-SRC_URI[bumpalo-3.14.0.sha256sum] = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec"
-SRC_URI[bytes-1.5.0.sha256sum] = "a2bd12c1caf447e69cd4528f47f94d203fd2582878ecb9e9465484c4148a8223"
+SRC_URI[bstr-1.10.0.sha256sum] = "40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c"
+SRC_URI[bumpalo-3.16.0.sha256sum] = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
+SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
+SRC_URI[bytes-1.6.1.sha256sum] = "a12916984aab3fa6e39d655a33e09c0071eb36d6ab3aea5c2d78551f1df6d952"
 SRC_URI[bytesize-1.3.0.sha256sum] = "a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc"
-SRC_URI[cargo-0.77.0.sha256sum] = "4a399e5bde59d144aa2c7ba643765e2f8c6c3c601daa2da03202caf66f2552b3"
-SRC_URI[cargo-credential-0.4.2.sha256sum] = "ec27ad011c37339b865c765fa28096cd63d5b25fab680c04d9e410cb586c327d"
-SRC_URI[cargo-credential-libsecret-0.4.2.sha256sum] = "26b0ff7a44dd0af0fcd8d09bb1a6d7f7652847cba10aad017a6ea0a25ba7f00f"
-SRC_URI[cargo-credential-macos-keychain-0.4.2.sha256sum] = "4b7cf89a47dc2c20ae3a7c94335e151be32c20f85cc2790defdb1f5dac818de5"
-SRC_URI[cargo-credential-wincred-0.4.2.sha256sum] = "341df45dc893bdffa36e2f7cbe3da90b38c5c74e7f4c0088ac801fd055b6df5b"
-SRC_URI[cargo-platform-0.1.7.sha256sum] = "694c8807f2ae16faecc43dc17d74b3eb042482789fd0eb64b39a2e04e087053f"
-SRC_URI[cargo-util-0.2.9.sha256sum] = "74862c3c6e53a1c1f8f0178f9d38ab41e49746cd3a7cafc239b3d0248fd4e342"
+SRC_URI[cargo-0.81.0.sha256sum] = "f24c9dcadcdad2f6fa2553b63d5e9c9700fa6932b75d53f3b11b8aea35ebab99"
+SRC_URI[cargo-credential-0.4.6.sha256sum] = "3a3e7c625670eacbefd48f552588c491eccc79a85a96898af13af7b312d1c4cd"
+SRC_URI[cargo-credential-libsecret-0.4.6.sha256sum] = "7133c8156697989e0d3547f886083bdcb4d7463be67699c37c206152e46925b0"
+SRC_URI[cargo-credential-macos-keychain-0.4.6.sha256sum] = "5e238786dd6bc99a94a99a108a0fedcc7e786a86c81b8e9857da88ca3caac3d0"
+SRC_URI[cargo-credential-wincred-0.4.6.sha256sum] = "cc0e24a553bb387e22fd5a18f49b72f15db22426b5a0cd37c5fc804978f5ce13"
+SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
+SRC_URI[cargo-util-0.2.13.sha256sum] = "14104698cb1694d43c2ff73492468ccf2bb0b047071a9838d999eeba9e984ffa"
+SRC_URI[cargo-util-schemas-0.4.0.sha256sum] = "34ddc7fc157e3dbbd88f05ef8be7c3ed3ecb05925a3f51f716d6103a607fb7c4"
 SRC_URI[cbindgen-0.26.0.sha256sum] = "da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49"
-SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
+SRC_URI[cc-1.1.7.sha256sum] = "26a5c3fd7bfa1ce3897a3a3501d362b2d87b7f2583ebcb4a949ec25911025cbc"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clap-4.5.0.sha256sum] = "80c21025abd42669a92efc996ef13cfb2c5c627858421ea58d5c3b331a6c134f"
-SRC_URI[clap_builder-4.5.0.sha256sum] = "458bf1f341769dfcf849846f65dffdf9146daa56bcd2a47cb4e1de9915567c99"
-SRC_URI[clap_derive-4.5.0.sha256sum] = "307bc0538d5f0f83b8248db3087aa92fe504e4691294d0c96c0eabc33f47ba47"
-SRC_URI[clap_lex-0.7.0.sha256sum] = "98cc8fbded0c607b7ba9dd60cd98df59af97e84d24e49c8557331cfc26d301ce"
-SRC_URI[clru-0.6.1.sha256sum] = "b8191fa7302e03607ff0e237d4246cc043ff5b3cb9409d995172ba3bea16b807"
-SRC_URI[color-print-0.3.5.sha256sum] = "7a858372ff14bab9b1b30ea504f2a4bc534582aee3e42ba2d41d2a7baba63d5d"
-SRC_URI[color-print-proc-macro-0.3.5.sha256sum] = "57e37866456a721d0a404439a1adae37a31be4e0055590d053dfe6981e05003f"
-SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[clap-4.5.11.sha256sum] = "35723e6a11662c2afb578bcf0b88bf6ea8e21282a953428f240574fcc3a2b5b3"
+SRC_URI[clap_builder-4.5.11.sha256sum] = "49eb96cbfa7cfa35017b7cd548c75b14c3118c98b423041d70562665e07fb0fa"
+SRC_URI[clap_derive-4.5.11.sha256sum] = "5d029b67f89d30bbb547c89fd5161293c0aec155fc691d7924b64550662db93e"
+SRC_URI[clap_lex-0.7.2.sha256sum] = "1462739cb27611015575c0c11df5df7601141071f07518d56fcc1be504cbec97"
+SRC_URI[clru-0.6.2.sha256sum] = "cbd0f76e066e64fdc5631e3bb46381254deab9ef1158292f27c8c57e3bf3fe59"
+SRC_URI[color-print-0.3.6.sha256sum] = "1ee543c60ff3888934877a5671f45494dd27ed4ba25c6670b9a7576b7ed7a8c0"
+SRC_URI[color-print-proc-macro-0.3.6.sha256sum] = "77ff1a80c5f3cb1ca7c06ffdd71b6a6dd6d8f896c42141fbd43f50ed28dcdb93"
+SRC_URI[colorchoice-1.0.2.sha256sum] = "d3fd119d74b830634cea2a0f58bbd0d54540518a14397557951e79340abc28c0"
 SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
 SRC_URI[core-foundation-0.9.4.sha256sum] = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
 SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
 SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
-SRC_URI[crates-io-0.39.2.sha256sum] = "6622f902c3c338eced1f000091f034846ae36aadaf35d0acd1ab0469a2d8ef1f"
-SRC_URI[crc32fast-1.3.2.sha256sum] = "b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d"
-SRC_URI[crossbeam-channel-0.5.11.sha256sum] = "176dc175b78f56c0f321911d9c8eb2b77a78a4860b9c19db83835fea1a46649b"
+SRC_URI[crates-io-0.40.3.sha256sum] = "3b7837d3d2ea5d21a399489029609840d95608bfdf1dc5fd8604392df4b219b3"
+SRC_URI[crc32fast-1.4.2.sha256sum] = "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
+SRC_URI[crossbeam-channel-0.5.13.sha256sum] = "33480d6946193aa8033910124896ca395333cae7e2d1113d1fef6c3272217df2"
 SRC_URI[crossbeam-deque-0.8.5.sha256sum] = "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
-SRC_URI[crossbeam-utils-0.8.19.sha256sum] = "248e3bacc7dc6baa3b21e405ee045c3047101a49145e7e9eca583ab4c2ca5345"
+SRC_URI[crossbeam-utils-0.8.20.sha256sum] = "22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80"
 SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[ct-codecs-1.1.1.sha256sum] = "f3b7eb4404b8195a9abb6356f4ac07d8ba267045c8d6d220ac4dc992e6cc75df"
-SRC_URI[curl-0.4.45.sha256sum] = "f8e5123ab8c31200ce725939049ecd4a090b242608f24048131dedf9dd195aed"
-SRC_URI[curl-sys-0.4.72+curl-8.6.0.sha256sum] = "29cbdc8314c447d11e8fd156dcdd031d9e02a7a976163e396b548c03153bc9ea"
-SRC_URI[der-0.7.8.sha256sum] = "fffa369a668c8af7dbf8b5e56c9f744fbd399949ed171606040001947de40b1c"
+SRC_URI[curl-0.4.46.sha256sum] = "1e2161dd6eba090ff1594084e95fd67aeccf04382ffea77999ea94ed42ec67b6"
+SRC_URI[curl-sys-0.4.73+curl-8.8.0.sha256sum] = "450ab250ecf17227c39afb9a2dd9261dc0035cb80f2612472fc0c4aac2dcb84d"
+SRC_URI[dbus-0.9.7.sha256sum] = "1bb21987b9fb1613058ba3843121dd18b163b254d8a6e797e144cbac14d96d1b"
+SRC_URI[der-0.7.9.sha256sum] = "f55bf8e7b65898637379c1b74eb1551107c8294ed26d855ceb9fd1a09cfc9bc0"
 SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
 SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
 SRC_URI[ed25519-compact-2.1.1.sha256sum] = "e9b3460f44bea8cd47f45a0c70892f1eff856d97cd55358b2f73f663789f6190"
-SRC_URI[either-1.9.0.sha256sum] = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
+SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
 SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
-SRC_URI[encoding_rs-0.8.33.sha256sum] = "7268b386296a025e474d5140678f75d6de9493ae55a5d709eeb9dd08149945e1"
+SRC_URI[encoding_rs-0.8.34.sha256sum] = "b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59"
 SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
-SRC_URI[erased-serde-0.4.2.sha256sum] = "55d05712b2d8d88102bc9868020c9e5c7a1f5527c452b9b97450a1d006140ba7"
-SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
+SRC_URI[erased-serde-0.4.5.sha256sum] = "24e2389d65ab4fab27dc2a5de7b191e1f6617d1f1c8855c0dc569c94a4cbb18d"
+SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
 SRC_URI[fallible-iterator-0.3.0.sha256sum] = "2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649"
 SRC_URI[fallible-streaming-iterator-0.1.9.sha256sum] = "7360491ce676a36bf9bb3c56c1aa791658183a54d2744120f27285738d90465a"
 SRC_URI[faster-hex-0.9.0.sha256sum] = "a2a2b11eda1d40935b26cf18f6833c526845ae8c41e58d09af6adeb6f0269183"
-SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
+SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
 SRC_URI[ff-0.13.0.sha256sum] = "ded41244b729663b1e574f1b4fb731469f69f79c17667b5d776b16cda0479449"
-SRC_URI[fiat-crypto-0.2.6.sha256sum] = "1676f435fc1dadde4d03e43f5d62b259e1ce5f40bd4ffb21db2b42ebe59c1382"
+SRC_URI[fiat-crypto-0.2.9.sha256sum] = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
 SRC_URI[filetime-0.2.23.sha256sum] = "1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd"
-SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"
+SRC_URI[flate2-1.0.30.sha256sum] = "5f54427cfd1c7829e2a139fcefea601bf088ebca651d2bf53ebc600eac295dae"
+SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.12.sha256sum] = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5"
-SRC_URI[git2-0.18.2.sha256sum] = "1b3ba52851e73b46a4c3df1d89343741112003f0f6f13beb0dfac9e457c3fdcd"
+SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[git2-0.18.3.sha256sum] = "232e6a7bfe35766bf715e55a88b39a700596c0ccfd88cd3680b4cdb40d66ef70"
 SRC_URI[git2-curl-0.19.0.sha256sum] = "78e26b61608c573ffd26fc79061a823aa5147449a1afe1f61679a21e2031f7c3"
-SRC_URI[gix-0.56.0.sha256sum] = "5b0dcdc9c60d66535897fa40a7ea2a635e72f99456b1d9ae86b7e170e80618cb"
-SRC_URI[gix-actor-0.28.1.sha256sum] = "2eadca029ef716b4378f7afb19f7ee101fde9e58ba1f1445971315ac866db417"
-SRC_URI[gix-attributes-0.20.1.sha256sum] = "0f395469d38c76ec47cd1a6c5a53fbc3f13f737b96eaf7535f4e6b367e643381"
-SRC_URI[gix-bitmap-0.2.10.sha256sum] = "78b6cd0f246180034ddafac9b00a112f19178135b21eb031b3f79355891f7325"
-SRC_URI[gix-chunk-0.4.7.sha256sum] = "003ec6deacf68076a0c157271a127e0bb2c031c1a41f7168cbe5d248d9b85c78"
-SRC_URI[gix-command-0.3.4.sha256sum] = "c82b5e9494e61983e61049bbd15fe0fa6b70672dd236362bdb5b2b50fc428f10"
-SRC_URI[gix-commitgraph-0.22.1.sha256sum] = "85a7007ba021f059803afaf6f8a48872422abc20550ac12ede6ddea2936cec36"
-SRC_URI[gix-config-0.32.1.sha256sum] = "0341471d55d8676e98b88e121d7065dfa4c9c5acea4b6d6ecdd2846e85cce0c3"
-SRC_URI[gix-config-value-0.14.4.sha256sum] = "5b8a1e7bfb37a46ed0b8468db37a6d8a0a61d56bdbe4603ae492cb322e5f3958"
-SRC_URI[gix-credentials-0.22.0.sha256sum] = "513dac42450b27946bd0a0535a3a5a88e473d6522e5e3439a129cab779c88f3d"
-SRC_URI[gix-date-0.8.3.sha256sum] = "fb7f3dfb72bebe3449b5e642be64e3c6ccbe9821c8b8f19f487cf5bfbbf4067e"
-SRC_URI[gix-diff-0.38.0.sha256sum] = "8119a985887cfe68f4bdf92e51bd64bc758a73882d82fcfc03ebcb164441c85d"
-SRC_URI[gix-discover-0.27.0.sha256sum] = "6fad89416ebe0b3b7df78464124e2a02417b6cd3743d48ad93df86f4d2929c07"
-SRC_URI[gix-features-0.35.0.sha256sum] = "9b9ff423ae4983f762659040d13dd7a5defbd54b6a04ac3cc7347741cec828cd"
-SRC_URI[gix-features-0.36.1.sha256sum] = "4d46a4a5c6bb5bebec9c0d18b65ada20e6517dbd7cf855b87dd4bbdce3a771b2"
-SRC_URI[gix-filter-0.7.0.sha256sum] = "6d6a5c9d8e55c364e7c226919c19c9a28be1392d6208b5008059fa94ff7e2bf0"
-SRC_URI[gix-fs-0.8.1.sha256sum] = "20e86eb040f5776a5ade092282e51cdcad398adb77d948b88d17583c2ae4e107"
-SRC_URI[gix-glob-0.14.1.sha256sum] = "5db19298c5eeea2961e5b3bf190767a2d1f09b8802aeb5f258e42276350aff19"
-SRC_URI[gix-hash-0.13.3.sha256sum] = "1f8cf8c2266f63e582b7eb206799b63aa5fa68ee510ad349f637dfe2d0653de0"
-SRC_URI[gix-hashtable-0.4.1.sha256sum] = "feb61880816d7ec4f0b20606b498147d480860ddd9133ba542628df2f548d3ca"
-SRC_URI[gix-ignore-0.9.1.sha256sum] = "a215cc8cf21645bca131fcf6329d3ebd46299c47dbbe27df71bb1ca9e328b879"
-SRC_URI[gix-index-0.27.1.sha256sum] = "f3f308f5cd2992e96a274b0d1931e9a0e44fdcba87695ead3f6df30d8a697e9c"
-SRC_URI[gix-lock-11.0.1.sha256sum] = "7e5c65e6a29830a435664891ced3f3c1af010f14900226019590ee0971a22f37"
-SRC_URI[gix-macros-0.1.3.sha256sum] = "d75e7ab728059f595f6ddc1ad8771b8d6a231971ae493d9d5948ecad366ee8bb"
-SRC_URI[gix-negotiate-0.10.0.sha256sum] = "979f6accd9c051b3dd018b50adf29c0a2459edddf6105cc70b767976cd6f8014"
-SRC_URI[gix-object-0.39.0.sha256sum] = "febf79c5825720c1c63fe974c7bbe695d0cb54aabad73f45671c60ce0e501e33"
-SRC_URI[gix-odb-0.55.0.sha256sum] = "1fae5f971540c99c6ecc8d4368ecc9d18a9dc8b9391025c68c4399747dc93bac"
-SRC_URI[gix-pack-0.45.0.sha256sum] = "4569491c92446fddf373456ff360aff9a9effd627b40a70f2d7914dcd75a3205"
-SRC_URI[gix-packetline-0.17.3.sha256sum] = "09ff45eef7747bde4986429a3e813478d50c2688b8f239e57bd3aa81065b285f"
-SRC_URI[gix-packetline-blocking-0.17.3.sha256sum] = "ca8ef6dd3ea50e26f3bf572e90c034d033c804d340cd1eb386392f184a9ba2f7"
-SRC_URI[gix-path-0.10.5.sha256sum] = "97e9ad649bf5e109562d6acba657ca428661ec08e77eaf3a755d8fa55485be9c"
-SRC_URI[gix-pathspec-0.4.1.sha256sum] = "1dbbb92f75a38ef043c8bb830b339b38d0698d7f3746968b5fcbade7a880494d"
-SRC_URI[gix-prompt-0.8.2.sha256sum] = "02bd89d058258e53e0fd6c57f13ee16c5673a83066a68e11f88626fc8cfda5f6"
-SRC_URI[gix-protocol-0.42.0.sha256sum] = "95736ef407db0bd15a5bdea791fbfcf523b9f13b96c852c240cd86a9ee0ef817"
-SRC_URI[gix-quote-0.4.10.sha256sum] = "9f7dc10303d73a960d10fb82f81188b036ac3e6b11b5795b20b1a60b51d1321f"
-SRC_URI[gix-ref-0.39.1.sha256sum] = "3b2069adc212cf7f3317ef55f6444abd06c50f28479dbbac5a86acf3b05cbbfe"
-SRC_URI[gix-refspec-0.20.0.sha256sum] = "76d9d3b82e1ee78fc0dc1c37ea5ea76c2dbc73f407db155f0dfcea285e583bee"
-SRC_URI[gix-revision-0.24.0.sha256sum] = "fe5dd51710ce5434bc315ea30394fab483c5377276494edd79222b321a5a9544"
-SRC_URI[gix-revwalk-0.10.0.sha256sum] = "69d4ed2493ca94a475fdf147138e1ef8bab3b6ebb56abf3d9bda1c05372ec1dd"
-SRC_URI[gix-sec-0.10.4.sha256sum] = "f8d9bf462feaf05f2121cba7399dbc6c34d88a9cad58fc1e95027791d6a3c6d2"
-SRC_URI[gix-submodule-0.6.0.sha256sum] = "02a3d7f60a95bdcaeb8981663c99d1c9f4de42aab1169524c949e948989809f9"
-SRC_URI[gix-tempfile-11.0.1.sha256sum] = "388dd29114a86ec69b28d1e26d6d63a662300ecf61ab3f4cc578f7d7dc9e7e23"
-SRC_URI[gix-trace-0.1.7.sha256sum] = "02b202d766a7fefc596e2cc6a89cda8ad8ad733aed82da635ac120691112a9b1"
-SRC_URI[gix-transport-0.39.0.sha256sum] = "f731cfefc4d62468c6dd2053f5c6707828256a6d2f5488c1811e3f42c178b144"
-SRC_URI[gix-traverse-0.35.0.sha256sum] = "df2112088122a0206592c84fbd42020db63b2ccaed66a0293779f2e5fbf80474"
-SRC_URI[gix-url-0.25.2.sha256sum] = "0c427a1a11ccfa53a4a2da47d9442c2241deee63a154bc15cc14b8312fbc4005"
-SRC_URI[gix-utils-0.1.9.sha256sum] = "56e839f3d0798b296411263da6bee780a176ef8008a5dfc31287f7eda9266ab8"
-SRC_URI[gix-validate-0.8.3.sha256sum] = "ac7cc36f496bd5d96cdca0f9289bb684480725d40db60f48194aa7723b883854"
-SRC_URI[gix-worktree-0.28.0.sha256sum] = "7f1d0ae01dee14abe8c8117d78d7518f9a507de2dc4522546fbf4c444e9860b4"
+SRC_URI[gix-0.63.0.sha256sum] = "984c5018adfa7a4536ade67990b3ebc6e11ab57b3d6cd9968de0947ca99b4b06"
+SRC_URI[gix-actor-0.31.5.sha256sum] = "a0e454357e34b833cc3a00b6efbbd3dd4d18b24b9fb0c023876ec2645e8aa3f2"
+SRC_URI[gix-attributes-0.22.3.sha256sum] = "e37ce99c7e81288c28b703641b6d5d119aacc45c1a6b247156e6249afa486257"
+SRC_URI[gix-bitmap-0.2.11.sha256sum] = "a371db66cbd4e13f0ed9dc4c0fea712d7276805fccc877f77e96374d317e87ae"
+SRC_URI[gix-chunk-0.4.8.sha256sum] = "45c8751169961ba7640b513c3b24af61aa962c967aaf04116734975cd5af0c52"
+SRC_URI[gix-command-0.3.8.sha256sum] = "0d76867867da891cbe32021ad454e8cae90242f6afb06762e4dd0d357afd1d7b"
+SRC_URI[gix-commitgraph-0.24.3.sha256sum] = "133b06f67f565836ec0c473e2116a60fb74f80b6435e21d88013ac0e3c60fc78"
+SRC_URI[gix-config-0.37.0.sha256sum] = "53fafe42957e11d98e354a66b6bd70aeea00faf2f62dd11164188224a507c840"
+SRC_URI[gix-config-value-0.14.7.sha256sum] = "b328997d74dd15dc71b2773b162cb4af9a25c424105e4876e6d0686ab41c383e"
+SRC_URI[gix-credentials-0.24.4.sha256sum] = "198588f532e4d1202e04e6c3f50e4d7c060dffc66801c6f53cc246f1d234739e"
+SRC_URI[gix-date-0.8.7.sha256sum] = "9eed6931f21491ee0aeb922751bd7ec97b4b2fe8fbfedcb678e2a2dce5f3b8c0"
+SRC_URI[gix-diff-0.44.1.sha256sum] = "1996d5c8a305b59709467d80617c9fde48d9d75fd1f4179ea970912630886c9d"
+SRC_URI[gix-dir-0.5.0.sha256sum] = "60c99f8c545abd63abe541d20ab6cda347de406c0a3f1c80aadc12d9b0e94974"
+SRC_URI[gix-discover-0.32.0.sha256sum] = "fc27c699b63da66b50d50c00668bc0b7e90c3a382ef302865e891559935f3dbf"
+SRC_URI[gix-features-0.38.2.sha256sum] = "ac7045ac9fe5f9c727f38799d002a7ed3583cd777e3322a7c4b43e3cf437dc69"
+SRC_URI[gix-filter-0.11.3.sha256sum] = "e6547738da28275f4dff4e9f3a0f28509f53f94dd6bd822733c91cb306bca61a"
+SRC_URI[gix-fs-0.11.2.sha256sum] = "6adf99c27cdf17b1c4d77680c917e0d94d8783d4e1c73d3be0d1d63107163d7a"
+SRC_URI[gix-glob-0.16.4.sha256sum] = "fa7df15afa265cc8abe92813cd354d522f1ac06b29ec6dfa163ad320575cb447"
+SRC_URI[gix-hash-0.14.2.sha256sum] = "f93d7df7366121b5018f947a04d37f034717e113dcf9ccd85c34b58e57a74d5e"
+SRC_URI[gix-hashtable-0.5.2.sha256sum] = "7ddf80e16f3c19ac06ce415a38b8591993d3f73aede049cb561becb5b3a8e242"
+SRC_URI[gix-ignore-0.11.3.sha256sum] = "5e6afb8f98e314d4e1adc822449389ada863c174b5707cedd327d67b84dba527"
+SRC_URI[gix-index-0.33.1.sha256sum] = "9a9a44eb55bd84bb48f8a44980e951968ced21e171b22d115d1cdcef82a7d73f"
+SRC_URI[gix-lock-14.0.0.sha256sum] = "e3bc7fe297f1f4614774989c00ec8b1add59571dc9b024b4c00acb7dedd4e19d"
+SRC_URI[gix-macros-0.1.5.sha256sum] = "999ce923619f88194171a67fb3e6d613653b8d4d6078b529b15a765da0edcc17"
+SRC_URI[gix-negotiate-0.13.2.sha256sum] = "9ec879fb6307bb63519ba89be0024c6f61b4b9d61f1a91fd2ce572d89fe9c224"
+SRC_URI[gix-object-0.42.3.sha256sum] = "25da2f46b4e7c2fa7b413ce4dffb87f69eaf89c2057e386491f4c55cadbfe386"
+SRC_URI[gix-odb-0.61.1.sha256sum] = "20d384fe541d93d8a3bb7d5d5ef210780d6df4f50c4e684ccba32665a5e3bc9b"
+SRC_URI[gix-pack-0.51.1.sha256sum] = "3e0594491fffe55df94ba1c111a6566b7f56b3f8d2e1efc750e77d572f5f5229"
+SRC_URI[gix-packetline-0.17.5.sha256sum] = "b70486beda0903b6d5b65dfa6e40585098cdf4e6365ca2dff4f74c387354a515"
+SRC_URI[gix-packetline-blocking-0.17.4.sha256sum] = "c31d42378a3d284732e4d589979930d0d253360eccf7ec7a80332e5ccb77e14a"
+SRC_URI[gix-path-0.10.9.sha256sum] = "8d23d5bbda31344d8abc8de7c075b3cf26e5873feba7c4a15d916bce67382bd9"
+SRC_URI[gix-pathspec-0.7.6.sha256sum] = "d307d1b8f84dc8386c4aa20ce0cf09242033840e15469a3ecba92f10cfb5c046"
+SRC_URI[gix-prompt-0.8.6.sha256sum] = "7e0595d2be4b6d6a71a099e989bdd610882b882da35fb8503d91d6f81aa0936f"
+SRC_URI[gix-protocol-0.45.2.sha256sum] = "bad8da8e89f24177bd77947092199bb13dcc318bbd73530ba8a05e6d6adaaa9d"
+SRC_URI[gix-quote-0.4.12.sha256sum] = "cbff4f9b9ea3fa7a25a70ee62f545143abef624ac6aa5884344e70c8b0a1d9ff"
+SRC_URI[gix-ref-0.44.1.sha256sum] = "3394a2997e5bc6b22ebc1e1a87b41eeefbcfcff3dbfa7c4bd73cb0ac8f1f3e2e"
+SRC_URI[gix-refspec-0.23.1.sha256sum] = "6868f8cd2e62555d1f7c78b784bece43ace40dd2a462daf3b588d5416e603f37"
+SRC_URI[gix-revision-0.27.2.sha256sum] = "01b13e43c2118c4b0537ddac7d0821ae0dfa90b7b8dbf20c711e153fb749adce"
+SRC_URI[gix-revwalk-0.13.2.sha256sum] = "1b030ccaab71af141f537e0225f19b9e74f25fefdba0372246b844491cab43e0"
+SRC_URI[gix-sec-0.10.7.sha256sum] = "1547d26fa5693a7f34f05b4a3b59a90890972922172653bcb891ab3f09f436df"
+SRC_URI[gix-submodule-0.11.0.sha256sum] = "921cd49924ac14b6611b22e5fb7bbba74d8780dc7ad26153304b64d1272460ac"
+SRC_URI[gix-tempfile-14.0.1.sha256sum] = "006acf5a613e0b5cf095d8e4b3f48c12a60d9062aa2b2dd105afaf8344a5600c"
+SRC_URI[gix-trace-0.1.9.sha256sum] = "f924267408915fddcd558e3f37295cc7d6a3e50f8bd8b606cee0808c3915157e"
+SRC_URI[gix-transport-0.42.2.sha256sum] = "27c02b83763ffe95bcc27ce5821b2b7f843315a009c06f1cd59c9b66c508c058"
+SRC_URI[gix-traverse-0.39.2.sha256sum] = "e499a18c511e71cf4a20413b743b9f5bcf64b3d9e81e9c3c6cd399eae55a8840"
+SRC_URI[gix-url-0.27.4.sha256sum] = "e2eb9b35bba92ea8f0b5ab406fad3cf6b87f7929aa677ff10aa042c6da621156"
+SRC_URI[gix-utils-0.1.12.sha256sum] = "35192df7fd0fa112263bad8021e2df7167df4cc2a6e6d15892e1e55621d3d4dc"
+SRC_URI[gix-validate-0.8.5.sha256sum] = "82c27dd34a49b1addf193c92070bcbf3beaf6e10f16a78544de6372e146a0acf"
+SRC_URI[gix-worktree-0.34.1.sha256sum] = "26f7326ebe0b9172220694ea69d344c536009a9b98fb0f9de092c440f3efe7a6"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
 SRC_URI[globset-0.4.14.sha256sum] = "57da3b9b5b85bd66f31093f8c408b90a74431672542466497dcbdfdc02034be1"
 SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
 SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
-SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
-SRC_URI[hashlink-0.8.4.sha256sum] = "e8094feaf31ff591f651a2664fb9cfd92bba7a60ce3197265e9482ebe753c8f7"
+SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
+SRC_URI[hashlink-0.9.1.sha256sum] = "6ba4ff7128dee98c7dc9794b6a411377e1404dba1c97deb8d1a55297bd25d8af"
 SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[hermit-abi-0.3.5.sha256sum] = "d0c62115964e08cb8039170eb33c1d0e2388a256930279edca206fff675f82c3"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
 SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
@@ -479,176 +494,183 @@ SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6f
 SRC_URI[ignore-0.4.22.sha256sum] = "b46810df39e66e925525d6e38ce1e7f6e1d208f72dc39757880fcb66e2c58af1"
 SRC_URI[im-rc-15.1.0.sha256sum] = "af1955a75fa080c677d3972822ec4bad316169ab1cfc6c257a942c2265dbe5fe"
 SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
-SRC_URI[indexmap-2.2.2.sha256sum] = "824b2ae422412366ba479e8111fd301f7b5faece8149317bb81925979a53f520"
-SRC_URI[is-terminal-0.4.11.sha256sum] = "fe8f25ce1159c7740ff0b9b2f5cdf4a8428742ba7c112b9f20f22cd5219c7dab"
+SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
 SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
-SRC_URI[itoa-1.0.10.sha256sum] = "b1a46d1a171d865aa5f83f92695765caa047a9b4cbae2cbf37dbd613a793fd4c"
-SRC_URI[jobserver-0.1.28.sha256sum] = "ab46a6e9526ddef3ae7f787c06f0f2600639ba80ea3eade3d8e670a2230f51d6"
-SRC_URI[js-sys-0.3.68.sha256sum] = "406cda4b368d531c842222cf9d2600a9a4acce8d29423695379c6868a143a9ee"
-SRC_URI[kstring-2.0.0.sha256sum] = "ec3066350882a1cd6d950d055997f379ac37fd39f81cd4d8ed186032eb3c5747"
-SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
+SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
+SRC_URI[jobserver-0.1.32.sha256sum] = "48d1dbcbbeb6a7fec7e059840aa538bd62aaccf972c7346c4d9d2059312853d0"
+SRC_URI[js-sys-0.3.69.sha256sum] = "29c15563dc2726973df627357ce0c9ddddbea194836909d655df6a75d2cf296d"
+SRC_URI[kstring-2.0.2.sha256sum] = "558bf9508a558512042d3095138b1f7b8fe90c5467d94f9f1da28b3731c5dbd1"
+SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.153.sha256sum] = "9c198f91728a82281a64e1f4f9eeb25d82cb32a5de251c6bd1b5154d63a8e7bd"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[libdbus-sys-0.2.5.sha256sum] = "06085512b750d640299b79be4bad3d2fa90a9c00b1fd9e1b46364f66f0485c72"
 SRC_URI[libgit2-sys-0.16.2+1.7.2.sha256sum] = "ee4126d8b4ee5c9d9ea891dd875cfdc1e9d0950437179104b183d7d8a74d24e8"
-SRC_URI[libloading-0.8.1.sha256sum] = "c571b676ddfc9a8c12f1f3d3085a7b163966a8fd8098a90640953ce5f6170161"
-SRC_URI[libnghttp2-sys-0.1.9+1.58.0.sha256sum] = "b57e858af2798e167e709b9d969325b6d8e9d50232fcbc494d7d54f976854a64"
-SRC_URI[libsqlite3-sys-0.27.0.sha256sum] = "cf4e226dcd58b4be396f7bd3c20da8fdee2911400705297ba7d2d7cc2c30f716"
+SRC_URI[libloading-0.8.5.sha256sum] = "4979f22fdb869068da03c9f7528f8297c6fd2606bc3a4affe42e6a823fdb8da4"
+SRC_URI[libnghttp2-sys-0.1.10+1.61.0.sha256sum] = "959c25552127d2e1fa72f0e52548ec04fc386e827ba71a7bd01db46a447dc135"
+SRC_URI[libsqlite3-sys-0.28.0.sha256sum] = "0c10584274047cb335c23d3e61bcef8e323adae7c5c8c760540f73610177fc3f"
 SRC_URI[libssh2-sys-0.3.0.sha256sum] = "2dc8a030b787e2119a731f1951d6a773e2280c660f8ec4b0f5e1505a386e71ee"
-SRC_URI[libz-sys-1.1.15.sha256sum] = "037731f5d3aaa87a5675e895b63ddff1a87624bc29f77004ea829809654e48f6"
-SRC_URI[linux-raw-sys-0.4.13.sha256sum] = "01cda141df6706de531b6c46c3a33ecca755538219bd484262fa09410c13539c"
-SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
-SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[libz-sys-1.1.18.sha256sum] = "c15da26e5af7e25c90b37a2d75cdbf940cf4a55316de9d84c679c9b8bfabf82e"
+SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
+SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
+SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
 SRC_URI[matchers-0.1.0.sha256sum] = "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
-SRC_URI[maybe-async-0.2.9.sha256sum] = "afc95a651c82daf7004c824405aa1019723644950d488571bd718e3ed84646ed"
-SRC_URI[memchr-2.7.1.sha256sum] = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
+SRC_URI[maybe-async-0.2.10.sha256sum] = "5cf92c10c7e361d6b99666ec1c6f9805b0bea2c3bd8c78dc6fe98ac5bd78db11"
+SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
 SRC_URI[memmap2-0.9.4.sha256sum] = "fe751422e4a8caa417e13c3ea66452215d7d63e19e604f4980461212f3ae1322"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.7.2.sha256sum] = "9d811f3e15f28568be3407c8e7fdb6514c1cda3cb30683f15b6a1a1dc4ea14a7"
+SRC_URI[miniz_oxide-0.7.4.sha256sum] = "b8a240ddb74feaf34a79a7add65a741f3167852fba007066dcac1ca548d89c08"
 SRC_URI[miow-0.6.0.sha256sum] = "359f76430b20a79f9e20e115b3428614e654f04fab314482fc0fda0ebd3c6044"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
-SRC_URI[normpath-1.1.1.sha256sum] = "ec60c60a693226186f5d6edf073232bfb6464ed97eb22cf3b01c1e8198fd97f5"
+SRC_URI[normpath-1.2.0.sha256sum] = "5831952a9476f2fed74b77d74182fa5ddc4d21c72ec45a333b250e3ed0272804"
 SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
-SRC_URI[num-traits-0.2.18.sha256sum] = "da0df0e5185db44f69b44f26786fe401b6c293d1907744beaa7fa62b2e5a517a"
-SRC_URI[num_threads-0.1.6.sha256sum] = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[num_threads-0.1.7.sha256sum] = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[opener-0.6.1.sha256sum] = "6c62dcb6174f9cb326eac248f07e955d5d559c272730b6c03e396b443b562788"
-SRC_URI[openssl-0.10.63.sha256sum] = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
+SRC_URI[opener-0.7.1.sha256sum] = "f8df34be653210fbe9ffaff41d3b92721c56ce82dfee58ee684f9afb5e3a90c0"
+SRC_URI[openssl-0.10.66.sha256sum] = "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.1.5.sha256sum] = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
-SRC_URI[openssl-src-300.2.2+3.2.1.sha256sum] = "8bbfad0063610ac26ee79f7484739e2b07555a75c42453b89263830b5c8103bc"
-SRC_URI[openssl-sys-0.9.99.sha256sum] = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
+SRC_URI[openssl-src-300.3.1+3.3.1.sha256sum] = "7259953d42a81bf137fbbd73bd30a8e1914d6dce43c2b90ed575783a22608b91"
+SRC_URI[openssl-sys-0.9.103.sha256sum] = "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
 SRC_URI[ordered-float-2.10.1.sha256sum] = "68f19d67e5a2795c94e73e0bb1cc1a7edeb2e28efd39e2e1c9b7a40c1108b11c"
 SRC_URI[orion-0.17.6.sha256sum] = "7abdb10181903c8c4b016ba45d6d6d5af1a1e2a461aa4763a83b87f5df4695e5"
-SRC_URI[os_info-3.7.0.sha256sum] = "006e42d5b888366f1880eda20371fedde764ed2213dc8496f49622fa0c99cd5e"
+SRC_URI[os_info-3.8.2.sha256sum] = "ae99c7fa6dd38c7cafe1ec085e804f8f555a2f8659b0dbe03f1f9963a9b51092"
 SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
 SRC_URI[p384-0.13.0.sha256sum] = "70786f51bcc69f6a4c0360e063a4cac5419ef7c5cd5b3c99ad70f3be5ba79209"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
+SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
+SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
 SRC_URI[pasetors-0.6.8.sha256sum] = "6b36d47c66f2230dd1b7143d9afb2b4891879020210eddf2ccb624e529b96dba"
 SRC_URI[pathdiff-0.2.1.sha256sum] = "8835116a5c179084a830efb3adc117ab007512b535bc1a21c991d3b32a6b44dd"
 SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
-SRC_URI[pin-project-lite-0.2.13.sha256sum] = "8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58"
+SRC_URI[pin-project-lite-0.2.14.sha256sum] = "bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d1aaa6923f45801bdd02"
 SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
-SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
-SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[ppv-lite86-0.2.18.sha256sum] = "dee4364d9f3b902ef14fab8a1ddffb783a1cb6b4bba3bfc1fa3922732c7de97f"
 SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
-SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
-SRC_URI[prodash-26.2.2.sha256sum] = "794b5bf8e2d19b53dcdcec3e4bba628e20f5b6062503ba89281fa7037dd7bbcf"
-SRC_URI[pulldown-cmark-0.9.6.sha256sum] = "57206b407293d2bcd3af849ce869d52068623f19e1b5ff8e8778e3309439682b"
-SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
+SRC_URI[prodash-28.0.0.sha256sum] = "744a264d26b88a6a7e37cbad97953fa233b94d585236310bcbc88474b4092d79"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_xoshiro-0.6.0.sha256sum] = "6f97cdb2a36ed4183de61b2f824cc45c9f1037f28afe0a322e9fff4c108b5aaa"
 SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
-SRC_URI[regex-1.10.3.sha256sum] = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15"
+SRC_URI[redox_syscall-0.5.3.sha256sum] = "2a908a6e00f1fdd0dfd9c0eb08ce85126f6d8bbda50017e74bc4a4b7d4a926a4"
+SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
 SRC_URI[regex-automata-0.1.10.sha256sum] = "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
-SRC_URI[regex-automata-0.4.5.sha256sum] = "5bb987efffd3c6d0d8f5f89510bb458559eab11e4f869acb20bf845e016259cd"
+SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
 SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
-SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
+SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
 SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
-SRC_URI[rusqlite-0.30.0.sha256sum] = "a78046161564f5e7cd9008aff3b2990b3850dc8e0349119b98e8f251e099f24d"
-SRC_URI[rustfix-0.7.0.sha256sum] = "7ec10cbeb92a2e494ef354d66126882da8c0a244ad769e2a7193efc5de625175"
-SRC_URI[rustix-0.38.31.sha256sum] = "6ea3e1a662af26cd7a3ba09c0297a31af215563ecf42817c98df621387f4e949"
-SRC_URI[ryu-1.0.16.sha256sum] = "f98d2aa92eebf49b69786be48e4477826b256916e84a57ff2a4f21923b48eb4c"
+SRC_URI[rusqlite-0.31.0.sha256sum] = "b838eba278d213a8beaf485bd313fd580ca4505a00d5871caeb1457c55322cae"
+SRC_URI[rustfix-0.8.4.sha256sum] = "4cef0c817217c330b3ef879e06455d726c1cffc800eaf7734d3b4ac63213636b"
+SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
+SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[schannel-0.1.23.sha256sum] = "fbc91545643bcf3a0bbb6569265615222618bdf33ce4ffbbd13c4bbd4c093534"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
-SRC_URI[security-framework-2.9.2.sha256sum] = "05b64fb303737d99b81884b2c63433e9ae28abebe5eb5045dcdd175dc2ecf4de"
-SRC_URI[security-framework-sys-2.9.1.sha256sum] = "e932934257d3b408ed8f30db49d85ea163bfe74961f017f405b025af298f0c7a"
-SRC_URI[semver-1.0.21.sha256sum] = "b97ed7a9823b74f99c7742f5336af7be5ecd3eeafcb1507d1fa93347b1d589b0"
-SRC_URI[serde-1.0.196.sha256sum] = "870026e60fa08c69f064aa766c10f10b1d62db9ccd4d0abb206472bee0ce3b32"
-SRC_URI[serde-untagged-0.1.5.sha256sum] = "6a160535368dfc353348e7eaa299156bd508c60c45a9249725f5f6d370d82a66"
+SRC_URI[security-framework-2.11.1.sha256sum] = "897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02"
+SRC_URI[security-framework-sys-2.11.1.sha256sum] = "75da29fe9b9b08fe9d6b22b5b4bcbc75d8db3aa31e639aa56bb62e9d46bfceaf"
+SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
+SRC_URI[serde-1.0.204.sha256sum] = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
+SRC_URI[serde-untagged-0.1.6.sha256sum] = "2676ba99bd82f75cae5cbd2c8eda6fa0b8760f18978ea840e980dd5567b5c5b6"
 SRC_URI[serde-value-0.7.0.sha256sum] = "f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c"
-SRC_URI[serde_derive-1.0.196.sha256sum] = "33c85360c95e7d137454dc81d9a4ed2b8efd8fbe19cee57357b32b9771fccb67"
+SRC_URI[serde_derive-1.0.204.sha256sum] = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
 SRC_URI[serde_ignored-0.1.10.sha256sum] = "a8e319a36d1b52126a0d608f24e93b2d81297091818cd70625fcf50a15d84ddf"
-SRC_URI[serde_json-1.0.113.sha256sum] = "69801b70b1c3dac963ecb03a364ba0ceda9cf60c71cfe475e99864759c8b8a79"
-SRC_URI[serde_spanned-0.6.5.sha256sum] = "eb3622f419d1296904700073ea6cc23ad690adbd66f13ea683df73298736f0c1"
+SRC_URI[serde_json-1.0.121.sha256sum] = "4ab380d7d9f22ef3f21ad3e6c1ebe8e4fc7a2000ccba2e4d71fc96f15b2cb609"
+SRC_URI[serde_spanned-0.6.7.sha256sum] = "eb5b1b31579f3811bf615c144393417496f152e12ac8b7663bf664f4a815306d"
 SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
-SRC_URI[sha1_smol-1.0.0.sha256sum] = "ae1a47186c03a32177042e55dbc5fd5aee900b8e0069a8d70fba96a9375cd012"
+SRC_URI[sha1_smol-1.0.1.sha256sum] = "bbfa15b3dddfee50a0fff136974b3e1bde555604ba463834a7eb7deb6417705d"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shell-escape-0.1.5.sha256sum] = "45bb67a18fa91266cc7807181f62f9178a6873bfad7dc788c42e6430db40184f"
 SRC_URI[shell-words-1.1.0.sha256sum] = "24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde"
 SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
 SRC_URI[sized-chunks-0.6.5.sha256sum] = "16d69225bde7a69b235da73377861095455d298f2b970996eec25ddbb42b3d1e"
-SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
-SRC_URI[socket2-0.5.5.sha256sum] = "7b5fac59a5cb5dd637972e5fca70daf0523c9067fcdc4842f053dae04a18f8e9"
+SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
+SRC_URI[socket2-0.5.7.sha256sum] = "ce305eb0b4296696835b71df73eb912e0f1ffd2556a501fcede6e0c50349191c"
 SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strsim-0.11.0.sha256sum] = "5ee073c9e4cd00e28217186dbe12796d692868f432bf2e97ee73bed0c56dfa01"
-SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
-SRC_URI[supports-hyperlinks-2.1.0.sha256sum] = "f84231692eb0d4d41e4cdd0cabfdd2e6cd9e255e65f80c9aa7c98dd502b4233d"
+SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
+SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
+SRC_URI[supports-hyperlinks-3.0.0.sha256sum] = "2c0a1e5168041f5f3ff68ff7d95dcb9c8749df29f6e7e89ada40dd4c9de404ee"
+SRC_URI[supports-unicode-3.0.0.sha256sum] = "b7401a30af6cb5818bb64852270bb722533397edcfc7344954a38f420819ece2"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
-SRC_URI[tar-0.4.40.sha256sum] = "b16afcea1f22891c49a00c751c7b63b2233284064f11a200fc624137c51e2ddb"
-SRC_URI[tempfile-3.10.0.sha256sum] = "a365e8cd18e44762ef95d87f284f4b5cd04107fec2ff3052bd6a3e6069669e67"
+SRC_URI[syn-2.0.72.sha256sum] = "dc4b9b9bf2add8093d3f2c0204471e951b2285580335de42f9d2534f3ae7a8af"
+SRC_URI[tar-0.4.41.sha256sum] = "cb797dad5fb5b76fcf519e702f4a589483b5ef06567f160c392832c1f5e44909"
+SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
-SRC_URI[thiserror-1.0.56.sha256sum] = "d54378c645627613241d077a3a79db965db602882668f9136ac42af9ecb730ad"
-SRC_URI[thiserror-impl-1.0.56.sha256sum] = "fa0faa943b50f3db30a20aa7e265dbc66076993efed8463e8de414e5d06d3471"
-SRC_URI[thread_local-1.1.7.sha256sum] = "3fdd6f064ccff2d6567adcb3873ca630700f00b5ad3f060c25b5dcfd9a4ce152"
-SRC_URI[time-0.3.34.sha256sum] = "c8248b6521bb14bc45b4067159b9b6ad792e2d6d754d6c41fb50e29fefe38749"
+SRC_URI[thiserror-1.0.63.sha256sum] = "c0342370b38b6a11b6cc11d6a805569958d54cfa061a29969c3b5ce2ea405724"
+SRC_URI[thiserror-impl-1.0.63.sha256sum] = "a4558b58466b9ad7ca0f102865eccc95938dca1a74a856f2b57b6629050da261"
+SRC_URI[thread_local-1.1.8.sha256sum] = "8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c"
+SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
 SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
-SRC_URI[time-macros-0.2.17.sha256sum] = "7ba3a3ef41e6672a2f0f001392bb5dcd3ff0a9992d618ca761a11c3121547774"
-SRC_URI[tinyvec-1.6.0.sha256sum] = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
+SRC_URI[time-macros-0.2.18.sha256sum] = "3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf"
+SRC_URI[tinyvec-1.8.0.sha256sum] = "445e881f4f6d382d5f27c034e25eb92edd7c784ceab92a0937db7f2e9471b938"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
-SRC_URI[toml-0.8.10.sha256sum] = "9a9aad4a3066010876e8dcf5a8a06e70a558751117a145c6ce2b82c2e2054290"
-SRC_URI[toml_datetime-0.6.5.sha256sum] = "3550f4e9685620ac18a50ed434eb3aec30db8ba93b0287467bca5826ea25baf1"
-SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
-SRC_URI[toml_edit-0.22.4.sha256sum] = "0c9ffdf896f8daaabf9b66ba8e77ea1ed5ed0f72821b398aba62352e95062951"
+SRC_URI[toml-0.8.16.sha256sum] = "81967dd0dd2c1ab0bc3468bd7caecc32b8a4aa47d0c8c695d8c2b2108168d62c"
+SRC_URI[toml_datetime-0.6.7.sha256sum] = "f8fb9f64314842840f1d940ac544da178732128f1c78c21772e876579e0da1db"
+SRC_URI[toml_edit-0.22.17.sha256sum] = "8d9f8729f5aea9562aac1cc0441f5d6de3cff1ee0c5d67293eeca5eb36ee7c16"
 SRC_URI[tracing-0.1.40.sha256sum] = "c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef"
 SRC_URI[tracing-attributes-0.1.27.sha256sum] = "34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7"
+SRC_URI[tracing-chrome-0.7.2.sha256sum] = "bf0a738ed5d6450a9fb96e86a23ad808de2b727fd1394585da5cdd6788ffe724"
 SRC_URI[tracing-core-0.1.32.sha256sum] = "c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54"
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-subscriber-0.3.18.sha256sum] = "ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b"
+SRC_URI[typeid-1.0.0.sha256sum] = "059d83cc991e7a42fc37bd50941885db0888e34209f8cfd9aab07ddec03bc9cf"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
 SRC_URI[unicase-2.7.0.sha256sum] = "f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89"
 SRC_URI[unicode-bidi-0.3.15.sha256sum] = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
 SRC_URI[unicode-bom-2.0.3.sha256sum] = "7eec5d1121208364f6793f7d2e222bf75a915c19557537745b195b253dd64217"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unicode-normalization-0.1.22.sha256sum] = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
-SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85"
+SRC_URI[unicode-normalization-0.1.23.sha256sum] = "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5"
+SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
 SRC_URI[unicode-xid-0.2.4.sha256sum] = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
-SRC_URI[url-2.5.0.sha256sum] = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
-SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[url-2.5.2.sha256sum] = "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c"
+SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
 SRC_URI[valuable-0.1.0.sha256sum] = "830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[walkdir-2.4.0.sha256sum] = "d71d857dc86794ca4c280d616f7da00d2dbfd8cd788846559a6813e6aa4b54ee"
+SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[wasm-bindgen-0.2.91.sha256sum] = "c1e124130aee3fb58c5bdd6b639a0509486b0338acaaae0c84a5124b0f588b7f"
-SRC_URI[wasm-bindgen-backend-0.2.91.sha256sum] = "c9e7e1900c352b609c8488ad12639a311045f40a35491fb69ba8c12f758af70b"
-SRC_URI[wasm-bindgen-macro-0.2.91.sha256sum] = "b30af9e2d358182b5c7449424f017eba305ed32a7010509ede96cdc4696c46ed"
-SRC_URI[wasm-bindgen-macro-support-0.2.91.sha256sum] = "642f325be6301eb8107a83d12a8ac6c1e1c54345a7ef1a9261962dfefda09e66"
-SRC_URI[wasm-bindgen-shared-0.2.91.sha256sum] = "4f186bd2dcf04330886ce82d6f33dd75a7bfcf69ecf5763b89fcde53b6ac9838"
+SRC_URI[wasm-bindgen-0.2.92.sha256sum] = "4be2531df63900aeb2bca0daaaddec08491ee64ceecbee5076636a3b026795a8"
+SRC_URI[wasm-bindgen-backend-0.2.92.sha256sum] = "614d787b966d3989fa7bb98a654e369c762374fd3213d212cfc0251257e747da"
+SRC_URI[wasm-bindgen-macro-0.2.92.sha256sum] = "a1f8823de937b71b9460c0c34e25f3da88250760bec0ebac694b49997550d726"
+SRC_URI[wasm-bindgen-macro-support-0.2.92.sha256sum] = "e94f17b526d0a461a191c78ea52bbce64071ed5c04c9ffe424dcb38f74171bb7"
+SRC_URI[wasm-bindgen-shared-0.2.92.sha256sum] = "af190c94f2773fdb3729c55b007a722abb5384da03bc0986df4c289bf5567e96"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.6.sha256sum] = "f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596"
+SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows-targets-0.52.0.sha256sum] = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_gnu-0.52.0.sha256sum] = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
-SRC_URI[winnow-0.5.39.sha256sum] = "5389a154b01683d28c77f8f68f49dea75f0a4da32557a58f68ee51ebba472d29"
-SRC_URI[zerocopy-0.7.32.sha256sum] = "74d4d3961e53fa4c9a25a8637fc2bfaf2595b3d3ae34875568a5cf64787716be"
-SRC_URI[zerocopy-derive-0.7.32.sha256sum] = "9ce1b18ccd8e73a9321186f97e46f9f04b778851177567b1975109d26a08d2a6"
-SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[winnow-0.6.16.sha256sum] = "b480ae9340fc261e6be3e95a1ba86d54ae3f9171132a73ce8d4bbaf68339507c"
+SRC_URI[zerocopy-0.6.6.sha256sum] = "854e949ac82d619ee9a14c66a1b674ac730422372ccb759ce0c39cabcf2bf8e6"
+SRC_URI[zerocopy-0.7.35.sha256sum] = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
+SRC_URI[zerocopy-derive-0.6.6.sha256sum] = "125139de3f6b9d625c39e2efdd73d41bdac468ccd556556440e322be0e1bbd91"
+SRC_URI[zerocopy-derive-0.7.35.sha256sum] = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
+SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb b/meta/recipes-devtools/rust/cargo-c-native_0.10.3+cargo-0.81.0.bb
similarity index 82%
rename from meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
rename to meta/recipes-devtools/rust/cargo-c-native_0.10.3+cargo-0.81.0.bb
index 8e17606b73d..145e70482a0 100644
--- a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
+++ b/meta/recipes-devtools/rust/cargo-c-native_0.10.3+cargo-0.81.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c"
-SRC_URI[cargo-c.sha256sum] = "ec77e3635cdb0d211f88f22d0460eef0ba031eb616ded57f2ffb98a90365c445"
+SRC_URI[cargo-c.sha256sum] = "99f10fab01de791f95e81134202792e4a6975c3a3921fec2d4cbf3e9c269b709"
 S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
 
 inherit cargo cargo-update-recipe-crates pkgconfig native
-- 
2.39.2


