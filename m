Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18312CD4F3C
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 02:37:35 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26838.1778812648754718672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 19:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rU7DOHcK;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1332772f6b3so7903899c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778812648; x=1779417448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtpIQ8dyQux7SVPKrJrSlBq9/WW3zXM06w0PAf+h9IE=;
        b=rU7DOHcKn5Io4WOXA3ROQzibGxsTdZbTFpHZ2g0lsJUZZK//erBkVrY6iSfFaeIJq+
         IT1ef/s0RyOY8vHdK93UGohbc6dNXzLRwF2zvzurvFgHAOh7dLNVrjLzcFgjWkPqunGf
         m5j9cTa3ByFa7MuuT2O3OVnC5ojI5qFnxvaA6EWLB7cbDAU4XV33gyaoLEaQBfpa1PYU
         In9iK2NZvjtMr+JSLIv9Do3GjIPZTCOtGFFnics+lYM5ajzOA5AhVq2lhfoqrP6A50iC
         IJNS3oSsbJKTwLvRJ0F6uuw3f1aMNaSfrly+bOA/Ul9f5rfA11xe/FfiYelu5fHKAGW1
         KxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778812648; x=1779417448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtpIQ8dyQux7SVPKrJrSlBq9/WW3zXM06w0PAf+h9IE=;
        b=Rdr/BdTbRgiBLUwVAAjxqqGglvCn5CHPxHUVDrVOdAqMJYa9Llp65oitWk2LtCgeZy
         5UWOHrnGMHCHxsZnOeVDXLuOgf5WEFW04nj05l7xwFKuqhHRyvtbTmZR11wLm1Jh9vzU
         9/IH+PpIsiluRBIcxq1lZUnzFeLVT/Ef+zR58HTmOnTsLaIOC1MQ7hEguCmsdlpB27Ag
         nwPOGrgwahlMec7efpOxACMPSw75G2Udor46VrwJzGQnYSz1pA9wPvtqBwmPrJpr7uH5
         He3QU3eIfPVa/VqfWamrVztq2WuKfeKlVQv9W0e6wXLKVTTwQreekfVijfT+goRmt8lI
         Ls4Q==
X-Gm-Message-State: AOJu0Yy2r+RK/ILemAGgUTZilnZmp8pgIU285sQu6HgYTKZz+4w95V/B
	6KFO+UiFzaMJ7MOLqp3UJBZBafVg0SJLtnaIAgXCbmdO4Re1YmyAi4sNmCYJRn77gx8=
X-Gm-Gg: Acq92OHdiuZkhu8Q40UmdX6AFEDjorTStphcmVt1Mp879SlbKU2XdcftcbBUnzAdH+Q
	J+h41NHNsAILXQTTAjZrwuqxWv+MFh8sQiYTiznMdGcV/3138dYE23wUOL9jKFzyFxJYYqatyYh
	If2ug1Emx3I2VpoTqCoERqnI2CAozoNljoXHoasCe/xbPv3aa4PXsaqw0ULsyUYH7tBhzY5LUIz
	yfyYHjFr7xSzrvnOtwdvjC1PrIuJxyTdMKGXcqG/u4LyYhIcFj5tGXGpwob0Re7+MENad2QutQM
	D5yp7y7SeFea++nFo7gEvycCiVo3sIVSjaBz0+YSnG/DazCAa+cy4OV2IZwvrXVn1ZRnA4FkLjz
	fr+ZvDBG32YJ+/NUtBBRPVpRD/XKFg4mxbAAsmClyE/ameoUEKGaWL5V/pDhzYxpKjTufC7Njg6
	MGBtiJ0Y8T0AOxiH4101zHqfJDZeu14OO499Ai0z7HTE2jMLp0Px+gIGkVy8hHskNledg1fcKgt
	L6K+pDns4C2q7WckOmFOZjg7d9lOkPYdQpRcU7MuZo47Cm7zdOptnModGhaVG5sIojrORElhR6H
	38v1lHHVkm/x/9pVjcFR0yW2IsHFv9GY1ghBasJC
X-Received: by 2002:a05:7022:619f:b0:132:2486:b47 with SMTP id a92af1059eb24-1350430e63fmr839956c88.3.1778812647586;
        Thu, 14 May 2026 19:37:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm7034405c88.2.2026.05.14.19.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 19:37:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] python3-uv-build: Update python3-uv-build from 0.11.8 to 0.11.14
Date: Thu, 14 May 2026 19:37:24 -0700
Message-ID: <20260515023724.1380806-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 02:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237062

Notable fixes
- packaging-related changes include fixing editable builds to include data files
- improved lock/build option handling
- cache compatibility fixes
- Python discovery/runtime updates.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-uv-build-crates.inc        | 64 +++++++------------
 ..._0.11.8.bb => python3-uv-build_0.11.14.bb} |  2 +-
 2 files changed, 23 insertions(+), 43 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.8.bb => python3-uv-build_0.11.14.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 218fe61b83..28706b0a3a 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -12,11 +12,12 @@ SRC_URI += " \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/arcstr/1.2.0 \
+    crate://crates.io/arrayvec/0.7.6 \
     crate://crates.io/astral-version-ranges/0.1.4 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.11.0 \
+    crate://crates.io/bitflags/2.11.1 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
@@ -28,9 +29,9 @@ SRC_URI += " \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.0 \
+    crate://crates.io/clap/4.6.1 \
     crate://crates.io/clap_builder/4.6.0 \
-    crate://crates.io/clap_derive/4.6.0 \
+    crate://crates.io/clap_derive/4.6.1 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/console/0.16.3 \
@@ -39,7 +40,7 @@ SRC_URI += " \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
-    crate://crates.io/data-encoding/2.10.0 \
+    crate://crates.io/data-encoding/2.11.0 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
@@ -77,7 +78,6 @@ SRC_URI += " \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
-    crate://crates.io/hashbrown/0.16.1 \
     crate://crates.io/hashbrown/0.17.0 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
