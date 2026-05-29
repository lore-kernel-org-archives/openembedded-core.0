Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A55CD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 11:35:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8202.1780054518911212282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 04:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dPVShc81;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bc763e2ba8so69889555ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780054518; x=1780659318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8aoIGIqI1tVEhNaZljpcKzzM7pMVqzlTulEsWloXYeQ=;
        b=dPVShc81cv/uEHqeizLvimQhZXuGqLHhQImPq1HnDKgFuqPuMJm1BB6+dkEde7uXX9
         1S4qkftT4+8nN9OKfnt47CrlQl6g9H0N+UIrcs9aNWmbyDihJsk+8pd9T+o9SIYyudaM
         bglQJrRNvoq+mThDP3p84Wnxe43TkQeO7YgRpODv7vc3CDpKdXjiFUekSs/6ZTAJ6pHp
         Ew2bPLt4gRlaqB8QXKPd5g6J57VCcGzye83OQLMQs/pheRByKrqvAYwwsqEhF583HJzP
         roCIN884DdG2OlpbDP57//fTsDP/swOHrdO4ry/hTkNOnKPMyV4bx63EAp8/4U/5hMa+
         nzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054518; x=1780659318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aoIGIqI1tVEhNaZljpcKzzM7pMVqzlTulEsWloXYeQ=;
        b=QrvAwgHF0A7R0+jSgvhx2i25AGMkaMKXTDid3ZbMq/hKxUfVj2ykK/MI7nuXgKSPvj
         qmRjvNY7J5j8EFz+aOdhvMpIfJwCUAb8fJeEo5ZL7f0+UaV4tzciRTqC9POWAGUKnzUd
         AA6mDo0Pr642rvkplRZTD0mvCqgRgCrzXF2SiFw5WRkaG4N7c4glOKjltiFIOy3HQdED
         Dw+J5BENO1pThGdHWEgrhFpl6I2mzUi9W8tlEYWQomE6rb4V8ji0BUCuzMNuJ3mAE/XC
         602gWPKUrnGBCVyt9zXE+2LmRgc1UTgumu45uxaghXNVV0Nai7jICSDMf0hdDi75yCbz
         86GA==
X-Gm-Message-State: AOJu0YxaUkqAATtd53jVVJyYSmnApzDIrOdcKMU0ivWp+etRF/y/MXIW
	zRgGRPzyolbZc3wDBNh+MhxK9SWwX8PvaRO/5qREmxU3EeOlZg2SGk4C44NBgw==
X-Gm-Gg: Acq92OHi6LJ/koDAaK69c/EfLKXIsXMCuQWgqGD1dPrvMUSk9ekOFqGvjuzh1oZwAZx
	jwMLrKKUmXBHFQm4NE8ZUto0o2FlT8ls3JbvvU8a/RI59jsesEftgjmtUTTl47lJ9u2ZLkZLf39
	FwM9NT9GYSQFqD122q/QGKVYL+74fPmrrnffi/glsK8CZvgTSbTBdv+dfTT/HgKQMZfRWOwuJ3g
	TKi/5Nx5rBy85ZWGOkPJAS3XKEax9225e6X3N9KJv8BCq/da6VlfDW8Hv+1W6au5kiFvhaL2+w/
	4fJnYhNQbiqXXc5TyvLYFZw/gk/y3TdJHZDdRDKuGXKOTWHN1FikS947FOuAu9ev6MolzTYnr4Y
	SNCZj8mqVp5kM5FGuO3glseiYUiRQPGI5KaaWRf82fyIPaVT7k8twpfMRe/llDup+jQGGwTmN9g
	Rx8IDms9e1Z/45A/ZrR/YT9jKOC8T3XhLgYn9tuztOG/VLTwvh9gOl/mBtzdfpiRWrrI+sV4aHM
	BqceZbNPyjGBrJnouNDZ32QosBL7SLqmUX3D27ROBcc1sSOFclHnUhhXg==
X-Received: by 2002:a17:903:4765:b0:2bf:2243:d4ee with SMTP id d9443c01a7336-2bf2243d83dmr33013165ad.18.1780054518101;
        Fri, 29 May 2026 04:35:18 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm24769765ad.41.2026.05.29.04.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:35:17 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH v2] python3-cryptography{-vectors}: upgrade 46.0.7 -> 48.0.0
Date: Fri, 29 May 2026 17:05:02 +0530
Message-ID: <20260529113502.14254-1-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 11:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237748

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst#4800---2026-05-04
https://github.com/pyca/cryptography/compare/46.0.7...48.0.0

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

---
Changes in v2:
- drop merged patch file 0001-bump-uv_build-to-0.11.0.patch
---
 .../python/python3-cryptography-common.inc    |   2 +-
 .../python/python3-cryptography-crates.inc    | 108 ++++++++----------
 .../python/python3-cryptography-vectors.bb    |   3 +-
 .../0001-bump-uv_build-to-0.11.0.patch        |  26 -----
 .../python/python3-cryptography.bb            |   2 +-
 5 files changed, 53 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 0515cf7705..77d9781688 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.7"
