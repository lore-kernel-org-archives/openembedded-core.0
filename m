Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC273C77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 11:09:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19282.1684753774377441195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 04:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED2511FB;
	Mon, 22 May 2023 04:10:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A6183F6C4;
	Mon, 22 May 2023 04:09:33 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libcomps: clean up DEPENDS
Date: Mon, 22 May 2023 12:09:31 +0100
Message-Id: <20230522110931.2139503-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 11:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181590

From: Ross Burton <ross.burton@arm.com>

This recipe depends on zlib so add that explicitly.

Disable the tests and remove the dependency on libcheck, as we don't
install them.

Remove obsolete PYTHON_DESIRED assignment that isn't used anywhere.

Explicitly disable the documentation for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/libcomps/libcomps_0.1.19.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb b/meta/rec=
ipes-devtools/libcomps/libcomps_0.1.19.bb
index f8063d94007..e362e8e1081 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
@@ -15,10 +15,12 @@ S =3D "${WORKDIR}/git"
=20
 inherit cmake setuptools3-base
=20
-DEPENDS +=3D "libxml2 expat libcheck"
+DEPENDS =3D "expat libxml2 zlib"
+
+EXTRA_OECMAKE =3D "-DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES_DIR} \
+                 -DENABLE_DOCS=3DOFF \
+                 -DENABLE_TESTS=3DOFF"
=20
-EXTRA_OECMAKE =3D " -DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES_DIR} -D=
PYTHON_DESIRED=3D3"
 OECMAKE_SOURCEPATH =3D "${S}/libcomps"
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
--=20
2.34.1


