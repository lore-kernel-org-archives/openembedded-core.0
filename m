Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E95C61D94
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:19:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39569.1700572768977682470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2B65FEC;
	Tue, 21 Nov 2023 05:20:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A9C23F7A6;
	Tue, 21 Nov 2023 05:19:27 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v2] oeqa/selftest/debuginfod: improve selftest
Date: Tue, 21 Nov 2023 13:19:24 +0000
Message-Id: <20231121131924.2655618-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190973

From: Ross Burton <ross.burton@arm.com>

This test was occasionally failing for no obvious reason, so refactor
and improve:

- While waiting for the daemon, check that it is still running and
  explicitly timeout after 10s when making the HTTP call.

- While waiting for the daemon to be ready, log the current state of the
  daemon so we can tell if we're timing out as it is still scanning.

- This was in fact the cause of the intermittant failures, because the
  TMPDIR is reused between tests and may contain a large number of
  packages. Do the tests in an isolated TMPDIR to hopefully mitigate this
  issue and increase the timeout to two minutes.

- Decorate the test using runqemu as such so that can be skipped in
  environments without runqemu

- Add a second test that doesn't use runqemu or images, which is faster
  but less realistic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 124 +++++++++++++++------
 1 file changed, 88 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/s=
elftest/cases/debuginfod.py
index 37f51760fbc..505b4be8373 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -6,7 +6,11 @@
 import os
 import socketserver
 import subprocess
+import time
+import urllib
+import pathlib
=20
+from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, runqemu
=20
@@ -21,39 +25,54 @@ class Debuginfod(OESelftestTestCase):
         Request the metrics endpoint periodically and wait for there to =
be no
         busy scanning threads.
