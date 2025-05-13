Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B38C54757
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:45 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.88512.1747172435452327468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=d9Bsf1nz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2025051321403583efb4665a9434f39d-gue6tm@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025051321403583efb4665a9434f39d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oi3gKULn648VuJYxsJVgNq8G4VXFHDsDERnj+6GEBis=;
 b=d9Bsf1nzq44lpXbgb+wEp3zMl+nVwmZLlzw8IUgkTeFoYOa+EA4eoxAubnwsQD7ZrD/8/A
 vOnWt8/9mrzf0ybEXE5aRLDh6mMYto+ulxKRUSi4gtxYGxL44yihMhzlAcAt/z0fWWyAOrn7
 1T/6crniWRSGMfWJf5g5aA1PI/cXihE8tpmegwohHQMtFNVny1pH04CxLKUzbUjB90Yo2YdM
 hoj87TLTkm/MKHUsgEyuJ+3VJTf1n/8G+1mTENPld0DYJj7+s6EhqtZZTEHXt2ZxR9XqkvTN
 aZSf5hiad07SWEbsTCZ0AENO5ejTqvLTmHnz28/OH8NHVWa8lbgUFk8A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 19/22] kernel-fitimage.bbclass: remove it
Date: Tue, 13 May 2025 23:37:01 +0200
Message-ID: <20250513213834.87830-20-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216465

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The integration of the FIT image-related build steps into the kernel
recipe has proven to be not very good. The new implementation with
kernel-fit-image.bbclass fixes some design issues:

* sstate does not work well when a fitImage contains an initramfs. The
  kernel is rebuilt from scratch if the build runs from an empty TMPDIR.
* A fitImage kernel is not available as a package, but all other kernel
  image types are.
* The task dependencies in the kernel are very complex and difficult to
  debug if something goes wrong. As a separate, downstream recipe, this
  is now much easier.

