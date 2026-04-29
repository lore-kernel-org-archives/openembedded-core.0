Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F7CD13DA
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.928.1777481308246454173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EYm6cdGP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC2233EA
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 621603F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481307; bh=cKhCWOp3q0O2fQyGWeTehsE44SOKtjwwSGP2LogTVxA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EYm6cdGPeOM81ybkrnBhxhMWjMp4R1yuyX1M+4MXZOIrXZwxWUCjYvc9QaNOTBPPg
	 X3yh74nh8Athjxb6hC3gwVjM95YwbOFHPvwjAhcCoe1q+MLunOA2/JRE9LHkbY+ruN
	 XzeeWngrGzo/oGO+hhmpaICilzOQzgoVltL2Byy0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] classes/kernel: use ${firmwaredir} instead of ${nonarch_base_libdir}/firmware
Date: Wed, 29 Apr 2026 17:48:13 +0100
Message-ID: <20260429164821.3425757-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236114

Now that firmwaredir has been defined, use it instead of explicitly using
${nonarch_base_libdir}/firmware.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 meta/classes-recipe/module.bbclass | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
index 2d8565bd554..50cef17f69e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -451,7 +451,7 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
-		oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/$=
{KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware mo=
dules_install
+		oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/$=
{KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
@@ -715,7 +715,7 @@ pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
 PACKAGESPLITFUNCS =3D+ "split_kernel_packages"
=20
 python split_kernel_packages () {
-    do_split_packages(d, root=3D'${nonarch_base_libdir}/firmware', file_=
regex=3Dr'^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern=3D'${KERNEL_PACKA=
GE_NAME}-firmware-%s', description=3D'Firmware for %s', recursive=3DTrue,=
 extra_depends=3D'')
+    do_split_packages(d, root=3D'${firmwaredir}', file_regex=3Dr'^(.*)\.=
(bin|fw|cis|csp|dsp)$', output_pattern=3D'${KERNEL_PACKAGE_NAME}-firmware=
-%s', description=3D'Firmware for %s', recursive=3DTrue, extra_depends=3D=
'')
 }
=20
 # Many scripts want to look in arch/$arch/boot for the bootable
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/mod=
ule.bbclass
index ca2dcba43e0..6b2c09f441c 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -44,7 +44,7 @@ module_do_compile() {
 module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake DEPMOD=3Decho MODLIB=3D"${D}${nonarch_base_libdir}/modules/$=
{KERNEL_VERSION}" \
-	           INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmware" \
+	           INSTALL_FW_PATH=3D"${D}${firmwaredir}" \
 	           CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_=
OBJCOPY}" \
 	           STRIP=3D"${KERNEL_STRIP}" \
 	           O=3D${STAGING_KERNEL_BUILDDIR} \
--=20
2.43.0


