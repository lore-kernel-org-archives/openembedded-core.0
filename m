Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3820C5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:27:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5785.1785799614273571968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dp8Fd0iq;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so54676055ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 16:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785799614; x=1786404414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PG/8FZBq8Mxl4XFT7eJGMSL2JvdunTTjbsTAmGY5C2A=;
        b=Dp8Fd0iqiZJbYeX8qe4LAPuVxoK9yidhmN35YSXHVpBrQ5iyr6EvAIRRo72zi6hutD
         ZLVF3PWVZySFpMrKM77IVOEVS/4CSc6C/OJHP8qUl87MN9CWtihcZaMD86j0Loe1bhwZ
         Aq72sUoSAuNexRy0M2l+h8F4LVEDAmxjfSD0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799614; x=1786404414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PG/8FZBq8Mxl4XFT7eJGMSL2JvdunTTjbsTAmGY5C2A=;
        b=KL98FXyJBHYIxSClAiiC5JSUdpEb3voagK2zObVu9CioAXV8aS0/BEQDU6z/xA3llV
         bWoYAtNOL6NB9XFnn0c28YB5j1POQaGo7iKdTlqtYyB7BAiDgEfvmQbsWCRR3ewuGnqD
         hJckw+pygl+8tDDNapwRL8qyZeZ/QfH43kOulHa2w+XSFRCVPNuaKwkRtF3xbKmdZ1Vm
         3PlcROMDxxwbw6N887liXh5pzcnhcuUyoJ1XL4cyN5u9CeV0EzMQg5yt2ziXcywbrMWh
         9AXAYgct4mqYzbU8hJT11SyOnO8vBFPJMV/TsCX72GEg8AHr0NG6jyOIUy+Olz5CfGC2
         9EPw==
X-Gm-Message-State: AOJu0YwgQ66FxYgL6dsN6aHfObt0dZCABUlJJFQPmgrcrAkLWxDQQ8RX
	Nh9HsqpYiTpXbTMMw1ySyKCSm8BWYrxhxI7ZbUYHjZrnvy6vfZPC3Koken/aR7UWlsqlQxy8yP6
	3EXfl
X-Gm-Gg: AR+sD13/B01d92EtOrODxGUKWkMHlckRe5SjJkzyNRZ3vNGpMSWXmHenPO3wIR17xcA
	3TyTkqEM4NL+c6DUb+V/deFpvT0iZkCuxQJ2Njv7zsZbkraWl/8eRTzv11cAzULEfX1gC/XUgdr
	gFyWo99mWvVfXh96ublCjdMhOSZ6i3Wp5yeN3v6+ooh8v5jveV10gW42mGMRIyrb2AN8uDgqwBV
	J2MoQz3oZt+n87pTqbmNxnJ+tNFQBA3WOhILRXTSd4BhMXdByRiSJW4KajLrK86w1wRfTNndXMM
	tAkYwU8J0FQVps14dFKIPhrb2altjcEWsNzQ63GHVPNtnU6PzdBtIqRhnfBKFLLvbmOcbMXreCI
	dLRXSDEV9GN//2DkobQAURqzX0YOisyvyGO0zwJa9wXjwC+RfB+fAJ9Hy+8oRQhX6UTw2arc0fb
	OXAV9ltb/cUKHdRll8e4mEa4woQxSnA1CAjyfKYJkBUTfCYSaDfOFPBaq9oPTeDXORWoIkvG5wT
	ceO6w==
X-Received: by 2002:a17:903:3845:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2d0521a57f9mr117440505ad.2.1785799613083;
        Mon, 03 Aug 2026 16:26:53 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6808:583f:6e91:c834])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11f99csm44342545ad.58.2026.08.03.16.26.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:26:52 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-uv-build: upgrade 0.11.32 -> 0.12.1
Date: Mon,  3 Aug 2026 16:26:39 -0700
Message-ID: <f7d70e301a4a149fdf263b87560329d14903bc44.1785799308.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785799308.git.tim.orling@konsulko.com>
References: <cover.1785799308.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 23:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242674

From: Tim Orling <tim.orling@konsulko.com>

No changes to uv-build in git, just tags.

The uv_build package is built from the uv/crates/uv-build
directory.

git log --oneline 0.11.32..0.12.1 crates/uv-build

