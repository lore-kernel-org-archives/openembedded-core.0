Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD0873163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410356"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:59 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:25 +0300
Message-Id: <1466764661-24544-13-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 12/28] oeqa.buildperf: add method for measuring file disk usage
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:00 -0000

Add a new method to BuildPerfTest class for measuring the disk usage of
a file of directory.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 230a7e7..e29e9d1 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -75,6 +75,7 @@ def time_cmd(cmd, **kwargs):
 class BuildPerfTest(object):
     """Base class for build performance tests"""
     SYSRES = 'sysres'
+    DISKUSAGE = 'diskusage'
 
     name = None
     description = None
@@ -153,6 +154,24 @@ class BuildPerfTest(object):
         with open(results_log, 'w') as fobj:
             fobj.write(timedata)
 
+    def measure_disk_usage(self, path, name, legend):
+        """Estimate disk usage of a file or directory"""
+        # TODO: 'ignore_status' could/should be removed when globalres.log is
+        # deprecated. The function would just raise an exception, instead
+        ret = runCmd(['du', '-s', path], ignore_status=True)
+        if ret.status:
+            log.error("du failed, disk usage will be reported as 0")
+            size = 0
+            self._failed = True
+        else:
+            size = int(ret.output.split()[0])
+            log.debug("Size of %s path is %s", path, size)
+        measurement = {'type': self.DISKUSAGE,
+                       'name': name,
+                       'legend': legend}
+        measurement['values'] = {'size': size}
+        self.results['measurements'].append(measurement)
+
     @staticmethod
     def force_rm(path):
         """Equivalent of 'rm -rf'"""
-- 
2.6.6


