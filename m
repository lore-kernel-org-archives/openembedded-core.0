Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44218CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:36:07 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.3633.1695072962401463631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 704FF2798E
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 23:36:00 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiLuN-1kn2eH0; Mon, 18 Sep 2023 23:35:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] pulseaudio: dont include consolekit for systemd
Date: Mon, 18 Sep 2023 23:35:47 +0200
Message-ID: <20230918213547.1224613-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695072955-44FF45E3-63049935/0/0 CLEAN NORMAL
X-TOI-MSGID: 73040fa5-9805-4368-81cd-e2124c00d295
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 21:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187845

Consolekit is not needed for systemd and getting it installed by default
can be disturbing.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
index 08a608bab1..2245a73392 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -257,7 +257,7 @@ RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains=
('DISTRO_FEATURES', 'pulseaud
=20
 # pulseaudio-module-console-kit is built whenever dbus is enabled by PAC=
KAGECONFIG
 # but consolekit depends on libx11 and is available only for DISTRO with=
 x11 in DISTRO_FEATURES
-RDEPENDS:pulseaudio-module-console-kit =3D+ "${@bb.utils.contains('DISTR=
O_FEATURES', 'x11', 'consolekit', '', d)}"
+RDEPENDS:pulseaudio-module-console-kit =3D+ "${@bb.utils.contains('DISTR=
O_FEATURES', 'sysvinit x11', 'consolekit', '', d)}"
 RDEPENDS:pulseaudio-misc +=3D "pulseaudio-module-cli-protocol-unix"
=20
 FILES:${PN}-module-alsa-card +=3D "${datadir}/pulseaudio/alsa-mixer"
--=20
2.41.0


