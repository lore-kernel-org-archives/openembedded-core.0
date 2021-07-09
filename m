Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.16988.1625864035917171466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 13:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 169Krqe5019046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jul 2021 13:53:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 9 Jul 2021 13:53:52 -0700
Received: from localhost.localdomain (128.224.72.142) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 9 Jul 2021 13:53:51 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] buildstats.bbclass: log host data on failure to task specific file
Date: Fri, 9 Jul 2021 16:53:43 -0400
Message-ID: <20210709205344.233257-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

host data, for both interval and failure, was previously
logged into the same file which was difficult to read
as the files file were usually large.

host data is now logged into separate files, for each
type of logging (failure and interval) and also for each
failed task making it easier to read/parse.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/classes/buildstats.bbclass | 44 +++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 8a1466d3fec..0de605200a8 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -108,25 +108,31 @@ def write_host_data(logfile, e, d, type):
     import subprocess, os, datetime
     # minimum time allowed for each command to run, in seconds
     time_threshold = 0.5
+    limit = 10
     # the total number of commands
     num_cmds = 0
-    # interval at which data will be logged
-    interval = int(d.getVar("BB_HEARTBEAT_EVENT", False))
     msg = ""
     if type == "interval":
+        # interval at which data will be logged
+        interval = d.getVar("BB_HEARTBEAT_EVENT", False)
+        if interval is None:
+            bb.warn("buildstats: Collecting host data at intervals failed. Set BB_HEARTBEAT_EVENT=\"<interval>\" in conf/local.conf for the interval at which host data will be logged.")
+            d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+            return
+        interval = int(interval)
         cmds = d.getVar('BB_LOG_HOST_STAT_CMDS_INTERVAL')
-        msg = "Host Stats: Collecting data at interval.\n"
+        msg = "Host Stats: Collecting data at %d second intervals.\n" % interval
         if cmds is None:
             d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
-            bb.warn("buildstats: Collecting host data at intervals failed. Set BB_LOG_HOST_STAT_CMDS_INTERVAL=\"command1 ; command2 ; ... \" in conf/local.conf\n")
+            bb.warn("buildstats: Collecting host data at intervals failed. Set BB_LOG_HOST_STAT_CMDS_INTERVAL=\"command1 ; command2 ; ... \" in conf/local.conf.")
             return
     if type == "failure":
         cmds = d.getVar('BB_LOG_HOST_STAT_CMDS_FAILURE')
         msg = "Host Stats: Collecting data on failure.\n"
-        msg += "Failed at task " + e.task + "\n"
+        msg += "Failed at task: " + e.task + "\n"
         if cmds is None:
             d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
-            bb.warn("buildstats: Collecting host data on failure failed. Set BB_LOG_HOST_STAT_CMDS_FAILURE=\"command1 ; command2 ; ... \" in conf/local.conf\n")
+            bb.warn("buildstats: Collecting host data on failure failed. Set BB_LOG_HOST_STAT_CMDS_FAILURE=\"command1 ; command2 ; ... \" in conf/local.conf.")
             return
     c_san = []
     for cmd in cmds.split(";"):
@@ -134,18 +140,20 @@ def write_host_data(logfile, e, d, type):
             continue
         num_cmds += 1
         c_san.append(cmd)
-    if num_cmds <= 0:
-        d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
-        d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
+    if num_cmds == 0:
+        if type == "interval":
+            d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+        if type == "failure":
+            d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
         return
 
     # return if the interval is not enough to run all commands within the specified BB_HEARTBEAT_EVENT interval
-    limit = interval / num_cmds
-    if limit <= time_threshold:
-        d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
-        d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
-        bb.warn("buildstats: Collecting host data failed. BB_HEARTBEAT_EVENT interval not enough to run the specified commands. HINT: Increase value of BB_HEARTBEAT_EVENT in conf/local.conf\n")
-        return
+    if type == "interval":
+        limit = interval / num_cmds
+        if limit <= time_threshold:
+            d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+            bb.warn("buildstats: Collecting host data failed. BB_HEARTBEAT_EVENT interval not enough to run the specified commands. Increase value of BB_HEARTBEAT_EVENT in conf/local.conf.")
+            return
 
     # set the environment variables 
     path = d.getVar("PATH")
@@ -179,7 +187,7 @@ python run_buildstats () {
         taskdir = os.path.join(bsdir, d.getVar('PF'))
         if isinstance(e, bb.event.HeartbeatEvent) and bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_INTERVAL")):
             bb.utils.mkdirhier(bsdir)
-            write_host_data(os.path.join(bsdir, "host_stats"), e, d, "interval")
+            write_host_data(os.path.join(bsdir, "host_stats_interval"), e, d, "interval")
 
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
@@ -254,8 +262,8 @@ python run_buildstats () {
         build_status = os.path.join(bsdir, "build_stats")
         with open(build_status, "a") as f:
             f.write(d.expand("Failed at: ${PF} at task: %s \n" % e.task))
-            if bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_FAILURE")):
-                write_host_data(os.path.join(bsdir, "host_stats"), e, d, "failure")
+        if bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_FAILURE")):
+            write_host_data(os.path.join(bsdir, "host_stats_%s_failure" % e.task), e, d, "failure")
 }
 
 addhandler run_buildstats
-- 
2.25.1

