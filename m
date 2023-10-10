Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A606CD80C2
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 12:37:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89851.1696941421107502544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 05:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7904B1FB;
	Tue, 10 Oct 2023 05:37:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49B0C3F7A6;
	Tue, 10 Oct 2023 05:37:00 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/5] oeqa/runtime/_qemutiny: rewrite test to be functional
Date: Tue, 10 Oct 2023 13:36:53 +0100
Message-Id: <20231010123653.166806-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010123653.166806-1-ross.burton@arm.com>
References: <20231010123653.166806-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 12:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188887

From: Ross Burton <ross.burton@arm.com>

The _qemutiny is a small test case that was explicitly designed to do a
minimal level of testing for poky-tiny images.  These typically don't
have SSH servers so we need to assume that qemu is being used and access
the serial console directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/_qemutiny.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/_qemutiny.py b/meta/lib/oeqa/run=
time/cases/_qemutiny.py
index 14ff8b98b22..816fd4a7cb5 100644
--- a/meta/lib/oeqa/runtime/cases/_qemutiny.py
+++ b/meta/lib/oeqa/runtime/cases/_qemutiny.py
@@ -5,10 +5,15 @@
 #
=20
 from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.target.qemu import OEQemuTarget
=20
 class QemuTinyTest(OERuntimeTestCase):
=20
     def test_boot_tiny(self):
-        status, output =3D self.target.run_serial('uname -a')
-        msg =3D "Cannot detect poky tiny boot!"
-        self.assertTrue("yocto-tiny" in output, msg)
+        # Until the target has explicit run_serial support, check that t=
he
+        # target is the qemu runner
+        if isinstance(self.target, OEQemuTarget):
+            status, output =3D self.target.runner.run_serial('uname -a')
+            self.assertIn("Linux", output)
+        else:
+            self.skipTest("Target %s is not OEQemuTarget" % self.target)
--=20
2.34.1


