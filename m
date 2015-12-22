Return-Path: <elliot.smith@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 310506FFF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 16:08:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Dec 2015 08:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,465,1444719600"; d="scan'208";a="846500570"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO lp.ger.corp.intel.com)
	([10.252.30.141])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2015 08:07:07 -0800
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:06:56 +0000
Message-Id: <1450800416-25509-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] toaster.bbclass: fix TypeError when parsing build stats
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
X-List-Received-Date: Tue, 22 Dec 2015 16:08:04 -0000

Reading IO stats fails because the IO read/write bytes are
being converted to strings, then added to a numeric running
total.

Fix this by converting IO stats to integers.

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/classes/toaster.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 4fb52a9..bbda2f8 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -212,10 +212,10 @@ python toaster_collect_task_stats() {
             cpu_usage = str(statinfo["CPU usage"]).strip('% \n\r')
 
         if "IO write_bytes" in statinfo:
-            disk_io = disk_io + str(statinfo["IO write_bytes"]).strip('% \n\r')
+            disk_io = disk_io + int(statinfo["IO write_bytes"].strip('% \n\r'))
 
         if "IO read_bytes" in statinfo:
-            disk_io = disk_io + str(statinfo["IO read_bytes"]).strip('% \n\r')
+            disk_io = disk_io + int(statinfo["IO read_bytes"].strip('% \n\r'))
 
         if "Started" in statinfo:
             started = str(statinfo["Started"]).strip('% \n\r')
-- 
1.9.3

---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


