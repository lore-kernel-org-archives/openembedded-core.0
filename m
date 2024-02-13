Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD748C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 16:32:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.16001.1707841945843836875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 08:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=geoyyjRO;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e09ea155c5so2454084b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707841945; x=1708446745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WI9mr+u4jR660ATBT5EG9/an3q/Y//P/BBFyiD/A3Cc=;
        b=geoyyjRO5/2snAhqpZPYRhVldSx9youTAtlI6WFnECEwe5jl7bXtHjvjFbufwvilsa
         0aJXwVr5aGkOd48DKW3FaT1kfJaOP4u8cQ6zUkqKbA0hZahj2qwr0zUzG+7ltPYAekTk
         sXIElq0zPkxdRimCMnCaqkNTLEDk0XCN5ymRqHLBPLBkMzuSdnqIpw10LsK12UZ/YHHe
         VZcg4oyitTIypuSBOvbJ54lC1gAvoCGCqfV3FMM5gb9A0gzu8Dbsl/GxLr001zCBXRdF
         /7lDRaECjYyUlhc3Mkbhn4ICpy/XbGjADMPpGhMymys0YaMNdxrHhZYRpInSOCzlbYJr
         KMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707841945; x=1708446745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WI9mr+u4jR660ATBT5EG9/an3q/Y//P/BBFyiD/A3Cc=;
        b=GBNczPHv6YffhntOZoONXAzL7BbD7gOvaWQ/pKgPn+1fTFfrXUhBLKD05B3eEaXfqk
         SG6XGgvmVQ80Mho1MXKIA24deaM3q+fzKYZOs32CasMVbV3HbKR8b2xRhnzBppT5hXwW
         xpmZ9CdpD5ymcg0+CGhvfIaD2+TD0mqiAJlhszjHBGWH4sCZrF+gOZ5igiooMtAEQNoh
         stufdQtADHPVF8+lx+NdKrqVSm4EqGOHdz5EhMgFPXgc3qjiZCUai4MsiJp7AalOXzhT
         tKYXpCl6sBsPAca97VW9As1BRZMz3PAlR9RC0KHLlZ69/lhxpEP8IzjpgD71Bik22JlP
         LQFg==
X-Gm-Message-State: AOJu0YxqEfWdRw6aJ8Bxwx5c3lOh2UoACREa/AHrFfmXl32RKPHFi9kg
	w4L2CiMD6BXjFXclvljdF64iyUGfqTfu+yNqBtX4/K/bLPawUgeejdxgsw+pze4=
X-Google-Smtp-Source: AGHT+IEQaIRqtlR3NVWFjU74gSp02kChg6K81UFb3hIpH23UEEJhLiuaF8yde6rUHvYCHtlFHvuLBw==
X-Received: by 2002:a05:6a21:8cc6:b0:19a:508a:7f70 with SMTP id ta6-20020a056a218cc600b0019a508a7f70mr77641pzb.30.1707841944910;
        Tue, 13 Feb 2024 08:32:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::130a])
        by smtp.gmail.com with ESMTPSA id l10-20020a170902d04a00b001da2951a788sm2287528pll.304.2024.02.13.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 08:32:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Update to bring mips32/clone3 fix
Date: Tue, 13 Feb 2024 08:32:22 -0800
Message-ID: <20240213163222.141399-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 16:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195417

This patch is the only change applied with this update

* 312e159626 mips: FIx clone3 implementation (BZ 31325)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...s-FIx-clone3-implementation-BZ-31325.patch | 83 -------------------
 2 files changed, 1 insertion(+), 84 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0024-mips-FIx-clone3-implementation-BZ-31325.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 0d86917f454..5b0705f6960 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "63295e4fda1f6dab4bf7442706fe303bf283036c"
