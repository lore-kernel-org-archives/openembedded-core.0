Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E552E674AC
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 07:27:33 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.32098.1730446051268009174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 00:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: vince_chang@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 1 Nov
 2024 15:27:27 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 1 Nov 2024 15:27:27 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1] selftest: wic: remove 2>/dev/null to help fail diagnostic
Date: Fri, 1 Nov 2024 15:27:27 +0800
Message-ID: <20241101072727.712487-1-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 07:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206602

The wic test case previously used '2>/dev/null' to suppress error
messages. This commit updates the code to use 'stderr=3Dsubprocess.PIPE'
when calling runCmd().

Refer:
https://lists.openembedded.org/g/openembedded-core/topic/109308684

Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 44 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index c96018abbb..fa7e4aae8c 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -12,6 +12,7 @@ import os
 import sys
 import unittest
 import hashlib
+import subprocess
=20
 from glob import glob
 from shutil import rmtree, copy
@@ -457,7 +458,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=3De=
xt4 --exclude-path bin/ --r
             wicimg =3D wicout[0]
=20
             # verify partition size with wic
-            res =3D runCmd("parted -m %s unit b p 2>/dev/null" % wicimg)
+            res =3D runCmd("parted -m %s unit b p" % wicimg, stderr=3Dsubp=
rocess.PIPE)
=20
             # parse parted output which looks like this:
             # BYT;\n
@@ -478,16 +479,16 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=
=3Dext4 --exclude-path bin/ --r
=20
             # Test partition 1, should contain the normal root directories=
, except
             # /usr.
