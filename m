Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CABE77197
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5388.1735810883526361918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PeFICevt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso116043455e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810881; x=1736415681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aylCImhNPQOaYqgqfoJC8Z7jG1e437fs3Bh00MpieH4=;
        b=PeFICevtEUCsmiiwjAFV11jY9BrhF6nFgutJoRYxdieKV7spNDhCUGXLiZXUtVJwV7
         /9Hb6BJzPAywn44gOt42VeCJfB9eoqIoJdzq/xPQaJEX/24XC6RqbVrIz0OOmB2NBeBB
         n107mdUaGXpOLP8SugACk9PY0SPbDCwhulgfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810881; x=1736415681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aylCImhNPQOaYqgqfoJC8Z7jG1e437fs3Bh00MpieH4=;
        b=ZKw8e87nUlmDYPV3tvDvK3Qyhj7fXVB9g6ndtpM7Y+GKwk41+geZ3KHDhmkiqmecwe
         K3zWZHMzW4rCMdxr+AJqZWRKvFVoW1pHPy7KmaCKGXwJMZpvybC6BbEKnGbfziT2lGpe
         OfeD9Dm4nepduI5Ehxs7jqIvOCuEeBYJTyZzdKfQO44HOyVx2X39tMRRBzHlK9SzbqE3
         ezQSl3+5ceJ+N6FW5gNR+TJm2Rxa+KfgFlCSSCkniX9/3JaSJV337qsOMOTmGxeY833M
         FOWpS76SO8H2oTTqopaccn4ADtpGv2sEmilIXnCQw652J4T+FPDEiAMwUhWsyD8sW6ll
         kY4g==
X-Gm-Message-State: AOJu0Yz6kYMAgnVfh1JX89Eh536ccrBLBY4hCpLB4iNhh+cwB+7vWtRS
	WFfmRaySbqG2PkLCIK2/8upg23/tn5+lKZQ5vOmgmvXqpMCpE3kbMOT3ryXMdZxVmocMBWGGLTW
	RQko=
X-Gm-Gg: ASbGnctZXz/mOhMk5H7HHncrY1iYZ61P0QwqV9CGPiXiQH5m2oPRwhOYySGskYT7YBR
	QKVjcucrj7XX5nfFJAYAJM3HQ+gm4c4ez57XF09TZSrJqjZalyc9gCEk1ftCykRriJ90WwAlcNv
	hUkhAJui64+f7ARK9I7R+kwLlm+OYgJuoP9hFW84d/uU/orve3RcNJaTivv6rCeZwyk+p7FMDwA
	7npCe93iDdGEJrp9eaj6h84WTxtNwQzCUFlRAMMMD5x7emMmYFRjrg3LHciNL1oaz28RFs2dcFv
	Mf5jP6Lj5w==
X-Google-Smtp-Source: AGHT+IEAxYan8qrhxMe6Zwp8wwvYpbntMajCuKbXVJzHl+Ey+K417cBk7X6I5QOc5HXKhhMCEz4i0g==
X-Received: by 2002:a05:600c:6b72:b0:436:916b:aaf4 with SMTP id 5b1f17b1804b1-436916bc8eamr288079905e9.10.1735810881431;
        Thu, 02 Jan 2025 01:41:21 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/21] python3-cryptography-vectors,python3-cryptography: upgrade 43.0.3 -> 44.0.0,43.0.3 -> 44.0.0
Date: Thu,  2 Jan 2025 09:40:45 +0000
Message-ID: <20250102094059.322187-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209274

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 78 ++++++++++---------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  6 +-
 5 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 288f4c9f703..4220c7d62ca 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "43.0.3"
+PV = "44.0.0"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index b30d96eea10..18f346aed49 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -1,72 +1,76 @@
 # Autogenerated with 'bitbake -c update_crates python3-cryptography'
 
-# from src/rust/Cargo.lock
+# from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.16.2 \
-    crate://crates.io/asn1_derive/0.16.2 \
-    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/asn1/0.20.0 \
+    crate://crates.io/asn1_derive/0.20.0 \
+    crate://crates.io/autocfg/1.4.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/cc/1.1.6 \
+    crate://crates.io/cc/1.2.1 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/itoa/1.0.14 \
+    crate://crates.io/libc/0.2.166 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/once_cell/1.20.2 \
     crate://crates.io/openssl/0.10.68 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-sys/0.9.104 \
     crate://crates.io/pem/3.0.4 \
