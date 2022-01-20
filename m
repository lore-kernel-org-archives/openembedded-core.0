Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71157C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 15:18:44 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.13244.1642691923152735767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id 5E6D112445
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:18:41 +0100 (CET)
Received: from localhost.localdomain ([84.163.38.111]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAZCy-43uzwH0; Thu, 20 Jan 2022 16:18:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/2] geary: initial add recipe
Date: Thu, 20 Jan 2022 16:18:23 +0100
Message-Id: <20220120151824.61601-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642691920-000116DC-A3EE480D/0/0 CLEAN NORMAL
X-TOI-MSGID: ad758877-3950-4ccc-965e-d94f92a63cef
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 15:18:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160767

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-connectivity/geary/geary_40.0.bb  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary_40.0.bb

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_40.0.bb
new file mode 100644
index 000000000..e4d07ad29
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -0,0 +1,54 @@
+SUMMARY =3D "Geary is an email application built around conversations, f=
or the GNOME 3 desktop."
+SECTION =3D "network"
+LICENSE =3D "LGPL-2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2a2244d5a13871ad950c55877546a=
6a2"
+
+DEPENDS =3D " \
+	appstream-glib \
+	cairo \
+	enchant2 \
+	evolution-data-server \
+	folks \
+	gcr \
+	gmime \
+	gnome-online-accounts \
+	gsound \
+	gspell \
+	gtk+3 \
+	icu \
+	iso-codes \
+	json-glib \
+	libhandy \
+	libical \
+	libpeas \
+	libsecret \
+	libstemmer \
+	libxml2 \
+	sqlite3 \
+	webkitgtk \
+"
+
+RDEPENDS:${PN} =3D "gnome-keyring"
+
+inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection va=
la
+
+SRC_URI =3D " \
+	git://github.com/GNOME/geary.git;nobranch=3D1;protocol=3Dhttps \
+"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "gnome-${PV}"
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+
+GIR_MESON_OPTION =3D ""
+EXTRA_OEMESON =3D "-Dprofile=3Drelease"
+
+PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabl=
ed,libunwind"
+PACKAGECONFIG[tnef] =3D "-Dtnef=3Denabled,-Dtnef=3Ddisabled,libytnef"
+PACKAGECONFIG[valadoc] =3D "-Dvaladoc=3Denabled,-Dvaladoc=3Ddisabled"
+
+PACKAGECONFIG ??=3D ""
+
+FILES:${PN} +=3D "${datadir}"
+
--=20
2.25.1


