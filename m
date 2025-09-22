Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CC1CAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:06:17 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.web10.46461.1758528375093539500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 5E5615F834;
	Mon, 22 Sep 2025 10:06:13 +0200 (CEST)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: peter.kjellerstedt@axis.com,
	openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH v2] os-release: do not add empty parentheses to VERSION
Date: Mon, 22 Sep 2025 10:02:08 +0200
Message-ID: <20250922080354.86861-3-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <DB5PR02MB10213CC660236ED26287025A1EF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <DB5PR02MB10213CC660236ED26287025A1EF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 08:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223811

Setting DISTRO_CODENAME to an empty string previously led to a VERSION
field in /etc/os-release containing empty parantheses, e.g.
   DISTRO_VERSION =3D "5.0.12"
   DISTRO_CODENAME =3D ""
   =3D=3D> VERSION =3D "5.0.12 ()"

This is probably not what a user expects, especially since it is quite
common to set variables to empty strings to disable something in OE
based builds, but using `unset VARNAME` seems pretty uncommon.

Instead of adding the parentheses with the DISTRO_CODENAME if the
variable is in the datastore add them only if the variable is not empty.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---

v2:
  Incorporated suggestion by Peter to properly handle both unset and empt=
y
  DISTRO_CODENAME variable


 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
index e1906d05d..1d2bb0818 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -22,7 +22,7 @@ OS_RELEASE_UNQUOTED_FIELDS =3D "ID VERSION_ID VARIANT_I=
D"
=20
 ID =3D "${DISTRO}"
 NAME =3D "${DISTRO_NAME}"
-VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CO=
DENAME' in d else ''}"
+VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if (d.getVar(=
'DISTRO_CODENAME') or '') !=3D '' else ''}"
 VERSION_ID =3D "${DISTRO_VERSION}"
 VERSION_CODENAME =3D "${@d.getVar('DISTRO_CODENAME') or ''}"
 PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
--=20
2.50.1


