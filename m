Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF2ECD3427
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 03:12:05 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41905.1778469116639194883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 20:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 11 May 2026 12:11:55 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.125 with ESMTP; 11 May 2026 12:11:55 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v3 2/2] oeqa/selftest/pkgdata: add a test for variable consistency in multilib
Date: Mon, 11 May 2026 12:11:51 +0900
Message-ID: <20260511031151.946905-3-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511031151.946905-1-jaeyoon.jung@lge.com>
References: <20260511031151.946905-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 03:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236774

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

There was a case where a package's LICENSE in a multilib build is not
expanded properly and it ends up with fallback to the main LICENSE value
which is unexpected. This adds a selftest for that; verify the pkgdata
variable LICENSE is identical between the base and multilib packages.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
Changes in v3:
- Set INIT_MANAGER to systemd
- Use a list of recipe and package to test
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index d786c33018..69196ccf12 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -225,3 +225,26 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
         currpos = result.output.find('usage: oe-pkgdata-util')
         self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not Displayed in %s" % result.output)
+
+    def test_multilib_variables(self):
+        # Set up a lib32 multilib configuration
+        self.write_config("""
+MACHINE:forcevariable = "qemux86-64"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES:append = " systemd usrmerge"
+""")
+        # Verify pkgdata variable LICENSE is identical between the base
+        # and multilib packages for selected recipes/packages below.
+        test_list = [
+            ('systemd', 'libsystemd')
+        ]
+        for recipe, package in test_list:
+            bitbake(f'{recipe} lib32-{recipe}')
+            pkg = runCmd(f'oe-pkgdata-util lookup-pkg {package}').output
+            pkg_lib32 = runCmd(f'oe-pkgdata-util lookup-pkg lib32-{package}').output
+            lic = runCmd(f'oe-pkgdata-util read-value LICENSE {pkg}').output
+            lic_lib32 = runCmd(f'oe-pkgdata-util read-value LICENSE {pkg_lib32}').output
+            self.assertEqual(lic, lic_lib32)

