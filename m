Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13CFCD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105037.1781424205519412190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eo6MQABi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso21946095e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424204; x=1782029004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/G+L1n+v9Y+iVpPliQuRKNd+rs4GqEjRSS16V3AH0Tc=;
        b=eo6MQABiDX32N+hagnBc1zhNcN8qEoEdIbxD87UPgvZxQRQ0ZsCoho6k/5ou/YQmX2
         JgVazwRd+v5oRNRjmmGumjJm2yQHQkYXs01kfPOE/a2xAoRJVaDcgn8Zg1dEs4LY9P9a
         m5ICMFzOEGuTIRfexRVe5NMCSA6PtslO5DaZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424204; x=1782029004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/G+L1n+v9Y+iVpPliQuRKNd+rs4GqEjRSS16V3AH0Tc=;
        b=RwFkhF6nLtFl5bbJZFCVayzNaFoG5Enp5YBWEpkByLT/rq+ttEra1dmB/7imz0MTVc
         DuFH+3M4+t9jrrGU/bX24KIO/qnkZjiyooEUF3hzL8ZfcaaeSXe7es1AzwJlVUzc6yg7
         rRhVNi6ky+avafHTLPxvqoA5obxwfpWxW5ajGUYgbguPSZ0VKNHLMpBIziiBg/+4Cu0J
         mDSiu3Ks/IEdk11lmOkBEFqpWaX4Ngz0B/HedCeBEobjfHwCMG4N/Eerl6OoxFaLg7Ek
         flzF6+Le2126wctoeKyis/Dt2wOcOubW1vxbP2AmOqvCfDvvUp1S9wKABLuQWeSD7LkQ
         /WBg==
X-Gm-Message-State: AOJu0YyqnhYwfqqRWm4AT2a8zmd0RFVJkv8tuhsSq4PagyQJA0AG0Nx/
	EBo4Eh5MSkm2aSxZYy7Th7lIXoE/OrOTQiML63Ak9eRS7ykRA/vJjr8sEJAfGPb2b0SMTo/WNgp
	gDzA4
X-Gm-Gg: Acq92OEZjdRYesBK0UaamwyOBWzxkIkX+GR3DTfAmP0n49TcBrhnax0/KhLsfSU1Caj
	ATEbPoCerMcFSTP0tnqPetYvKShImkfv7S3bm3G71FvAWUkILZGZG5i7CBNDxWL3nMC1B7CuiY0
	VYim9w/ZXG7uhTlyM+0oxNmKmLEn5L8+vbmXENaxR9d7gymhkbOdFx8p08yEJdAawDlKEqNL5Iq
	pOsm3i83VixFzSMHY9BgtbPKtb9rQzBkzCcgbaWtMCot4dQoNOAC9TOO8s7+nMdeZO3JE7DIrU4
	TcNy3Wnku6l6lpwt7cSDJ/YGOHPBbkkA55WuPP1cDogsMH/enDiAKEzyWEMptqa7HOloFTCFj3q
	B3SgnI09BCmeeHBOfSbC5VfWrOs2dmF5IcRUeLUr8t78Nl/g2oL74kVueRILjnZhy3hHXTL2v1I
	UsaBOz209Awo8R8cEu8hIRPH3xcVDGI1abO92y9gQxvgY9gVqge9WN
X-Received: by 2002:a05:600c:34c9:b0:492:1e50:978d with SMTP id 5b1f17b1804b1-492200838bemr74492185e9.16.1781424203565;
        Sun, 14 Jun 2026 01:03:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/56] python3-uv-build: upgrade 0.11.17 -> 0.11.21
Date: Sun, 14 Jun 2026 09:02:20 +0100
Message-ID: <20260614080307.4017177-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238693

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc        | 60 +++++++------------
 ...0.11.17.bb => python3-uv-build_0.11.21.bb} |  2 +-
 2 files changed, 21 insertions(+), 41 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.17.bb => python3-uv-build_0.11.21.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 6c4d4ac473c..be201156688 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -15,7 +15,7 @@ SRC_URI += " \
     crate://crates.io/arrayvec/0.7.6 \
     crate://crates.io/astral-tokio-tar/0.6.2 \
     crate://crates.io/astral-version-ranges/0.1.4 \
-    crate://crates.io/astral_async_zip/0.0.18-rc4 \
+    crate://crates.io/astral_async_zip/0.0.18 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
@@ -49,7 +49,7 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.15.0 \
+    crate://crates.io/either/1.16.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.7 \
@@ -102,8 +102,8 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.24 \
-    crate://crates.io/jiff-static/0.2.24 \
+    crate://crates.io/jiff/0.2.28 \
+    crate://crates.io/jiff-static/0.2.28 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -111,7 +111,7 @@ SRC_URI += " \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.183 \
+    crate://crates.io/libc/0.2.186 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -119,7 +119,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.0 \
+    crate://crates.io/memchr/2.8.1 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -179,7 +179,7 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.149 \
+    crate://crates.io/serde_json/1.0.150 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sharded-slab/0.1.7 \
@@ -198,7 +198,7 @@ SRC_URI += " \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
-    crate://crates.io/terminal_size/0.4.3 \
+    crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
     crate://crates.io/thiserror/2.0.18 \
     crate://crates.io/thiserror-impl/2.0.18 \
