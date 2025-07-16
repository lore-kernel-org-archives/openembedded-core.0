Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA47C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 12:30:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20830.1752669050135634573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 05:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 663ED12FC
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 05:30:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 486A03F694
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 05:30:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] clang: remove obsolete 'terminfo' PACKAGECONFIG
Date: Wed, 16 Jul 2025 13:30:47 +0100
Message-ID: <20250716123047.1322878-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 12:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220449

Neither LLVM_ENABLE_TERMINFO or COMPILER_RT_TERMINFO_LIB are used in the
current CMakeLists.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 194e690a8c4..d70f2c0133b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -57,8 +57,7 @@ PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtt=
i shared-libs libclang-pyth
                               ${@bb.utils.contains('TC_CXX_RUNTIME', 'll=
vm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
                               "
=20
-PACKAGECONFIG ??=3D "terminfo \
-                   ${PACKAGECONFIG_CLANG_COMMON} \
+PACKAGECONFIG ??=3D "${PACKAGECONFIG_CLANG_COMMON} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto',=
 d)} \
                    "
 PACKAGECONFIG:class-native =3D "clangd \
@@ -89,7 +88,6 @@ PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLV=
M_ENABLE_LIBPFM=3DOFF,libpfm,"
 PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F,,"
 PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK=
_LLVM_DYLIB=3DON,,,"
 PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3DON,-DLLVM_USE_S=
PLIT_DWARF=3DOFF,,"
-PACKAGECONFIG[terminfo] =3D "-DLLVM_ENABLE_TERMINFO=3DON -DCOMPILER_RT_T=
ERMINFO_LIB=3DON,-DLLVM_ENABLE_TERMINFO=3DOFF -DCOMPILER_RT_TERMINFO_LIB=3D=
OFF,ncurses,"
 PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_IN=
CDIR=3D${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[unwindlib] =3D "-DCLANG_DEFAULT_UNWINDLIB=3Dlibunwind,-DCL=
ANG_DEFAULT_UNWINDLIB=3Dlibgcc,,"
 PACKAGECONFIG[libclang-python] =3D "-DCLANG_PYTHON_BINDINGS_VERSIONS=3D$=
{PYTHON_BASEVERSION},,"
--=20
2.43.0


