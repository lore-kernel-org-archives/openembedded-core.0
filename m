Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48B5C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 10:35:00 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10814.1789036492312858521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 03:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NyugK5pc;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so11505025e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 03:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789036490; x=1789641290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JWvHlxiVRNVx28Ct09K/PwDwsLYzCxxvwICnlrfBlFQ=;
        b=NyugK5pcH+98Gv+cHn1DPY1MFPSY1nNbXQJrRmSgXEvz86QzhIyGmHWWgazclK8YU5
         uKAASaEmZtvmZKkp/6Q8dJd+rLZV3RaNx01ioupmITnK9PRtfxWCf41AyhXqfXdIhnl5
         ssJPv3x+rVBy+WCRz2W2b3sTZbnZJaz8rTaPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036490; x=1789641290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JWvHlxiVRNVx28Ct09K/PwDwsLYzCxxvwICnlrfBlFQ=;
        b=aoDmjHiMHO15GD1NVSf+JcUjKQuTxmRUWcPqbapNMNQPJe1IKphU3YBsRy1zbQr+9T
         Mz9AdLrfwjIiFt8rrtAmkVNcbQZLKfF6cJ2hbfbFqoeDN7V86oHXzm4WrN2ReL2wALlt
         LX5ylPnrW9N+5ezcoc1CqOis8QzoM8ireR/8wwiUgka/kWCWtfXHAzvksdfw72gBCdNU
         MU9+7B9GngTRYbdy8aGgK6sQ6c5TrMS3tHl9WefFAxAiZPrw9XgAVCJju5myLUd32YVm
         3mTMw/mSukSY3DpOrddiRJQcHDaqcunZEm4h7DsgQiELI0QVCFEGOmvfAwEzxSKyWNK9
         d/Lw==
X-Gm-Message-State: AFuF++lPhOqrg0RfBkKm2vj8ZqMYE+LHY944fZOxz2hBhR9fx/Qk0RgM
	TFDM6YHP6xSZ8SMI+3xmmZ6l0EQDL2iUke8M8WiRjaU34RS/8J9BQwdZvUhx+F1ecSuyMYfu2RW
	XhDWBDyA=
X-Gm-Gg: AYBFou3kPrCoCGin5K7u/4oD+f8hLCyAJ9ofhf223FWpN0FU2WhWI8oQTTREamAh0vC
	InlTI+J7+xCidTu/czJHj140M2CnLEAigDnvYGPdcTux+FSjhysmpPJsOwS28QFR8vtK33bqzYE
	20sWVGL23BfiLnjpsTF0/z/PKBqQPA7Z2CDJ6Gy1d5aJz2WeaY/62+43N169tmov8wcPBHtZdp3
	zO2z8X2EHHoy3svoCVDUWRk38wLjt3hnzOhsvtB2DFzdGl0Bepr9f+LPwB8GMy7lEJWa9un1g3I
	EtJVcBhH1h7NltyVmpIOaVVy53NPLr9YciGXO7kNaaZYgCHCCmI91bJxbz56OqENH+o3eprSx/p
	iYTT6DUbgkfYw/MTy/gQmQ2pSDu60+t7kCq/jRHacUDyFyr6Vvq2K0mQmgJy6yZD8UcGQjHEUD4
	5ScXTz3cxFRUebq/5uvsxQsBvSguZHmJz2EWdMpxT+Q1srcPTSrSA1PMp4KpUTmQp74b0GgQxKf
	vEQmJATsYERAtiMk998XM+9KyeP
X-Received: by 2002:a05:600c:698c:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49d1f35366fmr248296715e9.10.1789036490216;
        Thu, 10 Sep 2026 03:34:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm57395075e9.9.2026.09.10.03.34.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:34:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] python3-uv-build: upgrade 0.12.10 -> 0.12.12
Date: Thu, 10 Sep 2026 11:34:43 +0100
Message-ID: <20260910103444.1413539-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
References: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 10:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245547

0.12.12:

Bug fixes

    Exclude distributions uploaded after the exclude-newer cutoff from lockfiles and generated requirement hashes

0.12.11:

