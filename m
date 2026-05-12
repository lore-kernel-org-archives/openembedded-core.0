Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB575CD4F35
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:37:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81673.1778607426424694388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tdGpvNrU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 767981684
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 414F63F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778607425; bh=KvCqtlU6xNPzlR/ab2RQ4HXWUpBTSFe4vl1iqaVUF24=;
	h=From:To:Subject:Date:From;
	b=tdGpvNrUy7B8bn+akciI0A0yYbOtRjULjiHY3ur9U/wp49tmA6Bd86X5HEeAZAwr+
	 iCb5KqDmbTyZAme1q5/leEqOcyi1ibGUfcOwa+v5/Izox6qWWJOLy3hCfIPWvyWKhT
	 aoYmW57p2PcyA1aFaKvmqGvcF3tUEnN8PADpvlrs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libportal: add explicit PACKAGECONFIG for gtk4 support
Date: Tue, 12 May 2026 18:36:58 +0100
Message-ID: <20260512173702.4114193-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236898

Instead of using the presence of the opengl DISTRO_FEATURE to control
whether the GTK 4 integration is built, add a PACKAGECONFIG for it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/libportal/libportal_0.9.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.9.1.bb b/meta/recip=
es-gnome/libportal/libportal_0.9.1.bb
index 9713f70dbb1..f4924355f93 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
@@ -14,6 +14,9 @@ GIDOCGEN_MESON_OPTION =3D 'docs'
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 ${@bb.utils.contains('DISTR=
O_FEATURES', 'opengl', 'gtk4', '', d)}"
+DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3"
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '=
gtk4', '', d)}"
+PACKAGECONFIG[gtk4] =3D "-Dbackend-gtk4=3Denabled,-Dbackend-gtk4=3Ddisab=
led,gtk4"
=20
 EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)} -Dbackend-qt5=3Ddisabled"
--=20
2.43.0


