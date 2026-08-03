Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B58CC5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:47:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39674.1785750442821758693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fvXf58WY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FD8C143D
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 02:47:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEBCF3F66F
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785750442; bh=0/x/q//ZA4yu+uH+kYZViGPcA/NLqxJ9aodbmrORqHM=;
	h=From:To:Subject:Date:From;
	b=fvXf58WYcaVjZ/FTKjvkBiP6K+vW+R4pIXLzFdg+FwbW1Hh+oC1zzcdQlN1ZI+lzq
	 gybWXnX60YmTDMgZRM3jfUblARYj6cFZ+hAPQ3SdP+akfLQdc798MR8PNY5ziqG/9o
	 iJQqrlI9ZQgHDFhmbwoo7xVVdjIbR8h861XvzAYY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/setuptools_build_meta: clean the build directory in configure
Date: Mon,  3 Aug 2026 10:47:17 +0100
Message-ID: <20260803094717.3814205-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 09:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242644

It's not currently possible to set the build tree to be somewhere we
control, but we know it will always be in the build directory alongside
the setup.py so we can [cleandirs] that.

Essentially the same as the previous patch for the setuptools class[1],
but when using the pep517 class.

[1] oe-core f3854f4f608 ("setuptools3: clean the build directory in confi=
gure")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/m=
eta/classes-recipe/python_setuptools_build_meta.bbclass
index c7b12e53093..f09f7e9a918 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -7,3 +7,7 @@
 inherit python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
+
+# This isn't nice, but is the best solutions to ensure clean builds for =
now.
+# https://github.com/pypa/setuptools/issues/4732
+do_configure[cleandirs] =3D "${PEP517_SOURCE_PATH}/build"
--=20
2.43.0


