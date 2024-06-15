Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A110CC27C4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 19:21:32 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.236])
 by mx.groups.io with SMTP id smtpd.web11.19624.1718479285980777707
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 12:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=wgGivzFF;
 spf=pass (domain: freemail.hu, ip: 46.107.16.236, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-80-98-74-198.catv.fixed.vodafone.hu [80.98.74.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4W1mGV2pchz9MX;
	Sat, 15 Jun 2024 21:21:22 +0200 (CEST)
From: egyszeregy@freemail.hu
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] populate_sdk_base: add 7zip archive type for SDK
Date: Sat, 15 Jun 2024 21:21:12 +0200
Message-ID: <20240615192112.259-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1718479283;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 19:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200770

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=1866; bh=SH7/qJPFf6aaAfu6JtMrMPzN185P0gT4OgU5dV5gqxM=;

	b=wgGivzFFQEtoVgBUj/HhmKW5GvXx8Dxx+gZJHOpzH8HV6fgaZujAXlo/PqewgX+f

	/OhL6pgAxRkdWI1g81i0zI8dO0eSBBXJp0HNWSeLNSnS2/cVbbVal4VbuEakhrX4PbF

	xpaQ/vKuA98hIfXqpRjUlrrK0LSjx+KekxMCJsCCr/Mdn4I249wX0w1/dn+QhuG3x5o

	h9yvjxSvhqJVuEUf5sNoEaX5fm9RiALYbgZi5OmSmhlACRjcB1BNab5bdgP+AwbIDZW

	wx4uRr3RC7o7vr9IAsBSxs4CNM8L+F66M0J/lq53f1GXSFFEWag1Sy4ZEvmCMmbjsJb

	Xbs6KGVRMg==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

Added 7zip support and options and extension/type parameter
for it to able to make any custom archive type for SDK archive.

Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
index 81896d808f..8d79d88ebe 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -75,7 +75,8 @@ SDK_ARCHIVE_TYPE ?=3D "tar.xz"
 SDK_XZ_COMPRESSION_LEVEL ?=3D "-9"
 SDK_XZ_OPTIONS ?=3D "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
 SDK_ZIP_OPTIONS ?=3D "-y"
-
+SDK_7ZIP_OPTIONS ?=3D "-mx=3D9 -mm=3DBZip2"
+SDK_7ZIP_TYPE ?=3D "7z"
=20
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now suppo=
rt zip and tar.xz
 python () {
@@ -84,6 +85,9 @@ python () {
        # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPU=
TNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to out=
put dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with buil=
dpath
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r =
${SDK_ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_=
TYPE} .')
+    elif d.getVar('SDK_ARCHIVE_TYPE') =3D=3D '7zip':
+       d.setVar('SDK_ARCHIVE_DEPENDS', 'p7zip-native')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; 7za a -=
r ${SDK_7ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_7ZIP_=
TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${S=
DKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_O=
UTPUTNAME}.${SDK_ARCHIVE_TYPE}')
--=20
2.45.2.windows.1


