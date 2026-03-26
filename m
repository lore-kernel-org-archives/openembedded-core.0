Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F029810A88E1
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:47:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50728.1774540051691320645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GXdE9rE/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E30571E8D
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:47:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77E493F641
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774540050; bh=1HPBVa6JBH7VTcYr7wc+3QS0PGI7epPCAkMkuIi2sv4=;
	h=From:To:Subject:Date:From;
	b=GXdE9rE/G4LTmKAXMJEzTv/I45xMUQ0YE+T6ZKvIK3ZiqSVKgW9yAybMEm7I6tIuW
	 UdFyqo5SBThuNN0FmY2JWcyIAXFtXq/sScPqzQCByeXQDg0rKefLbwRj2XmbjvKgNU
	 sGRjEUMn4/dDo1BOZ/Z41vKNe2Bm/5rI5mftth0c=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gobject-introspection: remove redundant build dependencies
Date: Thu, 26 Mar 2026 15:47:26 +0000
Message-ID: <20260326154726.1812344-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234029

This recipe gained a build dependency on _target_ python3-setuptools
recently[1], but this shouldn't be needed. If setuptools is needed for
build, then the correct dependency would be python3-setuptools-native.

The dependency on target python3 is redundant as the python3targetconfig
class pulls this in already.

[1] oe-core 57a5dfd3785 ("gobject-introspection: split tools and giscanne=
r into a separate package")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gobject-introspection/gobject-introspection_1.86.0.bb      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.86.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.86.0.bb
index 506ed990763..fbba8fd6ec4 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86=
.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86=
.0.bb
@@ -23,8 +23,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 MULTILIB_SCRIPTS =3D "${PN}-tools:${bindir}/g-ir-annotation-tool ${PN}-t=
ools:${bindir}/g-ir-scanner"
=20
-# setuptools are required to provide distutils to build the tools
-DEPENDS +=3D " libffi zlib python3 python3-setuptools flex-native bison-=
native"
+DEPENDS +=3D " libffi zlib flex-native bison-native"
 DEPENDS:append:class-native =3D " glib-2.0"
 DEPENDS:append:class-target =3D " glib-2.0-initial"
=20
--=20
2.43.0


