Return-Path: <kristian@klausen.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E83AC433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 15:06:26 +0000 (UTC)
Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web09.797.1632841583850419251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 08:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk
 header.s=dkim header.b=T3hQZdK8;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29,
 mailfrom: kristian@klausen.dk)
From: Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1632841580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dtUsx81F3faS5f/Fh0r4BBKIz576/rJQTfSmbiqtY80=;
	b=T3hQZdK8MYGyweOK2xKwLy3vhikdUKq1GTkGAM9ZOkmfB5y7bdaJSw3VE+GON+4w1p3GqR
	hhKdLORlHLLFRM0kaepJWkdcuBJBOcjQwY0t2PMtbUuNzgunL7ZYcBjQK/njDRdjpKdIJH
	xbEqXKkCKD7Po/qePPBblTtjF2CqLP0=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] ovmf: add TPM PACKAGECONFIG and enable if tpm is in
 MACHINE_FEATURES
Date: Tue, 28 Sep 2021 17:06:11 +0200
Message-Id: <20210928150611.33975-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 15:06:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156422

By enabling TPM support the boot will be measured into the TPM's
Platform Configuration Registers (PCRs).

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index 4caf258e39..5d54bad473 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -10,7 +10,10 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D=
06357ddc23f46577c2aeaeaf7b776
 # compiling OVMF twice, so it is disabled by default. Distros
 # may change that default.
 PACKAGECONFIG ??=3D ""
+PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 'tpm=
', '', d)}"
+PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tp=
m', '', d)}"
 PACKAGECONFIG[secureboot] =3D ",,,"
+PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
=20
 SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;proto=
col=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
@@ -186,7 +189,7 @@ do_compile:class-target() {
=20
     bbnote "Building without Secure Boot."
     rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
-    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${F=
IXED_GCCVER}
+    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${F=
IXED_GCCVER} ${PACKAGECONFIG_CONFARGS}
     ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.fd
     ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.code.fd
     ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/ovmf.vars.fd
@@ -196,7 +199,7 @@ do_compile:class-target() {
         # Repeat build with the Secure Boot flags.
         bbnote "Building with Secure Boot."
         rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
-        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t=
 ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
+        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t=
 ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS} ${OVMF_SECURE_BOOT_FLAGS}
         ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.secboot.fd
         ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.secboot.cod=
e.fd
         ln ${build_dir}/${OVMF_ARCH}/EnrollDefaultKeys.efi ${WORKDIR}/ov=
mf/
--=20
2.25.1


