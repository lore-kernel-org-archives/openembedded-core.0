Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09C8C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:12:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.600.1643047919429176882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1E1F101E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:11:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D1C63F766
	for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:11:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Revert "oeqa/runtime/stap: increase buffer size"
Date: Mon, 24 Jan 2022 18:11:55 +0000
Message-Id: <20220124181156.3921311-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 18:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160889

The failures appear to be OOMs during the compile phase, so the buffer
size isn't (yet) relevant.

If the buffer size is a problem, SystemTap commit 3106bc65 would be a
better fix.

This reverts commit 674fd536bc1c2308d557652ae100b1a1eee103b9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/stap.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/=
cases/stap.py
index 615c290ce61..ac0125edb2b 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -18,7 +18,7 @@ class StapTest(OERuntimeTestCase):
         status, output =3D self.target.run(cmd, 900)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
=20
-        cmd =3D 'stap -v --disable-cache -DSTP_NO_VERREL_CHECK -s1 -e \'=
probe oneshot { print("Hello, "); println("world!") }\''
+        cmd =3D 'stap -v --disable-cache -DSTP_NO_VERREL_CHECK -e \'prob=
e oneshot { print("Hello, "); println("world!") }\''
         status, output =3D self.target.run(cmd, 900)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
         self.assertIn('Hello, world!', output, msg=3D'\n'.join([cmd, out=
put]))
--=20
2.25.1


