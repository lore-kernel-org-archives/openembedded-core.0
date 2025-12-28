Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8652AE9271B
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 18:09:56 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28963.1766945391866809577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Dec 2025 10:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=NoEpTmdi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20251228180948a9e9942d2c00020780-fepu_6@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20251228180948a9e9942d2c00020780
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Dec 2025 19:09:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lg+S77c2Mzt0DVLdY4KAC1dkD0A9Cxe2KsC28dDRYL0=;
 b=NoEpTmdiZBul8vcxuEwKHXnfau133HTAsBUSi4BzJhPexWc9TRNaYXsw+0DvPqyIs4ZoPh
 dTXcDTnxiflgokjiK7krsGB15GJFgD9AmSjyjv6gbdIPuJX668YxKohexqdHaCNlmERmoEjh
 Kkn2tR0t14422ZD54/LXSA+Gdqkc7W5yip2WexX/Wb7ve7PisA4fUirpv+UJEVIl4fw5ZJll
 DIlpE4lNEglfv4rA+bRPUdAxBaQyejj3Ucmqk8aZWTNPeEYY+bTh9ZVKrFr/Az6Go+j3574J
 Xh2HKrRb2+vqRZWxExlsDAmlmi8cnlIgubcMhBkFPKkCH8ysT1FX5X6g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/3] oe-selftest: case: support fragments in write_config
Date: Sun, 28 Dec 2025 19:08:32 +0100
Message-ID: <20251228180935.2077478-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
References: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 18:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228588

From: Adrian Freihofer <adrian.freihofer@siemens.com>

When writing configuration files during selftests, also handle the
inclusion of fragment files via the toolcfg.conf mechanism.

By default the toolcfg.conf file from build/conf/toolcfg.conf is copied
to build-st/conf/toolcfg.conf. This comes with a risk for using fragments
by accident from the main build in the selftest build. To avoid this,
support writing a reproducible set of fragments per selftest case via
the write_config() method.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/case.py    | 9 ++++++++-
 meta/lib/oeqa/selftest/context.py | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index da35b25f68..148b120371 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -30,6 +30,7 @@ class OESelftestTestCase(OETestCase):
 
         cls.localconf_path = cls.tc.config_paths['localconf']
         cls.local_bblayers_path = cls.tc.config_paths['bblayers']
+        cls.toolcfgconf_path = cls.tc.config_paths['toolcfgconf']
 
         cls.testinc_path = os.path.join(cls.tc.config_paths['builddir'],
                 "conf/selftest.inc")
@@ -161,7 +162,7 @@ class OESelftestTestCase(OETestCase):
         self.logger.debug("Adding path '%s' to be cleaned up when test is over" % path)
         self._track_for_cleanup.append(path)
 
-    def write_config(self, data, multiconfig=None):
+    def write_config(self, data, multiconfig=None, fragments=None):
         """Write to config file"""
         if multiconfig:
             multiconfigdir = "%s/conf/multiconfig" % self.builddir
@@ -174,6 +175,12 @@ class OESelftestTestCase(OETestCase):
         self.logger.debug("Writing to: %s\n%s\n" % (dest_path, data))
         ftools.write_file(dest_path, data)
 
+        if fragments:
+            toolscfg_str = '# Added by oe-selftest' + os.linesep + \
+                'OE_FRAGMENTS += "' + ' '.join(fragments) + '"' + os.linesep
+            self.logger.debug("Over writing fragments: %s\n%s" % (self.toolcfgconf_path, toolscfg_str))
+            ftools.write_file(self.toolcfgconf_path, toolscfg_str)
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


