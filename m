Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E441C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:40:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9686.1634218853360908883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h2rOWJob;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u18so19723650wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c7b2ye657IYVgOiwE/mzOoYV1iFnwrjXXSkXEpwahTU=;
        b=h2rOWJobw31IcTg9u9Ee+y+jmN+W6gsRBVg9xlIO9wX0VA63Ck/i+TVmAj8DUGn66R
         0GRvgcDsFzu+UMb7v8GTsurWk6rFNy3PRudFMJahFzJ4cFC/YIz4FHWiDsjm4ZGxnly0
         uzdYmGP6KdhYk8/KpEtEo5ptuj34Nm2vnDpTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c7b2ye657IYVgOiwE/mzOoYV1iFnwrjXXSkXEpwahTU=;
        b=CW9D7vt/0AkhzlNgrWhOJGKLBDJVPgHkLYM40M8y+yCa1TGiOLEjKbF8yNZ33SpTJV
         VPQ0wkwoBVIGRaIScOzxE5ItIhQpim1JWKzYEFF4VxvgCiHuvv69vmlsJw2ve++zDDrq
         +5UkG+XbJMylPBxHgn1iCFaKKIFvFXhxnrssL+mSSwd7InvcTZ8c71xjRRe8puBNZi4b
         FrTrB4/b/XTBAQ/c/YY6SF0xxro0Obydjcha+tHlXK54DS2+Us7xbal8Zq77gp8VKM+U
         LXjPCCgw3iLearnwukjsKkkqnvIsWiI34ZKxtBwwYTZC1UaA8+dGFdKqqGJsPbBAtPKV
         6pRg==
X-Gm-Message-State: AOAM532zx9W/DF1NbNocCxok0pMTRVF9/+dSobaQrlWV+HskTHhbR6tx
	KXsl10iPrn3cKhce2seIYOEnZfs0ZkM=
X-Google-Smtp-Source: 
 ABdhPJw2f8w8R+ySQqh7zrJKcpeEoVo6ZQghYtkIn4IGpTtoB/n0OGexHGVZQRK9H1nFP5CZ5VUrow==
X-Received: by 2002:adf:ff86:: with SMTP id j6mr6633610wrr.59.1634218851493;
        Thu, 14 Oct 2021 06:40:51 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 k22sm2422676wrd.59.2021.10.14.06.40.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:40:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v2] reproducible: Drop BUILD_REPRODUCIBLE_BINARIES
 variable
Date: Thu, 14 Oct 2021 14:40:49 +0100
Message-Id: <20211014134049.2917058-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014134049.2917058-1-richard.purdie@linuxfoundation.org>
References: <20211014134049.2917058-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:40:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156956

We want things to be reproduicble and the variable doesn't really change
much any more. Drop the remaining uses and make those code paths always
active.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-prelink.bbclass    | 13 ++++---------
 meta/classes/image.bbclass            | 14 ++++++--------
 meta/conf/bitbake.conf                |  1 -
 meta/lib/oe/sstatesig.py              |  2 +-
 meta/recipes-core/busybox/busybox.inc | 10 ++++------
 5 files changed, 15 insertions(+), 25 deletions(-)

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


