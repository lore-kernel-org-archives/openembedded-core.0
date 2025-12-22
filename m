Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74CEE6ADCF
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87687.1766434105970227192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WRM8bAai;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b72b495aa81so716627666b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434104; x=1767038904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPSlBxAOLnCAPTZwOuuAF7CjQRleeHU7ozmZFSF68PE=;
        b=WRM8bAai1eonTapbDEcY+Fs/HlId1XCYqBoXFi6r1OFGNXv4YCqxdHDKbQ+hx/BOgQ
         vXnjxPT2gp1m90oh+cXv2BgbMlYO5VQD1P1m6JB0UhudjTMUqcuKZ3Ns23cbHifPAxLk
         meSeJ7FUx9A2hj0M+9q+5hA7FZsc7O0ErvDSFeMBGCCLlZ+5LMYAsNfz/swy7a4c7ft6
         0FfXn34l/olLLGuFo5vOguJs42RpOVyGGTt0wCRtpQYZ+Bn7hTcmEoXUCm3MuG2cH7cr
         jgXMlnd7R1tKFGOJ0Vn+XIBJtyF9fG/rmtPJYMFcRemHu1Uh9rkrQ0EFjhfa1E2pGszf
         e4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434104; x=1767038904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPSlBxAOLnCAPTZwOuuAF7CjQRleeHU7ozmZFSF68PE=;
        b=kNCWEcKcuiQRGNC0XN/ngW6ah4+F66LhJZDFwGTvZ3QjrfwVFB8mhLqnMYyGB2x4Ru
         oGNKjfgzHUSA9V+qMkBMVWvSKtcXPBa98t9dMQpwISHL6b+svRZ26n56HqgtOO7P6jul
         S9ZXOhkkKvSMyvWyZudm2WmkgRMEqmCgCCfVLcgxq6ESVprkrnvuiZkmQOMjuezWtQDJ
         uK2ufxEi0Rj6vC24t1mtAOzMCaNNVyLs4KATl2KXKxvidI14PfkaNZQEdyq0c+qtLF07
         jj09rk6JWneFC/9KgnbjuLe1DxRpWHm8sVH7QLSsx0gJScq9MOXOeJz75n6P9KaYwfPu
         N5rw==
X-Gm-Message-State: AOJu0YzZLKA7N7Wwi5FTwwbsiWci9/+C2Yo22ZNB81lUnFIy7TRfFhx8
	I/kkseMhga5vZujL05SvCtFtY9qow/7MJTNjfSER8Xt38E7FUMeg8YZqFnaayA==
X-Gm-Gg: AY/fxX5dsPbeOLbHQtKwchV0vaVG3bajmKMQYIDomZdpkWLDTjxT8IjYpAm1ypo9PMo
	6cxinnCcmXdbxkPFzDu8jBEwTRifg4yhL7NeurnpvT/C64gxANHuljrSAUGpuSBqnK0yjAAPj5t
	Wl2of4zGtLY176uuvOrnehKCDpvgBbXZ4/lR56jff7zndD2sEC2TjtFXfZeI1nzTJS2UKY28ZOe
	vAC0fSuNA6CowbDyxHBsEmma4u3U39J8r0wXtkiutFzymyZ6A2oi3g5OYCvO9294gLBDmQaZVwC
	+RTt+gm7Qc7tO9cZA1B3jWr3Ch7/+gagc5StLO515hilDYRzkIVYwN3Mb1HEfuPOn9Rg78w6P+6
	IzsuXYw9tNzcQ/XJ0GMl1mMmUxXhJUaM4yO3k/u/w7tJwygaNKHPHllTxVvIzEWNNnOZVLruivM
	iMPw/9FvkNEOsjNJLg60C9+ivlZeCLF84MI0eG4saVQ2dH3fE=
X-Google-Smtp-Source: AGHT+IHL3UxQi91emZqecu7yTjIl3AHrzfitCcgsP0jL6UVErbr69v1U2WseorGqpTNIx9jPVWNkJQ==
X-Received: by 2002:a17:907:960c:b0:b80:b7f:aa32 with SMTP id a640c23a62f3a-b80371da8f5mr1371895266b.41.1766434104060;
        Mon, 22 Dec 2025 12:08:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 055/114] python3-cryptography: upgrade 45.0.7 -> 46.0.3
Date: Mon, 22 Dec 2025 21:06:37 +0100
Message-ID: <20251222200739.2278706-55-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228380

From: Alexander Kanavin <alex@linutronix.de>

python3-cryptography-vectors is now using uv-build for building.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 78 ++++++++++---------
 .../python/python3-cryptography-vectors.bb    |  5 +-
 ...ml-bump-uv_build-version-requirement.patch | 22 ++++++
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  6 +-
 6 files changed, 71 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index bcb907b645..24969828b1 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.7"
+PV = "46.0.3"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index e178790448..6e3667eef1 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,75 +2,77 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.21.3 \
-    crate://crates.io/asn1_derive/0.21.3 \
-    crate://crates.io/autocfg/1.4.0 \
+    crate://crates.io/asn1/0.22.0 \
+    crate://crates.io/asn1_derive/0.22.0 \
+    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.9.1 \
-    crate://crates.io/cc/1.2.23 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/bitflags/2.9.4 \
+    crate://crates.io/cc/1.2.37 \
+    crate://crates.io/cfg-if/1.0.3 \
+    crate://crates.io/find-msvc-tools/0.1.1 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.6 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/libc/0.2.172 \
+    crate://crates.io/libc/0.2.175 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/openssl/0.10.72 \
+    crate://crates.io/openssl/0.10.74 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.108 \
+    crate://crates.io/openssl-sys/0.9.110 \
     crate://crates.io/pem/3.0.5 \
     crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3/0.25.0 \
