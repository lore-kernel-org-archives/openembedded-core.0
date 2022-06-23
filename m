Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AE0C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 13:46:59 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.7615.1655992017414155964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 06:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 752C56718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 15:46:55 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.42.157]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o4NAb-4DVEcz0; Thu, 23 Jun 2022 15:46:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3] llvm: install optviewer if available
Date: Thu, 23 Jun 2022 15:46:40 +0200
Message-Id: <20220623134640.230019-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655992014-01439E5E-11E5739A/0/0 CLEAN NORMAL
X-TOI-MSGID: f4967785-b232-4ff9-b6e0-9182c1854daf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 13:46:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167269

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...Lists.txt-only-install-opt-viewer-if.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        | 11 ++--
 2 files changed, 66 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-opt-viewer-CMake=
Lists.txt-only-install-opt-viewer-if.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-opt-viewer-CMakeLists.t=
xt-only-install-opt-viewer-if.patch b/meta/recipes-devtools/llvm/llvm/000=
1-opt-viewer-CMakeLists.txt-only-install-opt-viewer-if.patch
new file mode 100644
index 0000000000..12c9f0d0c0
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-opt-viewer-CMakeLists.txt-only=
-install-opt-viewer-if.patch
@@ -0,0 +1,60 @@
+From 8dbfe220d16054245d8122e620639e7d62a4d791 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 23 Jun 2022 15:07:01 +0200
+Subject: [PATCH] llvm/tools/opt-viewer/CMakeLists.txt: install opt-viewe=
r only
+ if enabled
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ llvm/tools/opt-viewer/CMakeLists.txt          | 36 ++++++++++---------
+ 1 files changed, 19 insertions(+), 17 deletions(-)
+
+diff --git a/llvm/tools/opt-viewer/CMakeLists.txt b/llvm/tools/opt-viewe=
r/CMakeLists.txt
+index c0070f8cbfac..fb6ee384f6d1 100644
+--- a/llvm/tools/opt-viewer/CMakeLists.txt
++++ b/llvm/tools/opt-viewer/CMakeLists.txt
+@@ -1,20 +1,22 @@
+-set (files
+-  "opt-diff.py"
+-  "opt-stats.py"
+-  "opt-viewer.py"
+-  "optpmap.py"
+-  "optrecord.py"
+-  "style.css")
++if(LLVM_HAVE_OPT_VIEWER_MODULES)
++  set (files
++    "opt-diff.py"
++    "opt-stats.py"
++    "opt-viewer.py"
++    "optpmap.py"
++    "optrecord.py"
++    "style.css")
+=20
+-foreach (file ${files})
+-  install(PROGRAMS ${file}
+-    DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
+-    COMPONENT opt-viewer)
+-endforeach (file)
++  foreach (file ${files})
++    install(PROGRAMS ${file}
++      DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
++      COMPONENT opt-viewer)
++  endforeach (file)
+=20
+-add_custom_target(opt-viewer DEPENDS ${files})
+-if(NOT LLVM_ENABLE_IDE)
+-  add_llvm_install_targets("install-opt-viewer"
+-                           DEPENDS opt-viewer
+-                           COMPONENT opt-viewer)
++  add_custom_target(opt-viewer DEPENDS ${files})
++  if(NOT LLVM_ENABLE_IDE)
++    add_llvm_install_targets("install-opt-viewer"
++                             DEPENDS opt-viewer
++                             COMPONENT opt-viewer)
++  endif()
+ endif()
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
index 0d7b042958..b756b97b96 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -31,6 +31,7 @@ SRC_URI =3D "git://github.com/llvm/llvm-project.git;bra=
nch=3D${BRANCH};protocol=3Dhttp
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if=
-th.patch;striplevel=3D2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striple=
vel=3D2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as=
-we.patch;striplevel=3D2 \
+           file://0001-opt-viewer-CMakeLists.txt-only-install-opt-viewer=
-if.patch;striplevel=3D2 \
            "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "llvmorg-(?P<pver>\d+(\.\d+)+)"
@@ -112,10 +113,6 @@ do_install() {
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
@@ -125,7 +122,7 @@ do_install:class-native() {
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
@@ -149,6 +146,10 @@ FILES:${PN}-llvmhello =3D "\
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


