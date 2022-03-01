Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27543C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:55:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1976.1646178917991447726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=tD6J/DNN;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9A2A783BD1;
	Wed,  2 Mar 2022 00:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646178915;
	bh=KZ85OrO57vwWpGsWn8SLuUD9QYv5BVY7F34f3ettAyI=;
	h=From:To:Cc:Subject:Date:From;
	b=tD6J/DNNs5Gzh9Tf1PCcAB4JKGYCkFZEYJsliFNexqF/GN5w0eOcK4eK86YWX4CEC
	 xvuv9GpP+kQOSZdTN4AXjvo0yUKxPmVvrLv68kRc0IB2JwqpomXo7Yk/CQktmaZ2Xw
	 NSHA13S2wf7K0KMuHWf0pqPzAlF/N9VHfJRsSNUbl13agAiOCXYEAE/eVG6hYzeVDl
	 2bsdWChcBH6xNIpq52Jr8wSBZKvNE/GQox9Z6ed+PjsJN3wdoNuTU0krBo7Xjvh1Is
	 V3nga/N9fQAzSuZBWHobeP7Ll96g7qH/NFhPIixyqpLVHWsQo6bGfxlBMa2PJDNQc2
	 JumDlL8SDfoKw==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Marek Vasut <marex@denx.de>,
	Mingli Yu <mingli.yu@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] bootchart2: Add missing python3-math dependency
Date: Wed,  2 Mar 2022 00:55:00 +0100
Message-Id: <20220301235500.2210662-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 23:55:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162581

Without this dependency, generating the bootchart may fail with:
"
ModuleNotFoundError: No module named 'random'
"

(cherry picked from commit 487e9f16a00f895159b79f1865fe8b626b47ddc2)
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mingli Yu <mingli.yu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta=
/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 66bd897a9a..7f05bd1b0b 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -144,7 +144,7 @@ do_install () {
=20
 PACKAGES =3D+ "pybootchartgui"
 FILES_pybootchartgui +=3D "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${b=
indir}/pybootchartgui"
-RDEPENDS_pybootchartgui =3D "python3-pycairo python3-compression python3=
-image python3-shell python3-compression python3-codecs"
+RDEPENDS_pybootchartgui =3D "python3-pycairo python3-compression python3=
-image python3-math python3-shell python3-compression python3-codecs"
 RDEPENDS_${PN}_class-target +=3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS_${PN}_class-target +=3D "lsb-release"
 DEPENDS_append_class-native =3D " python3-pycairo-native"
--=20
2.34.1


