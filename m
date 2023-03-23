Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382D7C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 12:54:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.71663.1679576046898753104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 05:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C9924B3;
	Thu, 23 Mar 2023 05:54:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 842AE3F71E;
	Thu, 23 Mar 2023 05:54:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] scripts/lib/buildstats: handle top-level build_stats not being complete
Date: Thu, 23 Mar 2023 12:54:04 +0000
Message-Id: <20230323125404.1736319-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 12:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178985

If we try to parse a buildstats directory which was either aborted or
is still being built then the top-level build_stats file doesn't
contain an elapsed value which causes an exception:

UnboundLocalError: local variable 'elapsed' referenced before assignment

Default both start and elapsed to 0 so that the parse succeeds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/buildstats.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index c9a238bb127..9f8c9061505 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -239,6 +239,7 @@ class BuildStats(dict):
         """
         Parse the top-level build_stats file for build-wide start and du=
ration.
         """
+        start =3D elapsed =3D 0
         with open(path) as fobj:
             for line in fobj.readlines():
                 key, val =3D line.split(':', 1)
--=20
2.34.1


