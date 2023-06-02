Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB10BC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:24:47 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.9990.1685705077770397283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 04:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: denx.de, ip: 212.18.0.9, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QXgdH02t6z1r68q;
	Fri,  2 Jun 2023 13:24:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QXgdG6q0xz1qqlS;
	Fri,  2 Jun 2023 13:24:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id I7ylaca9TMq8; Fri,  2 Jun 2023 13:24:33 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri,  2 Jun 2023 13:24:33 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 7E1724540854;
	Fri,  2 Jun 2023 13:24:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIkZ6y0jXldh; Fri,  2 Jun 2023 13:24:30 +0200 (CEST)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id 073B845407E4;
	Fri,  2 Jun 2023 13:24:29 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH] mtd-utils: export headers and libraries for MTD and UBI
Date: Fri,  2 Jun 2023 13:24:26 +0200
Message-Id: <20230602112426.28353-1-sbabic@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 11:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182302

Mtd-utils has internal libraries (libmtd and libubi) that simplify the
usage and access, and they can be used by applications to access MTD
devices without reinventing the code.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 2d76991d2f..cdcc766748 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -55,6 +55,14 @@ ALTERNATIVE_LINK_NAME[flashcp] =3D "${sbindir}/flashcp=
"
=20
 do_install () {
 	oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MANDIR=3D${mandi=
r} INCLUDEDIR=3D${includedir}
+	install -d ${D}${includedir}/mtd
+	install -d ${D}${libdir}
+	install -m 0644 ${S}/include/libubi.h ${D}${includedir}
+	install -m 0644 ${S}/include/libmtd.h ${D}${includedir}
+	install -m 0644 ${S}/include/libscan.h ${D}${includedir}
+	install -m 0644 ${S}/include/libubigen.h ${D}${includedir}
+	oe_libinstall -a libubi ${D}${libdir}/
+	oe_libinstall -a libmtd ${D}${libdir}/
 }
=20
 PACKAGES =3D+ "mtd-utils-misc mtd-utils-tests"
--=20
2.34.1


