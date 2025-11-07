Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B38CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11097.1762521323584342582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Joh2lnvc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 25D5BC0FAA2
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 13:15:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 506FD606A6;
	Fri,  7 Nov 2025 13:15:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 448EB118525D4;
	Fri,  7 Nov 2025 14:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521321; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EiHkUrBB2Feff9RNc+ieOuLJmFdrb8OMLHqmqoLD8e4=;
	b=Joh2lnvceXQ0n8MmYnLAv5cHL/IFgwxkI3NcuJZ/tyFoHSRcrwbQNkm//UIq8sDAhlarSM
	XR4zfcKE91i2uMtLC/vbgDlLcgo012XxNL/HdIdCSttITL1rAUFQAOD17GJjVEa0BffqFW
	ccy29Knr8dTK+XfN86tr7k0SzFKNKkahYdXs6VM3kXe39SeOPixZQA5k1g0F35VaoIQLCu
	xM6NBW9Jac8cfb9fA274HWrU2UIusct6di7HpESVJ4HWcA7aS2tgDrVrUCY7BXgQnquRDz
	YBiJYsZ1+gNy3TjsNitw7IS0yfbe05qYJLEq29SEgpMnzYuSZIQs7VjPty4pxw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v4 11/17] selftest: spdx: Add SPDX 3.0 test cases
Date: Fri,  7 Nov 2025 14:14:45 +0100
Message-ID: <20251107131502.3857600-12-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226047

From: Joshua Watt <JPEWhacker@gmail.com>

Adds test cases for SPDX 3.0. Reworks the SPDX 2.2 test setup so it can
also be run even if the default is SPDX 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1d2309b3ab0fd8b0d8c4dfa59f50c85074bbd3b)
---
 meta/lib/oeqa/selftest/cases/spdx.py | 133 +++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index 7685a81e7f..5364f70e21 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -6,21 +6,26 @@
=20
 import json
 import os
+import textwrap
+from pathlib import Path
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, runCmd
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
=20
-class SPDXCheck(OESelftestTestCase):
=20
+class SPDX22Check(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
-        super(SPDXCheck, cls).setUpClass()
+        super().setUpClass()
         bitbake("python3-spdx-tools-native")
         bitbake("-c addto_recipe_sysroot python3-spdx-tools-native")
=20
     def check_recipe_spdx(self, high_level_dir, spdx_file, target_name):
-        config =3D """
-INHERIT +=3D "create-spdx"
-"""
+        config =3D textwrap.dedent(
+            """\
+            INHERIT:remove =3D "create-spdx"
+            INHERIT +=3D "create-spdx-2.2"
+            """
+        )
         self.write_config(config)
=20
         deploy_dir =3D get_bb_var("DEPLOY_DIR")
@@ -29,7 +34,9 @@ INHERIT +=3D "create-spdx"
         # qemux86-64 creates the directory qemux86_64
         machine_dir =3D machine_var.replace("-", "_")
=20
-        full_file_path =3D os.path.join(deploy_dir, "spdx", spdx_version=
, machine_dir, high_level_dir, spdx_file)
+        full_file_path =3D os.path.join(
+            deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, =
spdx_file
+        )
=20
         try:
             os.remove(full_file_path)
@@ -44,8 +51,13 @@ INHERIT +=3D "create-spdx"
                 self.assertNotEqual(report, None)
                 self.assertNotEqual(report["SPDXID"], None)
=20
-            python =3D os.path.join(get_bb_var('STAGING_BINDIR', 'python=
3-spdx-tools-native'), 'nativepython3')
-            validator =3D os.path.join(get_bb_var('STAGING_BINDIR', 'pyt=
hon3-spdx-tools-native'), 'pyspdxtools')
+            python =3D os.path.join(
+                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"=
),
+                "nativepython3",
+            )
+            validator =3D os.path.join(
+                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"=
), "pyspdxtools"
+            )
             result =3D runCmd("{} {} -i {}".format(python, validator, fi=
lename))
=20
         self.assertExists(full_file_path)
@@ -53,3 +65,106 @@ INHERIT +=3D "create-spdx"
=20
     def test_spdx_base_files(self):
         self.check_recipe_spdx("packages", "base-files.spdx.json", "base=
-files")
+
+
+class SPDX3CheckBase(object):
+    """
+    Base class for checking SPDX 3 based tests
+    """
+
+    def check_spdx_file(self, filename):
+        import oe.spdx30
+
+        self.assertExists(filename)
+
+        # Read the file
+        objset =3D oe.spdx30.SHACLObjectSet()
+        with open(filename, "r") as f:
+            d =3D oe.spdx30.JSONLDDeserializer()
+            d.read(f, objset)
+
+        return objset
+
+    def check_recipe_spdx(self, target_name, spdx_path, *, task=3DNone, =
extraconf=3D""):
+        config =3D textwrap.dedent(
+            f"""\
+            INHERIT:remove =3D "create-spdx"
+            INHERIT +=3D "{self.SPDX_CLASS}"
+            {extraconf}
+            """
+        )
+        self.write_config(config)
+
+        if task:
+            bitbake(f"-c {task} {target_name}")
+        else:
+            bitbake(target_name)
+
+        filename =3D spdx_path.format(
+            **get_bb_vars(
+                [
+                    "DEPLOY_DIR_IMAGE",
+                    "DEPLOY_DIR_SPDX",
+                    "MACHINE",
+                    "MACHINE_ARCH",
+                    "SDKMACHINE",
+                    "SDK_DEPLOY",
+                    "SPDX_VERSION",
+                    "TOOLCHAIN_OUTPUTNAME",
+                ],
+                target_name,
+            )
+        )
+
+        return self.check_spdx_file(filename)
+
+    def check_objset_missing_ids(self, objset):
+        if objset.missing_ids:
+            self.assertTrue(
+                False,
+                "The following SPDXIDs are unresolved:\n  "
+                + "\n  ".join(objset.missing_ids),
+            )
+
+
+class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
+    SPDX_CLASS =3D "create-spdx-3.0"
+
+    def test_base_files(self):
+        self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.j=
son",
+        )
+
+    def test_core_image_minimal(self):
+        objset =3D self.check_recipe_spdx(
+            "core-image-minimal",
+            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx=
.json",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
+    def test_core_image_minimal_sdk(self):
+        objset =3D self.check_recipe_spdx(
+            "core-image-minimal",
+            "{SDK_DEPLOY}/{TOOLCHAIN_OUTPUTNAME}.spdx.json",
+            task=3D"populate_sdk",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
+    def test_baremetal_helloworld(self):
+        objset =3D self.check_recipe_spdx(
+            "baremetal-helloworld",
+            "{DEPLOY_DIR_IMAGE}/baremetal-helloworld-image-{MACHINE}.spd=
x.json",
+            extraconf=3Dtextwrap.dedent(
+                """\
+                TCLIBC =3D "baremetal"
+                """
+            ),
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
--=20
2.43.0


