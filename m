Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27DAC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:08:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11856.1747314488567807840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80AC914BF
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:07:56 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA3293F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:08:07 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] clang: Include the libclang python bindings in the build
Date: Thu, 15 May 2025 14:07:53 +0100
Message-Id: <20250515130753.326236-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216672

Modify the clang recipe to provide also the python module
'clang' when building libclang.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index b41b700292c7..6634eb5416b6 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -163,6 +163,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
                   -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
                   -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
+                  -DCLANG_PYTHON_BINDINGS_VERSIONS=3D'${PYTHON_BASEVERSI=
ON}' \
 "
=20
 EXTRA_OECMAKE:append:class-native =3D "\
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


