Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 11D21787F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:12:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208";a="203914600"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 26 Feb 2018 12:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:12:11 -0800
Message-Id: <20180226201216.33204-12-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226201216.33204-1-california.l.sullivan@intel.com>
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
Subject: [PATCH 11/16] systemd-boot.bbclass: break out configuration creation
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

This class is useful on its own and can be used to create configuration
recipes.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 ...stemd-boot.bbclass => systemd-boot-cfg.bbclass} | 57 ------------------
 meta/classes/systemd-boot.bbclass                  | 70 +---------------------
 2 files changed, 1 insertion(+), 126 deletions(-)
 copy meta/classes/{systemd-boot.bbclass => systemd-boot-cfg.bbclass} (50%)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot-cfg.bbclass
similarity index 50%
copy from meta/classes/systemd-boot.bbclass
copy to meta/classes/systemd-boot-cfg.bbclass
index 937307076f7..46eeae126ae 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -1,18 +1,3 @@
-# Copyright (C) 2016 Intel Corporation
-#
-# Released under the MIT license (see COPYING.MIT)
-
-# systemd-boot.bbclass - The "systemd-boot" is essentially the gummiboot merged into systemd.
-#                        The original standalone gummiboot project is dead without any more
-#                        maintenance.
-#
-# Set EFI_PROVIDER = "systemd-boot" to use systemd-boot on your live images instead of grub-efi
-# (images built by image-live.bbclass)
-
-do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
-
-EFIDIR = "/EFI/BOOT"
-
 SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 SYSTEMD_BOOT_ENTRIES ?= ""
 SYSTEMD_BOOT_TIMEOUT ?= "10"
@@ -20,48 +5,6 @@ SYSTEMD_BOOT_TIMEOUT ?= "10"
 # Need UUID utility code.
 inherit fs-uuid
 
-efi_populate() {
-        DEST=$1
-
-        EFI_IMAGE="systemd-bootia32.efi"
-        DEST_EFI_IMAGE="bootia32.efi"
-        if [ "${TARGET_ARCH}" = "x86_64" ]; then
-            EFI_IMAGE="systemd-bootx64.efi"
-            DEST_EFI_IMAGE="bootx64.efi"
-        fi
-
-        install -d ${DEST}${EFIDIR}
-        # systemd-boot requires these paths for configuration files
-        # they are not customizable so no point in new vars
-        install -d ${DEST}/loader
-        install -d ${DEST}/loader/entries
-        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE} ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_EFI_IMAGE" >${DEST}/startup.nsh
-        install -m 0644 ${SYSTEMD_BOOT_CFG} ${DEST}/loader/loader.conf
-        for i in ${SYSTEMD_BOOT_ENTRIES}; do
-            install -m 0644 ${i} ${DEST}/loader/entries
-        done
-}
-
-efi_iso_populate() {
-        iso_dir=$1
-        efi_populate $iso_dir
-        mkdir -p ${EFIIMGDIR}/${EFIDIR}
-        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
-        cp -r $iso_dir/loader ${EFIIMGDIR}
-        cp $iso_dir/vmlinuz ${EFIIMGDIR}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
-        if [ -f "$iso_dir/initrd" ] ; then
-            cp $iso_dir/initrd ${EFIIMGDIR}
-        fi
-}
-
-efi_hddimg_populate() {
-        efi_populate $1
-}
-
 python build_efi_cfg() {
     s = d.getVar("S")
     labels = d.getVar('LABELS')
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 937307076f7..14538fe2d7a 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -12,11 +12,6 @@
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 
 EFIDIR = "/EFI/BOOT"
-
-SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
-SYSTEMD_BOOT_ENTRIES ?= ""
-SYSTEMD_BOOT_TIMEOUT ?= "10"
-
 # Need UUID utility code.
 inherit fs-uuid
 
@@ -62,67 +57,4 @@ efi_hddimg_populate() {
         efi_populate $1
 }
 
-python build_efi_cfg() {
-    s = d.getVar("S")
-    labels = d.getVar('LABELS')
-    if not labels:
-        bb.debug(1, "LABELS not defined, nothing to do")
-        return
-
-    if labels == []:
-        bb.debug(1, "No labels, nothing to do")
-        return
-
-    cfile = d.getVar('SYSTEMD_BOOT_CFG')
-    cdir = os.path.dirname(cfile)
-    if not os.path.exists(cdir):
-        os.makedirs(cdir)
-    try:
-         cfgfile = open(cfile, 'w')
-    except OSError:
-        bb.fatal('Unable to open %s' % cfile)
-
-    cfgfile.write('# Automatically created by OE\n')
-    cfgfile.write('default %s\n' % (labels.split()[0]))
-    timeout = d.getVar('SYSTEMD_BOOT_TIMEOUT')
-    if timeout:
-        cfgfile.write('timeout %s\n' % timeout)
-    else:
-        cfgfile.write('timeout 10\n')
-    cfgfile.close()
-
-    for label in labels.split():
-        localdata = d.createCopy()
-
-        overrides = localdata.getVar('OVERRIDES')
-        if not overrides:
-            bb.fatal('OVERRIDES not defined')
-
-        entryfile = "%s/%s.conf" % (s, label)
-        if not os.path.exists(s):
-            os.makedirs(s)
-        d.appendVar("SYSTEMD_BOOT_ENTRIES", " " + entryfile)
-        try:
-            entrycfg = open(entryfile, "w")
-        except OSError:
-            bb.fatal('Unable to open %s' % entryfile)
-        localdata.setVar('OVERRIDES', label + ':' + overrides)
-
-        entrycfg.write('title %s\n' % label)
-        entrycfg.write('linux /vmlinuz\n')
-
-        append = localdata.getVar('APPEND')
-        initrd = localdata.getVar('INITRD')
-
-        if initrd:
-            entrycfg.write('initrd /initrd\n')
-        lb = label
-        if label == "install":
-            lb = "install-efi"
-        entrycfg.write('options LABEL=%s ' % lb)
-        if append:
-            append = replace_rootfs_uuid(d, append)
-            entrycfg.write('%s' % append)
-        entrycfg.write('\n')
-        entrycfg.close()
-}
+inherit systemd-boot-cfg
-- 
2.14.3


