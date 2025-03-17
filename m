Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FE6C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:27:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52488.1742218073230655202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD6613D5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:28:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BC463F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:27:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] mdadm: don't inherit autotools
Date: Mon, 17 Mar 2025 13:27:47 +0000
Message-ID: <20250317132749.1778185-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213093

mdadm doesn't use autotools at all:
- do_configure does nothing as it can't find configure.ac or configure
- do_compile is overridden to pass SYSROOT
- do_install is overridden but still calls autotools_do_install (which
  is just 'make install DESTDIR=3D$D') and then appended.

Clean this up by passing SYSROOT and STRIP in EXTRA_OEMAKE, removing the
now-obsolete do_compile(), and merging the do_install()s.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/mdadm/mdadm_4.3.bb | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.3.bb b/meta/recipes-exte=
nded/mdadm/mdadm_4.3.bb
index 63c61b68c96..d90497d5a74 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.3.bb
@@ -28,7 +28,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/raid/mdadm=
/${BPN}-${PV}.tar.xz \
=20
 SRC_URI[sha256sum] =3D "416727ae1f1080ea6e3090cea36dd076826fc369151e36ab=
736557ba92196f9f"
=20
-inherit autotools-brokensep ptest systemd
+inherit ptest systemd
=20
 DEPENDS =3D "udev"
=20
@@ -44,30 +44,19 @@ CFLAGS:append:mipsarchn64 =3D ' -D__SANE_USERSPACE_TY=
PES__'
 CFLAGS:append:mipsarchn32 =3D ' -D__SANE_USERSPACE_TYPES__'
=20
 EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CXFLAGS=3D"${CFLAGS}" SYSTEMD_DIR=3D=
${systemd_system_unitdir} \
-                BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_lib=
dir}/udev" LDFLAGS=3D"${LDFLAGS}"'
+                BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_lib=
dir}/udev" LDFLAGS=3D"${LDFLAGS}" \
+                SYSROOT=3D"${STAGING_DIR_TARGET}" STRIP=3D'
=20
 DEBUG_OPTIMIZATION:append =3D " -Wno-error"
=20
-do_compile() {
-	oe_runmake SYSROOT=3D"${STAGING_DIR_TARGET}"
-}
-
 do_install() {
-	export STRIP=3D""
-	autotools_do_install
-}
-
-do_install:append() {
+        oe_runmake 'DESTDIR=3D${D}' install install-systemd
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.c=
onf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/=
mdmonitor
 }
=20
-do_install:append() {
-        oe_runmake install-systemd DESTDIR=3D${D}
-}
-
 do_compile_ptest() {
 	oe_runmake test
 }
--=20
2.43.0


