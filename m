Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90127C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 06:50:38 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1834.1788418221482352976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 23:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=YkEML6bW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026090306501780aa9d8b1400020737-wkczz_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026090306501780aa9d8b1400020737
        for <openembedded-core@lists.openembedded.org>;
        Thu, 03 Sep 2026 08:50:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=G/oRBSkxW3LB2dvANkU/d71uKWFQgHE4e9YdiQxoIrM=;
 b=YkEML6bWVFQ3z9o45td9BxprpsInDb1/W3cUtcVTvIi6rSY/G+zw9eMr8LSaXQdYvxBw9B
 0yuyWgwE6dRh6Q5HnQXtiYyGbLtZGRyDO8PPvh6cTtvOS9FhB963tRrYKp6sD/kqRlaQNdWz
 aYaSTVFn4aisullzBG6CUQafO31XAFt1EbHKL+d0YnNzGTAJveXdNAESIfhic4sgoYhxt7nC
 t36snnxpiLAyt+tKPomPPMSFfNcyuTgrdMQnG/pvBg4Imetn+TwM60hvGXv4dfhuZbZS/VbW
 g7eQTuNY7kWeBhVaC0i/JQbcz/6psheLFcepGlmlm63abRs1p66HxKUw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] devtool: ide-sdk: harden debug server startup wait
Date: Thu,  3 Sep 2026 08:50:08 +0200
Message-ID: <20260903065008.2632105-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 06:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245010

From: Adrian Freihofer <adrian.freihofer@siemens.com>

lldb-server failed to start within the shared 30s budget on the
autobuilder, reported as "lldb-server did not start on port 1234
after 300 retries" with an empty server log (process still starting,
not crashed). Give LldbServerConfig its own longer budget
(TARGET_START_RETRIES = 600, ~60s) instead of raising it for GDB too.

Also make the shared wait loop fail fast when the server process has
already exited, dumping its log immediately instead of only after the
full timeout elapses, and drop the now-stale comment in the gdbserver
readiness selftest wait about needing to exceed that budget.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index fd66060682..46d54f983e 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -125,13 +125,17 @@ class DebuggerCrossConfig:
         port = self.port(mode)
         dump_log = "cat %s >&2; " % log_file if log_file else ""
         cleanup = ""
+        died_check = ""
         if pid_var:
             cleanup = "kill \\$_%s 2>/dev/null; " % pid_var
+            died_check = (
+                "kill -0 \\$_%s 2>/dev/null || { %secho %s exited before it started listening on port %s >&2; exit 1; }; "
+                    % (pid_var, dump_log, self.DEBUG_SERVER_NAME, port))
         return (
-            "_w=0; while ! %s; do _w=\\$((_w+1)); [ \\$_w -lt %d ] || { "
+            "_w=0; while ! %s; do %s_w=\\$((_w+1)); [ \\$_w -lt %d ] || { "
             "%secho %s did not start on port %s after \\$_w retries >&2; %sexit 1; }; "
             "sleep 0.1; done;"
-                % (self._target_tcp_port_check_cmd(mode), self.TARGET_START_RETRIES,
+                % (self._target_tcp_port_check_cmd(mode), died_check, self.TARGET_START_RETRIES,
                     cleanup, self.DEBUG_SERVER_NAME, port, dump_log))
 
     def _target_wait_for_process_exit_cmd(self, pid_var):
@@ -268,6 +272,7 @@ class LldbServerConfig(DebuggerCrossConfig):
     PID argument; attaching is done client-side via 'process attach'.
     """
     DEBUG_SERVER_NAME = "lldb-server"
+    TARGET_START_RETRIES = 600
 
     def __init__(self, image_recipe, modified_recipe, binary,
                  default_mode=DebuggerServerModes.MULTI):
-- 
2.55.0


