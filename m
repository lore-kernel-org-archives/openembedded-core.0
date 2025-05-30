Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E230C54F30
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 06:16:13 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.816.1748585768050831661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 23:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f7UDTeCV;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2349282084bso21571365ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 23:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748585767; x=1749190567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVAsSFLY8cZikeuq0TuAFbQguQ4eH27l3hk9kYtnN54=;
        b=f7UDTeCVxBuyjlHNpjlFWhHKrkIIEGG4SL6RAucs+hZz3q8CQMlXbZN4sfGTQRzMi5
         O1nBwm7Yfj0M40LCRCTr13afLbbgTYWKtTtjorR9UMWU0durSzBkIlTLcMxSKEwN9hoK
         g/b7BmERG2Ip6Y53PTQEDE8OX22Q+KTU14guvzl92UXdZkfpgSaoGDv41ZHk6BV2TTa3
         s3gMi+UEAkHatQr1c/Sik+Uon59ilHdK3kJrgrjoerTbVxEes5QFIA4wkgjJMDCa0Sb5
         f/1bGKXzdLfoxLO+F4kyZtFPrn+LwgvXzPBGv5Lz6E5LfSZ3GHAhBwK13nJcIYAZXUrR
         6IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748585767; x=1749190567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVAsSFLY8cZikeuq0TuAFbQguQ4eH27l3hk9kYtnN54=;
        b=lfG/3F4Bz+CuIsE5xhKO25YSKG3WFT5G19ONZz1LQXvflRM7noGoGVOjkCu14jy5KM
         PPZxOQb0HsUJ0bjsxYEskME8nJXkrK4xGoYNa6eH2vk1TGx0vC5EkoAiZz3HQHD/EL5D
         ZpqWQYNnt4LRpNro7axW3B1k0KYkIShV96veMKe7fTuAUKDxHUvhVrZz1P7mY9i9d2N6
         01g37thMLQBQV+7+pSsFk6rHZOhRD0PQ+OwevDTZ6DTxQqH1b0Ij4Jfm3xNEFSNFtzhW
         EfJum4wK7rim9W8H4AZbDNvEVorGWTuaVIbKEVQPzdpCuPnbgiMf06011BybZBP0zjAz
         zH0Q==
X-Gm-Message-State: AOJu0YwNqV6vJK272kY0Nf/hDTxa9HvINZiQPtBoWQX5G8yJ2JY0O4Sh
	5eZk7p+YA7ST7MuEfYLV2Q+foDGAMUNQEv4NFlMBicahfH5MWdUWBBseoZifkktt
X-Gm-Gg: ASbGncsLs/fBpdfCCR74YD4zc+aHNyDswSljArqsMwboS71NYsDX3ICZCnElygflpKu
	MQSXdigMH2VLwlfaGxdNXmtyVj4azgW01clZN+B0jjiOYMXw+PnIvLyhw3crqcjRDGsqkCigu01
	xQC6EvJIieUIAPYU06dG6A9POu/xvLJ5bzAjRQ8LEx4q6vT1BOhqybXJ9kUkQ5JJj68e+os26cG
	IVTBfIPSD4LSTji5ZmVuvLv04LEBvSnvwW99bEAoDezhknIeacy8R1mk5273jO4uS/mWa6CEhN+
	PqDpogje+Ok8UdpKE9ARGJmG89EeeZ8ZmjqVrmoGXdw=
X-Google-Smtp-Source: AGHT+IEriShTSO9bPjzE/eB5mAAhIGeNPG1YpkX3AVcg4r5d0R5xhzEVddifNk1hfFU2hWENPrL6ug==
X-Received: by 2002:a17:902:cece:b0:234:8a16:d62b with SMTP id d9443c01a7336-23528eed622mr35225985ad.12.1748585767212;
        Thu, 29 May 2025 23:16:07 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14ab2sm21347405ad.233.2025.05.29.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 23:16:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5] pixmap: Enable openmp support with clang compiler
Date: Thu, 29 May 2025 23:16:04 -0700
Message-ID: <20250530061604.2401313-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 06:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217465

pixman's meson detects openmp support and if it finds it in runtime then
enables it, this happens for gcc via gcc-runtime, however for clang, it
does not. In some cases e.g. mips it enables it during configure only to
find that clang can not find the libomp during linking. Therefore, add
the dependency on openmp when using clang compiler. This ensures consistent
behaviour across architectures.

Disable internal assembler on mips since it can not handle the inline assembly

Turn openmp into a packageconfig

openmp is not yet ported to all architectures e.g. RISCV32 does not have it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
index c1c71fd4202..64d015e3406 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
@@ -23,6 +23,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 
 inherit meson pkgconfig
 
+OPENMP ?= ""
+OPENMP:toolchain-clang = "openmp"
+OPENMP:riscv32 = ""
+
+PACKAGECONFIG ??= "openmp"
+PACKAGECONFIG:class-native ?= ""
+
+PACKAGECONFIG[openmp] = ",-Dopenmp=disabled,${OPENMP}"
+
 # These are for the tests and demos, which we don't install
 EXTRA_OEMESON = "-Dgtk=disabled -Dlibpng=disabled"
 # ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
@@ -36,7 +45,7 @@ EXTRA_OEMESON:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEA
 EXTRA_OEMESON:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
 EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
 
-EXTRA_OEMESON:append:class-native = " -Dopenmp=disabled"
+CFLAGS:append:toolchain-clang:mipsarch = " -fno-integrated-as"
 
 BBCLASSEXTEND = "native nativesdk"
 

