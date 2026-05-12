Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EC2CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 16:31:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80137.1778603462624073411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 09:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DoJ+abWU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 215821655
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:30:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D04423F836
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778603461; bh=EWoERIsj22i3Kr7YWrqlZJohRwVFq5kU3YGoASrnhmo=;
	h=From:To:Subject:Date:From;
	b=DoJ+abWU/9Xouqiht/ABwFY0w/vgNdtXvDPZ7OZAXZZyybTNeeQX5n92QB86mpkHn
	 MRApFCVkzuNZ0Jjt3I5RQtAmqPH8CQ/rT8hc3PwDPSHmc6PI6NX0t5e9g3JOEIKDB6
	 2EXNyEKFqjPWssSoMai930I2kh8t260UyO7Zov20=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] epiphany: use GTK3DISTROFEATURES in features check
Date: Tue, 12 May 2026 17:30:51 +0100
Message-ID: <20260512163055.3821810-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 16:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236891

Epiphany uses GTK 4, so it depends on both opengl and either x11 or
wayland (as set by GTK3DISTROFEATURES).

I've verified that Epiphany builds in wayland-only configurations without
x11 enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/epiphany/epiphany_50.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_50.4.bb b/meta/recipes-=
gnome/epiphany/epiphany_50.4.bb
index 8fa187828bb..611efe8ea3b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_50.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
@@ -25,7 +25,8 @@ DEPENDS =3D " \
           "
=20
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cac=
he
-REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "\
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
--=20
2.43.0


