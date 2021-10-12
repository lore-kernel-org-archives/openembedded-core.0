Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25449C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 18:19:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.18137.1634062786235691378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 11:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=nsCFybDE;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3BBFC82B94;
	Tue, 12 Oct 2021 20:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634062783;
	bh=ZgRnRUri3r6Kw0fHKYbEg63d7rzGfSSQL9IwCq4fxsc=;
	h=From:To:Cc:Subject:Date:From;
	b=nsCFybDEIy923QG4mr7CglLeEooF4I9NzpTrfHUJ4afqMnFTlzy+ZAFngxO9eO0ip
	 fwB0b0aq9wH4TB8f4V+W71tK1UGAvfuE44b+Gj1Bx4fGxlkFigK/Zh7n+JJoKRvEa8
	 mtdCftP+JgQ66X+dKyvU0jBkhmGXo/Te/S7FmFlNXcUNX9ZtcBbUCo7fn01Jpf3oR6
	 2go51z0tP1yjsdAJCfUPhOU7usUkVN44pVJvY/kA06vv8HnWQ+coAw6qEyhlKH1uFf
	 uG4fhWg4DRDo4mxvWH0OgJ0WtRQK1hsv1ILSRoWA6AdN/9VyP26Wpqovh/OfTURxyl
	 5qAhVXK91ZasA==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: ch@denx.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] rng-tools: add systemd-udev-settle wants to service
Date: Tue, 12 Oct 2021 20:19:33 +0200
Message-Id: <20211012181933.15585-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 18:19:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156886

From: Claudius Heine <ch@denx.de>

rngd needs to start after `systemd-udev-settle` in order for the kernel
modules of the random source hardware to be loaded before it is started.

However, since the `rngd.service` does not require or want
`systemd-udev-settle.service` it might not be scheduled for start and
the `After=3Dsystemd-udev-settle.service` there has no effect.

Adding `Wants=3Dsystemd-udev-settle.service` provides a weak requirement
to it, so that the `rngd` is started after it, if possible.

Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9715d4234eb7b45dee8b323799014646f0a1b07)
Cc: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta=
/recipes-support/rng-tools/rng-tools/rngd.service
index aaaaa29074..f296a99e1f 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -3,6 +3,7 @@ Description=3DHardware RNG Entropy Gatherer Daemon
 DefaultDependencies=3Dno
 After=3Dsystemd-udev-settle.service
 Before=3Dsysinit.target shutdown.target
+Wants=3Dsystemd-udev-settle.service
 Conflicts=3Dshutdown.target
=20
 [Service]
--=20
2.33.0


