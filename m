Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD28C4167B
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1511.1668022310393784215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A8E1FB;
	Wed,  9 Nov 2022 11:31:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96E6F3F703;
	Wed,  9 Nov 2022 11:31:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 11/15] oeqa/selftest/runqemu: don't hardcode qemux86-64
Date: Wed,  9 Nov 2022 19:31:31 +0000
Message-Id: <20221109193135.291048-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173044

Don't hardcode qemux86-64. This has some complications: the
IMAGE_FSTYPES needs to be constructed to reflect what the machine can
do (only x86 machines can build ISO images), and several tests which need
a wic file are currently limited to qemux86-64.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 26 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/self=
test/cases/runqemu.py
index c1d277a095a..58a4526df64 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -9,6 +9,7 @@ import tempfile
 import time
 import oe.types
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotArch, skipIfNotMachine
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
=20
@@ -22,23 +23,25 @@ class RunqemuTests(OESelftestTestCase):
     def setUpLocal(self):
         super(RunqemuTests, self).setUpLocal()
         self.recipe =3D 'core-image-minimal'
-        self.machine =3D  'qemux86-64'
-        self.fstypes =3D "ext4 iso hddimg wic.vmdk wic.qcow2 wic.vdi"
-        self.cmd_common =3D "runqemu nographic"
+        self.machine =3D  self.td['MACHINE']
+
+        self.fstypes =3D "ext4"
+        if self.td["HOST_ARCH"] in ('i586', 'i686', 'x86_64'):
+            self.fstypes +=3D " iso hddimg"
+        if self.machine =3D=3D "qemux86-64":
+            self.fstypes +=3D " wic.vmdk wic.qcow2 wic.vdi"
=20
-        kvm =3D oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), 'x86_6=
4')
+        self.cmd_common =3D "runqemu nographic"
+        kvm =3D oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.t=
d["TARGET_ARCH"])
         if kvm:
             self.cmd_common +=3D " kvm"
=20
         self.write_config(
 """
-MACHINE =3D "%s"
 IMAGE_FSTYPES =3D "%s"
 # 10 means 1 second
 SYSLINUX_TIMEOUT =3D "10"
-"""
-% (self.machine, self.fstypes)
-        )
+""" % self.fstypes)
=20
         if not RunqemuTests.image_is_ready:
             RunqemuTests.deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMA=
GE')
@@ -59,6 +62,7 @@ SYSLINUX_TIMEOUT =3D "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn('rootfs.ext4', f.read(), "Failed: %s" % cm=
d)
=20
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_boot_machine_iso(self):
         """Test runqemu machine iso"""
         cmd =3D "%s %s iso" % (self.cmd_common, self.machine)
@@ -73,7 +77,8 @@ SYSLINUX_TIMEOUT =3D "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (=
cmd, f.read()))
=20
-
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14963
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
     def test_boot_recipe_image_vmdk(self):
         """Test runqemu recipe-image vmdk"""
         cmd =3D "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
@@ -81,6 +86,7 @@ SYSLINUX_TIMEOUT =3D "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn('format=3Dvmdk', f.read(), "Failed: %s" % =
cmd)
=20
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
     def test_boot_recipe_image_vdi(self):
         """Test runqemu recipe-image vdi"""
         cmd =3D "%s %s wic.vdi" % (self.cmd_common, self.recipe)
@@ -96,6 +102,7 @@ SYSLINUX_TIMEOUT =3D "10"
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (=
cmd, f.read()))
=20
=20
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_boot_deploy_hddimg(self):
         """Test runqemu deploy_dir_image hddimg"""
         cmd =3D "%s %s hddimg" % (self.cmd_common, self.deploy_dir_image=
)
@@ -110,6 +117,7 @@ SYSLINUX_TIMEOUT =3D "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn(' -netdev user', f.read(), "Failed: %s" % =
cmd)
=20
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
     def test_boot_machine_slirp_qcow2(self):
         """Test runqemu machine slirp qcow2"""
         cmd =3D "%s slirp wic.qcow2 %s" % (self.cmd_common, self.machine=
)
--=20
2.34.1


