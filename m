Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C82ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:36:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27.1662741405140256113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 036D5165C;
	Fri,  9 Sep 2022 09:36:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 390473F73D;
	Fri,  9 Sep 2022 09:36:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: schnitzeltony@gmail.com
Subject: [PATCH] libxml2: don't override XML_CATALOG_FILES in xmllint wrapper
 if already set
Date: Fri,  9 Sep 2022 17:36:40 +0100
Message-Id: <20220909163640.1985612-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:36:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170495

The KDE build uses custom catalogs by setting XML_CATALOG_FILES, so this
wrapper should not override that value if it has already been set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.14.bb
index 2b2289e38a6..165c92d4114 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -121,7 +121,7 @@ do_install:append:class-native () {
 	# Docs are not needed in the native case
 	rm ${D}${datadir}/gtk-doc -rf
=20
-	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=3D${sysconfdir}/=
xml/catalog
+	create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=3D${XML_CATALOG=
_FILES:-${sysconfdir}/xml/catalog}'
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


