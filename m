Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FECC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:57:16 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.24641.1752677831614895075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 07:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SCDuqX8V;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae9be1697easo189757666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752677830; x=1753282630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RG76kRrXGox1Sp1oPMq4H//XQJFrTKmaoUNx/nrvQUI=;
        b=SCDuqX8V5IQksVPIsfG1gx1NFlww6jReBvvkDjWKsEfXOneW8JwU9fNrX5YqnVPRAX
         EuhsMw0nePHShuyfXtV809vbfSqv7zoNGLCxAkW81SfljvX1dHbzUuLTMPCeraI8SsUq
         qaqGJsTG8By2XXkl6pbAV9vnPCCdtRVRGSUu0sgZ5axVkz+JtSEGWaAtJPWabAYU3sJ9
         EOshFNV/k0I7N0SqZseLFYGyqZtOM5uxZMLfJ2F3aESs2DnIC62bOqVes3EqyDt/4Gam
         ksSvxoZiLdJJfxaW4f4T9vru8ktabyC+OxWFcMH+NaUfruieFq2weTLrNfCV7zgikI6T
         7tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677830; x=1753282630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RG76kRrXGox1Sp1oPMq4H//XQJFrTKmaoUNx/nrvQUI=;
        b=rKUM1Vdt/4Ho/u2RW/lvnQ2CDe22Tu6TLCaQIZz328ZLFkr7IGrmy0pO7tUbg0kJZR
         XCmbtQVFXiUfZkwucG6GVWfN5rUSzpmhJDDyiRVQgzDh8biqGfvi7W/bGiK+/nveQJSJ
         nQHqlDSC4EnblCkjUjT1GeRfqAD+BHPEsg7LGZlGi9XFy5CWnQPrFHUu/UHNONa5kvqg
         850ypy2GTJR67tJKKvQwbpYOsELmK/YYgDBwE71IDhnIn8h4E30kSUC1S6tTTNSO8uBn
         hp3GRtNDuxzWDW3Jr0h7MmFpDFAYBxF6itKcIh8lfoldNLHqllQiC39Ps00p44uFuFzK
         MhHA==
X-Gm-Message-State: AOJu0YwGkMbLlMBSF1gZ3wlB52Z+KgWku/CZ898BSiUMU7sH7UhDblpS
	4wkwCOxEmGOHwUcMYWywmGagirTWbneLWXZhZE43m3zw8PAS/Z/azH4wuusn8Q==
X-Gm-Gg: ASbGncu2x2Dz+yom+yv+3pQdy3NDriqhTW+CxnZ9X+kis6H31ly+KxITAl1Wib2Jcis
	e7Va1QnHtwwsVKOD/wTE2YjiQdat37IzzO80gPMiz+g3d1ls6ak5mD9D7F+ehvmHTOHKC9o6T/z
	30BogWugpqq7fXn8qhmGdy9NRviASRdOIVyls0uh6R4Fyp3S80lmjPTlu6o8R5fZ+4olBwyd6EI
	M0Zl94/Q2ct0lNKZatSgZf+WeiKf+JfnoMs5iuyxNCZOoSKZ1YRLpQpCCgo7WJZnSpbAMU5fgE9
	8OWXsksFgDKS+CZBCHQ2/fY803cHAIZxZXaK6f8/OFo78ZNGzr6EFCwHFZUKigh4uDh8q7OFp5s
	h5hM00G2mYEzYZVcibAdxuAxvvOGXMA==
X-Google-Smtp-Source: AGHT+IH8QwSrSidjeN8mVzG4C+4yEMGt+G18OK6SFFjDD9WfXw0DaxsSmLVDv13RcQN9w0B6xlDkvQ==
X-Received: by 2002:a17:907:6d29:b0:ae9:c75c:d84d with SMTP id a640c23a62f3a-ae9c75cd9d8mr481240766b.14.1752677829532;
        Wed, 16 Jul 2025 07:57:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264613sm1218995066b.91.2025.07.16.07.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:57:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] toolchain/clang: handle big.LITTLE Arm SoCs
Date: Wed, 16 Jul 2025 16:57:07 +0200
Message-ID: <20250716145707.2271609-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220467

clang doesn't have Arm big.LITTLE specific tune options - when they are used,
the compilation fails with an error like this:

aarch64-poky-linux-clang: error: unsupported argument 'cortex-a72.cortex-a53+crc+crypto' to option '-mcpu='

To avoid this, in case a big.LITTLE SoC is the target, select the tune corresponding
to the LITTLE core.

This has been lifted from meta-clang, extended with cortexa73-cortexa35 which
was missing.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/classes/toolchain/clang.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index d7b8a3657c..b0e284be84 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -34,4 +34,20 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
 
+# clang doesn't support big.LITTLE tunes, choose always the tune for the LITTLE cores
+TUNE_CCARGS:remove = "\
+    -mcpu=cortex-a57.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a72.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a15.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a17.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a72.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a73.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a73.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a75.cortex-a55${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a76.cortex-a55${TUNE_CCARGS_MARCH_OPTS}"
+TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa53 cortexa57-cortexa53 cortexa73-cortexa53", " -mcpu=cortex-a53${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa15-cortexa7 cortexa17-cortexa7", " -mcpu=cortex-a7${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa35 cortexa73-cortexa35", " -mcpu=cortex-a35${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa75-cortexa55 cortexa76-cortexa55", " -mcpu=cortex-a55${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+
 TCOVERRIDE = "toolchain-clang"

