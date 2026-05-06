Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6027CD343F
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 17:24:45 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24250.1778088282546086268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 10:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 7 May 2026 02:24:41 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.151 with ESMTP; 7 May 2026 02:24:41 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v2 2/2] oeqa/selftest/pkgdata: add a test for variable consistency in multilib
Date: Thu,  7 May 2026 02:24:15 +0900
Message-ID: <20260506172416.4017418-3-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506172416.4017418-1-jaeyoon.jung@lge.com>
References: <20260506172416.4017418-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 17:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236547

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Add a selftest to verify that the pkgdata variable LICENSE is identical
between libsystemd and lib32-libsystemd.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index d786c33018..357578a240 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -225,3 +225,21 @@ class OePkgdataUtilTests(OESelftestTestCase):
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
+DISTRO_FEATURES:append = " systemd usrmerge"
+""")
+        # Build systemd and lib32-systemd to get their pkgdata
+        bitbake('systemd lib32-systemd')
+        # Verify that LICENSE values of libsystemd and lib32-libsystemd are the same
+        pkg = runCmd('oe-pkgdata-util lookup-pkg libsystemd').output
+        pkg_lib32 = runCmd('oe-pkgdata-util lookup-pkg lib32-libsystemd').output
+        license = runCmd('oe-pkgdata-util read-value LICENSE %s' % pkg).output
+        license_lib32 = runCmd('oe-pkgdata-util read-value LICENSE %s' % pkg_lib32).output
+        self.assertEqual(license, license_lib32)