-            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
-                             os.path.join(self.resultdir, "selftest_img.pa=
rt1"))
+            res =3D runCmd("debugfs -R 'ls -p' %s" % \
+                             os.path.join(self.resultdir, "selftest_img.pa=
rt1"), stderr=3Dsubprocess.PIPE)
             files =3D extract_files(res.output)
             self.assertIn("etc", files)
             self.assertNotIn("usr", files)
=20
             # Partition 2, should contain common directories for /usr, not=
 root
             # directories.
-            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
-                             os.path.join(self.resultdir, "selftest_img.pa=
rt2"))
+            res =3D runCmd("debugfs -R 'ls -p' %s" % \
+                             os.path.join(self.resultdir, "selftest_img.pa=
rt2"), stderr=3Dsubprocess.PIPE)
             files =3D extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
@@ -495,15 +496,15 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=
=3Dext4 --exclude-path bin/ --r
=20
             # Partition 3, should contain the same as partition 2, includi=
ng the bin
             # directory, but not the files inside it.
-            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
-                             os.path.join(self.resultdir, "selftest_img.pa=
rt3"))
+            res =3D runCmd("debugfs -R 'ls -p' %s" % \
+                             os.path.join(self.resultdir, "selftest_img.pa=
rt3"), stderr=3Dsubprocess.PIPE)
             files =3D extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
             self.assertIn("share", files)
             self.assertIn("bin", files)
-            res =3D runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % \
-                             os.path.join(self.resultdir, "selftest_img.pa=
rt3"))
+            res =3D runCmd("debugfs -R 'ls -p bin' %s" % \
+                             os.path.join(self.resultdir, "selftest_img.pa=
rt3"), stderr=3Dsubprocess.PIPE)
             files =3D extract_files(res.output)
             self.assertIn(".", files)
             self.assertIn("..", files)
@@ -541,13 +542,13 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=
=3Dext4 --include-path %s"""
             part2 =3D glob(os.path.join(self.resultdir, 'temp-*.direct.p2'=
))[0]
=20
             # Test partition 1, should not contain 'test-file'
-            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            res =3D runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=3Dsub=
process.PIPE)
             files =3D extract_files(res.output)
             self.assertNotIn('test-file', files)
             self.assertEqual(True, files_own_by_root(res.output))
=20
             # Test partition 2, should contain 'test-file'
-            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part2))
+            res =3D runCmd("debugfs -R 'ls -p' %s" % (part2), stderr=3Dsub=
process.PIPE)
             files =3D extract_files(res.output)
             self.assertIn('test-file', files)
             self.assertEqual(True, files_own_by_root(res.output))
@@ -576,12 +577,12 @@ part / --source rootfs  --fstype=3Dext4 --include-pat=
h %s --include-path core-imag
=20
             part1 =3D glob(os.path.join(self.resultdir, 'temp-*.direct.p1'=
))[0]
=20
-            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            res =3D runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=3Dsub=
process.PIPE)
             files =3D extract_files(res.output)
             self.assertIn('test-file', files)
             self.assertEqual(True, files_own_by_root(res.output))
=20
-            res =3D runCmd("debugfs -R 'ls -p /export/etc/' %s 2>/dev/null=
" % (part1))
+            res =3D runCmd("debugfs -R 'ls -p /export/etc/' %s" % (part1),=
 stderr=3Dsubprocess.PIPE)
             files =3D extract_files(res.output)
             self.assertIn('passwd', files)
             self.assertEqual(True, files_own_by_root(res.output))
@@ -668,7 +669,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-dire=
ctory=3Detc
                                        % (wks_file, self.resultdir))
=20
                 for part in glob(os.path.join(self.resultdir, 'temp-*.dire=
ct.p*')):
-                    res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (=
part))
+                    res =3D runCmd("debugfs -R 'ls -p' %s" % (part), stder=
r=3Dsubprocess.PIPE)
                     self.assertEqual(True, files_own_by_root(res.output))
=20
                 config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D "%s"\n'=
 % wks_file
@@ -678,7 +679,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-dire=
ctory=3Detc
=20
                 # check each partition for permission
                 for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*'))=
:
-                    res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (=
part))
+                    res =3D runCmd("debugfs -R 'ls -p' %s" % (part), stder=
r=3Dsubprocess.PIPE)
                     self.assertTrue(files_own_by_root(res.output)
                         ,msg=3D'Files permission incorrect using wks set "=
%s"' % test)
=20
@@ -706,7 +707,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-dire=
ctory=3Detc
=20
             part1 =3D glob(os.path.join(self.resultdir, 'temp-*.direct.p1'=
))[0]
=20
-            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            res =3D runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=3Dsub=
process.PIPE)
             files =3D extract_files(res.output)
             self.assertIn('passwd', files)
=20
@@ -741,7 +742,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-dire=
ctory=3Detc
         bitbake('base-files -c do_install')
         bf_fstab =3D os.path.join(get_bb_var('D', 'base-files'), 'etc', 'f=
stab')
         self.assertEqual(True, os.path.exists(bf_fstab))
-        bf_fstab_md5sum =3D runCmd('md5sum %s 2>/dev/null' % bf_fstab).out=
put.split(" ")[0]
+        bf_fstab_md5sum =3D runCmd('md5sum %s ' % bf_fstab).output.split("=
 ")[0]
=20
         try:
             no_fstab_update_path =3D os.path.join(self.resultdir, 'test-no=
-fstab-update')
@@ -757,7 +758,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-dire=
ctory=3Detc
             part_fstab_md5sum =3D []
             for i in range(1, 3):
                 part =3D glob(os.path.join(self.resultdir, 'temp-*.direct.=
p') + str(i))[0]
-                part_fstab =3D runCmd("debugfs -R 'cat etc/fstab' %s 2>/de=
v/null" % (part))
+                part_fstab =3D runCmd("debugfs -R 'cat etc/fstab' %s" % (p=
art), stderr=3Dsubprocess.PIPE)
                 part_fstab_md5sum.append(hashlib.md5((part_fstab.output + =
"\n\n").encode('utf-8')).hexdigest())
=20
             # '/etc/fstab' in partition 2 should contain the same stock fs=
tab file
@@ -874,7 +875,8 @@ bootloader --ptable gpt""")
         self.logger.info("result: %s \n" % result.output)
=20
         # verify partition size with wic
-        res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s unit =
b p 2>/dev/null" % (wic_sector_size, images[0]))
+        res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s unit =
b p" % (wic_sector_size, images[0]),
+                     stderr=3Dsubprocess.PIPE)
=20
         self.logger.info("res: %s \n" % res.output)
         # parse parted output which looks like this:
@@ -1052,8 +1054,8 @@ class Wic2(WicTestCase):
             native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-to=
ols")
=20
         # verify partition size with wic
-        res =3D runCmd("parted -m %s unit kib p 2>/dev/null" % wicimg,
-                     native_sysroot=3Dnative_sysroot)
+        res =3D runCmd("parted -m %s unit kib p" % wicimg,
+                     native_sysroot=3Dnative_sysroot, stderr=3Dsubprocess.=
PIPE)
=20
         # parse parted output which looks like this:
         # BYT;\n
--=20
2.25.1


