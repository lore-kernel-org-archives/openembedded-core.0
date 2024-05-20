Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043E1C41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 10:18:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56867.1716200318499746759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 03:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E801FEC
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:19:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E57733F766
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:18:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] oeqa/sdk/meson: improve test to validate host/build target assignments
Date: Mon, 20 May 2024 10:18:33 +0000
Message-Id: <20240520101833.1798907-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520101833.1798907-1-ross.burton@arm.com>
References: <20240520101833.1798907-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 10:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199568

Use 'meson introspect' to dump JSON describing the build configuration
and validate that the build and host architectures are correctly set in
the meson.cross file.

Also instead of calling ninja directly, call the relevant meson commands.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/m=
eson.py
index be53df204a5..5b53668c958 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import json
 import os
 import subprocess
 import tempfile
@@ -35,10 +36,17 @@ class MesonTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
=20
-            log =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno=
 -Dx11=3Dfalse {build} {source}".format(**dirs))
-            # Check that Meson thinks we're doing a cross build and not =
a native
-            self.assertIn("Build type: cross build", log)
-            self._run("ninja -C {build} -v".format(**dirs))
-            self._run("DESTDIR=3D{install} ninja -C {build} -v install".=
format(**dirs))
+            log =3D self._run("meson setup --warnlevel 1 -Degl=3Dno -Dgl=
x=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))
+
+            # Check that the host (gcc) and build (cross-gcc) compilers =
are different
+            data =3D json.loads(self._run("meson introspect --compilers =
{build}".format(**dirs)))
+            self.assertNotEqual(data["build"]["c"]["exelist"], data["hos=
t"]["c"]["exelist"])
+            # Check that the system architectures were set correctly
+            data =3D json.loads(self._run("meson introspect --machines {=
build}".format(**dirs)))
+            self.assertEqual(data["build"]["cpu"], self.td["SDK_ARCH"])
+            self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
+
+            self._run("meson compile -C {build} -v".format(**dirs))
+            self._run("meson install -C {build} --destdir {install}".for=
mat(**dirs))
=20
             self.check_elf(os.path.join(dirs["install"], "usr", "local",=
 "lib", "libepoxy.so"))
--=20
2.34.1


