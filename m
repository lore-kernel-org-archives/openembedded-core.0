Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C0B66739BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:41:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jul 2015 03:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="602931114"
Received: from lkpandey-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.112])
	by orsmga003.jf.intel.com with ESMTP; 09 Jul 2015 03:41:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 11:40:56 +0100
Message-Id: <917d541531ebca5085ea036a05ef0310083552d9.1436438405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1436438405.git.paul.eggleton@linux.intel.com>
References: <cover.1436438405.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1436438405.git.paul.eggleton@linux.intel.com>
References: <cover.1436438405.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/report-error: expand variable values
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
X-List-Received-Date: Thu, 09 Jul 2015 10:41:11 -0000

Even if the values for these variables typically don't contain
expressions, we should be expanding them just in case they do. The
recent fix for BUILDNAME resetting within BitBake now means that
BUILDNAME defaults to "${DATE}${TIME}" for example so we definitely
need to expand that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/report-error.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 11eee9b..dda0986 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -32,11 +32,11 @@ python errorreport_handler () {
         if isinstance(e, bb.event.BuildStarted):
             bb.utils.mkdirhier(logpath)
             data = {}
-            machine = e.data.getVar("MACHINE", False)
+            machine = e.data.getVar("MACHINE", True)
             data['machine'] = machine
             data['build_sys'] = e.data.getVar("BUILD_SYS", True)
-            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING", False)
-            data['distro'] = e.data.getVar("DISTRO", False)
+            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING", True)
+            data['distro'] = e.data.getVar("DISTRO", True)
             data['target_sys'] = e.data.getVar("TARGET_SYS", True)
             data['failures'] = []
             data['component'] = e.getPkgs()[0]
@@ -73,7 +73,7 @@ python errorreport_handler () {
             bb.utils.unlockfile(lock)
             failures = jsondata['failures']
             if(len(failures) > 0):
-                filename = "error_report_" + e.data.getVar("BUILDNAME", False)+".txt"
+                filename = "error_report_" + e.data.getVar("BUILDNAME", True) + ".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
                 bb.note("The errors for this build are stored in %s\nYou can send the errors to a reports server by running:\n  send-error-report %s [-s server]" % (datafile, datafile))
                 bb.note("The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.")
-- 
2.1.0


