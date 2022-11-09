Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D830DC41535
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1442.1668022305156005768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A0191FB;
	Wed,  9 Nov 2022 11:31:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01B363F703;
	Wed,  9 Nov 2022 11:31:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 04/15] oeqa/selftest/efibootpartition: improve test
Date: Wed,  9 Nov 2022 19:31:24 +0000
Message-Id: <20221109193135.291048-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173037

This test was overly complex with a setUp() method for a single test case=
,
which was marked as a class function for no good reason.

Generalise the test so that it has the possibility of working on more
machines in the future, add a decorator so that it only runs on
qemux86-64, and respect QEMU_USE_KVM to speed up test execution.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../oeqa/selftest/cases/efibootpartition.py   | 41 +++++++------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/=
oeqa/selftest/cases/efibootpartition.py
index 26de3a07c9e..e17da9f9a09 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -5,42 +5,29 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import re
-
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var
+from oeqa.utils.commands import bitbake, runqemu
+from oeqa.core.decorator.data import skipIfNotMachine
+import oe.types
=20
 class GenericEFITest(OESelftestTestCase):
     """EFI booting test class"""
+    @skipIfNotMachine("qemux86-64", "test is qemux86-64 specific current=
ly")
+    def test_boot_efi(self):
+        cmd =3D "runqemu nographic serial wic ovmf"
+        if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td["TARGE=
T_ARCH"]):
+            cmd +=3D " kvm"
+        image =3D "core-image-minimal"
=20
-    cmd_common =3D "runqemu nographic serial wic ovmf"
-    efi_provider =3D "systemd-boot"
-    image =3D "core-image-minimal"
-    machine =3D "qemux86-64"
-    recipes_built =3D False
-
-    @classmethod
-    def setUpLocal(self):
-        super(GenericEFITest, self).setUpLocal(self)
-
-        self.write_config(self,
-"""
-EFI_PROVIDER =3D "%s"
+        self.write_config("""
+EFI_PROVIDER =3D "systemd-boot"
 IMAGE_FSTYPES:pn-%s:append =3D " wic"
-MACHINE =3D "%s"
 MACHINE_FEATURES:append =3D " efi"
 WKS_FILE =3D "efi-bootdisk.wks.in"
 IMAGE_INSTALL:append =3D " grub-efi systemd-boot kernel-image-bzimage"
 """
-% (self.efi_provider, self.image, self.machine))
-        if not self.recipes_built:
-            bitbake("ovmf")
-            bitbake(self.image)
-            self.recipes_built =3D True
+% (image))
=20
-    @classmethod
-    def test_boot_efi(self):
-        """Test generic boot partition with qemu"""
-        cmd =3D "%s %s" % (self.cmd_common, self.machine)
-        with runqemu(self.image, ssh=3DFalse, launch_cmd=3Dcmd) as qemu:
+        bitbake(image + " ovmf")
+        with runqemu(image, ssh=3DFalse, launch_cmd=3Dcmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
--=20
2.34.1


