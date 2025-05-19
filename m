Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27357C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46499.1747643634774883862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28E08153B
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 01:33:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4D383F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 01:33:53 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] clang: Include the libclang python bindings in the build
Date: Mon, 19 May 2025 09:33:44 +0100
Message-Id: <20250519083344.1646432-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216827

Modify the clang recipe to provide also the python module
'clang' when building libclang.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 changes:
 - used PACKAGECONFIG and default on
---
 meta/recipes-devtools/clang/clang_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index b41b700292c7..42f52af4056e 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -49,7 +49,7 @@ def get_clang_host_arch(bb, d):
 def get_clang_target_arch(bb, d):
     return get_clang_arch(bb, d, 'TARGET_ARCH')
=20
-PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs \
+PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs lib=
clang-python \
                               ${@bb.utils.contains('TC_CXX_RUNTIME', 'll=
vm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
                               "
=20
@@ -90,6 +90,7 @@ PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3D=
ON,-DLLVM_USE_SPLIT_DWARF=3DO
 PACKAGECONFIG[terminfo] =3D "-DLLVM_ENABLE_TERMINFO=3DON -DCOMPILER_RT_T=
ERMINFO_LIB=3DON,-DLLVM_ENABLE_TERMINFO=3DOFF -DCOMPILER_RT_TERMINFO_LIB=3D=
OFF,ncurses,"
 PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_IN=
CDIR=3D${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[unwindlib] =3D "-DCLANG_DEFAULT_UNWINDLIB=3Dlibunwind,-DCL=
ANG_DEFAULT_UNWINDLIB=3Dlibgcc,,"
+PACKAGECONFIG[libclang-python] =3D "-DCLANG_PYTHON_BINDINGS_VERSIONS=3D$=
{PYTHON_BASEVERSION},,"
=20
 OECMAKE_SOURCEPATH =3D "${S}/llvm"
=20
@@ -312,7 +313,7 @@ PROVIDES:append:class-native =3D " llvm-native libclc=
-native"
 PROVIDES:append:class-target =3D " llvm libclc"
 PROVIDES:append:class-nativesdk =3D " nativesdk-llvm nativesdk-libclc"
=20
-PACKAGES =3D+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-=
tidy ${PN}-format ${PN}-tools ${PN}-clc \
+PACKAGES =3D+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-python ${P=
N}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
              libclang lldb lldb-server liblldb llvm-linker-tools"
=20
=20
@@ -342,6 +343,8 @@ FILES:${PN}-libclang-cpp =3D "${libdir}/libclang-cpp.=
so.*"
=20
 FILES:${PN}-lldb-python =3D "${libdir}/python*/site-packages/lldb/*"
=20
+FILES:${PN}-libclang-python =3D "${libdir}/python*/site-packages/clang/*=
"
+
 FILES:${PN}-tidy =3D "${bindir}/*clang-tidy*"
 FILES:${PN}-format =3D "${bindir}/*clang-format*"
=20
--=20
2.34.1


