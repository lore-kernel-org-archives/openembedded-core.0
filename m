Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6B7E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 18:03:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26009.1736532215876720170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 10:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B641477
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 10:04:03 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEE743F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 10:03:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] classes/nativesdk: also override TUNE_PKGARCH
Date: Fri, 10 Jan 2025 18:03:28 +0000
Message-ID: <20250110180331.2537602-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 18:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209660

The nativesdk class overrides PACKAGE_ARCH and unsets TUNE_FEATURES, but
as recipes might want to look at TUNE_PKGARCH too (for example, when
setting QEMU_EXTRAOPTIONS) we should also override that variable.

Otherwise, a nativesdk recipe will have the TUNE_PKGARCH of the target,
which leads to errors (eg passing mips arguments to an arm qemu).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
index b0634de5829..4e57349aa08 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -32,6 +32,7 @@ RECIPE_SYSROOT =3D "${WORKDIR}/recipe-sysroot"
 #
 PACKAGE_ARCH =3D "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS =3D "${SDK_PACKAGE_ARCHS}"
+TUNE_PKGARCH =3D "${SDK_ARCH}"
=20
 #
 # We need chrpath >=3D 0.14 to ensure we can deal with 32 and 64 bit
--=20
2.43.0


