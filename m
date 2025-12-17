Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AC8D66BA1
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 19:41:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23865.1766000461350732997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 11:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8p74r9w;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b713c7096f9so1019864166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 11:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766000459; x=1766605259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akAW/gIAhjw+hI0HDp9w80jBO+Cji8Gvc5LEva9x7wU=;
        b=W8p74r9wkAWOuqnJ0eNk7hkzg41bd45HHaDVVW7HEmQpqL7Fg9f84EI0n8F+IwMr9v
         11xrpWsLMYzWeofC8Hcx20biocrBqj8JQmFoyQGhhncZYuaY5hAWpSOdaHIV4mQbAqVL
         ub0z9/Rdj1BJGkCIjjVgdzVXxE9tDRrKemqLa+eRz2Vur7U2T45qh2o39xWLRzE9yd7E
         pi+vMcgHGJ/NB5V6fLhG23gRkU6f5ES2YqXf4dN0Y8sNd39DkEmt43TcqsHUx5N1A6WW
         jko3SDq7RpyrB3dS36fPu+rLLDW7ZuNtpzb+7xU8ni1aPHtaHl8nVpnJ7NsCTplaR34b
         Or8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766000459; x=1766605259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akAW/gIAhjw+hI0HDp9w80jBO+Cji8Gvc5LEva9x7wU=;
        b=md0RyovDQRuOmAedUseE2MYC2MWgrbxVuT5LLX8ysD2bdCyheZFlK/F4mGPpCTkdfq
         LeuubbF+52ia4Qsj0SmKL/YkAKuGfD5ljQ2zev5ms85BBIKGPTHWmS4V7+1C2vIKLQVI
         ty6HI5CdwF9I1P89p5HPQ2Hf70PxmilEd19Zxs1razwalJ74QN8fLcTcR7i0MX7sRFGB
         cMBbfzDHSOnIYo/xEja0Yrbn6vylLZh5uDAqhr1QCPJjFvHb5Ll2FIALWQd4YOXCsp51
         /MJvwON0L1RLjZphY4OR+u62wBYljZ1H2fR2ZuFhsP2Mxy26MwAacyFx+lmu9Lyya73j
         V4LA==
X-Gm-Message-State: AOJu0YxKS45Z+3EIf7BhujuRWzc+KLEg+H3po6fuw8KHWyCxhi08jnwm
	9gqlqYIZYxeevdRIdl9gXXe6ePdsrhskwTzQStfyPWmE+9KJZ8Fb1DC0sBtLmw==
X-Gm-Gg: AY/fxX675q7ou93pj68+8qEv4H8932Sr4mVPNU50NsNMiivliNIJjPkT+DNwT3vmamx
	bABjd/CmEtxqbX3O9buIjaX+Cwm+oIDveLcRiLpUMdGM5/7kmW9BsaDL1a3MFJj4/JRFZ5grHAh
	5ZVFJibmoTgPoS9wiZBXSCBWm7Ve0yIr4ZpEG1SFAbfWdO2N8rljK8KzSlBuw6eolMG9FKIOf4W
	SkbmCMjX6YsWHH19oLLCVeohRa60GT8IhxY+OoBu1spUXEn6aKM9Y9iwOcAuFOZHaxzXTahVp9k
	xeXpef8a0oEGfJmUITfkBymbTpeB6J6HjlrCrU2sIuy8a80PRKY6xUbxQnhJDLQD0jLRMhXogwI
	87uugao6FVH3H7LPNwnG5DZekvHbxrMv/vlBVPASiQDW3EHWETW08hujpcKfzWIhOWq3zT3iZ7f
	UxqseJ2A0/0QVEELD+jzxZM88lx+14X+SMUN4LItC0nwYaEAPppgjMv81ix1NeHmNk
X-Google-Smtp-Source: AGHT+IFv4XVIWFjCLfjLRrLa8Xvb2eRtjQiLJCvFNIiF/eN4TiEjNLpsjDLMqKyGZKkGZDddgP3/Bg==
X-Received: by 2002:a17:907:1c1f:b0:b70:df0d:e2e9 with SMTP id a640c23a62f3a-b7d23a3467cmr1923225066b.44.1766000459075;
        Wed, 17 Dec 2025 11:40:59 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80234a2c0dsm5763066b.51.2025.12.17.11.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 11:40:58 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH] python3-bcrypt: upgrade 4.3.0 -> 5.0.0
Date: Wed, 17 Dec 2025 20:40:52 +0100
Message-ID: <20251217194052.361260-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228074

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-bcrypt-crates.inc          | 112 ++++++++----------
 ...crypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} |   2 +-
 2 files changed, 49 insertions(+), 65 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index e0a2926519..bf6ee26cbf 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -2,105 +2,89 @@
 
 # from src/_bcrypt/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/autocfg/1.4.0 \
