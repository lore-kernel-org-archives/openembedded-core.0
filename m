Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEC0C87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:27:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89104.1754058441142489089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2EBC1516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:27:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 50BE23F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:27:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] Revert "python_setuptools_build_meta: clean the build directory in configure"
Date: Fri,  1 Aug 2025 15:27:09 +0100
Message-ID: <20250801142711.3276119-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221355

This is not needed: setuptools.build_meta does the build under a new
temporary directory.

This reverts commit ad488915b0e802f5525f9d857112e5513376fcaf.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/m=
eta/classes-recipe/python_setuptools_build_meta.bbclass
index f09f7e9a918..c7b12e53093 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -7,7 +7,3 @@
 inherit python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
-
-# This isn't nice, but is the best solutions to ensure clean builds for =
now.
-# https://github.com/pypa/setuptools/issues/4732
-do_configure[cleandirs] =3D "${PEP517_SOURCE_PATH}/build"
--=20
2.43.0


