Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8296C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.31722.1742141562494758764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M41B9F0N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf257158fso8120855e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141560; x=1742746360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52neXqWFsyZnV2CZkmMVWPFMRhF2W90ehbOTvJ3AQIo=;
        b=M41B9F0N0UeI9qJx+EMJ70h6IxKAE9A8++XlS7K+XsoryQwKB7/MnMfwDuSq0Uklbf
         DxQKkTYlkdB9HMGmvT9yl8Pcx6xw0lE79gMXBvee09BxNpnGW5r9MTbbkaEMGsILVJBe
         RA4bnkJjmyosB9b2jFj1Vho4XbzMsCmHtVVWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141560; x=1742746360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52neXqWFsyZnV2CZkmMVWPFMRhF2W90ehbOTvJ3AQIo=;
        b=s3OsH+r9Z+4tilFb+/bjmxU3p/WiuZi4YhFJ8wRxeXEny5lp5/oSV7TxLIGBLZFGN8
         Tm9Ow2i50+f4MsBrO71iXkK+5dL+jCfOtmU0y4MRYLkrjKqV+5OHZVShMPvagCrFX9YK
         niCJPnbT34333naY3yqDizRK6WMqaoRF4rNf0XhQu36P4t2cH6Hwu5Maby4uvOwJ0ElW
         q1i7qkijX4+3fx4TM+vsoaDW1Rp/QxVKL6QnlI4DZNw5H5f1/OiYQuP4cnwM81ai34oW
         a+wgE3c2ORuHoGNxH4Ez9wdfyQGch5/EFdpLUENqYTLhEwsDYV7rsGCHw9m8hSvvK9G2
         ou7w==
X-Gm-Message-State: AOJu0Yz/PIsfNij/6c+EyIXW2+oeYcvV6OH4Z36FA1vPJ30vmLoDyarl
	Ye3QQyNa+QoOFeDP3kfZchx8wrVLbY5WvtNxC8m2n5fkYhkBBt1825U9zOSQKLkatsd6W7mgqIo
	H
X-Gm-Gg: ASbGncv/9j1dLt+ULOMLQFp+V8wh2xQrcEuHtrhjhLK53VsiwGHbYg1dB3HcB3GYqkv
	5IGl+MuErDjoukBdSe4S16LUyHRQTJeiXdOy3t3iwXC9OmxAHV7tmuNJlDpkwY4FQeCjJCG0zXs
	/SkkKvnhNlDOBXWuOrjdpTFwdL7oddYLZoKP0sU5TBX/PHn0BxlVSWtnZzkyvWqsrgYyDgWK3ew
	PrL9a2dSQAVrWxBkNciTF/s2wMMX/c8PplzQJyXdbUnoy8tfMDs4TTCtFLAZQ5VcBgU1bvXMsUI
	rFWwu3tPMgm+2J+iU9ADiiA5IK0TUYM5devnt9OZAToFKwl5pGNHpurn17+D2nKzcGzTLrUFBA=
	=
X-Google-Smtp-Source: AGHT+IEMeXELxHJ0mycAZvqvjWb7f5kEj83O7DJ4/3I+9d+iuqWoWZzJfSdQX1JzbpBxQDfNUuAYEA==
X-Received: by 2002:a05:6000:4027:b0:38d:d7a4:d447 with SMTP id ffacd0b85a97d-3971f9e4866mr11007508f8f.34.1742141560318;
        Sun, 16 Mar 2025 09:12:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/43] python3-cryptography/python3-cryptography-vectors: Upgrade 44.0.0 -> 44.0.2
Date: Sun, 16 Mar 2025 16:11:46 +0000
Message-ID: <20250316161209.3629986-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213023

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 20 +++++++++----------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  4 ++--
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4220c7d62ca..368a364cf0f 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "44.0.0"
+PV = "44.0.2"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 18f346aed49..b3aa66002e6 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -24,11 +24,11 @@ SRC_URI += " \
     crate://crates.io/pkg-config/0.3.31 \
     crate://crates.io/portable-atomic/1.10.0 \
     crate://crates.io/proc-macro2/1.0.92 \
-    crate://crates.io/pyo3/0.23.2 \
-    crate://crates.io/pyo3-build-config/0.23.2 \
-    crate://crates.io/pyo3-ffi/0.23.2 \
-    crate://crates.io/pyo3-macros/0.23.2 \
-    crate://crates.io/pyo3-macros-backend/0.23.2 \
+    crate://crates.io/pyo3/0.23.5 \
+    crate://crates.io/pyo3-build-config/0.23.5 \
+    crate://crates.io/pyo3-ffi/0.23.5 \
+    crate://crates.io/pyo3-macros/0.23.5 \
+    crate://crates.io/pyo3-macros-backend/0.23.5 \
     crate://crates.io/quote/1.0.37 \
     crate://crates.io/self_cell/1.0.4 \
     crate://crates.io/shlex/1.3.0 \
@@ -61,11 +61,11 @@ SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5b
 SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
 SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
 SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
-SRC_URI[pyo3-0.23.2.sha256sum] = "f54b3d09cbdd1f8c20650b28e7b09e338881482f4aa908a5f61a00c98fba2690"
-SRC_URI[pyo3-build-config-0.23.2.sha256sum] = "3015cf985888fe66cfb63ce0e321c603706cd541b7aec7ddd35c281390af45d8"
-SRC_URI[pyo3-ffi-0.23.2.sha256sum] = "6fca7cd8fd809b5ac4eefb89c1f98f7a7651d3739dfb341ca6980090f554c270"
-SRC_URI[pyo3-macros-0.23.2.sha256sum] = "34e657fa5379a79151b6ff5328d9216a84f55dc93b17b08e7c3609a969b73aa0"
-SRC_URI[pyo3-macros-backend-0.23.2.sha256sum] = "295548d5ffd95fd1981d2d3cf4458831b21d60af046b729b6fd143b0ba7aee2f"
+SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
+SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
+SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
+SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
+SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
 SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 8eae2c3cbe9..075115f3f9f 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "106228766c45b9a5ffd1a8b3e254f0560c821da79d5cd7fd113a17e3753580ab"
+SRC_URI[sha256sum] = "ab32e156b6e7eaf6d8c727a32245967dcce049487301482fca38c0c5fdc84e4b"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 69329ec9545..566e80c4f98 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "cd4e834f340b4293430701e772ec543b0fbe6c2dea510a5286fe0acabe153a02"
+SRC_URI[sha256sum] = "c63454aa261a0cf0c5b4718349629793e9e634993538db841165b3df74f37ec0"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index b9659eb059a..19ade60c035 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b8d6e70280367b84af1fc776d35554ffd6996994 Mon Sep 17 00:00:00 2001
+From 682c99345a7c8cba87e9cea1187aa007eed962fa Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 949d684..8c62432 100644
+index 13d8b2c..e93dee9 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -118,7 +118,7 @@ exclude = [

