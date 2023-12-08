Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9865C46CC5
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:59 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.11246.1702002834002646573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RMeca3oN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5c5fb06b131so1191333a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002833; x=1702607633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYlzdUCflPgalEV6mKxqJf2Ex9L5WQ8f25frPDaS+1E=;
        b=RMeca3oNFF8nrfFv12xLjZJAX0nnXK+iuGBEwZELSo++U0yR4o0xK33vb1ZGlvDXhf
         oMK3eHrk8deGTnXsyrH84gnLf5F/wrH4qJl5L0wWNrnN2BnMqnj8eK1MgyqNuA0ERc6w
         MDqizvW253VSgDhy82Ccsg+Mk79DwKMPn+lHuLubkpDSdNjXVY+5S42DBDAIj7I+F8Ys
         eJ0VeMe6H0EgjmhxR1Ea7/v7SkpRaGWMDahK6bC1vqFpV1sgSVTCQ7Q/rhlktkg62F1e
         Jb+WvhROFGXHKvg0DeK8MlEjScsuvZ/6MRtIXGoueIl7sdrDFhIvtw4aXafTBXBcvsOF
         oxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002833; x=1702607633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYlzdUCflPgalEV6mKxqJf2Ex9L5WQ8f25frPDaS+1E=;
        b=LodzRStfkx+/otfF9umQEhhwHaZ6GQeDOcxXIQYyw6Ya3B97XPU79QiXZiy2IriOAu
         44CCKsJqBse83mFV3hUrovivE6Nux2Fm+f92A6dntFsb9/unkE3ul/xxo4PF78XB+xNO
         sp7RTd6HFvJD0n00dAe5Esut94g0PbfEcUt2TsV1g4LkR6+xVrco39aNqKrXHkUv/kyY
         IEOQlkFnCN1mbx2RyYkBdfMS6TXh99nXbRHP+sqYyWZH8WrqkHJvgPk0VWJt5lzt3gpG
         vV9GHpgYcX0JEtzpZLFYIedR82t/u7/cn+jPKtRO7CVRI6SbDkiSQewYan9JXVnQLNTq
         dyIA==
X-Gm-Message-State: AOJu0Yx8AhgZ9khUYrN8VyMBjuIqsCueDyu26cN+sy1EjvjyAsVmCU8b
	jTJRXYPoCtEmm4sqhinV4vwvgFGQlrCKaMxEx1Y=
X-Google-Smtp-Source: AGHT+IGmKv9Q2hwi25l3iDZE9sa6hqzwsjPxHvp/CgCiBiYinKmSYVTDrZIXCxlKJoEymR72hySI3w==
X-Received: by 2002:a05:6a20:2c88:b0:18f:b99d:df9d with SMTP id g8-20020a056a202c8800b0018fb99ddf9dmr2377808pzj.120.1702002832725;
        Thu, 07 Dec 2023 18:33:52 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] rust-llvm: Allow overriding LLVM target archs
Date: Thu,  7 Dec 2023 16:33:16 -1000
Message-Id: <93458c302938bf704e8e9f14dfdfee57454adf7a.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192002

From: Niko Mauno <niko.mauno@vaisala.com>

Move the default value into a variable which can be overridden to
match more accurately the use case specific scenario.

(From OE-Core rev: 645370e85d8742d0614cd52ca7507b5df2d38ad8)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-llvm.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
index e645e7a7ac..416a07cd40 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -25,9 +25,11 @@ CXXFLAGS:remove = "-g"
 
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
+RUST_LLVM_TARGETS ?= "ARM;AArch64;Mips;PowerPC;RISCV;X86"
+
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=Release \
-    -DLLVM_TARGETS_TO_BUILD='ARM;AArch64;Mips;PowerPC;RISCV;X86' \
+    -DLLVM_TARGETS_TO_BUILD='${RUST_LLVM_TARGETS}' \
     -DLLVM_BUILD_DOCS=OFF \
     -DLLVM_ENABLE_TERMINFO=OFF \
     -DLLVM_ENABLE_ZLIB=OFF \
-- 
2.34.1


