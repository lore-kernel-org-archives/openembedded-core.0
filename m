Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C100AC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 18:23:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22840.1737483795508402490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 10:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40082106F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:23:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6672E3F5A1
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:23:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/poisoning: fix gcc include poisoning test
Date: Tue, 21 Jan 2025 18:23:08 +0000
Message-ID: <20250121182309.904188-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 18:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210106

The test code in poison was flawed: as long as one CPP/CC/CXX has fatal
poisoning enabled then the test passes.  However, at the moment due to
a bad rebase only CPP has fatal poisoning and CC/CXX do not.

Rewrite the do_compile() task to more carefully check the output so the
test harness itself just has to bitbake the recipe.

Note that this results in the test failing:

  ERROR: poison-1.0-r0 do_compile: C Compiler is not poisoned.
  Exit status 0, output:  cc1: warning: include location "/usr/include" i=
s unsafe for cross-compilation [-Wpoison-system-directories]
  ERROR: poison-1.0-r0 do_compile: C++ Compiler is not poisoned.
  Exit status 0, output:  cc1plus: warning: include location "/usr/includ=
e" is unsafe for cross-compilation [-Wpoison-system-directories]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/recipes-test/poison/poison.bb  | 26 ++++++++++++++------
 meta/lib/oeqa/selftest/cases/buildoptions.py |  5 ++--
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/meta-selftest/recipes-test/poison/poison.bb b/meta-selftest/=
recipes-test/poison/poison.bb
index e9eee0cdbab..771113acf32 100644
--- a/meta-selftest/recipes-test/poison/poison.bb
+++ b/meta-selftest/recipes-test/poison/poison.bb
@@ -8,13 +8,25 @@ inherit nopackages
 # This test confirms that compiling code that searches /usr/include for =
headers
 # will result in compiler errors.  This recipe should will fail to build=
 and
 # oe-selftest has a test that verifies that.
-do_compile() {
-    bbnote Testing preprocessor
-    echo "int main(int argc, char** argv) {}" | ${CPP} -I/usr/include -
-    bbnote Testing C compiler
-    echo "int main(int argc, char** argv) {}" | ${CC} -x c -I/usr/includ=
e -
-    bbnote Testing C++ compiler
-    echo "int main(int argc, char** argv) {}" | ${CC} -x c++ -I/usr/incl=
ude -
+python do_compile() {
+    import subprocess
+
+    tests =3D {
+        "Preprocessor": "${CPP} -I/usr/include -",
+        "C Compiler": "${CC} -I/usr/include -x c -",
+        "C++ Compiler": "${CXX} -I/usr/include -x c++ -",
+    }
+
+    for name, cmd in tests.items():
+        cmd =3D d.expand(cmd)
+        bb.note("Test command: " + cmd)
+        testcode =3D "int main(int argc, char** argv) {}"
+        proc =3D subprocess.run(cmd, shell=3DTrue, input=3Dtestcode, cap=
ture_output=3DTrue, text=3DTrue)
+
+        if proc.returncode !=3D 0 and "is unsafe for cross-compilation" =
in proc.stderr:
+            bb.note(f"{name} passed: {proc.stderr}")
+        else:
+            bb.error(f"{name} is not poisoned. Exit status {proc.returnc=
ode}, output: {proc.stdout} {proc.stderr}")
 }
=20
 EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
index 09272314bb8..b509bcf951c 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -234,6 +234,5 @@ PREMIRRORS =3D "\\
=20
 class Poisoning(OESelftestTestCase):
     def test_poisoning(self):
-        res =3D bitbake("poison", ignore_status=3DTrue)
-        self.assertNotEqual(res.status, 0)
-        self.assertTrue("is unsafe for cross-compilation" in res.output)
+        # The poison recipe fails if the poisoning didn't work
+        bitbake("poison")
--=20
2.43.0


