Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8586E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304289"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:53 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:25 +0300
Message-Id: <1472500111-12358-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 06/12] oeqa.buildperf: rename buildstats directories
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:53 -0000

Change directory name from 'buildstats-<test_name>' to just
'buildstats'. However, this patch adds the possibility to label
buildstats directory name with a postfix which makes it possible to save
multiple buildstats per test, for example.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 64c1a44..de22850 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -394,14 +394,15 @@ class BuildPerfTestCase(unittest.TestCase):
         # Append to 'sizes' array for globalres log
         self.sizes.append(str(size))
 
-    def save_buildstats(self):
+    def save_buildstats(self, label=None):
         """Save buildstats"""
         bs_dirs = os.listdir(self.bb_vars['BUILDSTATS_BASE'])
         if len(bs_dirs) > 1:
             log.warning("Multiple buildstats found for test %s, only "
                         "archiving the last one", self.name)
+        postfix = '-' + label if label else ''
         shutil.move(os.path.join(self.bb_vars['BUILDSTATS_BASE'], bs_dirs[-1]),
-                    os.path.join(self.out_dir, 'buildstats-' + self.name))
+                    os.path.join(self.out_dir, 'buildstats' + postfix))
 
     def rm_tmp(self):
         """Cleanup temporary/intermediate files and directories"""
-- 
2.6.6