329541a50 (tag: 0.12.1) Bump version to 0.12.1 (#20867)
43a128899 Bump version to 0.12.0 (#20775)
fece32fc5 (tag: 0.11.33) Bump version to 0.11.33 (#20764)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-uv-build-crates.inc        | 170 ++++++++++--------
 ..._0.11.32.bb => python3-uv-build_0.12.1.bb} |   2 +-
 2 files changed, 95 insertions(+), 77 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.32.bb => python3-uv-build_0.12.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index c0839045bd..3841aa17c8 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -10,7 +10,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.103 \
+    crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.6.3 \
@@ -21,28 +21,30 @@ SRC_URI += " \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.13.0 \
+    crate://crates.io/bitflags/2.13.1 \
     crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/block-buffer/0.12.1 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
     crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.12.1 \
-    crate://crates.io/bzip2/0.5.2 \
-    crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.1 \
-    crate://crates.io/clap_builder/4.6.0 \
-    crate://crates.io/clap_derive/4.6.1 \
+    crate://crates.io/clap/4.6.3 \
+    crate://crates.io/clap_builder/4.6.2 \
+    crate://crates.io/clap_derive/4.6.3 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/console/0.16.4 \
+    crate://crates.io/const-oid/0.10.2 \
     crate://crates.io/cpufeatures/0.2.17 \
+    crate://crates.io/cpufeatures/0.3.0 \
     crate://crates.io/crc32fast/1.5.0 \
     crate://crates.io/crypto-common/0.1.7 \
+    crate://crates.io/crypto-common/0.2.2 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
     crate://crates.io/data-encoding/2.11.0 \
@@ -50,6 +52,7 @@ SRC_URI += " \
     crate://crates.io/defmt-macros/1.1.0 \
     crate://crates.io/defmt-parser/1.0.0 \
     crate://crates.io/digest/0.10.7 \
+    crate://crates.io/digest/0.11.3 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
@@ -62,7 +65,7 @@ SRC_URI += " \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
-    crate://crates.io/fastrand/2.4.1 \
+    crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.9 \
@@ -70,24 +73,26 @@ SRC_URI += " \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.1 \
-    crate://crates.io/futures/0.3.32 \
-    crate://crates.io/futures-channel/0.3.32 \
-    crate://crates.io/futures-core/0.3.32 \
-    crate://crates.io/futures-executor/0.3.32 \
-    crate://crates.io/futures-io/0.3.32 \
+    crate://crates.io/futures/0.3.33 \
+    crate://crates.io/futures-channel/0.3.33 \
+    crate://crates.io/futures-core/0.3.33 \
+    crate://crates.io/futures-executor/0.3.33 \
+    crate://crates.io/futures-io/0.3.33 \
     crate://crates.io/futures-lite/2.6.1 \
-    crate://crates.io/futures-macro/0.3.32 \
-    crate://crates.io/futures-sink/0.3.32 \
-    crate://crates.io/futures-task/0.3.32 \
-    crate://crates.io/futures-util/0.3.32 \
+    crate://crates.io/futures-macro/0.3.33 \
+    crate://crates.io/futures-sink/0.3.33 \
+    crate://crates.io/futures-task/0.3.33 \
+    crate://crates.io/futures-util/0.3.33 \
     crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
-    crate://crates.io/globset/0.4.18 \
+    crate://crates.io/globset/0.4.19 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
+    crate://crates.io/hybrid-array/0.4.13 \
     crate://crates.io/icu_collections/2.1.1 \
     crate://crates.io/icu_locale_core/2.1.1 \
     crate://crates.io/icu_normalizer/2.1.1 \
@@ -103,8 +108,9 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.32 \
-    crate://crates.io/jiff-static/0.2.32 \
+    crate://crates.io/jiff/0.2.34 \
+    crate://crates.io/jiff-core/0.1.0 \
+    crate://crates.io/jiff-static/0.2.34 \
     crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.35 \
@@ -117,7 +123,6 @@ SRC_URI += " \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/memchr/2.8.3 \
@@ -148,19 +153,20 @@ SRC_URI += " \
     crate://crates.io/potential_utf/0.1.4 \
     crate://crates.io/proc-macro-error-attr2/2.0.0 \
     crate://crates.io/proc-macro-error2/2.0.1 \
-    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
-    crate://crates.io/quote/1.0.46 \
+    crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
-    crate://crates.io/ref-cast/1.0.25 \
-    crate://crates.io/ref-cast-impl/1.0.25 \
+    crate://crates.io/ref-cast/1.0.26 \
+    crate://crates.io/ref-cast-impl/1.0.26 \
     crate://crates.io/reflink-copy/0.1.30 \
-    crate://crates.io/regex/1.13.0 \
-    crate://crates.io/regex-automata/0.4.15 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.16 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
     crate://crates.io/rkyv/0.8.17 \
@@ -176,14 +182,15 @@ SRC_URI += " \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
-    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde/1.0.229 \
     crate://crates.io/serde-untagged/0.1.9 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.29.1 \
     crate://crates.io/serde_json/1.0.150 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/sha2/0.10.9 \
+    crate://crates.io/sha2/0.11.0 \
     crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/signal-hook-registry/1.4.8 \
@@ -198,26 +205,27 @@ SRC_URI += " \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.118 \
+    crate://crates.io/syn/3.0.3 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
-    crate://crates.io/thiserror/2.0.18 \
-    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/thiserror/2.0.19 \
+    crate://crates.io/thiserror-impl/2.0.19 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.52.3 \
+    crate://crates.io/tokio/1.53.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.18 \
     crate://crates.io/tokio-util/0.7.18 \
-    crate://crates.io/toml/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.25.12+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
     crate://crates.io/tracing-core/0.1.36 \
@@ -235,12 +243,13 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.5 \
+    crate://crates.io/uuid/1.24.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -270,9 +279,9 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/winnow/1.0.3 \
+    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
-    crate://crates.io/xz2/0.1.7 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
     crate://crates.io/zerofrom/0.1.6 \
@@ -295,7 +304,7 @@ SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.103.sha256sum] = "2a4385e2e34eb35d6b3efe798b9eb88096925d87726c0798709bf56d9ed84af3"
+SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
@@ -306,28 +315,30 @@ SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954e
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
+SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[block-buffer-0.12.1.sha256sum] = "d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c524b99fd2b76d18fdfeb6660aa"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
-SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
-SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
-SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
-SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
+SRC_URI[clap-4.6.3.sha256sum] = "0fb99565819980999fb7b4a1796046a5c949e6d4ff132cf5fadf5a641e20d776"
+SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
+SRC_URI[clap_derive-4.6.3.sha256sum] = "32f2392eae7f16557a3d727ef3a12e57b2b2ca6f98566a5f4fb41ffe305df077"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
+SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
+SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
 SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
+SRC_URI[crypto-common-0.2.2.sha256sum] = "ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
 SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
@@ -335,6 +346,7 @@ SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22
 SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
 SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
@@ -347,7 +359,7 @@ SRC_URI[enumflags2_derive-0.7.12.sha256sum] = "67c78a4d8fdf9953a5c9d458f9efe940f
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
-SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
+SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
@@ -355,24 +367,26 @@ SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cb
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
-SRC_URI[futures-0.3.32.sha256sum] = "8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d"
-SRC_URI[futures-channel-0.3.32.sha256sum] = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
-SRC_URI[futures-core-0.3.32.sha256sum] = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
-SRC_URI[futures-executor-0.3.32.sha256sum] = "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
-SRC_URI[futures-io-0.3.32.sha256sum] = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
+SRC_URI[futures-0.3.33.sha256sum] = "a88cf1f829d945f548cf8fec32c61b1f202b6d93b45848602fc02af4b12ad218"
+SRC_URI[futures-channel-0.3.33.sha256sum] = "262590f4fe6afeb0bc83be1daa64e52657fe185690a958af7f3ad0e92085c5ae"
+SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
+SRC_URI[futures-executor-0.3.33.sha256sum] = "6754879cc9f2c66f88c6e5c35344bb0bdb0708b0352b1201815667c7eabc7458"
+SRC_URI[futures-io-0.3.33.sha256sum] = "4577ecaa3c4f96589d473f679a71b596316f6641bc350038b962a5daf0085d7a"
 SRC_URI[futures-lite-2.6.1.sha256sum] = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
-SRC_URI[futures-macro-0.3.32.sha256sum] = "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
-SRC_URI[futures-sink-0.3.32.sha256sum] = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
-SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
-SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
+SRC_URI[futures-macro-0.3.33.sha256sum] = "2d6d3cde68c518367be28956066ddfef33813991b77a55005a69dae04bf3b10b"
+SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8ca209b4510f7f94242c647e307"
+SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
+SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
-SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
+SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
+SRC_URI[hybrid-array-0.4.13.sha256sum] = "818356c5132c1fede50f837ca96afbe78ff42413047f4abb886217845e1b6c8c"
 SRC_URI[icu_collections-2.1.1.sha256sum] = "4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43"
 SRC_URI[icu_locale_core-2.1.1.sha256sum] = "edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6"
 SRC_URI[icu_normalizer-2.1.1.sha256sum] = "5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599"
@@ -388,8 +402,9 @@ SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.32.sha256sum] = "961d16382652bfdd8c6f68b223b26a8c93e0d475c672f414411db31c6c5c900e"
-SRC_URI[jiff-static-0.2.32.sha256sum] = "d0879bd39df99c4c5e2c6615ccc026391a423dde10532c573e6086eb94a802cc"
+SRC_URI[jiff-0.2.34.sha256sum] = "e184d09547b80eb7e20d141ba2fb1fbac843ca53f4cf1b31210adc4c1adc6e16"
+SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
+SRC_URI[jiff-static-0.2.34.sha256sum] = "323da076b7a6faf914dc677cb05a4b907742ff7375c8322c9e7f5061e5e0e9de"
 SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
