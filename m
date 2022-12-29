Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E596C3DA7D
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 08:08:30 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.201362.1672301303359513206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 00:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 334EA1FF86
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 09:08:21 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.205]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAnxY-24qmrB0; Thu, 29 Dec 2022 09:08:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gsettings-desktop-schemas.pc.in: use pc_sysrootdir for prefix
Date: Thu, 29 Dec 2022 09:08:10 +0100
Message-Id: <20221229080810.98961-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672301296-2488F98D-AF0B6514/0/0 CLEAN NORMAL
X-TOI-MSGID: bbf51a35-d0dc-4f8a-9606-687e4886fe99
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175095

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ktop-schemas.pc.in-use-pc_sysrootdir.patch | 34 +++++++++++++++++++
 .../gsettings-desktop-schemas_43.0.bb         |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-gnome/gsettings-desktop-schemas/gsetting=
s-desktop-schemas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.=
patch

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch b=
/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0=
001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch
new file mode 100644
index 0000000000..4bf38c1987
--- /dev/null
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch
@@ -0,0 +1,34 @@
+From abd179df28adcdd9fac3d066aaccbd4c4cd135f5 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 29 Dec 2022 06:39:59 +0100
+Subject: [PATCH] gsettings-desktop-schemas.pc.in: use pc_sysrootdir for =
prefix
+
+gnome-settings uses pkgconfig to find gdesktop-enums.h
+https://github.com/GNOME/gnome-control-center/blob/4648296a706df83af984a=
918e5f14c3ece42f5fc/panels/background/meson.build#L22
+
+Adding pc-sysrootdir to prefix would allow to find the file also if we h=
ave a user defined sysroot.
+
+This will fix cross compilation of gnome-control-center with yocto/opene=
mbedded that otherwise fails like this:
+
+| ../gnome-control-center-43.2/panels/background/meson.build:27:0: ERROR=
: File /usr/include/gsettings-desktop-schemas/gdesktop-enums.h does not e=
xist.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gsettings-des=
ktop-schemas/-/merge_requests/62]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ gsettings-desktop-schemas.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gsettings-desktop-schemas.pc.in b/gsettings-desktop-schemas=
.pc.in
+index d611dc1..992fa55 100644
+--- a/gsettings-desktop-schemas.pc.in
++++ b/gsettings-desktop-schemas.pc.in
+@@ -1,4 +1,4 @@
+-prefix=3D@prefix@
++prefix=3D${pc_sysrootdir}@prefix@
+=20
+ Name: gsettings-desktop-schemas
+ Description: Shared GSettings schemas for the desktop, including helper=
 headers
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_43.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_43.0.bb
index 966a67fead..09aec42ded 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_43.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_43.0.bb
@@ -13,4 +13,5 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
+SRC_URI +=3D "file://0001-gsettings-desktop-schemas.pc.in-use-pc_sysroot=
dir.patch"
 SRC_URI[archive.sha256sum] =3D "5d5568282ab38b95759d425401f7476e56f8cbf2=
629885587439f43bd0b84bbe"
--=20
2.34.1


