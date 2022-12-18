Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC29AC4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 00:00:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.19890.1671321644262825035
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 16:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=kiCIv98f;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2E63984E98;
	Sun, 18 Dec 2022 01:00:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1671321641;
	bh=n2ldt817ZmGqbtkY1e3Ik0QNl4Y1aLqbILvClkhwF2g=;
	h=From:To:Cc:Subject:Date:From;
	b=kiCIv98flaLgV7Ry1s+9oYzNenMmkII2BR5zO8Fzie79mHuekfN92u9s7GZGAPZ7G
	 pYhSk1WvrELoAUWY8CIhYtV7+7XqSea3AIJFZt0VgyoetZRvq1aNHuohY3VihUsY4p
	 s8qWeL4RVehVP2JG5wFcwupMFSRU14uen/gDZx4uE0rOeYLsG+fAZS5/po8l6Y1fvt
	 aPohkCuYpKykKcdEE1gU4JoskGDUK5boEaXHvE96fLPN1KkEKeBB4ImD7t3s+Kf1fp
	 Wawv/feo42fikWdTXVI53QMQ2EYlryACkgJjgAsbkwjw5Ajq1liyIzjdHbuExldW1S
	 MYJO8Sec5UADQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] systemd: Make importd depend on glib-2.0 again
Date: Sun, 18 Dec 2022 01:00:38 +0100
Message-Id: <20221218000038.157725-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 00:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174782

It seems importd still requires glib-2.0, add the missing dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_251.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_251.8.bb b/meta/recipes-co=
re/systemd/systemd_251.8.bb
index 5fb0e86982..8f2fb90455 100644
--- a/meta/recipes-core/systemd/systemd_251.8.bb
+++ b/meta/recipes-core/systemd/systemd_251.8.bb
@@ -144,7 +144,7 @@ PACKAGECONFIG[hostnamed] =3D "-Dhostnamed=3Dtrue,-Dho=
stnamed=3Dfalse"
 PACKAGECONFIG[idn] =3D "-Didn=3Dtrue,-Didn=3Dfalse"
 PACKAGECONFIG[ima] =3D "-Dima=3Dtrue,-Dima=3Dfalse"
 # importd requires journal-upload/xz/zlib/bzip2/gcrypt
-PACKAGECONFIG[importd] =3D "-Dimportd=3Dtrue,-Dimportd=3Dfalse"
+PACKAGECONFIG[importd] =3D "-Dimportd=3Dtrue,-Dimportd=3Dfalse,glib-2.0"
 # Update NAT firewall rules
 PACKAGECONFIG[iptc] =3D "-Dlibiptc=3Dtrue,-Dlibiptc=3Dfalse,iptables"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Dtrue,-Dlibcurl=3Dfalse,cu=
rl"
--=20
2.35.1


