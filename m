Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C43E562135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:25:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 22 Sep 2016 18:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,380,1470726000"; d="scan'208";a="1055117065"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2016 18:25:58 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 18:25:08 -0700
Message-Id: <20160923012508.66322-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] scripts/runqemu: provide better error message on runqemu ifup fail
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
X-List-Received-Date: Fri, 23 Sep 2016 01:25:58 -0000

If runqemu-ifup fails hen running testimage, a rather cryptic error
regarding "no tty present" is displayed. If this step fails, we
should at least point the user at runqemu-gen-tapdevs. A quick search
of this term in the manual will lead them to "Enabling Runtime Tests
on QEMU" which should give them all the info they need.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 658f7c8..06bd5f3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -786,6 +786,9 @@ class BaseConfig(object):
             self.cleantap = True
             logger.info('Created tap: %s' % tap)
 
+        if not tap:
+            logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
+            return 1
         self.tap = tap
         n0 = tap[3:]
         n1 = int(n0) * 2 + 1
-- 
2.9.3


