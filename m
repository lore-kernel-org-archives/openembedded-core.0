Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF51C87FD1
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 19:52:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5443.1754337162752387425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 12:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5D821E4D
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9028E3F5A1
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] dbus-glib: package the binding tool into PN-tools, enable nativesdk
Date: Mon,  4 Aug 2025 20:52:31 +0100
Message-ID: <20250804195237.149379-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221437

In a SDK environment we need a nativesdk build of dbus-glib for the
dbus-binding-tool binary.  Add a nativesdk variation and put the tool int=
o
a -tools subpackage so it can be installed if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/dbus/dbus-glib_0.114.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-cor=
e/dbus/dbus-glib_0.114.bb
index 28a9d4a4fc7..ff3d282ac6f 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -29,16 +29,19 @@ PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[tests] =3D "--enable-tests,,,"
=20
 EXTRA_OECONF:class-target =3D "--with-dbus-binding-tool=3D${STAGING_BIND=
IR_NATIVE}/dbus-binding-tool"
+EXTRA_OECONF:class-nativesdk =3D "--with-dbus-binding-tool=3D${STAGING_B=
INDIR_NATIVE}/dbus-binding-tool"
=20
-PACKAGES +=3D "${PN}-tests"
+PACKAGES +=3D "${PN}-tests ${PN}-tools"
=20
 FILES:${PN} =3D "${libdir}/lib*${SOLIBS}"
 FILES:${PN}-bash-completion +=3D "${libexecdir}/dbus-bash-completion-hel=
per"
 LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
-FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-too=
l"
-FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
+
+RDEPENDS:${PN}-dev +=3D "${PN}-tools"
=20
 RDEPENDS:${PN}-tests =3D "${PN}"
 FILES:${PN}-tests =3D "${datadir}/${BPN}/tests"
=20
-BBCLASSEXTEND =3D "native"
+FILES:${PN}-tools =3D "${bindir}"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