@@ -212,7 +212,7 @@ SRC_URI += " \
     crate://crates.io/tokio-util/0.7.18 \
     crate://crates.io/toml/1.1.2+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.25.11+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.12+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
@@ -233,7 +233,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.1 \
+    crate://crates.io/uuid/1.23.2 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/walkdir/2.5.0 \
@@ -261,27 +261,17 @@ SRC_URI += " \
     crate://crates.io/windows-result/0.3.4 \
     crate://crates.io/windows-strings/0.4.2 \
     crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows-threading/0.1.0 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.53.1 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.53.1 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.53.1 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.53.1 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.53.1 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/wit-bindgen/0.51.0 \
     crate://crates.io/wit-bindgen-core/0.51.0 \
@@ -319,7 +309,7 @@ SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b45
 SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
 SRC_URI[astral-tokio-tar-0.6.2.sha256sum] = "cb50a7aae84a03bf55b067832bc376f4961b790c97e64d3eacee97d389b90277"
 SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
-SRC_URI[astral_async_zip-0.0.18-rc4.sha256sum] = "9d523231a4339307c7699aa5d9492fe6873906afefc9d7853b5e7ffbfee3c7f1"
+SRC_URI[astral_async_zip-0.0.18.sha256sum] = "c15fc5b591f19dfbbbce736615908d74f1d9252bb34b231873cb995f2a997ffb"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
@@ -353,7 +343,7 @@ SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff424
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
+SRC_URI[either-1.16.0.sha256sum] = "91622ff5e7162018101f2fea40d6ebf4a78bbe5a49736a2020649edf9693679e"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.7.sha256sum] = "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
@@ -406,8 +396,8 @@ SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
-SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
+SRC_URI[jiff-0.2.28.sha256sum] = "4603d3033e49e2b0e31229fcab20a5d40089c607d975cd9c80551dc69eed9102"
+SRC_URI[jiff-static-0.2.28.sha256sum] = "782d32378dddf207193ac91cefb848ad41abb58195c95168e1291227a0832b47"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -415,7 +405,7 @@ SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146e
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -423,7 +413,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
+SRC_URI[memchr-2.8.1.sha256sum] = "6b947ae49db0d222b1dbc6b113ce7248a3fc3a6ca21b696717bfc000ba4484d8"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -483,7 +473,7 @@ SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776e
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
+SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
@@ -502,7 +492,7 @@ SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c5852
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
-SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
+SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
 SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
 SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
@@ -516,7 +506,7 @@ SRC_URI[tokio-stream-0.1.18.sha256sum] = "32da49809aab5c3bc678af03902d4ccddea2a8
 SRC_URI[tokio-util-0.7.18.sha256sum] = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
 SRC_URI[toml-1.1.2+spec-1.1.0.sha256sum] = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_edit-0.25.11+spec-1.1.0.sha256sum] = "0b59c4d22ed448339746c59b905d24568fcbb3ab65a500494f7b8c3e97739f2b"
+SRC_URI[toml_edit-0.25.12+spec-1.1.0.sha256sum] = "d2153edc6955a6c354fad8f5efd38b6a8769bdccf9fe50f8e1329f81b0baa5d7"
 SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
 SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
@@ -537,7 +527,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.1.sha256sum] = "ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76"
+SRC_URI[uuid-1.23.2.sha256sum] = "d258b83ceec21034727ecee8c382cfa6c3e133699b0742c64571814fb420c9f7"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
@@ -565,27 +555,17 @@ SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
 SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.17.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.17.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
index 4241f665865..4ee2fdbaa70 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.17.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "98fd71027ba123126ef586b681efece5f6e71b05c3ea58c27866853bba1966b9"
+SRC_URI[sha256sum] = "d512911d357f71dd7c1be43503ee66ebaba9a8d207998bbea77581e95aadabe6"
 
 require ${BPN}-crates.inc
 

