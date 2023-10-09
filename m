Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202EFCD6106
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:31:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.67926.1696869084754674758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=jein550O;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 147C48692B;
	Mon,  9 Oct 2023 18:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696869083;
	bh=dRGBSWtCG8c9C6EmhHtEsmJlzqFMzK1XpZU6/qxOcvo=;
	h=From:To:Cc:Subject:Date:From;
	b=jein550OSIOMcamJ5Muwa+Q3hFIjWJacyxX6W9+mbWI+wgO8SsivG/t8Le5a8mFiw
	 BirRHRV/nWYsgW+S4LIkk7r0R2HsVxUZ6pjCzTQAmKsvjeHA53N+DNhkMbJmZ9EbS6
	 f3XFO9jgRJJiT+XlUNM6Q8QuEpiVwSPCgZQGIftGOXVWyfbeBDbByMNEaqs/T0GS2z
	 eM31BpPEJr4XWJHPiD0BU+Ws87c5Cg0LaRs4DfKLSKFJOAPGnM3vmW4FLADnAQEqSa
	 0iDmawDHfbfF5VtQXc1uruHl87miXRbXJekRaRfrXdrqIGOeLkdVYkDINYI7qFsljO
	 Ht7r6qkexCsUQ==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] ncurses: Mitigate CVE-2023-29491
Date: Mon,  9 Oct 2023 18:31:10 +0200
Message-Id: <20231009163110.94431-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188847

Configure with "--disable-root-environ" to disallow loading of
custom terminfo entries in setuid/setgid programs, mitigating the
impact of CVE-2023-29491.

This is taken from debian:
https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b878=
0d51cd09bd5a08ac

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
index 367f3b19f4..1bc07ec2d4 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -87,6 +87,7 @@ ncurses_configure() {
 	        --enable-sigwinch \
 	        --enable-pc-files \
 	        --disable-rpath-hack \
+	        --disable-root-environ \
 		${EXCONFIG_ARGS} \
 	        --with-manpage-format=3Dnormal \
 	        --without-manpage-renames \
--=20
2.40.1


