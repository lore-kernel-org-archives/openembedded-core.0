Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E5B716AD22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:59:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jun 2013 05:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,936,1363158000"; d="scan'208";a="355422548"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2013 04:59:59 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2013 14:59:05 +0300
Message-Id: <ac45ce55a62afe3df0425fb9adfd4b217fe818a6.1372161097.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372161097.git.laurentiu.palcu@intel.com>
References: <cover.1372161097.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372161097.git.laurentiu.palcu@intel.com>
References: <cover.1372161097.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] populate_sdk_base, adt_installer: abort install if path contains spaces
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
X-List-Received-Date: Tue, 25 Jun 2013 11:59:14 -0000

Spaces are not handled properly in some parts of oe-core and it's safer
to abort toolchain installation if path contains spaces. Even though
we fix space handling in the toolchain installation script, there are
various other parts in the toolchain (perl scripts, sysroot path passed to
toolchain binaries, shebang lines) that would need special handling. So,
for now, just bail out if path contains spaces.

The checking for spaces in the path is done after expanding relative
paths to absolute and tilde conversion.

[YOCTO #4488]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass             |   13 +++++++++----
 .../installer/adt-installer/adt_installer          |   13 +++++++++----
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index e5bc0b4..31e848d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -181,11 +181,16 @@ else
 	echo "$target_sdk_dir"
 fi
 
-eval target_sdk_dir=$target_sdk_dir
-if [ -d $target_sdk_dir ]; then
-	target_sdk_dir=$(cd $target_sdk_dir; pwd)
+eval target_sdk_dir=$(printf "%q" "$target_sdk_dir")
+if [ -d "$target_sdk_dir" ]; then
+	target_sdk_dir=$(cd "$target_sdk_dir"; pwd)
 else
-	target_sdk_dir=$(readlink -m $target_sdk_dir)
+	target_sdk_dir=$(readlink -m "$target_sdk_dir")
+fi
+
+if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
+	echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
+	exit 1
 fi
 
 if [ -e "$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}" ]; then
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index c012391..58728af 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -339,11 +339,16 @@ if [ "$INSTALL_FOLDER" = "" ]; then
     INSTALL_FOLDER=$DEFAULT_INSTALL_FOLDER
 fi
 
-eval INSTALL_FOLDER=$INSTALL_FOLDER
-if [ -d $INSTALL_FOLDER ]; then
-	export INSTALL_FOLDER=$(cd $INSTALL_FOLDER; pwd)
+eval INSTALL_FOLDER=$(printf "%q" "$INSTALL_FOLDER")
+if [ -d "$INSTALL_FOLDER" ]; then
+	export INSTALL_FOLDER=$(cd "$INSTALL_FOLDER"; pwd)
 else
-	export INSTALL_FOLDER=$(readlink -m $INSTALL_FOLDER)
+	export INSTALL_FOLDER=$(readlink -m "$INSTALL_FOLDER")
+fi
+
+if [ -n "$(echo $INSTALL_FOLDER|grep ' ')" ]; then
+       echo "The target directory path ($INSTALL_FOLDER) contains spaces. Abort!"
+       exit 1
 fi
 
 clear
-- 
1.7.9.5


