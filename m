Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD3B7286F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKBJKci012037 for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:20:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id meJucA5UbucH
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:20:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKBJuco012067
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:20:07 GMT
Message-ID: <1419074433.13316.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Dec 2014 11:20:33 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] report-error: Handle the case no logfile exists
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Dec 2014 11:20:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the task fails early, no error log may exist. Currently we crash in
that case, this handles the situation more gracefully.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 5fe2355..8b30422 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -44,11 +44,14 @@ python errorreport_handler () {
             task = e.task
             taskdata={}
             log = e.data.getVar('BB_LOGFILE', True)
-            logFile = open(log, 'r')
             taskdata['package'] = e.data.expand("${PF}")
             taskdata['task'] = task
-            taskdata['log'] = logFile.read()
-            logFile.close()
+            if log:
+                logFile = open(log, 'r')
+                taskdata['log'] = logFile.read()
+                logFile.close()
+            else:
+                taskdata['log'] = "No Log"
             jsondata = json.loads(errorreport_getdata(e))
             jsondata['failures'].append(taskdata)
             errorreport_savedata(e, jsondata, "error-report.txt")



