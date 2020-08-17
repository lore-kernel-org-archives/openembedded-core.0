Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.45023.1597677130719211250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=laOdhDKo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id s14so1699829plp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=31xBQnuJMUiOifi8DQau7G1oEhwl5J3jdRFl+b+nmxU=;
        b=laOdhDKoHuA7juBL86RtyrYyqUCwknG8NHa3ARW8p9T9ICmsEjAmWGcBt9SoYtqApy
         nRfV3Hn0/cBKMsAd5dWiAFzQQSlXpEN3BGIhksnX46CE6vvTvwM62uZN6M3Gg3VABHuG
         3wifgLuacGg3fFfrFQtjMLJJcVnJ1mdVVbRUqdTqKz5hWb4ngGhqlhnuUBDUwwT59oiv
         uzTgC5jINmbVaTlw20IZAPNj4XKD29Z9pyGy7F8UYC58tG/W+hW0jX4+7UXUJBA5FnA3
         T8W47Sh+lHo7Oym9lsMN6IfZPcnu0UrodiXNRotli4HaIkuIEGKKjKHIWGcrf30yWgOH
         bV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=31xBQnuJMUiOifi8DQau7G1oEhwl5J3jdRFl+b+nmxU=;
        b=GHqln3mOQefZxI7XAJRPAG/C8SlytJ4ZUcA0AU+EjdasHeYYp3K3FKHyLW+I+gXCnQ
         BfBQi/WYsIa6K6Fz7jn7pmoA+IJCaRL4Cgxnot7A0RAsSN8PWR2pPYOB14wcH9N4TKye
         QzJyorzTaaEyA8aO1xVQQlJvIRLi/pN6HnpBYQmcHLXVhPzjcSPovpU/W1t8g2VXXL6v
         P+uP+IHO5ynOi0WcPrKkJK4geknn0BTC1kBXNyYnK32fL2eSmFIiop8+3cwjXEcBiBOj
         gOeZP6JDmxdxQC7u9y0n/XVvr79yXdwKx9OWrDCMyTQ4BKdteBNpbfZqLaEbd/x2v1+8
         V3ug==
X-Gm-Message-State: AOAM531zO0reuuOnDCNPPylcuKEjbdSEQjccGLgiOE8wvYyOaDJNxBwe
	iFH4GBCD2QAlSMnrcLCK08RbNVccs9KHbGD/G8o=
X-Google-Smtp-Source: ABdhPJz6h6K1hr1lnmu8zIH4UY2UYzosmabydjRjgCH1tmIxXSma5kotyOflbxfkb3DqsTwwfxuGnw==
X-Received: by 2002:a17:902:fe17:: with SMTP id g23mr11820634plj.30.1597677129517;
        Mon, 17 Aug 2020 08:12:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] glibc: Bring in CVE fixes and other bugfixes from 2.31 release branch
