Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA11C612D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:34:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jul 2013 01:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,767,1367996400"; d="scan'208";a="353446534"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.206])
	by orsmga001.jf.intel.com with ESMTP; 29 Jul 2013 01:34:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 09:34:35 +0100
Message-Id: <407e57879ea2f931bff32993b850c9d59d228303.1375086591.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375086591.git.paul.eggleton@linux.intel.com>
References: <cover.1375086591.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1375086591.git.paul.eggleton@linux.intel.com>
References: <cover.1375086591.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 01/14] populate_sdk_base, adt_installer: abort install if path contains spaces
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
X-List-Received-Date: Mon, 29 Jul 2013 08:34:55 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

Spaces are not handled properly in some parts of oe-core and it's safer
to abort toolchain installation if path contains spaces. Even though
we fix space handling in the toolchain installation script, there are
various other parts in the toolchain (perl scripts, sysroot path passed to
toolchain binaries, shebang lines) that would need special handling. So,
for now, just bail out if path contains spaces.

The checking for spaces in the path is done after expanding relative
paths to absolute and tilde conversion.

[YOCTO #4488]

(From OE-Core master rev: 8c35ba2d3048ce69f74f72cb2676e4bc162cfb63)

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass                      | 13 +++++++++----
 meta/recipes-devtools/installer/adt-installer/adt_installer | 13 +++++++++----
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
1.8.1.2


