Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72FAC7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 01:45:05 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2792.1684979099175987005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 18:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=sSLnHVcK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34P1iq9L117641;
	Wed, 24 May 2023 20:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684979092;
	bh=+ogIzqDelfQxL0QQJv19hMC5pyDKyRTPD6iC9D9yIno=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sSLnHVcKoet5d+Be0m/YAYW357yYjGhSwbO/V8+FpDiRvR6LOYbq/xDsVVhHMJuLO
	 tryBqMoxnk71LQGojftMZm1ht6SPj+V/kiZwoGcGfGF3AEvY99GGlRp/5Geq76Q+V0
	 Mz3Y21TzocBg7aJS7VNvEpBNxyGULYLvKkfsdWqo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34P1iqlN121277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 20:44:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 20:44:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 20:44:51 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34P1ipg2030323;
	Wed, 24 May 2023 20:44:51 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>,
        Zoltan Boszormenyi
	<zboszor@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 2/3] piglit: Fix build time dependency
Date: Wed, 24 May 2023 20:44:47 -0500
Message-ID: <20230525014448.486619-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525014448.486619-1-rs@ti.com>
References: <20230525014448.486619-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 34P1iq9L117641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 01:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181700

From: Zoltan Boszormenyi <zboszor@gmail.com>

Replace explicit opencl-icd-loader with virtual/opencl-icd.

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index 5b7a206247c..a3c9c5e2e09 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -40,7 +40,7 @@ do_compile[dirs] =3D+ "${B}/temp/"
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11=
 glx', '', d)}"
 PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,-DPIGLIT_USE_GLUT=3D0=
,freeglut,"
 PACKAGECONFIG[glx] =3D "-DPIGLIT_BUILD_GLX_TESTS=3DON,-DPIGLIT_BUILD_GLX=
_TESTS=3DOFF"
-PACKAGECONFIG[opencl] =3D "-DPIGLIT_BUILD_CL_TESTS=3DON,-DPIGLIT_BUILD_C=
L_TESTS=3DOFF,opencl-icd-loader"
+PACKAGECONFIG[opencl] =3D "-DPIGLIT_BUILD_CL_TESTS=3DON,-DPIGLIT_BUILD_C=
L_TESTS=3DOFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] =3D "-DPIGLIT_BUILD_GL_TESTS=3DON,-DPIGLIT_BUILD_GL_T=
ESTS=3DOFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] =3D "-DPIGLIT_BUILD_VK_TESTS=3DON,-DPIGLIT_BUILD_V=
K_TESTS=3DOFF,vulkan-loader"
=20
--=20
2.40.1


