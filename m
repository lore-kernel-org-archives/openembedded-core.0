Return-Path: <ddalex@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8F160DCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 19:25:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Dec 2013 11:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,508,1384329600"; d="scan'208";a="452179921"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2013 11:24:52 -0800
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id 5543F560594; Wed, 18 Dec 2013 19:24:54 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 19:24:47 +0000
Message-Id: <1387394687-23669-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 03/10] toaster.bbclass: fix crash on buildstats collection
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
X-List-Received-Date: Wed, 18 Dec 2013 19:25:26 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Toaster needs buildstats to be enabled in order to
collect task statistics. The toaster.bbclass didn't
have a guard to stop task data collection if the buildstats
weren't enabled, leading to a crash.

This patch verifies that the task variables are defined before
trying to use them.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index e1a93b5..08c7bfa 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -165,6 +165,9 @@ python toaster_collect_task_stats() {
     import bb.utils
     import os
 
+    if None == e.data.getVar('BUILDSTATS_BASE', True):
+        return  # if we don't have buildstats, we cannot collect stats
+
     def _append_read_list(v):
         lock = bb.utils.lockfile(e.data.expand("${TOPDIR}/toaster.lock"), False, True)
 
-- 
1.8.3.2


