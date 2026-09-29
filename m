Return-Path: <joerg.vehlow@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8483DCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 07:25:04 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2563.1790666696592067501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 00:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=WEZVZze8;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=WEZVZze8;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1790666694;
	bh=2itMKshlgLKp3Gt9HvA2wwyp9EYK4KmQBbL3w78kLE8=;
	h=From:To:Cc:Subject:Date:From;
	b=WEZVZze86SZL6hPgVBxQdcVRehhFuawUnxZf7JMk/qsBfgv8fkGAQkxix6BD/Xed6
	 aZzi68k2kJ+RNUaaolLvab6WWat2ac/C6NIX+3eSodSdWbZNPi1pDnBxXhgcY3cXOo
	 ZU/iDx0Odz+hB+IAB269NdMwkeC/dIRbIytXCEVasTRfZpvqiT76kYJv9afihXrire
	 y7pHAZIixYtPghwv6j0JnvA0y+JNH8AZvrl6YAXLpQTPY/OipkI20AlGrZVjJXd0gY
	 v6rqVFmYO5njl/Gd3iZxmCjHGeUvjE8BHN/qvXl4TwK+7rrG5KNOpeCN3St3n/Ywas
	 p1KDj3fhPyOkg==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 25CAC5F9FA
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1790666694;
	bh=2itMKshlgLKp3Gt9HvA2wwyp9EYK4KmQBbL3w78kLE8=;
	h=From:To:Cc:Subject:Date:From;
	b=WEZVZze86SZL6hPgVBxQdcVRehhFuawUnxZf7JMk/qsBfgv8fkGAQkxix6BD/Xed6
	 aZzi68k2kJ+RNUaaolLvab6WWat2ac/C6NIX+3eSodSdWbZNPi1pDnBxXhgcY3cXOo
	 ZU/iDx0Odz+hB+IAB269NdMwkeC/dIRbIytXCEVasTRfZpvqiT76kYJv9afihXrire
	 y7pHAZIixYtPghwv6j0JnvA0y+JNH8AZvrl6YAXLpQTPY/OipkI20AlGrZVjJXd0gY
	 v6rqVFmYO5njl/Gd3iZxmCjHGeUvjE8BHN/qvXl4TwK+7rrG5KNOpeCN3St3n/Ywas
	 p1KDj3fhPyOkg==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 111705F7C7
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:24:53 +0200 (CEST)
From: Joerg Vehlow <joerg.vehlow@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Joerg Vehlow <joerg.vehlow@emlix.com>
Subject: [PATCH] tclibc-baremetal.inc: fix gcc-cross EXTRA_OECONF
Date: Tue, 29 Sep 2026 09:24:52 +0200
Message-ID: <20260929072452.2187140-1-joerg.vehlow@emlix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 07:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246846

Using EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append created a new overr=
ide
for EXTRA_OECONF, which led to almost all EXTRA_OECONF switches to be ign=
ored.
Furthermore, setting --without-headers here is not required,
because it is set in gcc-cross.inc.

Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/di=
stro/include/tclibc-baremetal.inc
index abea5a7162..6043cb6654 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -18,7 +18,6 @@ USE_NLS ?=3D "no"
 IMAGE_LINGUAS =3D ""
 LIBC_DEPENDENCIES =3D ""
=20
-EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append =3D " --without-headers"
 DEPENDS:remove:pn-meta-toolchain =3D "virtual/libc virtual/compilerlibs"
=20
 # certain compiler libs cannot be used without libc, avoid the dependenc=
e on compilerlibs

