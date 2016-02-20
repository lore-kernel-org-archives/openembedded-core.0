Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 80E2C771E9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 01:50:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 19 Feb 2016 17:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,473,1449561600"; d="scan'208";a="749735103"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2016 17:50:52 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 17:37:22 -0800
Message-Id: <1455932242-852-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455932242-852-1-git-send-email-juro.bystricky@intel.com>
References: <1455932242-852-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH] buildstats.bbclass: Don't assume /proc/<pid>/io present
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
X-List-Received-Date: Sat, 20 Feb 2016 01:50:52 -0000

It is not guaranteed Linux kernel was configured with process I/O
statistics enabled. If process I/O statistcs are not present, issue
a one time warning and do not attempt to read the non-existing stats
counters.

[YOCTO#9025]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/buildstats.bbclass | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index e58d37b..72a3dd9 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -25,13 +25,14 @@ def get_process_cputime(pid):
         'cstime' : fields[16],  
     }
     iostats = {}
-    with open("/proc/%d/io" % pid, "r") as f:
-        while True:
-            i = f.readline().strip()
-            if not i:
-                break
-            i = i.split(": ")
-            iostats[i[0]] = i[1]
+    if os.path.isfile("/proc/%d/io" % pid):
+        with open("/proc/%d/io" % pid, "r") as f:
+            while True:
+                i = f.readline().strip()
+                if not i:
+                    break
+                i = i.split(": ")
+                iostats[i[0]] = i[1]
     resources = resource.getrusage(resource.RUSAGE_SELF)
     childres = resource.getrusage(resource.RUSAGE_CHILDREN)
     return stats, iostats, resources, childres
@@ -111,7 +112,14 @@ python run_buildstats () {
 
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
-        # at first pass make the buildstats heriarchy and then
+        # If the kernel was not configured to provide I/O statistics, issue
+        # a one time warning.
+        ########################################################################
+        if not os.path.isfile("/proc/%d/io" % os.getpid()):
+            bb.warn("The Linux kernel was not configured to provide process I/O statistics. (CONFIG_TASK_IO_ACCOUNTING is not set)")
+
+        ########################################################################
+        # at first pass make the buildstats hierarchy and then
         # set the buildname
         ########################################################################
         bb.utils.mkdirhier(bsdir)
-- 
1.9.1


