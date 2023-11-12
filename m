Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE58C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 12:08:01 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.13949.1699790872252113394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 04:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout02.t-online.de (Postfix) with SMTP id 56CCA14C2E
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 13:07:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.92]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r29Fk-0dZOLp0; Sun, 12 Nov 2023 13:07:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] ghostscript: Build and install shared lib
Date: Sun, 12 Nov 2023 13:08:09 +0100
Message-ID: <20231112120809.3275480-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699790868-327FB937-C090B431/0/0 CLEAN NORMAL
X-TOI-MSGID: 22133500-1726-42fe-aeeb-9fba90c340b0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 12:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190445

libgs is eg. needed to build ghostscript support for gimp

also install the data target

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 18c296128a..2a966afc21 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -60,7 +60,8 @@ prune_sources() {
 do_unpack[postfuncs] +=3D "prune_sources"
=20
 do_install:append () {
-    mkdir -p ${D}${datadir}/ghostscript/${PV}/
+    oe_runmake DESTDIR=3D${D} install-so
+    oe_runmake DESTDIR=3D${D} install-data
     cp -r ${S}/Resource ${D}${datadir}/ghostscript/${PV}/
     cp -r ${S}/iccprofiles ${D}${datadir}/ghostscript/${PV}/
 }
--=20
2.42.0


