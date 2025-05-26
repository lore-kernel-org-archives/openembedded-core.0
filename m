Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203F6C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 01:12:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.20354.1748221935444641557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 18:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3j4vony;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234549aed3cso4201705ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 18:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748221935; x=1748826735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aAIw0CnvPWTff2f45ml5FdzfWhtDtPYGNBZXyo/XQJQ=;
        b=d3j4vonyW98aAZLa+USz81BO6zKbe0RfrBjtSbbZLp2FScmUeEn2jyUpFIgCHTbRxZ
         15ANAS5J1d+3tLwPP56un15WbNlaRjjGrBTb9sme3+lBHZqnCVSyIIoiB+3nLuoe0WPu
         W00odws8ijJTtRNOkVrlvkApH15Dwhnywcv4RfJ7W67zCXVZnzQF6O/e73zruVQpT6td
         HeyZWcW7bFXbKR2QncdctSoRpa5tcOUPVqRTY4dqtk7PFJCWppcMjbi53whW0FSx1WnL
         WHFrYXxu8zuH7e8brYJPNLNgBCA6djZ7QQSVE6lfRAVuAuLlvdkBsD4Mz7/g23Xf4/TZ
         CIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748221935; x=1748826735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAIw0CnvPWTff2f45ml5FdzfWhtDtPYGNBZXyo/XQJQ=;
        b=Mv6f5je5U3Wnl0cIBs8fkGiDNlj87n6wsNBpF4+v4XnBxaWrZ3HwrQlwQvfxVgSMJ4
         qcPq9WdKlK103uhUtgyYF0xaLKOEPip3DMW8+pKf2Ape/JzhVNX0qOqRa/zO1B9256HL
         X6C38vWNe2wGkBMCBZnPqTYQIfDSPLdmNs46vtvweWVZ5RxbaroPuRC0Ps8Lomkf5XlV
         cgC0SQ7MNCpI6gPyIZzME4fxejReZuTXwhKzYeCziJkXP55Ta0ss1DgG/FisHIO88W2h
         ZO+A85w9AE7eeVShoh3Mffjo1/pE1IjdcFUrdE4VjOLGMtunjwYM5EGnhoBtNfyB9+rZ
         DKZA==
X-Gm-Message-State: AOJu0Yxfob2N/rseYRPIHMs0mDQmtEA3stjya0s4oDeonLTgpvpELcSz
	1otHAPbP9gdXosszagH3jlUn3X3e+Mkk0VVA0zieGPkWfaA9LKjTjbCupFKJ8J7h
X-Gm-Gg: ASbGncvlHldIn1SbkmxTi5oy859fRwhGdey8Nq8oby9sFjptS5EXXprXO93BddaKVJh
	5EVtATHvK+8aOATA5RJuK3rMzORctXtoRsyKKfRZ8nFD2EOs8wA8NR38kJlh09py9crFnnWiz49
	bHhQ62jFeD5G5VIB/cFLHuonf/pubz0yAJ198T25kdX5IzdEaG4JnOKSnCtDYKo53XOzCzmzlX0
	mkMQzrGLrvuxAekrD8omeqUTYAk2QRWA3u6rbVohvCz2vjYSDI+8upJ6+Hb0eRxCU6e3AurtH/2
	h5f1RLICNi5xxUIsG9xJEGqEwuCZDt1ozh9UdI7WLiA=
X-Google-Smtp-Source: AGHT+IHNpkMJQL5IaWqXKqbghPdCsh60OjxyuOdklRoANCDW5bCNZzBuLaJCd3zqYfAQSdaXINc9VA==
X-Received: by 2002:a17:902:e74b:b0:21f:768:cced with SMTP id d9443c01a7336-23414f3abb3mr97992515ad.8.1748221934453;
        Sun, 25 May 2025 18:12:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340c0e72fasm36355515ad.239.2025.05.25.18.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 18:12:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Fix riscv32 multilib issues in non-multilib toolchain
Date: Sun, 25 May 2025 18:12:12 -0700
Message-ID: <20250526011212.1797936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217251

GCC RISC-V multilib does not map to OE's mutlilib concept
extend the fix [1] done for RISCV64 to RISCV32 as well

[1] https://git.openembedded.org/openembedded-core/commit/?id=3081f62c18fcee642ab43efa717c8f71d51ae587

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 2 ++
 meta/recipes-devtools/gcc/gcc-runtime.inc         | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index d9959364c3a..1a4169f91aa 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -149,6 +149,7 @@ python gcc_multilib_setup() {
         'i686'      : ['gcc/config/i386/t-linux64'],
         'mips'      : ['gcc/config/mips/t-linux64'],
         'mips64'    : ['gcc/config/mips/t-linux64'],
+        'riscv32'     : ['gcc/config/riscv/t-linux-multilib'],
         'riscv64'     : ['gcc/config/riscv/t-linux-multilib'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
@@ -166,6 +167,7 @@ python gcc_multilib_setup() {
         'powerpc64' : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'],
         'aarch64'   : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64-linux.h', 'gcc/config/arm/linux-eabi.h'],
         'arm'       : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64-linux.h', 'gcc/config/arm/linux-eabi.h'],
+        'riscv32'     : ['gcc/config/linux.h'],
         'riscv64'     : ['gcc/config/linux.h'],
     }
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index fe1f43b2fd7..c4e1c5b9a5f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -144,7 +144,7 @@ do_install:append:class-target () {
 		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
 	fi
 
-	if [ "${TARGET_ARCH}" = "riscv64" -a "${MULTILIB_VARIANTS}" = "" ]; then
+	if [ "${TARGET_ARCH}" = "riscv32" -o "${TARGET_ARCH}" = "riscv64" ] && [ -z "${MULTILIB_VARIANTS}" ]; then
 		mv ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/* ${D}${includedir}/c++/${BINV}/bits
 		mv ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/ext/* ${D}${includedir}/c++/${BINV}/ext
 	fi