-    crate://crates.io/pkg-config/0.3.30 \
-    crate://crates.io/portable-atomic/1.7.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.2 \
-    crate://crates.io/pyo3-build-config/0.22.2 \
-    crate://crates.io/pyo3-ffi/0.22.2 \
-    crate://crates.io/pyo3-macros/0.22.2 \
-    crate://crates.io/pyo3-macros-backend/0.22.2 \
-    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/pkg-config/0.3.31 \
+    crate://crates.io/portable-atomic/1.10.0 \
+    crate://crates.io/proc-macro2/1.0.92 \
+    crate://crates.io/pyo3/0.23.2 \
+    crate://crates.io/pyo3-build-config/0.23.2 \
+    crate://crates.io/pyo3-ffi/0.23.2 \
+    crate://crates.io/pyo3-macros/0.23.2 \
+    crate://crates.io/pyo3-macros-backend/0.23.2 \
+    crate://crates.io/quote/1.0.37 \
     crate://crates.io/self_cell/1.0.4 \
-    crate://crates.io/syn/2.0.71 \
-    crate://crates.io/target-lexicon/0.12.15 \
-    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/syn/2.0.89 \
+    crate://crates.io/target-lexicon/0.12.16 \
+    crate://crates.io/unicode-ident/1.0.14 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/vcpkg/0.2.15 \
 "
 
-SRC_URI[asn1-0.16.2.sha256sum] = "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
-SRC_URI[asn1_derive-0.16.2.sha256sum] = "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[asn1-0.20.0.sha256sum] = "2d8b84b4ea1de2bf1dcd2a759737ddb328fb6695b2a95eb7e44fed67e3406f32"
+SRC_URI[asn1_derive-0.20.0.sha256sum] = "a200809d0138620b3dba989f1d08d0620e76248bc1e62a2ec1b2df5eb1ee08ad"
+SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[cc-1.1.6.sha256sum] = "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
+SRC_URI[cc-1.2.1.sha256sum] = "fd9de9f2205d5ef3fd67e685b0df337994ddd4495e2a28d185500d0e1edfea47"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[itoa-1.0.14.sha256sum] = "d75a2a4b1b190afb6f5425f10f6a8f959d2ea0b9c2b1d79553551850539e4674"
+SRC_URI[libc-0.2.166.sha256sum] = "c2ccc108bbc0b1331bd061864e7cd823c0cab660bbe6970e66e2c0614decde36"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
 SRC_URI[openssl-0.10.68.sha256sum] = "6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
 SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
-SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
-SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
-SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
-SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
-SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
-SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
+SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
+SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
+SRC_URI[pyo3-0.23.2.sha256sum] = "f54b3d09cbdd1f8c20650b28e7b09e338881482f4aa908a5f61a00c98fba2690"
+SRC_URI[pyo3-build-config-0.23.2.sha256sum] = "3015cf985888fe66cfb63ce0e321c603706cd541b7aec7ddd35c281390af45d8"
+SRC_URI[pyo3-ffi-0.23.2.sha256sum] = "6fca7cd8fd809b5ac4eefb89c1f98f7a7651d3739dfb341ca6980090f554c270"
+SRC_URI[pyo3-macros-0.23.2.sha256sum] = "34e657fa5379a79151b6ff5328d9216a84f55dc93b17b08e7c3609a969b73aa0"
+SRC_URI[pyo3-macros-backend-0.23.2.sha256sum] = "295548d5ffd95fd1981d2d3cf4458831b21d60af046b729b6fd143b0ba7aee2f"
+SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
-SRC_URI[syn-2.0.71.sha256sum] = "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
-SRC_URI[target-lexicon-0.12.15.sha256sum] = "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[syn-2.0.89.sha256sum] = "44d46482f1c1c87acd84dea20c1bf5ebff4c757009ed6bf19cfd36fb10e92c4e"
+SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
+SRC_URI[unicode-ident-1.0.14.sha256sum] = "adb9e6ca4f869e1180728b7950e35922a7fc6397f7b641499e8f3ef06e50dc83"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index b9b3d5f314b..8eae2c3cbe9 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "ff6a885265f484e8907277614b73e9c774b01658623ad763dde2858188e486b4"
+SRC_URI[sha256sum] = "106228766c45b9a5ffd1a8b3e254f0560c821da79d5cd7fd113a17e3753580ab"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 484dc1129af..69329ec9545 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "315b9001266a492a6ff443b61238f956b214dbec9910a081ba5b6646a055a805"
+SRC_URI[sha256sum] = "cd4e834f340b4293430701e772ec543b0fbe6c2dea510a5286fe0acabe153a02"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 4dcaa5d8d46..b9659eb059a 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From e12a40966069083ed0a3dd270d9271f9cd5a5941 Mon Sep 17 00:00:00 2001
+From b8d6e70280367b84af1fc776d35554ffd6996994 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 03b178d..2ddcb48 100644
+index 949d684..8c62432 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -117,7 +117,7 @@ exclude = [
+@@ -118,7 +118,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]

