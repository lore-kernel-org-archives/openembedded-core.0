Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C44C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 12:00:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.23003.1661428846705421894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 05:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38AD2D6E;
	Thu, 25 Aug 2022 05:00:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35B823F71A;
	Thu, 25 Aug 2022 05:00:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/selftest: add test for debuginfod
Date: Thu, 25 Aug 2022 13:00:40 +0100
Message-Id: <20220825120040.1659148-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 12:00:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169853

Add a new selftest to exercise the debuginfod support, by starting a
debuginfod on DEPLOY_DIR and verifying that an image can fetch the
symbols for a binary.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/debuginfod.py

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/s=
elftest/cases/debuginfod.py
new file mode 100644
index 00000000000..01359ec6499
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -0,0 +1,44 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+import os
+import socketserver
+import subprocess
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
+
+class Debuginfod(OESelftestTestCase):
+    def test_debuginfod(self):
+        self.write_config("""
+DISTRO_FEATURES:append =3D " debuginfod"
+CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils"
+        """)
+        bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysr=
oot")
+
+        native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "elfutils=
-native")
+        cmd =3D [os.path.join(native_sysroot, "usr", "bin", "debuginfod"=
), "--verbose", get_bb_var("DEPLOY_DIR")]
+        for format in get_bb_var("PACKAGE_CLASSES").split():
+            if format =3D=3D "package_deb":
+                cmd.append("--scan-deb-dir")
+            elif format =3D=3D "package_ipk":
+                cmd.append("--scan-deb-dir")
+            elif format =3D=3D "package_rpm":
+                cmd.append("--scan-rpm-dir")
+        # Find a free port
+        with socketserver.TCPServer(("localhost", 0), None) as s:
+            port =3D s.server_address[1]
+            cmd.append("--port=3D%d" % port)
+
+        try:
+            debuginfod =3D subprocess.Popen(cmd)
+
+            with runqemu("core-image-minimal", runqemuparams=3D"nographi=
c") as qemu:
+                cmd =3D "DEBUGINFOD_URLS=3Dhttp://%s:%d/ debuginfod-find=
 debuginfo /usr/bin/debuginfod" % (qemu.server_ip, port)
+                status, output =3D qemu.run_serial(cmd)
+                # This should be more comprehensive
+                self.assertIn("/.cache/debuginfod_client/", output)
+        finally:
+            debuginfod.kill()
--=20
2.34.1


