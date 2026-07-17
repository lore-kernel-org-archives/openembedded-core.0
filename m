Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148B8C44515
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89.1784303204630067597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TBu8LW9h;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0078C1477
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6B0B3F905
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784303204; bh=gF+blKWjVE0s4vAC/JcYSmOGSkA4qZOKT6YNmo/fpkI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TBu8LW9hV1Um7WqwtrAz5CnUE6fcJr3AHFi7HStofLS+fXK4RcEDWUce4PG8iAACn
	 +QunFuTnPlJyt2melA3/u+kOtP1Qv7zigpi+I2m+0Z4RcAHKX3DYoBfpeZuthCHMmx
	 5/W5hjn0XhhCbl2CgYZmsuURm+4G5UHrA/Ui0sQU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/7] keymaps: remove obsolete systemd masking
Date: Fri, 17 Jul 2026 16:46:10 +0100
Message-ID: <20260717154614.3701267-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717154614.3701267-1-ross.burton@arm.com>
References: <20260717154614.3701267-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241210

systemd no longer has sysvinit compatibility[1], so it won't try and run
the init script in this recipe that is also implemented by systemd.

Remove the explicit systemd unit masking, effectively reverting [2].

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility=
")
[2] oe-core 8cfba07e24 ("keymaps: mask keymap when necessary")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/k=
eymaps/keymaps_1.0.bb
index b7e6ef6cb11..546ebba5dcc 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -11,13 +11,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-# As the recipe doesn't inherit systemd.bbclass, we need to set this var=
iable
-# manually to avoid unnecessary postinst/preinst generated.
-python __anonymous() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
 inherit update-rc.d
=20
 SRC_URI =3D "file://keymap.sh"
@@ -36,14 +29,4 @@ do_install () {
     fi
 }
=20
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','=
systemd sysvinit','systemd-systemctl-native','',d)}"
-pkg_postinst:${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','fa=
lse',d)}; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		systemctl $OPTS mask keymap.service
-	fi
-}
-
 ALLOW_EMPTY:${PN} =3D "1"
--=20
2.43.0


