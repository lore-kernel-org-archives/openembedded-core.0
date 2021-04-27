Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.2871.1619558357932808251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 14:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13RLJGNb018440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 14:19:16 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 27 Apr 2021 14:19:15 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 27 Apr 2021 14:19:15 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] buildstats.bbclass: collect data in the same file.
Date: Tue, 27 Apr 2021 17:19:08 -0400
Message-ID: <20210427211908.2169-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Previously "at interval" and "on failure" logs were collected
in separate files. Collect both types of logging in the same
file for better analysis.

Introduced new variable which allows different set of commands
to be run by the different logging, interval or failure. The
variables are BB_LOG_HOST_STAT_CMDS_INTERVAL and
BB_LOG_HOST_STAT_CMDS_FAILURE respecteviely.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/classes/buildstats.bbclass | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 8e03039aeb..8a1466d3fe 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -104,7 +104,7 @@ def write_task_data(status, logfile, e, d):
             f.write("Status: FAILED \n")
         f.write("Ended: %0.2f \n" % e.time)
 
-def write_host_data(logfile, e, d):
+def write_host_data(logfile, e, d, type):
     import subprocess, os, datetime
     # minimum time allowed for each command to run, in seconds
     time_threshold = 0.5
@@ -112,15 +112,22 @@ def write_host_data(logfile, e, d):
     num_cmds = 0
     # interval at which data will be logged
     interval = int(d.getVar("BB_HEARTBEAT_EVENT", False))
-    # the commands to be run at each interval
-    cmds = d.getVar('BB_LOG_HOST_STAT_CMDS')
-    # if no commands are passed, issue a warning and return
-    if cmds is None:
-        d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
-        d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
-        bb.warn("buildstats: Collecting host data failed. Set BB_LOG_HOST_STAT_CMDS=\"command1 ; command2 ; ... \" in conf/local.conf\n")
-        return
-    # find the total commands
+    msg = ""
+    if type == "interval":
+        cmds = d.getVar('BB_LOG_HOST_STAT_CMDS_INTERVAL')
+        msg = "Host Stats: Collecting data at interval.\n"
+        if cmds is None:
+            d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+            bb.warn("buildstats: Collecting host data at intervals failed. Set BB_LOG_HOST_STAT_CMDS_INTERVAL=\"command1 ; command2 ; ... \" in conf/local.conf\n")
+            return
+    if type == "failure":
+        cmds = d.getVar('BB_LOG_HOST_STAT_CMDS_FAILURE')
+        msg = "Host Stats: Collecting data on failure.\n"
+        msg += "Failed at task " + e.task + "\n"
+        if cmds is None:
+            d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
+            bb.warn("buildstats: Collecting host data on failure failed. Set BB_LOG_HOST_STAT_CMDS_FAILURE=\"command1 ; command2 ; ... \" in conf/local.conf\n")
+            return
     c_san = []
     for cmd in cmds.split(";"):
         if len(cmd) == 0:
@@ -147,6 +154,7 @@ def write_host_data(logfile, e, d):
     os.environ['PATH'] = path + ":" + opath + ":" + ospath
     with open(logfile, "a") as f:
         f.write("Event Time: %f\nDate: %s\n" % (e.time, datetime.datetime.now()))
+        f.write("%s" % msg)
         for c in c_san:
             try:
                 output = subprocess.check_output(c.split(), stderr=subprocess.STDOUT, timeout=limit).decode('utf-8')
@@ -171,7 +179,7 @@ python run_buildstats () {
         taskdir = os.path.join(bsdir, d.getVar('PF'))
         if isinstance(e, bb.event.HeartbeatEvent) and bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_INTERVAL")):
             bb.utils.mkdirhier(bsdir)
-            write_host_data(os.path.join(bsdir, "host_stats"), e, d)
+            write_host_data(os.path.join(bsdir, "host_stats"), e, d, "interval")
 
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
@@ -247,7 +255,7 @@ python run_buildstats () {
         with open(build_status, "a") as f:
             f.write(d.expand("Failed at: ${PF} at task: %s \n" % e.task))
             if bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_FAILURE")):
-                write_host_data(build_status, e, d)
+                write_host_data(os.path.join(bsdir, "host_stats"), e, d, "failure")
 }
 
 addhandler run_buildstats
-- 
2.29.2

