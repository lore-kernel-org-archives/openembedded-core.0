Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53117770AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:50:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 01 Oct 2015 11:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,619,1437462000"; d="scan'208";a="572293183"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2015 11:50:46 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 10:40:46 +0000
Message-Id: <37a893cc9650e557355124912b869ef4ab599081.1443694820.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443694820.git.mariano.lopez@linux.intel.com>
References: <cover.1443694820.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1443694820.git.mariano.lopez@linux.intel.com>
References: <cover.1443694820.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] report-error.bbclass: Support Unicode reports
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
X-List-Received-Date: Thu, 01 Oct 2015 18:50:46 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently error-report doesn't manage Unicode because
the files are opened with the default codec.

This patch changes the codec of the files to UTF-8,
this way the reports will include Unicode characters.
This is useful for the qemu output when doing the
testimage task.

[YOCTO #8225]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/report-error.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 040c29e..82b5bcd 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -9,22 +9,25 @@
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 
 def errorreport_getdata(e):
+    import codecs
     logpath = e.data.getVar('ERR_REPORT_DIR', True)
     datafile = os.path.join(logpath, "error-report.txt")
-    with open(datafile) as f:
+    with codecs.open(datafile, 'r', 'utf-8') as f:
         data = f.read()
     return data
 
 def errorreport_savedata(e, newdata, file):
     import json
+    import codecs
     logpath = e.data.getVar('ERR_REPORT_DIR', True)
     datafile = os.path.join(logpath, file)
-    with open(datafile, "w") as f:
+    with codecs.open(datafile, 'w', 'utf-8') as f:
         json.dump(newdata, f, indent=4, sort_keys=True)
     return datafile
 
 python errorreport_handler () {
         import json
+        import codecs
 
         logpath = e.data.getVar('ERR_REPORT_DIR', True)
         datafile = os.path.join(logpath, "error-report.txt")
@@ -53,8 +56,8 @@ python errorreport_handler () {
             taskdata['task'] = task
             if log:
                 try:
-                    logFile = open(log, 'r')
-                    logdata = logFile.read().decode('utf-8')
+                    logFile = codecs.open(log, 'r', 'utf-8')
+                    logdata = logFile.read()
                     logFile.close()
                 except:
                     logdata = "Unable to read log file"
-- 
1.8.4.5


