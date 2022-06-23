Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DF0C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 09:50:17 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web09.5499.1655977812443268549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 02:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id AB5AE16EEB
	for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 11:49:44 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.42.157]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o4JT6-3C18ZF0; Thu, 23 Jun 2022 11:49:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] llvm: install optviewer if available
Date: Thu, 23 Jun 2022 11:49:36 +0200
Message-Id: <20220623094936.66335-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655977784-014319F2-74FD3053/0/0 CLEAN NORMAL
X-TOI-MSGID: fcb985e3-3894-48f4-a589-c24b806759b0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 09:50:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167266

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
index 0d7b042958..3c560dfcfe 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -112,10 +112,6 @@ do_install() {
         # llvm harcodes usr/lib as install path, so this corrects it to =
actual libdir
         mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
=20
-        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
-        rm -rf ${D}${datadir}/opt-viewer
-        rmdir ${D}${datadir}
-
         # reproducibility
         sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig=
.cmake
 }
@@ -125,7 +121,7 @@ do_install:class-native() {
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
 }
=20
-PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-=
liboptremarks ${PN}-liblto"
+PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-=
liboptremarks ${PN}-optviewer ${PN}-liblto"
=20
 RRECOMMENDS:${PN}-dev +=3D "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-l=
iboptremarks"
=20
@@ -149,6 +145,10 @@ FILES:${PN}-llvmhello =3D "\
     ${libdir}/LLVMHello.so \
 "
=20
+FILES:${PN}-optviewer +=3D "\
+    ${datadir}/opt-viewer \
+"
+
 FILES:${PN}-dev +=3D " \
     ${libdir}/llvm-config \
     ${libdir}/libRemarks.so \
--=20
2.25.1


