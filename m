Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DF1C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 11:15:48 +0000 (UTC)
Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
 by mx.groups.io with SMTP id smtpd.web11.26955.1746357342174612943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 04:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=vwyb+1cy;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.7, mailfrom: jeroen@myspectrum.nl)
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4Zr2C05jqDzQvv76;
	Sun,  4 May 2025 13:15:40 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission1.mail.transip.nl (Postfix) with ESMTPSA id 4Zr2Bz5zgLz2mZPJ0;
	Sun,  4 May 2025 13:15:39 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 8705F200E1;
	Sun,  4 May 2025 11:15:38 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sun, 04 May 2025 13:15:38 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [OE-core][scarthgap][PATCH 1/2] bluez5: make media control a PACKAGECONFIG option
Date: Sun,  4 May 2025 13:15:35 +0200
Message-ID: <20250504111536.2549869-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1746357339; h=from:subject:to:cc:date:
 mime-version; bh=cliYmG/ma3t9jBNBjR2bGMn3sCQ4XThN94Os+QFuhWM=;
 b=vwyb+1cyRmrJ6wsTfTRg/YJXDYuTVj528ubN9YXfyH41P+gWJhn5/H2f+1OrY1ZaEuvmJV
 i9QpM3sl8e0V9XwlZ+zp9ILHfsNqfdqQnTBiNonNonJFqM7aJUlOTcG1ai1IKvkgxmbHAj
 s4Ll2UudqonOfvuntkWsla8x5O3MFmSNInKZq6qgMGJOO7PfsW6iYkJo4ULcBs47deqOuf
 n+qfwwSM1u4R/76fvl2aX6+LH3hF+oSmTQ4QGIGfzHIheTgBg0p358p5xAblOoXbK03Cuu
 zDFB8BS67HtbWf2zwBN1qy9oJBbYpR5wG8Qq0QTd2CkiPaXVgVySNCoTO/340Q==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 11:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215940

From: Jeroen Hofstee <jhofstee@victronenergy.com>

When not building with the default PACKAGECONFIG options, the build can f=
ail
with:

undefined reference to `media_player_controller_create'
undefined reference to `media_player_set_status'

Otherwise. So disable it when not set and enable it by default.

The packageconfig option is the same as in Styhead.
https://github.com/openembedded/openembedded-core/commit/ebbdb7cf5c0a3f0e=
6773704d4c4cc570358ec611#diff-9d9284f6f27a81c75dffffd6d601b40c8266ae12e67=
8d0a49c46bdb8356a0e91R52
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index 39e1bf389c..731bfa0e40 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG ??=3D "obex-profiles \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     a2dp-profiles \
     avrcp-profiles \
+    mcp-profiles \
     network-profiles \
     hid-profiles \
     hog-profiles \
@@ -35,6 +36,7 @@ PACKAGECONFIG[nfc] =3D "--enable-nfc,--disable-nfc"
 PACKAGECONFIG[sap-profiles] =3D "--enable-sap,--disable-sap"
 PACKAGECONFIG[a2dp-profiles] =3D "--enable-a2dp,--disable-a2dp"
 PACKAGECONFIG[avrcp-profiles] =3D "--enable-avrcp,--disable-avrcp"
+PACKAGECONFIG[mcp-profiles] =3D "--enable-mcp,--disable-mcp"
 PACKAGECONFIG[network-profiles] =3D "--enable-network,--disable-network"
 PACKAGECONFIG[hid-profiles] =3D "--enable-hid,--disable-hid"
 PACKAGECONFIG[hog-profiles] =3D "--enable-hog,--disable-hog"
--=20
2.43.0


