Return-Path: <hws@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B544FC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 10:53:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.20959.1669287198400312126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 02:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=lJyHQ2Bx;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: hws@denx.de)
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hws@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EF6B185233;
	Thu, 24 Nov 2022 11:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669287196;
	bh=IQUB9dVzm2QVBqRa+aYhdJ3slg5uH7agcWvbJM6yqAY=;
	h=From:To:Cc:Subject:Date:From;
	b=lJyHQ2BxO+/IEDgiZ200kIcI5qyjfyRsfFDwjwsedpi9HaBe4yiXUW+2K9koECqfd
	 MzI3fTE3NhhZPzqBtHEYZdDgpB97k8CwblyGuPcARrTSwp/GkcAwz4PhXQV7OwemTs
	 UVna1KdvQkF3lc8CK75B6oLVjBPyb5Yq/94JZvy3/oDHsibs1aAIFGudoxJT5RPler
	 cMt3h2jNYwFuqLO2CG9nql0+987iILHem5kovWJsE4BuAU9Kv8+EHvJsLN2OcCHHMK
	 TS60yxVV2w1t3jw4EBmQB/jsi7Jv/l7pwXs2OmBHVMc2+KwcUlOIezEfL0ljlRzsMT
	 BeKjY06mX3lBg==
From: Harald Seiler <hws@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Harald Seiler <hws@denx.de>
Subject: [PATCH] opkg: Set correct info_dir and status_file in opkg.conf
Date: Thu, 24 Nov 2022 11:52:59 +0100
Message-Id: <20221124105259.130383-1-hws@denx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 10:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173740

Distros can customize the location of OPKG data using OPKGLIBDIR.  In
OE-Core commit 11f1956cf5d7 ("package_manager.py: define info_dir and
status_file when OPKGLIBDIR isn't the default"), a fix was applied to
correctly set the info_dir and status_file options relative to
OPKGLIBDIR.

However, as the commit message notes, the opkg.conf file deployed as
part of the opkg package must also be adjusted to correctly reflect the
changed location.  Otherwise, opkg running inside the image cannot find
its data.

Fix this by also setting the info_dir and status_file options in
opkg.conf to the correct location relative to OPKGLIBDIR.

Fixes: 11f1956cf5d7 ("package_manager.py: define info_dir and status_file=
 when OPKGLIBDIR isn't the default")
Signed-off-by: Harald Seiler <hws@denx.de>
---
 meta/recipes-devtools/opkg/opkg_0.5.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb b/meta/recipes-devt=
ools/opkg/opkg_0.5.0.bb
index e91d7250bc..7bddaa3016 100644
--- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
@@ -46,7 +46,9 @@ EXTRA_OECONF:class-native =3D "--localstatedir=3D/${@os=
.path.relpath('${localstatedi
 do_install:append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/op=
kg/opkg.conf
+	echo "option lists_dir   ${OPKGLIBDIR}/opkg/lists"  >>${D}${sysconfdir}=
/opkg/opkg.conf
+	echo "option info_dir    ${OPKGLIBDIR}/opkg/info"   >>${D}${sysconfdir}=
/opkg/opkg.conf
+	echo "option status_file ${OPKGLIBDIR}/opkg/status" >>${D}${sysconfdir}=
/opkg/opkg.conf
=20
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
--=20
2.38.1


