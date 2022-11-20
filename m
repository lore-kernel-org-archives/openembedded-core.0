Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97AEC433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 17:53:01 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.18279.1668966777651005949
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 09:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 7078FEC51
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 18:52:55 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.233.127]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1owoUt-1jA7hR0; Sun, 20 Nov 2022 18:52:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] python3: add ${bindir}/python symlink
Date: Sun, 20 Nov 2022 18:52:37 +0100
Message-Id: <20221120175237.194899-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668966772-DBFF9742-8A48C3E0/0/0 CLEAN NORMAL
X-TOI-MSGID: 1784008d-12bc-4763-a8e2-9b8292b197a4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 17:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173637

Currently /usr/bin/python is provided by the python2 package. If python2
is not installed, the built image lacks a provider for it.
This results in failed scripts when using '/usr/bin/python' shebang.

This patch adds a /usr/bin/python symlink for python3 to fix this issue.
For images containing python2 and python3, the do_rootfs task will fail
because now both of them provide the same file.
To allow this corner case, a DISTRO_FEATURE 'python2' has been introduced=
 which,
if set, will prevent python3 from creating the symlink.

The link is created with relative path because using an absolute path wou=
ld fail
for native and nativesdk.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 meta/recipes-devtools/python/python3_3.11.0.bb             | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 64203cf0fc..7b6f509a45 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -203,6 +203,7 @@
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
+            "${bindir}/python",
             "${bindir}/python3",
             "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipe=
s-devtools/python/python3_3.11.0.bb
index 92a1f69320..18b631f79d 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0.bb
@@ -144,6 +144,7 @@ do_install:prepend() {
=20
 do_install:append:class-target() {
         oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf .=
/python3 ${D}${bindir}/python', d)}
 }
=20
 do_install:append:class-native() {
@@ -156,6 +157,7 @@ do_install:append:class-native() {
         # (these often end up too long for the #! parser in the kernel a=
s the
         # buffer is 128 bytes long).
         ln -s python3-native/python3 ${D}${bindir}/nativepython3
+        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf .=
/python3-native/python3 ${D}${bindir}/nativepython', d)}
=20
         # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000=
 of them
         # and the overhead in each recipe-sysroot-native isn't worth it,=
 particularly
@@ -213,6 +215,7 @@ do_install:append() {
 }
=20
 do_install:append:class-nativesdk () {
+    ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf ./pyt=
hon3 ${D}${bindir}/python', d)}
     # Make sure we use /usr/bin/env python
     for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
          sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
@@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk =3D " =
${MLPREFIX}openssl ${MLPREFIX
=20
 # For historical reasons PN is empty and provided by python3-modules
 FILES:${PN} =3D ""
+RPROVIDES:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'python2', =
'', '${bindir}/python', d)}"
 RPROVIDES:${PN}-modules =3D "${PN}"
=20
 FILES:${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3=
"
--=20
2.34.1


