Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E11C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 04:25:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7855.1750825510192140908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 21:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LekNaR9y;
 spf=pass (domain: konsulko.com, ip: 209.85.214.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ef62066eso18643665ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 21:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750825509; x=1751430309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SfJknVEyjefsLuOgUx0P+NqxcdJTdoYZFpUzmOWvC8=;
        b=LekNaR9yk04s9EvHYBVDlKIZ8A8OSDXxbbLLph0hoI7WMCN/yCAwGNYN9svuA2qkys
         I6P2AXkDYmJC9x4HauzCcMZ1YHQWnX47H1G4q0wX0QZuR+2u5S1o6EtLKIAO2M6yNygS
         JEiPeHad+8oYt9GMc0LYVhbj/q4reM8QTmSVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750825509; x=1751430309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SfJknVEyjefsLuOgUx0P+NqxcdJTdoYZFpUzmOWvC8=;
        b=SnwliLCK46GA/Ge+HjOYjnjHjToIElK7JS+QzBjb9Jd4s7gFQX/sRFlmaaVH131fiX
         fcS7UkmNk9Y5q3GEaM43vtfGfZAWIjkNoh7UUgAgJlDdPuag9wqaMFRXSdoiVSs5DgiU
         okFioeyUpx19NdQ2etgidXtXMwZsd1wkA3Ropl/xWxJFqUA/p8bVO04tELY6SJ1TKXPV
         wlp2SuYijgEeWimJiv9UE3g3LmRrbDM6F4lJY9yy3C1zsE1LWFKWpf4jHHWImC619mcT
         q1BjDGsvD4AkYK5vSiVzivR/gtMtCOJrRai2DT60kh2N0QA+ffD4aguaqn/BnleXATUD
         Lpsg==
X-Gm-Message-State: AOJu0YxNGIs/AuTHg5zsU/xCFmKEuJ4WW9eJMrpfl8HyQsijmFT4KFCt
	lAYJohkaYlAwNyM6WCU/hWTLU6Ifda3meE/jATn3/6rdOFJ6kzrKvkWp2vQRvcK2iHTgkza+Ycf
	HeXhz7LQ=
X-Gm-Gg: ASbGncvpEMQE+FHpBRHFOhIrvklYwYzApnf5RVH2zRJrmyASLpeRXDiof9jGg+QEE+c
	5+AspsYXTsiVeseXyL39VbeQ99oKogV4Q9CjfkankjSKSUXauIBJBCs5lAU1rGoUiEZDp8T6FDq
	QeTImQqKEARQ2/knWPN1mygp30lriNzkZQox9+ycKBrpw57raU+SQvYpLO+hoVPc8pvGNA+9Cdg
	ScOzzuVMAr70rsRVpwFPaDT8v15jsGWdxtXWW2pTWDIk2sDqvHjB5lTDTLPOw1zLn8oPfuKSF96
	+U1iJHjOLn+Gvm6u+rGBmHxOTtuhgtn+CLNkHDVQMUvceqcxqM469Ag89ZQHKeiElB9c+qXhbON
	r4D4jT8Dvqkk351FOQ4bszFGvnPylIFcjvBgx
X-Google-Smtp-Source: AGHT+IGVv/jzTvq6TwcDmXrSbmq6Xqqf1XlGh8OagffMdHFnoxQS18qkypF1SeDUxqyeZI16pzIFoA==
X-Received: by 2002:a17:903:230f:b0:234:ed31:fc99 with SMTP id d9443c01a7336-23823fd5d74mr28202065ad.21.1750825508868;
        Tue, 24 Jun 2025 21:25:08 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8391494sm124863735ad.1.2025.06.24.21.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 21:25:08 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/6 v2] python3-maturin: upgrade 1.8.6 -> 1.8.7
Date: Tue, 24 Jun 2025 21:24:39 -0700
Message-ID: <20250625042505.2968282-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4eb0c9f6944fee1716cae0889f94a29ffefe7a15.1750806216.git.tim.orling@konsulko.com>
References: <4eb0c9f6944fee1716cae0889f94a29ffefe7a15.1750806216.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 04:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219298

From: Tim Orling <tim.orling@konsulko.com>

