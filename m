Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4807C7EE23
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 17:21:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.95482.1684171307743634427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 10:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=Wan3ky66;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F043F846AF;
	Mon, 15 May 2023 19:21:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1684171305;
	bh=wGzXZ7XpnjioTYHjZ9Ig0cB4oK0cpfEJWGgzlcVdxhA=;
	h=From:To:Cc:Subject:Date:From;
	b=Wan3ky66y4QEHcz8EjW7c4P8CQBopn8x9z+BNVcsRCuBs3s+mlo8R5Dus7ylF2lhc
	 NsTltGedLjf2apGhOMTy5jaw1w9hmIe3QNGrpcp6w50Q+GaVFUCpRse5rxbdHVpaOb
	 qF3lezQyPzyU+SvNl0XHJDS7PoPP1t+bK28iwyd5pXeCeANf6GviHtWcyz8Zf11QPZ
	 qpgwh4dRv89jumEOdqXcrXOcTdj7996tFS+iqmcEro747CmL8fH1vussxKsGZIZYpD
	 wEtmC7aFo8oLQAF5LNwBg3PvLojcbmp4HDtyNgmJQW5+ssmvm+/JJeO+jtfwg5ElYL
	 HeB11aun7wYnw==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] perf: Depend on native setuptools3
Date: Mon, 15 May 2023 19:21:38 +0200
Message-Id: <20230515172138.178648-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 17:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181268

From: Khem Raj <raj.khem@gmail.com>

perf has need for python setuptools when scripting is enabled
from 6.0.0 onwards it seems to throw an explicit error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da3d00178809bbf7cc453401e0c5937796ebc2c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 9c9bf1647f..91bf648caa 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -13,7 +13,7 @@ PR =3D "r9"
=20
 PACKAGECONFIG ??=3D "scripting tui libunwind"
 PACKAGECONFIG[dwarf] =3D ",NO_DWARF=3D1"
-PACKAGECONFIG[scripting] =3D ",NO_LIBPERL=3D1 NO_LIBPYTHON=3D1,perl pyth=
on3"
+PACKAGECONFIG[scripting] =3D ",NO_LIBPERL=3D1 NO_LIBPYTHON=3D1,perl pyth=
on3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
--=20
2.39.2


