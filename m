Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126A6C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 19:34:26 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23309.1789068863084394730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 12:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=APXXIP1D;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout04.t-online.de (Postfix) with SMTP id C82E19CD
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 21:33:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.57]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4kWk-37SSI40; Thu, 10 Sep 2026 21:33:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] cups: use xdg-open for the CUPS web interface desktop entry
Date: Thu, 10 Sep 2026 21:33:34 +0200
Message-ID: <20260910193334.39752-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789068822-077FDA93-1A17DE08/0/0 CLEAN NORMAL
X-TOI-MSGID: 4d6909b2-5623-466a-8553-5fe9c218fca0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789068823; i=f_l_k@t-online.de;
	bh=kW2h0zJ1Vjom7sbIx8Ccf8aYs8qnwub6hcHL50OnlUA=;
	h=From:To:Subject:Date;
	b=APXXIP1DlQW2wRszNlD67F4MKhymwF+0Qj6XU4TeOZ6DghLZ46Z0WHvtw6euFanub
	 L8nKnegFmEUwNhg5xM3uvC6Te5XK1q4kCXBx+H9nXVKn969ckHBQqhL66LZJ2Huiow
	 Eu/tZDYZVsJPEGDyBkV5aHJg0Yd6CBG/YVuGPabnnbQb3B8nR0LtWrQzK/k+MuC9aU
	 R2gYIh37Y45s/Rz8DvVoPC8jyy/fNRE1Y8HJ7Ig8vBfbLEeDtPl/cWuj1BWlPQUFH7
	 L8ONRLI3lbBFYwviQMu7PRNfyYFwH54bt4hc0au1PfhVHB9sHSqBxZCCqSeNz7CKx/
	 en1NQpHLB3Lag==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 19:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245592

The configure check for xdg-open is an AC_PATH_PROG, so in a cross build =
it
inspects the build host instead of the target. xdg-open is not part of th=
e
native sysroot, so CUPS_HTMLVIEW falls back to "htmlview" and the install=
ed
cups.desktop ends up with "Exec=3Dhtmlview http://localhost:631/". No rec=
ipe
provides that Fedora specific wrapper, so the "Manage Printing" entry is =
dead
on every image.

Set the autoconf cache variable to the target path instead, so the deskto=
p
entry uses xdg-open as provided by xdg-utils.

Tested by building cups for a corei7-64 image and checking that
/usr/share/applications/cups.desktop now reads
"Exec=3D/usr/bin/xdg-open http://localhost:631/".

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 2724ce72fb..f82fc0a1aa 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -48,6 +48,8 @@ PACKAGECONFIG[systemd] =3D "--with-systemd=3D${systemd_=
system_unitdir},--without-sys
 PACKAGECONFIG[xinetd] =3D "--with-xinetd=3D${sysconfdir}/xinetd.d,--with=
out-xinetd,xinetd"
 PACKAGECONFIG[webif] =3D "--enable-webif,--disable-webif"
=20
+CACHED_CONFIGUREVARS +=3D "ac_cv_path_XDGOPEN=3D${bindir}/xdg-open"
+
 EXTRA_OECONF =3D " \
                --enable-dbus \
                --with-dbusdir=3D${sysconfdir}/dbus-1 \
--=20
2.55.0


