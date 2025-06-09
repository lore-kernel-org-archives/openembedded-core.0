Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CA4C678DF
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:59:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.55670.1749463180116016557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PGcMEnBq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so53244005e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463178; x=1750067978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XNY8kOK7YPjSvD9xMMolu5NvYia8wEw10XBXajqs0Y=;
        b=PGcMEnBqzvkxoOQYJUlzeA06bICv8d9JLdRzskQ/k0chdU8V/h5kPKbQplRQptQ6KI
         v0hmBwPQSF1p/ZD2maNVMcVadActeRZ2OX4rN43CKIthjJCFOdGWfe3b/m3LVNngxvVl
         RNPVlmIHcCl/9RYbU5GG+XQ/f9z9trJbZ5Lh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463178; x=1750067978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XNY8kOK7YPjSvD9xMMolu5NvYia8wEw10XBXajqs0Y=;
        b=nudAAysXbIKhAVejEI/qughXxB/PS+QXDKXnxkHdwUaiT9dIjWM0pCTI2itfCC0D50
         DWfGXDBruNhnVcJMtLL5iyCiG2XjaTPGOqj30mg+wYAJz5TnnMMxnRhYdszK1oXkDt5a
         VgYX7uODoCRn0oAU4tKti6WntOWhoXLJusOD+nQuzUBkYt5bR4BjpdhN7BWs33sJOGtO
         rDcbjNe5QXd0B+tXdipzyoe24dYhiNJNuPp7pWvpsMdV/rDloH3x1Vm6jMaoM3FxjUMe
         A6rrmCc8fm82Alb5aWI0Vf05t2lRmXmGWzqrZLOecYjMbhDkiM5kRAz3JC8iRDV8b1Md
         BKHQ==
X-Gm-Message-State: AOJu0YwtBBl6xy0t7DYxYhUcpcfZ+8oDpHD9wjj45O6LP0TKq7m4b8DL
	t4w1YXdiOq6gyFQ/PxLOg6Pf0x2Ru3cJDB3QRLcc8N3ebZE2EluewuQbSZunHtw7/cSGjeVpl3v
	CDOsJD/c=
X-Gm-Gg: ASbGncv5YXt2RPxSJtpQ9N7IYwLA0YToeecwM8nmJTA4a4ZL0XXlobu3gpmosPoviaX
	VHCrKGlF8TyCT+vyNYJ0BSiVGns/SLKlM2zZeShFiSfT4VmaFH7OvnadwPV/lzcG14ABwTwWl0C
	i9AvpeNCL/gaPBpBrJmrPx2nRwsr4rsCT24NvmCZzn30KMcJ1USCyBCX6n/62hU5tLZRQvLaHCv
	bfUtfrkxx8Yj53Vk4XLwxg7WOasmMlrktMd8Nbda/EAz7bXKgBi6YjrMftGvrPhLNisOmyQmZ0v
	rfVGjg4asScb2AyM5IHfeRt4z+IH94Zv4Vstc1eXvTM0vIj1tKbkilwrnfq087hoXacB6xeunsx
	SJNtjdcuiEsHSyFiTWWBy+9KXfg==
X-Google-Smtp-Source: AGHT+IHM1Z3ER68BaB4jGupIrPDWQ0rZftbcsoWotT8oPtO3dkU4LalynuVkxk7q5b2A0YxErlsAHw==
X-Received: by 2002:a05:600c:8b43:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-45201427c5amr100648455e9.32.1749463178063;
        Mon, 09 Jun 2025 02:59:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d6dsm106289785e9.3.2025.06.09.02.59.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:59:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] toolchain/gcc/clang: Update PREFERRED_PROVIDER to work with multilibs
Date: Mon,  9 Jun 2025 10:59:32 +0100
Message-ID: <20250609095934.937987-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
References: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218258

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

