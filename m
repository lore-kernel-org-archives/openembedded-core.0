Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C88D2B95E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 16:12:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23808.1730823157066719018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 08:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A3B01063
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 08:13:06 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 224253F6A8
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 08:12:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] python_mesonpy: remove cython-specific INSANE_SKIPs
Date: Tue,  5 Nov 2024 16:12:26 +0000
Message-Id: <20241105161227.2324296-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105161227.2324296-1-ross.burton@arm.com>
References: <20241105161227.2324296-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 16:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206721

These INSANE_SKIPs are specific to cython and unrelated to mesonpy, so
remove them. The new cython.bbclass should resolve the cause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_mesonpy.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-re=
cipe/python_mesonpy.bbclass
index 131fa74bede..81c087c7c75 100644
--- a/meta/classes-recipe/python_mesonpy.bbclass
+++ b/meta/classes-recipe/python_mesonpy.bbclass
@@ -33,10 +33,6 @@ def mesonpy_get_args(d):
=20
 PEP517_BUILD_OPTS =3D "-Cbuilddir=3D'${B}' ${@mesonpy_get_args(d)}"
=20
-# Python pyx -> c -> so build leaves absolute build paths in the code
-INSANE_SKIP:${PN} +=3D "buildpaths"
-INSANE_SKIP:${PN}-src +=3D "buildpaths"
-
 python_mesonpy_do_configure () {
     python_pep517_do_configure
 }
--=20
2.34.1


