Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AFAC7EE30
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:14:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2668.1750432478038425752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A6D16F2;
	Fri, 20 Jun 2025 08:14:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5DF33F673;
	Fri, 20 Jun 2025 08:14:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: christian.lindeberg@axis.com
Subject: [PATCH 04/12] oeqa/core/case: add file exists assertion
Date: Fri, 20 Jun 2025 16:14:21 +0100
Message-ID: <20250620151429.3210879-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620151429.3210879-1-ross.burton@arm.com>
References: <20250620151429.3210879-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 15:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219131

Add assertFileExists() to simply tests that want to check that a file
exists.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/case.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index bc4446a938e..ad5524a7142 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -5,6 +5,7 @@
 #
=20
 import base64
+import os
 import zlib
 import unittest
=20
@@ -57,6 +58,13 @@ class OETestCase(unittest.TestCase):
             d.tearDownDecorator()
         self.tearDownMethod()
=20
+    def assertFileExists(self, filename, msg=3DNone):
+        """
+        Test that filename exists. If it does not, the test will fail.
+        """
+        if not os.path.exists(filename):
+            self.fail(msg or "%s does not exist" % filename)
+
 class OEPTestResultTestCase:
     """
     Mix-in class to provide functions to make interacting with extraresu=
lts for
--=20
2.43.0


