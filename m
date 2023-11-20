Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE42C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:18:30 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.54358.1700497108129257290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 73E889FAF
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 17:18:26 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.47]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r56yg-1tWkzp0; Mon, 20 Nov 2023 17:18:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] cups: Allow to be controlled by root and users in wheel
Date: Mon, 20 Nov 2023 17:18:48 +0100
Message-ID: <20231120161848.1461683-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700497106-C0AEA9F9-FC88203E/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ad629e0-efb9-444e-a877-1df921a5f7e4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190885

This would be the cleanest way I can think of to enable the configuration=
 of
cups in the user interface

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/cups/cups.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index ff5f55e62a..1cd7bf1ddb 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,10 +29,7 @@ LEAD_SONAME =3D "libcupsdriver.so"
=20
 CLEANBROKEN =3D "1"
=20
-inherit autotools-brokensep binconfig useradd systemd pkgconfig multilib=
_script github-releases
-
-USERADD_PACKAGES =3D "${PN}"
-GROUPADD_PARAM:${PN} =3D "--system lpadmin"
+inherit autotools-brokensep binconfig systemd pkgconfig multilib_script =
github-releases
=20
 SYSTEMD_SERVICE:${PN} =3D "cups.socket cups.path cups.service cups-lpd.s=
ocket"
=20
@@ -57,7 +54,7 @@ EXTRA_OECONF =3D " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
-               --with-system-groups=3Dlpadmin \
+               --with-system-groups=3Dsys,root,wheel \
                --with-cups-group=3Dlp \
                --with-domainsocket=3D/run/cups/cups.sock \
                --with-pkgconfpath=3D${libdir}/pkgconfig \
--=20
2.42.0


