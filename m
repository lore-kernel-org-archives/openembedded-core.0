Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E03C44501
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88756.1783067412268688584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=drgas9Km;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so2762305e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067410; x=1783672210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LmcLre6VGMNB2M1Q5sMIP8ygGlKhcKur+issR0H7IE=;
        b=drgas9Km8tQnjxck+EkF4QPSUX6RUlKOIgnkSLMT8Ge0sXym0rfqe/w4IvCfT2Zx6B
         PD9kGvNZwn+izydSR+zcQsQBQSN9tCRKgRVtmQgnJF5gkMgMPvxwROYg29i5qBdwjjlT
         8sSufx9eip6nd1vfTy+sY/31tuwNLX4hkn+Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067410; x=1783672210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LmcLre6VGMNB2M1Q5sMIP8ygGlKhcKur+issR0H7IE=;
        b=E6a8iRpi4/XT9ahGErwx3qdtXaK1dhNus95r9p4XfkLoKQrmroctRbZUZxg1k/1UWR
         0o3wpfa4+PSnm0zqYPZiDusNk4QSQvFhamuX5w+hyUC/6NkbPjWIXtdp9EPQ8d1y1ksa
         G7F5s0scUAfpR30O6pj95yi7/Co9qClBxn7oDdltsqzcVBkLpF3ANHl3oEP/I1ux8g24
         vAcg+xNNqGuHwvV3WGpC0FAUs7Cj6hCgN69pqP4fSXHAEM1c3yU0v5057ksZx/Iq8cho
         yqS9887nlEdgQ1VdGu5LV+L9IrtXhCnvvURp9EdAPSqK2YJ4NtmNUYXyWsl5vTTkQWpd
         4Kfw==
X-Gm-Message-State: AOJu0YyxCZYAsy6TFIzOY0k4/a7ADcNpODCfX6fj0beBLZ/nKTbvwHm6
	Gw7F2YqnziDxi6++cMTxRxaRyLQxvm2t5Z0BL/tqep+OjM8NWmfuY2mYuPkgAhQOEkF5Ss6K6BC
	q72d8fOc=
X-Gm-Gg: AfdE7cnkaoVb9dWGiYC+KuNziJ2eW9zVPHZEM/pVr3jWJIxz0vN/oKYvovwaa6CiVbX
	XeSq9ITzFt0gyQeH17Zt76lw1btLbN77jAY/Z5/t3MWU2F6glPT1v33GQa3BXZ3liAAZqO7OsNG
	Vd77ev6virsYJhhgfhuCiW3LK/3jMr05U0ZKhyIo5COpSBNJGaulZVtiaUfKEJMs2DQzJ/qAU9W
	+DFnwlpESQGHRETCu5rXiotG8toWN8VywTbeNmLBxwS+a2baHmcykUZIdwvh5XJGmM6SHGfZA9z
	lNQg/PfJnqkV4LxoUKY8p9uw9QNtS04/ZB83ci0QNP2vpaGvmv26ALGK6g72XB0kezb+dQ1/W2C
	ldyi3KE1Pxe11avBgivcHNLOnxjVFVD5xBkXCmn7idgAHJyhrdIG2qeedcmLafK+O5YQHHWA/p/
	CgYIUmzh9TQulOUO4spL4PKVP3JJp5Y/LGpaJDHLqZbQ==
X-Received: by 2002:a05:600c:1893:b0:493:bda2:543c with SMTP id 5b1f17b1804b1-493c3cdc9a9mr79175455e9.14.1783067409956;
        Fri, 03 Jul 2026 01:30:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/15] python3-uv-build: upgrade 0.11.21 -> 0.11.26
Date: Fri,  3 Jul 2026 09:29:52 +0100
Message-ID: <20260703082955.1585712-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240094

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc        | 82 +++++++++++--------
 ...0.11.21.bb => python3-uv-build_0.11.26.bb} |  2 +-
 2 files changed, 51 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.21.bb => python3-uv-build_0.11.26.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index be201156688..5f8b1b11834 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -12,22 +12,23 @@ SRC_URI += " \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/arcstr/1.2.0 \
-    crate://crates.io/arrayvec/0.7.6 \
-    crate://crates.io/astral-tokio-tar/0.6.2 \
-    crate://crates.io/astral-version-ranges/0.1.4 \
+    crate://crates.io/arrayvec/0.7.7 \
+    crate://crates.io/astral-tokio-tar/0.6.3 \
+    crate://crates.io/astral-version-ranges/0.2.0 \
     crate://crates.io/astral_async_zip/0.0.18 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.11.1 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.13.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
     crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
-    crate://crates.io/bytes/1.11.1 \
+    crate://crates.io/bytes/1.12.0 \
     crate://crates.io/bzip2/0.5.2 \
     crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/cc/1.2.57 \
@@ -45,6 +46,9 @@ SRC_URI += " \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
     crate://crates.io/data-encoding/2.11.0 \
