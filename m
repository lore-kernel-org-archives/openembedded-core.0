Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFF1C3ABC9
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 15:54:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.13312.1746892466582260674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 08:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BM+jdmBG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440685d6afcso33534475e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746892464; x=1747497264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVYcWVPSkWUL/+Zg3EPnPBbZV6tOpofk+rj4+VSdR6w=;
        b=BM+jdmBGVS+wlClvSbWHRGZOnMdOTCyVtTajZkbfEqUANTqJXGcF9Wy2N9sRfQ/aGL
         pS0vjPjyNepUXh2ado2Jqp4H4RkHlXG8Q0tshAE/LSQC9jhoNBxp9a9fhRK8AKrWe5uF
         rcZH+um7lZmaUwRtmDCiIwGswWrYMAOx102+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746892464; x=1747497264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVYcWVPSkWUL/+Zg3EPnPBbZV6tOpofk+rj4+VSdR6w=;
        b=Ev8uWFB/gKF/Er0DqgpGw6nCU2yy0kTgDJ/Y5AaIqdBSEYr4rbiVTGWrANcDEIc2nU
         Wa5EDDDUoaKv1ujMcShSWmLd3u/xft+DesV6BMdNOBI7nahBkSTx88XUn1CJPnXT73QZ
         W6+jdIW3n89TKeqop7xKpGQr+tRJb9sJwvqQSmWXArAGP/60XxQmAhiQjZnl15i1yGfb
         c7lzmo2bLPtBC+IWm4mChYq/kKW0h5k4p+3TxmMScGhWDEpXix2naxQ0onyLPPpZLqLe
         I3YdccrUmAzi13RIezYCeYGp2ngTQWDGVRSEM1iMJ5sXxPqo7zF+J/R3zb9za3Wiyh/A
         /oUg==
X-Gm-Message-State: AOJu0Ywk6WERWvyXBcC4fDwILWYJ+8Vj+9DT+y6EioxTDkZONxbmKXkA
	5Z2NLsuiU42RPANrCvWBi1X6xE5aH7Gz9OS8aVVzYwQJvAc76omA9i81mGBHt3I25mM+VG3s93L
	+
X-Gm-Gg: ASbGnctcQpW2yGsU9w34n9bi08h5s7WLXpeua2HK2tG62nYnrxtAHm8OznItHE+nQSd
	Abqzg/9m0vm1qFc0S2iTpolVTEktGv/kmHJBvGv/PVLJWezOBVtyNk/OiKFb63+PnvW5KHSjqqa
	5kv/YuYDgpwNqA3yJBajZKQ71FbyfA20tKIWZYo4OXnjVm+Brdq0+78zNxTYNcjr2mIDyl6f1Qi
	onFLNkcYJwZ3cE8j1m8Sq8zgzAMMMLODtk0XEouWU+UZWLYRxgsfzRsmIZ6e2elG7SO4Q6IYfL8
	sQxZLdHIWsvk7LvJElj8zIJw2EN8wRkLi5jcrzQ1b6YkmT+RULY/TdpiLlJWdB1Dz7JN2Kiwsfw
	Tv6E=
X-Google-Smtp-Source: AGHT+IHO3hm08xqik9YVkU9mYcs66CeG7bSMzbPy2E+KK0oIHF9W4Ptjbg/RDbDuTd5xLGAG+EFe4Q==
X-Received: by 2002:a05:6000:186f:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a1f643acbemr5897189f8f.9.1746892462738;
        Sat, 10 May 2025 08:54:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a9b:4e3e:ebc0:91d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde0esm6858694f8f.18.2025.05.10.08.54.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:54:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf/pseudo: Switch from exclusion list to inclusion list
Date: Sat, 10 May 2025 16:54:21 +0100
Message-ID: <20250510155421.872076-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 15:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216275

Currently, pseudo tracks all files referenced within it's presence unless
they're listed in an exclusion list. The exclusion list has grown to be
fairly unwieldy.

This patch swaps PSEUDO_IGNORE_PATHS for PSEUDO_INCLUDE_PATHS which in
theory should be easier and more explicit to maintain.

