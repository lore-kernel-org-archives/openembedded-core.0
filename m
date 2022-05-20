Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D937C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:52:22 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web09.8276.1653051140970168165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id E7AE8E206
	for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 14:52:18 +0200 (CEST)
Received: from localhost.localdomain ([84.154.173.254]) by fwd70.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ns278-3jcP5d0; Fri, 20 May 2022 14:52:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv2 1/2] libdecor: initial add recipe
Date: Fri, 20 May 2022 14:52:06 +0200
Message-Id: <20220520125207.4115296-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653051138-00004E7B-39E0EC76/0/0 CLEAN NORMAL
X-TOI-MSGID: 17786891-d342-4430-9c6d-cab20527a2e3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:52:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165935

libdecor is a client-side decoration library for Wayland clients. It is u=
sed
by libsdl2 for window decoration and is required to provide decoration fo=
r
shells that use client-side decoration such as gnome-shell or weston.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libdecor/libdecor_0.1.0.bb                | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/libdecor/libdecor_0.1.0.bb

diff --git a/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb b/meta/reci=
pes-graphics/libdecor/libdecor_0.1.0.bb
new file mode 100644
index 0000000000..3223d914ad
--- /dev/null
+++ b/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "libdecor - A client-side decorations library for Wayland cl=
ients"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7ae2be7fb1637141840314b51970a=
9f7"
+
+SRC_URI =3D "git://gitlab.gnome.org/jadahl/libdecor.git;protocol=3Dhttps=
;branch=3Dmaster"
+
+DEPENDS =3D " \
+	cairo \
+	libxkbcommon \
+	pango \
+	wayland \
+	wayland-native \
+	wayland-protocols \
+"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "3ec3fadd59a21835079fbb3046d2bec6c649d6fa"
+
+PACKAGECONFIG ?=3D "dbus"
+
+PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
+PACKAGECONFIG[demo] =3D "-Ddemo=3Dtrue,-Ddemo=3Dfalse,virtual/libgl"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON +=3D "--buildtype release"
+
+
+BBCLASSEXTEND =3D "native nativesdk"
+
--=20
2.25.1


