Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054B6C677C4
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:58:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.56081.1749463133714460365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OmdRsGpO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d3f72391so54714435e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463132; x=1750067932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBEtAt9u/9IGCU4cbtBYHyT4NPNkIi3vzvy65oIsaUI=;
        b=OmdRsGpOunmbTSItMdU006sB/WoFaIkIy0j8KfEnCb1dcgPf41qmB1omsbgvd67EJW
         2LHBmrNS0SHze2GDCA1/iQOpkZDN9M2NfsmGIcBzmEXkIMNAdIu2NuLpjIr+c4Jq00QJ
         KebmrDSFZETpyLTl67ZUYFdR3eyKD6dJpkmkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463132; x=1750067932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBEtAt9u/9IGCU4cbtBYHyT4NPNkIi3vzvy65oIsaUI=;
        b=R9uVMDDxgo6UKH+mxWzHEAdKUTDrlA10gaG29l8KJc+MtWzSUAWKYkuwA98xtghWkh
         5Qg5ctm5ZUhQoDAe7hKctCbyK0dud1YG2R+tdNFKB9S+LTz7u1KYwo9MJ7W0F8XDtgBF
         JJhjihELu0K+df7ZeqKKqQ30MlMPbhIrwOxv3rzNtRDiwk3KlmaFrGtMUeUGKM3/5g8O
         miq9szuz4wMiRRUBkpTmog/QOW3v6ueDmU02OSVs2hF/7m+wwpflwVAjBUAp/ORCNunB
         nlm7jQGxtELnvnrqO2oq6dUzXtKSByLJp4XEwtQlzIojwDu8/9ZboWNYKk5WmKTnIlkH
         kzsQ==
X-Gm-Message-State: AOJu0Ywvtd363FRtsxqKjNL+kilVUYqG2CqX1qXY49+m52fVij0A/9Dj
	HdpSFG2WJJ1Hznm+ssmtQ92b/Z923yXSs9Gj1qOs9axv6tN1qq2LBJ6qLJ0+KRHfx2/U8JDSOhl
	f+cmh/zI=
X-Gm-Gg: ASbGnctuf7LcHUt2B7Q5VjfocrLVvn3erjfDj4b5GIpWA4I+2H3n6KxN3LASlNi4Up3
	FDxEp5CzNaLMRPd/HuT+NichxoCeXCg7R10Pbb75nP+EjGioxCUa1YP8+pc4EyxNxHuGgrD+I8q
	ZYjGV1qG5FO6E9vhFPjJLBeuywQM5S4VGtRPUktIT+dp6HXy4uFBPCVND0ggef3/iQcD1tbpG6+
	UIEWtJ00d3dNzonoSptqFufL5Z+C+RTJj8lzpIaGRx943kE+1Vij9G5L4UjdE1aNn7wWJ1vGpbt
	ZqtlFw0HZJaF+g1x9b+JGc9eNoyrSgUsEX5t3rAKc2y0d0zWs/nkpXpZHV9/lLU1XcMibLY0Cn8
	GlAjk
X-Google-Smtp-Source: AGHT+IGYf9cX+36tH2Igyk2EJY+UA4yD0CseUw842yLKUzeZFenUwvRlK32+kzbVhQkfSEo35Ol1ZA==
X-Received: by 2002:a05:6000:2485:b0:3a4:e60a:c409 with SMTP id ffacd0b85a97d-3a531ab6daemr9550663f8f.41.1749463131752;
        Mon, 09 Jun 2025 02:58:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375b60fsm108406455e9.40.2025.06.09.02.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:58:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 4/5] meta: Add TCOVERRIDE for toolchain selection at recipe scope
Date: Mon,  9 Jun 2025 10:58:45 +0100
Message-ID: <20250609095846.937759-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
References: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218254

From: Khem Raj <raj.khem@gmail.com>

TCOVERRIDE is defined to toolchain-<TOOLCHAIN> and its added to OVERRIDES
that a recipe can see and it can use "toolchain-gcc" or "toolchain-clang"
to set specific metadata based upon global distro toolchain policy.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf        | 2 +-
 meta/conf/toolchain/clang.inc | 2 ++
 meta/conf/toolchain/gcc.inc   | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f55237e1de4..61c6a492bcb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -801,7 +801,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 # And finally '<foo>:forcevariable' overrides any standard variable, with the highest priority.
 # This works for functions as well, they are really just variables.
 #
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:${TCOVERRIDE}${LIBCOVERRIDE}:forcevariable"
 FILE_LAYERNAME ??= "config"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
diff --git a/meta/conf/toolchain/clang.inc b/meta/conf/toolchain/clang.inc
index 2bd4a07a867..fab94f0b14b 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/conf/toolchain/clang.inc
@@ -30,3 +30,5 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
 
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
+
+TCOVERRIDE = "toolchain-clang"
diff --git a/meta/conf/toolchain/gcc.inc b/meta/conf/toolchain/gcc.inc
index 36d33f5d6d0..75f9abe999a 100644
--- a/meta/conf/toolchain/gcc.inc
+++ b/meta/conf/toolchain/gcc.inc
@@ -24,3 +24,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
+TCOVERRIDE = "toolchain-gcc"

