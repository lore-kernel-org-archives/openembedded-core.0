Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05568CD6106
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:27:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.67380.1696868852524297305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=InFKbO8i;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 27977864D4;
	Mon,  9 Oct 2023 18:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696868850;
	bh=bLOV/WlmDz3iKXtprd0AiZZYuITi20orHuezN05Ufh0=;
	h=From:To:Cc:Subject:Date:From;
	b=InFKbO8igUZ9S2tveQRKIKmC27xCEew96zrJ8MGpjoMYxog6OvlB0PzNuMmgL8XG6
	 FZ3IZB3cbv282Cjy8b4XhbjyzHEhQqX4gQR5hFrODgfWY3Eji17L64mMrlRZnc7que
	 /9deDe1wQNMDD2QPn/LtwVlNHmSv76bXGe9H2VQHg0FF4GiHR+GCFPxS8NAqFO+LgJ
	 ii/DRmZMie7INDSZwavA2mwZWMODGpq0oKq0/rj/KbgeRJhhWgFCVHTUT3jxWu/arB
	 DUazYj9VFz3/ipZRgXR+K/PEkkgoUWdOW07+lLO3bDoKDEoF8tFYxCMLH0Z06MZUwU
	 RxAKwP3RoB7oA==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: [dunfell][PATCH] ncurses: Mitigate CVE-2023-29491
Date: Mon,  9 Oct 2023 18:27:23 +0200
Message-Id: <20231009162723.94207-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188846

Configure with "--disable-root-environ" to disallow loading of
custom terminfo entries in setuid/setgid programs, mitigating the
impact of CVE-2023-29491.

This is taken from debian:
https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b878=
0d51cd09bd5a08ac

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
index ee0b15ecf0..38826a6231 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -86,6 +86,7 @@ ncurses_configure() {
 	        --enable-sigwinch \
 	        --enable-pc-files \
 	        --disable-rpath-hack \
+	        --disable-root-environ \
 		${EXCONFIG_ARGS} \
 	        --with-manpage-format=3Dnormal \
 	        --without-manpage-renames \
--=20
2.40.1


