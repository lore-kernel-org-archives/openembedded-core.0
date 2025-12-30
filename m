Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C2FE95A7A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 10:56:40 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62164.1767092191521176381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 02:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=LBf6Jb1K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-2025123010562894f17df8f0000207bf-3_4k0_@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025123010562894f17df8f0000207bf
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 11:56:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nQZgkb0OchN0+PkJ76yEPFyAFAeYJ7jTh6PN+GmvjDg=;
 b=LBf6Jb1K88xqHYiAWS2ESneFc6/03QbjXg7RZYkqAWDif+OLXH0SimogjMDOXawNbG+NrS
 8szrEYqFeQGX6RpXvJxUBf0Lw3oNuGnh6n9tGTH7ErQ1peUcqaBT5j6sEjsfjZThDT00gxsP
 nzpfslqej1rzbuNnX0RHees8Q8gEFQSC5WsUjTrLBYJ2BxzrxOzEWlMLYLp98NNMlTLsvgd6
 /64wRx576ScRUCpM7Ktxm6W6oSC/R2CdSVUzUUfHWGeLmCl52+vBA+45HT7bR6oBOCqIiyux
 i0uHpRj6o38LNUNEhVskGYpLXifAdLvLbP0HUNOES8iEL31sTMoknfvg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 2/4] oe-selftest: case: support fragments
Date: Tue, 30 Dec 2025 11:52:57 +0100
Message-ID: <20251230105607.2615849-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
References: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228657

From: Adrian Freihofer <adrian.freihofer@siemens.com>

By default the toolcfg.conf file from build/conf/toolcfg.conf is copied
to build-st/conf/toolcfg.conf. Provide an easy way to add fragments
to the toolcfg.conf file from within oe-selftest test cases.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/case.py    | 28 ++++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/context.py |  1 +
 2 files changed, 29 insertions(+)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index da35b25f68..96898411c3 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -8,6 +8,7 @@ import sys
 import os
 import glob
 import errno
+import shutil
 from unittest.util import safe_repr
 
 import oeqa.utils.ftools as ftools
@@ -19,6 +20,7 @@ import bb.utils
 class OESelftestTestCase(OETestCase):
     def __init__(self, methodName="runTest"):
         self._extra_tear_down_commands = []
+        self._toolcfgconf_backup = None
         super(OESelftestTestCase, self).__init__(methodName)
 
     @classmethod
@@ -30,6 +32,7 @@ class OESelftestTestCase(OETestCase):
 
         cls.localconf_path = cls.tc.config_paths['localconf']
         cls.local_bblayers_path = cls.tc.config_paths['bblayers']
+        cls.toolcfgconf_path = cls.tc.config_paths['toolcfgconf']
 
         cls.testinc_path = os.path.join(cls.tc.config_paths['builddir'],
                 "conf/selftest.inc")
@@ -137,6 +140,10 @@ class OESelftestTestCase(OETestCase):
                 self.logger.debug("Trying to move on.")
             self._extra_tear_down_commands = []
 
+        # Restore toolcfgconf backup
+        if self._toolcfgconf_backup and os.path.exists(self._toolcfgconf_backup):
+            shutil.copy2(self._toolcfgconf_backup, self.toolcfgconf_path)
+
         if self._track_for_cleanup:
             for path in self._track_for_cleanup:
                 if os.path.isdir(path):
@@ -174,6 +181,27 @@ class OESelftestTestCase(OETestCase):
         self.logger.debug("Writing to: %s\n%s\n" % (dest_path, data))
         ftools.write_file(dest_path, data)
 
+    def configure_fragments(self, enable_fragments=None, disable_fragments=None):
+        """Configure fragments using bitbake-config-build tool"""
+        existed = os.path.exists(self.toolcfgconf_path)
+        # If there was an existing toolcfg.conf, back it up and restore it in tearDown
+        if existed:
+            backup_path = self.toolcfgconf_path + ".oe-selftest-bak"
+            shutil.copy2(self.toolcfgconf_path, backup_path)
+            self._toolcfgconf_backup = backup_path
+            self.track_for_cleanup(backup_path)
+
+        if enable_fragments:
+            cmd = 'bitbake-config-build enable-fragment ' + ' '.join(enable_fragments)
+            runCmd(cmd)
+        if disable_fragments:
+            cmd = 'bitbake-config-build disable-fragment ' + ' '.join(disable_fragments)
+            runCmd(cmd)
+
+        # If there was no existing toolcfg.conf before, track the new one for cleanup
+        if not existed and os.path.exists(self.toolcfgconf_path):
+            self.track_for_cleanup(self.toolcfgconf_path)
+
     def append_config(self, data):
         """Append to <builddir>/conf/selftest.inc"""
         self.logger.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c9eb481725..02a4832553 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -278,6 +278,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc_kwargs['init']['config_paths']['builddir'] = builddir
         self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
         self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
+        self.tc_kwargs['init']['config_paths']['toolcfgconf'] = os.path.join(builddir, "conf/toolcfg.conf")
         self.tc_kwargs['init']['newbuilddir'] = args.newbuilddir
         self.tc_kwargs['init']['keep_builddir'] = args.keep_builddir
 
-- 
2.52.0