@@ -402,7 +417,6 @@ SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a9155
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
-SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
@@ -433,19 +447,20 @@ SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4b
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
 SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
 SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
-SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
-SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
-SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
+SRC_URI[ref-cast-1.0.26.sha256sum] = "216e8f773d7923bcba9ceb86a86c93cabb3903a11872fc3f138c49630e50b96d"
+SRC_URI[ref-cast-impl-1.0.26.sha256sum] = "2c9283685feec7d69af75fb0e858d5e7378f33fe4fc699383b2916ab9273e03c"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
-SRC_URI[regex-1.13.0.sha256sum] = "2a0e75113e14dc5acb068cd0786884f214f1312650a3d36d269f5c4f3cdee8a2"
-SRC_URI[regex-automata-0.4.15.sha256sum] = "1f388202e4b80542a0921078cc23b6333bcf1409c1e3f86404cae4766a6131db"
+SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.16.sha256sum] = "8fcfdb36bda0c880c5931cdc7a2bcdc8ba4556847b9d912bca70bc94708711ad"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
 SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
@@ -461,14 +476,15 @@ SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d8
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
-SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
 SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
-SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
 SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
+SRC_URI[sha2-0.11.0.sha256sum] = "446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[signal-hook-registry-1.4.8.sha256sum] = "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
@@ -483,26 +499,27 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
+SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
-SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
+SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.52.3.sha256sum] = "8fc7f01b389ac15039e4dc9531aa973a135d7a4135281b12d7c1bc79fd57fffe"
+SRC_URI[tokio-1.53.1.sha256sum] = "202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.18.sha256sum] = "32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70"
 SRC_URI[tokio-util-0.7.18.sha256sum] = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
