Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB016007A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:09:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 19:09:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,403,1515484800"; d="scan'208";a="21325720"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 27 Feb 2018 19:09:25 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 19:09:01 -0800
Message-Id: <20180228030918.35934-2-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228030918.35934-1-california.l.sullivan@intel.com>
References: <20180228030918.35934-1-california.l.sullivan@intel.com>
Subject: [PATCH v2 01/18] grub-efi.bbclass: split out configuration portion
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
X-List-Received-Date: Wed, 28 Feb 2018 03:09:25 -0000

This part is useful on its own, whereas the whole class together is
specific for image-live.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 .../{grub-efi.bbclass => grub-efi-cfg.bbclass}     |  40 -------
 meta/classes/grub-efi.bbclass                      | 122 +--------------------
 2 files changed, 1 insertion(+), 161 deletions(-)
 copy meta/classes/{grub-efi.bbclass => grub-efi-cfg.bbclass} (76%)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi-cfg.bbclass
similarity index 76%
copy from meta/classes/grub-efi.bbclass
copy to meta/classes/grub-efi-cfg.bbclass
index 610479b85d1..730323c72e6 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -16,8 +16,6 @@
 # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
 # ${GRUB_ROOT} - grub's root device.
 
-do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
-
 GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUB_CFG_VM = "${S}/grub_vm.cfg"
 GRUB_CFG_LIVE = "${S}/grub_live.cfg"
@@ -32,44 +30,6 @@ APPEND ?= ""
 # Need UUID utility code.
 inherit fs-uuid
 
-efi_populate() {
-	# DEST must be the root of the image so that EFIDIR is not
-	# nested under a top level directory.
-	DEST=$1
-
-	install -d ${DEST}${EFIDIR}
-
-	GRUB_IMAGE="grub-efi-bootia32.efi"
-	DEST_IMAGE="bootia32.efi"
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		GRUB_IMAGE="grub-efi-bootx64.efi"
-		DEST_IMAGE="bootx64.efi"
-	fi
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}/${DEST_IMAGE}
-	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_IMAGE" >${DEST}/startup.nsh
-
-	install -m 0644 ${GRUB_CFG} ${DEST}${EFIDIR}/grub.cfg
-}
-
-efi_iso_populate() {
-	iso_dir=$1
-	efi_populate $iso_dir
-	# Build a EFI directory to create efi.img
-	mkdir -p ${EFIIMGDIR}/${EFIDIR}
-	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
-	cp $iso_dir/vmlinuz ${EFIIMGDIR}
-	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" > ${EFIIMGDIR}/startup.nsh
-	if [ -f "$iso_dir/initrd" ] ; then
-		cp $iso_dir/initrd ${EFIIMGDIR}
-	fi
-}
-
-efi_hddimg_populate() {
-	efi_populate $1
-}
-
 python build_efi_cfg() {
     import sys
 
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 610479b85d1..4b5704c19cc 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -1,36 +1,4 @@
-# grub-efi.bbclass
-# Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
-#
-# Released under the MIT license (see packages/COPYING)
-
-# Provide grub-efi specific functions for building bootable images.
-
-# External variables
-# ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
-# ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
-# ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
-# ${LABELS} - a list of targets for the automatic config
-# ${APPEND} - an override list of append strings for each label
-# ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
-# ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
-# ${GRUB_ROOT} - grub's root device.
-
-do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
-
-GRUB_SERIAL ?= "console=ttyS0,115200"
-GRUB_CFG_VM = "${S}/grub_vm.cfg"
-GRUB_CFG_LIVE = "${S}/grub_live.cfg"
-GRUB_TIMEOUT ?= "10"
-#FIXME: build this from the machine config
-GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
-
-EFIDIR = "/EFI/BOOT"
-GRUB_ROOT ?= "${ROOT}"
-APPEND ?= ""
-
-# Need UUID utility code.
-inherit fs-uuid
+inherit grub-efi-cfg
 
 efi_populate() {
 	# DEST must be the root of the image so that EFIDIR is not
@@ -69,91 +37,3 @@ efi_iso_populate() {
 efi_hddimg_populate() {
 	efi_populate $1
 }
-
-python build_efi_cfg() {
-    import sys
-
-    workdir = d.getVar('WORKDIR')
-    if not workdir:
-        bb.error("WORKDIR not defined, unable to package")
-        return
-
-    gfxserial = d.getVar('GRUB_GFXSERIAL') or ""
-
-    labels = d.getVar('LABELS')
-    if not labels:
-        bb.debug(1, "LABELS not defined, nothing to do")
-        return
-
-    if labels == []:
-        bb.debug(1, "No labels, nothing to do")
-        return
-
-    cfile = d.getVar('GRUB_CFG')
-    if not cfile:
-        bb.fatal('Unable to read GRUB_CFG')
-
-    try:
-         cfgfile = open(cfile, 'w')
-    except OSError:
-        bb.fatal('Unable to open %s' % cfile)
-
-    cfgfile.write('# Automatically created by OE\n')
-
-    opts = d.getVar('GRUB_OPTS')
-    if opts:
-        for opt in opts.split(';'):
-            cfgfile.write('%s\n' % opt)
-
-    cfgfile.write('default=%s\n' % (labels.split()[0]))
-
-    timeout = d.getVar('GRUB_TIMEOUT')
-    if timeout:
-        cfgfile.write('timeout=%s\n' % timeout)
-    else:
-        cfgfile.write('timeout=50\n')
-
-    root = d.getVar('GRUB_ROOT')
-    if not root:
-        bb.fatal('GRUB_ROOT not defined')
-
-    if gfxserial == "1":
-        btypes = [ [ " graphics console", "" ],
-            [ " serial console", d.getVar('GRUB_SERIAL') or "" ] ]
-    else:
-        btypes = [ [ "", "" ] ]
-
-    for label in labels.split():
-        localdata = d.createCopy()
-
-        overrides = localdata.getVar('OVERRIDES')
-        if not overrides:
-            bb.fatal('OVERRIDES not defined')
-
-        for btype in btypes:
-            localdata.setVar('OVERRIDES', label + ':' + overrides)
-
-            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
-            lb = label
-            if label == "install":
-                lb = "install-efi"
-            cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))
-
-            cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
-
-            append = localdata.getVar('APPEND')
-            initrd = localdata.getVar('INITRD')
-
-            if append:
-                append = replace_rootfs_uuid(d, append)
-                cfgfile.write(' %s' % (append))
-
-            cfgfile.write(' %s' % btype[1])
-            cfgfile.write('\n')
-
-            if initrd:
-                cfgfile.write('initrd /initrd')
-            cfgfile.write('\n}\n')
-
-    cfgfile.close()
-}
-- 
2.14.3


