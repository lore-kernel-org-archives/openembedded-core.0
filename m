Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B13CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:54:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76367.1778594052905759413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 06:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qd6mqOg/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A765D1691
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BF203F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778594051; bh=hEuXjAWZ0DCrFeBm1KGpY1ou0YZnQANi5KeXuwvryjU=;
	h=From:To:Subject:Date:From;
	b=qd6mqOg/2jjNh/rg8bcWaum7Pjq4l7k3t+439rrEK3twCGtr25ZQaHWcndensTNv6
	 NqTS5eQfALRmUtru+z5TK+9R4vgbInuXbDpfM9/SYz/xKovJ9mWpb4zh9AaQ669zOM
	 juJRHi2j3ZAfqnC9JFJm6mOQjvQoFfj0Mh4dEdYw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] weston: remove obsolete .la deletion
Date: Tue, 12 May 2026 14:54:03 +0100
Message-ID: <20260512135407.3056055-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 13:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236883

Weston is built with Meson now, so there's no need to delete .la files
that don't exist.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/wayland/weston_15.0.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_15.0.1.bb b/meta/recipe=
s-graphics/wayland/weston_15.0.1.bb
index c4158e7ea3d..946e64cea5e 100644
--- a/meta/recipes-graphics/wayland/weston_15.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_15.0.1.bb
@@ -101,9 +101,6 @@ PACKAGECONFIG[vnc] =3D "-Dbackend-vnc=3Dtrue,-Dbacken=
d-vnc=3Dfalse,neatvnc libpam"
 PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libper=
fetto"
=20
 do_install:append() {
-	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.la
-
 	# If X11, ship a desktop file to launch it
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
 		install -d ${D}${datadir}/applications
--=20
2.43.0


