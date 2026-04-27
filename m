Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE9AFF8867
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:08:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6475.1777324131109996501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vTf/9LSY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B0C316F2
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4ABA03F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777324130; bh=7wCPeoVnX+RjDiPU77oROCWf1NJbUvTIpv4kaXYE1lQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vTf/9LSY+4uqdNhLylljqShTA9HPJkRPg3i3vlj0PlZc/oW5wzbOL5L1djEdaHSi3
	 RXGVRwiOIUquCqJFe3VgL/X2nzTWly8xnlpOM4n0OYtjZVQrOsW0MBZN6z3k1YR/LT
	 NeO/5Z+G1FFajvWTGQ4uqU/QmZPzuYuFpaJ1V4PU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] wpa-supplicant: remove obsolete explicit debug packaging
Date: Mon, 27 Apr 2026 22:08:44 +0100
Message-ID: <20260427210847.3027890-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427210847.3027890-1-ross.burton@arm.com>
References: <20260427210847.3027890-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236026

The .debug directories are packaged automatically by default, so this is
redundant.

This recipe packages the plugin debug symbols into their own packages,
there's no real advantage to doing this so remove that logic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../wpa-supplicant/wpa-supplicant_2.11.bb                  | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11=
.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c13..71bfb090a0a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -113,13 +113,11 @@ PACKAGES +=3D "${PN}-plugins"
 ALLOW_EMPTY:${PN}-plugins =3D "1"
=20
 PACKAGES_DYNAMIC +=3D "^${PN}-plugin-.*$"
-NOAUTOPACKAGEDEBUG =3D "1"
=20
 FILES:${PN}-passphrase =3D "${sbindir}/wpa_passphrase"
 FILES:${PN}-cli =3D "${sbindir}/wpa_cli"
 FILES:${PN}-lib =3D "${libdir}/libwpa_client*${SOLIBSDEV}"
 FILES:${PN} +=3D "${datadir}/dbus-1/system-services/* ${systemd_system_u=
nitdir}/*"
-FILES:${PN}-dbg +=3D "${sbindir}/.debug ${libdir}/.debug"
=20
 CONFFILES:${PN} +=3D "${sysconfdir}/wpa_supplicant.conf"
=20
@@ -130,14 +128,9 @@ SYSTEMD_AUTO_ENABLE =3D "disable"
=20
 python split_wpa_supplicant_libs () {
     libdir =3D d.expand('${libdir}/wpa_supplicant')
-    dbglibdir =3D os.path.join(libdir, '.debug')
-
     split_packages =3D do_split_packages(d, libdir, r'^(.*)\.so', '${PN}=
-plugin-%s', 'wpa_supplicant %s plugin', prepend=3DTrue)
-    split_dbg_packages =3D do_split_packages(d, dbglibdir, r'^(.*)\.so',=
 '${PN}-plugin-%s-dbg', 'wpa_supplicant %s plugin - Debugging files', pre=
pend=3DTrue, extra_depends=3D'${PN}-dbg')
-
     if split_packages:
         pn =3D d.getVar('PN')
         d.setVar('RRECOMMENDS:' + pn + '-plugins', ' '.join(split_packag=
es))
-        d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_d=
bg_packages))
 }
 PACKAGESPLITFUNCS +=3D "split_wpa_supplicant_libs"
--=20
2.43.0


