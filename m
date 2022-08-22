Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11F4C32774
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 15:20:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.19406.1661181595892424664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 08:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC3F1424;
	Mon, 22 Aug 2022 08:19:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C08D3F70D;
	Mon, 22 Aug 2022 08:19:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] oeqa/selftest: rewrite gdbserver test
Date: Mon, 22 Aug 2022 16:19:50 +0100
Message-Id: <20220822151950.2611880-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822151950.2611880-1-ross.burton@arm.com>
References: <20220822151950.2611880-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 15:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169678

The gdbserver test case didn't actually work and doesn't follow the
documentation for how to use gdbserver in Yocto.  Rewrite the test case
to follow the documented process so if that breaks then we're aware.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 169 +++++++---------------
 1 file changed, 55 insertions(+), 114 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/se=
lftest/cases/gdbserver.py
index 3124902543c..3621d9c13eb 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -4,122 +4,63 @@
 # SPDX-License-Identifier: MIT
 #
 import os
-from subprocess import Popen, PIPE
-import threading
 import time
+import tempfile
+import shutil
+import concurrent.futures
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqem=
u , runCmd
-from oeqa.core.exception import OEQATimeoutError
-
-
-#The test runs gdbserver on qemu and connects the gdb client from host o=
ver TCP.
-#
-#It builds a cross gdb on the host and compiles the program to be debugg=
ed on the target,
-#launches the gdbserver and tries to connect cross gdb to it.
-
-
-class GdbTest(OESelftestTestCase):
-
-    def run_gdb(self, native_sysroot=3DNone, **options):
-        # Add path to cross gdb to environment.
-        extra_paths =3D "%s/usr/bin/%s" % (self.recipe_sysroot_native, s=
elf.target_sys)
-        nenv =3D dict(options.get('env', os.environ))
-        nenv['PATH'] =3D extra_paths + ':' + nenv.get('PATH', '')
-        options['env'] =3D nenv
-
-        for count in range(5):
-            # Let the gdb server start before by putting client thread t=
o sleep.
-            # Still, if gdb client happens to start before gdbserver, if=
 will