+    crate://crates.io/defmt/1.1.0 \
+    crate://crates.io/defmt-macros/1.1.0 \
+    crate://crates.io/defmt-parser/1.0.0 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
@@ -59,7 +63,6 @@ SRC_URI += " \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.4.1 \
-    crate://crates.io/filetime/0.2.29 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.9 \
@@ -98,12 +101,12 @@ SRC_URI += " \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/insta/1.47.2 \
+    crate://crates.io/insta/1.48.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.28 \
-    crate://crates.io/jiff-static/0.2.28 \
+    crate://crates.io/jiff/0.2.29 \
+    crate://crates.io/jiff-static/0.2.29 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -112,6 +115,7 @@ SRC_URI += " \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.186 \
+    crate://crates.io/linux-raw-sys/0.4.15 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -119,7 +123,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.1 \
+    crate://crates.io/memchr/2.8.2 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -146,6 +150,8 @@ SRC_URI += " \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
     crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro-error-attr2/2.0.0 \
+    crate://crates.io/proc-macro-error2/2.0.1 \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
@@ -156,14 +162,15 @@ SRC_URI += " \
     crate://crates.io/redox_syscall/0.5.15 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
-    crate://crates.io/reflink-copy/0.1.29 \
-    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/reflink-copy/0.1.30 \
+    crate://crates.io/regex/1.12.4 \
     crate://crates.io/regex-automata/0.4.14 \
-    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
     crate://crates.io/rkyv/0.8.16 \
     crate://crates.io/rkyv_derive/0.8.16 \
     crate://crates.io/rustc-hash/2.1.2 \
+    crate://crates.io/rustix/0.38.44 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
@@ -189,12 +196,13 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/spdx/0.13.4 \
     crate://crates.io/stable_deref_trait/1.2.1 \
+    crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/2.0.118 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
@@ -233,9 +241,10 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.2 \
+    crate://crates.io/uuid/1.23.3 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.14.7+wasi-0.2.4 \
@@ -306,22 +315,23 @@ SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db416
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
-SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
-SRC_URI[astral-tokio-tar-0.6.2.sha256sum] = "cb50a7aae84a03bf55b067832bc376f4961b790c97e64d3eacee97d389b90277"
-SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
+SRC_URI[arrayvec-0.7.7.sha256sum] = "f02882884d3e1bc524fb12c79f107f6ad0e1cfd498c536ffb494301740995dfe"
+SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
+SRC_URI[astral-version-ranges-0.2.0.sha256sum] = "086f936efdefab117f5a72367fb3d68c4fded8ba5a7008e3c63365eecf723822"
 SRC_URI[astral_async_zip-0.0.18.sha256sum] = "c15fc5b591f19dfbbbce736615908d74f1d9252bb34b231873cb995f2a997ffb"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
-SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
+SRC_URI[bytes-1.12.0.sha256sum] = "8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593"
 SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
 SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
@@ -339,6 +349,9 @@ SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abe
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
 SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
+SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
+SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
+SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
@@ -353,7 +366,6 @@ SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
-SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
@@ -392,12 +404,12 @@ SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8efa867b6895af7e094e"
+SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.28.sha256sum] = "4603d3033e49e2b0e31229fcab20a5d40089c607d975cd9c80551dc69eed9102"
-SRC_URI[jiff-static-0.2.28.sha256sum] = "782d32378dddf207193ac91cefb848ad41abb58195c95168e1291227a0832b47"
+SRC_URI[jiff-0.2.29.sha256sum] = "34f877a98676d2fb664698d74cc6a51ce6c484ce8c770f05d0108ec9090aeb46"
+SRC_URI[jiff-static-0.2.29.sha256sum] = "0666b5ab5ecaca213fc2a85b8c0083d9004e84ee2d5f9a7e0017aaf50986f25f"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -406,6 +418,7 @@ SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -413,7 +426,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.1.sha256sum] = "6b947ae49db0d222b1dbc6b113ce7248a3fc3a6ca21b696717bfc000ba4484d8"
+SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -440,6 +453,8 @@ SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
 SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
+SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
@@ -450,14 +465,15 @@ SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
-SRC_URI[reflink-copy-0.1.29.sha256sum] = "13362233b147e57674c37b802d216b7c5e3dcccbed8967c84f0d8d223868ae27"
-SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
+SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
-SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
 SRC_URI[rkyv-0.8.16.sha256sum] = "73389e0c99e664f919275ab5b5b0471391fe9a8de61e1dff9b1eaf56a90f16e3"
 SRC_URI[rkyv_derive-0.8.16.sha256sum] = "5d2ed0b54125315fb36bd021e82d314d1c126548f871634b483f46b31d13cac6"
 SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
+SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
@@ -483,12 +499,13 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[spdx-0.13.4.sha256sum] = "a8da593e30beb790fc9424502eb898320b44e5eb30367dbda1c1edde8e2f32d7"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
+SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
@@ -527,9 +544,10 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.2.sha256sum] = "d258b83ceec21034727ecee8c382cfa6c3e133699b0742c64571814fb420c9f7"
+SRC_URI[uuid-1.23.3.sha256sum] = "144d6b123cef80b301b8f72a9e2ca4370ddec21950d0a103dd22c437006d2db7"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasi-0.14.7+wasi-0.2.4.sha256sum] = "883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
index 4ee2fdbaa70..5256edaeae3 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "d512911d357f71dd7c1be43503ee66ebaba9a8d207998bbea77581e95aadabe6"
+SRC_URI[sha256sum] = "4ec58a93d29967a07b8de466b7fe35e0e0cb0ca2bcab8b61d80403b5a9b7a34b"
 
 require ${BPN}-crates.inc
 

