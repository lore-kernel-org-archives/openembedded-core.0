Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5428AEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 12:34:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9032.1687264448697701438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 05:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24C361063;
	Tue, 20 Jun 2023 05:34:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C836E3F71E;
	Tue, 20 Jun 2023 05:34:07 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] sysfstools: don't install to base_libdir
Date: Tue, 20 Jun 2023 13:34:04 +0100
Message-Id: <20230620123404.3854578-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620123404.3854578-1-ross.burton@arm.com>
References: <20230620123404.3854578-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 12:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183135

From: Ross Burton <ross.burton@arm.com>

This library now ships a pkgconfig file but $base_libdir isn't in the
search path, so can't be used.

As the base_libdir/libdir split is pretty meaningless these days, simply
stop installing into base_libdir.  This was added to silence warnings
from pcmciautils[1] but PCMCIA isn't really a thing anymore so this
shouldn't be a problem.

[1] oe-core f3c93627

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/reci=
pes-core/sysfsutils/sysfsutils_2.1.1.bb
index 64a6cc26d33..86cc06a2cdd 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -19,5 +19,3 @@ inherit autotools
=20
 PACKAGES =3D+ "libsysfs"
 FILES:libsysfs =3D "${libdir}/lib*${SOLIBS}"
-
-export libdir =3D "${base_libdir}"
--=20
2.34.1


