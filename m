Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41154C001DB
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 00:05:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.77543.1691539538133978528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 17:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=LfG8IrNj;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 95E0E86763;
	Wed,  9 Aug 2023 02:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1691539535;
	bh=kwT70rU8SbzBTSxgIrYlkLZ+ke5CBDku/j36Ef103jc=;
	h=From:To:Cc:Subject:Date:From;
	b=LfG8IrNj2SP8uNRFrJQg8409wlwneTia0PmbRSb/Zk/48CDeDzaU21C3OwJ9Y7Fgb
	 eYVaSdUa+C5JhQ7/gO0rVuzwcfc6ZH5FG79KppKYIiKMLx3Vq63F/xRQvJ97am5sMA
	 U38aHxjMcnn6hsIkAslYWOa91ashu4RdnxkB0EcxXR3QkH4x52hSaZPjmvzcRuP2/c
	 vvqN6nj3SVtigdlRTSSGdA2SAL3oEsfCXwsGVlewm0QrUk4WL1QJ7DrMlJ00bOSE0D
	 iRW06XwphqhiuzMIPcvj9LXnrgCw3RF686VNT6Vs7IuMCjfuiV9PI6w7Eg8G2yQwpm
	 KSl1bHPdxUGHQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] linux-firmware: Fix mediatek mt7601u firmware path
Date: Wed,  9 Aug 2023 02:05:24 +0200
Message-Id: <20230809000524.76853-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 00:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185681

The following linux-firmware commit moved the mt7601u firmware blob
into a mediatek/ subdirectory, update the path accordingly.
8451c2b1 ("mt76xx: Move the old Mediatek WiFi firmware to mediatek")

Fixes: 64603f602d ("linux-firmware: upgrade 20230404 -> 20230515")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Steve Sakoman <steve@sakoman.com>
---
NOTE: It would be good to apply to kirkstone and dunfell too
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 3c88bdeb7e..6765226b9d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -419,7 +419,7 @@ LICENSE:${PN}-mt7601u-license =3D "Firmware-ralink_a_=
mediatek_company_firmware"
=20
 FILES:${PN}-mt7601u-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.ralink_a_mediatek_company_firmware"
 FILES:${PN}-mt7601u =3D " \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
 "
=20
 RDEPENDS:${PN}-mt7601u +=3D "${PN}-mt7601u-license"
--=20
2.40.1


