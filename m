Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741C3C48BEB
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 10:46:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15975.1708080412154368675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 02:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E011DA7
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 02:47:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E1FEB3F766
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 02:46:50 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libffi: upgrade to 3.4.5
Date: Fri, 16 Feb 2024 10:46:49 +0000
Message-Id: <20240216104649.2127572-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 10:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195745

From: Ross Burton <ross.burton@arm.com>

Drop the clang/VFP patch, merged in 00116b6.

Drop the FILES for ${libdir}/libffi-${PV}, this file isn't installed.

License-Update: Copyright year updated to 2024.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...m-sysv-reverted-clang-VFP-mitigation.patch | 102 ------------------
 .../{libffi_3.4.4.bb =3D> libffi_3.4.5.bb}      |   8 +-
 2 files changed, 3 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-arm-sysv-reve=
rted-clang-VFP-mitigation.patch
 rename meta/recipes-support/libffi/{libffi_3.4.4.bb =3D> libffi_3.4.5.bb=
} (82%)

diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-cl=
ang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sy=
sv-reverted-clang-VFP-mitigation.patch
deleted file mode 100644
index 3ffcb3e128e..00000000000
--- a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP=
-mitigation.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 000f1500b693a84880d2da49b77b1113f98dde35 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Fri, 27 Nov 2020 15:28:42 +0000
-Subject: [PATCH] arm/sysv: reverted clang VFP mitigation
-
-Since commit e3d2812ce43940aacae5bab2d0e965278cb1e7ea,
-seperate instructions were used when compiling under clang,
-as clang didn't allow the directives at the time. This mitigation
-now causes compilation to fail under clang 10, as described by
-https://github.com/libffi/libffi/issues/607. Now that
-clang supports the LDC and SDC instructions, this mitigation
-has been reverted.
-
-Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/747]
-Signed-off-by: Brett Warren <brett.warren@arm.com>
-
----
- src/arm/sysv.S | 33 ---------------------------------
- 1 file changed, 33 deletions(-)
-
-diff --git a/src/arm/sysv.S b/src/arm/sysv.S
-index fb36213..e4272a1 100644
---- a/src/arm/sysv.S
-+++ b/src/arm/sysv.S
-@@ -142,13 +142,8 @@ ARM_FUNC_START(ffi_call_VFP)
-=20
- 	cmp	r3, #3			@ load only d0 if possible
- 	ite	le
--#ifdef __clang__
--	vldrle d0, [r0]
--	vldmgt r0, {d0-d7}
--#else
- 	ldcle	p11, cr0, [r0]		@ vldrle d0, [r0]
- 	ldcgt	p11, cr0, [r0], {16}	@ vldmgt r0, {d0-d7}
--#endif
- 	add	r0, r0, #64		@ discard the vfp register args
- 	/* FALLTHRU */
- ARM_FUNC_END(ffi_call_VFP)
-@@ -193,25 +188,13 @@ ARM_FUNC_START(ffi_call_SYSV)
- #endif
- 0:
- E(ARM_TYPE_VFP_S)
--#ifdef __clang__
--	vstr s0, [r2]
--#else
- 	stc	p10, cr0, [r2]		@ vstr s0, [r2]
--#endif
- 	pop	{fp,pc}
- E(ARM_TYPE_VFP_D)
--#ifdef __clang__
--	vstr d0, [r2]
--#else
- 	stc	p11, cr0, [r2]		@ vstr d0, [r2]
--#endif
- 	pop	{fp,pc}
- E(ARM_TYPE_VFP_N)
--#ifdef __clang__
--	vstm r2, {d0-d3}
--#else
- 	stc	p11, cr0, [r2], {8}	@ vstm r2, {d0-d3}
--#endif
- 	pop	{fp,pc}
- E(ARM_TYPE_INT64)
- 	str	r1, [r2, #4]
-@@ -320,11 +303,7 @@ ARM_FUNC_START(ffi_closure_VFP)
- 	add	ip, sp, #16
- 	sub	sp, sp, #64+32			@ allocate frame
- 	cfi_adjust_cfa_offset(64+32)
--#ifdef __clang__
--	vstm sp, {d0-d7}
--#else
- 	stc	p11, cr0, [sp], {16}		@ vstm sp, {d0-d7}
--#endif
- 	stmdb	sp!, {ip,lr}
-=20
- 	/* See above.  */
-@@ -358,25 +337,13 @@ ARM_FUNC_START_LOCAL(ffi_closure_ret)
- 	cfi_rel_offset(lr, 4)
- 0:
- E(ARM_TYPE_VFP_S)
--#ifdef __clang__
--	vldr s0, [r2]
--#else
- 	ldc	p10, cr0, [r2]			@ vldr s0, [r2]
--#endif
- 	b	call_epilogue
- E(ARM_TYPE_VFP_D)
--#ifdef __clang__
--	vldr d0, [r2]
--#else
- 	ldc	p11, cr0, [r2]			@ vldr d0, [r2]
--#endif
- 	b	call_epilogue
- E(ARM_TYPE_VFP_N)
--#ifdef __clang__
--	vldm r2, {d0-d3}
--#else
- 	ldc	p11, cr0, [r2], {8}		@ vldm r2, {d0-d3}
--#endif
- 	b	call_epilogue
- E(ARM_TYPE_INT64)
- 	ldr	r1, [r2, #4]
diff --git a/meta/recipes-support/libffi/libffi_3.4.4.bb b/meta/recipes-s=
upport/libffi/libffi_3.4.5.bb
similarity index 82%
rename from meta/recipes-support/libffi/libffi_3.4.4.bb
rename to meta/recipes-support/libffi/libffi_3.4.5.bb
index 15d974c83e8..be96c894e2d 100644
--- a/meta/recipes-support/libffi/libffi_3.4.4.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.5.bb
@@ -8,25 +8,23 @@ library really only provides the lowest, machine depend=
ent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for valu=
es passed between the two languages."
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D32c0d09a0641daf4903e5d61cc8f2=
3a8"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1db54c9fd307a12218766c3c7f650=
ca7"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
-           file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
            "
-SRC_URI[sha256sum] =3D "d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f=
7fb8b645712df676"
+SRC_URI[sha256sum] =3D "96fff4e589e3b239d888d9aa44b3ff30693c2ba1617f9539=
25a70ddebcc102b2"
=20
 EXTRA_OECONF +=3D "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
 EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
+
 inherit autotools texinfo multilib_header github-releases
=20
 do_install:append() {
 	oe_multilib_header ffi.h ffitarget.h
 }
=20
-FILES:${PN}-dev +=3D "${libdir}/libffi-${PV}"
-
 # Doesn't compile in MIPS16e mode due to use of hand-written
 # assembly
 MIPS_INSTRUCTION_SET =3D "mips"
--=20
2.34.1


