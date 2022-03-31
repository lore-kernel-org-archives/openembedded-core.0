Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45FFC43219
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.709.1648751368182288285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBC1E13D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DC923F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/23] oeqa/selftest/wic: rearrange tests
Date: Thu, 31 Mar 2022 19:29:12 +0100
Message-Id: <20220331182915.22128-20-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163861

Split the tests into further classes: one which exercises the CLI and
doesn't need to build images at all, and another which is just the
tests that manipulate existing images.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 154 ++++++++++++++--------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 6da70b8c287..c2496486bc2 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -104,8 +104,7 @@ class WicTestCase(OESelftestTestCase):
             WicTestCase.wicenv_cache[image] =3D os.path.join(stdir, mach=
ine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
=20
-class Wic(WicTestCase):
-
+class CLITests(OESelftestTestCase):
     def test_version(self):
         """Test wic --version"""
         runCmd('wic --version')
@@ -166,6 +165,7 @@ class Wic(WicTestCase):
         """Test wic without command"""
         self.assertEqual(1, runCmd('wic', ignore_status=3DTrue).status)
=20
+class Wic(WicTestCase):
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=3Dcore-image-minimal=
"""
         cmd =3D "wic create wictestdisk --image-name=3Dcore-image-minima=
l -o %s" % self.resultdir
@@ -1271,6 +1271,81 @@ class Wic2(WicTestCase):
                 self.assertEqual(dest_stat.st_blocks, 8)
             os.unlink(dest)
=20
+    def test_mkfs_extraopts(self):
+        """Test wks option --mkfs-extraopts for empty and not empty part=
itions"""
+        img =3D 'core-image-minimal'
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.writelines(
+                ['part ext2   --fstype ext2     --source rootfs --mkfs-e=
xtraopts "-D -F -i 8192"\n',
+                 "part btrfs  --fstype btrfs    --source rootfs --size 4=
0M --mkfs-extraopts=3D'--quiet'\n",
+                 'part squash --fstype squashfs --source rootfs --mkfs-e=
xtraopts "-no-sparse -b 4096"\n',
+                 'part emptyvfat   --fstype vfat   --size 1M --mkfs-extr=
aopts "-S 1024 -s 64"\n',
+                 'part emptymsdos  --fstype msdos  --size 1M --mkfs-extr=
aopts "-S 1024 -s 64"\n',
+                 'part emptyext2   --fstype ext2   --size 1M --mkfs-extr=
aopts "-D -F -i 8192"\n',
+                 'part emptybtrfs  --fstype btrfs  --size 100M --mkfs-ex=
traopts "--mixed -K"\n'])
+            wks.flush()
+            cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
+            runCmd(cmd)
+            wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
+            out =3D glob(self.resultdir + "%s-*direct" % wksname)
+            self.assertEqual(1, len(out))
+
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
+    def test_expand_mbr_image(self):
+        """Test wic write --expand command for mbr image"""
+        # build an image
+        config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "directdisk.wk=
s"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+
+        # get path to the image
+        bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
+        deploy_dir =3D bb_vars['DEPLOY_DIR_IMAGE']
+        machine =3D bb_vars['MACHINE']
+        image_path =3D os.path.join(deploy_dir, 'core-image-minimal-%s.w=
ic' % machine)
+
+        self.remove_config(config)
+
+        try:
+            # expand image to 1G
+            new_image_path =3D None
+            with NamedTemporaryFile(mode=3D'wb', suffix=3D'.wic.exp',
+                                    dir=3Ddeploy_dir, delete=3DFalse) as=
 sparse:
+                sparse.truncate(1024 ** 3)
+                new_image_path =3D sparse.name
+
+            sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+            cmd =3D "wic write -n %s --expand 1:0 %s %s" % (sysroot, ima=
ge_path, new_image_path)
+            runCmd(cmd)
+
+            # check if partitions are expanded
+            orig =3D runCmd("wic ls %s -n %s" % (image_path, sysroot))
+            exp =3D runCmd("wic ls %s -n %s" % (new_image_path, sysroot)=
)
+            orig_sizes =3D [int(line.split()[3]) for line in orig.output=
.split('\n')[1:]]
+            exp_sizes =3D [int(line.split()[3]) for line in exp.output.s=
plit('\n')[1:]]
+            self.assertEqual(orig_sizes[0], exp_sizes[0]) # first partit=
ion is not resized
+            self.assertTrue(orig_sizes[1] < exp_sizes[1])
+
+            # Check if all free space is partitioned
+            result =3D runCmd("%s/usr/sbin/sfdisk -F %s" % (sysroot, new=
_image_path))
+            self.assertTrue("0 B, 0 bytes, 0 sectors" in result.output)
+
+            os.rename(image_path, image_path + '.bak')
+            os.rename(new_image_path, image_path)
+
+            # Check if it boots in qemu
+            with runqemu('core-image-minimal', ssh=3DFalse, runqemuparam=
s=3D'nographic') as qemu:
+                cmd =3D "ls /etc/"
+                status, output =3D qemu.run_serial('true')
+                self.assertEqual(1, status, 'Failed to run command "%s":=
 %s' % (cmd, output))
+        finally:
+            if os.path.exists(new_image_path):
+                os.unlink(new_image_path)
+            if os.path.exists(image_path + '.bak'):
+                os.rename(image_path + '.bak', image_path)
+
+class ModifyTests(WicTestCase):
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
         runCmd("wic create wictestdisk "
@@ -1363,81 +1438,6 @@ class Wic2(WicTestCase):
         self.assertNotIn('\n%s        ' % kerneltype.upper(), result.out=
put)
         self.assertNotIn('\nEFI          <DIR>     ', result.output)
=20
-    def test_mkfs_extraopts(self):
-        """Test wks option --mkfs-extraopts for empty and not empty part=
itions"""
-        img =3D 'core-image-minimal'
-        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
-            wks.writelines(
-                ['part ext2   --fstype ext2     --source rootfs --mkfs-e=
xtraopts "-D -F -i 8192"\n',
-                 "part btrfs  --fstype btrfs    --source rootfs --size 4=
0M --mkfs-extraopts=3D'--quiet'\n",
-                 'part squash --fstype squashfs --source rootfs --mkfs-e=
xtraopts "-no-sparse -b 4096"\n',
-                 'part emptyvfat   --fstype vfat   --size 1M --mkfs-extr=
aopts "-S 1024 -s 64"\n',
-                 'part emptymsdos  --fstype msdos  --size 1M --mkfs-extr=
aopts "-S 1024 -s 64"\n',
-                 'part emptyext2   --fstype ext2   --size 1M --mkfs-extr=
aopts "-D -F -i 8192"\n',
-                 'part emptybtrfs  --fstype btrfs  --size 100M --mkfs-ex=
traopts "--mixed -K"\n'])
-            wks.flush()
-            cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.r=
esultdir)
-            runCmd(cmd)
-            wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
-            out =3D glob(self.resultdir + "%s-*direct" % wksname)
-            self.assertEqual(1, len(out))
-
-    @only_for_arch(['i586', 'i686', 'x86_64'])
-    @OETestTag("runqemu")
-    def test_expand_mbr_image(self):
-        """Test wic write --expand command for mbr image"""
-        # build an image
-        config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "directdisk.wk=
s"\n'
-        self.append_config(config)
-        bitbake('core-image-minimal')
-
-        # get path to the image
-        bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
-        deploy_dir =3D bb_vars['DEPLOY_DIR_IMAGE']
-        machine =3D bb_vars['MACHINE']
-        image_path =3D os.path.join(deploy_dir, 'core-image-minimal-%s.w=
ic' % machine)
-
-        self.remove_config(config)
-
-        try:
-            # expand image to 1G
-            new_image_path =3D None
-            with NamedTemporaryFile(mode=3D'wb', suffix=3D'.wic.exp',
-                                    dir=3Ddeploy_dir, delete=3DFalse) as=
 sparse:
-                sparse.truncate(1024 ** 3)
-                new_image_path =3D sparse.name
-
-            sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
-            cmd =3D "wic write -n %s --expand 1:0 %s %s" % (sysroot, ima=
ge_path, new_image_path)
-            runCmd(cmd)
-
-            # check if partitions are expanded
-            orig =3D runCmd("wic ls %s -n %s" % (image_path, sysroot))
-            exp =3D runCmd("wic ls %s -n %s" % (new_image_path, sysroot)=
)
-            orig_sizes =3D [int(line.split()[3]) for line in orig.output=
.split('\n')[1:]]
-            exp_sizes =3D [int(line.split()[3]) for line in exp.output.s=
plit('\n')[1:]]
-            self.assertEqual(orig_sizes[0], exp_sizes[0]) # first partit=
ion is not resized
-            self.assertTrue(orig_sizes[1] < exp_sizes[1])
-
-            # Check if all free space is partitioned
-            result =3D runCmd("%s/usr/sbin/sfdisk -F %s" % (sysroot, new=
_image_path))
-            self.assertTrue("0 B, 0 bytes, 0 sectors" in result.output)
-
-            os.rename(image_path, image_path + '.bak')
-            os.rename(new_image_path, image_path)
-
-            # Check if it boots in qemu
-            with runqemu('core-image-minimal', ssh=3DFalse, runqemuparam=
s=3D'nographic') as qemu:
-                cmd =3D "ls /etc/"
-                status, output =3D qemu.run_serial('true')
-                self.assertEqual(1, status, 'Failed to run command "%s":=
 %s' % (cmd, output))
-        finally:
-            if os.path.exists(new_image_path):
-                os.unlink(new_image_path)
-            if os.path.exists(image_path + '.bak'):
-                os.rename(image_path + '.bak', image_path)
-
-
     def test_wic_ls_ext(self):
         """Test listing content of the ext partition using 'wic ls'"""
         runCmd("wic create wictestdisk "
--=20
2.25.1


