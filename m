Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290D7CD6107
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:32:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.67966.1696869152860693848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=SodLGdHE;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3AFED86454;
	Mon,  9 Oct 2023 18:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696869151;
	bh=evs8SoJEyOPDRdxPu7J1CEqLgOPGu3/+KOUzv6juDlY=;
	h=From:To:Cc:Subject:Date:From;
	b=SodLGdHEVH/A8ZeXoUqsMSexXlb9JLXXC2qMBZl+tlOjp0LgqWNF1vdxl4SiybjhQ
	 +49niKpFj/CrRkm1TdWtGEkIXiHYL3fvUR0Kp/iOOUDgNWB5u28qbUA488v3I7R34Z
	 zaLKwMYhiuTrhOPmSpkUYikamF7nWkQptczb+GhvogWhKW/p4eMLvinPX0ObcImHOm
	 97ZzxeHsCemH+O3XMcIK0m3nkMjOwcAzs7NuyL3RAXjHEMWc0Exp5KKSb5Ra3At9XP
	 zTo8YW1KwsM6tm298mZBLfc5JSheDbX+ftub2OMG497Q3GAGX31fug2aql4b7NQ6Sr
	 Vpev9TrYMbHsA==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: [kirkstone][PATCH] ncurses: Mitigate CVE-2023-29491
Date: Mon,  9 Oct 2023 18:32:11 +0200
Message-Id: <20231009163211.94482-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188848

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
index 1abcfae1fe..7e85044bdb 100644
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


