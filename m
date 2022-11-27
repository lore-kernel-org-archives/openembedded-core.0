Return-Path: <hws@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A977C4321E
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 00:46:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.82852.1669510016144476838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 16:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=HjIYH2yZ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: hws@denx.de)
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hws@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AC67984EF6;
	Sun, 27 Nov 2022 01:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669510013;
	bh=43vL2hAHnJyNQhNmqS/QE5bvmghGVrtQ+DubPMwKF0w=;
	h=From:To:Cc:Subject:Date:From;
	b=HjIYH2yZGFEwZGqXtI1SvB5KbmYQLR5t7GtQk76Fb+SsyQLuSI8yfnImOJQ1aI5Ml
	 rBaY11c8AiL8CIEXjhoWvE9anB3YhWr1Yvh7Mee0nDSq+AMpUnAHnQ3mpedKEExUpx
	 gxegoWFQaIcfbXb/pc4oW6wtX3v7f0kvJ+VZ4rzoxTbzTEkCgjpj4WK6j0x/C71cTP
	 /9y3a1pPyl0ntdUf3SpzCI+EIQP/CQnptXqEQ8T/s7RVQB8Rl5rYq2hIsegYP9mDUl
	 FonJBkWtHAl8IsLIVKtCARG7V1ejT/QDS5/yNioBP2N8eesampbyOwcJMoKoebTiai
	 PmnneeGnDairQ==
From: Harald Seiler <hws@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Harald Seiler <hws@denx.de>
Subject: [PATCH v2] opkg: Set correct info_dir and status_file in opkg.conf
Date: Sun, 27 Nov 2022 01:46:47 +0100
Message-Id: <20221127004647.36001-1-hws@denx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 00:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173834

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

Notes:
    Changes in v2:
    - Rebased for opkg 0.6.0

 meta/recipes-devtools/opkg/opkg_0.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devt=
ools/opkg/opkg_0.6.0.bb
index 4cd589cd29..53c7399929 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
@@ -47,7 +47,9 @@ EXTRA_OECONF:class-native =3D "--localstatedir=3D/${@os=
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