=20
-        Returns True if debuginfod is ready, False if we timed out
+        Returns if debuginfod is ready, raises an exception if not withi=
n the
+        timeout.
         """
-        import time, urllib
=20
-        # Wait a minute
-        countdown =3D 6
-        delay =3D 10
+        # Wait two minutes
+        countdown =3D 24
+        delay =3D 5
+        latest =3D None
=20
         while countdown:
+            self.logger.info("waiting...")
             time.sleep(delay)
+
+            self.logger.info("polling server")
+            if self.debuginfod.poll():
+                self.logger.info("server dead")
+                self.debuginfod.communicate()
+                self.fail("debuginfod terminated unexpectedly")
+            self.logger.info("server alive")
+
             try:
-                with urllib.request.urlopen("http://localhost:%d/metrics=
" % port) as f:
-                    lines =3D f.read().decode("ascii").splitlines()
-                    if "thread_busy{role=3D\"scan\"} 0" in lines:
-                        return True
+                with urllib.request.urlopen("http://localhost:%d/metrics=
" % port, timeout=3D10) as f:
+                    for line in f.read().decode("ascii").splitlines():
+                        key, value =3D line.rsplit(" ", 1)
+                        if key =3D=3D "thread_busy{role=3D\"scan\"}":
+                            latest =3D int(value)
+                            self.logger.info("Waiting for %d scan jobs t=
o finish" % latest)
+                            if latest =3D=3D 0:
+                                return
             except urllib.error.URLError as e:
+                # TODO: how to catch just timeouts?
                 self.logger.error(e)
+
             countdown -=3D 1
-        return False
=20
+        raise TimeoutError("Cannot connect debuginfod, still %d scan job=
s running" % latest)
=20
-    def test_debuginfod(self):
-        self.write_config(
-            """
-DISTRO_FEATURES:append =3D " debuginfod"
-CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils"
-        """
-        )
-        bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysr=
oot")
+    def start_debuginfod(self):
+        # We assume that the caller has already bitbake'd elfutils-nativ=
e:do_addto_recipe_sysroot
+
+        # Save some useful paths for later
+        native_sysroot =3D pathlib.Path(get_bb_var("RECIPE_SYSROOT_NATIV=
E", "elfutils-native"))
+        native_bindir =3D native_sysroot / "usr" / "bin"
+        self.debuginfod =3D native_bindir / "debuginfod"
+        self.debuginfod_find =3D native_bindir / "debuginfod-find"
=20
-        native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "elfutils=
-native")
         cmd =3D [
-            os.path.join(native_sysroot, "usr", "bin", "debuginfod"),
+            self.debuginfod,
             "--verbose",
             # In-memory database, this is a one-shot test
             "--database=3D:memory:",
@@ -76,31 +95,64 @@ CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils"
         else:
             self.fail("Unknown package class %s" % format)
=20
-        # Find a free port
+        # Find a free port. Racey but the window is small.
         with socketserver.TCPServer(("localhost", 0), None) as s:
-            port =3D s.server_address[1]
-            cmd.append("--port=3D%d" % port)
+            self.port =3D s.server_address[1]
+            cmd.append("--port=3D%d" % self.port)
+
+        self.logger.info(f"Starting server {cmd}")
+        self.debuginfod =3D subprocess.Popen(cmd, env=3D{})
+        self.wait_for_debuginfod(self.port)
+
+
+    def test_debuginfod_native(self):
+        """
+        Test debuginfod outside of qemu, by building a package and looki=
ng up a
+        binary's debuginfo using elfutils-native.
+        """
+
+        self.write_config("""
+TMPDIR =3D "${TOPDIR}/tmp-debuginfod"
+DISTRO_FEATURES:append =3D " debuginfod"
+""")
+        bitbake("elfutils-native:do_addto_recipe_sysroot xz xz:do_packag=
e")
=20
         try:
-            # Remove DEBUGINFOD_URLS from the environment so we don't tr=
y
-            # looking in the distro debuginfod
+            self.start_debuginfod()
+
             env =3D os.environ.copy()
-            if "DEBUGINFOD_URLS" in env:
-                del env["DEBUGINFOD_URLS"]
+            env["DEBUGINFOD_URLS"] =3D "http://localhost:%d/" % self.por=
t
+
+            pkgs =3D pathlib.Path(get_bb_var("PKGDEST", "xz"))
+            cmd =3D (self.debuginfod_find, "debuginfo", pkgs / "xz" / "u=
sr" / "bin" / "xz.xz")
+            self.logger.info(f"Starting client {cmd}")
+            output =3D subprocess.check_output(cmd, env=3Denv, text=3DTr=
ue)
+            # This should be more comprehensive
+            self.assertIn("/.cache/debuginfod_client/", output)
+        finally:
+            self.debuginfod.kill()
+
+    @OETestTag("runqemu")
+    def test_debuginfod_qemu(self):
+        """
+        Test debuginfod-find inside a qemu, talking to a debuginfod on t=
he host.
+        """
+
+        self.write_config("""
+TMPDIR =3D "${TOPDIR}/tmp-debuginfod"
+DISTRO_FEATURES:append =3D " debuginfod"
+CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils xz"
+        """)
+        bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysr=
oot")
=20
-            self.logger.info(f"Starting server {cmd}")
-            debuginfod =3D subprocess.Popen(cmd, env=3Denv)
+        try:
+            self.start_debuginfod()
=20
             with runqemu("core-image-minimal", runqemuparams=3D"nographi=
c") as qemu:
-                self.assertTrue(self.wait_for_debuginfod(port))
-
-                cmd =3D (
-                    "DEBUGINFOD_URLS=3Dhttp://%s:%d/ debuginfod-find deb=
uginfo /usr/bin/debuginfod"
-                    % (qemu.server_ip, port)
-                )
+                cmd =3D "DEBUGINFOD_URLS=3Dhttp://%s:%d/ debuginfod-find=
 debuginfo /usr/bin/xz" % (qemu.server_ip, self.port)
                 self.logger.info(f"Starting client {cmd}")
                 status, output =3D qemu.run_serial(cmd)
                 # This should be more comprehensive
                 self.assertIn("/.cache/debuginfod_client/", output)
         finally:
-            debuginfod.kill()
+            self.debuginfod.kill()
--=20
2.34.1


