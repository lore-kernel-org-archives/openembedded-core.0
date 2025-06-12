Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA78C71143
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:00:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.14016.1749736801585265845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 07:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CPhg19uO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4531e146a24so6699985e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749736799; x=1750341599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XNY8kOK7YPjSvD9xMMolu5NvYia8wEw10XBXajqs0Y=;
        b=CPhg19uOJAlncWgVokhEKzSVZdh33c3A7pQNaEpMYBHW1R5ZptZPLTFNNs8QDHJtR9
         XAbadFe9R+efm5D0X9qzB3KgQJJ9IyVNYPzDX5YFU65T9fTkXtQw82Qn8twgZ9ahTa8c
         k0Ju60pa8tR6A9TbHe4mExPtaS23+4qpZFgAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736799; x=1750341599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XNY8kOK7YPjSvD9xMMolu5NvYia8wEw10XBXajqs0Y=;
        b=QREpzPk/YzxE5om1EcrGJ6J4JBCCA/6tOncNAC63oAbmwIr1nLDQj9pMV6PrUJyD1X
         b/4VcNsCr2JCC+3b4zB11pyOpGXPedFTubb+IbmiGyBsUJ1aE6dO4nbZuikPWeSYLR2l
         X4pVAJMEHQwMTA0wL7lklZW5gZMVBKpxd70MS/wMx4sLouM+OsYJmfmvyM9YpPIEU5Ke
         p+sBmtir66Zs2Yu+w62RqkVlbJFotwxkgkoPFQH7l0W/2b/ywrbXC2v60iauhtvkK8Vj
         wG+AKhBkJbO4BiRJLqB2STzUYfEzfcN3QI/gjXWLlpnFHmdp0RfemYAORBT452n49Dqs
         T0eQ==
X-Gm-Message-State: AOJu0YxCY3PFWLn/sziTR6JEOZQV1yUnIp6pZtamGa8ucLSRMwh1fjjw
	M9oGTpAa/fEnwYp7CHndzlqoukhYH4Ca+1hDNB6Nq064G7j1HCYAe7Rx443jJnQvL+jbnptwHZQ
	nR7F8ayg=
X-Gm-Gg: ASbGnctKwa9Up1HoqYuRIKVf4lSHZe4/vLa2iTLl6cq/XT9TatkJgOH9Yj7g6ZP4Zsu
	IsSUiYG5xtLgx0y1/4121kwd5K2XgviZyT0Ai3+xrRQIKpUl6v9qpspQAbcDNyuLYX3H9R23XWu
	eTdvEqLyEHN2ojQDZ5e17HEOgBJixJKZuh6ytL3Qok2p+jUu9a75cbD22SOqulFWP8VJjUKn/JM
	8xe9hA/p6HqIWSHlFl5CVVuCt9MXsBgeYAUa29LBKO90U5BtWdodeYadVtm3qMLWJFtPvwfMANK
	bZzG1CydIq5l1KImdaBljTWh4DdIkbnG9U2YAAGE+OvIaPbA3kBxLk1WYGeH5HLMRG5taOyJT4w
	hqiJDbIu+zHmYQ9c=
X-Google-Smtp-Source: AGHT+IHVcyptm3jXtGN3xNnB8jqijbQg4f5TYQXqDdPgZEMKckJfegZCwNs8X2MzVc1RL6IqG9prmw==
X-Received: by 2002:a05:6000:310d:b0:3a5:52b2:fa65 with SMTP id ffacd0b85a97d-3a558688d7dmr6695153f8f.5.1749736799417;
        Thu, 12 Jun 2025 06:59:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9e93:4c2d:3b22:8e08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2089474f8f.4.2025.06.12.06.59.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:59:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] toolchain/gcc/clang: Update PREFERRED_PROVIDER to work with multilibs
Date: Thu, 12 Jun 2025 14:59:53 +0100
Message-ID: <20250612135955.1413300-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218523

As currently written, the PREFERRED_PROVIDER entries don't work with multilib
since they are added after the manipulations by multilib_global at ConfigParsed
time. We therefore need to spell out the configs correctly for multilib.

To avoid variable overwritten warnings from the expansion, we then have to
expand out the nativesdk providers usng class overrides.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/toolchain/clang.bbclass | 21 ++++++++++++---------
 meta/classes/toolchain/gcc.bbclass   | 22 ++++++++++++++--------
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index 8a0a2c315a2..d7b8a3657c6 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -14,15 +14,18 @@ STRINGS = "${HOST_PREFIX}llvm-strings"
 NM = "${HOST_PREFIX}llvm-nm"
 READELF = "${HOST_PREFIX}llvm-readelf"
 
-PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
-PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
-
-PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-cc = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-c++ = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}compilerlibs = "${MLPREFIX}gcc-runtime"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-cc:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-c++:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
+
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-crosssdk = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-crosssdk = "clang-crosssdk-${SDK_SYS}"
+
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "clang-crosssdk-${SDK_SYS}"
+
 
 BASE_DEFAULT_DEPS:append:class-target = " compiler-rt"
 
diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
index 75f9abe999a..a5adb5ca372 100644
--- a/meta/classes/toolchain/gcc.bbclass
+++ b/meta/classes/toolchain/gcc.bbclass
@@ -14,14 +14,20 @@ STRINGS = "${HOST_PREFIX}strings"
 NM = "${HOST_PREFIX}gcc-nm"
 READELF = "${HOST_PREFIX}readelf"
 
-PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
-PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-cc = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-c++ = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}compilerlibs = "${MLPREFIX}gcc-runtime"
 
-PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${MLPREFIX}compilerlibs:class-nativesdk = "nativesdk-gcc-runtime"
+
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-crosssdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-crosssdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-crosssdk = "nativesdk-gcc-runtime"
+
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian = "nativesdk-gcc-runtime"
 
 TCOVERRIDE = "toolchain-gcc"