* Drop riscv32 patch as it has been fixed upstream
https://github.com/PyO3/maturin/commit/90b30a4e94e58e8d77d5d663cd2e0bbaab933f33
* Update crates

https://www.maturin.rs/changelog.html

1.8.7
Allow specifying compression method and level, in both build and develop modes, in #2625.
Fix Windows free-threaded builds on Python 3.14 in #2632

Comparing changes from v1.8.6 to v1.8.7:
https://github.com/PyO3/maturin/compare/v1.8.6...v1.8.7

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  Actually delete the patch (0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch)

 .../python/python3-maturin-crates.inc         |  32 +++--
 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 ------------------
 ...urin_1.8.6.bb => python3-maturin_1.8.7.bb} |   4 +-
 3 files changed, 25 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
 rename meta/recipes-devtools/python/{python3-maturin_1.8.6.bb => python3-maturin_1.8.7.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 5c939a09a8e..ea7bd488e6b 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -33,10 +33,10 @@ SRC_URI += " \
     crate://crates.io/cargo-config2/0.1.26 \
     crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.8 \
-    crate://crates.io/cargo-xwin/0.18.4 \
+    crate://crates.io/cargo-xwin/0.18.6 \
     crate://crates.io/cargo-zigbuild/0.20.0 \
     crate://crates.io/cargo_metadata/0.19.0 \
-    crate://crates.io/cbindgen/0.28.0 \
+    crate://crates.io/cbindgen/0.29.0 \
     crate://crates.io/cc/1.2.16 \
     crate://crates.io/cfb/0.10.0 \
     crate://crates.io/cfg-if/1.0.0 \
@@ -105,12 +105,12 @@ SRC_URI += " \
     crate://crates.io/futures-util/0.3.31 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/getrandom/0.3.3 \
     crate://crates.io/glob/0.3.1 \
     crate://crates.io/globset/0.4.15 \
     crate://crates.io/goblin/0.9.2 \
     crate://crates.io/hashbrown/0.14.5 \
     crate://crates.io/hashbrown/0.15.2 \
-    crate://crates.io/heck/0.4.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/home/0.5.9 \
     crate://crates.io/humantime/2.1.0 \
@@ -135,11 +135,12 @@ SRC_URI += " \
     crate://crates.io/itertools/0.12.1 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itoa/1.0.11 \
+    crate://crates.io/jobserver/0.1.33 \
     crate://crates.io/js-sys/0.3.73 \
     crate://crates.io/keyring/2.3.3 \
     crate://crates.io/lazy_static/1.4.0 \
     crate://crates.io/lddtree/0.3.7 \
-    crate://crates.io/libc/0.2.167 \
+    crate://crates.io/libc/0.2.172 \
     crate://crates.io/libmimalloc-sys/0.1.39 \
     crate://crates.io/libredox/0.1.3 \
     crate://crates.io/linux-keyutils/0.2.4 \
@@ -148,6 +149,7 @@ SRC_URI += " \
     crate://crates.io/lock_api/0.4.12 \
     crate://crates.io/lockfree-object-pool/0.1.6 \
     crate://crates.io/log/0.4.22 \
+    crate://crates.io/lzma-rs/0.3.0 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.5 \
     crate://crates.io/mailparse/0.15.0 \
@@ -199,6 +201,7 @@ SRC_URI += " \
     crate://crates.io/python-pkginfo/0.6.5 \
     crate://crates.io/quote/1.0.37 \
     crate://crates.io/quoted_printable/0.5.0 \
+    crate://crates.io/r-efi/5.2.0 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
@@ -312,6 +315,7 @@ SRC_URI += " \
     crate://crates.io/wait-timeout/0.2.0 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
     crate://crates.io/wasm-bindgen/0.2.96 \
     crate://crates.io/wasm-bindgen-backend/0.2.96 \
     crate://crates.io/wasm-bindgen-macro/0.2.96 \
@@ -347,6 +351,7 @@ SRC_URI += " \
     crate://crates.io/winnow/0.5.40 \
     crate://crates.io/winnow/0.6.20 \
     crate://crates.io/winsafe/0.0.19 \
+    crate://crates.io/wit-bindgen-rt/0.39.0 \
     crate://crates.io/write16/1.0.0 \
     crate://crates.io/writeable/0.5.5 \
     crate://crates.io/xattr/1.3.1 \
@@ -364,6 +369,9 @@ SRC_URI += " \
     crate://crates.io/zerovec-derive/0.10.3 \
     crate://crates.io/zip/2.3.0 \
     crate://crates.io/zopfli/0.8.1 \
+    crate://crates.io/zstd/0.13.3 \
+    crate://crates.io/zstd-safe/7.2.4 \
+    crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 \
 "
 
 SRC_URI[adler2-2.0.0.sha256sum] = "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
@@ -397,10 +405,10 @@ SRC_URI[camino-1.1.9.sha256sum] = "8b96ec4966b5813e2c0507c1f86115c8c5abaadc39808
 SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede"
 SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
-SRC_URI[cargo-xwin-0.18.4.sha256sum] = "60f1954e4ffa0f4c47b3df5e6e9508706d8dcaa56152cd672dcee02930ba0326"
+SRC_URI[cargo-xwin-0.18.6.sha256sum] = "5dff83aad332bd6ee29072dd874b48892cd22c58e233c25735eb4417b3999685"
 SRC_URI[cargo-zigbuild-0.20.0.sha256sum] = "3f6e9e856390d5b0a859acaeda16528f8a61c964bdb894c3216c254908f1c2ea"
 SRC_URI[cargo_metadata-0.19.0.sha256sum] = "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
-SRC_URI[cbindgen-0.28.0.sha256sum] = "eadd868a2ce9ca38de7eeafdcec9c7065ef89b42b32f0839278d55f35c54d1ff"
+SRC_URI[cbindgen-0.29.0.sha256sum] = "975982cdb7ad6a142be15bdf84aea7ec6a9e5d4d797c004d43185b24cfe4e684"
 SRC_URI[cc-1.2.16.sha256sum] = "be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c"
 SRC_URI[cfb-0.10.0.sha256sum] = "d8a4f8e55be323b378facfcf1f06aa97f6ec17cf4ac84fb17325093aaf62da41"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
@@ -469,12 +477,12 @@ SRC_URI[futures-timer-3.0.3.sha256sum] = "f288b0a4f20f9a56b5d1da57e2227c661b7b16
 SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
 SRC_URI[globset-0.4.15.sha256sum] = "15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19"
 SRC_URI[goblin-0.9.2.sha256sum] = "53ab3f32d1d77146981dea5d6b1e8fe31eedcb7013e5e00d6ccd1259a4b4d923"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
 SRC_URI[hashbrown-0.15.2.sha256sum] = "bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
 SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
@@ -499,11 +507,12 @@ SRC_URI[is_terminal_polyfill-1.70.0.sha256sum] = "f8478577c03552c21db0e2724ffb89
 SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
+SRC_URI[jobserver-0.1.33.sha256sum] = "38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a"
 SRC_URI[js-sys-0.3.73.sha256sum] = "fb15147158e79fd8b8afd0252522769c4f48725460b37338544d8379d94fc8f9"
 SRC_URI[keyring-2.3.3.sha256sum] = "363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
 SRC_URI[lddtree-0.3.7.sha256sum] = "e0779ac94bd7b6ab781fa12388dbf79ac45ec1fa433e7d25521753be8227b08e"
-SRC_URI[libc-0.2.167.sha256sum] = "09d6582e104315a817dff97f75133544b2e094ee22447d2acf4a74e189ba06fc"
+SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
 SRC_URI[libmimalloc-sys-0.1.39.sha256sum] = "23aa6811d3bd4deb8a84dde645f943476d13b248d818edcf8ce0b2f37f036b44"
 SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
 SRC_URI[linux-keyutils-0.2.4.sha256sum] = "761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e"
@@ -512,6 +521,7 @@ SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e
 SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
 SRC_URI[lockfree-object-pool-0.1.6.sha256sum] = "9374ef4228402d4b7e403e5838cb880d9ee663314b0a900d5a6aabf0c213552e"
 SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
+SRC_URI[lzma-rs-0.3.0.sha256sum] = "297e814c836ae64db86b36cf2a557ba54368d03f6afcd7d947c266692f71115e"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.5.sha256sum] = "5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001"
 SRC_URI[mailparse-0.15.0.sha256sum] = "3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e"
