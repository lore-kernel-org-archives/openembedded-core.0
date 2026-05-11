Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C2CCD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:29:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46152.1778491794405190885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yqY+qRUu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C85BD1A350A;
	Mon, 11 May 2026 09:29:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9699960646;
	Mon, 11 May 2026 09:29:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84E4011AE8433;
	Mon, 11 May 2026 11:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778491792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=czyHg0LbcI0Sl2b8I79NQ/1uapgWk4bBfGm6NxKs8cQ=;
	b=yqY+qRUui3TfB9MOdcAF9x0Defvrg/wSQqbMJOppGueAALmVN20TgOj3wsIMnvVntpePfo
	yZE1Vyi74QGbeqVvsbjkxD/g9/dEoa9Ms0jRzqq4OSCFhGcA1tjjLDyeWNMoKZH4g3J2It
	u+tVnvD4VkGFKFNvNJWq0NSDmoZ6VMFUTmf1wPbY6fsQGa6MfZEfS8wdoS42/ARkgyehGR
	L7igggw9wxtt6QcCHL6befVb/gQnUQJcX84mzUfsWeofPeQEr3720LAv5eGQEsU+yVfFFC
	7kLcITbNQeuvxxkfkYpPUNG403YbJ6mY4eDOgnMJtSj9s5vwJEBbd0C1xutQ3A==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	khem.raj@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 3/3] ovmf: add support for Clang toolchain
Date: Mon, 11 May 2026 11:29:35 +0200
Message-ID: <20260511092935.2631121-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236793

ovmf can be built with clang by using "CLANGDWARF" toolchain, so add
TARGET_TOOLS variable to represent the switch between "GCC" and
"CLANGDWARF".

Since the targets represented by FIXED_GCCVER were deprecated upstream,
remove them (and FIXED_GCCVER itself) from the recipe and use "GCC"
instead.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 43 ++++++------------------------
 1 file changed, 8 insertions(+), 35 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index 8e2d172f66..93380b2ba9 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -55,6 +55,7 @@ inherit deploy
 PARALLEL_MAKE =3D ""
=20
 DEPENDS =3D "nasm-native acpica-native ovmf-native util-linux-native"
+DEPENDS:append:toolchain-clang =3D " lld-native"
=20
 EDK_TOOLS_DIR =3D "edk2_basetools"
=20
@@ -145,39 +146,13 @@ fix_toolchain:append:class-native() {
 export NASM_PREFIX_MAP =3D "--debug-prefix-map=3D${WORKDIR}=3D${TARGET_D=
BGSRC_DIR}"
 export GCC_PREFIX_MAP =3D "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -W=
no-maybe-uninitialized"
=20
-GCC_VER =3D "$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
-
-fixup_target_tools() {
-    case ${1} in
-      4.4.*)
-        FIXED_GCCVER=3DGCC44
-        ;;
-      4.5.*)
-        FIXED_GCCVER=3DGCC45
-        ;;
-      4.6.*)
-        FIXED_GCCVER=3DGCC46
-        ;;
-      4.7.*)
-        FIXED_GCCVER=3DGCC47
-        ;;
-      4.8.*)
-        FIXED_GCCVER=3DGCC48
-        ;;
-      4.9.*)
-        FIXED_GCCVER=3DGCC49
-        ;;
-      *)
-        FIXED_GCCVER=3DGCC5
-        ;;
-    esac
-    echo ${FIXED_GCCVER}
-}
-
 do_compile:class-native() {
     oe_runmake -C ${S}/BaseTools
 }
=20
+TARGET_TOOLS ?=3D "GCC"
+TARGET_TOOLS:toolchain-clang =3D "CLANGDWARF"
+
 do_compile:class-target() {
     export LFLAGS=3D"${LDFLAGS}"
     PARALLEL_JOBS=3D"${@oe.utils.parallel_make_argument(d, '-n %d')}"
@@ -198,13 +173,12 @@ do_compile:class-target() {
     rm -rf ${WORKDIR}/ovmf
     mkdir ${WORKDIR}/ovmf
     OVMF_DIR_SUFFIX=3D"X64"
-    FIXED_GCCVER=3D$(fixup_target_tools ${GCC_VER})
-    bbnote FIXED_GCCVER is ${FIXED_GCCVER}
-    build_dir=3D"${S}/Build/Ovmf$OVMF_DIR_SUFFIX/${OVMF_BUILD_TYPE}_${FI=
XED_GCCVER}"
+    bbnote TARGET_TOOLS is ${TARGET_TOOLS}
+    build_dir=3D"${S}/Build/Ovmf$OVMF_DIR_SUFFIX/${OVMF_BUILD_TYPE}_${TA=
RGET_TOOLS}"
=20
     bbnote "Building without Secure Boot."
     rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
-    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUILD_T=
YPE} -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS}
+    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUILD_T=
YPE} -t ${TARGET_TOOLS} ${PACKAGECONFIG_CONFARGS}
     ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.fd
     ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.code.fd
     ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/ovmf.vars.fd
@@ -214,7 +188,7 @@ do_compile:class-target() {
         # Repeat build with the Secure Boot flags.
         bbnote "Building with Secure Boot."
         rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
-        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUI=
LD_TYPE} -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS} ${OVMF_SECURE_BOOT_=
FLAGS}
+        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUI=
LD_TYPE} -t ${TARGET_TOOLS} ${PACKAGECONFIG_CONFARGS} ${OVMF_SECURE_BOOT_=
FLAGS}
         ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.secboot.fd
         ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.secboot.cod=
e.fd
         ln ${build_dir}/${OVMF_ARCH}/EnrollDefaultKeys.efi ${WORKDIR}/ov=
mf/
@@ -277,4 +251,3 @@ do_deploy:class-target() {
 addtask do_deploy after do_compile before do_build
=20
 BBCLASSEXTEND =3D "native"
-TOOLCHAIN =3D "gcc"
--=20
2.47.0


