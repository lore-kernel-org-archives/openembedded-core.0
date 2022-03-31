Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AB3C4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.705.1648751366521100656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DBEA13D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E286A3F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/23] oeqa: rationalise skipifqemu decorators
Date: Thu, 31 Mar 2022 19:29:09 +0100
Message-Id: <20220331182915.22128-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163858

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/decorator/data.py          | 44 ++++---------------
 meta/lib/oeqa/runtime/cases/boot.py           |  2 +-
 .../oeqa/runtime/cases/ethernet_ip_connman.py |  3 +-
 meta/lib/oeqa/runtime/cases/ltp_stress.py     |  3 +-
 meta/lib/oeqa/runtime/cases/storage.py        | 16 +++----
 meta/lib/oeqa/runtime/cases/suspend.py        |  2 +-
 meta/lib/oeqa/runtime/cases/usb_hid.py        |  2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  4 +-
 8 files changed, 25 insertions(+), 51 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/de=
corator/data.py
index 12197be246e..3ce10e54999 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -27,17 +27,6 @@ def has_machine(td, machine):
         return True
     return False
=20
-def is_qemu(td, qemu):
-    """
-        Checks if MACHINE is qemu.
-    """
-
-    machine =3D td.get('MACHINE', '')
-    if (qemu in td.get('MACHINE', '') or
-    machine.startswith('qemu')):
-        return True
-    return False
-
 @registerDecorator
 class skipIfDataVar(OETestDecorator):
     """
@@ -189,34 +178,19 @@ class skipIfMachine(OETestDecorator):
 @registerDecorator
 class skipIfNotQemu(OETestDecorator):
     """
-        Skip test based on MACHINE.
-
-        value must be a qemu MACHINE or it will skip the test
-        with msg as the reason.
+    Skip test if MACHINE is not qemu*
     """
-
-    attrs =3D ('value', 'msg')
-
     def setUpDecorator(self):
-        msg =3D ('Checking if %s is not this MACHINE' % self.value)
-        self.logger.debug(msg)
-        if not is_qemu(self.case.td, self.value):
-            self.case.skipTest(self.msg)
+        self.logger.debug("Checking if not qemu MACHINE")
+        if not self.case.td.get('MACHINE', '').startswith('qemu'):
+            self.case.skipTest('Test only runs on qemu machines')
=20
 @registerDecorator
 class skipIfQemu(OETestDecorator):
     """
-        Skip test based on Qemu Machine.
-
-        value must not be a qemu machine or it will skip the test
-        with msg as the reason.
-   """
-
-    attrs =3D ('value', 'msg')
-
+    Skip test if MACHINE is qemu*
+    """
     def setUpDecorator(self):
-        msg =3D ('Checking if %s is this MACHINE' % self.value)
-        self.logger.debug(msg)
-        if is_qemu(self.case.td, self.value):
-             self.case.skipTest(self.msg)
-
+        self.logger.debug("Checking if qemu MACHINE")
+        if self.case.td.get('MACHINE', '').startswith('qemu'):
+             self.case.skipTest('Test only runs on real hardware')
diff --git a/meta/lib/oeqa/runtime/cases/boot.py b/meta/lib/oeqa/runtime/=
cases/boot.py
index 2142f400a05..e1ad88a1744 100644
--- a/meta/lib/oeqa/runtime/cases/boot.py
+++ b/meta/lib/oeqa/runtime/cases/boot.py
@@ -13,7 +13,7 @@ from oeqa.core.decorator.data import skipIfQemu
 class BootTest(OERuntimeTestCase):
=20
     @OETimeout(120)
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_reboot(self):
         output =3D ''
diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/li=
b/oeqa/runtime/cases/ethernet_ip_connman.py
index e0106128389..b93ee299415 100644
--- a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -11,7 +11,7 @@ class Ethernet_Test(OERuntimeTestCase):
         x =3D '.'.join(x)
         return x
    =20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')   =20
