Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B5BE86B24D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:40:53 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 07:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="275315444"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 07:40:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 17:40:48 +0300
Message-Id: <ed3170be112571814659eee1b6cc8d42d34aae0e.1375195205.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375195205.git.laurentiu.palcu@intel.com>
References: <cover.1375195205.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375195205.git.laurentiu.palcu@intel.com>
References: <cover.1375195205.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] adt_installer: allow specifying relative target sysroot paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jul 2013 14:40:53 -0000

If one specifies a relative target sysroot path, then he/she must always
be in the same directory in order to be able to compile.

With this patch, adt_installer will automatically convert user
supplied relative paths to absolute.

[YOCTO #4955]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../installer/adt-installer/adt_installer          |    4 ++++
 .../adt-installer/scripts/adt_installer_internal   |    2 ++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 58728af..a6042b9 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -272,6 +272,10 @@ download_images()
   select_sysroot_image=`eval echo $select_sysroot_image_var`
   select_sysroot=`eval echo $select_sysroot_var`
 
+  if [ -n "$select_sysroot" ]; then
+    select_sysroot=`readlink -m $select_sysroot`
+  fi
+
   if [ "$select_rootfs" != "" ]; then
     if [ $2 ]; then
     #echo_info "\n############################################################################"
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 7931ff5..462199c 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -242,6 +242,8 @@ target_sysroot=`eval echo $target_sysroot_var`
 
 if [ "$target_sysroot" == "" ]; then
   return 0
+else
+  target_sysroot=`readlink -m $target_sysroot`
 fi
 
 target_sysroot_image_var="\$YOCTOADT_TARGET_SYSROOT_IMAGE_$1"
-- 
1.7.9.5


