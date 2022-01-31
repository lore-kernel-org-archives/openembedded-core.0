Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053C2C4332F
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 13:54:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.32522.1643637252151167317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C598713D5
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 706E83F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/runtime/stap: improve systemtap test
Date: Mon, 31 Jan 2022 13:54:08 +0000
Message-Id: <20220131135408.2857460-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131135408.2857460-1-ross.burton@arm.com>
References: <20220131135408.2857460-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 13:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161127

Split the test up into compile and execute phases, as the stap binary
is known to be quite memory-hungry and this can result in the probe
being unable to allocate enough memory for the buffers it needs.

If the test fails, dump the dmesg as any useful messages will be there.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/stap.py | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/=
cases/stap.py
index 615c290ce61..480eaabf2db 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -14,11 +14,19 @@ class StapTest(OERuntimeTestCase):
     @OEHasPackage(['gcc-symlinks'])
     @OEHasPackage(['kernel-devsrc'])
     def test_stap(self):
-        cmd =3D 'make -C /usr/src/kernel scripts prepare'
-        status, output =3D self.target.run(cmd, 900)
-        self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+        try:
+            cmd =3D 'make -j -C /usr/src/kernel scripts prepare'
+            status, output =3D self.target.run(cmd, 900)
+            self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
=20
-        cmd =3D 'stap -v --disable-cache -DSTP_NO_VERREL_CHECK -s1 -e \'=
probe oneshot { print("Hello, "); println("world!") }\''
-        status, output =3D self.target.run(cmd, 900)
-        self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
-        self.assertIn('Hello, world!', output, msg=3D'\n'.join([cmd, out=
put]))
+            cmd =3D 'stap -v -p4 -m stap-hello --disable-cache -DSTP_NO_=
VERREL_CHECK -e \'probe oneshot { print("Hello, "); println("SystemTap!")=
 }\''
+            status, output =3D self.target.run(cmd, 900)
+            self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+
+            cmd =3D 'staprun -v -R -b1 stap-hello.ko'
+            self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+            self.assertIn('Hello, SystemTap!', output, msg=3D'\n'.join([=
cmd, output]))
+        except:
+            status, dmesg =3D self.target.run('dmesg')
+            if status =3D=3D 0:
+                print(dmesg)
--=20
2.25.1


