Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.35414.1607956667188547848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VmTc9DKM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id 11so12159960pfu.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rD9nJGCwcoTdVSjd3TDGTJnObToYtaCQ/RDGboaNUqk=;
        b=VmTc9DKM+5US+ansmeXRpdR26xUxtAPjjsycwkX4OQM8JDmzPcD5bpwLe2I1jjK3Fj
         P4OVegniQ8P9CJmh8/M/gckLUtesdJlKGc62vuYAcyAJtItnlWFZV+KMbFhuoB3aBxne
         3B95cmvD2nEse6AyVaR8WbcJhwmNs+5NKXEoX8lw4UekpdxO0lIdozZhq03XapLLrmXy
         P4yDWWywSxZN8qC2wF3EccluLD/EQNaKA584eN4pr+lc2/MEtOFcrpElTyiCYyUN0qQV
         r8JFA9ygEcfHl4dCOqJmYShFUBhMBE91mdRGegeHQZsW8BGPLE5qEwF8UxeirdniKbvn
         +iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rD9nJGCwcoTdVSjd3TDGTJnObToYtaCQ/RDGboaNUqk=;
        b=Z1mF6G8bM667ogYv7NDGhBAhOCHrFsidoimcpUdh/HaMccnUHerLlEjhs/PsMLVRt7
         5PlyKZZcK4kWZAeTVgtzY+GDlJ1nZnpj31QK9g259Uiw0JfzN+YW34u1n/W8v6pa8QrL
         NQWjiMyhZYHc3hgJONH1+deHdr1irEQ6k/OHq1DQCTzhsBKMehFbocvthqtiil2m9EiL
         YuLd9b/eyJ0wJLXfZquO1EYRpffMjb3TUbSagesS9daa/Lo6RfimRTqfOOE6NcQ+kyTa
         FUESs9fFsfIRWmMGbgV1Qa+W1jVuDwjIkgHv5Y54gAuEcmqOr3llgs/T/uaOYkozt8oD
         +ZCQ==
X-Gm-Message-State: AOAM531Mv+VAMiboT65ZW0C85icLxDCTcTMiCUhi02//2LLduohmkHU8
	RSg0jImomFglGdXSeYiupDhkL952jWtH4pyB
X-Google-Smtp-Source: ABdhPJyo/gZb6fmzX8C84P4Lp3AkkXqkjfoOZWSECB5gmRrDtLQ/cICQ3Y/alehF/3hIlKF3TbM5Xw==
X-Received: by 2002:a63:d357:: with SMTP id u23mr24001244pgi.106.1607956666161;
        Mon, 14 Dec 2020 06:37:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/25] libffi: add patch to revert clang VFP workaround
Date: Mon, 14 Dec 2020 04:36:42 -1000
Message-Id: <a4944e9b553ddf55da9d9a1243fadc93a620b003.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Brett Warren <brett.warren@arm.com>

Patch is added to address an issue preventing libffi
from compiling under clang.

