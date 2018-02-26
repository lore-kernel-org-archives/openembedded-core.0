Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 52EB2787F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:12:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208";a="203914614"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 26 Feb 2018 12:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:12:16 -0800
Message-Id: <20180226201216.33204-17-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226201216.33204-1-california.l.sullivan@intel.com>
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
Subject: [PATCH 16/16] init-install.sh: support multiple kernels and don't assume vmlinuz
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
X-List-Received-Date: Mon, 26 Feb 2018 20:12:31 -0000

Since kernels will not necessarily be installed as vmlinuz anymore,
don't assume that's its name for either the bootloader config or the
copy of the kernel.

Also, allow installing multiple kernels by searching for common kernel
names.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 .../initrdscripts/files/init-install.sh            | 37 ++++++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index dade059c8f1..713a83092bf 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -256,9 +256,34 @@ fi
 umount /tgt_root
 umount /src_root
 
+echo "Looking for kernels to use as boot target.."
+# Find kernel to boot to
+# Give user options if multiple are found
+kernels="$(find /run/media/$1/ -type f  \
+           -name bzImage* -o -name zImage* \
+           -o -name vmlinux* -o -name vmlinuz* \
+           -o -name fitImage* \
+           | sed s:.*/::)"
+if [ -n "$(echo $kernels)" ]; then
+    # only one kernel entry if no space
+    if [ -z "$(echo $kernels | grep " ")" ]; then
+        kernel=$kernels
+        echo "$kernel will be used as the boot target"
+    else
+        echo "Which kernel do we want to boot by default? The following kernels were found:"
+        echo $kernels
+        read answer
+        kernel=$answer
+    fi
+else
+    echo "No kernels found, exiting..."
+    exit 1
+fi
+
 # Handling of the target boot partition
 mount $bootfs /boot
 echo "Preparing boot partition..."
+
 if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
     echo "Preparing custom grub2 menu..."
     root_part_uuid=$(blkid -o value -s PARTUUID ${rootfs})
@@ -268,7 +293,7 @@ if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
     cat >$GRUBCFG <<_EOF
 menuentry "Linux" {
     search --no-floppy --fs-uuid $boot_uuid --set root
-    linux /vmlinuz root=PARTUUID=$root_part_uuid $rootwait rw $5 $3 $4 quiet
+    linux /$kernel root=PARTUUID=$root_part_uuid $rootwait rw $5 $3 $4 quiet
 }
 _EOF
     chmod 0444 $GRUBCFG
@@ -282,10 +307,16 @@ if [ $grub_version -eq 0 ] ; then
     echo "timeout 30" >> /boot/grub/menu.lst
     echo "title Live Boot/Install-Image" >> /boot/grub/menu.lst
     echo "root  (hd0,0)" >> /boot/grub/menu.lst
-    echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
+    echo "kernel /$kernel root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
 fi
 
-cp /run/media/$1/vmlinuz /boot/
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