@@ -563,6 +573,7 @@ SRC_URI[pyproject-toml-0.13.4.sha256sum] = "643af57c3f36ba90a8b53e972727d8092f74
 SRC_URI[python-pkginfo-0.6.5.sha256sum] = "c21f58880fc45e91d29b2f639ab4051aaa6a2b054534c2d343a953347d0dd600"
 SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[quoted_printable-0.5.0.sha256sum] = "79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0"
+SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
@@ -676,6 +687,7 @@ SRC_URI[versions-6.2.0.sha256sum] = "38a8931f8d167b6448076020e70b9de46dcf5ea1731
 SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
 SRC_URI[wasm-bindgen-0.2.96.sha256sum] = "21d3b25c3ea1126a2ad5f4f9068483c2af1e64168f847abe863a526b8dbfe00b"
 SRC_URI[wasm-bindgen-backend-0.2.96.sha256sum] = "52857d4c32e496dc6537646b5b117081e71fd2ff06de792e3577a150627db283"
 SRC_URI[wasm-bindgen-macro-0.2.96.sha256sum] = "920b0ffe069571ebbfc9ddc0b36ba305ef65577c94b06262ed793716a1afd981"
@@ -711,6 +723,7 @@ SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc107
 SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
 SRC_URI[winnow-0.6.20.sha256sum] = "36c1fec1a2bb5866f07c25f68c26e565c4c200aebb96d7e55710c19d3e8ac49b"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
+SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
 SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
@@ -728,3 +741,6 @@ SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c
 SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
 SRC_URI[zip-2.3.0.sha256sum] = "84e9a772a54b54236b9b744aaaf8d7be01b4d6e99725523cb82cb32d1c81b1d7"
 SRC_URI[zopfli-0.8.1.sha256sum] = "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
+SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
+SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
+SRC_URI[zstd-sys-2.0.15+zstd.1.5.7.sha256sum] = "eb81183ddd97d0c74cedf1d50d85c8d08c1b8b68ee863bdee9e706eedba1a237"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
deleted file mode 100644
index aceefa7967e..00000000000
--- a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 4b439b0953573e0383da7e092b1f516ba21f3398 Mon Sep 17 00:00:00 2001
-From: Dan Gohman <dev@sunfishcode.online>
-Date: Sun, 6 Apr 2025 05:22:49 -0700
-Subject: [PATCH] Define Linux ioctl codes on more architectures.
-
-Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` using
-`_IOR` and `_IOW` so that they're automatically supported on all
-architectures, including riscv32gc-unknown-linux-gnu.
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4382/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/arch/generic/mod.rs | 75 ++++---------------
- 1 file changed, 15 insertions(+), 60 deletions(-)
-
---- a/src/unix/linux_like/linux/arch/generic/mod.rs
-+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
-@@ -1,5 +1,5 @@
- use crate::prelude::*;
--use crate::Ioctl;
-+use crate::{Ioctl, _IOR, _IOW};
- 
- s! {
-     pub struct termios2 {
-@@ -116,21 +116,8 @@ cfg_if! {
- // pub const SO_PREFER_BUSY_POLL: c_int = 69;
- // pub const SO_BUSY_POLL_BUDGET: c_int = 70;
- 
--cfg_if! {
--    if #[cfg(any(
--        target_arch = "x86",
--        target_arch = "x86_64",
--        target_arch = "arm",
--        target_arch = "aarch64",
--        target_arch = "riscv64",
--        target_arch = "s390x",
--        target_arch = "csky",
--        target_arch = "loongarch64"
--    ))] {
--        pub const FICLONE: c_ulong = 0x40049409;
--        pub const FICLONERANGE: c_ulong = 0x4020940D;
--    }
--}
-+pub const FICLONE: Ioctl = _IOW::<c_int>(0x94, 9) as Ioctl;
-+pub const FICLONERANGE: Ioctl = _IOW::<crate::file_clone_range>(0x94, 13) as Ioctl;
- 
- // Defined in unix/linux_like/mod.rs
- // pub const SCM_TIMESTAMP: c_int = SO_TIMESTAMP;
-@@ -248,49 +235,18 @@ pub const TUNGETVNETBE: Ioctl = 0x800454
- pub const TUNSETSTEERINGEBPF: Ioctl = 0x800454e0;
- pub const TUNSETFILTEREBPF: Ioctl = 0x800454e1;
- 
--cfg_if! {
--    // Those type are constructed using the _IOC macro
--    // DD-SS_SSSS_SSSS_SSSS-TTTT_TTTT-NNNN_NNNN
--    // where D stands for direction (either None (00), Read (01) or Write (11))
--    // where S stands for size (int, long, struct...)
--    // where T stands for type ('f','v','X'...)
--    // where N stands for NR (NumbeR)
--    if #[cfg(any(
--        target_arch = "x86",
--        target_arch = "arm",
--        target_arch = "csky"
--    ))] {
--        pub const FS_IOC_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC_SETVERSION: Ioctl = 0x40047602;
--        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
--        pub const TUNATTACHFILTER: Ioctl = 0x400854d5;
--        pub const TUNDETACHFILTER: Ioctl = 0x400854d6;
--        pub const TUNGETFILTER: Ioctl = 0x800854db;
--    } else if #[cfg(any(
--        target_arch = "x86_64",
--        target_arch = "riscv64",
--        target_arch = "aarch64",
--        target_arch = "s390x",
--        target_arch = "loongarch64"
--    ))] {
--        pub const FS_IOC_GETFLAGS: Ioctl = 0x80086601;
--        pub const FS_IOC_SETFLAGS: Ioctl = 0x40086602;
--        pub const FS_IOC_GETVERSION: Ioctl = 0x80087601;
--        pub const FS_IOC_SETVERSION: Ioctl = 0x40087602;
--        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
--        pub const TUNATTACHFILTER: Ioctl = 0x401054d5;
--        pub const TUNDETACHFILTER: Ioctl = 0x401054d6;
--        pub const TUNGETFILTER: Ioctl = 0x801054db;
--    }
--}
-+pub const FS_IOC_GETFLAGS: Ioctl = _IOR::<c_long>('f' as u32, 1) as Ioctl;
-+pub const FS_IOC_SETFLAGS: Ioctl = _IOW::<c_long>('f' as u32, 2) as Ioctl;
-+pub const FS_IOC_GETVERSION: Ioctl = _IOR::<c_long>('v' as u32, 1) as Ioctl;
-+pub const FS_IOC_SETVERSION: Ioctl = _IOW::<c_long>('v' as u32, 2) as Ioctl;
-+pub const FS_IOC32_GETFLAGS: Ioctl = _IOR::<c_int>('f' as u32, 1) as Ioctl;
-+pub const FS_IOC32_SETFLAGS: Ioctl = _IOW::<c_int>('f' as u32, 2) as Ioctl;
-+pub const FS_IOC32_GETVERSION: Ioctl = _IOR::<c_int>('v' as u32, 1) as Ioctl;
-+pub const FS_IOC32_SETVERSION: Ioctl = _IOW::<c_int>('v' as u32, 2) as Ioctl;
-+
-+pub const TUNATTACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 213) as Ioctl;
-+pub const TUNDETACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 214) as Ioctl;
-+pub const TUNGETFILTER: Ioctl = _IOR::<crate::sock_fprog>('T' as u32, 219) as Ioctl;
- 
- cfg_if! {
-     if #[cfg(any(target_arch = "arm", target_arch = "s390x"))] {
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb b/meta/recipes-devtools/python/python3-maturin_1.8.7.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-maturin_1.8.6.bb
rename to meta/recipes-devtools/python/python3-maturin_1.8.7.bb
index f80bf6051f5..0037ce60ad5 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.7.bb
@@ -5,9 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-# This is needed until Cargo.lock has libc-0.2.172+
-SRC_URI += "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
-SRC_URI[sha256sum] = "0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250ccaa29c1aa8d0e61fa664b0289d"
+SRC_URI[sha256sum] = "96c76353f94a153c5dc1a9d3916e75fcd17e6bf216a06dcdc2f84b9f98f374af"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.43.0


