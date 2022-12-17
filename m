Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EE1C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 04:57:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1905.1671253077229707768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 20:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=uRxLhiaa;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id ADB7D85175;
	Sat, 17 Dec 2022 05:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1671253074;
	bh=mdBpmj5briX3H0hhcAAn3TXnBUzji/eadF5FuegArYU=;
	h=From:To:Cc:Subject:Date:From;
	b=uRxLhiaaAFiYoTJYPoXYiQdEqLhPnamDm8RZeRBcVWskQQqRQDaR3du2IkfoM2CdI
	 zf2C5rcHUIpqp4ypXLVdiVvRgjQEUDH5qulHMRm7Ig6At0CbFtPHR6hKmOQEip4BCe
	 gXMMUaqdz1l77cW7gvz8EIOE74i0zGjho/ZnCqd3rPLjeC9EhqrdTob0G6YHB2NBBE
	 P982ljOBr2I7UrwB+aI8rC3oNSEhltbTWVWmfLUgCvY1qIR3ylnJUhYT/kg93PRavF
	 XSFK8JosIYW/i0WWKxGuWTdSpCmB1pY5aPIrWt830PodaXAZTACumEKZ0VVshhrOqG
	 WnmJp7HBqfvLA==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Pavel Zhukov <pavel.zhukov@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] package_rpm: Fix Linux 6.1.0 perf 1.0 version mistranslation
Date: Sat, 17 Dec 2022 05:57:38 +0100
Message-Id: <20221217045738.643519-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 04:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174767

With Linux 6.1.0 and perf 1.0-r9, a build which includes perf-dev fails d=
ue
to perf-dev depending on perf 6.6.1.0-r9 . This is because translate_vers=
()
operates on perf-dev and mangles its version. The following scenario occu=
rs:

  ver=3D6.1.0-r9
  pv=3D1.0
  pkgv=3D6.1.0
  reppv=3D6.1.0

With Linux 6.1.0, a corner case is hit where pv is a substring of ver, wh=
ich
yields this corrupted version 6.6.1.0-r9 . Example in python3:

  >>> "6.1.0-r9".replace("1.0", "6.1.0")
  '6.6.1.0-r9'
  >>> "6.0.13-r9".replace("1.0", "6.0.13")
  '6.0.13-r9'

The fix is to only replace pv with reppv in case pv is at the beginning
of ver , instead of replacing all occurences.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package_rpm.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
index 81a2060b68..39efcc328e 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -159,7 +159,9 @@ python write_specfile () {
                             pv =3D subd['PV']
                             pkgv =3D subd['PKGV']
                             reppv =3D pkgv.replace('-', '+')
-                            ver =3D ver.replace(pv, reppv).replace(pkgv,=
 reppv)
+                            if ver.startswith(pv):
+                                ver =3D ver.replace(pv, reppv)
+                            ver =3D ver.replace(pkgv, reppv)
                         if 'PKGR' in subd:
                             # Make sure PKGR rather than PR in ver
                             pr =3D '-' + subd['PR']
--=20
2.35.1


