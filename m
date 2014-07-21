Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DF6E8701D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:47:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jul 2014 16:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,705,1400050800"; d="scan'208";a="576703450"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2014 16:46:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 23:46:50 +0000
Message-Id: <b3901c40e4f759880947f3f5703d9abf1455cff4.1405986410.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] mkefidisk.sh: Add signal handling
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
X-List-Received-Date: Mon, 21 Jul 2014 23:47:09 -0000

Add basic signal handling to unmount and remove any temporary files.
Correct a quoting issue with the die() function caught testing signal
handling.
Fix a minor typo in "formatting" output.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 28cfb6d..b96b7d4 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -48,6 +48,8 @@ cleanup() {
 	fi
 }
 
+trap 'die "Signal Received, Aborting..."' HUP INT TERM
+
 # Logging routines
 WARNINGS=0
 ERRORS=0
@@ -71,7 +73,7 @@ success() {
 	echo "${GREEN}$1${CLEAR}"
 }
 die() {
-	error $1
+	error "$1"
 	cleanup
 	exit 1
 }
@@ -288,7 +290,7 @@ unmount_device || die "Failed to unmount $DEVICE partitions"
 #
 # Format $DEVICE partitions
 #
-info "Formating partitions"
+info "Formatting partitions"
 debug "Formatting $BOOTFS as vfat"
 if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
 	mkfs.vfat -I $BOOTFS -n "EFI" >$OUT 2>&1 || die "Failed to format $BOOTFS"
-- 
2.0.0