This change does drop many directories from pseudo coverage including
/home and /tmp. There may be adapatations needed for recipes/classes
using pseudo in specific ways.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/license.bbclass           |  1 -
 meta/classes-global/sanity.bbclass            |  4 ++--
 meta/classes-global/sstate.bbclass            |  2 +-
 meta/classes-recipe/image.bbclass             |  4 ++--
 meta/classes-recipe/image_types_wic.bbclass   |  4 +---
 meta/classes-recipe/populate_sdk_base.bbclass |  4 ++--
 meta/classes/archiver.bbclass                 |  1 +
 meta/conf/bitbake.conf                        | 11 ++++-------
 meta/conf/multilib.conf                       |  2 --
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  2 --
 meta/recipes-core/glibc/glibc-locale.inc      |  2 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 scripts/lib/wic/partition.py                  |  8 ++++----
 13 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 94dcc7f331c..af5f1ed41df 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -44,7 +44,6 @@ python do_populate_lic() {
     oe.qa.exit_if_errors(d)
 }
 
-PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '') + ' ' + d.getVar('COREBASE') + '/meta/COPYING').split())}"
 # it would be better to copy them in do_install:append, but find_license_files is python
 python perform_packagecopy:prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 192582b82ec..d1452967fc1 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -733,14 +733,14 @@ def check_sanity_version_change(status, d):
         status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
 
     # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
-    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    pseudoignorepaths = (d.getVar('PSEUDO_IGNORE_PATHS', expand=True) or "").split(",")
     workdir = d.getVar('WORKDIR', expand=True)
     for i in pseudoignorepaths:
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
     # Check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
-    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    pseudoignorepaths = (d.getVar('PSEUDO_IGNORE_PATHS', expand=True) or "").split(",")
     pseudo_control_dir = "${D},${PKGD},${PKGDEST},${IMAGEROOTFS},${SDK_OUTPUT}"
     pseudocontroldir = d.expand(pseudo_control_dir).split(",")
     for i in pseudoignorepaths:
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2c259a66579..1d7b033b80a 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -76,7 +76,7 @@ SSTATE_SCAN_CMD_NATIVE ??= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_N
 SSTATE_HASHEQUIV_FILEMAP ?= " \
     populate_sysroot:*/postinst-useradd-*:${TMPDIR} \
     populate_sysroot:*/postinst-useradd-*:${COREBASE} \
-    populate_sysroot:*/postinst-useradd-*:regex-\s(PATH|PSEUDO_IGNORE_PATHS|HOME|LOGNAME|OMP_NUM_THREADS|USER)=.*\s \
+    populate_sysroot:*/postinst-useradd-*:regex-\s(PATH|PSEUDO_INCLUDE_PATHS|HOME|LOGNAME|OMP_NUM_THREADS|USER)=.*\s \
     populate_sysroot:*/crossscripts/*:${TMPDIR} \
     populate_sysroot:*/crossscripts/*:${COREBASE} \
     "
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index dc4ce5c0a93..24a19fce1ad 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -199,8 +199,6 @@ IMAGE_LOCALES_ARCHIVE ?= '1'
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo,${WORKDIR}/sstate-build-image_complete"
-
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
 
@@ -666,6 +664,8 @@ MULTILIBRE_ALLOW_REP += "${base_bindir} ${base_sbindir} ${bindir} ${sbindir} ${l
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
+PSEUDO_INCLUDE_PATHS .= ",${MULTILIB_TEMP_ROOTFS}"
+
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 1b422b62802..61f028bd7bd 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -30,7 +30,7 @@ WICVARS ?= "\
 	KERNEL_CONSOLE \
 	KERNEL_IMAGETYPE \
 	MACHINE \
-	PSEUDO_IGNORE_PATHS \
+	PSEUDO_INCLUDE_PATHS \
 	RECIPE_SYSROOT_NATIVE \
 	ROOTFS_SIZE \
 	STAGING_DATADIR \
@@ -96,8 +96,6 @@ IMAGE_CMD:wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
 SPDX_IMAGE_PURPOSE:wic = "diskImage"
 do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/build-wic"