-SRC_URI[toml-1.1.2+spec-1.1.0.sha256sum] = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
+SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_edit-0.25.12+spec-1.1.0.sha256sum] = "d2153edc6955a6c354fad8f5efd38b6a8769bdccf9fe50f8e1329f81b0baa5d7"
+SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] = "6975367e4d2ef766d86af01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
 SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
-SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
+SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 SRC_URI[tracing-core-0.1.36.sha256sum] = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
@@ -520,12 +537,13 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.5.sha256sum] = "ea5fab0d6c3c01ae70085a09cb03d4c7a1d6314e2b3e075392783396d724ca0a"
+SRC_URI[uuid-1.24.0.sha256sum] = "bf3923a6f5c4c6382e0b653c4117f48d631ea17f38ed86e2a828e6f7412f5239"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -555,9 +573,9 @@ SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de3
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
-SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
 SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.32.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.32.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.1.bb
index 037f55e981..ca2061c371 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.32.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "906542262cf0e1f507d3e9bcf0a73afa9c9269daf261fbd5357a541b533b3c72"
+SRC_URI[sha256sum] = "31d2767fb04777b1dc2408b23be9d1ad50ee1f566bfefb7935cbfdd34fead047"
 
 require ${BPN}-crates.inc
 
-- 
2.47.3


