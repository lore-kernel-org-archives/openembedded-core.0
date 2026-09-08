Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25594C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 13:49:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7815.1788875369715591105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 06:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=B+KrUNVw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A2911477
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 06:49:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8AB03F7B4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788875369; bh=Fm/LZRx2vaDomUQ0SOU/HrxOhVz6aaCMPUCH8TRUhJg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B+KrUNVwhCPZb2XvZL/k7vW+I+QiVzEyrYUIqrwyMYed+gsRcsG0cRm9oyLjX9DNx
	 v8wRdQPRHxAg/a0eKqze9AAUrltqvi/+JSjC175FRNLGQ4tAUR0omqHreJO7gzN+M7
	 faPL28hG8BhBRyO9EFBM+32QkPTuDtwlvBMloSjM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python_hatching: remove empty site-packages workaround
Date: Tue,  8 Sep 2026 14:49:26 +0100
Message-ID: <20260908134926.200628-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908134926.200628-1-ross.burton@arm.com>
References: <20260908134926.200628-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 13:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245365

Back in 2023 there were random failures from empty directories in the
python site-packages directory, which at the time was believed to be
specific to hatchling and so worked around in this build class[1]. This
is not the case, but changes to hatchling and upgrades would result in
rebuilds, which expose the issue if the build tree is not cleaned.

Since then fixes have been added to python3[2] and python3-build[3]
which resolve this issue at a lower level, so the workaround in this
class should be no longer needed.

[1] oe-core 3ded8b83ceb ("python_hatchling: remove empty python sysroot d=
irs")
[2] oe-core 73de8daa629 ("python3: backport the full fix for importlib sc=
anning invalid distributions")
    oe-core 855d1111c3d ("python3: prefer valid dists when searching for =
entry points")
[3] oe-core bd7225f5b84 ("python3-build: verify that found dependencies a=
re valid")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_hatchling.bbclass | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta/classes-recipe/python_hatchling.bbclass b/meta/classes-=
recipe/python_hatchling.bbclass
index 6765ddbe8ce..8ad3ac7fbbb 100644
--- a/meta/classes-recipe/python_hatchling.bbclass
+++ b/meta/classes-recipe/python_hatchling.bbclass
@@ -7,21 +7,3 @@
 inherit python_pep517
=20
 DEPENDS +=3D "python3-hatchling-native"
-
-# delete nested, empty directories from the python site-packages path. M=
ake
-# sure that we remove the native ones for target builds as well
-hatchling_rm_emptydirs:class-target () {
-        find ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/* -depth -typ=
e d -empty -delete
-        find ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/* -dep=
th -type d -empty -delete
-}
-
-hatchling_rm_emptydirs:class-native () {
-        find ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/* -dep=
th -type d -empty -delete
-}
-
-# Define a default empty version of hatchling_rm_emptydirs to appease bi=
tbake
-hatchling_rm_emptydirs () {
-        :
-}
-
-do_prepare_recipe_sysroot[postfuncs] +=3D " hatchling_rm_emptydirs"
--=20
2.43.0


