Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE4DC61D9D
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 11:16:13 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.23464.1700910965514084286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 03:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id D1AFF2103A
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 12:16:03 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.202]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6qdn-0rB2On0; Sat, 25 Nov 2023 12:16:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] cups: Add root,sys,wheel to system groups
Date: Sat, 25 Nov 2023 12:15:52 +0100
Message-ID: <20231125111552.4975-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700910963-56FA6986-A71464AF/0/0 CLEAN NORMAL
X-TOI-MSGID: 1fec3e1b-15ac-4926-aa7a-e8a21930b4dc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 11:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191223

The Cups documentation states:
The default contains "admin", "lpadmin", "root", "sys" and/or "system".
https://www.cups.org/doc/man-cups-files.conf.html#:~:text=3DSystemGroup

Add root and sys accordingly
Also add wheel group. This is required for systems with polkit support in=
 order to
control the printer settings with cups-pk-helper.
Not only for gnome-control-center, but also when using plain system-confi=
g-printer on
a system with running polkit, cups-pk-helper would be a required rdepend.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index ff5f55e62a..31f686cdfd 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -57,7 +57,7 @@ EXTRA_OECONF =3D " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
-               --with-system-groups=3Dlpadmin \
+               --with-system-groups=3Dlpadmin,root,sys,wheel \
                --with-cups-group=3Dlp \
                --with-domainsocket=3D/run/cups/cups.sock \
                --with-pkgconfpath=3D${libdir}/pkgconfig \
--=20
2.42.0