Preview features

    Generate missing artifact hashes when exporting pylock.toml files to ensure they conform to PEP 751 (#20146)
    Warn when pylock.toml artifact hash tables are empty, which will be rejected in a future uv release (#21462)

Performance

    Speed up installs that overwrite existing files by eliminating per-file temporary directories for atomic hard-link, symlink, and reflink replacements (#21478)
    Speed up installs that merge copied wheels into existing environments by replacing per-file temporary directories with adjacent temporary files (#21468)
    Speed up local wheel installs by replacing the shared ZIP cursor lock with positioned reads (#21500)
    Speed up local wheel installs by reusing ZIP readers and buffers across extracted files (#21499)
    Avoid transitive dependency checks and unnecessary resolution when uv pip install --no-deps finds the requested packages already installed (#21523)

Bug fixes

    Verify source archives against hashes recorded in uv.lock before reading their metadata or running their build backends (#21223)
    Verify supplied hashes for registry requirements pinned with === under both --verify-hashes and --require-hashes (#21543)
    Apply hashes from public-version pins to matching local versions when no exact local-version hash is provided (#21544)
    Support PowerShell virtual environment activation from UNC paths, including WSL paths (#19159)
    Trim surrounding whitespace from entries in .python-version and .python-versions files (#21529)
    Suppress VIRTUAL_ENV mismatch warnings for uv add --no-sync, uv remove --no-sync, and uv add --frozen (#21496)
    Warn and continue when uv python list cannot query an interpreter (#21498)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc        | 52 +++++++++++--------
 ...0.12.10.bb => python3-uv-build_0.12.12.bb} |  2 +-
 2 files changed, 31 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.10.bb => python3-uv-build_0.12.12.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 13c4af5dbc7..02e8f9a8abe 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -29,16 +29,16 @@ SRC_URI += " \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
     crate://crates.io/bumpalo/3.20.2 \
-    crate://crates.io/bytecheck/0.8.2 \
-    crate://crates.io/bytecheck_derive/0.8.2 \
+    crate://crates.io/bytecheck/0.8.3 \
+    crate://crates.io/bytecheck_derive/0.8.3 \
     crate://crates.io/bytes/1.12.1 \
     crate://crates.io/cap-primitives/4.0.3 \
     crate://crates.io/cap-std/4.0.3 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.5 \
-    crate://crates.io/clap_builder/4.6.5 \
+    crate://crates.io/clap/4.6.6 \
+    crate://crates.io/clap_builder/4.6.6 \
     crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
@@ -51,7 +51,7 @@ SRC_URI += " \
     crate://crates.io/crypto-common/0.2.2 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
-    crate://crates.io/data-encoding/2.11.0 \
+    crate://crates.io/data-encoding/2.11.1 \
     crate://crates.io/defmt/1.1.0 \
     crate://crates.io/defmt-macros/1.1.0 \
     crate://crates.io/defmt-parser/1.0.0 \
@@ -63,7 +63,7 @@ SRC_URI += " \
     crate://crates.io/either/1.17.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
-    crate://crates.io/encoding_rs_io/0.1.7 \
+    crate://crates.io/encoding_rs_io/0.1.8 \
     crate://crates.io/enumflags2/0.7.12 \
     crate://crates.io/enumflags2_derive/0.7.12 \
     crate://crates.io/equivalent/1.0.2 \
@@ -89,8 +89,9 @@ SRC_URI += " \
     crate://crates.io/futures-task/0.3.33 \
     crate://crates.io/futures-util/0.3.33 \
     crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
-    crate://crates.io/globset/0.4.19 \
+    crate://crates.io/globset/0.4.20 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.17.1 \
@@ -166,6 +167,7 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -173,11 +175,11 @@ SRC_URI += " \
     crate://crates.io/ref-cast-impl/1.0.26 \
     crate://crates.io/reflink-copy/0.1.30 \
     crate://crates.io/regex/1.13.1 \
-    crate://crates.io/regex-automata/0.4.16 \
+    crate://crates.io/regex-automata/0.4.18 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
-    crate://crates.io/rkyv/0.8.17 \
-    crate://crates.io/rkyv_derive/0.8.17 \
+    crate://crates.io/rkyv/0.8.18 \
+    crate://crates.io/rkyv_derive/0.8.18 \
     crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustix-linux-procfs/0.1.1 \
@@ -207,7 +209,7 @@ SRC_URI += " \
     crate://crates.io/slab/0.4.12 \
     crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
-    crate://crates.io/spdx/0.13.4 \
+    crate://crates.io/spdx/0.13.5 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
@@ -258,6 +260,7 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -298,6 +301,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/winx/0.36.4 \
+    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
@@ -343,16 +347,16 @@ SRC_URI[block-buffer-0.12.1.sha256sum] = "d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
-SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
-SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
+SRC_URI[bytecheck-0.8.3.sha256sum] = "26333eeac754f0ad8a6bcd0eb0ac012156302e4e16b852b72ee399aea4f12c29"
+SRC_URI[bytecheck_derive-0.8.3.sha256sum] = "46d07918caa9eeaaf06b7873925c53a61daac173539b4f7715090745e44e4e69"
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
 SRC_URI[cap-primitives-4.0.3.sha256sum] = "8b5f74729fd2f44701d1a8eb47e906cdb3ccd9ec0f02baad85a744b791940b18"
 SRC_URI[cap-std-4.0.3.sha256sum] = "c1ec78e242cfa2cfe276807ac2ecc00315a6c97786977414bcd1c3963b6c91b8"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
-SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
+SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
+SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
 SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
@@ -365,7 +369,7 @@ SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abe
 SRC_URI[crypto-common-0.2.2.sha256sum] = "ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
-SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
+SRC_URI[data-encoding-2.11.1.sha256sum] = "4583a4551df46e2792f82ceeac45e850d2e2d5debba0b91f102385cda5b11f06"
 SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
 SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
 SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
@@ -377,7 +381,7 @@ SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fb
 SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
-SRC_URI[encoding_rs_io-0.1.7.sha256sum] = "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
+SRC_URI[encoding_rs_io-0.1.8.sha256sum] = "fba3fe847045ecff794b9c138293a80db914678c453ad63fbf0c6a9eb6e00b22"
 SRC_URI[enumflags2-0.7.12.sha256sum] = "1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef"
 SRC_URI[enumflags2_derive-0.7.12.sha256sum] = "67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
@@ -403,8 +407,9 @@ SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8
 SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
 SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
-SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
+SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
@@ -480,6 +485,7 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
@@ -487,11 +493,11 @@ SRC_URI[ref-cast-1.0.26.sha256sum] = "216e8f773d7923bcba9ceb86a86c93cabb3903a118
 SRC_URI[ref-cast-impl-1.0.26.sha256sum] = "2c9283685feec7d69af75fb0e858d5e7378f33fe4fc699383b2916ab9273e03c"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
 SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
-SRC_URI[regex-automata-0.4.16.sha256sum] = "8fcfdb36bda0c880c5931cdc7a2bcdc8ba4556847b9d912bca70bc94708711ad"
+SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
-SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
-SRC_URI[rkyv_derive-0.8.17.sha256sum] = "c0ed1a78a1b19d184b0daa629dd9a024573173ec7d485b287cb369fb3607cc1c"
+SRC_URI[rkyv-0.8.18.sha256sum] = "d9776093b7ca170454ab1406954f7b7d97a57c51dc6c0642957fb2ef25c2d399"
+SRC_URI[rkyv_derive-0.8.18.sha256sum] = "1c25ef604ac7dd839d44d64648952ea23c97866f124ff671b0ed2cf3ad9bb06e"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] = "2fc84bf7e9aa16c4f2c758f27412dc9841341e16aa682d9c7ac308fe3ee12056"
@@ -521,7 +527,7 @@ SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d16208
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
-SRC_URI[spdx-0.13.4.sha256sum] = "a8da593e30beb790fc9424502eb898320b44e5eb30367dbda1c1edde8e2f32d7"
+SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
@@ -572,6 +578,7 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -612,6 +619,7 @@ SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
index 12cf5c7cc33..f75eab5ee8d 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "c83c0f1dd2c921091d1974f56d64221c010e173d9e6d52ec2a2582650c2d5197"
+SRC_URI[sha256sum] = "cbcfa5191898d5ca277faebdc6ca612dd4afb1fad25cd7948f43484a8da022c3"
 
 require ${BPN}-crates.inc
 

