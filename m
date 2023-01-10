Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCDFC54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:20:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.108347.1673367640668681085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BEAB2F4;
	Tue, 10 Jan 2023 08:21:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE96E3F67D;
	Tue, 10 Jan 2023 08:20:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/selftest/debuginfod: improve testcase
Date: Tue, 10 Jan 2023 16:20:37 +0000
Message-Id: <20230110162037.3524842-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 16:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175721

Primarily, before running the debuginfod-find tool, check that the
debuginfod server has finished sweeping the deploy directory.  If we
make the request too soon then there's a rare chance that we run the
client before it has scanned the right packages, and the log gets
swamped with warnings from sqlite due to a race.

Also:
- unset DEBUGINFOD_URLS so the debuginfod doesn't proxy to an upstream
  server provided by the host distro
- Lower concurrency to reduce system load and handle systems with lower
  maximum open file counts but lots of cores (as the concurrency means
  cores*2*2 open files)
- Set the refresh times to 0 so we never rescan during the test
- Only scan the packages for the format which the image is using
- Log the commands that are being invoked

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 67 +++++++++++++++++++---
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/s=
elftest/cases/debuginfod.py
index 3c401192829..37f51760fbc 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -12,6 +12,36 @@ from oeqa.utils.commands import bitbake, get_bb_var, r=
unqemu
=20
=20
 class Debuginfod(OESelftestTestCase):
+
+    def wait_for_debuginfod(self, port):
+        """
+        debuginfod takes time to scan the packages and requesting too ea=
rly may
+        result in a test failure if the right packages haven't been scan=
ned yet.
+
+        Request the metrics endpoint periodically and wait for there to =
be no
+        busy scanning threads.
+
+        Returns True if debuginfod is ready, False if we timed out
+        """
+        import time, urllib
+
+        # Wait a minute
+        countdown =3D 6
+        delay =3D 10
+
+        while countdown:
+            time.sleep(delay)
+            try:
+                with urllib.request.urlopen("http://localhost:%d/metrics=
" % port) as f:
+                    lines =3D f.read().decode("ascii").splitlines()
+                    if "thread_busy{role=3D\"scan\"} 0" in lines:
+                        return True
+            except urllib.error.URLError as e:
+                self.logger.error(e)
+            countdown -=3D 1
+        return False
+
+
     def test_debuginfod(self):
         self.write_config(
             """
@@ -25,29 +55,50 @@ CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils"
         cmd =3D [
             os.path.join(native_sysroot, "usr", "bin", "debuginfod"),
             "--verbose",
+            # In-memory database, this is a one-shot test
             "--database=3D:memory:",
+            # Don't use all the host cores
+            "--concurrency=3D8",
+            "--connection-pool=3D8",
+            # Disable rescanning, this is a one-shot test
+            "--rescan-time=3D0",
+            "--groom-time=3D0",
             get_bb_var("DEPLOY_DIR"),
         ]
-        for format in get_bb_var("PACKAGE_CLASSES").split():
-            if format =3D=3D "package_deb":
-                cmd.append("--scan-deb-dir")
-            elif format =3D=3D "package_ipk":
-                cmd.append("--scan-deb-dir")
-            elif format =3D=3D "package_rpm":
-                cmd.append("--scan-rpm-dir")
+
+        format =3D get_bb_var("PACKAGE_CLASSES").split()[0]
+        if format =3D=3D "package_deb":
+            cmd.append("--scan-deb-dir")
+        elif format =3D=3D "package_ipk":
+            cmd.append("--scan-deb-dir")
+        elif format =3D=3D "package_rpm":
+            cmd.append("--scan-rpm-dir")
+        else:
+            self.fail("Unknown package class %s" % format)
+
         # Find a free port
         with socketserver.TCPServer(("localhost", 0), None) as s:
             port =3D s.server_address[1]
             cmd.append("--port=3D%d" % port)
=20
         try:
-            debuginfod =3D subprocess.Popen(cmd)
+            # Remove DEBUGINFOD_URLS from the environment so we don't tr=
y
+            # looking in the distro debuginfod
+            env =3D os.environ.copy()
+            if "DEBUGINFOD_URLS" in env:
+                del env["DEBUGINFOD_URLS"]
+
+            self.logger.info(f"Starting server {cmd}")
+            debuginfod =3D subprocess.Popen(cmd, env=3Denv)
=20
             with runqemu("core-image-minimal", runqemuparams=3D"nographi=
c") as qemu:
+                self.assertTrue(self.wait_for_debuginfod(port))
+
                 cmd =3D (
                     "DEBUGINFOD_URLS=3Dhttp://%s:%d/ debuginfod-find deb=
uginfo /usr/bin/debuginfod"
                     % (qemu.server_ip, port)
                 )
+                self.logger.info(f"Starting client {cmd}")
                 status, output =3D qemu.run_serial(cmd)
                 # This should be more comprehensive
                 self.assertIn("/.cache/debuginfod_client/", output)
--=20
2.34.1


