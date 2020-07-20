Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.6300.1595281779172965365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 14:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NiwmW+yJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id l6so9312918plt.7
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 14:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=h9ca26akZBjlG7vlwy8tbXDLnHvj+rE4mDjV6Gi5nQA=;
        b=NiwmW+yJVjgFisH4G9uHX9z3K4iKMNKI9FKDfmdeeXfeWjArVqMfzCDZiz4zYRNrUd
         Rie/0oPhP2Z2y6UJVJico/VTMJ7bfHKR/bLiuwoaUsG7mOu+ouasHe2tjYF2nPlqe73x
         fZAMboTAlqGtGLfWzOTdGo9dKJW1iyFAUxqQV7Fw5keM5fWCOEu9YyDa7z+tujsw3Eog
         /41szDKNXV/KNTcfQ/iDk4gJCwsg3AdQsh/THEndZcnjnzmRcb6t9R5nj8s/+9VsT35k
         1gQeeBNezGi8rOdAjX7mt4xYkCdT6nX9V9jpI3b7bwaAh75RXw8EDpY6HzHEn5PVQP7I
         j1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=h9ca26akZBjlG7vlwy8tbXDLnHvj+rE4mDjV6Gi5nQA=;
        b=Prl6+ymiH6he6WG67FMl5To1NJGxm9IYAWR+jr88IonybN/eoWSKI8r0GgY+wUKtR9
         5yyK7UTl9naIN4rF64bcCd1SkV7kHzTqCN4rSlxZ2V9YHH8T3E6Hb8RWKMcfBz2jlVNQ
         ZYnG/ExjK98nxpEfhLkvHrTAXjaBzVD1vX0lDj0vd4yFPh2u8QmDBeBdJSuco4YPWnGP
         oJUCmSZdJIiBLXqdIMhmmqSzBtfRD3jyCEmW1p1uR5cciap5ONU0GYQaDeVTpmikJj+B
         iwPUDwgrnWBnyla9QLVnGSPgcqN8T8fYKhUSzeszSEjghj6d2ChGqkfPpTAtRdNT198V
         aung==
X-Gm-Message-State: AOAM530ofCkhmlrCRXV6i6FmEk46KxnGjQQRISQ768fD2GEwsta3gJth
	/pLWT7qSRTdb7qoaLMJCtRoVfw2HtHM=
X-Google-Smtp-Source: ABdhPJwN4QcGFFEdZWhlcGpVpdn0ajgCiNNgm6T8Y7b3RAAkbSZ4HLoCYSZs+uudB4BnklGVw4Q/oA==
X-Received: by 2002:a17:902:9a0a:: with SMTP id v10mr19445728plp.134.1595281778008;
        Mon, 20 Jul 2020 14:49:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:411f:2971:8bd3:d88])
        by smtp.gmail.com with ESMTPSA id my9sm557494pjb.44.2020.07.20.14.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 14:49:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>,
	Armin Kuster <akuster@gmvista.com>
Subject: [master][dunfell][PATCH] glibc: Secruity fix for CVE-2020-6096
Date: Mon, 20 Jul 2020 14:49:36 -0700
Message-Id: <20200720214936.25697-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: glibc.org
MR: 104799
Type: Security Fix
Disposition: Backport from  beea361050728138b82c57dda0c4810402d342b9
ChangeID: 29df826fb697fdd2742c3bace33388bda962c5f1
Description:

Signed-off-by: Armin Kuster <akuster@gmvista.com>
---
 .../glibc/glibc/CVE-2020-6096.patch           | 112 ++++++++++
 .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   2 +
 3 files changed, 308 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
