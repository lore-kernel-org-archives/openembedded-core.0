Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 15CEE7285F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:47 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id p10so28939636pdj.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0kOKQhn6/8klBMYwl4R6LfocxiTQIvV5E9dxU5aNdxQ=;
	b=yXgcQ1rE3+8v0ek7LOpELnJNEwVBwCOAEnQV/SxdRDedEqx0kdsYtZhxPLMghhncHQ
	MsoMYJUpgnkT6BKNiVu/Jr8QpK0LtaAKCd2xiPTjfCll4SslekhOg/sNAJM6xyS+y5n6
	IoCanXMaMklt96eEmX3HzkC/SpA3xKiMfEpTaJNbtwXNr/GDpjVNyPlYeg3nz2moMJFm
	2bhwupCE03/ZL0yl2DOVk9wuzL1b4XqAEnRsW3MACPEXmNAWEPL+BLpAe+LArCPujQLD
	c6ArmReOO0TgH4OOXNSKx/Iyme/o9K5qWhsfwoGlFHNDCvDQisv9KQfucGCnC4TO06iH
	TznQ==
X-Received: by 10.70.103.238 with SMTP id fz14mr134373663pdb.79.1420490448491; 
	Mon, 05 Jan 2015 12:40:48 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:37 -0800
Message-Id: <6d82019fc99face356cfd64805ad4f9a372ee1be.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 03/12] report-error: Handle the case no logfile exists
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
X-List-Received-Date: Mon, 05 Jan 2015 20:40:50 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If the task fails early, no error log may exist. Currently we crash in
that case, this handles the situation more gracefully.

(From OE-Core rev: 1e6bfcab47f532677f87683ba2f5e5fb905e9ba5)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/report-error.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

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
-- 
1.9.1


