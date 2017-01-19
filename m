Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 792A771AFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934257"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:46 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:34 +0200
Message-Id: <20170119111239.22506-7-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 06/11] oeqa.buildperf: extend xml report format with test description
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:46 -0000

Add test description as an attribute to the <testcase> element.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index efbe20c..b82476c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -273,6 +273,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
             testcase = ET.SubElement(suite, 'testcase')
             testcase.set('classname', test.__module__ + '.' + test.__class__.__name__)
             testcase.set('name', test.name)
+            testcase.set('description', test.shortDescription())
             testcase.set('timestamp', test.start_time.isoformat())
             testcase.set('time', str(test.elapsed_time.total_seconds()))
             if status in ('ERROR', 'FAILURE', 'EXP_FAILURE'):
@@ -407,6 +408,9 @@ class BuildPerfTestCase(unittest.TestCase):
     def cmd_log_file(self):
         return os.path.join(self.out_dir, 'commands.log')
 
+    def shortDescription(self):
+        return super(BuildPerfTestCase, self).shortDescription() or ""
+
     def setUp(self):
         """Set-up fixture for each test"""
         if self.build_target:
-- 
2.10.2


