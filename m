Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549B2C88E42
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81.1788990824466403916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=NBmnCRA/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260909215343d9485539f600020750-cqh4w6@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260909215343d9485539f600020750
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+3VPKBmLBnTNSbnibqNqcc0BpCniONJAWDyB1eh43rM=;
 b=NBmnCRA/1yrWAD70/tNI5YA/5aewZeX/yNzLGIlwtv6w+QTH8lzNCIcbSbAaIwKzK2JN2T
 LU6jjjlw2OwoFUBG6o0jFl6bmOmWqJ0zMkO8iYYWSYadhwKKDnbnMbcNfZKJCbmcdi868pzu
 DM58ECxibqPspvoMqPlwxcUjzZanZfTxItkxc8PRi/uBAnBqXRxNKkOdLtj3hxHGpaSXOWAJ
 9VOXtoy2lsaPm5d/uu7M3j9/xOStD6WDXAKgABaYFtM4ZvYZOi3FfO878nkUbo9mFmfNPkYq
 +d45qRWN2Nnp0j652L3g8rflAPwnrm4sBpDP0Ci83xnireGya2MMwz/A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 15/15] buildstats: close proc/disk log files via weakref.finalize safety net
Date: Wed,  9 Sep 2026 23:53:15 +0200
Message-ID: <20260909215337.89106-16-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245517

From: Adrian Freihofer <adrian.freihofer@siemens.com>

SystemStats.close() is normally invoked by the buildstats.bbclass handler
on bb.event.BuildCompleted, but that event is skipped for internal,
event-less task runs (e.g. tinfoil's run_prepared_task(), used by
devtool ide-sdk). Without a BuildCompleted event, the open proc/disk log
files were only closed implicitly at GC/interpreter-exit time, causing a
ResourceWarning for leaked file handles.

Register a weakref.finalize() callback at construction time as a safety
net. close() now just triggers the finalizer, which is idempotent and
keeps no reference back to SystemStats itself.

AI-Generated: Uses GitHub Copilot

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oe/buildstats.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildstats.py b/meta/lib/oe/buildstats.py
index db3d26afb8..56228246e4 100644
--- a/meta/lib/oe/buildstats.py
+++ b/meta/lib/oe/buildstats.py
@@ -10,6 +10,7 @@
 import os
 import time
 import re
+import weakref
 import bb.event
 from collections import deque
 
@@ -56,6 +57,12 @@ class SystemStats:
                     destfile = os.path.join(bsdir, '%sproc_%s.log' % ('reduced_' if handler else '', filename))
                 self.proc_files.append((filename, open(destfile, 'ab'), handler))
         self.monitor_disk = open(os.path.join(bsdir, 'monitor_disk.log'), 'ab')
+        # Safety net: normally close() is called when bb.event.BuildCompleted
+        # fires, but that event is skipped for internal, event-less task runs
+        # (e.g. tinfoil's run_prepared_task()). Without this, the open files
+        # would only get closed implicitly at GC/interpreter-exit time,
+        # triggering a ResourceWarning.
+        self._finalizer = weakref.finalize(self, self._close_files, self.proc_files, self.monitor_disk)
         # Last time that we sampled /proc data resp. recorded disk monitoring data.
         self.last_proc = 0
         self.last_disk_monitor = 0
@@ -81,8 +88,12 @@ class SystemStats:
         self.net_stats = {}
 
     def close(self):
-        self.monitor_disk.close()
-        for _, output, _ in self.proc_files:
+        self._finalizer()
+
+    @staticmethod
+    def _close_files(proc_files, monitor_disk):
+        monitor_disk.close()
+        for _, output, _ in proc_files:
             output.close()
 
     def _reduce_meminfo(self, time, data, filename):
-- 
2.55.0


