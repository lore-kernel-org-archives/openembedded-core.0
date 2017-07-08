Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D495877FA6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e199so8251472pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nDXKlBzUM9N5q7tkmKnipDHDJtzLiDy5dO0f+T15jHI=;
	b=CKVhONS6t4ep7f4FwIGub2pj2gIWsXnoQgG6Mv2Fdi2Boxw82WzKTM3LDx0duATJ2X
	SsNXZLIwtuSVPK2B0tMl+BdGfZ4mTvpR7q8HWzIB4732d+oD4RIQK4hkv/Gl8qufsTos
	aDQCvJuBenRQEU6xoIaHM+tjSOcDuhr9B02tYgJ59wGpqODR2kNOzbEc1lKQgGKZ+gHV
	prnoO+t3lbzuZJ7ktb7HEhk5x3XClcDQSdalFc7+JKKqqUZbb8613h+dtcFlEnU0GD/u
	iAqa0JJh49wM1UHFEx6Z/YF34s7k7CrZCNt3Jwuz8m01iCGFNj1dAxhY44880mOpqp6U
	19Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nDXKlBzUM9N5q7tkmKnipDHDJtzLiDy5dO0f+T15jHI=;
	b=XUyhInhzg5uiOGqD5bdK1iP57tN3gzb+hXrgDyGzDiHq/Va2+aOXIpiK4Ut/I45AUr
	jM8MormEcIc0gX/gHRMYh6vrzQo6dwJsgTqK7oK3rbTIPxm4Pr9IYO61v9gDY+xid9Rj
	EgPYfxP7myHj4Y5FEB4PDshwGCbafE6YKReVcW62edREAp4rX930FgJTaEmBiuOHQ40M
	AAhEnrE7tZsbwtTHLUqnA6OVZjGxiClh1W+Ll8P9FAKrQMr0JOKGP7zGMZnRbFChvTxz
	snb4bcjiQMfcDSaUGJdn8/2ZcCCWmRIa7Y3pjENB3yZeg1FP/D91pmlRamLDxLTrnUoo
	B1jg==
X-Gm-Message-State: AIVw1124lrZc6ZwYvjPvErLsKfEAg8WcmZx1MKlYDJnThUyVf4sCvHbf
	pAr8xGZ/3KdQFoxI
X-Received: by 10.99.56.21 with SMTP id f21mr6156206pga.235.1499520884520;
	Sat, 08 Jul 2017 06:34:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:24 -0700
Message-Id: <397ddefdc5c7bd18945e77a02ce6316bba61fca7.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 05/10] gcc: Use ucontext_t instead of ucontext
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Jul 2017 13:34:44 -0000

glibc 2.26 does not expose struct ucontext anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |   1 +
 ...0-replace-struct-ucontext-with-ucontext_t.patch | 149 +++++++++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index f30a73c31c..3f1c06dafd 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
            file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
+           file://0050-replace-struct-ucontext-with-ucontext_t.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch b/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
new file mode 100644
index 0000000000..e814992e44
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
@@ -0,0 +1,149 @@
+From 7b3cb36ab07d0c36b500bb5d0548b190d4b5a9f6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jun 2017 00:25:57 -0700
+Subject: [PATCH 50/50] replace struct ucontext with ucontext_t
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgcc/config/aarch64/linux-unwind.h | 2 +-
+ libgcc/config/alpha/linux-unwind.h   | 2 +-
+ libgcc/config/bfin/linux-unwind.h    | 2 +-
+ libgcc/config/i386/linux-unwind.h    | 4 ++--
+ libgcc/config/pa/linux-unwind.h      | 2 +-
+ libgcc/config/riscv/linux-unwind.h   | 2 +-
+ libgcc/config/sh/linux-unwind.h      | 2 +-
+ libgcc/config/tilepro/linux-unwind.h | 2 +-
+ libgcc/config/xtensa/linux-unwind.h  | 2 +-
+ 9 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/linux-unwind.h
+index d5d6980442f..d46d5f53be3 100644
+--- a/libgcc/config/aarch64/linux-unwind.h
++++ b/libgcc/config/aarch64/linux-unwind.h
+@@ -55,7 +55,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *context,
+   struct rt_sigframe
+   {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   };
+ 
+   struct rt_sigframe *rt_;
+diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linux-unwind.h
+index a91a5f4fe26..7202516581d 100644
+--- a/libgcc/config/alpha/linux-unwind.h
++++ b/libgcc/config/alpha/linux-unwind.h
+@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *context,
+     {
+       struct rt_sigframe {
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       sc = &rt_->uc.uc_mcontext;
+     }
+diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-unwind.h
+index 9412c7652b8..37e9feb6965 100644
+--- a/libgcc/config/bfin/linux-unwind.h
++++ b/libgcc/config/bfin/linux-unwind.h
+@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *context,
+ 	void *puc;
+ 	char retcode[8];
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+ 
+       /* The void * cast is necessary to avoid an aliasing warning.
+diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-unwind.h
+index b1d5040a687..2009ad72260 100644
+--- a/libgcc/config/i386/linux-unwind.h
++++ b/libgcc/config/i386/linux-unwind.h
+@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *context,
+   if (*(unsigned char *)(pc+0) == 0x48
+       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
+     {
+-      struct ucontext *uc_ = context->cfa;
++      ucontext_t *uc_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+          because it does not alias anything.  */
+@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *context,
+ 	siginfo_t *pinfo;
+ 	void *puc;
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwind.h
+index 580c18dad69..c2c3409bcc1 100644
+--- a/libgcc/config/pa/linux-unwind.h
++++ b/libgcc/config/pa/linux-unwind.h
+@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *context,
+   struct sigcontext *sc;
+   struct rt_sigframe {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *frame;
+ 
+   /* rt_sigreturn trampoline:
+diff --git a/libgcc/config/riscv/linux-unwind.h b/libgcc/config/riscv/linux-unwind.h
+index a051a2869d4..1c8aeff7ef0 100644
+--- a/libgcc/config/riscv/linux-unwind.h
++++ b/libgcc/config/riscv/linux-unwind.h
+@@ -42,7 +42,7 @@ riscv_fallback_frame_state (struct _Unwind_Context *context,
+   struct rt_sigframe
+   {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   };
+ 
+   struct rt_sigframe *rt_;
+diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwind.h
+index 1038caeb5c3..a8c98220282 100644
+--- a/libgcc/config/sh/linux-unwind.h
++++ b/libgcc/config/sh/linux-unwind.h
+@@ -82,7 +82,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context,
+     {
+       struct rt_sigframe {
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/linux-unwind.h
+index a8dc4405715..dba3b410279 100644
+--- a/libgcc/config/tilepro/linux-unwind.h
++++ b/libgcc/config/tilepro/linux-unwind.h
+@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *context,
+   struct rt_sigframe {
+     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *rt_;
+ 
+   /* Return if this is not a signal handler.  */
+diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/linux-unwind.h
+index 67c272820d0..b37b8b31bbf 100644
+--- a/libgcc/config/xtensa/linux-unwind.h
++++ b/libgcc/config/xtensa/linux-unwind.h
+@@ -67,7 +67,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
+ 
+   struct rt_sigframe {
+     siginfo_t info;
+-    struct ucontext uc;
++    struct ucontext_t uc;
+   } *rt_;
+ 
+   /* movi a2, __NR_rt_sigreturn; syscall */
+-- 
+2.13.2
+
-- 
2.13.2


