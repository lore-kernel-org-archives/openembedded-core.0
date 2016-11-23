Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 54E337199E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:09:56 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 23 Nov 2016 15:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,540,1473145200"; d="scan'208";a="33911159"
Received: from unknown (HELO aehernan-MOBL1.zpn.intel.com) ([10.219.18.92])
	by orsmga004.jf.intel.com with ESMTP; 23 Nov 2016 15:09:57 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 17:09:57 -0600
Message-Id: <20161123230957.28159-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH v2] systemd-boot: Remove old gummiboot recipe, class and wks file
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
X-List-Received-Date: Wed, 23 Nov 2016 23:09:57 -0000

Since the gummiboot project is no longer being maintained
and we are using systemd-boot as a replacement instead,
we can now clean up all remaining gummiboot files.

[YOCTO #10332]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/gummiboot.bbclass                     | 121 ---------------------
 ...-C-syntax-errors-for-function-declaration.patch |  74 -------------
 .../gummiboot/gummiboot/fix-objcopy.patch          |  45 --------
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  39 -------
 scripts/lib/wic/canned-wks/mkgummidisk.wks         |  11 --
 5 files changed, 290 deletions(-)
 delete mode 100644 meta/classes/gummiboot.bbclass
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb
 delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks

diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
deleted file mode 100644
index 4f2dea6..0000000
--- a/meta/classes/gummiboot.bbclass
+++ /dev/null
@@ -1,121 +0,0 @@
-# Copyright (C) 2014 Intel Corporation
-#
-# Released under the MIT license (see COPYING.MIT)
-
-# gummiboot.bbclass - equivalent of grub-efi.bbclass
-# Set EFI_PROVIDER = "gummiboot" to use gummiboot on your live images instead of grub-efi
-# (images built by image-live.bbclass or image-vm.bbclass)
-
-do_bootimg[depends] += "${MLPREFIX}gummiboot:do_deploy"
-do_bootdirectdisk[depends] += "${MLPREFIX}gummiboot:do_deploy"
-
-EFIDIR = "/EFI/BOOT"
-
-GUMMIBOOT_CFG ?= "${S}/loader.conf"
-GUMMIBOOT_ENTRIES ?= ""
-GUMMIBOOT_TIMEOUT ?= "10"
-
-# Need UUID utility code.
-inherit fs-uuid
-
-efi_populate() {
-        DEST=$1
-
-        EFI_IMAGE="gummibootia32.efi"
-        DEST_EFI_IMAGE="bootia32.efi"
-        if [ "${TARGET_ARCH}" = "x86_64" ]; then
-            EFI_IMAGE="gummibootx64.efi"
-            DEST_EFI_IMAGE="bootx64.efi"
-        fi
-
-        install -d ${DEST}${EFIDIR}
-        # gummiboot requires these paths for configuration files
-        # they are not customizable so no point in new vars
-        install -d ${DEST}/loader
-        install -d ${DEST}/loader/entries
-        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE} ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_EFI_IMAGE" >${DEST}/startup.nsh
-        install -m 0644 ${GUMMIBOOT_CFG} ${DEST}/loader/loader.conf
-        for i in ${GUMMIBOOT_ENTRIES}; do
-            install -m 0644 ${i} ${DEST}/loader/entries
-        done
-}
-
-efi_iso_populate() {
-        iso_dir=$1
-        efi_populate $iso_dir
-        mkdir -p ${EFIIMGDIR}/${EFIDIR}
-        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
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
-python build_efi_cfg() {
-    s = d.getVar("S", True)
-    labels = d.getVar('LABELS', True)
-    if not labels:
-        bb.debug(1, "LABELS not defined, nothing to do")
-        return
-
-    if labels == []:
-        bb.debug(1, "No labels, nothing to do")
-        return
-
-    cfile = d.getVar('GUMMIBOOT_CFG', True)
-    try:
-         cfgfile = open(cfile, 'w')
-    except OSError:
-        bb.fatal('Unable to open %s' % cfile)
-
-    cfgfile.write('# Automatically created by OE\n')
-    cfgfile.write('default %s\n' % (labels.split()[0]))
-    timeout = d.getVar('GUMMIBOOT_TIMEOUT', True)
-    if timeout:
-        cfgfile.write('timeout %s\n' % timeout)
-    else:
-        cfgfile.write('timeout 10\n')
-    cfgfile.close()
-
-    for label in labels.split():
-        localdata = d.createCopy()
-
-        overrides = localdata.getVar('OVERRIDES', True)
-        if not overrides:
-            bb.fatal('OVERRIDES not defined')
-
-        entryfile = "%s/%s.conf" % (s, label)
-        d.appendVar("GUMMIBOOT_ENTRIES", " " + entryfile)
-        try:
-            entrycfg = open(entryfile, "w")
-        except OSError:
-            bb.fatal('Unable to open %s' % entryfile)
-        localdata.setVar('OVERRIDES', label + ':' + overrides)
-        bb.data.update_data(localdata)
-
-        entrycfg.write('title %s\n' % label)
-        entrycfg.write('linux /vmlinuz\n')
-
-        append = localdata.getVar('APPEND', True)
-        initrd = localdata.getVar('INITRD', True)
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
diff --git a/meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch b/meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
deleted file mode 100644
index fa50bc4..0000000
--- a/meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 55957faf1272c8f5f304909faeebf647a78e3701 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Sep 2015 07:19:45 +0000
-Subject: [PATCH] console: Fix C syntax errors for function declaration
-
-To address this, the semicolons after the function parameters should be
-replaced by commas, and the last one should be omitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/efi/console.c | 26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/src/efi/console.c b/src/efi/console.c
-index 6206c80..66aa88f 100644
---- a/src/efi/console.c
-+++ b/src/efi/console.c
-@@ -27,8 +27,8 @@
- struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
- 
- typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
--        BOOLEAN ExtendedVerification;
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        BOOLEAN ExtendedVerification
- );
- 
- typedef UINT8 EFI_KEY_TOGGLE_STATE;
-@@ -44,29 +44,29 @@ typedef struct {
- } EFI_KEY_DATA;
- 
- typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
--        EFI_KEY_DATA *KeyData;
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        EFI_KEY_DATA *KeyData
- );
- 
- typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
--        EFI_KEY_TOGGLE_STATE *KeyToggleState;
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        EFI_KEY_TOGGLE_STATE *KeyToggleState
- );
- 
- typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
--        EFI_KEY_DATA *KeyData;
-+        EFI_KEY_DATA *KeyData
- );
- 
- typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
--        EFI_KEY_DATA KeyData;
--        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction;
--        VOID **NotifyHandle;
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        EFI_KEY_DATA KeyData,
-+        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
-+        VOID **NotifyHandle
- );
- 
- typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
--        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
--        VOID *NotificationHandle;
-+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
-+        VOID *NotificationHandle
- );
- 
- typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
--- 
-2.5.1
-
diff --git a/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch b/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
deleted file mode 100644
index 49f5593..0000000
--- a/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 0f7f9e3bb1d0e1b93f3ad8a1d5d7bdd3fbf27494 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 27 Mar 2014 07:20:33 +0000
-Subject: [PATCH] Makefile.am: use objcopy from the env
-
-It uses the "objcopy" directly, which is not suitable for cross compile.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.am | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -19,6 +19,8 @@
- ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
- AM_MAKEFLAGS = --no-print-directory
- 
-+OBJCOPY ?= objcopy
-+
- gummibootlibdir = $(prefix)/lib/gummiboot
- 
- AM_CPPFLAGS = -include config.h
-@@ -148,7 +150,7 @@ $(gummiboot_solib): $(gummiboot_objects)
- .DELETE_ON_ERROR: $(gummboot_solib)
- 
- $(gummiboot): $(gummiboot_solib)
--	$(AM_V_GEN) objcopy -j .text -j .sdata -j .data -j .dynamic \
-+	$(AM_V_GEN) $(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic \
- 	  -j .dynsym -j .rel -j .rela -j .reloc \
- 	  --target=efi-app-$(ARCH) $< $@
- 
-@@ -183,7 +185,7 @@ $(stub_solib): $(stub_objects)
- .DELETE_ON_ERROR: $(gummboot_solib)
- 
- $(stub): $(stub_solib)
--	$(AM_V_GEN) objcopy -j .text -j .sdata -j .data -j .dynamic \
-+	$(AM_V_GEN) $(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic \
- 	  -j .dynsym -j .rel -j .rela -j .reloc \
- 	  --target=efi-app-$(ARCH) $< $@
- 
diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
deleted file mode 100644
index c684b83..0000000
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Gummiboot is a simple UEFI boot manager which executes configured EFI images."
-HOMEPAGE = "http://freedesktop.org/wiki/Software/gummiboot"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "gnu-efi util-linux"
-
-inherit autotools pkgconfig manpages
-inherit deploy
-
-PV = "48+git${SRCPV}"
-SRCREV = "2bcd919c681c952eb867ef1bdb458f1bc49c2d55"
-SRC_URI = "git://anongit.freedesktop.org/gummiboot \
-           file://fix-objcopy.patch \
-           file://0001-console-Fix-C-syntax-errors-for-function-declaration.patch \
-          "
-
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
-
-# Note: Add COMPATIBLE_HOST here is only because it depends on gnu-efi
-# which has set the COMPATIBLE_HOST, the gummiboot itself may work on
-# more hosts.
-COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = "--with-efi-includedir=${STAGING_INCDIR} \
-                --with-efi-ldsdir=${STAGING_LIBDIR} \
-                --with-efi-libdir=${STAGING_LIBDIR}"
-
-EXTRA_OEMAKE += "gummibootlibdir=${libdir}/gummiboot"
-
-TUNE_CCARGS_remove = "-mfpmath=sse"
-
-do_deploy () {
-        install ${B}/gummiboot*.efi ${DEPLOYDIR}
-}
-addtask deploy before do_build after do_compile
diff --git a/scripts/lib/wic/canned-wks/mkgummidisk.wks b/scripts/lib/wic/canned-wks/mkgummidisk.wks
deleted file mode 100644
index f3ae090..0000000
--- a/scripts/lib/wic/canned-wks/mkgummidisk.wks
+++ /dev/null
@@ -1,11 +0,0 @@
-# short-description: Create an EFI disk image
-# long-description: Creates a partitioned EFI disk image that the user
-# can directly dd to boot media.
-
-part /boot --source bootimg-efi --sourceparams="loader=gummiboot" --ondisk sda --label msdos --active --align 1024
-
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
-
-part swap --ondisk sda --size 44 --label swap1 --fstype=swap
-
-bootloader --ptable gpt --timeout=5  --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
-- 
2.10.1


