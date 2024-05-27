Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE16C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:10:45 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1066.1716826235067302252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id 242134836A
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:10:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.219]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBcvg-3LiFTl0; Mon, 27 May 2024 18:10:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
Date: Mon, 27 May 2024 18:11:04 +0200
Message-ID: <20240527161104.2954913-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716826232-749B0DB0-BD22B20F/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c3a37c0-3ed9-4147-8378-ab272ce3dfa1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199906

Patch release to address security bugs:
CVE-2024-33869
CVE-2023-52722
CVE-2024-33870
CVE-2024-33871
CVE-2024-29510

- add a patch to fix:
  | ./pdf/pdf_sec.c:186:25: error: assignment to 'char **' from incompati=
ble pointer type 'char *' [-Wincompatible-pointer-types]
  |   186 |             NewPassword =3D Password;
  |       |                         ^
  | ./pdf/pdf_sec.c:187:20: error: assignment to 'int *' from 'int' makes=
 pointer from integer without a cast [-Wint-conversion]
  |   187 |             NewLen =3D Len;
  |       |                    ^
  | make: *** [pdf/pdf.mak:169: obj/pdf_sec.o] Error 1

  Patchstatus still pending. Is this the right thing to do?

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../ghostscript/fix-int-conversion.patch         | 16 ++++++++++++++++
 ...tscript_10.03.0.bb =3D> ghostscript_10.03.1.bb} |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/fix-int=
-conversion.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.0.bb =3D> gh=
ostscript_10.03.1.bb} (95%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/fix-int-conver=
sion.patch b/meta/recipes-extended/ghostscript/ghostscript/fix-int-conver=
sion.patch
new file mode 100644
index 0000000000..58403a5260
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/fix-int-conversion.pa=
tch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+--- a/pdf/pdf_sec.c	2024-05-02 11:45:25.000000000 +0200
++++ b/pdf/pdf_sec.c	2024-05-27 17:42:26.695957128 +0200
+@@ -183,8 +183,8 @@
+          * this easy: the errors we want to ignore are the ones with
+          * codes less than 100. */
+         if ((int)err < 100) {
+-            NewPassword =3D Password;
+-            NewLen =3D Len;
++            NewPassword =3D (char **)Password;
++            NewLen =3D (int *)Len;
+             return 0;
+         }
+=20
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
similarity index 95%
rename from meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
index ff7d38676e..3df0caff72 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
@@ -25,9 +25,10 @@ def gs_verdir(v):
 SRC_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-downloads/relea=
ses/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
+           file://fix-int-conversion.patch \
            "
=20
-SRC_URI[sha256sum] =3D "6f2bc61023469fcf7c7c2d7f1bdd75b75f2b41836aa1d5e6=
41396246d4abbb59"
+SRC_URI[sha256sum] =3D "31cd01682ad23a801cc3bbc222a55f07c4ea3e068bdfb447=
792d54db21a2e8ad"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+3"
--=20
2.44.0


