Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C264EC47DDE
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:04:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.74422.1705932249839129299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 945BEFEC
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 328D33F73F
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:09 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] xserver-xorg: add PACKAGECONFIG for xvfb
Date: Mon, 22 Jan 2024 14:04:05 +0000
Message-Id: <20240122140406.3837333-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122140406.3837333-1-ross.burton@arm.com>
References: <20240122140406.3837333-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194163

From: Ross Burton <ross.burton@arm.com>

Xvfb is pretty niche and has outstanding unsolved security issues, so
let people disable it and add a conditional CVE_STATUS to reflect this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
index 085fcaf87a5..5a0fceea865 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -116,14 +116,13 @@ FILES:xf86-video-modesetting =3D "${libdir}/xorg/mo=
dules/drivers/modesetting_drv.s
=20
 EXTRA_OEMESON +=3D " \
                  -Dxnest=3Dfalse \
-                 -Dxvfb=3Dtrue \
                  -Ddtrace=3Dfalse \
                  -Dint10=3Dx86emu \
                  -Dxkb_output_dir=3D/var/lib/xkb \
 "
=20
 OPENGL_PKGCONFIGS =3D "dri glx glamor dri3"
-PACKAGECONFIG ??=3D "dga dri2 udev ${XORG_CRYPTO} \
+PACKAGECONFIG ??=3D "dga dri2 udev xvfb ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${=
OPENGL_PKGCONFIGS}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 's=
ystemd-logind', '', d)} \
 "
@@ -138,6 +137,7 @@ PACKAGECONFIG[glamor] =3D "-Dglamor=3Dtrue,-Dglamor=3D=
false,libepoxy virtual/libgbm,li
 PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunw=
ind"
 PACKAGECONFIG[systemd-logind] =3D "-Dsystemd_logind=3Dtrue,-Dsystemd_log=
ind=3Dfalse,dbus,"
 PACKAGECONFIG[xinerama] =3D "-Dxinerama=3Dtrue,-Dxinerama=3Dfalse"
+PACKAGECONFIG[xvfb] =3D "-Dxvfb=3Dtrue,-Dxvfb=3Dfalse"
=20
 # Xorg requires a SHA1 implementation, pick one
 XORG_CRYPTO ??=3D "openssl"
@@ -175,3 +175,5 @@ python populate_packages:prepend() {
     d.appendVar("RPROVIDES:" + pn, " " + get_abi("input"))
     d.appendVar("RPROVIDES:" + pn, " " + get_abi("video"))
 }
+
+CVE_STATUS[CVE-2023-5574] =3D "${@bb.utils.contains('PACKAGECONFIG', 'xv=
fb', '', 'not-applicable-config: specific to Xvfb', d)}"
--=20
2.34.1