Change-Id: I55e36d252ec8e84de9b35fea18044c2c0e8c5aab
Signed-off-by: Brett Warren <brett.warren@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 01e8c53488dd5ebb206bef2415549e8ac1ac7601)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...m-sysv-reverted-clang-VFP-mitigation.patch | 104 ++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.3.bb     |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
new file mode 100644
index 0000000000..782dce70d8
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
@@ -0,0 +1,104 @@
+From 501a6b55853af549fae72723e74271f2a4ec7cf6 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Fri, 27 Nov 2020 15:28:42 +0000
+Subject: [PATCH] arm/sysv: reverted clang VFP mitigation
+
+Since commit e3d2812ce43940aacae5bab2d0e965278cb1e7ea,
+seperate instructions were used when compiling under clang, 
+as clang didn't allow the directives at the time. This mitigation
+now causes compilation to fail under clang 10, as described by 
+https://github.com/libffi/libffi/issues/607. Now that
+clang supports the LDC and SDC instructions, this mitigation
+has been reverted.
+
+Upstream-Status: Pending
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ src/arm/sysv.S | 33 ---------------------------------
+ 1 file changed, 33 deletions(-)
+
+diff --git a/src/arm/sysv.S b/src/arm/sysv.S
+index 63180a4..e3ce526 100644
+--- a/src/arm/sysv.S
++++ b/src/arm/sysv.S
+@@ -128,13 +128,8 @@ ARM_FUNC_START(ffi_call_VFP)
+ 	cfi_startproc
+ 
+ 	cmp	r3, #3			@ load only d0 if possible
+-#ifdef __clang__
+-	vldrle d0, [sp]
+-	vldmgt sp, {d0-d7}
+-#else
+ 	ldcle	p11, cr0, [r0]		@ vldrle d0, [sp]
+ 	ldcgt	p11, cr0, [r0], {16}	@ vldmgt sp, {d0-d7}
+-#endif
+ 	add	r0, r0, #64		@ discard the vfp register args
+ 	/* FALLTHRU */
+ ARM_FUNC_END(ffi_call_VFP)
+@@ -172,25 +167,13 @@ ARM_FUNC_START(ffi_call_SYSV)
+ 	nop
+ 0:
+ E(ARM_TYPE_VFP_S)
+-#ifdef __clang__
+-	vstr s0, [r2]
+-#else
+ 	stc	p10, cr0, [r2]		@ vstr s0, [r2]
+-#endif
+ 	pop	{fp,pc}
+ E(ARM_TYPE_VFP_D)
+-#ifdef __clang__
+-	vstr d0, [r2]
+-#else
+ 	stc	p11, cr0, [r2]		@ vstr d0, [r2]
+-#endif
+ 	pop	{fp,pc}
+ E(ARM_TYPE_VFP_N)
+-#ifdef __clang__
+-	vstm r2, {d0-d3}
+-#else
+ 	stc	p11, cr0, [r2], {8}	@ vstm r2, {d0-d3}
+-#endif
+ 	pop	{fp,pc}
+ E(ARM_TYPE_INT64)
+ 	str	r1, [r2, #4]
+@@ -287,11 +270,7 @@ ARM_FUNC_START(ffi_closure_VFP)
+ 	add	ip, sp, #16
+ 	sub	sp, sp, #64+32			@ allocate frame
+ 	cfi_adjust_cfa_offset(64+32)
+-#ifdef __clang__
+-	vstm sp, {d0-d7}
+-#else
+ 	stc	p11, cr0, [sp], {16}		@ vstm sp, {d0-d7}
+-#endif
+ 	stmdb	sp!, {ip,lr}
+ 
+ 	/* See above.  */
+@@ -320,25 +299,13 @@ ARM_FUNC_START_LOCAL(ffi_closure_ret)
+ 	cfi_rel_offset(lr, 4)
+ 0:
+ E(ARM_TYPE_VFP_S)
+-#ifdef __clang__
+-	vldr s0, [r2]
+-#else
+ 	ldc	p10, cr0, [r2]			@ vldr s0, [r2]
+-#endif
+ 	ldm	sp, {sp,pc}
+ E(ARM_TYPE_VFP_D)
+-#ifdef __clang__
+-	vldr d0, [r2]
+-#else
+ 	ldc	p11, cr0, [r2]			@ vldr d0, [r2]
+-#endif
+ 	ldm	sp, {sp,pc}
+ E(ARM_TYPE_VFP_N)
+-#ifdef __clang__
+-	vldm r2, {d0-d3}
+-#else
+ 	ldc	p11, cr0, [r2], {8}		@ vldm r2, {d0-d3}
+-#endif
+ 	ldm	sp, {sp,pc}
+ E(ARM_TYPE_INT64)
+ 	ldr	r1, [r2, #4]
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libffi/libffi_3.3.bb b/meta/recipes-support/libffi/libffi_3.3.bb
index 9dfdb9e39b..10ef003242 100644
--- a/meta/recipes-support/libffi/libffi_3.3.bb
+++ b/meta/recipes-support/libffi/libffi_3.3.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=492385fe22195952f5b9b197868ba268"
 SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-Fixed-missed-ifndef-for-__mips_soft_float.patch \
+           file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
            file://0001-powerpc-fix-build-failure-on-power7-and-older-532.patch \
            file://0001-Address-platforms-with-no-__int128.patch \
            file://0001-Address-platforms-with-no-__int128-part2.patch \
-- 
2.17.1

