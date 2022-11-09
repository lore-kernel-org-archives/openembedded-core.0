Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE079C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1536.1668022309658165463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E5CDD6E;
	Wed,  9 Nov 2022 11:31:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6853F703;
	Wed,  9 Nov 2022 11:31:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 10/15] oeqa/selftest/package: improve test_preserve_ownership
Date: Wed,  9 Nov 2022 19:31:30 +0000
Message-Id: <20221109193135.291048-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173043

This test was failing very oddly in qemuarm64 runs. Rewriting the test
to be clearer and less fragile fixed it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/package.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/self=
test/cases/package.py
index 482a7c02ad4..4f7cd10658a 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -153,25 +153,25 @@ class PackageTests(OESelftestTestCase):
                     self.fail('GDB %s failed' % binary)
=20
     def test_preserve_ownership(self):
-        import os, stat, oe.cachedpath
         features =3D 'IMAGE_INSTALL:append =3D " selftest-chown"\n'
         self.write_config(features)
         bitbake("core-image-minimal")
=20
-        sysconfdir =3D get_bb_var('sysconfdir', 'selftest-chown')
-        def check_ownership(qemu, gid, uid, path):
+        def check_ownership(qemu, expected_gid, expected_uid, path):
             self.logger.info("Check ownership of %s", path)
-            status, output =3D qemu.run_serial(r'/bin/stat -c "%U %G" ' =
+ path, timeout=3D60)
-            output =3D output.split(" ")
-            if output[0] !=3D uid or output[1] !=3D gid :
-                self.logger.error("Incrrect ownership %s [%s:%s]", path,=
 output[0], output[1])
-                return False
-            return True
+            status, output =3D qemu.run_serial('stat -c "%U %G" ' + path=
)
+            self.assertEqual(status, 1, "stat failed: " + output)
+            try:
+                uid, gid =3D output.split()
+                self.assertEqual(uid, expected_uid)
+                self.assertEqual(gid, expected_gid)
+            except ValueError:
+                self.fail("Cannot parse output: " + output)
=20
+        sysconfdir =3D get_bb_var('sysconfdir', 'selftest-chown')
         with runqemu('core-image-minimal') as qemu:
             for path in [ sysconfdir + "/selftest-chown/file",
                           sysconfdir + "/selftest-chown/dir",
                           sysconfdir + "/selftest-chown/symlink",
                           sysconfdir + "/selftest-chown/fifotest/fifo"]:
-                if not check_ownership(qemu, "test", "test", path):
-                    self.fail('Test ownership %s failed' % path)
+                check_ownership(qemu, "test", "test", path)
--=20
2.34.1


