Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC51C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:51:28 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.9184.1751406686001843792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 14:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 1152E381C0
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:51:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.229]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWisc-1b0ho90; Tue, 1 Jul 2025 23:51:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] tcl: fix tclConfig.sh after UNPACKDIR change
Date: Tue,  1 Jul 2025 23:50:48 +0200
Message-ID: <20250701215048.2172824-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1751406666-87FFD548-4CBDE2D2/0/0 CLEAN NORMAL
X-TOI-MSGID: 91b8cc40-6a21-4194-82c7-8a7357c549dd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 21:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219732

Add a sed command that edits TCL_SRC_DIR in tclConfig.sh.
This is needed so that tk in meta-oe is capable of reading
the required header file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.1.bb
index 70aa9b606c..765dc64e4d 100644
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
@@ -105,6 +105,7 @@ tcl_package_preprocess() {
 	       -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
 	       -e "s;${STAGING_INCDIR};${includedir};g" \
 	       -e "s;--sysroot=3D${RECIPE_SYSROOT};;g" \
+	       -e "s;${B};${libdir};g" ${PKGD}${libdir}/tclConfig.sh \
 	       ${PKGD}${libdir}/tclConfig.sh
=20
 	rm -f ${PKGD}${bindir_crossscripts}/tclConfig.sh
--=20
2.49.0


