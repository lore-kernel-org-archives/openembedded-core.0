Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFB9E7719A
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 18:31:58 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.21417.1736620310182614466
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jan 2025 10:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=AUlHnLIe;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BBCB101ECBBC;
	Sat, 11 Jan 2025 19:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736620307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QmVyT16Q6KBtkfVDtnUoxoBV3ABHqBbcU6aVquTUeQo=;
	b=AUlHnLIeBIK/kGY4HAjujvxxggaSiY3ejpnlPkSe4rqpC6kwWvEYhVqFYg8xoRfxbe4tuO
	j9e4hcxjCU8SUbys9thd0cwbuYfIIdzF9YSntxZt0BR9f6ztwgOamH1svl55kj89LJWbiJ
	g00/eA1+ihuuma0jGfKBACVvgo7fUo4XvO+/EPulSdLDk+BsH8D3tobtOH9mBQTnUJoUb8
	5OukdVMtkm1NoxGHP7uq0qAShtTwoRETE7p4G99+yCUitR8X1FL6h0ynF0Mr+QJvuaktpi
	Oy0xZcQkwK1ReC5LJuUmoN7zFZfcgB+B1k5zTDKD2I1yjLpnNAeD182soxJrPQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
Date: Sat, 11 Jan 2025 19:31:25 +0100
Message-ID: <20250111183134.22040-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 18:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209671

In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
kernel-fitimage.bbclass is in use to generate signed kernel
fitImage, there is a circular dependency between uboot-sign
and kernel-fitimage bbclasses . The loop looks like this:

kernel-fitimage.bbclass:
- do_populate_sysroot depends on do_assemble_fitimage
  - do_assemble_fitimage depends on virtual/bootloader:do_populate_sysroo=
t
    - virtual/bootloader:do_populate_sysroot depends on virtual/bootloade=
r:do_install
      =3D> The virtual/bootloader:do_install installs and the
         virtual/bootloader:do_populate_sysroot places into
         sysroot an U-Boot environment script embedded into
         kernel fitImage during do_assemble_fitimage run .

uboot-sign.bbclass:
- DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately
  - do_deploy depends on do_uboot_assemble_fitimage
  - do_install depends on do_uboot_assemble_fitimage
  - do_uboot_assemble_fitimage depends on virtual/kernel:do_populate_sysr=
oot
    =3D> do_install depends on virtual/kernel:do_populate_sysroot

=3D> virtual/bootloader:do_install depends on virtual/kernel:do_populate_=
sysroot
   virtual/kernel:do_populate_sysroot depends on virtual/bootloader:do_in=
stall

Attempt to resolve the loop by making u-boot do_compile() task already de=
ploy the
U-Boot environment script used by kernel-fitimage.bbclass do_assemble_fit=
image()
into STAGING_DIR_HOST , and then by making kernel-fitimage.bbclass depend=
 on
virtual/bootloader:do_compile instead of virtual/bootloader:do_populate_s=
ysroot .

Make sure it is only uboot-sign.bbclass do_uboot_assemble_fitimage() task=
 that
depends on KERNEL_PN:do_populate_sysroot .

Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies"=
)
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@seco.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 meta/classes-recipe/uboot-sign.bbclass      | 3 +--
 meta/recipes-bsp/u-boot/u-boot.inc          | 6 ++++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-r=
ecipe/kernel-fitimage.bbclass
index 67c98adb23..81245446a2 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -42,7 +42,7 @@ python __anonymous () {
=20
     ubootenv =3D d.getVar('UBOOT_ENV')
     if ubootenv:
-        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/boo=
tloader:do_populate_sysroot')
+        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/boo=
tloader:do_compile')
=20
     #check if there are any dtb providers
     providerdtb =3D d.getVar("PREFERRED_PROVIDER_virtual/dtb")
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
index a17be745ce..e1a37b4343 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -96,8 +96,6 @@ python() {
     sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
-    if sign:
-        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
 }
=20
 concat_dtb() {
@@ -350,6 +348,7 @@ uboot_assemble_fitimage_helper() {
 	fi
 }
=20
+do_uboot_assemble_fitimage[depends] =3D "${@(d.getVar('KERNEL_PN') + ':d=
o_populate_sysroot') if d.getVar('UBOOT_SIGN_ENABLE') =3D=3D 1 else ''}"
 do_uboot_assemble_fitimage() {
 	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
 		cp "${STAGING_DIR_HOST}/sysroot-only/fitImage" "${B}/fitImage-linux"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index 3270c22e8d..61f98ec5b5 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -72,6 +72,12 @@ do_compile () {
     then
         ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKD=
IR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
     fi
+
+    if [ -n "${UBOOT_ENV}" ]
+    then
+        mkdir -p ${STAGING_DIR_HOST}/boot/
+        install -m 644 ${B}/${UBOOT_ENV_BINARY} ${STAGING_DIR_HOST}/boot=
/${UBOOT_ENV_IMAGE}
+    fi
 }
=20
 uboot_compile_config () {
--=20
2.45.2


