Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbR94-0007x7-9v
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:19:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 22:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="88006035"
Received: from unknown (HELO localhost) ([10.255.15.170])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2011 22:12:50 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 22:12:28 -0800
Message-Id: <089ed32e1415e3133606078604acfc20c5423752.1324015417.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324015417.git.dvhart@linux.intel.com>
References: <cover.1324015417.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/4] grub-efi: Use /EFI/BOOT now that mkdosfs -d works with directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2011 06:19:50 -0000

[Yocto 1783] prevented us from using a proper /EFI/BOOT path in the live
images due to a bug in the -d patch for mkdosfs in dosfstools. With this
now fixed, we can place the efi payload where it belongs per spec and
the images will autoboot to the grub menu on EFI platforms.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/grub-efi.bbclass |   18 +++---------------
 1 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 36b5831..762322b 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -21,10 +21,8 @@ GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
-# FIXME: add EFI/BOOT to GRUB_HDDDIR once the mkdosfs subdir bug is resolved
-#        http://bugzilla.yoctoproject.org/show_bug.cgi?id=1783
 EFIDIR = "/EFI/BOOT"
-GRUB_HDDDIR = "${HDDDIR}"
+GRUB_HDDDIR = "${HDDDIR}${EFIDIR}"
 GRUB_ISODIR = "${ISODIR}${EFIDIR}"
 
 grubefi_populate() {
@@ -53,22 +51,12 @@ grubefi_populate() {
 
 grubefi_iso_populate() {
 	grubefi_populate ${GRUB_ISODIR}
-
-	# FIXUP the <EFIDIR> token in the config
-	# FIXME: This can be dropped once mkdosfs is fixed
-	sed -i "s@<EFIDIR>@${EFIDIR}@g" ${GRUB_ISODIR}/$(basename "${GRUBCFG}")
 }
 
 grubefi_hddimg_populate() {
 	grubefi_populate ${GRUB_HDDDIR}
-
-	# FIXUP the <EFIDIR> token in the config
-	# FIXME: This can be dropped once mkdosfs is fixed
-	sed -i "s@<EFIDIR>@@g" ${GRUB_HDDDIR}/$(basename "${GRUBCFG}")
 }
 
-# FIXME: The <EFIDIR> token can be replaced with ${EFIDIR} once the
-#        mkdosfs bug is resolved.
 python build_grub_cfg() {
     import sys
 
@@ -121,7 +109,7 @@ python build_grub_cfg() {
         bb.data.update_data(localdata)
 
         cfgfile.write('\nmenuentry \'%s\'{\n' % (label))
-        cfgfile.write('linux <EFIDIR>/vmlinuz LABEL=%s' % (label))
+        cfgfile.write('linux ${EFIDIR}/vmlinuz LABEL=%s' % (label))
 
         append = localdata.getVar('APPEND', True)
         initrd = localdata.getVar('INITRD', True)
@@ -131,7 +119,7 @@ python build_grub_cfg() {
         cfgfile.write('\n')
    
         if initrd:
-            cfgfile.write('initrd <EFIDIR>/initrd')
+            cfgfile.write('initrd ${EFIDIR}/initrd')
         cfgfile.write('\n}\n')
 
     cfgfile.close()
-- 
1.7.6.4



