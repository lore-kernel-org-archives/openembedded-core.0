Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08D7C6FA82
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 11:54:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4444.1662638059805308048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 04:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A2A714BF;
	Thu,  8 Sep 2022 04:54:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D606F3F71A;
	Thu,  8 Sep 2022 04:54:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/selftest/debuginfod: don't re-use the database
Date: Thu,  8 Sep 2022 12:54:15 +0100
Message-Id: <20220908115415.3689237-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 11:54:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170457

debuginfod writes the files it scans to a database in $HOME, which isn't
ideal when the build trees that get scanned typically are deleted after
the test has finished. This can result in debuginfod trying to return
objects that no longer exist on disk:

libc error: stat /home/pokybuild/yocto-worker/oe-selftest-debian/build/bu=
ild-st-1032306/tmp/deploy/rpm/core2_64/elfutils-dbg-0.187-r0.core2_64.rpm=
: No such file or directory
libc error: stat /home/pokybuild/yocto-worker/oe-selftest-debian/build/bu=
ild-st-1113320/tmp/deploy/rpm/core2_64/elfutils-dbg-0.187-r0.core2_64.rpm=
: No such file or directory
libc error: stat /home/pokybuild/yocto-worker/oe-selftest-debian/build/bu=
ild-st-1113320/tmp/deploy/rpm/core2_64/elfutils-dbg-0.187-r0.core2_64.rpm=
: No such file or directory

Solve this, and save writing a database on disk at all, by using the
special database path :memory: which keeps the database in memory only,
so state can't leak between tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/s=
elftest/cases/debuginfod.py
index 01359ec6499..3c401192829 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -10,16 +10,24 @@ import subprocess
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, runqemu
=20
+
 class Debuginfod(OESelftestTestCase):
     def test_debuginfod(self):
-        self.write_config("""
+        self.write_config(
+            """
 DISTRO_FEATURES:append =3D " debuginfod"
 CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils"
-        """)
+        """
+        )
         bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysr=
oot")
=20
         native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "elfutils=
-native")
-        cmd =3D [os.path.join(native_sysroot, "usr", "bin", "debuginfod"=
), "--verbose", get_bb_var("DEPLOY_DIR")]
+        cmd =3D [
+            os.path.join(native_sysroot, "usr", "bin", "debuginfod"),
+            "--verbose",
+            "--database=3D:memory:",
+            get_bb_var("DEPLOY_DIR"),
+        ]
         for format in get_bb_var("PACKAGE_CLASSES").split():
             if format =3D=3D "package_deb":
                 cmd.append("--scan-deb-dir")
@@ -36,7 +44,10 @@ CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils"
             debuginfod =3D subprocess.Popen(cmd)
=20
             with runqemu("core-image-minimal", runqemuparams=3D"nographi=
c") as qemu:
-                cmd =3D "DEBUGINFOD_URLS=3Dhttp://%s:%d/ debuginfod-find=
 debuginfo /usr/bin/debuginfod" % (qemu.server_ip, port)
+                cmd =3D (
+                    "DEBUGINFOD_URLS=3Dhttp://%s:%d/ debuginfod-find deb=
uginfo /usr/bin/debuginfod"
+                    % (qemu.server_ip, port)
+                )
                 status, output =3D qemu.run_serial(cmd)
                 # This should be more comprehensive
                 self.assertIn("/.cache/debuginfod_client/", output)
--=20
2.34.1


