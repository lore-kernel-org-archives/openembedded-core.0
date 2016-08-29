Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 35F9B6612C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 22:25:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 29 Aug 2016 15:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,253,1470726000"; d="scan'208";a="1021956199"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2016 15:25:37 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 15:24:32 -0700
Message-Id: <20160829222432.6123-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] provide better error message when runqemu-ifup fails
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
X-List-Received-Date: Mon, 29 Aug 2016 22:25:37 -0000

If runqemu-ifup fails hen running testimage, a rather cryptic error
regarding "no tty present" is displayed. If this step fails, we
should at least point the user at runqemu-gen-tapdevs. A quick search
of this term in the manual will lead them to "Enabling Runtime Tests
on QEMU" which should give them all the info they need.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 scripts/runqemu-internal | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d10466d..3d728c0 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -153,6 +153,7 @@ else
             if [ $? -ne 0 ]; then
                 # Re-run standalone to see verbose errors
                 sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
+                echo "ERROR: Failed to setup tap device. Run runqemu-gen-tapdevs to manually create."
                 return 1
             fi
             LOCKFILE="$LOCKDIR/$tap"
-- 
2.9.3