-    crate://crates.io/pyo3-build-config/0.25.0 \
-    crate://crates.io/pyo3-ffi/0.25.0 \
-    crate://crates.io/pyo3-macros/0.25.0 \
-    crate://crates.io/pyo3-macros-backend/0.25.0 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/pyo3/0.26.0 \
+    crate://crates.io/pyo3-build-config/0.26.0 \
+    crate://crates.io/pyo3-ffi/0.26.0 \
+    crate://crates.io/pyo3-macros/0.26.0 \
+    crate://crates.io/pyo3-macros-backend/0.26.0 \
     crate://crates.io/quote/1.0.40 \
     crate://crates.io/self_cell/1.2.0 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.101 \
-    crate://crates.io/target-lexicon/0.13.2 \
-    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/syn/2.0.106 \
+    crate://crates.io/target-lexicon/0.13.3 \
+    crate://crates.io/unicode-ident/1.0.19 \
     crate://crates.io/unindent/0.2.4 \
     crate://crates.io/vcpkg/0.2.15 \
 "
 
-SRC_URI[asn1-0.21.3.sha256sum] = "2d9c3502a6f1b50a2c69b97b71638a81ad3b21b9874604880401b9b2b0bf758f"
-SRC_URI[asn1_derive-0.21.3.sha256sum] = "1766ebcb519d8dd186d60dfa912571edcaa2c1f995e2e56643a261a87df69a61"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
+SRC_URI[asn1-0.22.0.sha256sum] = "df42c2b01c5e1060b8281f67b4e5fb858260694916a667345a7305cd11e5dbfa"
+SRC_URI[asn1_derive-0.22.0.sha256sum] = "cdccf849b54365e3693e9a90ad36e4482b79937e6373ac8e2cf229c985187b21"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
-SRC_URI[cc-1.2.23.sha256sum] = "5f4ac86a9e5bc1e2b3449ab9d7d3a6a405e3d1bb28d7b9be8614f55846ae3766"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[bitflags-2.9.4.sha256sum] = "2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394"
+SRC_URI[cc-1.2.37.sha256sum] = "65193589c6404eb80b450d618eaf9a2cafaaafd57ecce47370519ef674a7bd44"
+SRC_URI[cfg-if-1.0.3.sha256sum] = "2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9"
+SRC_URI[find-msvc-tools-0.1.1.sha256sum] = "7fd99930f64d146689264c637b5af2f0233a933bef0d8570e2526bf9e083192d"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
+SRC_URI[libc-0.2.175.sha256sum] = "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[openssl-0.10.72.sha256sum] = "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
+SRC_URI[openssl-0.10.74.sha256sum] = "24ad14dd45412269e1a30f52ad8f0664f0f4f4a89ee8fe28c3b3527021ebb654"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.108.sha256sum] = "e145e1651e858e820e4860f7b9c5e169bc1d8ce1c86043be79fa7b7634821847"
+SRC_URI[openssl-sys-0.9.110.sha256sum] = "0a9f0075ba3c21b09f8e8b2026584b1d18d49388648f2fbbf3c97ea8deced8e2"
 SRC_URI[pem-3.0.5.sha256sum] = "38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
-SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
-SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
-SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
-SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
+SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
+SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
+SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
+SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
 SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
 SRC_URI[self_cell-1.2.0.sha256sum] = "0f7d95a54511e0c7be3f51e8867aa8cf35148d7b9445d44de2f943e2b206e749"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
-SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
-SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[syn-2.0.106.sha256sum] = "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
+SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
+SRC_URI[unicode-ident-1.0.19.sha256sum] = "f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d"
 SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index e845486a94..cff5681df1 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,11 +9,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "48e71fc4ac5f6298b2de53a99726ddc4a9e5ef0a94d921820109e7b90baf9f56"
+SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch"
+SRC_URI[sha256sum] = "a23246fcb794fc87d814d1b4be20df74a299840a2430cc74651bc7ba0f3b548c"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
+DEPENDS += "python3-uv-build-native"
+
 inherit pypi python_flit_core
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
new file mode 100644
index 0000000000..23af7c200d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
@@ -0,0 +1,22 @@
+From f2f6b2b391a34a10ad5d94f5c8c70c32a72a34a3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 18 Dec 2025 20:20:13 +0100
+Subject: [PATCH] pyproject.toml: bump uv_build version requirement
+
+Upstream-Status: Backport [partial https://github.com/pyca/cryptography/pull/13617]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 9beed0d..0c421f3 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["uv_build>=0.7.19,<0.9.0"]
++requires = ["uv_build>=0.7.19,<0.10.0"]
+ build-backend = "uv_build"
+ 
+ [project]
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 55fdf13972..b3b45cd172 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "4b1654dfc64ea479c242508eb8c724044f1e964a47d1d1cacc5132292d851971"
+SRC_URI[sha256sum] = "a8b17438104fed022ce745b362294d9ce35b4c2e45c1d958ad4a4b019285f4a1"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 16681e80a8..866b7a058f 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b033cd32813a104fb216135cdca7da7180912e56 Mon Sep 17 00:00:00 2001
+From 1fb7785f80037fa1258added61470d0c73fd3222 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 4746201..df98351 100644
+index b3d8c31..6593057 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -129,7 +129,7 @@ exclude = [
+@@ -134,7 +134,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]
-- 
2.47.3


