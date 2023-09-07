Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20E1EC875F
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 22:11:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.26525.1694124683997246256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 15:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cEEh/lr/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so16785665e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 15:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694124682; x=1694729482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7E9KB/72NUmlvZr1MGqUn3zEMdkxfOOSBWbls4x+ZKk=;
        b=cEEh/lr/i9HqREE+Psbc5TFTRcnSiYbRbnibKSqj12A9/duEB+UHUJMrM7MJ7Wcre3
         1ALCE5/DwUdQFyL6JVq8U0WLE00f7+M3lQOZwSeucSttfk1tJn7uAhVRh2wUT3+Wd5uJ
         TknUDPASgRpol0SdkOvY89c7p0KsmoiKbVNvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694124682; x=1694729482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7E9KB/72NUmlvZr1MGqUn3zEMdkxfOOSBWbls4x+ZKk=;
        b=FW4QKJ5vnbRmN4Avaj3mJ6LiO8Kgei252hcMEG61QreBTYAFrtid0/jXDME7jJL5AU
         5QoYNcG3/6GwJCZOd14XQe56FISZVdMexSYDb/B5zJ1oNyVsYHXGvtKHJvzs6XN6txp0
         rQVdpuO0F+VozWULyTiemaxKM5vi3zqopMd7hgn9/OOiA3i1ZnSRIlUSPA+c1nZSwpm7
         IxzauBuxWv5ZMYVUWak+oCBvxl1jimuR+2b86ozQuTJR5Sf5GueSfy9z4N3XM9A4WQEe
         p6rBZ2LAtB15Xp6z1bZFi6T4a6hgdWawN8vzHYvgFNTxgVyb5HezvzluZt46rgYMLmIC
         26Tg==
X-Gm-Message-State: AOJu0Yyd28KjOlBSbxTTSBM5riaXEXkuqW/nORKUOofHWYnZr1ke2qdT
	0IEkCrFZUzLbYK5NkUtrLVkV4qFG4mptWe+ftxg=
X-Google-Smtp-Source: AGHT+IHiqkqvXrIYLjCUjBDnPOtBPdRv3b9Y0zfu5tbr1whV13tB//IzRk/H8UoJgr42k6TOSI/eNQ==
X-Received: by 2002:a05:600c:3b17:b0:402:f5d8:6de7 with SMTP id m23-20020a05600c3b1700b00402f5d86de7mr369184wms.33.1694124681604;
        Thu, 07 Sep 2023 15:11:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f8cb:1f37:5b30:431c])
        by smtp.gmail.com with ESMTPSA id l12-20020a7bc44c000000b003fe61c33df5sm3565236wmi.3.2023.09.07.15.11.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 15:11:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes: Drop ';' delimiter from ROOTFS/IMAGE*COMMAND variables
Date: Thu,  7 Sep 2023 23:11:20 +0100
Message-Id: <20230907221120.3231358-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 22:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187398

Originally these were shell functions but they have long since been processed by
bb.build.exec_func(). Since we no longer need shell syntax, we can drop the ';'
delimiters and just use a space separated string.

This cleans up the variable and quietly removes any stray ';' that do happen to
still make it in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../classes-recipe/image-combined-dbg.bbclass |  2 +-
 meta/classes-recipe/image.bbclass             |  8 ++---
 meta/classes-recipe/license_image.bbclass     |  2 +-
 meta/classes-recipe/overlayfs-etc.bbclass     |  2 +-
 meta/classes-recipe/populate_sdk_base.bbclass | 13 ++++----
 meta/classes-recipe/populate_sdk_ext.bbclass  |  4 +--
 .../rootfs-postcommands.bbclass               | 30 +++++++++----------
 meta/classes-recipe/rootfsdebugfiles.bbclass  |  2 +-
 meta/classes/buildhistory.bbclass             | 26 ++++++++--------
 meta/classes/create-spdx-2.2.bbclass          |  6 ++--
 meta/classes/cve-check.bbclass                |  2 +-
 meta/classes/extrausers.bbclass               |  2 +-
 meta/classes/image-buildinfo.bbclass          |  4 +--
 meta/lib/oe/utils.py                          | 10 +++----
 .../images/build-appliance-image_15.0.0.bb    |  2 +-
 .../images/core-image-tiny-initramfs.bb       |  2 +-
 16 files changed, 58 insertions(+), 59 deletions(-)

