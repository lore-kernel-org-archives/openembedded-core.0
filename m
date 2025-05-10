Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5142FC3ABCC
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6623.1746866654069239822
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5242153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69D563F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/23] oeqa/sdk/meson: add check that meson has detected the target correctly
Date: Sat, 10 May 2025 09:43:47 +0100
Message-ID: <20250510084400.269726-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216262

Use 'meson introspect' to dump JSON describing the build configuration
and validate that the target architectures and cross-compiler is
correctly set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/m=
eson.py
index 4fb101f9f73..a809ca3a537 100644
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
@@ -36,6 +37,14 @@ class MesonTestBase(OESDKTestCase):
         # Check that Meson thinks we're doing a cross build and not a na=
tive
         self.assertIn("Build type: cross build", log)
=20
+        # Check that the cross-compiler used is the one we set.
+        data =3D json.loads(self._run(f"meson introspect --compilers {bu=
ilddir}"))
+        self.assertIn(self.td.get("CC").split()[0], data["host"]["c"]["e=
xelist"])
+
+        # Check that the target architectures was set correctly.
+        data =3D json.loads(self._run(f"meson introspect --machines {bui=
lddir}"))
+        self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
+
         self._run(f"meson compile -C {builddir} -v")
=20
         if installdir:
--=20
2.43.0


