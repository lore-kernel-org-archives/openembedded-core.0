Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D87C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 15:47:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.29873.1684511264526224490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 08:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=M1E3fMxl;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 943B48214B;
	Fri, 19 May 2023 17:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1684511262;
	bh=zRz/zTEQU87gOtk1QA1aKeZUrP6KePkGyBZV+BWs6FY=;
	h=From:To:Cc:Subject:Date:From;
	b=M1E3fMxlcvQXP+ast8FMboq9IxzDubI7YT7XzSnyg6Ej7lhBn4OZo2MCFbAnNooeg
	 eo0bbVZtyAVNtjksonZdPKUxTEPmjQIbnJaFXoidLVEJj8LbZkA+1g6GThJeAUto0b
	 VcOrxQf44nPkdzoyd9nqX0hvLxggANthp/h8CrUydxQd3Hlh9SorVpa335OPHRcQtS
	 kX7LkjfDRWzU9wp/GocukmeaPTCcs0H2+r0VpkQL5jXIz4eF6Xhi3yonnMCxBW1xXg
	 vAuCvB5Ks9pS2gcS2jOEU7Q7vq6FIUIcb3g3FS/CpbheURdXFWyRncmqwVBHV12dMV
	 NRJ4VnrrN0D7w==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: leimaohui <leimaohui@fujitsu.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH] nghttp2: Deleted the entries for -client and -server, and removed a dependency on them from the main package.
Date: Fri, 19 May 2023 17:47:29 +0200
Message-Id: <20230519154729.12714-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 15:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181558

From: leimaohui <leimaohui@fujitsu.com>

By default there is nothing in nghttp2-client and nghttp2-server ,nghttp2=
-client
and nghttp2-server aren't created. So there are dependences error if inst=
all
main package.

Problem: conflicting requests
  - nothing provides nghttp2-client >=3D 1.52.0 needed by nghttp2-1.52.0-=
r0.core2_64
  - nothing provides nghttp2-server >=3D 1.52.0 needed by nghttp2-1.52.0-=
r0.core2_64

Upstream-Status: Backport [OE-core d2cbe060955c598bd81923ecd554fbe82c17af=
99]
Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.47.0.bb
index becacd4502..90d3286ac6 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -23,17 +23,15 @@ EXTRA_OECMAKE =3D "-DENABLE_EXAMPLES=3DOFF -DENABLE_A=
PP=3DOFF -DENABLE_HPACK_TOOLS=3DOFF
 #
 EXTRA_OECMAKE +=3D "-DENABLE_PYTHON_BINDINGS=3DOFF"
=20
-PACKAGES =3D+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
+PACKAGES =3D+ "lib${BPN} ${PN}-proxy "
=20
-RDEPENDS:${PN} =3D "${PN}-client (>=3D ${PV}) ${PN}-proxy (>=3D ${PV}) $=
{PN}-server (>=3D ${PV})"
+RDEPENDS:${PN} =3D "${PN}-proxy (>=3D ${PV})"
 RDEPENDS:${PN}:class-native =3D ""
 RDEPENDS:${PN}-proxy =3D "openssl python3-core python3-io python3-shell"
=20
 ALLOW_EMPTY:${PN} =3D "1"
 FILES:${PN} =3D ""
 FILES:lib${BPN} =3D "${libdir}/*${SOLIBS}"
-FILES:${PN}-client =3D "${bindir}/h2load ${bindir}/nghttp"
 FILES:${PN}-proxy =3D "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-re=
sponse"
-FILES:${PN}-server =3D "${bindir}/nghttpd"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.2


