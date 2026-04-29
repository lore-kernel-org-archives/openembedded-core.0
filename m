Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3A6CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 14:32:04 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12790.1777473119038158717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 07:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 29 Apr 2026 23:31:57 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 29 Apr 2026 23:31:57 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH 2/3] oeqa/selftest/pkgdata: add multilib LICENSE consistency test
Date: Wed, 29 Apr 2026 23:31:03 +0900
Message-ID: <20260429143104.684760-3-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429143104.684760-1-jaeyoon.jung@lge.com>
References: <20260429143104.684760-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 14:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236107

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Add a selftest to verify that pkgdata variables such as LICENSE
are identical between base and multilib variants (e.g. lib32).

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index d786c33018..d3d38e7419 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -225,3 +225,18 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
         currpos = result.output.find('usage: oe-pkgdata-util')
         self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not Displayed in %s" % result.output)
+
+    def test_multilib_variables(self):
+        self.write_config("""
+MACHINE = "qemux86-64"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
+""")
+        self.logger.info("Build with multilib lib32 enabled")
+        bitbake('systemd lib32-systemd')
+        pkg = runCmd('oe-pkgdata-util lookup-pkg libsystemd').output
+        pkg_lib32 = runCmd('oe-pkgdata-util lookup-pkg lib32-libsystemd').output
+        license = runCmd('oe-pkgdata-util read-value LICENSE %s' % pkg).output
+        license_lib32 = runCmd('oe-pkgdata-util read-value LICENSE %s' % pkg_lib32).output
+        self.assertEqual(license, license_lib32)

