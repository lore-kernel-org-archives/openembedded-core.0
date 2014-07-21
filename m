Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 34BD67021B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 22:46:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2014 15:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,705,1400050800"; d="scan'208";a="546874856"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2014 15:46:04 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 22:45:58 +0000
Message-Id: <4d5011c9e8ab86c32edd9ac606fa1330576bb97f.1405982758.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <3ef5564ecb54ed9e9663eefd2a05390ad890f5cf.1405982758.git.dvhart@linux.intel.com>
References: <3ef5564ecb54ed9e9663eefd2a05390ad890f5cf.1405982758.git.dvhart@linux.intel.com>
In-Reply-To: <3ef5564ecb54ed9e9663eefd2a05390ad890f5cf.1405982758.git.dvhart@linux.intel.com>
References: <3ef5564ecb54ed9e9663eefd2a05390ad890f5cf.1405982758.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/2] mkefidisk.sh: Add signal handling
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
X-List-Received-Date: Mon, 21 Jul 2014 22:46:18 -0000

Add basic signal handling to unmount and remove any temporary files.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 44ab8d5..7d48b53 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -46,7 +46,9 @@ cleanup() {
 	if [ -d "$TMPDIR" ]; then
 		rm -rf $TMPDIR || error "Failed to remove $TMPDIR"
 	fi
+	exit $1
 }
+trap cleanup HUP INT TERM
 
 # Logging routines
 WARNINGS=0
@@ -72,8 +74,7 @@ success() {
 }
 die() {
 	error $1
-	cleanup
-	exit 1
+	cleanup 1
 }
 debug() {
 	if [ $DEBUG -eq 1 ]; then
@@ -375,10 +376,6 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
 	echo "$TARGET_DEVICE" >> $ROOTFS_MNT/etc/udev/mount.blacklist
 fi
 
-
-# Call cleanup to unmount devices and images and remove the TMPDIR
-cleanup
-
 echo ""
 if [ $WARNINGS -ne 0 ] && [ $ERRORS -eq 0 ]; then
 	echo "${YELLOW}Installation completed with warnings${CLEAR}"
@@ -391,3 +388,6 @@ else
 	success "Installation completed successfully"
 fi
 echo ""
+
+# Call cleanup to unmount devices and images and remove the TMPDIR
+cleanup 0
-- 
2.0.0


