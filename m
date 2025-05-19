Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC7DC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 18:20:35 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.2222.1747678831545487194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 11:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eq+iuPi6;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c73f82dfso1426845b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747678830; x=1748283630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Sy5fH6OiKa38jrY3vOy5RBk5CwDSgIRnjhnThQqWgY=;
        b=eq+iuPi631JzbkmZeKyNtBlbPiJ195XXoMA0DSBIxwgHZIKi2Hzi7FO+LYJwP+eqwl
         1TVxpQAkYQ2wh57FZVEQzFNDUhwy/MSHkUOMhdCwLsgYLLdT6bAmwOcZjXZ8J/X81Ywc
         iHpJkNUr05tq6degGzzOB9fozOVyrugMDAfa7J/3b8mLTQDXA3ixOsfTf2uSWzIFCVow
         aMMSL0E2tTRB5NNUqS3ksplDIrXK7fg2Y6owfAKHXKAP+r35P+A3nJSdRMNHbS0RfPrZ
         4WQ3XcjKotgkUC0vR5UkCQFqajki4I8icrcj99Iv1JidZvhv1bbh9Jfu+X1OH3AaiWNG
         3K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678830; x=1748283630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sy5fH6OiKa38jrY3vOy5RBk5CwDSgIRnjhnThQqWgY=;
        b=eVXzul5aHc1b1ujG+spIw8l05FTOk6d4xjRrlLzu8CPMXbBdh4cDtlvm6D2nzmXObz
         1mY9kDwCcNoHhX6UK0ufbgDoJ81T+ucw9EKxiVsMQ2Xgu59rgbPc9m3emxKgVTTdkNA1
         TZLHm/GF6OUb0WqEmFARKHyXwUAgK8vv6p8FbqalLWiRzC1aJpBKF9YxMdMMw46KBP73
         lh9ZRxNl65uOAENA9f+YekBuV8RqWu+UPDvyyI5uwxhurs3bZxqQzApWUDaz7JLiNfII
         dh9J9r1Q6dlGG/atPfwab3iZOnTQrv8ikMyFYd+Bya01V9YZcVjcsBItOeq5bS6wdsjO
         mLNA==
X-Gm-Message-State: AOJu0Yzphmrpe8K046FY5wbnwF/Dx95lGd3N66pkF0rFMhUoRrWQFjEt
	jWpGunpT71XbQSslz1+9vIVASC2fr75KeJU8By9xssHaCZuayl6hm3vtAxXliFiF
X-Gm-Gg: ASbGncvJ5pX1ivIMi3bn2NqdAWPWr9t4RdmGK4ocrZT2kqx7I52pSgPHfe5b4vaahpv
	T5Q1Ox0/IVjgnttXXpYTnzmHEK435FXiq4Ln0swFMxP5UMClJFIKhQiMagzsTGju/RoCUPR1of3
	TrVg7TH4ILIlaOY6rzcA4/f0kJ7A5dlfAn4fs3c38F/v0QsvhZyMVroakdGqs89SpW/6lHoSFBb
	H6D4wbEGn2+bhUV+aHhhsIC6t9B0Hx5fB+zyM8uFgxwVj4Mv1vFBg8l/Nzy5Uu2+kNhCPL77hCm
	SjekPXQ49HUrwT7IIUD7IfZPmvptjC04W96c//RQWbs=
X-Google-Smtp-Source: AGHT+IFStrkAEdKo5CVDDBiajY6i0Ble9WuoEe3GnUEP6BhcQxJhoWWwWT7dpeg/Bb0b2BhcxZd9EQ==
X-Received: by 2002:a05:6a00:2da5:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-742a98d4943mr18816074b3a.23.1747678830370;
        Mon, 19 May 2025 11:20:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b7ffsm6755320b3a.104.2025.05.19.11.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 11:20:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Fix wrong code generation in atomic intrinsics for arm
Date: Mon, 19 May 2025 11:20:27 -0700
Message-ID: <20250519182027.819727-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 18:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216866

This is seen with QT code

Error: ARM register expected -- `ldrex r1,[s16]'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-15.1.inc        |  1 +
 ...-validate-mem_noofs_operand-PR120351.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
index 864c6091a6b..8543d9f7d07 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -69,6 +69,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch
new file mode 100644
index 00000000000..3f324fdc223
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch
@@ -0,0 +1,95 @@
+From bb7adc5dab8bcee2ef1c0d2af370ea77c49bb5c5 Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com>
+Date: Mon, 19 May 2025 16:19:39 +0100
+Subject: [PATCH] arm: fully validate mem_noofs_operand [PR120351]
+
+It's not enough to just check that a memory operand is of the form
+mem(reg); after RA we also need to validate the register being used.
+The safest way to do this is to call memory_operand.
+
+	PR target/120351
+
+gcc/ChangeLog:
+
+	* config/arm/predicates.md (mem_noofs_operand): Also check the op
+	is a valid memory_operand.
+
+gcc/testsuite/ChangeLog:
+
+	* gcc.target/arm/pr120351.c: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=e5bb7a328eb71daa02d15b48d3a6c6b8cd24abc5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/arm/predicates.md            |  3 +-
+ gcc/testsuite/gcc.target/arm/pr120351.c | 47 +++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr120351.c
+
+diff --git a/gcc/config/arm/predicates.md b/gcc/config/arm/predicates.md
+index 75c06d9be25..655f60312de 100644
+--- a/gcc/config/arm/predicates.md
++++ b/gcc/config/arm/predicates.md
+@@ -907,7 +907,8 @@
+ 
+ (define_predicate "mem_noofs_operand"
+   (and (match_code "mem")
+-       (match_code "reg" "0")))
++       (match_code "reg" "0")
++       (match_operand 0 "memory_operand")))
+ 
+ (define_predicate "call_insn_operand"
+   (ior (and (match_code "symbol_ref")
+diff --git a/gcc/testsuite/gcc.target/arm/pr120351.c b/gcc/testsuite/gcc.target/arm/pr120351.c
+new file mode 100644
+index 00000000000..d8e9d73275c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/pr120351.c
+@@ -0,0 +1,47 @@
++/* { dg-do assemble } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-add-options arm_neon } */
++/* { dg-additional-options "-O2" } */
++
++
++typedef struct A
++{
++  int f1;
++} A;
++
++__inline void ref (A* x)
++{
++  __atomic_fetch_add(&x->f1, 1, 0);
++}
++
++typedef struct B
++{
++  A *d;
++  int *ptr;
++} B;
++
++void insertOne (B*, B*);
++
++void init (B *);
++__inline void copy (B *p, B *q)
++{
++  p->d  = q->d;
++  p->ptr = q->ptr;
++  ref (p->d);
++}
++
++__inline void emplace(B* x)
++{
++  B dummy;
++  B _tmp;
++  init (&dummy);
++  copy (&_tmp, &dummy);
++  insertOne(x, &_tmp);
++}
++
++void testing ()
++{
++  B test;
++  init (&test);
++  emplace(&test);
++}

