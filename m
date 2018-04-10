Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id D0C7A74852
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 01:01:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 18:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,429,1517904000"; d="scan'208";a="32994208"
Received: from pgsmsx112.gar.corp.intel.com ([10.108.55.201])
	by orsmga006.jf.intel.com with ESMTP; 09 Apr 2018 18:01:03 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX112.gar.corp.intel.com ([169.254.3.227]) with mapi id
	14.03.0319.002; Tue, 10 Apr 2018 09:01:02 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: runqemu: add tests for qemu
	boot and	shutdown
Thread-Index: AQHT0Gb17yaDNkMLVkCqlXuecyxOhqP5LcKg
Date: Tue, 10 Apr 2018 01:01:02 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E01824@PGSMSX109.gar.corp.intel.com>
References: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjAzYzc4YzMtMTU4Ni00M2U2LTk4ODMtOWY0Y2FiZjA3MzQxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjQ2NFRPYmpJM1wvMDhYekVcL21QdFA1MEFKWllpcEM1b2ZGYXpxU1ZqbFZWWT0ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH] oe-selftest: runqemu: add tests for qemu boot and	shutdown
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2018 01:01:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I added comment to that explain the need for a separate class, what the two=
 classes do and how they differ.

Please let me know if you have any inputs.=20

Thanks,
Ee Peng=20

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Yeoh Ee Peng
Sent: Tuesday, April 10, 2018 1:44 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] oe-selftest: runqemu: add tests for qemu boot an=
d shutdown

QA team were testing qemu boot image and shutdown on each qemu architecture=
 manually. Add automated test to test qemu boot on
ext4 and nfs, finally check that it can shutdown properly.

Original runqemu tests was dedicated for MACHINE=3Dqemux86-64 and it was te=
sting various live image (iso and hddimg) will be able to boot while live i=
mage was not supported on all qemu architecture.

The new tests were designed as a separate class as this tests focus on test=
ing qemu boot and shutdown on each qemu architecture.
Furthermore, this tests focus on testing qemu could shutdown as expected.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 61 +++++++++++++++++++++++++++++=
++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selfte=
st/cases/runqemu.py
index 47d41f5..7288ab2 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -3,9 +3,10 @@
 #
=20
 import re
-
+import tempfile
+import time
 from oeqa.selftest.case import OESelftestTestCase -from oeqa.utils.command=
s import bitbake, runqemu, get_bb_var
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
 from oeqa.core.decorator.oeid import OETestID
=20
 class RunqemuTests(OESelftestTestCase):
@@ -136,3 +137,59 @@ SYSLINUX_TIMEOUT =3D "10"
         cmd =3D "%s %s" % (self.cmd_common, rootfs)
         with runqemu(self.recipe, ssh=3DFalse, launch_cmd=3Dcmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+class QemuTest(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(QemuTest, cls).setUpClass()
+        cls.recipe =3D 'core-image-minimal'
+        cls.machine =3D  get_bb_var('MACHINE')
+        cls.deploy_dir_image =3D  get_bb_var('DEPLOY_DIR_IMAGE')
+        cls.cmd_common =3D "runqemu nographic"
+        cls.qemuboot_conf =3D "%s-%s.qemuboot.conf" % (cls.recipe, cls.mac=
hine)
+        cls.qemuboot_conf =3D os.path.join(cls.deploy_dir_image, cls.qemub=
oot_conf)
+        result =3D bitbake(cls.recipe)
+
+    def _start_qemu_shutdown_check_if_shutdown_succeeded(self, qemu, timeo=
ut):
+        status, output =3D qemu.run_serial("shutdown -h now")
+        qemu.runner.stop_thread()
+        print('DEBUG: shutdown and stop thread')
+        time_track =3D 0
+        while True:
+            is_alive =3D qemu.check()
+            if not is_alive:
+                return True
+            if time_track > timeout:
+                return False
+            time.sleep(1)
+            time_track +=3D 1
+            print(time_track)
+
+    def test_qemu_can_shutdown(self):
+        if not os.path.exists(self.qemuboot_conf):
+            self.skipTest("%s not found" % self.qemuboot_conf)
+        cmd =3D "%s %s" % (self.cmd_common, self.qemuboot_conf)
+        shutdown_timeout =3D 120
+        with runqemu(self.recipe, ssh=3DFalse, launch_cmd=3Dcmd) as qemu:
+            qemu_shutdown_succeeded =3D self._start_qemu_shutdown_check_if=
_shutdown_succeeded(qemu, shutdown_timeout)
+            self.assertTrue(qemu_shutdown_succeeded, 'Failed: qemu does=20
+ not shutdown within timeout(%s)' % shutdown_timeout)
+
+    def test_qemu_can_boot_nfs_and_shutdown(self):
+        bitbake('meta-ide-support')
+        rootfs_tar =3D "%s-%s.tar.bz2" % (self.recipe, self.machine)
+        rootfs_tar =3D os.path.join(self.deploy_dir_image, rootfs_tar)
+        if not os.path.exists(rootfs_tar):
+            self.skipTest("%s not found" % rootfs_tar)
+        tmpdir =3D tempfile.mkdtemp(prefix=3D'qemu_nfs')
+        tmpdir_nfs =3D os.path.join(tmpdir, 'nfs')
+        cmd_extract_nfs =3D 'runqemu-extract-sdk %s %s' % (rootfs_tar, tmp=
dir_nfs)
+        runCmd(cmd_extract_nfs)
+        if not os.path.exists(self.qemuboot_conf):
+            self.skipTest("%s not found" % self.qemuboot_conf)
+        cmd =3D "%s nfs %s %s" % (self.cmd_common, self.qemuboot_conf, tmp=
dir_nfs)
+        shutdown_timeout =3D 120
+        with runqemu(self.recipe, ssh=3DFalse, launch_cmd=3Dcmd) as qemu:
+            qemu_shutdown_succeeded =3D self._start_qemu_shutdown_check_if=
_shutdown_succeeded(qemu, shutdown_timeout)
+            self.assertTrue(qemu_shutdown_succeeded, 'Failed: qemu does no=
t shutdown within timeout(%s)' % shutdown_timeout)
+        runCmd('rm -rf %s' % tmpdir)
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

