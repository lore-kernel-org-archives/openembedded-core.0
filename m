Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QteX0-0000Lo-Gl
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 13:43:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2011 04:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39245740"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.13.232])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2011 04:38:55 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 04:38:54 -0700
Message-Id: <9d113e2d08c51a5829e05c87c70c70546f262ebb.1313580714.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313580714.git.elizabeth.flanagan@intel.com>
References: <cover.1313580714.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] buildstats.bbclass: Fixing task endtime
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2011 11:43:34 -0000

Task endtime got left out of recent changes. Adding it back in.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/buildstats.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 939e3af..55cbb3c 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -138,9 +138,10 @@ def write_task_data(status, logfile, dev, e):
         for key in sorted(diskdata.iterkeys()):
             file.write(key + ": " + diskdata[key] + "\n")
     if status is "passed":
-	    file.write("Status: PASSED")
+	    file.write("Status: PASSED \n")
     else:
-        file.write("Status: FAILED")
+        file.write("Status: FAILED \n")
+    file.write("Ended: %0.2f \n" % time.time())
     file.close()
 
 python run_buildstats () {
@@ -149,7 +150,6 @@ python run_buildstats () {
     import bb.data
     import time, subprocess, platform
 
-
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
         # at first pass make the buildstats heriarchy and then
-- 
1.7.1



