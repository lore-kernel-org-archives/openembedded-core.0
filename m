Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95634C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 11:34:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.13319.1699788887720007077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 03:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id 3200A4E44
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 12:34:46 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.92]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r28jk-0YIA9R0; Sun, 12 Nov 2023 12:34:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] ghostscript: Build and install shared lib
Date: Sun, 12 Nov 2023 12:35:07 +0100
Message-ID: <20231112113507.3212154-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699788884-771C29CF-85305C32/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e6dc9f8-e7ce-4230-9ead-1593bc8c019e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 11:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190444

libgs is eg. needed to build ghostscript support for gimp

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 18c296128a..b503bdf5a7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -59,7 +59,12 @@ prune_sources() {
 }
 do_unpack[postfuncs] +=3D "prune_sources"
=20
+do_compile:append() {
+	oe_runmake so
+}
+
 do_install:append () {
+    oe_runmake DESTDIR=3D${D} install-so
     mkdir -p ${D}${datadir}/ghostscript/${PV}/
     cp -r ${S}/Resource ${D}${datadir}/ghostscript/${PV}/
     cp -r ${S}/iccprofiles ${D}${datadir}/ghostscript/${PV}/
--=20
2.42.0


