Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F248EC5ACB3
	for <webhook@archiver.kernel.org>; Sun, 19 Nov 2023 07:25:48 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.24711.1700378746886931638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Nov 2023 23:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id B108645892
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 08:25:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.243]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r4cBb-1fsMSX0; Sun, 19 Nov 2023 08:25:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] cups: Allow to be controlled by root and users in wheel
Date: Sun, 19 Nov 2023 08:26:01 +0100
Message-ID: <20231119072601.8724-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700378743-477FD979-C8B0B7F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 94730b5c-4b6d-42b4-a2ab-e24aa94af880
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 07:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190867

This would be the cleanest way I can think of to enable the configuration=
 of
cups in the user interface

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/cups/cups.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index fa32c38549..767d33a8e7 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -89,6 +89,9 @@ do_install () {
 	    install -m 0644 ${WORKDIR}/volatiles.99_cups \
 		    ${D}${sysconfdir}/default/volatiles/99_cups
 	fi
+
+	# Have cups controlled by root and users in wheel group
+	sed -i -e 's|SystemGroup lpadmin|SystemGroup sys root wheel|g' ${D}${sy=
sconfdir}/cups/cups-files.conf
 }
=20
 PACKAGES =3D+ "${PN}-lib ${PN}-libimage ${PN}-webif"
--=20
2.42.0


