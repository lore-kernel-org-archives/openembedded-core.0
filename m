Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF390EB64DB
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:31:21 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.3882.1686904275047293834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 01:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YO0JEN20;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-75ebccc2c9bso49417685a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686904274; x=1689496274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WQgTpYRmTyBJUVwl04CZnbiBLqtS8NKsFcG2MT0ZjQ=;
        b=YO0JEN208jzlLM1Q8yLiZvgNznPXZOOM6lglH3HSixgXQICiLrGURsX3IbkWLdmndl
         rrT+Ky4AEomTqXGrTysK3NBn6Drr/FD0KmW8jyxomRo/TOShGsnY3QPGvVT7Vv9OMXSO
         8OdbOsIEXRkb+KW3WzboLzPIMpoeOZ/knFUaTGs17/YUTCCe0BT7Gzze0N/mbIZLPAoM
         zqmFDx/9RmaR98E1ACwDl/C9R/PLp3HniZz3l6iGhi/Ki/bK86u/s4DXghfD/06ICqQe
         9G+Z0emPLkE0luxoRontFKWZTJJMWqyYxDNdJ8iLkMjJnnOXLYAblebOePjUoMmDUX20
         F2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904274; x=1689496274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WQgTpYRmTyBJUVwl04CZnbiBLqtS8NKsFcG2MT0ZjQ=;
        b=XCH1efZOq8kIkoHHsVO+WlIrHyIgxTlwk7HXU2BKb6QkbuBezv5bp9+wtTgDveQTEw
         +Y4r0uXFXBsPxLKE7dTvGUvOGZGI4K7SoORH/6plyhOd+UBuvSpw2iWP34O3hzgMZwbo
         mRac64GvAOzDU4E+wrhx9FIGlBpSWXBcbe3IOU6I/OTHIToEuuarUTESMf1D5VasXXZP
         KFDioVUIGhnZ4AkfZMn6Ruk13FawbjYRCwGNu7fxZEII+njUNE7LFOb+1CiNkDkDpEja
         zmlw5z1dH7I4cTy9UQpRWaFEu7wpe6MbY3PuALCjUq5G094LTmBb5vZkceR3qhSY4UFq
         XlqA==
X-Gm-Message-State: AC+VfDxugUgb0kKlTyiq8AmkQvVMbx/KGqbGNBrTCKvDyULTlhW8AYSB
	tpioVpFTD2XehPUsdPaoKQ1GOdf5DE8=
X-Google-Smtp-Source: ACHHUZ4MFnmg6+g4nnvH8LRydZmPV9CBqy4NUHaCPjT8xyv5K5dNBq2WBiN6qNFllHSaQg4j+r1uXg==
X-Received: by 2002:a05:620a:3d03:b0:760:8673:f92 with SMTP id tq3-20020a05620a3d0300b0076086730f92mr984899qkn.27.1686904273641;
        Fri, 16 Jun 2023 01:31:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020aa78d52000000b00653dc27acadsm12969145pfe.205.2023.06.16.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:31:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 1/5] kernel: Add kernel specific STRIP variable
Date: Fri, 16 Jun 2023 01:31:07 -0700
Message-ID: <20230616083111.3007680-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183001

strip can be coming from binutils or from llvm
in some cases llvm-strip can fail on kernel

Subprocess output:aarch64-yoe-linux-llvm-strip: error: Link field value 28 in section .rela.dyn is not a symbol table

This helps in selecting which strip is used when building kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass                    | 3 +++
 meta/classes-recipe/kernel-devicetree.bbclass              | 2 +-
 meta/classes-recipe/kernel-yocto.bbclass                   | 4 +++-
 meta/classes-recipe/kernel.bbclass                         | 6 +++++-
 meta/classes-recipe/module.bbclass                         | 7 +++++++
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 1 +
 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb     | 2 ++
 7 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 58770489167..6e19dbbba89 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -70,10 +70,13 @@ TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