+    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bcrypt/0.17.0 \
+    crate://crates.io/bcrypt/0.17.1 \
     crate://crates.io/bcrypt-pbkdf/0.10.0 \
-    crate://crates.io/bitflags/2.8.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cfg-if/1.0.3 \
     crate://crates.io/cipher/0.4.4 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.1 \
+    crate://crates.io/getrandom/0.3.3 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/indoc/2.0.6 \
     crate://crates.io/inout/0.1.4 \
-    crate://crates.io/libc/0.2.170 \
+    crate://crates.io/libc/0.2.176 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.3 \
+    crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/pbkdf2/0.12.2 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/proc-macro2/1.0.93 \
-    crate://crates.io/pyo3/0.23.5 \
-    crate://crates.io/pyo3-build-config/0.23.5 \
-    crate://crates.io/pyo3-ffi/0.23.5 \
-    crate://crates.io/pyo3-macros/0.23.5 \
-    crate://crates.io/pyo3-macros-backend/0.23.5 \
-    crate://crates.io/quote/1.0.38 \
-    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/pyo3/0.26.0 \
+    crate://crates.io/pyo3-build-config/0.26.0 \
+    crate://crates.io/pyo3-ffi/0.26.0 \
+    crate://crates.io/pyo3-macros/0.26.0 \
+    crate://crates.io/pyo3-macros-backend/0.26.0 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/sha2/0.10.9 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.98 \
-    crate://crates.io/target-lexicon/0.12.16 \
+    crate://crates.io/syn/2.0.106 \
+    crate://crates.io/target-lexicon/0.13.3 \
     crate://crates.io/typenum/1.18.0 \
-    crate://crates.io/unicode-ident/1.0.17 \
-    crate://crates.io/unindent/0.2.3 \
+    crate://crates.io/unicode-ident/1.0.19 \
+    crate://crates.io/unindent/0.2.4 \
     crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wasi/0.13.3+wasi-0.2.2 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/wit-bindgen-rt/0.33.0 \
+    crate://crates.io/wasi/0.14.7+wasi-0.2.4 \
+    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
+    crate://crates.io/wit-bindgen/0.46.0 \
     crate://crates.io/zeroize/1.8.1 \
 "
 
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bcrypt-0.17.0.sha256sum] = "92758ad6077e4c76a6cadbce5005f666df70d4f13b19976b1a8062eef880040f"
+SRC_URI[bcrypt-0.17.1.sha256sum] = "abaf6da45c74385272ddf00e1ac074c7d8a6c1a1dda376902bd6a427522a8b2c"
 SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
-SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[cfg-if-1.0.3.sha256sum] = "2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.1.sha256sum] = "43a49c392881ce6d5c3b8cb70f98717b7c07aabbdff06687b9030dbfbe2725f8"
+SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
-SRC_URI[libc-0.2.170.sha256sum] = "875b3680cb2f8f71bdcf9a30f38d48282f5d3c95cbf9b3fa57269bb5d5c06828"
+SRC_URI[libc-0.2.176.sha256sum] = "58f929b4d672ea937a23a1ab494143d968337a5f47e56d0815df1e0890ddf174"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.3.sha256sum] = "945462a4b81e43c4e3ba96bd7b49d834c6f61198356aa858733bc4acf3cbe62e"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
-SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
-SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
-SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
-SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
-SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
-SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
-SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
+SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
+SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
+SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
+SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.98.sha256sum] = "36147f1a48ae0ec2b5b3bc5b537d267457555a10dc06f3dbc8cb11ba3006d3b1"
-SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
+SRC_URI[syn-2.0.106.sha256sum] = "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
+SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
 SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
-SRC_URI[unicode-ident-1.0.17.sha256sum] = "00e2473a93778eb0bad35909dff6a10d28e63f792f16ed15e404fca9d5eeedbe"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[unicode-ident-1.0.19.sha256sum] = "f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d"
+SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[wasi-0.13.3+wasi-0.2.2.sha256sum] = "26816d2e1a4a36a2940b96c5296ce403917633dff8f3440e9b236ed6f6bacad2"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[wit-bindgen-rt-0.33.0.sha256sum] = "3268f3d866458b787f390cf61f4bbb563b922d091359f9608842999eaee3943c"
+SRC_URI[wasi-0.14.7+wasi-0.2.4.sha256sum] = "883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c"
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
+SRC_URI[wit-bindgen-0.46.0.sha256sum] = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
rename to meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
index 931aae4310..6397ecd818 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "python3-cffi-native"
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "3a3fd2204178b6d2adcf09cb4f6426ffef54762577a7c9b54c159008cb288c18"
+SRC_URI[sha256sum] = "f748f7c2d6fd375cc93d3fba7ef4a9e3a092421b8dbf34d8d4dc06be9492dfdd"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.43.0


