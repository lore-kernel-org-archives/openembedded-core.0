Return-Path: <yw.byun@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEF6C2A073
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 02:51:07 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56497.1767581456828923658
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jan 2026 18:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: yw.byun@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 5 Jan 2026 11:50:54 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: yw.byun@lge.com
Received: from unknown (HELO ywbyun..) (10.157.68.141)
	by 156.147.1.127 with ESMTP; 5 Jan 2026 11:50:54 +0900
X-Original-SENDERIP: 10.157.68.141
X-Original-MAILFROM: yw.byun@lge.com
From: Yangwoo Byun <yw.byun@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Yangwoo Byun <yw.byun@lge.com>
Subject: [PATCH] Fix create_merged_usr_symlinks in populate_sdk_base.bbclass and image.bbclass
Date: Mon,  5 Jan 2026 11:50:50 +0900
Message-Id: <20260105025050.153889-1-yw.byun@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 02:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228859

Modifying FILESYSTEM_PERMS_TABLES does not change the UID and GID of
/usr/bin.
To change the UID and GID of /usr/bin in FILESYSTEM_PERMS_TABLES to
something other than root:root, we need to modify
the create_merged_usr_symlinks function.
The ":append" method allows us to apply changes inserted in the middle
by applying the create_merged_usr_symlinks function at the end of
the execution order.

Signed-off-by: Yangwoo Byun <yw.byun@lge.com>
---
 meta/classes-recipe/image.bbclass             |  2 +-
 meta/classes-recipe/populate_sdk_base.bbclass | 48 +++++++++++++++----
 2 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 53f1a9dc45b..2d90b29c8c5 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -686,7 +686,7 @@ create_merged_usr_symlinks_rootfs() {
     create_merged_usr_symlinks ${IMAGE_ROOTFS}
 }
 
-ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
+ROOTFS_POSTPROCESS_COMMAND:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
 
 reproducible_final_image_task () {
     if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 8e671cf28fa..cafd9a5698a 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -186,21 +186,51 @@ POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " write_host_sdk_manif
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
     root="$1"
-    install -d $root${base_bindir} $root${base_sbindir} $root${base_libdir}
-    ln -rs $root${base_bindir} $root/bin
-    ln -rs $root${base_sbindir} $root/sbin
-    ln -rs $root${base_libdir} $root/${baselib}
+
+    if [ ! -d "$root${base_bindir}" ]; then
+        install -d "$root${base_bindir}"
+    fi
+
+    if [ ! -d "$root${base_sbindir}" ]; then
+        install -d "$root${base_sbindir}"
+    fi
+
+    if [ ! -d "$root${base_libdir}" ]; then
+        install -d "$root${base_libdir}"
+    fi
+
+    if [ ! -e "$root/bin" ]; then
+        ln -rs "$root${base_bindir}" "$root/bin"
+    fi
+
+    if [ ! -e "$root/sbin" ]; then
+        ln -rs "$root${base_sbindir}" "$root/sbin"
+    fi
+
+    if [ ! -e "$root/${baselib}" ]; then
+        ln -rs "$root${base_libdir}" "$root/${baselib}"
+    fi
 
     if [ "${nonarch_base_libdir}" != "${base_libdir}" ]; then
-       install -d $root${nonarch_base_libdir}
-       ln -rs $root${nonarch_base_libdir} $root/lib
+        if [ ! -d "$root${nonarch_base_libdir}" ]; then
+            install -d "$root${nonarch_base_libdir}"
+        fi
+
+        if [ ! -e "$root/lib" ]; then
+            ln -rs "$root${nonarch_base_libdir}" "$root/lib"
+        fi
     fi
 
     # create base links for multilibs
     multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
     for d in $multi_libdirs; do
-        install -d $root${exec_prefix}/$d
-        ln -rs $root${exec_prefix}/$d $root/$d
+        if [ ! -d "$root${exec_prefix}/$d" ]; then
+            install -d "$root${exec_prefix}/$d"
+        fi
+
+        if [ ! -e "$root/$d" ]; then
+            ln -rs "$root${exec_prefix}/$d" "$root/$d"
+        fi
     done
 }
 
@@ -208,7 +238,7 @@ create_merged_usr_symlinks_sdk() {
     create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
 }
 
-POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
+POPULATE_SDK_POST_TARGET_COMMAND:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
 
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC}' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = "create_sdk_files check_sdk_sysroots archive_sdk ${SDK_PACKAGING_COMMAND}"