diff --git a/meta/classes-recipe/image-combined-dbg.bbclass b/meta/classes-recipe/image-combined-dbg.bbclass
index dcf19685389..729313739c1 100644
--- a/meta/classes-recipe/image-combined-dbg.bbclass
+++ b/meta/classes-recipe/image-combined-dbg.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-IMAGE_PREPROCESS_COMMAND:append = " combine_dbg_image; "
+IMAGE_PREPROCESS_COMMAND:append = " combine_dbg_image"
 
 combine_dbg_image () {
         if [ "${IMAGE_GEN_DEBUGFS}" = "1" -a -e ${IMAGE_ROOTFS}-dbg ]; then
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 21b220a28db..003fa63eb70 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -25,7 +25,7 @@ inherit ${IMGCLASSES}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
-POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
+POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks"
 
 LICENSE ?= "MIT"
 PACKAGES = ""
@@ -657,8 +657,8 @@ create_merged_usr_symlinks_sdk() {
     create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
 }
 
-ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs; ', '',d)}"
-POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
+ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
+POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
 
 reproducible_final_image_task () {
     if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
@@ -678,6 +678,6 @@ systemd_preset_all () {
     fi
 }
 
-IMAGE_PREPROCESS_COMMAND:append = " ${@ 'systemd_preset_all;' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} reproducible_final_image_task; "
+IMAGE_PREPROCESS_COMMAND:append = " ${@ 'systemd_preset_all' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} reproducible_final_image_task "
 
 CVE_PRODUCT = ""
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 8560c27e934..fc859c7c659 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -272,7 +272,7 @@ def get_deployed_files(man_file):
             dep_files.append(os.path.basename(f))
     return dep_files
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest; license_create_manifest; "
+ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest license_create_manifest "
 do_rootfs[recrdeptask] += "do_populate_lic"
 
 python do_populate_lic_deploy() {
diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-recipe/overlayfs-etc.bbclass
index f8343106f3d..0c7834d01f4 100644
--- a/meta/classes-recipe/overlayfs-etc.bbclass
+++ b/meta/classes-recipe/overlayfs-etc.bbclass
@@ -31,7 +31,7 @@
 # Regardless which mode you choose, update and migration strategy of configuration files under /etc
 # overlay is out of scope of this class
 
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "overlayfs-etc", "create_overlayfs_etc_preinit;", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "overlayfs-etc", "create_overlayfs_etc_preinit", "", d)}'
 IMAGE_FEATURES_CONFLICTS_overlayfs-etc = "${@ 'package-management' if bb.utils.to_boolean(d.getVar('OVERLAYFS_ETC_USE_ORIG_INIT_NAME'), True) else ''}"
 
 OVERLAYFS_ETC_MOUNT_POINT ??= ""
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b23ea26d409..dfd4bb1d4d9 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -152,12 +152,12 @@ python write_host_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
-POPULATE_SDK_POST_TARGET_COMMAND:append = " write_sdk_test_data ; "
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  = " write_target_sdk_manifest; sdk_prune_dirs; "
-POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " write_host_sdk_manifest; "
+POPULATE_SDK_POST_TARGET_COMMAND:append = " write_sdk_test_data"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  = " write_target_sdk_manifest sdk_prune_dirs"
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " write_host_sdk_manifest"
 
-SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; archive_sdk; ${SDK_PACKAGING_COMMAND} "
+SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC}' if '${SDK_PACKAGING_FUNC}' else ''}"
+SDK_POSTPROCESS_COMMAND = "create_sdk_files check_sdk_sysroots archive_sdk ${SDK_PACKAGING_COMMAND}"
 
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
@@ -372,8 +372,7 @@ do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
 python () {
     variables = sdk_command_variables(d)
     for var in variables:
-        if d.getVar(var, False):
-            d.setVarFlag(var, 'func', '1')
+        d.setVarFlag(var, 'vardeps', d.getVar(var))
 }
 
 do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index fe656ed8243..028d0c1ff54 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -120,7 +120,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
 
-SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext = " write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
+SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext = " write_target_sdk_ext_manifest write_host_sdk_ext_manifest"    
 
 SDK_TITLE:task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} Extensible SDK"
 
