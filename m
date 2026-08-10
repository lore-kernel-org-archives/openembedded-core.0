Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E00C5B567
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:57:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35582.1786384629429468571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 10:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=caJCqEn6;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80D414BF
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 10:57:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 771853F632
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786384628; bh=adRLMuZ4h/JfX68DLS2OgiYFyfN/2KnCQrcVyhEJGlU=;
	h=From:To:Subject:Date:From;
	b=caJCqEn69JiepzlZQ0lD9BCz/fsdgtDElXhN/mldahQVSKS5lZ2Rbm7anu7psAFD8
	 JMd0D8p7H5qC0Hy/y/Rau3goTszka/plZ9bvLuk1cvUdxTNAEGU816rl/ZoINk9myf
	 oE/SNjb/flAFBPSk02jwDWEFpEBEo8rj/4vbx+Jo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: promote dlopen "suggested" to RRECOMMENDS
Date: Mon, 10 Aug 2026 18:57:03 +0100
Message-ID: <20260810175703.3537601-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243144

The dlopen'd libraries in systemd are annotated with required/
recommended/suggested, which we map to RDEPENDS/RRECOMMENDS/RSUGGESTS.

However, no package managers actually install suggested libraries out of
the box so the functionality wasn't enabled without further action.
Promote the suggested dependencies to recommends so that they are
installed by default: any libraries that are not desired on target can
be avoided by using BAD_RECOMMENDATIONS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-cor=
e/systemd/dlopen-deps.inc
index 82a2ccd389c..2d43f2dcb8e 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -45,7 +45,7 @@ python package_generate_dlopen_deps() {
     dep_map =3D {
         "required": "RDEPENDS",
         "recommended": "RRECOMMENDS",
-        "suggested": "RSUGGESTS"
+        "suggested": "RRECOMMENDS"
     }
=20
     shlibs =3D oe.package.read_shlib_providers(d)
--=20
2.43.0


