Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14AAEB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5305.1689246082972235295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 04:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC0F1576;
	Thu, 13 Jul 2023 04:02:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 053F63F740;
	Thu, 13 Jul 2023 04:01:20 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] machine/arch-arm64: add -mbranch-protection=standard
Date: Thu, 13 Jul 2023 12:01:19 +0100
Message-Id: <20230713110119.3959009-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713110119.3959009-1-ross.burton@arm.com>
References: <20230713110119.3959009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 11:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184238

From: Ross Burton <ross.burton@arm.com>

Enable branch protection (PAC/BTI) for all aarch64 builds.  This was
previously enabled at a global level in the GCC build, but that breaks
the gcc test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/mac=
hine/include/arm/arch-arm64.inc
index 0e2efb5a40f..832d0000acb 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -37,3 +37,8 @@ TUNE_ARCH =3D "${@bb.utils.contains('TUNE_FEATURES', 'a=
arch64', '${TUNE_ARCH_64}',
 TUNE_PKGARCH =3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TU=
NE_PKGARCH_64}', '${TUNE_PKGARCH_32}', d)}"
 ABIEXTENSION =3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${AB=
IEXTENSION_64}', '${ABIEXTENSION_32}', d)}"
 TARGET_FPU =3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARG=
ET_FPU_64}', '${TARGET_FPU_32}', d)}"
+
+# Emit branch protection (PAC/BTI) instructions.  On hardware that doesn=
't
+# support these they're meaningless NOP instructions, so there's very li=
ttle
+# reason not to.
+TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ' -mb=
ranch-protection=3Dstandard', '', d)}"
--=20
2.34.1


