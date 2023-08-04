Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C83C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:03:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.2480.1691168585335666687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 10:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VPWCTkap;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bbc87ded50so16226095ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691168584; x=1691773384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O0ZKmXKR0CGwAPKjtvzeRJj/NvwRAVzmbqKruRdWjU=;
        b=VPWCTkapupSNxahaupKbcpI8ye3ddsjjcIL6qRKdPQLC3UrHpowJJ1gZBAIXP0DzAH
         3rWhC0XEXSyOsPtOEGH4wzGLUg4g/Q0zLVMBudppz+cHEPA1QN1LJCC8aci4USgP1Fnl
         G4ZceHvi1j5a9xs/ER3OZVfYjARiMDkuTDXQqNqqMeO2FfLtYewZDxrTM3SQq7tOfxtg
         NdE1P0eXFTFpemNb7A9EchoGaYp2asDLfJOtjDxfZSj7Ua6BhkW0UxHuP28RuEH3pq/L
         YHG7F2i41cOvum4OvWIBC5J92BXtuWUzAmrdoJJ101uOAKBkFYmdDaQYapZutadrEC/+
         n/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691168584; x=1691773384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O0ZKmXKR0CGwAPKjtvzeRJj/NvwRAVzmbqKruRdWjU=;
        b=eVxMEhFclxsNt+CnDbBhk61khIGEa70p5BH19/q6LBJ9TuX3Pltth6YeYxmVDoszna
         6dne8OVa3KypVmZ5tB2tJBfuPm8NNlW3a7xq4TsSUdlTMHeGxTKTlLsYSb527qNNgr0U
         dtGfSbmYZJchOE2cPxe+GgZzErWEb8gT7wnYqrDaECg73JuBLbxTgplPdkJ4b8ePYMgb
         EK/Zw6Mq8wy5gc4BQg9wj4D3EiwJmPr444/6GIJ1KdAbPURtAeAgOPlZdphr2gODDMIm
         HdKqjWGS2a+tusJ8JclJtYdW1YRIxPUAeTKdvBNyzqUi8n/DpG2pCJxpliY3qht8Lgmm
         a/aw==
X-Gm-Message-State: AOJu0Yzua3QTPsT8+CbZ34FaOXaQD5d1vpmYreJGAn/tPdzSnF6iLoK2
	AKPbWj4Yn4g5fLbfkkN4OQJQWAVsXxpuMQ==
X-Google-Smtp-Source: AGHT+IGHO0KlEbNMwLuVhDIch3wgH11tyECdzN5IkXYGJgLdT3xeRj3fcgX37JgDItw0tPZtYQxKTQ==
X-Received: by 2002:a17:902:cec7:b0:1bb:3979:d467 with SMTP id d7-20020a170902cec700b001bb3979d467mr2682737plg.63.1691168584361;
        Fri, 04 Aug 2023 10:03:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902d68b00b001b50cbc0b4fsm1997876ply.111.2023.08.04.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 10:03:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 6/6] glibc: Fix SVE detection on aarch64
Date: Fri,  4 Aug 2023 10:02:55 -0700
Message-ID: <20230804170255.2784609-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804170255.2784609-1-raj.khem@gmail.com>
References: <20230804170255.2784609-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 17:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185537

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Pass-mcpu-along-with-march-to-dete.patch | 56 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.38.bb         |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
new file mode 100644
index 00000000000..7be9fc981d6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
@@ -0,0 +1,56 @@
+From d836f008a96aa9b2e88c7b394bfc110542e57176 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Aug 2023 09:34:50 -0700
+Subject: [PATCH] aarch64/configure: Pass -mcpu along with -march to detect sve
+ support
+
+SVE support logic in configure is rightly passing -march=<arch>+sve to
+compiler to override whatever user might have passed via environment,
+however GCC does not do as intended when -mcpu is part of environment
+compiler flags, then it overrides the -march computed from -mcpu and
+igonores other -march values so this test fails for lot of aarch64
+machines which pass -mcpu that does not support sve. This is seemingly a
+bug in GCC [1], until that is fixed we preempt -mcpu along with -march
+in the configure test itself. It does not change functionality and yet
+lets us through the GCC inconsistency.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110901
+
+Upstream-Status: Inappropriate [Workaround for a GCC issue]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/aarch64/configure    | 2 +-
+ sysdeps/aarch64/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
+index 5e91fab023..39dddc66d4 100644
+--- a/sysdeps/aarch64/configure
++++ b/sysdeps/aarch64/configure
+@@ -327,7 +327,7 @@ else $as_nop
+   cat > conftest.s <<\EOF
+         ptrue p0.b
+ EOF
+-if { ac_try='${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&5'
++if { ac_try='${CC-cc} -c -mcpu=generic+sve -march=armv8.2-a+sve conftest.s 1>&5'
+   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
+index 8a708f2ef4..b6a146d2be 100644
+--- a/sysdeps/aarch64/configure.ac
++++ b/sysdeps/aarch64/configure.ac
+@@ -92,7 +92,7 @@ AC_CACHE_CHECK([for SVE support in assembler], [libc_cv_aarch64_sve_asm], [dnl
+ cat > conftest.s <<\EOF
+         ptrue p0.b
+ EOF
+-if AC_TRY_COMMAND(${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
++if AC_TRY_COMMAND(${CC-cc} -c -mcpu=generic+sve -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
+   libc_cv_aarch64_sve_asm=yes
+ else
+   libc_cv_aarch64_sve_asm=no
+-- 
+2.41.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index c02730bcb58..32ccb888f0f 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -50,6 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
+           file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
@@ -86,6 +87,7 @@ EXTRA_OECONF:append:x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3',
 EXTRA_OECONF:append:x86-64 = " --enable-cet"
 
 PACKAGECONFIG ??= "nscd memory-tagging"
+
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
 PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
 
-- 
2.41.0


