Return-Path: <yw.byun@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B950D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:58:58 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10689.1764313129059255714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: yw.byun@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 28 Nov 2025 15:58:45 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: yw.byun@lge.com
Received: from unknown (HELO ywbyun..) (10.157.68.141)
	by 156.147.1.127 with ESMTP; 28 Nov 2025 15:58:45 +0900
X-Original-SENDERIP: 10.157.68.141
X-Original-MAILFROM: yw.byun@lge.com
From: Yangwoo Byun <yw.byun@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Yangwoo Byun <yw.byun@lge.com>
Subject: [scarthgap][PATCH] Fix create_merged_usr_symlinks in image.bbclass
Date: Fri, 28 Nov 2025 15:58:40 +0900
Message-Id: <20251128065840.4104806-1-yw.byun@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226898

Modifying FILESYSTEM_PERMS_TABLES does not change the UID and GID of
/usr/bin

I modified create_merged_usr_symlinks and
moved its execution order back

Signed-off-by: Yangwoo Byun <yw.byun@lge.com>
---
 meta/classes-recipe/image.bbclass | 50 ++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 00f1d58f237..2f5210d0e0b 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -684,21 +684,51 @@ deltask do_package_write_rpm
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
 
@@ -710,8 +740,8 @@ create_merged_usr_symlinks_sdk() {
     create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
 }
 
-ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
-POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
+ROOTFS_POSTPROCESS_COMMAND:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
+POPULATE_SDK_POST_TARGET_COMMAND:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
 
 reproducible_final_image_task () {
     if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then

