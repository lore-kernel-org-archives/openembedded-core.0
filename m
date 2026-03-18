Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3CB1088E60
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 23:31:15 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28204.1773876674442824363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 16:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=mOjjRXc8;
 dkim=pass header.i=@valla.it header.s=default header.b=eJaSlLLz;
 spf=pass (domain: valla.it, ip: 185.56.87.2, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	 b=cg6Kw7BbFVolFfqJN5ySLMSBMmt8/07cItuTHg8ViWaafvPsI6bBeCaaUaw60aHypzTlsqDzL/
	  y9VHg9beyeXDvywZxMW259KMZO1+9TOqyNurWOISbSVROvAuukUiY14vEQo15dhbG0MvTynRMo
	  edVL4si3GfbzPvmlG3sG4zvwvh4N7THZcU0wIhrLYXHwi0lPvRZRJTK0iaJtDU1HWzz+2MaD1J
	  RVHmfzN5Mynrlhsi7VrvkLhb8r5kmEVh2OZ9AR6GXFTZme+1kql0MR5kTGis0K3S/KfIJlLgYl
	  wr5MdWAIFxIk1R8K2BGqvDOPqk/4eKL1ESI5ddTCmKyLyQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	bh=eyagR5ixnG4RlnxU64InA//I/XgeohFqLE956Rt/7U4=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=iCfxHlJqacmBIkkOTSoR5i74rdXn3c7v47ilohWZdjdlYIOLNGcK/Ucj79shiqEEZ0HmBTs/lN
	  61WsJvgvqsXr6gwaswHuK4fS4I6fhwQ7T4CsGCBQYCJsH/Zf3aEFHcUaB4/Oy+kr3bhJ9FLtWr
	  geA1Pq60qCLyJcWILg1e4zf1DpPHe3+3Wa53iEZc3az2H5GKy6aLSOly5/J9xpe0CrbeHJCw0T
	  MJ9998LS0/5fwmJGjnpGeyUMf0OizFqTWl9P+CmqDf9Ps25G5QsA1trW4zcgHYAY9SKeFEANn9
	  GkCmQQInQ26mE1cm3+cvF/ewE64m2pKONZrPLY2azUImfA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=pJM+cQtBC7J6curDWgu+s4XFLODNQqRmkdyVgCdnD+I=; b=mOjjRXc8BsCajfPBb8qdWlpdxh
	eK3roBQ4CEXk8YEgfVRaPbYIYDQOQCgylOjLL04V6QbOL8fy8xfqZ3UqNeWbkaU7tTX5aIHL8GlWM
	1eCloYPwC/nClVXz6Mqr+9meLSfsk7eso/S1CnmzW9jU8e2B0UnbDbTycCYvUA3TA7qM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Ly-00000002v1J-0Ms1
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Mar 2026 23:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=pJM+cQtBC7J6curDWgu+s4XFLODNQqRmkdyVgCdnD+I=; b=eJaSlLLzCbYMJABn2nNvsHizJJ
	DCy11RZq5SHdYLilJQclB6/zPD14TwVO55g0SPTYY6zdI1R3xtBR5C2WkLTNmjaimer6fxQWHxtMb
	fR3AfNH29kuRsbOK56FFMyJRob5aSYWFIqpH06i5c8NCl1O8qe53lZOXZCoX1chkgIF4=;
Received: from [82.57.88.19] (port=60381 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Ls-00000000OEU-1aIF;
	Wed, 18 Mar 2026 23:31:00 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 19 Mar 2026 00:30:52 +0100
Subject: [PATCH RFC 4/4] kernel-fit-image: add bootconfig support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-bootconfig-v1-4-a4d467c3f0ba@valla.it>
References: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
In-Reply-To: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14658; i=francesco@valla.it;
 h=from:subject:message-id; bh=eyagR5ixnG4RlnxU64InA//I/XgeohFqLE956Rt/7U4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJm7TTevet64enNABP+RhtKLEkG1L2/PbP/W+u/RqXbvF
 xeemcSxdJSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQATCd7N8E/Lw0syLICVfX6x
 //H9py1OGiZ+S930O/PkhpvSs854TeBmZGjKvH4zNbLTeCHbOuuQ7IczMved1PuSq9Rtbzz11mP
 zDfwA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: da7a393fc58a44cad08d8f0c3def8f23
X-AntiAbuse: ID - da7a393fc58a44cad08d8f0c3def8f23
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w30Ly-00000002v1J-0Ms1-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 23:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233452

Support for bootconfig is added to generated FITs in two forms, both
depending on the FIT_INCLUDE_BOOTCONFIG being set to 1 to be enabled:

  - if INITRAMFS_IMAGE is set, a .bootconfig image will be searched
    instead of the plain or compressed cpio archives;
  - if INITRAMFS_IMAGE is not set, a dummy initramfs will be generated
    and the bootconfig specified in BOOTCONFIG_SRC will be attached to
    it.

The case where both FIT_INCLUDE_BOOTCONFIG and INITRAMFS_IMAGE_BUNDLE
are set to '1' is not supported, as it wouldn't work as expected on the
target device.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 44 +++++++++++++++++--
 meta/conf/image-fitimage.conf                |  3 ++
 meta/lib/oeqa/selftest/cases/fitimage.py     | 63 ++++++++++++++++++++++++----
 3 files changed, 98 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 367bc9bcfd3a4cd237e466269fa143941a02031a..9188723252912f2db6c9952798f66798cfe32b78 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -1,5 +1,5 @@
 
-inherit kernel-arch kernel-artifact-names uboot-config deploy
+inherit kernel-arch kernel-artifact-names uboot-config bootconfig-config deploy
 require conf/image-fitimage.conf
 
 S = "${UNPACKDIR}"
@@ -12,6 +12,7 @@ EXCLUDE_FROM_WORLD = "1"
 DEPENDS += "\
     u-boot-tools-native dtc-native \
     ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''} \
+    ${@'bootconfig-native' if (d.getVar('FIT_INCLUDE_BOOTCONFIG') == '1' and not d.getVar("INITRAMFS_IMAGE")) else ''} \
 "
 
 python () {
@@ -23,6 +24,9 @@ python () {
         else:
             d.appendVarFlag('do_compile', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
+    if not image and d.getVar('BOOTCONFIG_TASK') and d.getVar('FIT_INCLUDE_BOOTCONFIG') == '1':
+        d.appendVarFlag('do_compile', 'depends', ' ${BOOTCONFIG_TASK}')
+
     #check if there are any dtb providers
     providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
     if providerdtb:
@@ -54,8 +58,24 @@ FIT_KERNEL_SIGN_ENABLE ?= "${UBOOT_SIGN_ENABLE}"
 FIT_KERNEL_SIGN_KEYNAME ?= "${UBOOT_SIGN_KEYNAME}"
 FIT_KERNEL_SIGN_KEYDIR ?= "${UBOOT_SIGN_KEYDIR}"
 
+create_bootconfig_bin() {
+    if [ ! -e ${DEPLOY_DIR_IMAGE}/${BOOTCONFIG_SRC} ]; then
+        bbfatal "Did not find bootconfig source file: ${DEPLOY_DIR_IMAGE}/${BOOTCONFIG_SRC}"
+    fi
+
+    # Create empty file
+    dd if=/dev/zero of=bootconfig.bin count=0
+
+    # Add bootconfig to file
+    bootconfig -a ${DEPLOY_DIR_IMAGE}/${BOOTCONFIG_SRC} bootconfig.bin
+
+    # Re-read bootconfig
+    bootconfig -l bootconfig.bin
+}
+
 python do_compile() {
     import shutil
+    import subprocess
     import oe.fitimage
 
     itsfile = "fit-image.its"
@@ -135,10 +155,18 @@ python do_compile() {
 
     # Prepare a ramdisk section.
     initramfs_image = d.getVar('INITRAMFS_IMAGE')
-    if initramfs_image and d.getVar("INITRAMFS_IMAGE_BUNDLE") != '1':
+    if initramfs_image and d.getVar("INITRAMFS_IMAGE_BUNDLE") == '1':
+        bb.note("Initramfs is bundled with kernel image, not including it as ramdisk")
+        if d.getVar("FIT_INCLUDE_BOOTCONFIG") == '1':
+            bb.warn("FIT_INCLUDE_BOOTCONFIG not supported if INITRAMFS_IMAGE_BUNDLE is set. Bootconfig won't be included in the FIT image.")
+    elif initramfs_image:
         # Find and use the first initramfs image archive type we find
+        fstypes = d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split()
+        if d.getVar("FIT_INCLUDE_BOOTCONFIG") == '1':
+            bb.note("Including initramfs with bootconfig")
+            fstypes = [ "%s.bootconfig" % f for f in fstypes ]
         found = False
-        for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
+        for img in fstypes:
             initramfs_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), "%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
             if os.path.exists(initramfs_path):
                 bb.note("Found initramfs image: " + initramfs_path)
@@ -152,7 +180,15 @@ python do_compile() {
                 bb.note("Did not find initramfs image: " + initramfs_path)
 
         if not found:
-            bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_SUPPORTED_INITRAMFS_FSTYPES')))
+            bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), " ".join(fstypes)))
+    elif d.getVar("FIT_INCLUDE_BOOTCONFIG") == '1':
+        # Include bootconfig also without an initramfs, emitting a dedicated ramdisk section
+        bb.build.exec_func('create_bootconfig_bin', d)
+
+        root_node.fitimage_emit_section_ramdisk("ramdisk-1", "bootconfig.bin",
+            "bootconfig",
+            d.getVar("UBOOT_RD_LOADADDRESS"),
+            d.getVar("UBOOT_RD_ENTRYPOINT"))
 
     #
     # Prepare loadables sections
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 2fdb816d556c786dcc2c14cb149446eaddc2ff4b..b2178853f388e320710b3c0117799145795bf8f4 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -37,6 +37,9 @@ FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
 
+# Include bootconfig (either with or without initramfs)
+FIT_INCLUDE_BOOTCONFIG ?= "0"
+
 # Allow user to support special use cases where the kernel binary is
 # not included in the FIT image itself.
 # This is particularly useful for UKI-based setups, where the kernel
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3541c07520a8ee3f212471430792c31334d54278..3d3f7cc036253c6ecffa86d844a7113504447912 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -419,12 +419,15 @@ class KernelFitImageBase(FitImageTestCase):
         Call the get_bb_vars function once and get all variables needed by the test case.
         """
         internal_used = {
+            'BOOTCONFIG_SRC',
+            'BOOTCONFIG_TASK',
             'DEPLOY_DIR_IMAGE',
             'FIT_CONF_DEFAULT_DTB',
             'FIT_CONF_MAPPINGS',
             'FIT_CONF_PREFIX',
             'FIT_DESC',
             'FIT_HASH_ALG',
+            'FIT_INCLUDE_BOOTCONFIG',
             'FIT_KERNEL_COMP_ALG',
             'FIT_LOADABLES',
             'FIT_LOADABLE_ENTRYPOINT',
@@ -528,6 +531,7 @@ class KernelFitImageBase(FitImageTestCase):
             ]
         """
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        fit_include_bootconfig = bb_vars['FIT_INCLUDE_BOOTCONFIG']
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
@@ -552,7 +556,8 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             not_images.append('setup-1')
 
-        if initramfs_image and initramfs_image_bundle != "1":
+        if (initramfs_image and initramfs_image_bundle != "1") or \
+           (fit_include_bootconfig == "1" and not initramfs_image):
             images.append('ramdisk-1')
         else:
             not_images.append('ramdisk-1')
@@ -627,6 +632,7 @@ class KernelFitImageBase(FitImageTestCase):
         return (req_its_paths, not_req_its_paths)
 
     def _get_req_its_fields(self, bb_vars):
+        fit_include_bootconfig = bb_vars['FIT_INCLUDE_BOOTCONFIG']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
         uboot_rd_loadaddress = bb_vars.get('UBOOT_RD_LOADADDRESS')
@@ -643,7 +649,8 @@ class KernelFitImageBase(FitImageTestCase):
             'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
             'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
         ]
-        if initramfs_image and initramfs_image_bundle != "1":
+        if (initramfs_image and initramfs_image_bundle != "1") or \
+           (fit_include_bootconfig == "1" and not initramfs_image):
             its_field_check.append('type = "ramdisk";')
             if uboot_rd_loadaddress:
                 its_field_check.append("load = <%s>;" % uboot_rd_loadaddress)
@@ -666,11 +673,13 @@ class KernelFitImageBase(FitImageTestCase):
                 # Works only for tests were the symlink is with -alias suffix
                 its_field_check.append('fdt = "fdt-%s";' % dtb.replace('-alias', ''))
 
-            if initramfs_image and initramfs_image_bundle != "1":
+            if (initramfs_image and initramfs_image_bundle != "1") or \
+               (fit_include_bootconfig == "1" and not initramfs_image):
                 its_field_check.append('ramdisk = "ramdisk-1";')
         else:
             its_field_check.append('kernel = "kernel-1";')
-            if initramfs_image and initramfs_image_bundle != "1":
+            if (initramfs_image and initramfs_image_bundle != "1") or \
+               (fit_include_bootconfig == "1" and not initramfs_image):
                 its_field_check.append('ramdisk = "ramdisk-1";')
 
         return its_field_check
@@ -680,7 +689,8 @@ class KernelFitImageBase(FitImageTestCase):
         if bb_vars.get('UBOOT_SIGN_ENABLE') != "1":
             return {}
         sign_images = '"kernel", "fdt"'
-        if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1":
+        if (bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1") or \
+           (bb_vars['FIT_INCLUDE_BOOTCONFIG'] == "1" and not bb_vars['INITRAMFS_IMAGE']):
             sign_images += ', "ramdisk"'
         if bb_vars['FIT_UBOOT_ENV']:
             sign_images += ', "bootscr"'
@@ -705,6 +715,7 @@ class KernelFitImageBase(FitImageTestCase):
         """Generate a dictionary of expected sections in the output of dumpimage"""
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         fit_hash_alg = bb_vars['FIT_HASH_ALG']
+        fit_include_bootconfig = bb_vars['FIT_INCLUDE_BOOTCONFIG']
         fit_sign_alg = bb_vars['FIT_SIGN_ALG']
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
@@ -732,7 +743,8 @@ class KernelFitImageBase(FitImageTestCase):
         if fit_uboot_env:
             req_sections['bootscr-' + fit_uboot_env] = { "Type": "Script" }
         # Add the initramfs
-        if initramfs_image and initramfs_image_bundle != "1":
+        if (initramfs_image and initramfs_image_bundle != "1") or \
+           (fit_include_bootconfig == "1" and not initramfs_image):
             req_sections['ramdisk-1'] = {
                 "Type": "RAMDisk Image",
                 "Load Address": bb_vars['UBOOT_RD_LOADADDRESS'],
@@ -762,7 +774,8 @@ class KernelFitImageBase(FitImageTestCase):
                         "Kernel": "kernel-1",
                         "FDT": 'fdt-' + real_dtb,
                     }
-                if initramfs_image and initramfs_image_bundle != "1":
+                if (initramfs_image and initramfs_image_bundle != "1") or \
+                   (fit_include_bootconfig == "1" and not initramfs_image):
                     req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
                 if loadables:
                     req_sections[conf_name]['Loadables'] = ",".join(loadables)
@@ -771,7 +784,8 @@ class KernelFitImageBase(FitImageTestCase):
             req_sections[conf_name] = {
                 "Kernel": "kernel-1"
             }
-            if initramfs_image and initramfs_image_bundle != "1":
+            if (initramfs_image and initramfs_image_bundle != "1") or \
+               (fit_include_bootconfig == "1" and not initramfs_image):
                 req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
             if loadables:
                 req_sections[conf_name]['Loadables'] = ",".join(loadables)
@@ -886,6 +900,36 @@ FIT_LOADABLE_TYPE[loadable1] = "firmware"
 FIT_LOADABLE_FILENAME[loadable2] = "linux.bin"
 FIT_LOADABLE_LOADADDRESS[loadable2] = "0x87000000"
 FIT_LOADABLE_TYPE[loadable2] = "firmware"
+"""
+        config = self._config_add_kernel_classes(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
+    def test_fit_image_bootconfig(self):
+        """
+        Summary:     Verifies the content of the ramdisk node in the FIT Image Tree Source (its)
+                     The FIT settings are set by the test case.
+        Expected:    1. The ITS is generated with bootconfig but without initramfs
+                     2. The ramdisk node is present in the its file with the
+                        expected load and entrypoint
+
+        Product:     oe-core
+        Author:      Francesco Valla <francesco@valla.it>
+        """
+
+        config = """
+KERNEL_IMAGETYPE = "Image"
+
+INITRAMFS_IMAGE = ""
+INITRAMFS_SCRIPTS = ""
+UBOOT_RD_LOADADDRESS = "0x88000000"
+UBOOT_RD_ENTRYPOINT = "0x88000000"
+UBOOT_LOADADDRESS = "0x80080000"
+UBOOT_ENTRYPOINT = "0x80080000"
+BOOTCONFIG_SRC = "bootconfig-test.txt"
+BOOTCONFIG_TASK = "bootconfig-test:do_deploy"
+FIT_INCLUDE_BOOTCONFIG = "1"
 """
         config = self._config_add_kernel_classes(config)
         self.write_config(config)
@@ -1156,6 +1200,7 @@ class FitImagePyTests(KernelFitImageBase):
             'FIT_CONF_PREFIX': "conf-",
             'FIT_DESC': "Kernel fitImage for a dummy distro",
             'FIT_GENERATE_KEYS': "0",
+            'FIT_INCLUDE_BOOTCONFIG': "0",
             'FIT_HASH_ALG': "sha256",
             'FIT_KEY_GENRSA_ARGS': "-F4",
             'FIT_KEY_REQ_ARGS': "-batch -new",
@@ -1173,6 +1218,8 @@ class FitImagePyTests(KernelFitImageBase):
             'UBOOT_LOADADDRESS': "0x20008000",
             'INITRAMFS_IMAGE': "",
             'INITRAMFS_IMAGE_BUNDLE': "",
+            'BOOTCONFIG_SRC': "",
+            'BOOTCONFIG_TASK': "",
             # kernel-uboot.bbclass
             'FIT_KERNEL_COMP_ALG': "gzip",
             'FIT_KERNEL_COMP_ALG_EXTENSION': ".gz",

-- 
2.53.0


