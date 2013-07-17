Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9402E6B205
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 17:29:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2013 10:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,686,1367996400"; d="scan'208";a="371802266"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.55])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2013 10:29:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2013 18:29:37 +0100
Message-Id: <1374082177-6873-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] scripts/contrib/*: fix arithmetic bashism
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
X-List-Received-Date: Wed, 17 Jul 2013 17:29:45 -0000

Apparently $[...] isn't valid in dash, so use $((...)) instead for
mkefidisk.sh and ddimage that both start with $!/bin/sh.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/ddimage      | 2 +-
 scripts/contrib/mkefidisk.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index ab1d4c7..93ebeaf 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -39,7 +39,7 @@ device_details() {
 		echo "   model: UNKNOWN"
 	fi
 	if [ -f "/sys/class/block/$DEV/size" ]; then
-		echo "    size: $[$(cat /sys/class/block/$DEV/size)*BLOCK_SIZE] bytes"
+		echo "    size: $(($(cat /sys/class/block/$DEV/size) * $BLOCK_SIZE)) bytes"
 	else
 		echo "    size: UNKNOWN"
 	fi
diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 0c15104..bcc2411 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -64,7 +64,7 @@ function device_details() {
 		echo "   model: UNKNOWN"
 	fi
 	if [ -f "/sys/class/block/$DEV/size" ]; then
-		echo "    size: $[$(cat /sys/class/block/$DEV/size)*BLOCK_SIZE] bytes"
+		echo "    size: $(($(cat /sys/class/block/$DEV/size) * $BLOCK_SIZE)) bytes"
 	else
 		echo "    size: UNKNOWN"
 	fi
-- 
1.8.1.2


