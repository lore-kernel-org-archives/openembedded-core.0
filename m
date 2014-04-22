Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1543B609A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:42:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2014 16:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="525742175"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2014 16:42:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:42:25 -0700
Message-Id: <1398210145-15701-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] report-error: Add posting in the public note
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
X-List-Received-Date: Tue, 22 Apr 2014 23:42:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/report-error.bbclass | 1 +
 scripts/send-error-report         | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 479b38d..15adc97 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -60,6 +60,7 @@ python errorreport_handler () {
                 filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
                 bb.note("The errors of this build are stored in: %s. You can send the errors to an upstream server by running: send-error-report %s [server]" % (datafile, datafile))
+                bb.note("The contents of these logs will be posted in public if you use the above script. Please ensure you remove any identifying or propriety information before sending.")
 }
 
 addhandler errorreport_handler
diff --git a/scripts/send-error-report b/scripts/send-error-report
index 3d1f7a4..48d983b 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -97,8 +97,9 @@ def sendData(json_file, server):
 
 if __name__ == '__main__':
     print ("\nSends an error report (if the report-error class was enabled) to a remote server.")
+    print("\nThis scripts sends the contents of the error to a public upstream server.")
+    print("\nPlease remove any identifying information before sending.")
     if len(sys.argv) < 2:
-        print("\nThis scripts sends the contents of a file to an upstream server.")
         print("\nUsage: send-error-report <error_fileName> [server]")
         print("\nIf this is the first when sending a report you'll be asked for your name and optionally your email address.")
         print("They will be associated with your report.\n")
-- 
1.8.3.1


