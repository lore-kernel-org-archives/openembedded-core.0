Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC4316102D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 20:49:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Sep 2013 13:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,965,1371106800"; d="scan'208";a="382444032"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2013 13:49:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 13:54:09 -0700
Message-Id: <718a56d2550d5c22a4b35ac8385b1b2a67c2d8e2.1379969542.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1379969542.git.dvhart@linux.intel.com>
References: <cover.1379969542.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/2] init-install-efi.sh: Fix root= specification
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
X-List-Received-Date: Mon, 23 Sep 2013 20:49:46 -0000

Fixes [YOCTO #5237]

The current grub.cfg manipulation depends on an existing root=
parameter. If this doesn't exist, the correct root= parameter will not
be added.

Instead, remove any existing root= parameters and add the correct one
explicitly.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: mihaix.lindner@linux.intel.com
---
 .../initrdscripts/files/init-install-efi.sh        |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 23228c9..574966e 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -161,8 +161,10 @@ sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
 sed -i "/initrd /d" $GRUBCFG
 # Delete any LABEL= strings
 sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
-# Replace the ramdisk root with the install device and include other options
-sed -i "s@ root=[^ ]*@ root=$rootfs rw $rootwait quiet@" $GRUBCFG
+# Delete any root= strings
+sed -i "s/ root=[^ ]*/ /" $GRUBCFG
+# Add the root= and other standard boot options
+sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw $rootwait quiet @" $GRUBCFG
 
 umount /ssd
 sync
-- 
1.7.9.5


