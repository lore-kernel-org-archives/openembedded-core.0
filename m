Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122AAC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:27 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783475"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783475"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:26 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786530"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 21/37] buildhistory: Fix package output files for
 SDKs
Date: Tue, 26 Oct 2021 23:57:52 +0800
Message-Id: 
 <af7b5c664649d2c0d1b23eb1d553080b9d2a7864.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157424

From: Andres Beltran <abeltran@linux.microsoft.com>

Currently, installed packages are listed for images in image-info.txt, but
not for SDKs in sdk-info.txt. Add TOOLCHAIN_HOST_TASK and
TOOLCHAIN_TARGET_TASK to the output variables in sdk-info.txt.

Moreover, package output files for the SDK host are empty because
PKGDATA_DIR defaults to the target directory. Fix this bug and create a new
variable called PKGDATA_DIR_SDK which stores the correct path for the SDK
host package data.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 82e6172c1df378dff4e503aa878501c08937b5bb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/buildhistory.bbclass       | 21 ++++++++++++++++-----
 meta/classes/cross-canadian.bbclass     |  2 +-
 meta/classes/nativesdk.bbclass          |  2 +-
 meta/conf/bitbake.conf                  |  1 +
 meta/lib/oe/package_manager/__init__.py |  2 +-
 5 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a613306270..7c44fec2d1 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -442,11 +442,16 @@ def buildhistory_list_installed(d, rootfs_type="image"):
     else:
         pkgs = sdk_list_installed_packages(d, rootfs_type == "sdk_target")
 
+    if rootfs_type == "sdk_host":
+        pkgdata_dir = d.getVar('PKGDATA_DIR_SDK')
+    else:
+        pkgdata_dir = d.getVar('PKGDATA_DIR')
+
     for output_type, output_file in process_list:
         output_file_full = os.path.join(d.getVar('WORKDIR'), output_file)
 
         with open(output_file_full, 'w') as output:
-            output.write(format_pkg_list(pkgs, output_type, d.getVar('PKGDATA_DIR')))
+            output.write(format_pkg_list(pkgs, output_type, pkgdata_dir))
 
 python buildhistory_list_installed_image() {
     buildhistory_list_installed(d)
@@ -496,13 +501,19 @@ buildhistory_get_installed() {
 	echo "}" >>  $1/depends.dot
 	rm $1/depends.tmp
 
+	# Set correct pkgdatadir
+	pkgdatadir=${PKGDATA_DIR}
+	if [ "$2" == "sdk" ] && [ "$3" == "host" ]; then
+		pkgdatadir="${PKGDATA_DIR_SDK}"
+	fi
+
 	# Produce installed package sizes list
-	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PKGSIZE" -n -f $pkgcache > $1/installed-package-sizes.tmp
+	oe-pkgdata-util -p $pkgdatadir read-value "PKGSIZE" -n -f $pkgcache > $1/installed-package-sizes.tmp
 	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB\t" $1}' | sort -n -r > $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
 
 	# Produce package info: runtime_name, buildtime_name, recipe, version, size
-	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PACKAGE,PN,PV,PKGSIZE" -n -f $pkgcache > $1/installed-package-info.tmp
+	oe-pkgdata-util -p $pkgdatadir read-value "PACKAGE,PN,PV,PKGSIZE" -n -f $pkgcache > $1/installed-package-info.tmp
 	cat $1/installed-package-info.tmp | sort -n -r -k 5 > $1/installed-package-info.txt
 	rm $1/installed-package-info.tmp
 
@@ -542,7 +553,7 @@ buildhistory_get_sdk_installed() {
 		return
 	fi
 
-	buildhistory_get_installed ${BUILDHISTORY_DIR_SDK}/$1 sdk
+	buildhistory_get_installed ${BUILDHISTORY_DIR_SDK}/$1 sdk $1
 }
 
 buildhistory_get_sdk_installed_host() {
@@ -773,7 +784,7 @@ def buildhistory_get_imagevars(d):
 def buildhistory_get_sdkvars(d):
     if d.getVar('BB_WORKERCONTEXT') != '1':
         return ""
-    sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
+    sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES TOOLCHAIN_HOST_TASK TOOLCHAIN_TARGET_TASK BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
     if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
         # Extensible SDK uses some additional variables
         sdkvars += " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL SDK_EXT_TYPE SDK_RECRDEP_TASKS SDK_INCLUDE_PKGDATA SDK_INCLUDE_TOOLCHAIN"
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ffbc2167e3..ac82e86356 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -169,7 +169,7 @@ USE_NLS = "${SDKUSE_NLS}"
 # and not any particular tune that is enabled.
 TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
 
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${SDK_SYS}"
+PKGDATA_DIR = "${PKGDATA_DIR_SDK}"
 # If MLPREFIX is set by multilib code, shlibs
 # points to the wrong place so force it
 SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs2"
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index c66de8c787..14e210562f 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -31,7 +31,7 @@ PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
 DEPENDS:append = " chrpath-replacement-native"
 EXTRANATIVEPATH += "chrpath-native"
 
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${SDK_SYS}"
+PKGDATA_DIR = "${PKGDATA_DIR_SDK}"
 
 HOST_ARCH = "${SDK_ARCH}"
 HOST_VENDOR = "${SDK_VENDOR}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f3ff5b776b..9274322e3a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -415,6 +415,7 @@ DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
+PKGDATA_DIR_SDK = "${TMPDIR}/pkgdata/${SDK_SYS}"
 
 ##################################################################
 # SDK variables.
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 8f7b60e077..80bc1a6bc6 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -321,7 +321,7 @@ class PackageManager(object, metaclass=ABCMeta):
         # TODO don't have sdk here but have a property on the superclass
         # (and respect in install_complementary)
         if sdk:
-            pkgdatadir = self.d.expand("${TMPDIR}/pkgdata/${SDK_SYS}")
+            pkgdatadir = self.d.getVar("PKGDATA_DIR_SDK")
         else:
             pkgdatadir = self.d.getVar("PKGDATA_DIR")
 
-- 
2.31.1