+    @skipIfQemu()
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_set_virtual_ip(self):
         (status, output) =3D self.target.run("ifconfig eth0 | grep 'inet=
 ' | awk '{print $2}'")
@@ -22,6 +22,7 @@ class Ethernet_Test(OERuntimeTestCase):
         (status, output) =3D self.target.run("ifconfig eth0:1 %s netmask=
 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 down" % (vir=
tual_ip,virtual_ip))
         self.assertEqual(status, 0, msg=3D'Failed to create virtual ip a=
ddress, output: %s' % output)
        =20
+    @skipIfQemu()
     @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_=
ip']) =20
     def test_get_ip_from_dhcp(self):=20
         (status, output) =3D self.target.run("connmanctl services | grep=
 -E '*AO Wired|*AR Wired' | awk '{print $3}'")
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/ru=
ntime/cases/ltp_stress.py
index 2445ffbc939..ce6f4bf59d3 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -89,8 +89,7 @@ class LtpStressTest(LtpStressBase):
=20
     # LTP stress runtime tests
     #
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
-
+    @skipIfQemu()
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["ltp"])
     def test_ltp_stress(self):
diff --git a/meta/lib/oeqa/runtime/cases/storage.py b/meta/lib/oeqa/runti=
me/cases/storage.py
index 166d26b252b..972ef8210c0 100644
--- a/meta/lib/oeqa/runtime/cases/storage.py
+++ b/meta/lib/oeqa/runtime/cases/storage.py
@@ -91,24 +91,24 @@ class UsbTest(StorageBase):
         self.test_file =3D "usb.tst"
         self.test_dir =3D os.path.join(self.mount_point, "oeqa")
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_usb_mount(self):
         self.storage_umount(2)
         self.storage_mount(5)
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['storage.UsbTest.test_usb_mount'])
     def test_usb_basic_operations(self):
         self.storage_basic()
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['storage.UsbTest.test_usb_basic_operations'])
     def test_usb_basic_rw(self):
         self.storage_write()
         self.storage_read()
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['storage.UsbTest.test_usb_mount'])
     def test_usb_umount(self):
         self.storage_umount(2)
@@ -126,24 +126,24 @@ class MMCTest(StorageBase):
         self.test_file =3D "mmc.tst"
         self.test_dir =3D os.path.join(self.mount_point, "oeqa")
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_mmc_mount(self):
         self.storage_umount(2)
         self.storage_mount()
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['storage.MMCTest.test_mmc_mount'])
     def test_mmc_basic_operations(self):
         self.storage_basic()
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['storage.MMCTest.test_mmc_basic_operations'])
     def test_mmc_basic_rw(self):
         self.storage_write()
         self.storage_read()
=20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['storage.MMCTest.test_mmc_mount'])
     def test_mmc_umount(self):
         self.storage_umount(2)
diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runti=
me/cases/suspend.py
index 67b6f7e56fa..0382d48f458 100644
--- a/meta/lib/oeqa/runtime/cases/suspend.py
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -23,7 +23,7 @@ class Suspend_Test(OERuntimeTestCase):
         (status, output) =3D self.target.run('sudo rtcwake -m mem -s 10'=
)
         self.assertEqual(status, 0,  msg =3D 'Failed to suspends your sy=
stem to RAM, output : %s' % output)
    =20
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_suspend(self):
         self.test_date()
diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runti=
me/cases/usb_hid.py
index 3c292cf661c..8743174370d 100644
--- a/meta/lib/oeqa/runtime/cases/usb_hid.py
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -14,7 +14,7 @@ class USB_HID_Test(OERuntimeTestCase):
         return self.assertEqual(status, 0,  msg =3D 'Failed to suspends =
your system to RAM, output : %s' % output)
    =20
     @OEHasPackage(['xdotool'])
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @skipIfQemu()
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_USB_Hid_input(self):
         self.keyboard_mouse_simulation()
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa=
/selftest/cases/runtime_test.py
index 7b7371b6e07..2ad89490fcf 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -281,7 +281,7 @@ class Postinst(OESelftestTestCase):
=20
=20
=20
-    @skipIfNotQemu('qemuall', 'Test only runs in qemu')
+    @skipIfNotQemu()
     def test_postinst_rootfs_and_boot_sysvinit(self):
         """
         Summary:        The purpose of this test case is to verify Post-=
installation
@@ -302,7 +302,7 @@ class Postinst(OESelftestTestCase):
         self.init_manager_loop("sysvinit")
=20
=20
-    @skipIfNotQemu('qemuall', 'Test only runs in qemu')
+    @skipIfNotQemu()
     def test_postinst_rootfs_and_boot_systemd(self):
         """
         Summary:        The purpose of this test case is to verify Post-=
installation
--=20
2.25.1


