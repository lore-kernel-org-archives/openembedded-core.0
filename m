Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21C6CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:36:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7722.1778679363885326663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=iuV05RRF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FD6E15A1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 06:35:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0EDF03F836
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778679363; bh=BXBFKOpXgBaFN/xjjMTg6CKXwMV6b8UEKf6aZIFBZhY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iuV05RRFVvOaEshz8xnmqrmUEfrBKobUKnKtj0XO0Ly/IUr0SJ5NLZdBXcRaqaC9Y
	 bmbz7Sndb7NufCWKGLK7uH20A/bkXzJKe9C0qouDXmD/oq0C1wNyLpLmVIpDiIms1X
	 5kzzqVhchjug/T1uGyQIjFgBz7isjGU98SmFfyho=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/5] gcr: remove obsolete DEPENDS
Date: Wed, 13 May 2026 14:35:55 +0100
Message-ID: <20260513133557.2951262-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513133557.2951262-1-ross.burton@arm.com>
References: <20260513133557.2951262-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236982

libxslt-native was added back in 2017 to gcr-3.2.0 as a needed
dependency when building with gobject-introspection[1], but this no
longer appears to be the case.

gnupg-native was added in 2020[1] but we now pass the correct paths to
Meson so this is no longer needed.

[1] oe-core 58922a43f93 ("gcr: add missing dependency on xsltproc if intr=
ospection is enabled")
[2] oe-core afa5ec0dee8 ("gcr: depends on gnupg-native")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gcr/gcr_4.4.0.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb b/meta/recipes-gnome/g=
cr/gcr_4.4.0.1.bb
index f3288c8d36e..1f4d2f48001 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
@@ -8,8 +8,7 @@ BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues=
"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
=20
-DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
-           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-nati=
ve', '', d)}"
+DEPENDS =3D "p11-kit glib-2.0 libgcrypt"
=20
 CFLAGS +=3D "-D_GNU_SOURCE"
=20
--=20
2.43.0


