Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DF4CD484D
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 21:07:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8443.1762981613269298073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 13:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 354FF1595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 13:06:45 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75F023F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 13:06:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/gnomebase: set S using GNOMEBN instead of BPN
Date: Wed, 12 Nov 2025 21:06:50 +0000
Message-ID: <20251112210651.1868279-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 21:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226219

For the majority of recipes, the default S is correct. But a few recipes
have a package name that is not the recipe name (such as GConf), and
we already handle this in the SRC_URI assignment.

Use GNOMEBN in the S assignment instead of PN so that S is correct too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gnomebase.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/=
gnomebase.bbclass
index 74073321b80..57933dda71a 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -13,6 +13,8 @@ SECTION ?=3D "x11/gnome"
 GNOMEBN ?=3D "${BPN}"
 SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOM=
EBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive"
=20
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
+
 FILES:${PN} +=3D "${datadir}/application-registry  \
                 ${datadir}/mime-info \
                 ${datadir}/mime/packages \
--=20
2.43.0