The long storry about this issue is here:
[YOCTO #12912]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 284 --------------------
 meta/classes-recipe/kernel-uboot.bbclass    |  45 ----
 2 files changed, 329 deletions(-)
 delete mode 100644 meta/classes-recipe/kernel-fitimage.bbclass

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
deleted file mode 100644
index 58d1cc458b4..00000000000
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ /dev/null
@@ -1,284 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit kernel-uboot kernel-artifact-names uboot-config
-require conf/image-fitimage.conf
-
-def get_fit_replacement_type(d):
-    kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
-    replacementtype = ""
-    if 'fitImage' in kerneltypes.split():
-        uarch = d.getVar("UBOOT_ARCH")
-        if uarch == "arm64":
-            replacementtype = "Image"
-        elif uarch == "riscv":
-            replacementtype = "Image"
-        elif uarch == "mips":
-            replacementtype = "vmlinuz.bin"
-        elif uarch == "x86":
-            replacementtype = "bzImage"
-        elif uarch == "microblaze":
-            replacementtype = "linux.bin"
-        else:
-            replacementtype = "zImage"
-    return replacementtype
-
-KERNEL_IMAGETYPE_REPLACEMENT ?= "${@get_fit_replacement_type(d)}"
-DEPENDS:append = " \
-    ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''} \
-    ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''} \
-"
-
-python __anonymous () {
-    # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-    # to kernel.bbclass . We have to override it, since we pack zImage
-    # (at least for now) into the fitImage .
-    typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
-    if 'fitImage' in typeformake.split():
-        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
-
-    image = d.getVar('INITRAMFS_IMAGE')
-    if image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
-        if d.getVar('INITRAMFS_MULTICONFIG'):
-            mc = d.getVar('BB_CURRENT_MC')
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
-        else:
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-
-    #check if there are any dtb providers
-    providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
-    if providerdtb:
-        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
-        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
-}
-
-def fitimage_assemble(d, itsfile, fitname, ramdiskcount):
-    import shutil
-    import glob
-    import oe.fitimage
-
-    DTBS=""
-    default_dtb_image=""
-
-    for f in [itsfile, os.path.join("arch", d.getVar("ARCH"), "boot", fitname)]:
-        if os.path.exists(f):
-            os.remove(f)
-
-    root_node = oe.fitimage.ItsNodeRootKernel(
-        d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
-        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
-        d.getVar('UBOOT_SIGN_ENABLE') == "1", d.getVar("UBOOT_SIGN_KEYDIR"),
-        d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
-        d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
-        d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
-        d.getVar('UBOOT_SIGN_KEYNAME'),
-        d.getVar('FIT_SIGN_INDIVIDUAL') == "1", d.getVar('UBOOT_SIGN_IMG_KEYNAME')
-    )
-
-    #
-    # Step 1: Prepare a kernel image section.
-    #
-    linux_comp = uboot_prep_kimage_py(d)
-    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
-        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
-        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
-
-    #
-    # Step 2: Prepare a DTB image section
-    #
-    if d.getVar("KERNEL_DEVICETREE"):
-        for DTB in d.getVar("KERNEL_DEVICETREE").split():
-            if "/dts/" in DTB:
-                bb.warn(f"{DTB} contains the full path to the dts file, but only the dtb name should be used.")
-                DTB = os.path.basename(DTB).replace(".dts", ".dtb")
-
-            # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE
-            if d.getVar("EXTERNAL_KERNEL_DEVICETREE"):
-                ext_dtb_path = os.path.join(d.getVar("EXTERNAL_KERNEL_DEVICETREE"), DTB)
-                if os.path.exists(ext_dtb_path) and os.path.getsize(ext_dtb_path) > 0:
-                    continue
-
-            DTB_PATH = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), "dts", DTB)
-            if not os.path.exists(DTB_PATH):
-                DTB_PATH = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), DTB)
-
-            # Strip off the path component from the filename
-            if not oe.types.boolean(d.getVar("KERNEL_DTBVENDORED")):
-                DTB = os.path.basename(DTB)
-
-            # Set the default dtb image if it exists in the devicetree.
-            if d.getVar("FIT_CONF_DEFAULT_DTB") == DTB:
-                default_dtb_image = DTB.replace("/", "_")
-
-            DTB = DTB.replace("/", "_")
-
-            # Skip DTB if we've picked it up previously
-            if DTB in DTBS.split():
-                continue
-
-            DTBS += " " + DTB
-
-            root_node.fitimage_emit_section_dtb(DTB, DTB_PATH,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
-
-    if d.getVar("EXTERNAL_KERNEL_DEVICETREE"):
-        dtb_files = []
-        for ext in ['*.dtb', '*.dtbo']:
-            dtb_files.extend(sorted(glob.glob(os.path.join(d.getVar("EXTERNAL_KERNEL_DEVICETREE"), ext))))
-
-        for dtb_path in dtb_files:
-            dtb_name = os.path.relpath(dtb_path, d.getVar("EXTERNAL_KERNEL_DEVICETREE"))
-            dtb_name_underscore = dtb_name.replace('/', '_')
-
-            # Set the default dtb image if it exists in the devicetree.
-            if d.getVar("FIT_CONF_DEFAULT_DTB") == dtb_name:
-                default_dtb_image = dtb_name_underscore
-
-            # Skip DTB/DTBO if we've picked it up previously
-            if dtb_name_underscore in DTBS.split():
-                continue
-
-            DTBS += " " + dtb_name_underscore
-
-            # Also skip if a symlink. We'll later have each config section point at it
-            if oe.fitimage.symlink_points_below(dtb_name, d.getVar("EXTERNAL_KERNEL_DEVICETREE")):
-                continue
-
-            root_node.fitimage_emit_section_dtb(dtb_name_underscore, dtb_path,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
-
-    if d.getVar("FIT_CONF_DEFAULT_DTB") and not default_dtb_image:
-        bb.warn("%s is not available in the list of device trees." % d.getVar('FIT_CONF_DEFAULT_DTB'))
-
-    #
-    # Step 3: Prepare a u-boot script section
-    #
-    fit_uboot_env = d.getVar("FIT_UBOOT_ENV")
-    if fit_uboot_env:
-        unpack_dir = d.getVar("UNPACKDIR")
-        shutil.copy(os.path.join(unpack_dir, fit_uboot_env), fit_uboot_env)
-        root_node.fitimage_emit_section_boot_script("bootscr-"+fit_uboot_env , fit_uboot_env)
-
-    #
-    # Step 4: Prepare a setup section. (For x86)
-    #
-    setup_bin_path = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), "setup.bin")
-    if os.path.exists(setup_bin_path):
-        root_node.fitimage_emit_section_setup("setup-1", setup_bin_path)
-
-    #
-    # Step 5: Prepare a ramdisk section.
-    #
-    if ramdiskcount == 1 and d.getVar("INITRAMFS_IMAGE_BUNDLE") != "1":
-        # Find and use the first initramfs image archive type we find
-        found = False
-        for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
-            initramfs_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), "%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
-            if os.path.exists(initramfs_path):
-                bb.note("Found initramfs image: " + initramfs_path)
-                found = True
-                root_node.fitimage_emit_section_ramdisk("ramdisk-%d" % ramdiskcount, initramfs_path,
-                    d.getVar('INITRAMFS_IMAGE'),
-                    d.getVar("UBOOT_RD_LOADADDRESS"),
-                    d.getVar("UBOOT_RD_ENTRYPOINT"))
-                break
-            else:
-                bb.note("Did not find initramfs image: " + initramfs_path)
-
-        if not found:
-            bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_SUPPORTED_INITRAMFS_FSTYPES')))
-
-    # Generate the configuration section
-    root_node.fitimage_emit_section_config()
-
-    #
-    # Write the ITS file
-    root_node.write_its_file(itsfile)
-
-    #
-    # Step 7: Assemble the image
-    #
-    fitfile = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), fitname)
-    root_node.run_mkimage_assemble(itsfile, fitfile)
-
-    #
-    # Step 8: Sign the image if required
-    #
-    root_node.run_mkimage_sign(fitfile)
-
-
-python do_assemble_fitimage() {
-    if "fitImage" in d.getVar("KERNEL_IMAGETYPES").split():
-        os.chdir(d.getVar("B"))
-        fitimage_assemble(d, "fit-image.its", "fitImage-none", "")
-        if d.getVar("INITRAMFS_IMAGE_BUNDLE") != "1":
-            link_name = os.path.join(d.getVar("B"), d.getVar("KERNEL_OUTPUT_DIR"), "fitImage")
-            if os.path.islink(link_name):
-                os.unlink(link_name)
-            os.symlink("fitImage-none", link_name)
-}
-
-addtask assemble_fitimage before do_install after do_compile
-
-do_install:append() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		[ "${UBOOT_SIGN_ENABLE}" = "1" ]; then
-		install -D ${B}/${KERNEL_OUTPUT_DIR}/fitImage-none ${D}/sysroot-only/fitImage
-	fi
-}
-
-python do_assemble_fitimage_initramfs() {
-    if "fitImage" in d.getVar("KERNEL_IMAGETYPES").split() and d.getVar("INITRAMFS_IMAGE"):
-        os.chdir(d.getVar("B"))
-        if d.getVar("INITRAMFS_IMAGE_BUNDLE") == "1":
-            fitimage_assemble(d, "fit-image-%s.its" % d.getVar("INITRAMFS_IMAGE"), "fitImage-bundle", "")
-            link_name =  os.path.join(d.getVar("B"), d.getVar("KERNEL_OUTPUT_DIR"), "fitImage")
-            if os.path.islink(link_name):
-                os.unlink(link_name)
-            os.symlink("fitImage-bundle", link_name)
-        else:
-            fitimage_assemble(d, "fit-image-%s.its" % d.getVar("INITRAMFS_IMAGE"), "fitImage-%s" % d.getVar("INITRAMFS_IMAGE"), 1)
-}
-
-addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
-
-kernel_do_deploy[vardepsexclude] = "DATETIME"
-kernel_do_deploy:append() {
-	# Update deploy directory
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-			bbnote "Copying fit-image.its source file..."
-			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
-			fi
-
-			bbnote "Copying linux.bin file..."
-			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
-			fi
-		fi
-
-		if [ -n "${INITRAMFS_IMAGE}" ]; then
-			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
-			fi
-
-			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
-				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
-				fi
-			fi
-		fi
-	fi
-}
diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index 888664678d1..7aafd4757c2 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -67,48 +67,3 @@ do_install:append() {
 		install -D ${B}/${KERNEL_OUTPUT_DIR}/setup.bin ${D}/sysroot-only/setup.bin
 	fi
 }