Date: Mon, 17 Aug 2020 05:11:45 -1000
Message-Id: <e03433fd52af298a4b177f36314728f916dd1ac2.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597676744.git.steve@sakoman.com>
References: <cover.1597676744.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Drop 0016-Add-unused-attribute.patch since its fixed by Rewrite iconv
option parsing [BZ #19519] [1]

Upgrade to latest on 2.31 branch which brings following bug fixes

* 6fdf971c9db (origin/release/2.31/master) Add NEWS entry for CVE-2016-10228 (bug 19519)
* 70d585151c0 Rewrite iconv option parsing [BZ #19519]
* 1c8efe848bf powerpc: Fix incorrect cache line size load in memset (bug 26332)
* 7611339a9b5 nptl: Zero-extend arguments to SETXID syscalls [BZ #26248]
* 21b760cc2fa Disable warnings due to deprecated libselinux symbols used by nss and nscd
* 6f3459f9859 Add NEWS entry for CVE-2020-6096 (bug 25620)
* 64246fccafc arm: CVE-2020-6096: Fix multiarch memcpy for negative length [BZ #25620]
* 9bbd2b61729 arm: CVE-2020-6096: fix memcpy and memmove for negative length [BZ #25620]
* 4e8a33a9590 NEWS: Mention BZ 25933 fix
* fd15ba932d2 Fix avx2 strncmp offset compare condition check [BZ #25933]
* 3a44844c97a nss_compat: internal_end*ent may clobber errno, hiding ERANGE [BZ #25976]
* c8391752678 aarch64: fix strcpy and strnlen for big-endian [BZ #25824]
* 10947412240 aarch64: Accept PLT calls to __getauxval within libc.so
* a98b8b221cf NEWS: Mention fixes for BZ 25810/25896/25902/25966
* 4c833bbebe3 x86-64: Use RDX_LP on __x86_shared_non_temporal_threshold [BZ #25966]
* 3b9ceb33204 NEWS: Mention bug 25639 fixed in 2.31 branch
* bb44fe7711a oc_FR locale: Fix spelling of April (bug 25639)
* f2ac7920474 oc_FR locale: Fix spelling of Thursday (bug 25639)
* 18fdba553dd Add a C wrapper for prctl [BZ #25896]
* 7c9e054afdd powerpc: Rename argN to _argN in LOADARGS_N [BZ #25902]
* 9c5ae39a644 Add C wrappers for process_vm_readv/process_vm_writev [BZ #25810]
* 63c3696a4ac Mark unsigned long arguments with U in more syscalls [BZ #25810]
* 5b9d49293b7 Add a syscall test for [BZ #25810]
* 496b5963a75 Add SYSCALL_ULONG_ARG_[12] to pass long to syscall [BZ #25810]
* 04330f85263 x32: Properly pass long to syscall [BZ #25810]
* de371d1581f Fix build with GCC 10 when long double = double.
* ece4e11d55d Add new file missed in previous hppa commit.
* 91b909315c4 Fix data race in setting function descriptors during lazy binding on hppa.
* b999c0098ae nios2: delete sysdeps/unix/sysv/linux/nios2/kernel-features.h
* 54ba2541b3a mips: Fix bracktrace result for signal frames
* 83d3eec6728 stdlib: Move tst-system to tests-container
* ad9b0037ccc support/shell-container.c: Add builtin kill
* 2448ba1d724 support/shell-container.c: Add builtin exit
* 5810e6d75ff support/shell-container.c: Return 127 if execve fails
* d39fb022c26 Add NEWS entry for CVE-2020-1751 (bug 25423)
* 46bbbd46223 posix: Fix system error return value [BZ #25715]
* 3937f6806d9 Add NEWS entry for CVE-2020-1752 (bug 25414)
* ab029a2801d Fix use-after-free in glob when expanding ~user (bug 25414)
* a3189fb15b4 Update syscall lists for Linux 5.5.
* 05c08d5aea9 NEWS: update list of bugs fixed on the 2.31 branch
* 123d48b33a5 Add NEWS entry for CVE-2020-10029 (bug 25487)
* 03f44ce0938 math/test-sinl-pseudo: Use stack protector only if available
* e85a88e00c1 sparc: Move sigreturn stub to assembly
* a9ae2062d57 arm: Fix softp-fp Implies (BZ #25635)
* da6ce60e3cb linux/sysipc: Include linux/posix_types.h for __kernel_mode_t
* 9db2970506c linux: Clear mode_t padding bits (BZ#25623)
* 44f2c26ee4f i386: Use comdat instead of .gnu.linkonce for i386 setup pic register (BZ #20543)
* f2d95cf030f Improve IFUNC check [BZ #25506]
* 9f997ceca28 Avoid ldbl-96 stack corruption from range reduction of pseudo-zero (bug 25487).

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=70d585151c03ede999bd2ad5a724243914cb5f54

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/0016-Add-unused-attribute.patch     |  31 ---
 .../glibc/glibc/CVE-2020-6096.patch           | 112 ----------
 .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ------------------
 meta/recipes-core/glibc/glibc_2.31.bb         |   5 +-
 5 files changed, 2 insertions(+), 342 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c2d68979eb..3bcd336de4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "109474122400ca7d60782b131dc867a5c1f2fe55"
+SRCREV_glibc ?= "6fdf971c9dbf7dac9bea552113fe4694015bbc4d"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
deleted file mode 100644
index 574e7c3503..0000000000
--- a/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c323125744020a29f79e50dc4d024b55c482eafc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH] Add unused attribute
-
-Helps in avoiding gcc warning when header is is included in
-a source file which does not use both functions
-
-        * iconv/gconv_charset.h (strip):
-        Add unused attribute.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- iconv/gconv_charset.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iconv/gconv_charset.h b/iconv/gconv_charset.h
-index 348acc089b..fa92465d89 100644
---- a/iconv/gconv_charset.h
-+++ b/iconv/gconv_charset.h
-@@ -21,7 +21,7 @@
- #include <locale.h>
- 
- 
--static void
-+static void __attribute__ ((unused))
- strip (char *wp, const char *s)
- {
-   int slash_count = 0;
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
deleted file mode 100644
index 9c26f76432..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From beea361050728138b82c57dda0c4810402d342b9 Mon Sep 17 00:00:00 2001
-From: Alexander Anisimov <a.anisimov@omprussia.ru>
-Date: Wed, 8 Jul 2020 14:18:31 +0200
-Subject: [PATCH] arm: CVE-2020-6096: Fix multiarch memcpy for negative length
- [BZ #25620]
-
-Unsigned branch instructions could be used for r2 to fix the wrong
-behavior when a negative length is passed to memcpy.
-This commit fixes the armv7 version.
-
-Upstream-Status: Backport
-CVE: CVE-2020-6096 patch #1
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- sysdeps/arm/armv7/multiarch/memcpy_impl.S | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/sysdeps/arm/armv7/multiarch/memcpy_impl.S b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
-index bf4ac7077f..379bb56fc9 100644
---- a/sysdeps/arm/armv7/multiarch/memcpy_impl.S
-+++ b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
-@@ -268,7 +268,7 @@ ENTRY(memcpy)
- 
- 	mov	dst, dstin	/* Preserve dstin, we need to return it.  */
- 	cmp	count, #64
--	bge	.Lcpy_not_short
-+	bhs	.Lcpy_not_short
- 	/* Deal with small copies quickly by dropping straight into the
- 	   exit block.  */
- 
-@@ -351,10 +351,10 @@ ENTRY(memcpy)
- 
- 1:
- 	subs	tmp2, count, #64	/* Use tmp2 for count.  */
--	blt	.Ltail63aligned
-+	blo	.Ltail63aligned
- 
- 	cmp	tmp2, #512
--	bge	.Lcpy_body_long
-+	bhs	.Lcpy_body_long
- 
- .Lcpy_body_medium:			/* Count in tmp2.  */
- #ifdef USE_VFP
-@@ -378,7 +378,7 @@ ENTRY(memcpy)
- 	add	src, src, #64
- 	vstr	d1, [dst, #56]
- 	add	dst, dst, #64
--	bge	1b
-+	bhs	1b
- 	tst	tmp2, #0x3f
- 	beq	.Ldone
- 
-@@ -412,7 +412,7 @@ ENTRY(memcpy)
- 	ldrd	A_l, A_h, [src, #64]!
- 	strd	A_l, A_h, [dst, #64]!
- 	subs	tmp2, tmp2, #64
--	bge	1b
-+	bhs	1b
- 	tst	tmp2, #0x3f
- 	bne	1f
- 	ldr	tmp2,[sp], #FRAME_SIZE
-@@ -482,7 +482,7 @@ ENTRY(memcpy)
- 	add	src, src, #32
- 
- 	subs	tmp2, tmp2, #prefetch_lines * 64 * 2
--	blt	2f
-+	blo	2f
- 1:
- 	cpy_line_vfp	d3, 0
- 	cpy_line_vfp	d4, 64
-@@ -494,7 +494,7 @@ ENTRY(memcpy)
- 	add	dst, dst, #2 * 64
- 	add	src, src, #2 * 64
- 	subs	tmp2, tmp2, #prefetch_lines * 64
--	bge	1b
-+	bhs	1b
- 
- 2:
- 	cpy_tail_vfp	d3, 0
-@@ -615,8 +615,8 @@ ENTRY(memcpy)
- 1:
- 	pld	[src, #(3 * 64)]
- 	subs	count, count, #64
--	ldrmi	tmp2, [sp], #FRAME_SIZE
--	bmi	.Ltail63unaligned
-+	ldrlo	tmp2, [sp], #FRAME_SIZE
-+	blo	.Ltail63unaligned
- 	pld	[src, #(4 * 64)]
- 
- #ifdef USE_NEON
-@@ -633,7 +633,7 @@ ENTRY(memcpy)
- 	neon_load_multi d0-d3, src
- 	neon_load_multi d4-d7, src
- 	subs	count, count, #64
--	bmi	2f
-+	blo	2f
- 1:
- 	pld	[src, #(4 * 64)]
- 	neon_store_multi d0-d3, dst
-@@ -641,7 +641,7 @@ ENTRY(memcpy)
- 	neon_store_multi d4-d7, dst
- 	neon_load_multi d4-d7, src
- 	subs	count, count, #64
--	bpl	1b
-+	bhs	1b
- 2:
- 	neon_store_multi d0-d3, dst
- 	neon_store_multi d4-d7, dst
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
deleted file mode 100644
index 905e44c8e3..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 79a4fa341b8a89cb03f84564fd72abaa1a2db394 Mon Sep 17 00:00:00 2001
-From: Evgeny Eremin <e.eremin@omprussia.ru>
-Date: Wed, 8 Jul 2020 14:18:19 +0200
-Subject: [PATCH] arm: CVE-2020-6096: fix memcpy and memmove for negative
- length [BZ #25620]
-
-Unsigned branch instructions could be used for r2 to fix the wrong
-behavior when a negative length is passed to memcpy and memmove.
-This commit fixes the generic arm implementation of memcpy amd memmove.
-
-Upstream-Status: Backport
-CVE: CVE-2020-6096 patch #2
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- sysdeps/arm/memcpy.S  | 24 ++++++++++--------------
- sysdeps/arm/memmove.S | 24 ++++++++++--------------
- 2 files changed, 20 insertions(+), 28 deletions(-)
-
-diff --git a/sysdeps/arm/memcpy.S b/sysdeps/arm/memcpy.S
-index 510e8adaf2..bcfbc51d99 100644
---- a/sysdeps/arm/memcpy.S
-+++ b/sysdeps/arm/memcpy.S
-@@ -68,7 +68,7 @@ ENTRY(memcpy)
- 		cfi_remember_state
- 
- 		subs	r2, r2, #4
--		blt	8f
-+		blo	8f
- 		ands	ip, r0, #3
- 	PLD(	pld	[r1, #0]		)
- 		bne	9f
-@@ -82,7 +82,7 @@ ENTRY(memcpy)
- 		cfi_rel_offset (r6, 4)
- 		cfi_rel_offset (r7, 8)
- 		cfi_rel_offset (r8, 12)
--		blt	5f
-+		blo	5f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	rsb	r3, ip, #32		)
-@@ -98,9 +98,9 @@ ENTRY(memcpy)
- #endif
- 
- 	PLD(	pld	[r1, #0]		)
--2:	PLD(	subs	r2, r2, #96		)
-+2:	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #28]		)
--	PLD(	blt	4f			)
-+	PLD(	blo	4f			)
- 	PLD(	pld	[r1, #60]		)
- 	PLD(	pld	[r1, #92]		)
- 
-@@ -108,9 +108,7 @@ ENTRY(memcpy)
- 4:		ldmia	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
- 		subs	r2, r2, #32
- 		stmia	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
--		bge	3b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	4b			)
-+		bhs	3b
- 
- 5:		ands	ip, r2, #28
- 		rsb	ip, ip, #32
-@@ -222,7 +220,7 @@ ENTRY(memcpy)
- 		strbge	r4, [r0], #1
- 		subs	r2, r2, ip
- 		strb	lr, [r0], #1
--		blt	8b
-+		blo	8b
- 		ands	ip, r1, #3
- 		beq	1b
- 
-@@ -236,7 +234,7 @@ ENTRY(memcpy)
- 		.macro	forward_copy_shift pull push
- 
- 		subs	r2, r2, #28
--		blt	14f
-+		blo	14f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	rsb	ip, ip, #32		)
-@@ -253,9 +251,9 @@ ENTRY(memcpy)
- 		cfi_rel_offset (r10, 16)
- 
- 	PLD(	pld	[r1, #0]		)
--	PLD(	subs	r2, r2, #96		)
-+	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #28]		)
--	PLD(	blt	13f			)
-+	PLD(	blo	13f			)
- 	PLD(	pld	[r1, #60]		)
- 	PLD(	pld	[r1, #92]		)
- 
-@@ -280,9 +278,7 @@ ENTRY(memcpy)
- 		mov	ip, ip, PULL #\pull
- 		orr	ip, ip, lr, PUSH #\push
- 		stmia	r0!, {r3, r4, r5, r6, r7, r8, r10, ip}
--		bge	12b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	13b			)
-+		bhs	12b
- 
- 		pop	{r5 - r8, r10}
- 		cfi_adjust_cfa_offset (-20)
-diff --git a/sysdeps/arm/memmove.S b/sysdeps/arm/memmove.S
-index 954037ef3a..0d07b76ee6 100644
---- a/sysdeps/arm/memmove.S
-+++ b/sysdeps/arm/memmove.S
-@@ -85,7 +85,7 @@ ENTRY(memmove)
- 		add	r1, r1, r2
- 		add	r0, r0, r2
- 		subs	r2, r2, #4
--		blt	8f
-+		blo	8f
- 		ands	ip, r0, #3
- 	PLD(	pld	[r1, #-4]		)
- 		bne	9f
-@@ -99,7 +99,7 @@ ENTRY(memmove)
- 		cfi_rel_offset (r6, 4)
- 		cfi_rel_offset (r7, 8)
- 		cfi_rel_offset (r8, 12)
--		blt	5f
-+		blo     5f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	sbcsne	r4, ip, r2		)  @ C is always set here
-@@ -114,9 +114,9 @@ ENTRY(memmove)
- #endif
- 
- 	PLD(	pld	[r1, #-4]		)
--2:	PLD(	subs	r2, r2, #96		)
-+2:	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #-32]		)
--	PLD(	blt	4f			)
-+	PLD(    blo     4f                      )
- 	PLD(	pld	[r1, #-64]		)
- 	PLD(	pld	[r1, #-96]		)
- 
-@@ -124,9 +124,7 @@ ENTRY(memmove)
- 4:		ldmdb	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
- 		subs	r2, r2, #32
- 		stmdb	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
--		bge	3b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	4b			)
-+		bhs     3b
- 
- 5:		ands	ip, r2, #28
- 		rsb	ip, ip, #32
-@@ -237,7 +235,7 @@ ENTRY(memmove)
- 		strbge	r4, [r0, #-1]!
- 		subs	r2, r2, ip
- 		strb	lr, [r0, #-1]!
--		blt	8b
-+		blo	8b
- 		ands	ip, r1, #3
- 		beq	1b
- 
-@@ -251,7 +249,7 @@ ENTRY(memmove)
- 		.macro	backward_copy_shift push pull
- 
- 		subs	r2, r2, #28
--		blt	14f
-+		blo	14f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	rsb	ip, ip, #32		)
-@@ -268,9 +266,9 @@ ENTRY(memmove)
- 		cfi_rel_offset (r10, 16)
- 
- 	PLD(	pld	[r1, #-4]		)
--	PLD(	subs	r2, r2, #96		)
-+	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #-32]		)
--	PLD(	blt	13f			)
-+	PLD(	blo	13f			)
- 	PLD(	pld	[r1, #-64]		)
- 	PLD(	pld	[r1, #-96]		)
- 
-@@ -295,9 +293,7 @@ ENTRY(memmove)
- 		mov     r4, r4, PUSH #\push
- 		orr     r4, r4, r3, PULL #\pull
- 		stmdb   r0!, {r4 - r8, r10, ip, lr}
--		bge	12b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	13b			)
-+		bhs	12b
- 
- 		pop	{r5 - r8, r10}
- 		cfi_adjust_cfa_offset (-20)
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index e8e11f5438..3d486fbb59 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -1,7 +1,7 @@
 require glibc.inc
 require glibc-version.inc
 
-CVE_CHECK_WHITELIST += "CVE-2020-10029"
+CVE_CHECK_WHITELIST += "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228 CVE-2020-1751 CVE-2020-1752"
 
 DEPENDS += "gperf-native bison-native make-native"
 
@@ -28,7 +28,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
            file://0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
-           file://0016-Add-unused-attribute.patch \
            file://0017-yes-within-the-path-sets-wrong-config-variables.patch \
            file://0018-timezone-re-written-tzselect-as-posix-sh.patch \
            file://0019-Remove-bash-dependency-for-nscd-init-script.patch \
@@ -42,8 +41,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://CVE-2020-6096.patch \
-           file://CVE-2020-6096_2.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1