@@ -743,7 +743,7 @@ sdk_ext_postinst() {
 
 SDK_POST_INSTALL_COMMAND:task-populate-sdk-ext = "${sdk_ext_postinst}"
 
-SDK_POSTPROCESS_COMMAND:prepend:task-populate-sdk-ext = "copy_buildsystem; install_tools; "
+SDK_POSTPROCESS_COMMAND:prepend:task-populate-sdk-ext = "copy_buildsystem install_tools "
 
 SDK_INSTALL_TARGETS = ""
 fakeroot python do_populate_sdk_ext() {
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 4492c9c0aa7..06388b72fb4 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -5,25 +5,25 @@
 #
 
 # Zap the root password if debug-tweaks and empty-root-password features are not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password ", "",d)}'
 
 # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-root-login is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login ", "",d)}'
 
 # Autologin the root user on the serial console, if empty-root-password and serial-autologin-root are active
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", [ 'empty-root-password', 'serial-autologin-root' ], "serial_autologin_root; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", [ 'empty-root-password', 'serial-autologin-root' ], "serial_autologin_root ", "",d)}'
 
 # Enable postinst logging if debug-tweaks or post-install-logging is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging ", "",d)}'
 
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp "
 
 # Tweak files in /etc if read-only-rootfs is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook ", "",d)}'
 
 # We also need to do the same for the kernel boot parameters,
 # otherwise kernel or initramfs end up mounting the rootfs read/write
@@ -34,20 +34,20 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
 APPEND:append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
 
 # Generates test data file with data store variables expanded in json format
-ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
+ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data "
 
 # Write manifest
 IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.manifest"
-ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
+ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest"
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "graphical.target", "multi-user.target", d)}'
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_sysusers_check;", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target systemd_sysusers_check", "", d)}'
 
-ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
+ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile'
 
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check overlayfs_postprocess", "", d)}'
 
 inherit image-artifact-names
 
@@ -63,10 +63,10 @@ inherit image-artifact-names
 # systemd_sysusers_create and set_user_group. Using :append is not
 # enough for that, set_user_group is added that way and would end
 # up running after us.
-SORT_PASSWD_POSTPROCESS_COMMAND ??= " tidy_shadowutils_files; "
+SORT_PASSWD_POSTPROCESS_COMMAND ??= "tidy_shadowutils_files"
 python () {
-    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
-    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
+    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', ' ${SORT_PASSWD_POSTPROCESS_COMMAND}')
+    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', ' rootfs_reproducible')
 }
 
 # Resolve the ID as described in the sysusers.d(5) manual: ID can be a numeric
