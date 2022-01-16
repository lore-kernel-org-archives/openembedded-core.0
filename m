Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A89C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 03:43:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.29324.1642304587590319938
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jan 2022 19:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=he75qTvB;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5D762804C8;
	Sun, 16 Jan 2022 04:43:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642304584;
	bh=Nw09eUK7f4zgZDQSbSciMhcYY5asnXbAKBUsVKXq9Ts=;
	h=From:To:Cc:Subject:Date:From;
	b=he75qTvBZ6OhxLre+bgg3SI4aob7RI683dUn/mOJRukpRdlgGnWxDoXM81k8pB82L
	 Ayt/sU35Q9aXsSVNcWvnfwjpSUQ1dRKoEhCUaZpQXB7spz+ZvR0K+msCiw1DL5yqmR
	 cG9JnCXH+4ZgMNdFLhgztBsUG3Go1m/M1f+NhrDlsyNJT/vtra4SBRMosYfpOjRXTv
	 4lliubyXBRxdd+mrcW2EnuDjX/8Jkae4Ul1UnSxNx8GVzClrXZ1+qgrZxKNGCijHW4
	 13xuoHIRn2dS524T4Xy9NkxahY9AIG/hPRBkXIMOhUbO5PcjGKY6fe4bdcdBERMEWf
	 KOaGx6/8b/cjg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Mingli Yu <mingli.yu@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] bootchart2: Add missing python3-math dependency
Date: Sun, 16 Jan 2022 04:42:46 +0100
Message-Id: <20220116034246.460373-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 03:43:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160603

Without this dependency, generating the bootchart may fail with:
"
ModuleNotFoundError: No module named 'random'
"

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mingli Yu <mingli.yu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta=
/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 87f7631ddc..f0349dacf0 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -151,7 +151,7 @@ do_install () {
=20
 PACKAGES =3D+ "pybootchartgui"
 FILES:pybootchartgui +=3D "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${b=
indir}/pybootchartgui"
-RDEPENDS:pybootchartgui =3D "python3-pycairo python3-compression python3=
-image python3-shell python3-compression python3-codecs"
+RDEPENDS:pybootchartgui =3D "python3-pycairo python3-compression python3=
-image python3-math python3-shell python3-compression python3-codecs"
 RDEPENDS:${PN}:class-target +=3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS:${PN}:class-target +=3D "lsb-release"
 DEPENDS:append:class-native =3D " python3-pycairo-native"
--=20
2.34.1


