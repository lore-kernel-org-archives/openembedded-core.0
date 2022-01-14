Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3CCC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:08:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10938.1642183694790871155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98173ED1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:08:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F0063F766
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:08:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/stap: rewrite test
Date: Fri, 14 Jan 2022 18:08:10 +0000
Message-Id: <20220114180810.321759-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:08:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160581

There's no need to copy files to the target when stap can take the short
probe directly.

Add more has-package decorators for the kernel source and GCC symlinks.
Remove the test dependencies as it's not a hard dependency.

Change the probe to print a message with some minimal logic, and verify
that the message was correctly constructed in the output.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/stap.py   | 35 +++++++++------------------
 meta/lib/oeqa/runtime/files/hello.stp |  1 -
 2 files changed, 11 insertions(+), 25 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/files/hello.stp

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/=
cases/stap.py
index 5342f6ac342..ac0125edb2b 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -5,33 +5,20 @@
 import os
=20
 from oeqa.runtime.case import OERuntimeTestCase
-from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
=20
 class StapTest(OERuntimeTestCase):
-
-    @classmethod
-    def setUp(cls):
-        src =3D os.path.join(cls.tc.runtime_files_dir, 'hello.stp')
-        dst =3D '/tmp/hello.stp'
-        cls.tc.target.copyTo(src, dst)
-
-    @classmethod
-    def tearDown(cls):
-        files =3D '/tmp/hello.stp'
-        cls.tc.target.run('rm %s' % files)
-
-    @skipIfNotFeature('tools-profile',
-                      'Test requires tools-profile to be in IMAGE_FEATUR=
ES')
-    @OETestDepends(['kernelmodule.KernelModuleTest.test_kernel_module'])
+    @skipIfNotFeature('tools-profile', 'Test requires tools-profile to b=
e in IMAGE_FEATURES')
     @OEHasPackage(['systemtap'])
+    @OEHasPackage(['gcc-symlinks'])
+    @OEHasPackage(['kernel-devsrc'])
     def test_stap(self):
-        cmds =3D [
-            'cd /usr/src/kernel && make scripts prepare',
-            'cd /lib/modules/`uname -r` && (if [ ! -e build ]; then ln -=
s /usr/src/kernel build; fi)',
-            'stap --disable-cache -DSTP_NO_VERREL_CHECK /tmp/hello.stp'
-            ]
-        for cmd in cmds:
-            status, output =3D self.target.run(cmd, 900)
-            self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+        cmd =3D 'make -C /usr/src/kernel scripts prepare'
+        status, output =3D self.target.run(cmd, 900)
+        self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+
+        cmd =3D 'stap -v --disable-cache -DSTP_NO_VERREL_CHECK -e \'prob=
e oneshot { print("Hello, "); println("world!") }\''
+        status, output =3D self.target.run(cmd, 900)
+        self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+        self.assertIn('Hello, world!', output, msg=3D'\n'.join([cmd, out=
put]))
diff --git a/meta/lib/oeqa/runtime/files/hello.stp b/meta/lib/oeqa/runtim=
e/files/hello.stp
deleted file mode 100644
index 36771471625..00000000000
--- a/meta/lib/oeqa/runtime/files/hello.stp
+++ /dev/null
@@ -1 +0,0 @@
-probe oneshot { println("hello world") }
--=20
2.25.1