+PV = "48.0.0"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 6e3667eef1..0301b1f49c 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,77 +2,69 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.22.0 \
-    crate://crates.io/asn1_derive/0.22.0 \
-    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/asn1/0.24.1 \
+    crate://crates.io/asn1_derive/0.24.1 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.9.4 \
-    crate://crates.io/cc/1.2.37 \
-    crate://crates.io/cfg-if/1.0.3 \
-    crate://crates.io/find-msvc-tools/0.1.1 \
+    crate://crates.io/bitflags/2.11.1 \
+    crate://crates.io/cc/1.2.61 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.6 \
-    crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/libc/0.2.175 \
-    crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/openssl/0.10.74 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/openssl/0.10.79 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.110 \
-    crate://crates.io/pem/3.0.5 \
-    crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/portable-atomic/1.11.1 \
-    crate://crates.io/proc-macro2/1.0.101 \
-    crate://crates.io/pyo3/0.26.0 \
-    crate://crates.io/pyo3-build-config/0.26.0 \
-    crate://crates.io/pyo3-ffi/0.26.0 \
-    crate://crates.io/pyo3-macros/0.26.0 \
-    crate://crates.io/pyo3-macros-backend/0.26.0 \
-    crate://crates.io/quote/1.0.40 \
-    crate://crates.io/self_cell/1.2.0 \
+    crate://crates.io/openssl-sys/0.9.115 \
+    crate://crates.io/pem/3.0.6 \
+    crate://crates.io/pkg-config/0.3.33 \
+    crate://crates.io/portable-atomic/1.13.1 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/pyo3/0.28.3 \
+    crate://crates.io/pyo3-build-config/0.28.3 \
+    crate://crates.io/pyo3-ffi/0.28.3 \
+    crate://crates.io/pyo3-macros/0.28.3 \
+    crate://crates.io/pyo3-macros-backend/0.28.3 \
+    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/self_cell/1.2.2 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.106 \
-    crate://crates.io/target-lexicon/0.13.3 \
-    crate://crates.io/unicode-ident/1.0.19 \
-    crate://crates.io/unindent/0.2.4 \
+    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/target-lexicon/0.13.5 \
+    crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/vcpkg/0.2.15 \
 "
 
-SRC_URI[asn1-0.22.0.sha256sum] = "df42c2b01c5e1060b8281f67b4e5fb858260694916a667345a7305cd11e5dbfa"
-SRC_URI[asn1_derive-0.22.0.sha256sum] = "cdccf849b54365e3693e9a90ad36e4482b79937e6373ac8e2cf229c985187b21"
-SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[asn1-0.24.1.sha256sum] = "c9795210620c0cb3f9a7ce4f882808c38e1ef7b347c90591dceae0886e031fb1"
+SRC_URI[asn1_derive-0.24.1.sha256sum] = "909e307f1cc32bb8bccbd98f446e6d1bf03fa30f7b53a4337da7181ad30fa11a"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.9.4.sha256sum] = "2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394"
-SRC_URI[cc-1.2.37.sha256sum] = "65193589c6404eb80b450d618eaf9a2cafaaafd57ecce47370519ef674a7bd44"
-SRC_URI[cfg-if-1.0.3.sha256sum] = "2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9"
-SRC_URI[find-msvc-tools-0.1.1.sha256sum] = "7fd99930f64d146689264c637b5af2f0233a933bef0d8570e2526bf9e083192d"
+SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
+SRC_URI[cc-1.2.61.sha256sum] = "d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
-SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[libc-0.2.175.sha256sum] = "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
-SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[openssl-0.10.74.sha256sum] = "24ad14dd45412269e1a30f52ad8f0664f0f4f4a89ee8fe28c3b3527021ebb654"
+SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
+SRC_URI[openssl-0.10.79.sha256sum] = "bf0b434746ee2832f4f0baf10137e1cabb18cbe6912c69e2e33263c45250f542"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.110.sha256sum] = "0a9f0075ba3c21b09f8e8b2026584b1d18d49388648f2fbbf3c97ea8deced8e2"
-SRC_URI[pem-3.0.5.sha256sum] = "38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3"
-SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
-SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
-SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
-SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
-SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
-SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
-SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
-SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
-SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
-SRC_URI[self_cell-1.2.0.sha256sum] = "0f7d95a54511e0c7be3f51e8867aa8cf35148d7b9445d44de2f943e2b206e749"
+SRC_URI[openssl-sys-0.9.115.sha256sum] = "158fe5b292746440aa6e7a7e690e55aeb72d41505e2804c23c6973ad0e9c9781"
+SRC_URI[pem-3.0.6.sha256sum] = "1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be"
+SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
+SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
+SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
+SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
+SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
+SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
+SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+SRC_URI[self_cell-1.2.2.sha256sum] = "b12e76d157a900eb52e81bc6e9f3069344290341720e9178cde2407113ac8d89"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.106.sha256sum] = "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
-SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
-SRC_URI[unicode-ident-1.0.19.sha256sum] = "f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d"
-SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
+SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
+SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 0d2b638527..af17618b28 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI += "file://0001-bump-uv_build-to-0.11.0.patch"
-SRC_URI[sha256sum] = "08f3d13846fdd86d4c1138a88c695cee203b3dd3825c784d64a3b06d000cdda1"
+SRC_URI[sha256sum] = "69836f597ddfbe3920b3c90d1f18e5560973f0791b90e1921ad345e8111ac23e"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch
deleted file mode 100644
index 05f225de2f..0000000000
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b1e8722ccf79ef02ae929df2e7fd7547e8615e68 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 22 Apr 2026 10:09:16 +0000
-Subject: [PATCH] bump uv_build to 0.11.0
-
-Upstream-Status: Backport [https://github.com/pyca/cryptography/pull/14545]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index eac1a07..6bc8d46 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["uv_build>=0.7.19,<0.9.0"]
-+requires = ["uv_build>=0.7.19,<0.12.0"]
- build-backend = "uv_build"
- 
- [project]
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 7cff4ddacf..5e24dbaf5a 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5"
+SRC_URI[sha256sum] = "5c3932f4436d1cccb036cb0eaef46e6e2db91035166f1ad6505c3c9d5a635920"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \

