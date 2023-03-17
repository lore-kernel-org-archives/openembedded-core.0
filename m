Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893FDC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 06:04:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.13178.1679033040913197120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 23:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout01.t-online.de (Postfix) with SMTP id 642BE10335
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 07:03:58 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.8]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pd3Bx-0ygrFR0; Fri, 17 Mar 2023 07:03:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [RFC][oe-core][PATCH] initscripts: dont use /tmp symlink if ptest is enabled
Date: Fri, 17 Mar 2023 07:03:42 +0100
Message-Id: <20230317060342.386014-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679033033-72EBC7D8-3455109E/0/0 CLEAN NORMAL
X-TOI-MSGID: ccd16c36-67f6-4dc2-aafa-4cd490a34433
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 06:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178739

glib-2.0 ptest will fail if /tmp is a symlink to /var/tmp

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
index 4dc477bb8d..51a90ddf58 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -108,7 +108,7 @@ do_install () {
 		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root =
0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
 	fi
-	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
+	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]  || ${@bb.utils.contains('DISTR=
O_FEATURES','ptest','true','false',d)}; then
 		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
--=20
2.34.1