+TARGET_STRIP_KERNEL_ARCH ?= ""
+HOST_STRIP_KERNEL_ARCH ?= "${TARGET_STRIP_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_STRIP = "${CCACHE}${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
 
diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index 7ccf4b76c82..eff052b4029 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -73,7 +73,7 @@ do_compile:append() {
 
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
-		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" ${KERNEL_EXTRA_ARGS}
+		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}" ${KERNEL_EXTRA_ARGS}
 	done
 }
 
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index ceb451b6996..3f2ce17aeb8 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -447,7 +447,7 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
 		bberror "Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 		if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
@@ -482,6 +482,7 @@ python do_config_analysis() {
     env['LD'] = d.getVar('KERNEL_LD')
     env['CC'] = d.getVar('KERNEL_CC')
     env['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
+    env['STRIP'] = d.getVar('KERNEL_STRIP')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
 
@@ -544,6 +545,7 @@ python do_kernel_configcheck() {
     env['LD'] = d.getVar('KERNEL_LD')
     env['CC'] = d.getVar('KERNEL_CC')
     env['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
+    env['STRIP'] = d.getVar('KERNEL_STRIP')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
 
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 5ed4a2e03c7..c1d74bf54ad 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -241,7 +241,7 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
-EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}"'
+EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
 EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
 
@@ -340,6 +340,10 @@ kernel_do_transform_bundled_initramfs() {
 }
 do_transform_bundled_initramfs[dirs] = "${B}"
 
+python do_package:prepend () {
+    os.environ['STRIP'] = d.getVar('KERNEL_STRIP')
+}
+
 python do_devshell:prepend () {
     os.environ["LDFLAGS"] = ''
 }
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index b3b852be5f6..f2f0b25a2d1 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -20,6 +20,10 @@ python __anonymous () {
     d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
 }
 
+python do_package:prepend () {
+    os.environ['STRIP'] = d.getVar('KERNEL_STRIP')
+}
+
 python do_devshell:prepend () {
     os.environ['CFLAGS'] = ''
     os.environ['CPPFLAGS'] = ''
@@ -33,6 +37,7 @@ python do_devshell:prepend () {
     os.environ['LD'] = d.getVar('KERNEL_LD')
     os.environ['AR'] = d.getVar('KERNEL_AR')
     os.environ['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
+    os.environ['STRIP'] = d.getVar('KERNEL_STRIP')
     os.environ['O'] = d.getVar('STAGING_KERNEL_BUILDDIR')
     kbuild_extra_symbols = d.getVar('KBUILD_EXTRA_SYMBOLS')
     if kbuild_extra_symbols:
@@ -47,6 +52,7 @@ module_do_compile() {
 		   KERNEL_VERSION=${KERNEL_VERSION}    \
 		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 		   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
+		   STRIP="${KERNEL_STRIP}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
 		   ${MAKE_TARGETS}
@@ -57,6 +63,7 @@ module_do_install() {
 	oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
 	           INSTALL_FW_PATH="${D}${nonarch_base_libdir}/firmware" \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
+	           STRIP="${KERNEL_STRIP}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 	           ${MODULES_INSTALL_TARGET}
 
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 28e0807d1d6..e3b258753f3 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -29,6 +29,7 @@ do_configure() {
 	for t in prepare scripts_basic scripts; do
 		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 		AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
+		STRIP="${KERNEL_STRIP}" \
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index efe359ec329..3d35481bdc9 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -22,11 +22,13 @@ do_compile() {
 		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
 		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 			   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
+			   STRIP="${KERNEL_STRIP}" \
 			   -C ${STAGING_KERNEL_DIR} scripts
 		oe_runmake KDIR=${STAGING_KERNEL_DIR}   \
 			   M="${S}/runtime/uprobes/" \
 			   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 			   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
+			   STRIP="${KERNEL_STRIP}" \
 			   -C "${S}/runtime/uprobes/"
 	fi
 }
-- 
2.41.0