-
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 238cb1ee6e9..8ef4b2be777 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -52,6 +52,8 @@ SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
 SDKDEPLOYDIR = "${WORKDIR}/${SDKMACHINE}-deploy-${PN}-populate-sdk"
 
+PSEUDO_INCLUDE_PATHS .= ",${SDK_DIR}"
+
 B:task-populate-sdk = "${SDK_DIR}"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
@@ -263,8 +265,6 @@ python do_populate_sdk_setscene () {
 }
 addtask do_populate_sdk_setscene
 
-PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR},${WORKDIR}/oe-sdk-repo,${WORKDIR}/sstate-build-populate_sdk"
-
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index df271feddd0..a95c899a0f8 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -166,6 +166,7 @@ python () {
             d.appendVarFlag('do_package_write_rpm', 'dirs', ' ${ARCHIVER_RPMTOPDIR}')
             d.appendVarFlag('do_package_write_rpm', 'sstate-inputdirs', ' ${ARCHIVER_RPMTOPDIR}')
             d.appendVarFlag('do_package_write_rpm', 'sstate-outputdirs', ' ${DEPLOY_DIR_SRC}')
+            d.appendVar('PSEUDO_INCLUDE_PATHS', ',${ARCHIVER_TOPDIR}')
             if ar_dumpdata == "1":
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_dumpdata' % pn)
             if ar_recipe == "1":
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1dae172678..e5037c62778 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -744,18 +744,15 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR}"
-PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
-PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
+PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_INCLUDE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_INCLUDE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_INCLUDE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_INCLUDE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 FAKEROOTLOGS = "${WORKDIR}/pseudo/pseudo.log"
@@ -965,7 +962,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
-BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
+BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_INCLUDE_PATHS BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_ADDITIONS DISABLE_SANITY_CHECKS \
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 86d1f8c1447..6163405be4f 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -12,8 +12,6 @@ STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT:class-native = "${WORKDIR}/recipe-sysroot"
 
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${MLPREFIX}recipe-sysroot"
-
 INHERIT += "multilib_global"
 
 BBCLASSEXTEND:append = " ${MULTILIBS}"
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 8c9cfa0c542..04af74bbb1a 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -175,7 +175,6 @@ TEST_RUNQEMUPARAMS += " slirp"
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
         features += 'GPG_PATH = "%s"\n' % self.gpg_home
-        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
         self.write_config(features)
 
         bitbake('core-image-full-cmdline socat')
@@ -212,7 +211,6 @@ TEST_RUNQEMUPARAMS += " slirp"
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
         features += 'GPG_PATH = "%s"\n' % self.gpg_home
-        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
         self.write_config(features)
 
         # Build core-image-sato and testimage
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index c63c9edd769..90248bbc0f1 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -65,6 +65,8 @@ FILES:${LOCALEBASEPN}-locale-alias = "${datadir}/locale/locale.alias"
 
 LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
+PSEUDO_INCLUDE_PATHS .= ",${WORKDIR}/locale-tree"
+
 copy_locale_files() {
 	local dir=$1 mode=$2
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5e2a8bf3281..d7528d336b1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "3fac97341f0f8270ca28a91098d0a58ca306a6bd"
+SRCREV = "2c43381180f9cfef4c0a8bb0c1658a86c3fcc876"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b18431d8fb8..5b51ab214fe 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -222,19 +222,19 @@ class Partition():
         if (pseudo_dir):
             # Canonicalize the ignore paths. This corresponds to
             # calling oe.path.canonicalize(), which is used in bitbake.conf.
-            ignore_paths = [rootfs] + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or "").split(",")
+            include_paths = [rootfs_dir] + (get_bitbake_var("PSEUDO_INCLUDE_PATHS") or "").split(",")
             canonical_paths = []
-            for path in ignore_paths:
+            for path in include_paths:
                 if "$" not in path:
                     trailing_slash = path.endswith("/") and "/" or ""
                     canonical_paths.append(os.path.realpath(path) + trailing_slash)
-            ignore_paths = ",".join(canonical_paths)
+            include_paths = ",".join(canonical_paths)
 
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % ignore_paths
+            pseudo += "export PSEUDO_INCLUDE_PATHS=%s;" % include_paths
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None

