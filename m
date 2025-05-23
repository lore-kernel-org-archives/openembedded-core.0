Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A310FC54F47
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.40729.1747972363471784789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/yvIwMA;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af59c920d32so5307177a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972363; x=1748577163; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCsYQ+kUL2uzOQ8xc2VHYHnvTgPN78srUJ1ilhnsoH4=;
        b=J/yvIwMAvLpUZ7HQAaA5FWkVqA8yN4cjXPvusBEM/NMD+kRD8w/GOuFPzpayqfxckB
         L2rkLSlcdWDQqjsDY4Z9kZpwYzCnJlny2xap30LegxdUPzhk5xT7J8CHUR/zsEF6gdf+
         7OsLMydEyaa19JmF0uHVQdQdmPfiepjzn8clpXsWCUmYfuUK9SEEEwemuaWHrWBZ2FjI
         ODv3sxnlaLi6p+WdZ9CgbeAd9z2qla+mv5mvfnyji8Cf1+tCa7/sWvn/TD+tYnuK0FI4
         +zu3JlAj61cCT9bOsp5qxLDKU3DGJ7rL6+HnTNy7FnNlvtRWEzkYJRk19cadMJD6py4x
         Jg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972363; x=1748577163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCsYQ+kUL2uzOQ8xc2VHYHnvTgPN78srUJ1ilhnsoH4=;
        b=PXrKPYocxrgDTDh/IfSpMD6pR+3jfX25bwn8bjs8T8cIe4UY7BBaLOe4AfmkcdnI0q
         Xl7YMxPN1MsTYb/TFfRHLKh3zBekL/jvZ5IXYcIpK4+jpaQPZmbQ1h8VUj8fxs9wE78O
         cn3iUYLpC4/k1C3rFK1mHOUNIDUv0hFJLJ7DPhQU2y3vNkBfIq0vFnLACy466HUNjtsg
         QtfG49sHbyY/lLX7XNjtuklRpJK3Uex2YG6SC9uJ5/j8hFjyMnUjZdI7VN7DazVz8sZ/
         qDzIw1xje547TnJP8P2/uv3w0yzS57QzIrHMDexmuXn2ZidyebnT51BKhSSXWV9WVP7g
         DFnA==
X-Gm-Message-State: AOJu0YxUZitvTCopNby5TSV5bpiyW2TnA45H9lH/yp0BGFGNj70H+2r2
	SHo1QK768vI2uJCX07WXf6bMzj6LoIKO691HLRbM6fo5TU/fB8CzZFZ/v7JQI+yt
X-Gm-Gg: ASbGncv1RQLwzLurtGDIKv+5oZnzL7bNWOtVZDhq43F6kWUdYLv7tfOSL0WrNyG9TLF
	ZEpt0WikeTByNim6GcS1T4cyJqtWA+7S4hhTCmupb0DA6x2ZOO7jDOsC2vAq7zX2EU97qvRL1/l
	JDJ7wNR/7nB1CjcOWSjacwXpgxObTWnD/FHE5df7G76F6TXYkJrvZNFoYvofVQhyK9pwMmhEA54
	JQV+YYHK47+AyNEsBRoO+Ti9gXEJi2WHUqoupyPaUAFxxDctvbf96dkLFya7hS5F4ycFjCojHqy
	zLCZ3csUeJRdTiMNtkpgBA4VF80EfaTdWT/gWdX76UE=
X-Google-Smtp-Source: AGHT+IE46xq3cAPxkFrd+zG2xUM0MVHpH2p56rffMGHtmSdUJT9gcIPL3cfHoZGYzi8VNWEz2W1G9g==
X-Received: by 2002:a17:902:d4c1:b0:223:54aa:6d15 with SMTP id d9443c01a7336-233f21ccb31mr22926205ad.12.1747972362800;
        Thu, 22 May 2025 20:52:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:36 -0700
Subject: [PATCH v3 02/13] clang.bbclass: Specify ldso when using usermerge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-2-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217162

This matches the expectations of distro setups and clang's understanding
of what the ldso should look like

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index e35e0f0fb1b010dd0f770b749717370041e0ba0d..6cd150cbd146af82aee89467c176d800dac95c70 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -23,3 +23,8 @@ PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "clang-crosssdk-${SDK_SYS
 PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
+
+TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
+
+LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
+LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"

-- 
2.49.0


