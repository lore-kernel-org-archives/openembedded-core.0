Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6183.1607348551770977683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 05:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2BB2101E
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Dec 2020 05:42:30 -0800 (PST)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03E0A3F718
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Dec 2020 05:42:29 -0800 (PST)
From: "Brett Warren" <brett.warren@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libffi: add patch to revert clang VFP workaround
Date: Mon,  7 Dec 2020 13:42:23 +0000
Message-Id: <20201207134223.5298-1-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1

Patch is added to address an issue preventing libffi
from compiling under clang.

Change-Id: I55e36d252ec8e84de9b35fea18044c2c0e8c5aab
Signed-off-by: Brett Warren <brett.warren@arm.com>
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

