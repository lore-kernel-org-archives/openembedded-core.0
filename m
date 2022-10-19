Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEFEC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 20:37:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1884.1666211866741393005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 13:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 559D01424;
	Wed, 19 Oct 2022 13:37:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4C5B3F792;
	Wed, 19 Oct 2022 13:37:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] populate_sdk_base: ensure ptest-pkgs pulls in ptest-runner
Date: Wed, 19 Oct 2022 21:37:43 +0100
Message-Id: <20221019203743.2260431-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171979

Since "package_manager: Change complementary package handling to not
include soft dependencies"[1], complementary packages don't pull in
recommendations, just depends.  However, ptest.bbclass has a recommends
on ptest-runner, so if ptest packages are in an image via the ptest-pkgs
IMAGE_FEATURE, ptest-runner doesn't get installed.

[ YOCTO #14928 ]

[1] oe-core b44b0b9294675f89aa51ff84f532664f4c479677

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
index 0be108ad98e..64a4a58beff 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -15,7 +15,7 @@ COMPLEMENTARY_GLOB[staticdev-pkgs] =3D '*-staticdev'
 COMPLEMENTARY_GLOB[doc-pkgs] =3D '*-doc'
 COMPLEMENTARY_GLOB[dbg-pkgs] =3D '*-dbg'
 COMPLEMENTARY_GLOB[src-pkgs] =3D '*-src'
-COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest'
+COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest ptest-runner'
 COMPLEMENTARY_GLOB[bash-completion-pkgs] =3D '*-bash-completion'
=20
 def complementary_globs(featurevar, d):
--=20
2.34.1