new file mode 100644
index 00000000000..9c26f76432d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
@@ -0,0 +1,112 @@
+From beea361050728138b82c57dda0c4810402d342b9 Mon Sep 17 00:00:00 2001
+From: Alexander Anisimov <a.anisimov@omprussia.ru>
+Date: Wed, 8 Jul 2020 14:18:31 +0200
+Subject: [PATCH] arm: CVE-2020-6096: Fix multiarch memcpy for negative length
+ [BZ #25620]
+
+Unsigned branch instructions could be used for r2 to fix the wrong
+behavior when a negative length is passed to memcpy.
+This commit fixes the armv7 version.
+
+Upstream-Status: Backport
+CVE: CVE-2020-6096 patch #1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ sysdeps/arm/armv7/multiarch/memcpy_impl.S | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/sysdeps/arm/armv7/multiarch/memcpy_impl.S b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
+index bf4ac7077f..379bb56fc9 100644
+--- a/sysdeps/arm/armv7/multiarch/memcpy_impl.S
++++ b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
+@@ -268,7 +268,7 @@ ENTRY(memcpy)
+ 
+ 	mov	dst, dstin	/* Preserve dstin, we need to return it.  */
+ 	cmp	count, #64
+-	bge	.Lcpy_not_short
++	bhs	.Lcpy_not_short
+ 	/* Deal with small copies quickly by dropping straight into the
+ 	   exit block.  */
+ 
+@@ -351,10 +351,10 @@ ENTRY(memcpy)
+ 
+ 1:
+ 	subs	tmp2, count, #64	/* Use tmp2 for count.  */
+-	blt	.Ltail63aligned
++	blo	.Ltail63aligned
+ 
+ 	cmp	tmp2, #512
+-	bge	.Lcpy_body_long
++	bhs	.Lcpy_body_long
+ 
+ .Lcpy_body_medium:			/* Count in tmp2.  */
+ #ifdef USE_VFP
+@@ -378,7 +378,7 @@ ENTRY(memcpy)
+ 	add	src, src, #64
+ 	vstr	d1, [dst, #56]
+ 	add	dst, dst, #64
+-	bge	1b
++	bhs	1b
+ 	tst	tmp2, #0x3f
+ 	beq	.Ldone
+ 
+@@ -412,7 +412,7 @@ ENTRY(memcpy)
+ 	ldrd	A_l, A_h, [src, #64]!
+ 	strd	A_l, A_h, [dst, #64]!
+ 	subs	tmp2, tmp2, #64
+-	bge	1b
++	bhs	1b
+ 	tst	tmp2, #0x3f
+ 	bne	1f
+ 	ldr	tmp2,[sp], #FRAME_SIZE
+@@ -482,7 +482,7 @@ ENTRY(memcpy)
+ 	add	src, src, #32
+ 
+ 	subs	tmp2, tmp2, #prefetch_lines * 64 * 2
+-	blt	2f
++	blo	2f
+ 1:
+ 	cpy_line_vfp	d3, 0
+ 	cpy_line_vfp	d4, 64
+@@ -494,7 +494,7 @@ ENTRY(memcpy)
+ 	add	dst, dst, #2 * 64
+ 	add	src, src, #2 * 64
+ 	subs	tmp2, tmp2, #prefetch_lines * 64
+-	bge	1b
++	bhs	1b
+ 
+ 2:
+ 	cpy_tail_vfp	d3, 0
+@@ -615,8 +615,8 @@ ENTRY(memcpy)
+ 1:
+ 	pld	[src, #(3 * 64)]
+ 	subs	count, count, #64
+-	ldrmi	tmp2, [sp], #FRAME_SIZE
+-	bmi	.Ltail63unaligned
++	ldrlo	tmp2, [sp], #FRAME_SIZE
++	blo	.Ltail63unaligned
+ 	pld	[src, #(4 * 64)]
+ 
+ #ifdef USE_NEON
+@@ -633,7 +633,7 @@ ENTRY(memcpy)
+ 	neon_load_multi d0-d3, src
+ 	neon_load_multi d4-d7, src
+ 	subs	count, count, #64
+-	bmi	2f
++	blo	2f
+ 1:
+ 	pld	[src, #(4 * 64)]
+ 	neon_store_multi d0-d3, dst
+@@ -641,7 +641,7 @@ ENTRY(memcpy)
+ 	neon_store_multi d4-d7, dst
+ 	neon_load_multi d4-d7, src
+ 	subs	count, count, #64
+-	bpl	1b
++	bhs	1b
+ 2:
+ 	neon_store_multi d0-d3, dst
+ 	neon_store_multi d4-d7, dst
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
new file mode 100644
index 00000000000..905e44c8e33
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
@@ -0,0 +1,194 @@
+From 79a4fa341b8a89cb03f84564fd72abaa1a2db394 Mon Sep 17 00:00:00 2001
+From: Evgeny Eremin <e.eremin@omprussia.ru>
+Date: Wed, 8 Jul 2020 14:18:19 +0200
+Subject: [PATCH] arm: CVE-2020-6096: fix memcpy and memmove for negative
+ length [BZ #25620]
+
+Unsigned branch instructions could be used for r2 to fix the wrong
+behavior when a negative length is passed to memcpy and memmove.
+This commit fixes the generic arm implementation of memcpy amd memmove.
+
+Upstream-Status: Backport
+CVE: CVE-2020-6096 patch #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ sysdeps/arm/memcpy.S  | 24 ++++++++++--------------
+ sysdeps/arm/memmove.S | 24 ++++++++++--------------
+ 2 files changed, 20 insertions(+), 28 deletions(-)
+
+diff --git a/sysdeps/arm/memcpy.S b/sysdeps/arm/memcpy.S
+index 510e8adaf2..bcfbc51d99 100644
+--- a/sysdeps/arm/memcpy.S
++++ b/sysdeps/arm/memcpy.S
+@@ -68,7 +68,7 @@ ENTRY(memcpy)
+ 		cfi_remember_state
+ 
+ 		subs	r2, r2, #4
+-		blt	8f
++		blo	8f
+ 		ands	ip, r0, #3
+ 	PLD(	pld	[r1, #0]		)
+ 		bne	9f
+@@ -82,7 +82,7 @@ ENTRY(memcpy)
+ 		cfi_rel_offset (r6, 4)
+ 		cfi_rel_offset (r7, 8)
+ 		cfi_rel_offset (r8, 12)
+-		blt	5f
++		blo	5f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	rsb	r3, ip, #32		)
+@@ -98,9 +98,9 @@ ENTRY(memcpy)
+ #endif
+ 
+ 	PLD(	pld	[r1, #0]		)
+-2:	PLD(	subs	r2, r2, #96		)
++2:	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #28]		)
+-	PLD(	blt	4f			)
++	PLD(	blo	4f			)
+ 	PLD(	pld	[r1, #60]		)
+ 	PLD(	pld	[r1, #92]		)
+ 
+@@ -108,9 +108,7 @@ ENTRY(memcpy)
+ 4:		ldmia	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
+ 		subs	r2, r2, #32
+ 		stmia	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
+-		bge	3b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	4b			)
++		bhs	3b
+ 
+ 5:		ands	ip, r2, #28
+ 		rsb	ip, ip, #32
+@@ -222,7 +220,7 @@ ENTRY(memcpy)
+ 		strbge	r4, [r0], #1
+ 		subs	r2, r2, ip
+ 		strb	lr, [r0], #1
+-		blt	8b
++		blo	8b
+ 		ands	ip, r1, #3
+ 		beq	1b
+ 
+@@ -236,7 +234,7 @@ ENTRY(memcpy)
+ 		.macro	forward_copy_shift pull push
+ 
+ 		subs	r2, r2, #28
+-		blt	14f
++		blo	14f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	rsb	ip, ip, #32		)
+@@ -253,9 +251,9 @@ ENTRY(memcpy)
+ 		cfi_rel_offset (r10, 16)
+ 
+ 	PLD(	pld	[r1, #0]		)
+-	PLD(	subs	r2, r2, #96		)
++	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #28]		)
+-	PLD(	blt	13f			)
++	PLD(	blo	13f			)
+ 	PLD(	pld	[r1, #60]		)
+ 	PLD(	pld	[r1, #92]		)
+ 
+@@ -280,9 +278,7 @@ ENTRY(memcpy)
+ 		mov	ip, ip, PULL #\pull
+ 		orr	ip, ip, lr, PUSH #\push
+ 		stmia	r0!, {r3, r4, r5, r6, r7, r8, r10, ip}
+-		bge	12b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	13b			)
++		bhs	12b
+ 
+ 		pop	{r5 - r8, r10}
+ 		cfi_adjust_cfa_offset (-20)
+diff --git a/sysdeps/arm/memmove.S b/sysdeps/arm/memmove.S
+index 954037ef3a..0d07b76ee6 100644
+--- a/sysdeps/arm/memmove.S
++++ b/sysdeps/arm/memmove.S
+@@ -85,7 +85,7 @@ ENTRY(memmove)
+ 		add	r1, r1, r2
+ 		add	r0, r0, r2
+ 		subs	r2, r2, #4
+-		blt	8f
++		blo	8f
+ 		ands	ip, r0, #3
+ 	PLD(	pld	[r1, #-4]		)
+ 		bne	9f
+@@ -99,7 +99,7 @@ ENTRY(memmove)
+ 		cfi_rel_offset (r6, 4)
+ 		cfi_rel_offset (r7, 8)
+ 		cfi_rel_offset (r8, 12)
+-		blt	5f
++		blo     5f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	sbcsne	r4, ip, r2		)  @ C is always set here
+@@ -114,9 +114,9 @@ ENTRY(memmove)
+ #endif
+ 
+ 	PLD(	pld	[r1, #-4]		)
+-2:	PLD(	subs	r2, r2, #96		)
++2:	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #-32]		)
+-	PLD(	blt	4f			)
++	PLD(    blo     4f                      )
+ 	PLD(	pld	[r1, #-64]		)
+ 	PLD(	pld	[r1, #-96]		)
+ 
+@@ -124,9 +124,7 @@ ENTRY(memmove)
+ 4:		ldmdb	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
+ 		subs	r2, r2, #32
+ 		stmdb	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
+-		bge	3b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	4b			)
++		bhs     3b
+ 
+ 5:		ands	ip, r2, #28
+ 		rsb	ip, ip, #32
+@@ -237,7 +235,7 @@ ENTRY(memmove)
+ 		strbge	r4, [r0, #-1]!
+ 		subs	r2, r2, ip
+ 		strb	lr, [r0, #-1]!
+-		blt	8b
++		blo	8b
+ 		ands	ip, r1, #3
+ 		beq	1b
+ 
+@@ -251,7 +249,7 @@ ENTRY(memmove)
+ 		.macro	backward_copy_shift push pull
+ 
+ 		subs	r2, r2, #28
+-		blt	14f
++		blo	14f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	rsb	ip, ip, #32		)
+@@ -268,9 +266,9 @@ ENTRY(memmove)
+ 		cfi_rel_offset (r10, 16)
+ 
+ 	PLD(	pld	[r1, #-4]		)
+-	PLD(	subs	r2, r2, #96		)
++	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #-32]		)
+-	PLD(	blt	13f			)
++	PLD(	blo	13f			)
+ 	PLD(	pld	[r1, #-64]		)
+ 	PLD(	pld	[r1, #-96]		)
+ 
+@@ -295,9 +293,7 @@ ENTRY(memmove)
+ 		mov     r4, r4, PUSH #\push
+ 		orr     r4, r4, r3, PULL #\pull
+ 		stmdb   r0!, {r4 - r8, r10, ip, lr}
+-		bge	12b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	13b			)
++		bhs	12b
+ 
+ 		pop	{r5 - r8, r10}
+ 		cfi_adjust_cfa_offset (-20)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 9b2cf1bdeb4..38563b1a7b7 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -43,6 +43,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
+           file://CVE-2020-6096.patch \
+           file://CVE-2020-6096_2.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1

