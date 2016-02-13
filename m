Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 739E6766B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 13 Feb 2016 03:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="883635411"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 13 Feb 2016 03:12:31 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 1796F6A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:21 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:09 +0200
Message-Id: <7df365457528c9be200ad121ea524088ce582afe.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 02/14] runqemu: don't set KERNEL for wic images
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:30 -0000

Wic images should be boot as is, without pointing qemu to the kernel
binary. Current code doesn't use kernel, but sets KERNEL variable and
shows kernel path in the console output. This can confuse users.

Changed runqemu and runqemu-internal code to avoid setting KERNEL
variable and show kernel path.

(From OE-Core rev: 474caa7ed5ff05caa5d49d270b283882fa616ed1)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu          | 2 +-
 scripts/runqemu-internal | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4bb3bb6..0830901 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -454,7 +454,7 @@ if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
     fi
 fi
 
-if [ -z "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
+if [ -z "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" -a "x$FSTYPE" != "xwic" ]; then
     setup_path_vars 1
     eval kernel_file=\$${machine2}_DEFAULT_KERNEL
     KERNEL=$DEPLOY_DIR_IMAGE/$kernel_file
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2926024..ad854d1 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -301,7 +301,7 @@ case "$MACHINE" in
     ;;
 esac
 
-if [ ! -f "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
+if [ ! -f "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" -a "x$FSTYPE" != "xwic" ]; then
     echo "Error: Kernel image file $KERNEL doesn't exist"
     cleanup
     return 1
-- 
2.1.4


