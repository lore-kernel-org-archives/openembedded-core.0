Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA3271A25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:56:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 04 Oct 2016 04:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,295,1473145200"; d="scan'208";a="768707622"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2016 04:56:36 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 14:56:35 +0300
Message-Id: <1475582195-4497-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] oeqa.buildperf: measure apparent size instead of real disk usage
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
X-List-Received-Date: Tue, 04 Oct 2016 11:56:36 -0000

This change aligns disk usage measurements with the old
build-perf-test.sh script. And thus, also makes the results between the
old and the new script comparable.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 2c10255..9dd377c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -410,7 +410,7 @@ class BuildPerfTestCase(unittest.TestCase):
 
     def measure_disk_usage(self, path, name, legend):
         """Estimate disk usage of a file or directory"""
-        ret = runCmd2(['du', '-s', path])
+        ret = runCmd2(['du', '-s', '--apparent-size', '--block-size', '1024', path])
         size = int(ret.output.split()[0])
         log.debug("Size of %s path is %s", path, size)
         measurement = {'type': self.DISKUSAGE,
-- 
2.6.6