+SRCREV_glibc ?= "312e159626b67fe11f39e83e222cf4348a3962f3"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0024-mips-FIx-clone3-implementation-BZ-31325.patch b/meta/recipes-core/glibc/glibc/0024-mips-FIx-clone3-implementation-BZ-31325.patch
deleted file mode 100644
index b391c609582..00000000000
--- a/meta/recipes-core/glibc/glibc/0024-mips-FIx-clone3-implementation-BZ-31325.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From b471cadd57e3fc1fce74b33fcf75c6844cfd68b3 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Thu, 1 Feb 2024 14:41:03 -0300
-Subject: [PATCH] mips: FIx clone3 implementation (BZ 31325)
-
-For o32 we need to setup a minimal stack frame to allow cprestore
-on __thread_start_clone3 (which instruct the linker to save the
-gp for PIC).  Also, there is no guarantee by kABI that $8 will be
-preserved after syscall execution, so we need to save it on the
-provided stack.
-
-Checked on mipsel-linux-gnu.
-
-Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20240201174103.798138-1-adhemerval.zanella@linaro.org/]
-Reported-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/unix/sysv/linux/mips/clone3.S | 32 ++++++++++++++++++++++-----
- 1 file changed, 27 insertions(+), 5 deletions(-)
-
-diff --git a/sysdeps/unix/sysv/linux/mips/clone3.S b/sysdeps/unix/sysv/linux/mips/clone3.S
-index e9fec2fa47..481b8ae963 100644
---- a/sysdeps/unix/sysv/linux/mips/clone3.S
-+++ b/sysdeps/unix/sysv/linux/mips/clone3.S
-@@ -37,11 +37,6 @@
- 
- 	.text
- 	.set		nomips16
--#if _MIPS_SIM == _ABIO32
--# define EXTRA_LOCALS 1
--#else
--# define EXTRA_LOCALS 0
--#endif
- #define FRAMESZ ((NARGSAVE*SZREG)+ALSZ)&ALMASK
- GPOFF= FRAMESZ-(1*SZREG)
- NESTED(__clone3, SZREG, sp)
-@@ -68,8 +63,31 @@ NESTED(__clone3, SZREG, sp)
- 	beqz	a0, L(error)	/* No NULL cl_args pointer.  */
- 	beqz	a2, L(error)	/* No NULL function pointer.  */
- 
-+#if _MIPS_SIM == _ABIO32
-+	/* Both stack and stack_size on clone_args are defined as uint64_t, and
-+	   there is no need to handle values larger than to 32 bits for o32.  */
-+# if __BYTE_ORDER == __BIG_ENDIAN
-+#  define CL_STACKPOINTER_OFFSET  44
-+#  define CL_STACKSIZE_OFFSET     52
-+# else
-+#  define CL_STACKPOINTER_OFFSET  40
-+#  define CL_STACKSIZE_OFFSET     48
-+# endif
-+
-+	/* For o32 we need to setup a minimal stack frame to allow cprestore
-+	   on __thread_start_clone3.  Also there is no guarantee by kABI that
-+	   $8 will be preserved after syscall execution (so we need to save it
-+	   on the provided stack).  */
-+	lw	t0, CL_STACKPOINTER_OFFSET(a0)	/* Load the stack pointer.  */
-+	lw	t1, CL_STACKSIZE_OFFSET(a0)	/* Load the stack_size.  */
-+	addiu	t1, -32				/* Update the stack size.  */
-+	addu	t2, t1, t0			/* Calculate the thread stack.  */
-+	sw	a3, 0(t2)			/* Save argument pointer.  */
-+	sw	t1, CL_STACKSIZE_OFFSET(a0)	/* Save the new stack size.  */
-+#else
- 	move	$8, a3		/* a3 is set to 0/1 for syscall success/error
- 				   while a4/$8 is returned unmodified.  */
-+#endif
- 
- 	/* Do the system call, the kernel expects:
- 	   v0: system call number
-@@ -125,7 +143,11 @@ L(thread_start_clone3):
- 
- 	/* Restore the arg for user's function.  */
- 	move		t9, a2		/* Function pointer.  */
-+#if _MIPS_SIM == _ABIO32
-+	PTR_L		a0, 0(sp)
-+#else
- 	move		a0, $8		/* Argument pointer.  */
-+#endif
- 
- 	/* Call the user's function.  */
- 	jal		t9
--- 
-2.43.0
-
-- 
2.43.1


