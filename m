Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC50C7115C
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:20:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14645.1750339253328364228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAD2E113E
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:20:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 916683F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:20:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/4] oeqa/selftest: add new test for toolchain switching
Date: Thu, 19 Jun 2025 14:20:45 +0100
Message-ID: <20250619132045.1521932-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619132045.1521932-1-ross.burton@arm.com>
References: <20250619132045.1521932-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219080

Add a basic test for the toolchain switching code: set the
toolchain to GCC by default but Clang for a specific recipe, and verify
that two recipes are built with the expected compiler.

This works because before we strip the installed binaries there is a
.comment segment that contains the list of toolchains used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/toolchain.py | 71 +++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/toolchain.py

diff --git a/meta/lib/oeqa/selftest/cases/toolchain.py b/meta/lib/oeqa/se=
lftest/cases/toolchain.py
new file mode 100644
index 00000000000..b4b280d0375
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/toolchain.py
@@ -0,0 +1,71 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import shutil
+import subprocess
+import tempfile
+from types import SimpleNamespace
+
+import oe.path
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+
+class ToolchainTests(OESelftestTestCase):
+
+    def test_toolchain_switching(self):
+        """
+        Test that a configuration that uses GCC by default but clang for=
 one
+        specific recipe does infact do that.
+        """
+
+        def extract_comment(objcopy, filename):
+            """
+            Using the specified `objcopy`, return the .comment segment f=
rom
+            `filename` as a bytes().
+            """
+            with tempfile.NamedTemporaryFile(prefix=3D"comment-") as f:
+                cmd =3D [objcopy, "--dump-section", ".comment=3D" + f.na=
me, filename]
+                subprocess.run(cmd, check=3DTrue)
+                # clang's objcopy writes to a temporary file and renames=
, so we need to re-open.
+                with open(f.name, "rb") as f2:
+                    return f2.read()
+
+        def check_recipe(recipe, filename, override, comment_present, co=
mment_absent=3DNone):
+            """
+            Check that `filename` in `recipe`'s bindir contains `comment=
`, and
+            the overrides contain `override`.
+            """
+            d =3D SimpleNamespace(**get_bb_vars(("D", "bindir", "OBJCOPY=
", "OVERRIDES", "PATH"), target=3Drecipe))
+
+            self.assertIn(override, d.OVERRIDES)
+
+            binary =3D oe.path.join(d.D, d.bindir, filename)
+
+            objcopy =3D shutil.which(d.OBJCOPY, path=3Dd.PATH)
+            self.assertIsNotNone(objcopy)
+
+            comment =3D extract_comment(objcopy, binary)
+            self.assertIn(comment_present, comment)
+            if comment_absent:
+                self.assertNotIn(comment_absent, comment)
+
+
+        # GCC by default, clang for selftest-hello.
+        self.write_config("""
+TOOLCHAIN =3D "gcc"
+TOOLCHAIN:pn-selftest-hello =3D "clang"
+        """)
+
+        # Force these recipes to re-install so we can extract the .comme=
nts from
+        # the install directory, as they're stripped out of the final pa=
ckages.
+        bitbake("m4 selftest-hello -C install")
+
+        # m4 should be built with GCC and only GCC
+        check_recipe("m4", "m4", "toolchain-gcc", b"GCC: (GNU)", b"clang=
")
+
+        # helloworld should be built with clang. We can't assert that GC=
C is not
+        # present as it will be linked against glibc which is built with=
 GCC.
+        check_recipe("selftest-hello", "helloworld", "toolchain-clang", =
b"clang version")
--=20
2.43.0


