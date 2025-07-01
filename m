Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FF1C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:54:58 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.9313.1751406893986525022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 14:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id 5E846EFF9
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:54:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.229]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWiw4-0AQCvp0; Tue, 1 Jul 2025 23:54:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv4] tcl: fix tclConfig.sh after UNPACKDIR change
Date: Tue,  1 Jul 2025 23:54:34 +0200
Message-ID: <20250701215434.2173019-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1751406880-BDFF9544-5C0EC554/0/0 CLEAN NORMAL
X-TOI-MSGID: d1d64620-3b95-47e2-9461-6a4d898def02
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 21:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219733

Adapt the  sed command that edits TCL_SRC_DIR in tclConfig.sh
This is needed so that tk in meta-oe is capable of reading
the required header file

Remove buildpath from TCL_BUILD_STUB_LIB_PATH in tclConfig.sh

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


