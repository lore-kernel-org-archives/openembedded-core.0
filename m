Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77EDE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 16:03:32 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.64883.1735574603730995964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 08:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=OtIahtVA;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=087d82423=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1735574603; x=1767110603;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U+1XE1/cGbUdC54MlJYtU6pXqvErgYuO3023drZYmyQ=;
  b=OtIahtVA/ANpY0nB+qzscJTBuFx1fCMesT0htiRUOn5+w4pq2lbINSrP
   M+WxGFOiYruzJBj/z6WqVDDk27GIuOml+G8Eo4dgJ4jt40aD18XvYrQ3j
   GVDaAwlEmFMW6P3zbdBVhR4XrVrOdKvK+UVK2fa++QGknCws3pH+A2I4E
   A=;
X-CSE-ConnectionGUID: 8nbHB7IPR0GD9SAmbr7Vlw==
X-CSE-MsgGUID: YAwON3ooTCqxj3iaOMxM/A==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 30 Dec 2024 17:03:21 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw1.muc with ESMTP/TLS;
 30 Dec 2024 17:03:20 +0100
Received: from smucmp07b.bmwgroup.net (HELO SMUCMP07b.europe.bmw.corp) ([10.30.13.60])
 by esabb2.muc with ESMTP/TLS; 30 Dec 2024 17:03:20 +0100
Received: from localhost.localdomain (10.30.85.215) by SMUCMP07b.europe.bmw.corp
 (2a03:1e80:a15:58f::220b) with Microsoft SMTP Server (version=TLS;
 Mon, 30 Dec 2024 17:03:19 +0100
X-CSE-ConnectionGUID: 7EglMMZAToiQ4jnhO/MsAQ==
X-CSE-MsgGUID: +BzsMgFYTdqvDGDDYneQ1g==
X-CSE-ConnectionGUID: bVkklub1Rcu/bNWl3eUGQw==
X-CSE-MsgGUID: TLuh9mrhSg+FV1qMavpFfQ==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH] sdk: Support usrmerge in toolchain SDK builds
Date: Mon, 30 Dec 2024 16:58:36 +0100
Message-ID: <20241230155836.838692-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp09b.europe.bmw.corp (2a03:1e80:a15:58f::203f) To
 SMUCMP07b.europe.bmw.corp (2a03:1e80:a15:58f::220b)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209164

SDKs which aren't built from an image recipe should also come with
drop-in symlinks for `/bin`, `/lib` and `/sbin`. Support this by moving
the common functionality into `populate_sdk_base` and enabling the
symlink creation when the `usrmerge` DISTRO_FEATURE is on.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-recipe/image.bbclass             | 26 ------------------
 meta/classes-recipe/populate_sdk_base.bbclass | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index eda3c6d0f38..84a2017eb51 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -681,37 +681,11 @@ deltask do_package_write_ipk
 deltask do_package_write_deb
 deltask do_package_write_rpm
 
-# Prepare the root links to point to the /usr counterparts.
-create_merged_usr_symlinks() {
-    root="$1"
-    install -d $root${base_bindir} $root${base_sbindir} $root${base_libdir}
-    ln -rs $root${base_bindir} $root/bin
-    ln -rs $root${base_sbindir} $root/sbin
-    ln -rs $root${base_libdir} $root/${baselib}
-
-    if [ "${nonarch_base_libdir}" != "${base_libdir}" ]; then
-       install -d $root${nonarch_base_libdir}
-       ln -rs $root${nonarch_base_libdir} $root/lib
-    fi
-
-    # create base links for multilibs
-    multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
-    for d in $multi_libdirs; do
-        install -d $root${exec_prefix}/$d
-        ln -rs $root${exec_prefix}/$d $root/$d
-    done
-}
-
 create_merged_usr_symlinks_rootfs() {
     create_merged_usr_symlinks ${IMAGE_ROOTFS}
 }
 
-create_merged_usr_symlinks_sdk() {
-    create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
-}
-
 ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
-POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
 
 reproducible_final_image_task () {
     if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 031c65f05f3..98ac723552c 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -175,6 +175,33 @@ POPULATE_SDK_POST_TARGET_COMMAND:append = " write_sdk_test_data"
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  = " write_target_sdk_manifest sdk_prune_dirs"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " write_host_sdk_manifest"
 
+# Prepare the root links to point to the /usr counterparts.
+create_merged_usr_symlinks() {
+    root="$1"
+    install -d $root${base_bindir} $root${base_sbindir} $root${base_libdir}
+    ln -rs $root${base_bindir} $root/bin
+    ln -rs $root${base_sbindir} $root/sbin
+    ln -rs $root${base_libdir} $root/${baselib}
+
+    if [ "${nonarch_base_libdir}" != "${base_libdir}" ]; then
+       install -d $root${nonarch_base_libdir}
+       ln -rs $root${nonarch_base_libdir} $root/lib
+    fi
+
+    # create base links for multilibs
+    multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
+    for d in $multi_libdirs; do
+        install -d $root${exec_prefix}/$d
+        ln -rs $root${exec_prefix}/$d $root/$d
+    done
+}
+
+create_merged_usr_symlinks_sdk() {
+    create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
+}
+
+POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
+
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC}' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = "create_sdk_files check_sdk_sysroots archive_sdk ${SDK_PACKAGING_COMMAND}"
 

