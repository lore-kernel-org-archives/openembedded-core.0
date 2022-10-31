Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA62FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 16:30:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.11441.1667233822498468929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 09:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=ftRMLT0Y;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CD5A084F64;
	Mon, 31 Oct 2022 17:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1667233820;
	bh=FTArg9EeByDBpCYQbaMDsOwUqtk5CQUOVPXvEttY9E0=;
	h=From:To:Cc:Subject:Date:From;
	b=ftRMLT0YiKtVCkoOh81REXk440X8Tg25PCaI4q+UMaSxjn4he1UkLl1HxyuNH4bq5
	 IysqUVA+gjxEpakifS2do5N1mkdZZO+8DLrDUgBrNMjmJ18tGQH/b4LejnnxGizkmG
	 koSSu3WY8987tvyE1AmTv2tT9ojEpugGEn0Om0r/Xj5jE9V0CYdZPv7mtmV+r26GUJ
	 EywnrbbKATZXkwaWaXWDy5Pl9P0xurf/7xJOcU2n8fTC+xRxLLNroOm5WPb8o35Ris
	 D9OMqGwqcFAZrdpTKOnuSoMY9WSeaRTK/RzzJF6Kevpl00yiTpmTWAarKwcgO8e7CV
	 TXAX3a5C05Bfg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware
Date: Mon, 31 Oct 2022 17:30:15 +0100
Message-Id: <20221031163015.19021-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 16:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172331

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
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index f07e318897..fe10be7324 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,8 @@ EXTRA_OECONF =3D "\
   --without-zsh-completion-dir \
 "
=20
+CFLAGS:append =3D " -DFIRMWARE_DIR=3D\\"/lib/firmware\\""
+
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
 NOINST_TOOLS_READLINE ??=3D ""
--=20
2.35.1


