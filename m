Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB67C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 10:24:22 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.7359.1751365454137850641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 03:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id EF48FEE64
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 12:24:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.229]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWY9r-3Fpccz0; Tue, 1 Jul 2025 12:24:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] tcl: fix tclConfig.sh after UNPACKDIR change
Date: Tue,  1 Jul 2025 12:24:03 +0200
Message-ID: <20250701102403.278564-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1751365451-0FFFD4E1-DFB6CF9F/0/0 CLEAN NORMAL
X-TOI-MSGID: 353398eb-dfd3-422e-86be-63599c85f4cb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 10:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219562

Adapt the sed command that edits tclConfig.sh. This is needed so that
tk in meta-oe is capable of reading the required header file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.1.bb
index 70aa9b606c..7627fbca68 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -51,7 +51,7 @@ do_install() {
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
 	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
-	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
--=20
2.49.0


