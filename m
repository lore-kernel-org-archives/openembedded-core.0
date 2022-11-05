Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3820BC4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 16:44:05 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.8121.1667666641223399449
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 09:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 3B4A3359
	for <openembedded-core@lists.openembedded.org>; Sat,  5 Nov 2022 17:43:59 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.165]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1orMH1-1IppNx0; Sat, 5 Nov 2022 17:43:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] webkitgtk: use libsoup-3.0 by default
Date: Sat,  5 Nov 2022 17:43:43 +0100
Message-Id: <20221105164343.1328765-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667666639-E28B3E65-17FD2A85/0/0 CLEAN NORMAL
X-TOI-MSGID: ba6eb60b-07ad-45fe-9794-54a982ac2ee7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 16:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172753

Some Gnome projects have stopped  supporting libsoup-2.4. Therefore, swit=
ch to libsoup-3.0.
This would unblock the update of geary or gnome-online-accounts, which wo=
uld otherwise
fail like this:

| Run-time dependency webkit2gtk-4.1 found: NO (tried pkgconfig)
|
| ../git/meson.build:70:0: ERROR: Dependency "webkit2gtk-4.1" not found, =
tried pkgconfig

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.36.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.36.7.bb
index 76b119c9c7..f3e1adee70 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
@@ -43,7 +43,7 @@ DEPENDS =3D " \
           gstreamer1.0-plugins-base \
           "
=20
-PACKAGECONFIG_SOUP ?=3D "soup2"
+PACKAGECONFIG_SOUP ?=3D "soup3"
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayl=
and x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'webgl opengl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'w=
ebgl gles2', d)} \
--=20
2.34.1


