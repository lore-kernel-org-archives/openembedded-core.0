Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4222.1626875703014553929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 06:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC2A11042
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 06:55:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55B323F73D
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 06:55:01 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/sdk: add some buildtools tests
Date: Wed, 21 Jul 2021 14:54:58 +0100
Message-Id: <20210721135458.427938-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721135458.427938-1-ross.burton@arm.com>
References: <20210721135458.427938-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These two tests are designed to exercise the buildtools-tarball.

SanityTests simply verifies that inside the SDK, some commands are used
from the SDK.

BuildTests creates a new OE build directory and builds virtual/libc to
verify that a basic build works correctly. DL_DIR is reused to avoid
needless downloading, but sstate is not shared to ensure a build does
happen.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/README    |  2 ++
 meta/lib/oeqa/sdk/buildtools-cases/build.py  | 23 ++++++++++++++++++++
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py | 22 +++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/buildtools-cases/README
 create mode 100644 meta/lib/oeqa/sdk/buildtools-cases/build.py
 create mode 100644 meta/lib/oeqa/sdk/buildtools-cases/sanity.py

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/README b/meta/lib/oeqa/sd=
k/buildtools-cases/README
new file mode 100644
index 0000000000..d4f20faa9f
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildtools-cases/README
@@ -0,0 +1,2 @@
+These test cases are used by buildtools-tarball, and are not used by the=
 testsdk
+class.
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py b/meta/lib/oeqa/=
sdk/buildtools-cases/build.py
new file mode 100644
index 0000000000..5a17ab98c6
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildtools-cases/build.py
@@ -0,0 +1,23 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os, tempfile
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class BuildTests(OESDKTestCase):
+    """
+    Verify that bitbake can build virtual/libc inside the buildtools.
+    """
+    def test_libc(self):
+        with tempfile.TemporaryDirectory(prefix=3D'bitbake-build-', dir=3D=
self.tc.sdk_dir) as testdir:
+            corebase =3D self.td['COREBASE']
+
+            self._run('. %s/oe-init-build-env %s' % (corebase, testdir))
+            with open(os.path.join(testdir, 'conf', 'local.conf'), 'ta')=
 as conf:
+                conf.write('\n')
+                conf.write('DL_DIR =3D "%s"\n' % self.td['DL_DIR'])
+
+            self._run('. %s/oe-init-build-env %s && bitbake virtual/libc=
' % (corebase, testdir))
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py b/meta/lib/oeqa=
/sdk/buildtools-cases/sanity.py
new file mode 100644
index 0000000000..64baaa8f84
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
@@ -0,0 +1,22 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import shutil
+import os.path
+from oeqa.sdk.case import OESDKTestCase
+
+class SanityTests(OESDKTestCase):
+    def test_tools(self):
+        """
+        Test that wget and tar come from the buildtools, not the host. T=
his
+        verifies that the buildtools have installed correctly. We can't =
check
+        for gcc as that is only installed by buildtools-extended.
+        """
+        for command in ("tar", "wget"):
+            # Canonicalise the SDK root
+            sdk_base =3D os.path.realpath(self.tc.sdk_dir)
+            # Canonicalise the location of this command
+            tool_path =3D os.path.realpath(self._run("command -v %s" % c=
ommand).strip())
+            # Assert that the tool was found inside the SDK root
+            self.assertEquals(os.path.commonprefix((sdk_base, tool_path)=
), sdk_base)
--=20
2.25.1

