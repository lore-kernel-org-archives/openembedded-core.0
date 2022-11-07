Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BDBC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 07:23:40 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web09.891.1667805818404080720
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 23:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id 40F693A8B
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Nov 2022 08:23:35 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1orwTm-0QUT7h0; Mon, 7 Nov 2022 08:23:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] gstreamer1.0-plugins-good: use libsoup-3.0 by default
Date: Mon,  7 Nov 2022 08:23:24 +0100
Message-Id: <20221107072324.88845-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667805814-50A2B689-D57727F0/0/0 CLEAN NORMAL
X-TOI-MSGID: cea0299c-c4b6-4be9-8c53-a64d36e6c444
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172825

- add a PACKAGECONFIG for soup3
- add PACKAGECONFIG_SOUP variable as it is used in webkitgtk and epiphany

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.3.bb      | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.20.3.bb
index 0235935a4a..9dd629eaa0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.=
bb
@@ -20,11 +20,14 @@ DEPENDS +=3D "gstreamer1.0-plugins-base libcap zlib"
 RPROVIDES:${PN}-pulseaudio +=3D "${PN}-pulse"
 RPROVIDES:${PN}-soup +=3D "${PN}-souphttpsrc"
=20
+PACKAGECONFIG_SOUP ?=3D "soup3"
+
 PACKAGECONFIG ??=3D " \
     ${GSTREAMER_ORC} \
+    ${PACKAGECONFIG_SOUP} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
-    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex t=
aglib v4l2 \
+    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 speex taglib=
 v4l2 \
 "
=20
 X11DEPENDS =3D "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -53,8 +56,9 @@ PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3D=
disabled,qtbase qtdeclarative q
 # instead of linking to it. And instead of using the default libsoup C h=
eaders, it
 # uses its own stub header. Consequently, objdump will not show the libs=
oup .so as
 # a dependency, and libsoup won't be added to an image. Fix this by sett=
ing libsoup
-# as RDEPEND instead of DEPEND.
-PACKAGECONFIG[soup]       =3D "-Dsoup=3Denabled,-Dsoup=3Ddisabled,,libso=
up-2.4"
+# as RDEPEND.
+PACKAGECONFIG[soup2] =3D "-Dsoup=3Denabled,,libsoup-2.4,libsoup-2.4,,sou=
p3"
+PACKAGECONFIG[soup3] =3D "-Dsoup=3Denabled,,libsoup,libsoup,,soup2"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,spee=
x"
 PACKAGECONFIG[rpi]        =3D "-Drpicamsrc=3Denabled,-Drpicamsrc=3Ddisab=
led,userland"
 PACKAGECONFIG[taglib]     =3D "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,ta=
glib"
--=20
2.34.1


