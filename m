Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614BDC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 13:20:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.44988.1674134400221236938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 05:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id 59C50E8A3
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 14:19:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.208]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pIUom-0qzDIP0; Thu, 19 Jan 2023 14:19:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with current popt
Date: Thu, 19 Jan 2023 14:18:53 +0100
Message-Id: <20230119131853.27372-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674134340-81AEBD99-D549DDFD/0/0 CLEAN NORMAL
X-TOI-MSGID: 7325c3ff-c02e-4092-8499-08499767d694
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 13:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176138

sgdisk still segfaults for some tasks (e.g 'sgdisk -v', 'sgdisk -V')

Add a follow-up patch that fixes the issue. It was taken from Archlinux

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../fdisk/gptfdisk/popt-1.19-follow-up.patch  | 42 +++++++++++++++++++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow=
-up.patch

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.pat=
ch b/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
new file mode 100644
index 0000000000..a5ccd2385a
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
@@ -0,0 +1,42 @@
+From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
+From: Damian Kurek <starfire24680@gmail.com>
+Date: Thu, 7 Jul 2022 03:39:16 +0000
+Subject: [PATCH] Fix NULL dereference when duplicating string argument
+
+poptGetArg can return NULL if there are no additional arguments, which
+makes strdup dereference NULL on strlen
+
+Upstream-Status: Backport [https://github.com/archlinux/svntogit-package=
s/tree/packages/gptfdisk/trunk]
+
+Unsure if this patch is really a backport yet. It was taken from Archlin=
ux
+---
+ gptcl.cc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gptcl.cc b/gptcl.cc
+index 0d578eb..ab95239 100644
+--- a/gptcl.cc
++++ b/gptcl.cc
+@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+    } // while
+=20
+    // Assume first non-option argument is the device filename....
+-   device =3D strdup((char*) poptGetArg(poptCon));
+-   poptResetContext(poptCon);
++   device =3D (char*) poptGetArg(poptCon);
+=20
+    if (device !=3D NULL) {
++      device =3D strdup(device);
++      poptResetContext(poptCon);
+       JustLooking(); // reset as necessary
+       BeQuiet(); // Tell called functions to be less verbose & interact=
ive
+       if (LoadPartitions((string) device)) {
+@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+          cerr << "Error encountered; not saving changes.\n";
+          retval =3D 4;
+       } // if
++      free(device);
+    } // if (device !=3D NULL)
+    poptFreeContext(poptCon);
+    return retval;
+
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb b/meta/recipes=
-devtools/fdisk/gptfdisk_1.0.9.bb
index 66935b7fbb..cf0a60a1a9 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.t=
ar.gz \
            file://0001-Updated-guid.cc-to-deal-with-minor-change-in-libu=
uid.patch \
            file://0001-Fix-failure-crash-of-sgdisk-when-compiled-with-la=
tes.patch \
            file://0001-Use-64bit-time_t-on-linux-as-well.patch \
+           file://popt-1.19-follow-up.patch \
            "
 SRC_URI[sha256sum] =3D "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f48=
2dd855774e2d50c2"
=20
--=20
2.34.1