-
-def uboot_prep_kimage_py(d):
-    import subprocess
-
-    arch = d.getVar('ARCH')
-    initramfs_image_bundle = d.getVar('INITRAMFS_IMAGE_BUNDLE')
-    fit_kernel_comp_alg = d.getVar('FIT_KERNEL_COMP_ALG') or 'gzip'
-    fit_kernel_comp_alg_extension = d.getVar('FIT_KERNEL_COMP_ALG_EXTENSION') or '.gz'
-    kernel_objcopy = d.getVar('KERNEL_OBJCOPY')
-
-    vmlinux_path = ""
-    linux_suffix = ""
-    linux_comp = "none"
-
-    if os.path.exists(f'arch/{arch}/boot/compressed/vmlinux'):
-        vmlinux_path = f'arch/{arch}/boot/compressed/vmlinux'
-    elif os.path.exists(f'arch/{arch}/boot/vmlinuz.bin'):
-        if os.path.exists('linux.bin'):
-            os.remove('linux.bin')
-        os.link(f'arch/{arch}/boot/vmlinuz.bin', 'linux.bin')
-    else:
-        vmlinux_path = 'vmlinux'
-        # Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
-        # As per the implementation in kernel.bbclass.
-        # See do_bundle_initramfs function
-        if initramfs_image_bundle == '1' and os.path.exists('vmlinux.initramfs'):
-            vmlinux_path = 'vmlinux.initramfs'
-        linux_suffix = fit_kernel_comp_alg_extension
-        linux_comp = fit_kernel_comp_alg
-
-    if vmlinux_path:
-        subprocess.run([kernel_objcopy.strip(), '-O', 'binary', '-R', '.note', '-R', '.comment', '-S', os.path.abspath(vmlinux_path), 'linux.bin'], check=True)
-        # if ret.returncode != 0:
-        # bb.fatal(f"Error: stderr: {ret.stderr.decode('utf-8')}   stdout: {ret.stdout.decode('utf-8')}, vmlinux_path: {os.path.abspath(vmlinux_path)}, pwd: {os.getcwd()}, args: {ret.args}")
-
-    if linux_comp != "none":
-        if linux_comp == "gzip":
-            subprocess.run(['gzip', '-9', 'linux.bin'], check=True)
-        elif linux_comp == "lzo":
-            subprocess.run(['lzop', '-9', 'linux.bin'], check=True)
-        elif linux_comp == "lzma":
-            subprocess.run(['xz', '--format=lzma', '-f', '-6', 'linux.bin'], check=True)
-        os.rename(f'linux.bin{linux_suffix}', 'linux.bin')
-
-    return linux_comp
-- 
2.49.0


