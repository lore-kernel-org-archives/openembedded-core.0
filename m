Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5F5CA0EC1
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 19:52:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5446.1754337165534835047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B8111E4D
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8DEB3F5A1
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] gdk-pixbuf: clean up PACKAGECONFIG
Date: Mon,  4 Aug 2025 20:52:36 +0100
Message-ID: <20250804195237.149379-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804195237.149379-1-ross.burton@arm.com>
References: <20250804195237.149379-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221442

PTEST_ENABLED is always false in native builds, so there's no need for
an explict native override.

Use ??=3D as that is the idiomatic way to assign to PACKAGECONFIG.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index 96487a284af..060d7735ad1 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -34,9 +34,8 @@ LIBV =3D "2.10.0"
=20
 GDK_PIXBUF_LOADERS ?=3D "png jpeg gif others"
=20
-PACKAGECONFIG =3D "${GDK_PIXBUF_LOADERS} \
-                 ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '',=
 d)}"
-PACKAGECONFIG:class-native =3D "${GDK_PIXBUF_LOADERS}"
+PACKAGECONFIG ??=3D "${GDK_PIXBUF_LOADERS} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)}"
=20
 PACKAGECONFIG[png] =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
 PACKAGECONFIG[jpeg] =3D "-Djpeg=3Denabled,-Djpeg=3Ddisabled,jpeg"
--=20
2.43.0


