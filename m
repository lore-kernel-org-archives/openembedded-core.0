Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.5513.1615274300708397170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 23:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1297I1nE008510
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Mar 2021 23:18:09 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Mar 2021 23:17:52 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 8 Mar 2021 23:17:52 -0800
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] buildstats.bbclass: improve timeout handling
Date: Tue, 9 Mar 2021 02:17:43 -0500
Message-ID: <20210309071743.32820-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The subprocess that runs the commands periodically
times out prematurely even when there is sufficient
time available within the given interval for the
commands to run.

This change improves timeout handling and give all the
commands equal time to run.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/classes/buildstats.bbclass | 42 +++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index a8ee6e69a6..8e03039aeb 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -106,26 +106,54 @@ def write_task_data(status, logfile, e, d):
 
 def write_host_data(logfile, e, d):
     import subprocess, os, datetime
+    # minimum time allowed for each command to run, in seconds
+    time_threshold = 0.5
+    # the total number of commands
+    num_cmds = 0
+    # interval at which data will be logged
+    interval = int(d.getVar("BB_HEARTBEAT_EVENT", False))
+    # the commands to be run at each interval
     cmds = d.getVar('BB_LOG_HOST_STAT_CMDS')
+    # if no commands are passed, issue a warning and return
     if cmds is None:
         d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
         d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
-        bb.warn("buildstats: Collecting host data failed. Set BB_LOG_HOST_STAT_CMDS=\"command1 ; command2 ; ... \" in conf\/local.conf\n")
+        bb.warn("buildstats: Collecting host data failed. Set BB_LOG_HOST_STAT_CMDS=\"command1 ; command2 ; ... \" in conf/local.conf\n")
         return
+    # find the total commands
+    c_san = []
+    for cmd in cmds.split(";"):
+        if len(cmd) == 0:
+            continue
+        num_cmds += 1
+        c_san.append(cmd)
+    if num_cmds <= 0:
+        d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+        d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
+        return
+
+    # return if the interval is not enough to run all commands within the specified BB_HEARTBEAT_EVENT interval
+    limit = interval / num_cmds
+    if limit <= time_threshold:
+        d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+        d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
+        bb.warn("buildstats: Collecting host data failed. BB_HEARTBEAT_EVENT interval not enough to run the specified commands. HINT: Increase value of BB_HEARTBEAT_EVENT in conf/local.conf\n")
+        return
+
+    # set the environment variables 
     path = d.getVar("PATH")
     opath = d.getVar("BB_ORIGENV", False).getVar("PATH")
     ospath = os.environ['PATH']
     os.environ['PATH'] = path + ":" + opath + ":" + ospath
     with open(logfile, "a") as f:
         f.write("Event Time: %f\nDate: %s\n" % (e.time, datetime.datetime.now()))
-        for cmd in cmds.split(";"):
-            if len(cmd) == 0:
-                continue
+        for c in c_san:
             try:
-                output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT, timeout=1).decode('utf-8')
+                output = subprocess.check_output(c.split(), stderr=subprocess.STDOUT, timeout=limit).decode('utf-8')
             except (subprocess.CalledProcessError, subprocess.TimeoutExpired, FileNotFoundError) as err:
-                output = "Error running command: %s\n%s\n" % (cmd, err)
-            f.write("%s\n%s\n" % (cmd, output))
+                output = "Error running command: %s\n%s\n" % (c, err)
+            f.write("%s\n%s\n" % (c, output))
+    # reset the environment
     os.environ['PATH'] = ospath
 
 python run_buildstats () {
-- 
2.29.2

