Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4310BC3ABCE
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6624.1746866654707624167
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CC26153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 117363F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/23] oeqa/sdk/maturin: be less picky in the list_python test
Date: Sat, 10 May 2025 09:43:48 +0100
Message-ID: <20250510084400.269726-15-ross.burton@arm.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216263

The test assumed that maturin would only find a single Python binary, in
/usr/bin/python3*.

However in eSDKs with buildtools a Python is shipped with the SDK, so
the test failed.

Generalise the test so that it runs python3 and obtains its path and
version, and then verifies that path and and version are found by
Maturin. This means we're not assuming a single Python, or the paths, or
that the Python is CPython.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/maturin.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases=
/maturin.py
index 42394c7a973..83d13c4ec59 100644
--- a/meta/lib/oeqa/sdk/cases/maturin.py
+++ b/meta/lib/oeqa/sdk/cases/maturin.py
@@ -19,17 +19,15 @@ class MaturinTest(OESDKTestCase):
         self.ensure_host_package("python3-maturin")
=20
     def test_maturin_list_python(self):
-        py_major =3D self._run("python3 -c 'import sys; print(sys.versio=
n_info.major)'")
-        py_minor =3D self._run("python3 -c 'import sys; print(sys.versio=
n_info.minor)'")
-        python_version =3D "%s.%s" % (py_major.strip(), py_minor.strip()=
)
-        cmd =3D "maturin list-python"
-        output =3D self._run(cmd)
-        self.assertRegex(output, r"^=F0=9F=90=8D 1 python interpreter fo=
und:\n")
-        self.assertRegex(
-            output,
-            r" - CPython %s (.+)/usr/bin/python%s$" % (python_version, p=
ython_version),
-        )
+        out =3D self._run(r"""python3 -c 'import sys; print(f"{sys.execu=
table}\n{sys.version_info.major}.{sys.version_info.minor}")'""")
+        executable, version =3D out.splitlines()
=20
+        output =3D self._run("maturin list-python")
+        # The output looks like this:
+        # - CPython 3.13 at /usr/bin/python3
+        # We don't want to assume CPython so just check for the version =
and path.
+        expected =3D f"{version} at {executable}"
+        self.assertIn(expected, output)
=20
 class MaturinDevelopTest(OESDKTestCase):
     @classmethod
--=20
2.43.0


