Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C64C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:53:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.66935.1680519188639741086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531801063;
	Mon,  3 Apr 2023 03:53:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F9C33F6C4;
	Mon,  3 Apr 2023 03:53:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] classes-recipe/setuptools3-base: clean up FILES assignments
Date: Mon,  3 Apr 2023 11:53:05 +0100
Message-Id: <20230403105306.3249922-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179613

Simply inheriting setuptools3-base should put everything in $libdir in
PN, and there's no need to replicate the pkgconfig packaging rules as
those are the defaults.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3-base.bbclass | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/setuptools3-base.bbclass b/meta/classes-=
recipe/setuptools3-base.bbclass
index 21b688ced07..d1c1fa095fc 100644
--- a/meta/classes-recipe/setuptools3-base.bbclass
+++ b/meta/classes-recipe/setuptools3-base.bbclass
@@ -23,15 +23,8 @@ export CCSHARED  =3D "-fPIC -DPIC"
 # the python executable
 export LINKFORSHARED =3D "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
=20
-FILES:${PN} +=3D "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
+FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
+FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
+FILES:${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.la"
=20
-FILES:${PN}-staticdev +=3D "\
-  ${PYTHON_SITEPACKAGES_DIR}/*.a \
-"
-FILES:${PN}-dev +=3D "\
-  ${datadir}/pkgconfig \
-  ${libdir}/pkgconfig \
-  ${PYTHON_SITEPACKAGES_DIR}/*.la \
-"
 inherit python3native python3targetconfig
-
--=20
2.34.1


