Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE71C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 16:13:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.621.1789488800601884653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 09:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=iw6F1HEa;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C7BD152B
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:13:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A82313F882
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488800; bh=hymP7x6fnu+zDvJ3IM9B9kbNRQqXcXCBGF26iSq4/WE=;
	h=From:To:Subject:Date:From;
	b=iw6F1HEatm+tThpFu3XeMO65pu1TGt2Rcb0EbAfEIGz4Pox9LVLNnFo/aCtDhoR+i
	 1WBFpAoXmsjkgoGWpAS+vex2JBiX74rLl6NeNGCgZHwA+MUPTx8xul/40badhM9z1L
	 Vq0KtAe/zU+XLiszAAVCcG1XtjWhPkzuOlkZmkTE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/vala: remove obsolete logic
Date: Tue, 15 Sep 2026 17:13:16 +0100
Message-ID: <20260915161316.952007-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 16:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245861

We don't patch vala anymore, so there's no need to export
STAGING_DATADIR (as vala respects the pkgconfig variables) or delete
vapigen.m4 (as we don't patch the upstream file).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/vala.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes-recipe/vala.bbclass b/meta/classes-recipe/vala.=
bbclass
index 460ddb36f04..f23891417e7 100644
--- a/meta/classes-recipe/vala.bbclass
+++ b/meta/classes-recipe/vala.bbclass
@@ -11,8 +11,6 @@ VALADEPENDS =3D ""
 VALADEPENDS:class-target =3D "vala"
 DEPENDS:append =3D " vala-native ${VALADEPENDS}"
=20
-# Our patched version of Vala looks in STAGING_DATADIR for .vapi files
-export STAGING_DATADIR
 # Upstream Vala >=3D 0.11 looks in XDG_DATA_DIRS for .vapi files
 export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"
=20
@@ -22,9 +20,3 @@ FILES:${PN}-dev +=3D "\
     ${datadir}/vala/vapi/*.deps \
     ${datadir}/gir-1.0 \
 "
-
-# Remove vapigen.m4 that is bundled with tarballs
-# because it does not yet have our cross-compile fixes
-do_configure:prepend() {
-        rm -f ${S}/m4/vapigen.m4
-}
--=20
2.43.0


