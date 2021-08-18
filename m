Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.52383.1629281786501174120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 03:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26DD3101E
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 03:16:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4EE73F66F
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 03:16:24 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oeqa/sdk: add HTTPS test for buildtools
Date: Wed, 18 Aug 2021 11:16:20 +0100
Message-Id: <20210818101620.2183180-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Verify that HTTPS connections work in both wget and Python, as this
depends on variables correctly pointing to the certificate chain.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/https.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/buildtools-cases/https.py

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/=
sdk/buildtools-cases/https.py
new file mode 100644
index 00000000000..134879aab32
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
@@ -0,0 +1,20 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class HTTPTests(OESDKTestCase):
+    """
+    Verify that HTTPS certificates are working correctly, as this depend=
s on
+    environment variables being set correctly.
+    """
+
+    def test_wget(self):
+        self._run('env -i wget --debug --output-document /dev/null https=
://www.example.com')
+
+    def test_python(self):
+        # urlopen() returns a file-like object on success and throws an =
exception otherwise
+        self._run('python3 -c \'import urllib.request; urllib.request.ur=
lopen("https://www.example.com/")\'')
--=20
2.32.0

