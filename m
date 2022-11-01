Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30369C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 21:35:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.306.1667338493864167862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 14:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=g1pAyh0c;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F146780713;
	Tue,  1 Nov 2022 22:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1667338491;
	bh=xZSslnX6VMA/pCMV3iQQETx4dK6TXDckPl1fP8ucVus=;
	h=From:To:Cc:Subject:Date:From;
	b=g1pAyh0ci7hU1CqePphn5oJe/xKo7yMK26fVaPbF8L8z6iL16yCQZie7jY3x/s9v2
	 rwxxLT019AcDJXqWsT9skwAkmxHZJIZNRYD87Cw43n6rh0YiDMQXoRwUU+XYy+JLU6
	 3FjxR/5oO/q/HlcWwDUN2SvU1EpZqtKhjsOX/Q7+Hsxwr98d/TTXKw49j1XIzsc1AT
	 UqGd52zv3SevZoZgAz8J5jT0x7mvFjy3vts1URaDuY/T4GI7rYA1ne09D/N3OCdFAC
	 32w+doqJryME2zovA9puvgy+VrUsLXvXYhcrZFmvct7M4A9uuaYMR871bR7CE4iiV9
	 YtGfx9JArvdEg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3] bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware
Date: Tue,  1 Nov 2022 22:34:46 +0100
Message-Id: <20221101213446.145119-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 21:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172391

Currently the hciattach bcm43xx firmware loader looks up the firmware
blob in /etc/firmware . Change this to /lib/firmware instead, so that
the path is consistent with Linux kernel which also looks up firmware
for the WiFi part in /lib/firmware .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
V2: Replace hard-coded /lib with ${nonarch_base_libdir}
V3: Use CFLAGS +=3D instead
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index f07e318897..a8eaba1dd6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,8 @@ EXTRA_OECONF =3D "\
   --without-zsh-completion-dir \
 "
=20
+CFLAGS +=3D "-DFIRMWARE_DIR=3D\\"${nonarch_base_libdir}/firmware\\""
+
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
 NOINST_TOOLS_READLINE ??=3D ""
--=20
2.35.1


