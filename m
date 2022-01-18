Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56231C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 18:08:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.538.1642529281156927335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDCD4D6E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:07:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 828583F774
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:07:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/stap: increase buffer size
Date: Tue, 18 Jan 2022 18:07:54 +0000
Message-Id: <20220118180754.807566-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 18:08:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160675

We're seeing random failures in the SystemTap tests in qemuarm on kernel
5.10. This might be related to the buffer between user and kernel space
being too small, so explicitly set the size.

If this cures the problem it should be considered a workaround and not
the solution.

[ YOCTO #14673 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/stap.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/=
cases/stap.py
index ac0125edb2b..615c290ce61 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -18,7 +18,7 @@ class StapTest(OERuntimeTestCase):
         status, output =3D self.target.run(cmd, 900)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
=20
-        cmd =3D 'stap -v --disable-cache -DSTP_NO_VERREL_CHECK -e \'prob=
e oneshot { print("Hello, "); println("world!") }\''
+        cmd =3D 'stap -v --disable-cache -DSTP_NO_VERREL_CHECK -s1 -e \'=
probe oneshot { print("Hello, "); println("world!") }\''
         status, output =3D self.target.run(cmd, 900)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
         self.assertIn('Hello, world!', output, msg=3D'\n'.join([cmd, out=
put]))
--=20
2.25.1


