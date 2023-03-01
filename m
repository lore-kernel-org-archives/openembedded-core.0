Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F31C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 05:30:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.15556.1677648609085629346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 21:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E9DurXIx;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id q189so7042029pga.9
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 21:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9+CTbFyvzAaf0ODZoQchBza3NWitwAl1EDmsDO1LhM=;
        b=E9DurXIx7w4B9yd+jgdcc/2OsB5XgAV2HX0/Bql+b26UHJMmXy96g8gdKyQWvFUOiW
         aN4F/RaRkd0DcpQWkHO64q10WajjYpfjBrZ98Jhah9nTn8h4ZZqD4MezGR7k2LkMst3j
         jmYB3owb+P3zbIsqTIcJms3wYTfj2jDlNt9kwOu0dg0W76ekVAcnXuMCho4Nyi0CQ9jb
         VsUmCtz1dTOJFfmnt0ooU8gTetaRT5GwOhIWB8JVm+qWYRQ36ghmhwsBbNS/XQASDUDw
         hIbS1PfVUsKP79HEH5dVVHZxERdOcSElyzjBHpLy6R5r5dHCQRPxIWKg/lc+xa8ew+gI
         0OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9+CTbFyvzAaf0ODZoQchBza3NWitwAl1EDmsDO1LhM=;
        b=yMD8uKPtdvcxuto6KWvEVTlVMeGA4EKCLGXrMTd5uV6LINan75BIjaG5ElnDOJiBs0
         jBDcRW8ZvYSg7szju1ciDpxCSA1x899RaLqqxCldmBR0S0i5NTfCq9aDzG4SmzUy1I4l
         U9p9oWZhevHqk5Tao2IiK4hGNPASq7f0ueK/alYRAe+tF2kXvqWK94f1MNdBIR1Urb7J
         Rtu8vU2pfKA7aE2AuDHnarut0bqggz3n1yAfq86boIbU97+evZOm2nldrGfeBDxXF4hr
         QxGiCQ5s7HAdAxPpun9LW2XsNZoDuiqG9/N4OF72ZRHygyhHRfF0MXOyHq2ogMYIrN8W
         6HLg==
X-Gm-Message-State: AO0yUKVfxsCIhhI1Uozob1k6Zm8WRgUwLEk/33SM255RTJDGhsbSZX2+
	mjL1fjjAMr5+AyrWs3g+MUVIzBZIltk=
X-Google-Smtp-Source: AK7set8Xwg9SIfL5pwhQBbkVvWh5F2kc4uG1u7gH9hR4+m5nSSwHBuz4jWein9rwgMxfk5HyBM8fZw==
X-Received: by 2002:a62:1c07:0:b0:5a8:a467:f975 with SMTP id c7-20020a621c07000000b005a8a467f975mr2477067pfc.17.1677648607855;
        Tue, 28 Feb 2023 21:30:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id i2-20020aa79082000000b005a8c60ce93bsm7104608pfa.149.2023.02.28.21.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 21:30:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel: Add kernel specific OBJDUMP
Date: Tue, 28 Feb 2023 21:30:05 -0800
Message-Id: <20230301053005.3594047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 05:30:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177866

This helps in switching toolchains cleanly for kernel build
between gcc and clang

Currently, some kernels allow building with clang but not all
the distro might use clang as default system compiler but kernel
may demand gcc which is provided via KERNEL_* variables, however
kernel does use OBJCOPY at places during build and it maybe set
to use llvm objcopy when using clang. That should be a deliberate
setting when clang is used for kernel as well, otherwise it should
use binutils provided objcopy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass                      | 3 +++
 meta/classes-recipe/kernel-devicetree.bbclass                | 2 +-
 meta/classes-recipe/kernel-uboot.bbclass                     | 2 +-
 meta/classes-recipe/kernel-yocto.bbclass                     | 4 +++-
 meta/classes-recipe/kernel.bbclass                           | 2 +-
 meta/classes-recipe/module.bbclass                           | 5 +++--
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 ++-
 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb       | 4 ++--
 8 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 777f900241..5877048916 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -68,9 +68,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
 HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
+TARGET_OBJCOPY_KERNEL_ARCH ?= ""
+HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
 
diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index b2117de805..4d0ecb1032 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -68,7 +68,7 @@ do_compile:append() {
 
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
-		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" ${KERNEL_EXTRA_ARGS}
 	done
 }
 
diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index 4aab02671e..30a85ccc28 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -34,7 +34,7 @@ uboot_prep_kimage() {
 		linux_comp="${FIT_KERNEL_COMP_ALG}"
 	fi
 
-	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
+	[ -n "${vmlinux_path}" ] && ${KERNEL_OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
 
 	if [ "${linux_comp}" != "none" ] ; then
 		if [ "${linux_comp}" = "gzip" ] ; then
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 7de99cff56..108b7e6752 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -455,7 +455,7 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
 		bberror "Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 		if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
@@ -489,6 +489,7 @@ python do_config_analysis() {
     env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
     env['LD'] = d.getVar('KERNEL_LD')
     env['CC'] = d.getVar('KERNEL_CC')
+    env['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
 
@@ -550,6 +551,7 @@ python do_kernel_configcheck() {
     env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
     env['LD'] = d.getVar('KERNEL_LD')
     env['CC'] = d.getVar('KERNEL_CC')
+    env['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
 
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 4fbe84c4e4..3f9c6c00e6 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -234,7 +234,7 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
-EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}"'
+EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
 EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
 
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index d52d5e3098..b3b852be5f 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -32,6 +32,7 @@ python do_devshell:prepend () {
     os.environ['CC'] = d.getVar('KERNEL_CC')
     os.environ['LD'] = d.getVar('KERNEL_LD')
     os.environ['AR'] = d.getVar('KERNEL_AR')
+    os.environ['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
     os.environ['O'] = d.getVar('STAGING_KERNEL_BUILDDIR')
     kbuild_extra_symbols = d.getVar('KBUILD_EXTRA_SYMBOLS')
     if kbuild_extra_symbols:
@@ -45,7 +46,7 @@ module_do_compile() {
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
 		   KERNEL_VERSION=${KERNEL_VERSION}    \
 		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-		   AR="${KERNEL_AR}" \
+		   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
 		   ${MAKE_TARGETS}
@@ -55,7 +56,7 @@ module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
 	           INSTALL_FW_PATH="${D}${nonarch_base_libdir}/firmware" \
-	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 	           ${MODULES_INSTALL_TARGET}
 
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 38282e58f1..28e0807d1d 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -27,7 +27,8 @@ EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROS
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	for t in prepare scripts_basic scripts; do
-		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+		AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index 2181e45a8d..efe359ec32 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -21,12 +21,12 @@ do_compile() {
 	then
 		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
 		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-			   AR="${KERNEL_AR}" \
+			   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
 			   -C ${STAGING_KERNEL_DIR} scripts
 		oe_runmake KDIR=${STAGING_KERNEL_DIR}   \
 			   M="${S}/runtime/uprobes/" \
 			   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-			   AR="${KERNEL_AR}" \
+			   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
 			   -C "${S}/runtime/uprobes/"
 	fi
 }
-- 
2.39.2


