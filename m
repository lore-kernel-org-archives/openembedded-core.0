Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A89FA373D
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 11:55:10 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.5374.1667303704007703223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 04:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=m7Avp+KA;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B299E8491C;
	Tue,  1 Nov 2022 12:55:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1667303700;
	bh=XogCtprMZvkRs2LNRjsuYCZFZIglFCasgd75QuFZ4E4=;
	h=From:To:Cc:Subject:Date:From;
	b=m7Avp+KA1D785trYXK+QEyb79c4LUmCL14b1/qxwqm/hYmgXTPiE2mrHVVqWwhTCG
	 DmEJz6QciP+V2lgp4XzlZqui1j0+lK6/PPl2rZ7Rq9zm70K7z55ogWWB0nMFnsmnT+
	 oh3L73HXAlC3hv51vqiaWi1eXmsII7HUH4UGKXCj4xH2tg78K/T1jZ6jQfD8mforsF
	 ZrXut/jFjCV6mXeS4N1NJ4Hj0/3ztLq81jxFFyqPbgHvIX7VpgoRxw1Ys5d1x5vbEJ
	 IkUBHQ7qXjqor36eMxo6fFnkI/VsWU+SUC8xj+bc2En4TgNqWi2Oz73hhE1oxd+dxv
	 Q6kFtb/I1FLqg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware
Date: Tue,  1 Nov 2022 12:54:45 +0100
Message-Id: <20221101115445.18282-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 11:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172359

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
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index f07e318897..a2aa7b86c4 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,8 @@ EXTRA_OECONF =3D "\
   --without-zsh-completion-dir \
 "
=20
+CFLAGS:append =3D " -DFIRMWARE_DIR=3D\\"${nonarch_base_libdir}/firmware\=
\""
+
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
 NOINST_TOOLS_READLINE ??=3D ""
--=20
2.35.1


