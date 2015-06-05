Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CD2387582E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:10:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 02:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="582586812"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 05 Jun 2015 02:11:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id C75486A4083;
	Fri,  5 Jun 2015 02:10:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:17:10 +0300
Message-Id: <1433488636-4540-4-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 3/9] wic: Fix format string
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
X-List-Received-Date: Fri, 05 Jun 2015 09:10:59 -0000

wic crashes with "TypeError: %d format: a number is required, not str"
Due to incorrect format used for Wic_PartData.extra_size attribute.
Using %s instead of %d should fix the crash.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index f3c5545..40c2772 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -71,7 +71,7 @@ class Wic_PartData(Mic_PartData):
             retval += " --no-table"
         if self.use_uuid:
             retval += " --use-uuid"
-        retval += " --extra-space=%d" % self.extra_space
+        retval += " --extra-space=%s" % self.extra_space
         retval += " --overhead-factor=%f" % self.overhead_factor
 
         return retval
-- 
2.1.4


