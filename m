Return-Path: <r.schlarb@instar.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6492C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 14:20:42 +0000 (UTC)
Received: from mail.instar.com (mail.instar.com [116.202.97.95])
 by mx.groups.io with SMTP id smtpd.web11.26641.1754490038880069845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 07:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@instar.de header.s=201907 header.b=NDUs9PX2;
 spf=pass (domain: instar.de, ip: 116.202.97.95, mailfrom: r.schlarb@instar.de)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.instar.com (Postfix) with ESMTP id 32EBCFAD37
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 16:20:37 +0200 (CEST)
Received: from mail.instar.com ([127.0.0.1])
	by localhost (mail.instar.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 66tXpkWGpDfe; Wed,  6 Aug 2025 16:20:36 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.instar.com (Postfix) with ESMTP id D10B6FAD36;
	Wed,  6 Aug 2025 16:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.instar.com D10B6FAD36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=instar.de; s=201907;
	t=1754490036; bh=7t1NosEtp9gc6cAk/z2pr+yfuoba0oszWjFlLkfOI2o=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NDUs9PX25lwHynRX2fERoVO8DfcDbxsznyhsKbRiTxdtNCkBy2pT58QUq/5FbjDw6
	 cUpNzrXpBG0QDG9rhv2m+xou9IWwR0I7t9/RFRq4bEcuEUf2IULQrmUbZN//PnY4oK
	 qAkPl9Tzsh8ILKmdcWPOIqYu5L8Fjr2RFc8mfDGtv+TI3zo5Wl9uLapZ72tZZ/cldr
	 nVd7oB9Ii72QhMmd0ic0Ya0v6z+JhaewpY/YLs9YZDO9vHdvUxxU7DVf/t+tLrGayJ
	 HudiS/8O0knQWwg3H4hlZ2z8sSt8t6xykTXvG37c+lD5a0UWMkkIu8HdgEph0AGTok
	 sWGoevxKLrd+w==
X-Virus-Scanned: amavisd-new at mail.instar.com
Received: from mail.instar.com ([127.0.0.1])
	by localhost (mail.instar.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Nlc0fZ1sX9tH; Wed,  6 Aug 2025 16:20:36 +0200 (CEST)
Received: from localhost.localdomain (static.167.211.203.116.clients.your-server.de [116.203.211.167])
	by mail.instar.com (Postfix) with ESMTPSA id C2465FAD34;
	Wed,  6 Aug 2025 16:20:36 +0200 (CEST)
From: Raphael Schlarb <r.schlarb@instar.de>
To: openembedded-core@lists.openembedded.org
Cc: Raphael Schlarb <r.schlarb@instar.de>
Subject: [PATCH 2/2] busybox-inittab: add -L flag for getty
Date: Wed,  6 Aug 2025 16:20:19 +0200
Message-Id: <20250806142019.3453612-2-r.schlarb@instar.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250806142019.3453612-1-r.schlarb@instar.de>
References: <20250806142019.3453612-1-r.schlarb@instar.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 14:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221540

The -L (force local line) flag is almost always required for serial conso=
les,
otherwise the terminal might hang.

In sysvinit-inittab this flag is added through start_getty.
Adding it here makes things more consistent.

This was likely just overlooked when start_getty was replaced
by getty in commit 7120278.

Signed-off-by: Raphael Schlarb <r.schlarb@instar.de>
---
 meta/recipes-core/busybox/busybox-inittab_1.37.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb b/meta/r=
ecipes-core/busybox/busybox-inittab_1.37.0.bb
index 5e6c44a2e3..8cc907726f 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
@@ -22,7 +22,7 @@ do_install() {
         speed=3D$(echo $s | cut -d\; -f 1)
         device=3D$(echo $s | cut -d\; -f 2)
=20
-        echo "$device::respawn:${sbindir}/ttyrun $device ${base_sbindir}=
/getty $speed $device" >> ${D}${sysconfdir}/inittab
+        echo "$device::respawn:${sbindir}/ttyrun $device ${base_sbindir}=
/getty -L $speed $device" >> ${D}${sysconfdir}/inittab
     done
=20
 	if [ "${USE_VT}" =3D "1" ]; then

