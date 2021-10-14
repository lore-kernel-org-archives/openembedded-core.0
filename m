Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A545C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:10:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.8459.1634213431596824983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uukh0R7q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id r18so18789616wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F6JY7Jqt7AdVzhtthU0Uph59xQR6GvYvYc65EmwVlzA=;
        b=Uukh0R7qHAMNftpvePlbD2XVNTspVEnsB+UspN7Udoui7t9Q0GIrw2v9+/jaes7n8S
         JOh+SpR+/Ds43HolL79LsrLolsVbtyVuA6OD/gbE80qXHYn9SIONqHo5IF1NdGM4KM3h
         0FT+1US+fxeKmiNrSwviQd7p1MG1IHpgeocaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6JY7Jqt7AdVzhtthU0Uph59xQR6GvYvYc65EmwVlzA=;
        b=QFp/9Cs/jMBzJFz7n1Uug8Z/ngD6DqlkbWtdZgNkU59vJHcTHLOJJbda1xnWzmG2mT
         3/uuCx0KNEQlIwsOa5l/PEpmLlE8Ire5fSU15rrw7LCE9VnDvjMTfvVv3AG6dibquBTE
         7xXRaqtDaHZoJE67v2S8rObWSrr7R/Chug8/2V839ZrKqpVoFUD1g9FBdokGu8aIVfcf
         rEZh2XKbUam//Y4kCMcCDJUeVncV9z1tAl4moKSnCXSQ9/ec9+yJaArZ7Q20OmMyOfXm
         fNp1cUpdKpNCe0xmuXuHAZkKZInDnJITKsaT3yFAnDX3cqOINQYkQ3ysFy7JwA1sVx1B
         iaZg==
X-Gm-Message-State: AOAM533BPA0uU2aebaTmMI0sIwqHu5y9Gce5wlfVLQVYa41lHmkKV0Ud
	YFSJiGx1yqk4O0Xf6SkFyZOaTf70cPlVbA==
X-Google-Smtp-Source: 
 ABdhPJxDNIA9l4OfmBtLQETd4tRlqzVmOCzvRrcuiwU8oeFwvWJwHcwqehw/XC+fWoqR4wWNkfyl0w==
X-Received: by 2002:adf:ab1c:: with SMTP id q28mr6312334wrc.39.1634213429907;
        Thu, 14 Oct 2021 05:10:29 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 10sm4296152wme.27.2021.10.14.05.10.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:10:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] reproducible: Drop BUILD_REPRODUCIBLE_BINARIES variable
Date: Thu, 14 Oct 2021 13:10:25 +0100
Message-Id: <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:10:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156943

We want things to be reproduicble and the variable doesn't really change
much any more. Drop the remaining uses and make those code paths always
active.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-prelink.bbclass    | 13 ++-----
 meta/classes/image.bbclass            | 14 +++----
 meta/classes/kernel.bbclass           | 54 +++++++++++++--------------
 meta/conf/bitbake.conf                |  1 -
 meta/lib/oe/sstatesig.py              |  2 +-
 meta/recipes-core/busybox/busybox.inc | 10 ++---
 6 files changed, 41 insertions(+), 53 deletions(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 0da094a5518..8158eeaf4ca 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -46,17 +46,12 @@ prelink_image () {
 	dynamic_loader=${@get_linuxloader(d)}
 
 	# prelink!
-	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		bbnote " prelink: BUILD_REPRODUCIBLE_BINARIES..."
-		if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
-			export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
-		else
-			export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
-		fi
-		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+	if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+		export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
 	else
-		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+		export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
 	fi
+	${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
 
 	# Remove the prelink.conf if we had to add it.
 	if [ "$dummy_prelink_conf" = "true" ]; then
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c2f32320278..2fa69a40d10 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -651,17 +651,15 @@ ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge'
 POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
 
 reproducible_final_image_task () {
-    if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
+    if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+        REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
         if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
-            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
-            if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
-                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
-            fi
+            REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
         fi
-        # Set mtime of all files to a reproducible value
-        bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
-        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
     fi
+    # Set mtime of all files to a reproducible value
+    bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
+    find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
 }
 
 systemd_preset_all () {
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4acec1877e0..3dd9b4446db 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -324,21 +324,20 @@ addtask bundle_initramfs after do_install before do_deploy
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP="$ts"
-		export KCONFIG_NOTIMESTAMP=1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
+	# be set....
+	if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
+		# The source directory is not necessarily a git repository, so we
+		# specify the git-dir to ensure that git does not query a
+		# repository in any parent directory.
+		SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
 	fi
+
+	ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
+	export KBUILD_BUILD_TIMESTAMP="$ts"
+	export KCONFIG_NOTIMESTAMP=1
+	bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
 	# case where we are making a second pass at the kernel
@@ -364,21 +363,20 @@ kernel_do_compile() {
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP="$ts"
-		export KCONFIG_NOTIMESTAMP=1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
+	# be set....
+	if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
+		# The source directory is not necessarily a git repository, so we
+		# specify the git-dir to ensure that git does not query a
+		# repository in any parent directory.
+		SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
 	fi
+
+	ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
+	export KBUILD_BUILD_TIMESTAMP="$ts"
+	export KCONFIG_NOTIMESTAMP=1
+	bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1db9b3fc051..790f2f7a8c4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -636,7 +636,6 @@ SDE_DIR = "${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
 SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 
-BUILD_REPRODUCIBLE_BINARIES = "1"
 export PYTHONHASHSEED = "0"
 export PERL_HASH_SEED = "0"
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index c2e3e2f4f58..038404e377a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -489,7 +489,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     include_timestamps = False
     include_root = True
     if task == "package":
-        include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
+        include_timestamps = True
         include_root = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 808c3dc7009..622325aabb3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -110,9 +110,8 @@ python () {
 }
 
 do_prepare_config () {
-	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		export KCONFIG_NOTIMESTAMP=1
-	fi
+	export KCONFIG_NOTIMESTAMP=1
+
 	sed -e '/CONFIG_STATIC/d' \
 		< ${WORKDIR}/defconfig > ${S}/.config
 	echo "# CONFIG_STATIC is not set" >> .config
@@ -143,9 +142,8 @@ do_configure () {
 
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		export KCONFIG_NOTIMESTAMP=1
-	fi
+	export KCONFIG_NOTIMESTAMP=1
+
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
 		# split the .config into two parts, and make two busybox binaries
 		if [ -e .config.orig ]; then
-- 
2.32.0


