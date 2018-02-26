Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F02B9787B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:12:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208";a="203914594"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 26 Feb 2018 12:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:12:09 -0800
Message-Id: <20180226201216.33204-10-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226201216.33204-1-california.l.sullivan@intel.com>
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
Subject: [PATCH 09/16] init-install-efi.sh: Update to support installing multiple kernels
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
X-List-Received-Date: Mon, 26 Feb 2018 20:12:30 -0000

We can no longer rely on the kernel having a static name of "vmlinuz".
This means we can't use it as a sentinel value in our sed commands, and
we can't just copy vmlinuz to the boot directory.

Instead, we'll use "root=" as the sentinel value for our sed commands,
and we'll search for common kernel names to copy into our boot
directory.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 706418fa9c5..f946d971d11 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -244,10 +244,9 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     sed -i "/initrd /d" $GRUBCFG
     # Delete any LABEL= strings
     sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
-    # Delete any root= strings
-    sed -i "s/ root=[^ ]*/ /g" $GRUBCFG
-    # Add the root= and other standard boot options
-    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=PARTUUID=$root_part_uuid rw $rootwait quiet @" $GRUBCFG
+    # Replace root= and add additional standard boot options
+    # We use root as a sentinel value, as vmlinuz is no longer guaranteed
+    sed -i "s/ root=[^ ]*/ root=PARTUUID=$root_part_uuid rw $rootwait quiet /g" $GRUBCFG
 fi
 
 if [ -d /run/media/$1/loader ]; then
@@ -269,7 +268,13 @@ fi
 
 umount /tgt_root
 
-cp /run/media/$1/vmlinuz /boot
+# Copy kernel artifacts. To add more artifacts just add to types
+# For now just support kernel types already being used by something in OE-core
+for types in bzImage zImage vmlinux vmlinuz fitImage; do
+    for kernel in `find /run/media/$1/ -name $types*`; do
+        cp $kernel /boot
+    done
+done
 
 umount /boot
 
-- 
2.14.3


