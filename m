Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BE1456D8FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 20:57:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Feb 2014 12:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,514,1389772800"; d="scan'208";a="486807908"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.1])
	by orsmga002.jf.intel.com with ESMTP; 20 Feb 2014 12:57:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 12:57:25 -0800
Message-Id: <1392929845-23411-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: scott.garman@intel.com
Subject: [PATCH] runqemu: Ensure ROOTFS path is absolute
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
X-List-Received-Date: Thu, 20 Feb 2014 20:57:26 -0000

There is a problem if a relative path is passed to the kernel for NFS usage
that it will not correctly find it, so ensure that the ROOTFS path is absolute.

[YOCTO #2807]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0db7ad6..57c5de4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -462,7 +462,9 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
         error "Unable to determine default rootfs for MACHINE [$MACHINE]"
     fi
 fi
-# ROOTFS is now set for all cases
+# ROOTFS is now set for all cases, now expand it to be an absolute path, it should exist at this point
+
+ROOTFS=`realpath $ROOTFS`
 
 echo ""
 echo "Continuing with the following parameters:"
-- 
1.8.3.1


