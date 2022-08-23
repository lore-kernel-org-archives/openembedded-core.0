Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489EBC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 15:37:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32941.1661269053926491889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 08:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25F7E113E;
	Tue, 23 Aug 2022 08:37:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF3FA3F70D;
	Tue, 23 Aug 2022 08:37:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libxml2: wrap xmllint to use the correct XML catalogues
Date: Tue, 23 Aug 2022 16:37:30 +0100
Message-Id: <20220823153730.172962-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 15:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169715

Install a wrapper around xmllint in native builds to set
XML_CATALOG_FILES to the correct location of the XML catalogues, so that
the callers of this script (like xmlto) don't need to do the same.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.14.bb
index e58298d3b01..d803db86721 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -109,6 +109,8 @@ do_install_ptest () {
 do_install:append:class-native () {
 	# Docs are not needed in the native case
 	rm ${D}${datadir}/gtk-doc -rf
+
+	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=3D${sysconfdir}/=
xml/catalog
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


