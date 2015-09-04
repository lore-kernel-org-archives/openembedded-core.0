Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0785677016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:21:39 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so20762979wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T4qIXeDJWNHLwmJGiQAx3ylNR2Mzv7xJ3UsWdRRHPFI=;
	b=hV5X5cewgXWAPLRAAMjtFrtWn4PvneM7Hy+IdSBAcfqIItSGCBzEHflhTvwCH3FEjX
	8RaajLschXjtJlP3IS5dazI85x+HR+EZBawDpTS2XAVx1ww2v1DxWzFDHJXzQegD2RjP
	qkOP6CZEVJe0Hi3Wwa959PvYjqj0Ac8fYHSFqjP4Gbd9QzApdGDxTWhhz4VVyEkKPMu4
	I/q8srLw/BUUF0VfvLASFKPM32gdmvITWS6+jGQs1oNCaZ7e27aexWtoEE8zCjOvKk7Q
	NznjsfCKN0nPhO1NnkO/zxV3YvnJ+MLi3FuJbo6c+Cg2ND9QsZwvInqwwUD3BXD3PkPS
	d+sQ==
X-Received: by 10.181.12.5 with SMTP id em5mr6879218wid.67.1441369299448;
	Fri, 04 Sep 2015 05:21:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id lj2sm2657497wic.1.2015.09.04.05.21.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 05:21:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 14:22:09 +0200
Message-Id: <1441369329-32134-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] report-error: send only last 5242000 characters in error logs
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
X-List-Received-Date: Fri, 04 Sep 2015 12:21:40 -0000

* otherwise whole build report submission is rejected because it's too big

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/report-error.bbclass | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index cabd98c..040c29e 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -54,13 +54,22 @@ python errorreport_handler () {
             if log:
                 try:
                     logFile = open(log, 'r')
-                    taskdata['log'] = logFile.read().decode('utf-8')
+                    logdata = logFile.read().decode('utf-8')
                     logFile.close()
                 except:
-                    taskdata['log'] = "Unable to read log file"
+                    logdata = "Unable to read log file"
 
             else:
-                taskdata['log'] = "No Log"
+                logdata = "No Log"
+
+            # server will refuse failures longer than param specified in project.settings.py
+            # MAX_UPLOAD_SIZE = "5242880"
+            # use lower value, because 650 chars can be spent in task, package, version
+            max_logdata_size = 5242000
+            # upload last max_logdata_size characters
+            if len(logdata) > max_logdata_size:
+                logdata = "..." + logdata[-max_logdata_size:]
+            taskdata['log'] = logdata
             lock = bb.utils.lockfile(datafile + '.lock')
             jsondata = json.loads(errorreport_getdata(e))
             jsondata['failures'].append(taskdata)
-- 
2.5.0


