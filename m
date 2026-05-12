Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBF7CD4F25
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:37:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81678.1778607428633635322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BgHTqX2+;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9A5C168F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDF053F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778607428; bh=EQi0Ze4ABIahFdgH4TQNl3RCPJtDxzSupSYJR7krBY0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BgHTqX2+4tl6t8agqz8rlZvBYDFk0K3Fqfpg/kO3LPkNoLBSDdUMjlwhLWYtr3R72
	 bN59ukmakxs292v9+Enxumfz6O6YKU23xPsvML1V2u7A6POIXUYYFd29GuNAAyl+po
	 ZWQXjqUXk+DWy46GE1KuG5JRkkLpQXvrqAdsIiKc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] gcr: remove obsolete packaging
Date: Tue, 12 May 2026 18:37:01 +0100
Message-ID: <20260512173702.4114193-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512173702.4114193-1-ross.burton@arm.com>
References: <20260512173702.4114193-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236900

Previously the package contained UI libraries but they were removed
in the 4.0.0 release:

- gcr4 will no longer ship UI libraries, i.e. gcr-gtk3 or gcr-gtk4.

Remove a large amount of packaging metadata that is no longer needed,
and add an optional and disabled PACKAGECONFIG for the viewer tool which
is packaged separately from the libraries.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gcr/gcr_4.4.0.1.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb b/meta/recipes-gnome/g=
cr/gcr_4.4.0.1.bb
index 1f4d2f48001..fa769759c14 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
@@ -13,31 +13,23 @@ DEPENDS =3D "p11-kit glib-2.0 libgcrypt"
 CFLAGS +=3D "-D_GNU_SOURCE"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
-inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-i=
ntrospection gettext mime mime-xdg
+inherit gnomebase gi-docgen vala gobject-introspection lib_package
 UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)?)"
=20
-REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'opengl', '', d)}"
-
 SRC_URI[archive.sha256sum] =3D "0c3c341e49f9f4f2532a4884509804190a0c2663=
e6120360bb298c5d174a8098"
=20
 PACKAGECONFIG ??=3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
 	${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)} \
 "
-PACKAGECONFIG[gtk] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
 PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret,openssh"
 #'Use systemd socket activation for server programs'
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,"
+# A tool to view certificates
+PACKAGECONFIG[viewer] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
=20
-FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${datadir}/gcr-4 \
-    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
-    ${systemd_user_unitdir}/gcr-ssh-agent.service \
-"
+FILES:${PN} +=3D "${systemd_user_unitdir}/gcr-ssh-agent.*"
=20
 # http://errors.yoctoproject.org/Errors/Details/20229/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
--=20
2.43.0


