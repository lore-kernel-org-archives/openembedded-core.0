Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EBDCA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 15:44:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16279.1791819855339380643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 08:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QHG9BIVg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E3D01AC1
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 08:44:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E9D23F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791819849; bh=0KrmLEGSC/FUDx88J23r2ZTNspq6orGHKN+q/6P+yzw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QHG9BIVgYyjhW+JPdlpvEZvuKQanbKBfaqYOE8C0+gHxij2sknLQAqugVipZQrju8
	 hkc0kJwHnjfv9oHOicKoMt9j+PGBcCUp7jKIVYnrX4MjSd0eyM52sxxqB/sSYAz/ih
	 s/y/JC9gUXGHJN7qnoJWu6UmN+zUJyMUED4fPbes=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gtk+3: add PACKAGECONFIG for demos and examples
Date: Mon, 12 Oct 2026 16:44:04 +0100
Message-ID: <20261012154404.870798-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012154404.870798-1-ross.burton@arm.com>
References: <20261012154404.870798-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 15:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247667

Instead of explicitly enabling the examples and demos by default and
disabling them in native builds, add a PACKAGECONFIG and enable it only
in target builds.

This removes the demos from the nativesdk build, and more interestingly
removes the unneeded librsvg-native dependency from the gtk+3-native
build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.52.bb
index f385901bef7..a71386c2adb 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
@@ -43,9 +43,9 @@ do_configure:prepend() {
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
=20
 EXTRA_OEMESON =3D "-Dxinerama=3Dno -Dtests=3Dfalse"
-EXTRA_OEMESON:append:class-native =3D " -Ddemos=3Dfalse -Dexamples=3Dfal=
se"
=20
 PACKAGECONFIG ??=3D " \
+	examples \
 	${@bb.utils.filter('DISTRO_FEATURES', 'opengl x11', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'wayland', ''=
, d)} \
 "
@@ -60,6 +60,7 @@ PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-=
cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovid=
ers=3Dfalse,libcloudproviders"
 PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tinysp=
arql,localsearch"
+PACKAGECONFIG[examples] =3D "-Ddemos=3Dtrue -Dexamples=3Dtrue,-Ddemos=3D=
false -Dexamples=3Dfalse"
=20
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon=
-cache-3.0
@@ -140,7 +141,7 @@ GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} gli=
bc-gconv-iso8859-1"
 RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
 RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland"=
, "wayland-protocols", "", d)}"
-RDEPENDS:${PN}-demo +=3D "librsvg-gtk"
+RDEPENDS:${PN}-demo +=3D "${@bb.utils.contains("PACKAGECONFIG", "example=
s", "librsvg-gtk", "", d)} "
=20
 PACKAGES_DYNAMIC +=3D "^gtk3-immodule-.* ^gtk3-printbackend-.*"
=20
--=20
2.43.0