diff --git a/meta/classes-recipe/rootfsdebugfiles.bbclass b/meta/classes-recipe/rootfsdebugfiles.bbclass
index cbcf876479e..4c2fc1de25e 100644
--- a/meta/classes-recipe/rootfsdebugfiles.bbclass
+++ b/meta/classes-recipe/rootfsdebugfiles.bbclass
@@ -34,7 +34,7 @@
 ROOTFS_DEBUG_FILES ?= ""
 ROOTFS_DEBUG_FILES[doc] = "Lists additional files or directories to be installed with 'cp -a' in the format 'source1 target1;source2 target2;...'"
 
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files;"
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files"
 rootfs_debug_files () {
    #!/bin/sh -e
    echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target mode; do
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 395f594278c..fd53e924021 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -691,28 +691,28 @@ python buildhistory_get_extra_sdkinfo() {
 
 # By using ROOTFS_POSTUNINSTALL_COMMAND we get in after uninstallation of
 # unneeded packages but before the removal of packaging files
-ROOTFS_POSTUNINSTALL_COMMAND += "buildhistory_list_installed_image ;"
-ROOTFS_POSTUNINSTALL_COMMAND += "buildhistory_get_image_installed ;"
-ROOTFS_POSTUNINSTALL_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_image ;| buildhistory_get_image_installed ;"
+ROOTFS_POSTUNINSTALL_COMMAND += "buildhistory_list_installed_image"
+ROOTFS_POSTUNINSTALL_COMMAND += "buildhistory_get_image_installed"
+ROOTFS_POSTUNINSTALL_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_image| buildhistory_get_image_installed"
 ROOTFS_POSTUNINSTALL_COMMAND[vardepsexclude] += "buildhistory_list_installed_image buildhistory_get_image_installed"
 
-IMAGE_POSTPROCESS_COMMAND += "buildhistory_get_imageinfo ;"
-IMAGE_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_imageinfo ;"
+IMAGE_POSTPROCESS_COMMAND += "buildhistory_get_imageinfo"
+IMAGE_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_imageinfo"
 IMAGE_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_imageinfo"
 
 # We want these to be the last run so that we get called after complementary package installation
-POPULATE_SDK_POST_TARGET_COMMAND:append = " buildhistory_list_installed_sdk_target;"
-POPULATE_SDK_POST_TARGET_COMMAND:append = " buildhistory_get_sdk_installed_target;"
-POPULATE_SDK_POST_TARGET_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_target;| buildhistory_get_sdk_installed_target;"
+POPULATE_SDK_POST_TARGET_COMMAND:append = " buildhistory_list_installed_sdk_target"
+POPULATE_SDK_POST_TARGET_COMMAND:append = " buildhistory_get_sdk_installed_target"
+POPULATE_SDK_POST_TARGET_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_target| buildhistory_get_sdk_installed_target"
 POPULATE_SDK_POST_TARGET_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_target buildhistory_get_sdk_installed_target"
 
-POPULATE_SDK_POST_HOST_COMMAND:append = " buildhistory_list_installed_sdk_host;"
-POPULATE_SDK_POST_HOST_COMMAND:append = " buildhistory_get_sdk_installed_host;"
-POPULATE_SDK_POST_HOST_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_host;| buildhistory_get_sdk_installed_host;"
+POPULATE_SDK_POST_HOST_COMMAND:append = " buildhistory_list_installed_sdk_host"
+POPULATE_SDK_POST_HOST_COMMAND:append = " buildhistory_get_sdk_installed_host"
+POPULATE_SDK_POST_HOST_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_host| buildhistory_get_sdk_installed_host"
 POPULATE_SDK_POST_HOST_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_host buildhistory_get_sdk_installed_host"
 
-SDK_POSTPROCESS_COMMAND:append = " buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
-SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
+SDK_POSTPROCESS_COMMAND:append = " buildhistory_get_sdkinfo buildhistory_get_extra_sdkinfo"
+SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo buildhistory_get_extra_sdkinfo"
 SDK_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_sdkinfo buildhistory_get_extra_sdkinfo"
 
 python buildhistory_write_sigs() {
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 844b674f6f1..aed1a94132c 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -930,12 +930,12 @@ spdx_get_src[vardepsexclude] += "STAGING_KERNEL_DIR"
 do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
 do_rootfs[cleandirs] += "${SPDXIMAGEWORK}"
 
-ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx ; "
+ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx"
 
 do_populate_sdk[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
 do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
-POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_combine_spdx; "
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_combine_spdx; "
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_combine_spdx"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_combine_spdx"
 
 python image_combine_spdx() {
     import os
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c1f1ea0fd63..55ae2980249 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -286,7 +286,7 @@ python cve_check_write_rootfs_manifest () {
         bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
+ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 94576b88729..c825c06df90 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -23,7 +23,7 @@ inherit useradd_base
 PACKAGE_INSTALL:append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
 
 # Image level user / group settings
-ROOTFS_POSTPROCESS_COMMAND:append = " set_user_group;"
+ROOTFS_POSTPROCESS_COMMAND:append = " set_user_group"
 
 # Image level user / group settings
 set_user_group () {
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 206cc9d57d6..b83ce650ad4 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -76,6 +76,6 @@ python buildinfo_sdk () {
     bb.build.exec_func("buildinfo", d)
 }
 
-IMAGE_PREPROCESS_COMMAND += "buildinfo_image;"
-POPULATE_SDK_PRE_TARGET_COMMAND += "buildinfo_sdk;"
+IMAGE_PREPROCESS_COMMAND += "buildinfo_image"
+POPULATE_SDK_PRE_TARGET_COMMAND += "buildinfo_sdk"
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 69ca8987f3d..ff2f310846a 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -258,11 +258,11 @@ def execute_pre_post_process(d, cmds):
     if cmds is None:
         return
 
-    for cmd in cmds.strip().split(';'):
-        cmd = cmd.strip()
-        if cmd != '':
-            bb.note("Executing %s ..." % cmd)
-            bb.build.exec_func(cmd, d)
+    cmds = cmds.replace(";", "")
+
+    for cmd in cmds.split():
+        bb.note("Executing %s ..." % cmd)
+        bb.build.exec_func(cmd, d)
 
 # For each item in items, call the function 'target' with item as the first 
 # argument, extraargs as the other arguments and handle any exceptions in the
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index b078b19a9d7..de041a7b7bb 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -117,7 +117,7 @@ fakeroot do_tweak_image () {
 	ln -rs ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/lib64
 }
 
-IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; do_tweak_image; "
+IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src do_tweak_image"
 # For pip usage above
 do_image[network] = "1"
 
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 96b56a2f59b..8af25f1b1fe 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -40,6 +40,6 @@ python tinyinitrd () {
     init.write(newinit)
 }
 
-IMAGE_PREPROCESS_COMMAND += "tinyinitrd;"
+IMAGE_PREPROCESS_COMMAND += "tinyinitrd"
 
 QB_KERNEL_CMDLINE_APPEND += "debugshell=3 init=/bin/busybox sh init"
-- 
2.39.2


