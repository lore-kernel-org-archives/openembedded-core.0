Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F575EA852C
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:15:24 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40616.1772982922970378388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=AAlUm5dR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202603081515199179c7eca40002077f-oqjm6c@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202603081515199179c7eca40002077f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Mar 2026 16:15:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qSlnxVfVKuXrU6KO7QdD9NGWypc8MYk3KbrUM/oe3ug=;
 b=AAlUm5dRI6viKqW72QS2NRoAfhjp4w4Zrmad8LIG7E0k75g+Wxw8gDqn7ktrRKUlY2Rck0
 wkmpfIdITBidvU/mPD9yS1C07wEYim22abN/4a14O2+qDZfcXT3Us1JHFcb1JqKnOU2JSkW4
 +M/CTPDCAGhEtlxlbR/suDNYXRE0wYIGmMNG9lwKnDu6hHjP79tzZfgsfSaxNAO+tkp+MYEw
 P/FBv/Z7PIRPBuAc5CfTaagkr7n2Ay062t8EV024IYnscC7J1m4BwKBbfBFjy36qXrk7O5vy
 BRus/cRufQH7Y1wGN8BKiDuOig2aHFeMUqOUg/mBHQJPRM2vVWNfTPWQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] selftest/glibc: add docstrings to the selftest classes
Date: Sun,  8 Mar 2026 16:15:07 +0100
Message-ID: <20260308151507.185124-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232660

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add docstrings to GlibcSelfTest classes and comments to the
glibc-testsuite recipe explaining how this test concept works.

This commit does not change the code itself.

Related [Yocto #16113]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py         | 30 +++++++++++++++++
 .../glibc/glibc-testsuite_2.42.bb             | 32 +++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index b2b115972f..a65afb1367 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -20,6 +20,36 @@ def parse_values(content):
                 break
 
 class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
+    """
+    Base class for running the glibc test suite (bitbake glibc-testsuite -c check).
+
+    The glibc-testsuite recipe cross-compiles the glibc tests, which are then
+    executed via Autotools' make check. The check-test-wrapper script dispatches
+    each individual test to either QEMU user-space emulation or a remote SSH
+    target, depending on TOOLCHAIN_TEST_TARGET. For more details see the
+    do_check task of the glibc-testsuite recipe.
+
+    Unlike ptests, the glibc tests are not installed via do_install but instead
+    run in-place directly from the build directory (B). This is true for both
+    execution modes implemented by this base class via run_check():
+
+    User-space mode (ssh=None):
+        TOOLCHAIN_TEST_TARGET is left at its default ("user"), so
+        check-test-wrapper runs each test binary under QEMU user-space
+        emulation against the target sysroot. Results are collected under
+        the ptest suite name "glibc-user".
+
+    SSH/system mode (ssh=<ip>):
+        TOOLCHAIN_TEST_TARGET is set to "ssh" and the SSH connection details
+        (host, user, port) are configured so check-test-wrapper forwards each
+        test to the remote target over SSH. Since the tests run from the build
+        directory, that directory must be accessible on the target, which is
+        achieved by NFS-mounting it into the QEMU system running core-image-minimal.
+        Results are collected under the ptest suite name "glibc".
+
+    In both modes, results are parsed from the tests.sum file produced by
+    make check and recorded via the OEPTestResultTestCase ptest helpers.
+    """
     def run_check(self, ssh = None):
         # configure ssh target
         features = []
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
index 6477612feb..28af6961c3 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
@@ -1,3 +1,35 @@
+# Recipe for cross-compiling and running the glibc test suite.
+#
+# Unlike regular recipes, this recipe does not install any files (do_install
+# and do_populate_sysroot are disabled). Instead, the tests are run in-place
+# from the build directory (B) via the do_check task:
+#
+#   bitbake glibc-testsuite -c check
+#
+# This is driven by the OE selftest in meta/lib/oeqa/selftest/cases/glibc.py,
+# which supports two execution modes controlled by TOOLCHAIN_TEST_TARGET:
+#
+#   user (default):
+#     Each test binary is run under QEMU user-space emulation on the host,
+#     using the target sysroot. qemu-native is added to DEPENDS automatically.
+#
+#   ssh:
+#     Each test binary is executed on a remote target over SSH. The caller
+#     must set TOOLCHAIN_TEST_HOST, TOOLCHAIN_TEST_HOST_USER and
+#     TOOLCHAIN_TEST_HOST_PORT. In the emulated selftest variant, the target
+#     is a QEMU system (core-image-minimal) with the host build directory
+#     NFS-mounted at the same path, so the tests can access their binaries
+#     and data files directly.
+#
+# In both modes the check-test-wrapper script is passed as Autotools'
+# test-wrapper, which intercepts each test invocation and forwards it to
+# the appropriate execution backend.
+#
+# Running only specific tests is possible by using for example
+#   make test t=misc/tst-syslog
+# instead of
+#   make check
+
 require glibc_${PV}.bb
 require glibc-tests.inc
 
-- 
2.53.0


