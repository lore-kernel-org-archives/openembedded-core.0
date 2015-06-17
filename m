Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 986E2758C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 14:47:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2015 07:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,633,1427785200"; d="scan'208";a="745181152"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2015 07:47:31 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 06:43:11 +0000
Message-Id: <9ddc5eb5f5735a4e6c958703083f9a59da64f452.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: matt.fleming@intel.com, ricardo.neri@intel.com
Subject: [PATCH 2/2] runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot
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
X-List-Received-Date: Wed, 17 Jun 2015 14:47:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

At least the OVFM (UEFI Firmware for Qemu and KVM) recipe stores the BIOS
under $OE_TMPDIR/sysroots/$MACHINE, now defined as OECORE_MACHINE_SYSROOT.
The latter is used when searching BIOS, VGA BIOS and keymaps. As a example,
to boot a OVFM BIOS, one can run the following command:

$ runqemu qemux86 core-image-minimal \
    biosdir=usr/share/ovmf  \
    biosfilename=bios.bin \
    nographic

Note the bios* parameters: these two are needed to specify the subfolder
(parent folder is OECORE_MACHINE_SYSROOT) and BIOS filename (without it,
it picks a BIOS named bios-256k.bin).

[YOCTO #5654]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/runqemu | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 84ece4d..155824b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -397,6 +397,13 @@ setup_sysroot() {
 
         OECORE_NATIVE_SYSROOT=$OE_TMPDIR/sysroots/$BUILD_SYS
     fi 
+
+    # Some recipes store the BIOS under $OE_TMPDIR/sysroots/$MACHINE,
+    # now defined as OECORE_MACHINE_SYSROOT. The latter is used when searching
+    # BIOS, VGA BIOS and keymaps.
+    if [ -z "$OECORE_MACHINE_SYSROOT" ]; then
+        OECORE_MACHINE_SYSROOT=$OE_TMPDIR/sysroots/$MACHINE
+    fi
 }
 
 # Locate a rootfs image to boot which matches our expected
@@ -486,7 +493,7 @@ fi
 echo "FSTYPE: [$FSTYPE]"
 
 setup_sysroot
-# OECORE_NATIVE_SYSROOT is now set for all cases
+# OECORE_NATIVE_SYSROOT and OECORE_MACHINE_SYSROOT are now set for all cases
 
 INTERNAL_SCRIPT="$0-internal"
 if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
@@ -498,10 +505,14 @@ if [ ! -z "$CUSTOMBIOSDIR" ]; then
     if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
         echo "Assuming biosdir is $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
         SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
+    elif [ -d "$OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR" ]; then
+        echo "Assuming biosdir is $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
     else
         if [ ! -d "$CUSTOMBIOSDIR" ]; then
             echo "Custom BIOS directory not found. Tried: $CUSTOMBIOSDIR"
             echo "and $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
+            echo "and $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
             exit 1;
         fi
         echo "Assuming biosdir is $CUSTOMBIOSDIR"
-- 
1.8.4.5