@@ -97,13 +97,13 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.23 \
-    crate://crates.io/jiff-static/0.2.23 \
+    crate://crates.io/jiff/0.2.24 \
+    crate://crates.io/jiff-static/0.2.24 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
     crate://crates.io/js-sys/0.3.91 \
-    crate://crates.io/junction/1.4.2 \
+    crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libbz2-rs-sys/0.2.2 \
@@ -157,8 +157,8 @@ SRC_URI += " \
     crate://crates.io/regex-automata/0.4.14 \
     crate://crates.io/regex-syntax/0.8.10 \
     crate://crates.io/rend/0.5.3 \
-    crate://crates.io/rkyv/0.8.15 \
-    crate://crates.io/rkyv_derive/0.8.15 \
+    crate://crates.io/rkyv/0.8.16 \
+    crate://crates.io/rkyv_derive/0.8.16 \
     crate://crates.io/rustc-hash/2.1.2 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
@@ -202,7 +202,7 @@ SRC_URI += " \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.51.1 \
+    crate://crates.io/tokio/1.52.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/toml/0.9.10+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
@@ -255,27 +255,17 @@ SRC_URI += " \
     crate://crates.io/windows-numerics/0.2.0 \
     crate://crates.io/windows-result/0.3.4 \
     crate://crates.io/windows-strings/0.4.2 \
-    crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows-threading/0.1.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.53.1 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.53.1 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_gnullvm/0.53.1 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.53.1 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.53.1 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/0.7.15 \
     crate://crates.io/wit-bindgen/0.51.0 \
@@ -312,11 +302,12 @@ SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db416
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
+SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
 SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.11.0.sha256sum] = "843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af"
+SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
@@ -328,9 +319,9 @@ SRC_URI[bzip2-0.6.1.sha256sum] = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.0.sha256sum] = "b193af5b67834b676abd72466a96c1024e6a6ad978a1f484bd90b85c94041351"
+SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
 SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
-SRC_URI[clap_derive-4.6.0.sha256sum] = "1110bd8a634a1ab8cb04345d8d878267d57c3cf1b38d91b71af6686408bbca6a"
+SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[console-0.16.3.sha256sum] = "d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87"
@@ -339,7 +330,7 @@ SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b718
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
-SRC_URI[data-encoding-2.10.0.sha256sum] = "d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea"
+SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
@@ -377,7 +368,6 @@ SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
-SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
 SRC_URI[hashbrown-0.17.0.sha256sum] = "4f467dd6dccf739c208452f8014c75c18bb8301b050ad1cfb27153803edb0f51"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
@@ -397,13 +387,13 @@ SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.23.sha256sum] = "1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359"
-SRC_URI[jiff-static-0.2.23.sha256sum] = "2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4"
+SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
+SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
-SRC_URI[junction-1.4.2.sha256sum] = "8cfc352a66ba903c23239ef51e809508b6fc2b0f90e3476ac7a9ff47e863ae95"
+SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libbz2-rs-sys-0.2.2.sha256sum] = "2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7"
@@ -457,8 +447,8 @@ SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab4
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
 SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
-SRC_URI[rkyv-0.8.15.sha256sum] = "1a30e631b7f4a03dee9056b8ef6982e8ba371dd5bedb74d3ec86df4499132c70"
-SRC_URI[rkyv_derive-0.8.15.sha256sum] = "8100bb34c0a1d0f907143db3149e6b4eea3c33b9ee8b189720168e818303986f"
+SRC_URI[rkyv-0.8.16.sha256sum] = "73389e0c99e664f919275ab5b5b0471391fe9a8de61e1dff9b1eaf56a90f16e3"
+SRC_URI[rkyv_derive-0.8.16.sha256sum] = "5d2ed0b54125315fb36bd021e82d314d1c126548f871634b483f46b31d13cac6"
 SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
@@ -502,7 +492,7 @@ SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b7635
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.51.1.sha256sum] = "f66bf9585cda4b724d3e78ab34b73fb2bbaba9011b9bfdf69dc836382ea13b8c"
+SRC_URI[tokio-1.52.1.sha256sum] = "b67dee974fe86fd92cc45b7a95fdd2f99a36a6d7b0d431a231178d3d670bbcc6"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[toml-0.9.10+spec-1.1.0.sha256sum] = "0825052159284a1a8b4d6c0c86cbc801f2da5afd2b225fa548c72f2e74002f48"
 SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
@@ -555,27 +545,17 @@ SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd4
 SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
-SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
 SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-0.7.15.sha256sum] = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.8.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.8.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
index 8ae54f0f56..f443342e6b 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.8.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "77c7f1eb47f4fa76b0848e1d8838255f75f5777bdbfbf06d4aa66bac19aad82e"
+SRC_URI[sha256sum] = "89755665ec50d7f14dc4886cb88528990f00a6cd6b793b48c7bf17d86f29341e"
 
 require ${BPN}-crates.inc
 

