Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC92C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 05:56:42 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.69805.1746511000350042935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 22:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gf/khVAU;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2254e0b4b79so78368645ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 22:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746510999; x=1747115799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHUmY7woBvtvxH/Xmsas+EYQlsCJn3OK6wEEjU0c7DM=;
        b=Gf/khVAUtMSrCpROgWQLWzrtOJqIZ+6pA9PJznoJXE8TsbtniC0Mnvq5PgVjvZUSPW
         nq3Lqs2n2Ziq/J0T5NcA3UJHteAW1icyHNKrGTkLOAw5OY15kpv8IAr9Ev44BwI+zo3P
         Gg9pn8hSjBQcMwGPkfht9dEXVoZd9ScaZXGsWcEo5Tz3yxTYW1U2DUB5ajH0hKM2aYWq
         /xVqwZuz3lZk2XNDYcBXeZ6bw92MpQXoPwLeOGK0Xg4H1+BcEA/5FF+CGTEnMJ6k6Egl
         wtvFrw1vprEidnzdnz1i91Gccc1d+R3zjwpi0BN+5O7/1h9dK7DI6Fy3SyruAmr0vwGb
         FIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510999; x=1747115799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHUmY7woBvtvxH/Xmsas+EYQlsCJn3OK6wEEjU0c7DM=;
        b=a+dkVr/30PPP5OamSml/DsCsIluwoxKXJu12WUhCZyCNoT9ZhMD8TYR3+EfPuBn5+t
         UBgddn3C42JbBJNJ3CqAp0oyW7n+awGTR5DpVBydlFzzIR/p3ZPxVvi1BIRUx+8gBKzT
         XEZoevjBfAFz01npb5ltL1LRNjAWjJjai+bp9qSFn43gCWS2wchoxVjJSSczUrw1hBDp
         N+fljha+JTStaqZkmlvuZ+KwYtxSV6/KXwOoImEKtW4hOoifnAGWLAQgquPcdlpodZdY
         R6trx5HFEfGz/+AlRJ8pdXLcP6dzyv9GPqTsjR4qSIc96PEpNtIdiIh/EKRlca7dUds5
         CY9Q==
X-Gm-Message-State: AOJu0Yx1wh9KQMYoXpPe7QRh1Gwxi89nm0XixP4hqOTNx2AurogUgB03
	vb18Jk3XOaT2U26QizE21c54ldHyE+6saIQdKzepNlZN79pCxpN66Rdj3NBo
X-Gm-Gg: ASbGncsFJtAxfxSj0jkTuoiDeJO2TqyrWy0VPa5QjFql65EAh2vR5sblhI9eXlR00K6
	f932syNW2511T3t+MVu/+9xzPxbAe05rWKJJamKasRMZOIneMQavPuZN7FQktqpz8p+AaxLscR2
	3WZb+j5jAD5usCvNTUde4+J8NMEiKwFY13lnhYTj2Kl73ND6DDCx7eT3rB8O9fQYgt2R/1UO/Iw
	3SNDAtZHZ6mwFGfWg3Ept4Nat/N7gVTl/86F/2f5tH3b+cESyH21yiSDbs4oKOiazhwiKnCl9IJ
	Sfkslhe6QgoEciyQj/Z38B5xglYHBLAT
X-Google-Smtp-Source: AGHT+IHMDTGQVGRqcmtBlPSh9O7YcS9fqar7tdaelDt/48NRDo4Bc+z1cR3ZIL+EEX3Y07GMg0V+zA==
X-Received: by 2002:a17:903:1ac3:b0:223:f7ec:f834 with SMTP id d9443c01a7336-22e1ea8f349mr162291695ad.31.1746510999249;
        Mon, 05 May 2025 22:56:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e173b584csm60116725ad.16.2025.05.05.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 22:56:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] compiler-rt: Always use clang for compiler
Date: Mon,  5 May 2025 22:56:36 -0700
Message-ID: <20250506055636.308430-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 05:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216029

This makes it build for all architectures e.g. riscv/mips/ppc etc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 93928541273..8b2d42e1346 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -52,6 +52,9 @@ HF = ""
 HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
 HF[vardepvalue] = "${HF}"
 
+CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+
 OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"