-            # return "gdb connection timed out". In that case try
-            # connecting again
-            time.sleep(1)
-            cmd =3D "%s-gdb -ex 'set sysroot %s' -ex \"target remote %s:=
%s\" -ex continue -ex quit %s" \
-                       %(self.target_sys, self.recipe_sysroot_native, se=
lf.qemu_ip, self.gdbserver_port, self.binary)
-            r =3D runCmd(cmd, native_sysroot=3Dself.recipe_sysroot_nativ=
e, **options)
-            if "Connection timed out" not in r.output:
-                break
-            if count =3D=3D 4:
-                self.assertTrue(False, "gdb unable to connect to gdbserv=
er")
-
-    def run_gdb_client(self):
-        self.run_gdb(native_sysroot=3Dself.recipe_sysroot_native, ignore=
_status=3DFalse)
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu, runCmd
=20
+class GdbServerTest(OESelftestTestCase):
     def test_gdb_server(self):
-        self.target_dst =3D "/tmp/"
-        self.source  =3D "test.c"
-        self.binary  =3D "test"
-        self.target_source =3D self.target_dst + self.source
-        self.target_binary =3D self.target_dst + self.binary
-        self.gdbserver_port =3D 2001
-
-        try:
-            # These aren't the actual IP addresses but testexport class =
needs something defined
-            features  =3D 'TEST_SERVER_IP =3D "192.168.7.1"\n'
-            features +=3D 'TEST_TARGET_IP =3D "192.168.7.2"\n'
-            features +=3D 'EXTRA_IMAGE_FEATURES +=3D "ssh-server-openssh=
"\n'
-            features +=3D 'CORE_IMAGE_EXTRA_INSTALL +=3D "gdbserver pack=
agegroup-core-buildessential"\n'
-            self.write_config(features)
-
-            self.target_arch =3D get_bb_var('TARGET_ARCH')
-            self.target_sys  =3D get_bb_var('TARGET_SYS')
-
-            recipe =3D "gdb-cross-%s" %self.target_arch
-            gdb_cross_bitbake_command =3D "%s -c addto_recipe_sysroot" %=
recipe
-
-            bitbake(gdb_cross_bitbake_command)
-
-            self.recipe_sysroot_native =3D get_bb_var('RECIPE_SYSROOT_NA=
TIVE', recipe)
-
-            bitbake('core-image-minimal')
-
-            self.cross_gdb_name =3D "%s-gdb" %self.target_sys
-
-            # wrap the execution with a qemu instance
-            with runqemu("core-image-minimal", runqemuparams =3D "nograp=
hic") as qemu:
-                status, target_gcc =3D qemu.run_serial("which gcc")
-
-                self.assertNotEqual(target_gcc, None, 'gcc not found on =
the target')
-
-                self.qemu_ip =3D qemu.ip
-
-                # self.tc.files_dir =3D meta/lib/oeqa/files
-                src =3D os.path.join(self.tc.files_dir, 'test.c')
-
-                self.logger.debug("src : %s qemu.ip : %s self.target_dst=
 : %s" % (src , self.qemu_ip , self.target_dst))
-                cmd =3D "scp -o StrictHostKeyChecking=3Dno -o UserKnownH=
ostsFile=3D/dev/null -o LogLevel=3DERROR %s root@%s:%s"  % (src, qemu.ip,=
 self.target_dst)
-                result =3D runCmd(cmd)
-
-                cmd =3D "cat %s" %(self.target_source)
-                status, output =3D qemu.run_serial(cmd)
-                self.assertIn("1234", output, "Source file copied to tar=
get is different that what is expected")
-
-                cmd =3D "%s %s -o %s -lm -g" % (target_gcc, self.target_=
source, self.target_binary)
-                status, output =3D qemu.run_serial(cmd)
-
-                cmd =3D "ls %s" %self.target_binary
-                status, output =3D qemu.run_serial(cmd)
-                self.assertNotIn("No such file or directory", output, "T=
est file compilation failed on target")
-
-                status, output =3D qemu.run_serial(self.target_binary)
-                self.assertIn("1234", output, "Test binary is different =
than what is expected")
-
-                cmd =3D "scp -o StrictHostKeyChecking=3Dno -o UserKnownH=
ostsFile=3D/dev/null -o LogLevel=3DERROR root@%s:%s %s"  % (qemu.ip, self=
.target_binary, os.getcwd())
-                result =3D runCmd(cmd)
-
-                cmd =3D "strip -s --strip-debug %s" %self.target_binary
-                status, output =3D qemu.run_serial(cmd)
-
-                gdb_client_thread =3D threading.Thread(target=3Dself.run=
_gdb_client)
-                gdb_client_thread.start()
-
-                cmd =3D "gdbserver localhost:%s %s" %(self.gdbserver_por=
t, self.target_binary)
-                status, output =3D qemu.run_serial(cmd)
-                self.logger.debug("gdbserver status : %s output : %s" % =
(status, output))
-
-                gdb_client_thread.join()
-                self.assertIn("1234", output, "Expected string (1234) no=
t present in test output")
-
-        except OEQATimeoutError:
-            self.fail("gdbserver test timeout error")
-
+        target_arch =3D self.td["TARGET_ARCH"]
+        target_sys =3D self.td["TARGET_SYS"]
+        deploy_dir =3D get_bb_var("DEPLOY_DIR_IMAGE")
+
+        features =3D """
+IMAGE_GEN_DEBUGFS =3D "1"
+IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2"
+CORE_IMAGE_EXTRA_INSTALL =3D "gdbserver"
+        """
+        self.write_config(features)
+
+        gdb_recipe =3D "gdb-cross-" + target_arch
+        gdb_binary =3D target_sys + "-gdb"
+
+        bitbake("core-image-minimal %s:do_addto_recipe_sysroot" % gdb_re=
cipe)
+
+        native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", gdb_recip=
e)
+        r =3D runCmd("%s --version" % gdb_binary, native_sysroot=3Dnativ=
e_sysroot, target_sys=3Dtarget_sys)
+        self.assertEqual(r.status, 0)
+        self.assertIn("GNU gdb", r.output)
+
+        with tempfile.TemporaryDirectory(prefix=3D"debugfs-") as debugfs=
:
+            filename =3D os.path.join(deploy_dir, "core-image-minimal-%s=
-dbg.tar.bz2" % self.td["MACHINE"])
+            shutil.unpack_archive(filename, debugfs)
+            filename =3D os.path.join(deploy_dir, "core-image-minimal-%s=
.tar.bz2" % self.td["MACHINE"])
+            shutil.unpack_archive(filename, debugfs)
+
+            with runqemu("core-image-minimal", runqemuparams=3D"nographi=
c") as qemu:
+                status, output =3D qemu.run_serial("kmod --help")
+                self.assertIn("modprobe", output)
+
+                with concurrent.futures.ThreadPoolExecutor(max_workers=3D=
1) as executor:
+                    def run_gdb():
+                        for _ in range(5):
+                            time.sleep(2)
+                            cmd =3D "%s --batch -ex 'set sysroot %s' -ex=
 \"target extended-remote %s:9999\" -ex \"info line kmod_help\"" % (gdb_b=
inary, debugfs, qemu.ip)
+                            self.logger.warning("starting gdb %s" % cmd)
+                            r =3D runCmd(cmd, native_sysroot=3Dnative_sy=
sroot, target_sys=3Dtarget_sys)
+                            self.assertEqual(0, r.status)
+                            line_re =3D r"Line \d+ of \"/usr/src/debug/k=
mod/.*/tools/kmod.c\" starts at address 0x[0-9A-Fa-f]+ <kmod_help>"
+                            self.assertRegex(r.output, line_re)
+                            break
+                        else:
+                            self.fail("Timed out connecting to gdb")
+                    future =3D executor.submit(run_gdb)
+
+                    status, output =3D qemu.run_serial("gdbserver --once=
 :9999 kmod --help")
+                    self.assertEqual(status, 1)
+                    # The future either returns None, or raises an excep=
tion
+                    future.result()
--=20
2.34.1


