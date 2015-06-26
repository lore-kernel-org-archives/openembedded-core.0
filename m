Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8FE75662
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 14:03:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jun 2015 07:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,685,1427785200"; d="scan'208";a="514674564"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2015 07:02:38 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 05:56:00 +0000
Message-Id: <e70f95d9bb6247ec0f305966894b22f681135013.1435297800.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1435297800.git.mariano.lopez@linux.intel.com>
References: <cover.1435297800.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] report-error.bbclass: Added file syncronization.
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
X-List-Received-Date: Fri, 26 Jun 2015 14:03:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

errorreport_handler would fail if several errors are
triggered at the same time because of two proccess
writting to the same file. This patch add the required
syncronization to handle concurrent process.

[YP #7899]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/report-error.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index c5aaaa8..11eee9b 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -18,7 +18,6 @@ def errorreport_getdata(e):
 def errorreport_savedata(e, newdata, file):
     import json
     logpath = e.data.getVar('ERR_REPORT_DIR', True)
-    bb.utils.mkdirhier(logpath)
     datafile = os.path.join(logpath, file)
     with open(datafile, "w") as f:
         json.dump(newdata, f, indent=4, sort_keys=True)
@@ -27,7 +26,11 @@ def errorreport_savedata(e, newdata, file):
 python errorreport_handler () {
         import json
 
+        logpath = e.data.getVar('ERR_REPORT_DIR', True)
+        datafile = os.path.join(logpath, "error-report.txt")
+
         if isinstance(e, bb.event.BuildStarted):
+            bb.utils.mkdirhier(logpath)
             data = {}
             machine = e.data.getVar("MACHINE", False)
             data['machine'] = machine
@@ -38,7 +41,9 @@ python errorreport_handler () {
             data['failures'] = []
             data['component'] = e.getPkgs()[0]
             data['branch_commit'] = base_detect_branch(e.data) + ": " + base_detect_revision(e.data)
+            lock = bb.utils.lockfile(datafile + '.lock')
             errorreport_savedata(e, data, "error-report.txt")
+            bb.utils.unlockfile(lock)
 
         elif isinstance(e, bb.build.TaskFailed):
             task = e.task
@@ -56,12 +61,16 @@ python errorreport_handler () {
 
             else:
                 taskdata['log'] = "No Log"
+            lock = bb.utils.lockfile(datafile + '.lock')
             jsondata = json.loads(errorreport_getdata(e))
             jsondata['failures'].append(taskdata)
             errorreport_savedata(e, jsondata, "error-report.txt")
+            bb.utils.unlockfile(lock)
 
         elif isinstance(e, bb.event.BuildCompleted):
+            lock = bb.utils.lockfile(datafile + '.lock')
             jsondata = json.loads(errorreport_getdata(e))
+            bb.utils.unlockfile(lock)
             failures = jsondata['failures']
             if(len(failures) > 0):
                 filename = "error_report_" + e.data.getVar("BUILDNAME", False)+".txt"
-- 
1.8.4.5


