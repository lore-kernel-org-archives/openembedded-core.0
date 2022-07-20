Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F26FC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 11:00:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.52289.1658314797216441751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 03:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22CC81042;
	Wed, 20 Jul 2022 03:59:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C5F93F73D;
	Wed, 20 Jul 2022 03:59:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/runtime: add test that the kernel has CONFIG_PREEMPT_RT
 enabled
Date: Wed, 20 Jul 2022 11:59:52 +0100
Message-Id: <20220720105952.1475782-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 11:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168358

This is the absolute bare minimum for testing the RT patches, but it
does mean we if we build and boot a RT kernel we can verify that it is
what we expect.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/rt.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/rt.py

diff --git a/meta/lib/oeqa/runtime/cases/rt.py b/meta/lib/oeqa/runtime/ca=
ses/rt.py
new file mode 100644
index 00000000000..849ac1914e8
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/rt.py
@@ -0,0 +1,17 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+class RtTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_is_rt(self):
+        """
+        Check that the kernel has CONFIG_PREEMPT_RT enabled.
+        """
+        status, output =3D self.target.run("uname -a")
+        self.assertEqual(status, 0, msg=3Doutput)
+        # Split so we don't get a substring false-positive
+        self.assertIn("PREEMPT_RT", output.split())
--=20
2.34.1


