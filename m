Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142DDC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 11:24:33 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.8254.1751369071856114122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 04:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id 9F4551C146
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 13:24:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.229]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWZ6C-1uR81R0; Tue, 1 Jul 2025 13:24:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] tcl: fix tclConfig.sh after UNPACKDIR change
Date: Tue,  1 Jul 2025 13:24:15 +0200
Message-ID: <20250701112415.334132-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1751369068-197F8570-48A34EC9/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ed5a3f4-316f-402c-8ad0-b727910ae0d5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 11:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219565

Add a sed command that edits tclConfig.sh. This is needed so that
tk in meta-oe is capable of reading the required header file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.1.bb
index 70aa9b606c..15f03b6c9e 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -52,6 +52,7 @@ do_install() {
 	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
 	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
--=20
2.49.0


