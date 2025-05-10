Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42129C3ABC3
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6626.1746866655344310973
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 147AA153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD1E83F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/23] oeqa/sdk/maturin: no need for a setupClass, merge code into test
Date: Sat, 10 May 2025 09:43:49 +0100
Message-ID: <20250510084400.269726-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216264

There's no need to copy files inside setUpClass() when there's only one
test function that uses it. Just do all of the test inside the test.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/maturin.py | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases=
/maturin.py
index 83d13c4ec59..e3e8edc7819 100644
--- a/meta/lib/oeqa/sdk/cases/maturin.py
+++ b/meta/lib/oeqa/sdk/cases/maturin.py
@@ -30,17 +30,6 @@ class MaturinTest(OESDKTestCase):
         self.assertIn(expected, output)
=20
 class MaturinDevelopTest(OESDKTestCase):
-    @classmethod
-    def setUpClass(self):
-        targetdir =3D os.path.join(self.tc.sdk_dir, "guessing-game")
-        try:
-            shutil.rmtree(targetdir)
-        except FileNotFoundError:
-            pass
-        shutil.copytree(
-            os.path.join(self.tc.files_dir, "maturin/guessing-game"), ta=
rgetdir
-        )
-
     def setUp(self):
         machine =3D self.td.get("MACHINE")
         self.ensure_host_package("python3-maturin")
@@ -58,9 +47,17 @@ class MaturinDevelopTest(OESDKTestCase):
           (1) that a .venv can been created.
           (2) a functional 'rustc' and 'cargo'
         """
-        self._run("cd %s/guessing-game; python3 -m venv .venv" % self.tc=
.sdk_dir)
-        cmd =3D "cd %s/guessing-game; maturin develop" % self.tc.sdk_dir
-        output =3D self._run(cmd)
+        targetdir =3D os.path.join(self.tc.sdk_dir, "guessing-game")
+        try:
+            shutil.rmtree(targetdir)
+        except FileNotFoundError:
+            pass
+        shutil.copytree(
+            os.path.join(self.tc.files_dir, "maturin/guessing-game"), ta=
rgetdir
+        )
+
+        self._run("cd %s; python3 -m venv .venv" % targetdir)
+        output =3D self._run("cd %s; maturin develop" % targetdir)
         self.assertRegex(output, r"=F0=9F=94=97 Found pyo3 bindings with=
 abi3 support for Python =E2=89=A5 3.8")
         self.assertRegex(output, r"=F0=9F=90=8D Not using a specific pyt=
hon interpreter")
         self.assertRegex(output, r"=F0=9F=93=A1 Using build options feat=
ures from pyproject.toml")
--=20
2.43.0


