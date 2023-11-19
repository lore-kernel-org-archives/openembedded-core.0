Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB25C072A2
	for <webhook@archiver.kernel.org>; Sun, 19 Nov 2023 09:00:29 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.25215.1700384425954760219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Nov 2023 01:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 2A4E75091D
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 10:00:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.243]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r4dfC-1zR28n0; Sun, 19 Nov 2023 10:00:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] cups: Allow to be controlled by root and users in wheel
Date: Sun, 19 Nov 2023 10:00:47 +0100
Message-ID: <20231119090047.315176-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700384422-2F7FD9FB-0E40E817/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b4e5169-0c48-43b3-be65-662e778cca9f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 09:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190868

This would be the cleanest way I can think of to enable the configuration=
 of
cups in the user interface

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/cups/cups.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index fa32c38549..8fd4d20987 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -30,10 +30,7 @@ LEAD_SONAME =3D "libcupsdriver.so"
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
@@ -55,7 +52,7 @@ EXTRA_OECONF =3D " \
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


