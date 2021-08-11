Received: from ford.bithub.de (ford.bithub.de [159.69.22.172])
 by mx.groups.io with SMTP id smtpd.web10.10045.1628700115239880540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 09:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@bithub.de header.s=ford header.b=oymUnni4;
 spf=pass (domain: bithub.de, ip: 159.69.22.172, mailfrom: philip@bithub.de)
Received: from t420.fritz.box (x4db4214e.dyn.telefonica.de [77.180.33.78])
	by ford.bithub.de (Postfix) with ESMTPSA id 471181FCC7;
	Wed, 11 Aug 2021 18:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bithub.de; s=ford;
	t=1628700113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RRoZcvd+Wpb7r3z7HyBefSeNxjG3mNTBEsNN3bkoxRc=;
	b=oymUnni4kNWmPEIelR5mS2wwleMCl4y9ygYLw1Flx8BSdixY+FXRd/N0+0lL7BiKWUEIXU
	VQVyqAJQNo5Vmblp4RvVau0YF/WBlwuXHSohAjYPPqgRL3c43UN/iHrZ+OoZvM6UzcpZeI
	9wqyEGHZtILcxVcFsEPmW4HLvVwMXa01Xz5lotXGdGuNEikp4J6Fl9y7FyCgXHr7KbS3N0
	EBjYFY5O2oloaVsgU2yWJfHx63hZPS4AbtAZeuDhjbkA+CtCRLIQZcJQY1Q2nCiOwo19uB
	DERwt5uadWCjLmaeFymG5UzneYjMZHnxPuUFOdTKwbPz09ccuHGzfxQC5ErFgQ==
From: "Philip Lorenz" <philip@bithub.de>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip@bithub.de>
Subject: [pseudo][PATCH] test: Add missing test-statx test case
Date: Wed, 11 Aug 2021 18:41:32 +0200
Message-Id: <20210811164132.74849-1-philip@bithub.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adding this test case was erroneously omitted in
7c722296879906fe093e1e7c4b7537e150d492cd.

Signed-off-by: Philip Lorenz <philip@bithub.de>
---
 test/test-statx.c  | 20 ++++++++++++++++++++
 test/test-statx.sh |  6 ++++++
 2 files changed, 26 insertions(+)
 create mode 100644 test/test-statx.c
 create mode 100755 test/test-statx.sh

diff --git a/test/test-statx.c b/test/test-statx.c
new file mode 100644
index 0000000..06d86af
--- /dev/null
+++ b/test/test-statx.c
@@ -0,0 +1,20 @@
+/*
+ * Test that passing NULL to a parameter marked as nonnull works correct=
ly
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ */
+#define _GNU_SOURCE
+
+#include <sys/stat.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+// Passing a null pointer is the test scenario
+#pragma GCC diagnostic ignored "-Wnonnull"
+
+int main(void) {
+    if (statx(0, NULL, 0, 0, NULL) !=3D -1) {
+        return 1;
+    }
+    return 0;
+}
diff --git a/test/test-statx.sh b/test/test-statx.sh
new file mode 100755
index 0000000..77d0302
--- /dev/null
+++ b/test/test-statx.sh
@@ -0,0 +1,6 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+
+exec ./test/test-statx
--=20
2.32.0

