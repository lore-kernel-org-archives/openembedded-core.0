Return-Path: <abeltran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2430C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 20:13:38 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.15563.1633378417643907810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=pVFln1v4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: abeltran@linux.microsoft.com)
Received: from
 abeltran-ubuntu18-dev.memva0x40hnu5lyn52qddymqwe.xx.internal.cloudapp.net
 (unknown [20.94.235.175])
	by linux.microsoft.com (Postfix) with ESMTPSA id D19F520B861E;
	Mon,  4 Oct 2021 13:13:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D19F520B861E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633378416;
	bh=a1W05EaKsKOiQggix5msC/8+m3oNuHMGx+wTHm92TY4=;
	h=From:To:Cc:Subject:Date:From;
	b=pVFln1v4Zdvm1gajgDcBFVZMyAL06l8ph0p+J0OLDtIgamvHUiiApbm1wzze1iU+S
	 Xm2KbdIbdLz+ydSdZVkPwOfX6v81WdsypPN0zXUDeYsf4CY+As6h7HsD5OA1tF7mJG
	 iCHbZf6NH4Sd/ohiq2EKuerBTOPCOUuCneK8DRNM=
From: Andres Beltran <abeltran@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: [PATCH] buildhistory: Fix package output files for SDKs
Date: Mon,  4 Oct 2021 20:13:31 +0000
Message-Id: <20211004201331.28401-1-abeltran@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 20:13:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156631

Currently, installed packages are listed for images in image-info.txt, but
not for SDKs in sdk-info.txt. Add TOOLCHAIN_HOST_TASK and
TOOLCHAIN_TARGET_TASK to the output variables in sdk-info.txt.

Moreover, package output files for the SDK host are empty because
PKGDATA_DIR defaults to the target directory. Fix this bug and create a new
variable called PKGDATA_DIR_SDK which stores the correct path for the SDK
host package data.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
---
 meta/classes/buildhistory.bbclass   | 21 ++++++++++++++++-----
 meta/classes/cross-canadian.bbclass |  2 +-
 meta/classes/nativesdk.bbclass      |  2 +-
 meta/conf/bitbake.conf              |  1 +
 meta/lib/oe/package_manager.py      |  2 +-
 5 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 20609c435b..ab9d882752 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -434,11 +434,16 @@ def buildhistory_list_installed(d, rootfs_type="image"):
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
@@ -488,13 +493,19 @@ buildhistory_get_installed() {
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
 
@@ -534,7 +545,7 @@ buildhistory_get_sdk_installed() {
 		return
 	fi
 
-	buildhistory_get_installed ${BUILDHISTORY_DIR_SDK}/$1 sdk
+	buildhistory_get_installed ${BUILDHISTORY_DIR_SDK}/$1 sdk $1
 }
 
 buildhistory_get_sdk_installed_host() {
@@ -762,7 +773,7 @@ def buildhistory_get_imagevars(d):
 def buildhistory_get_sdkvars(d):
     if d.getVar('BB_WORKERCONTEXT') != '1':
         return ""
-    sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
+    sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES TOOLCHAIN_HOST_TASK TOOLCHAIN_TARGET_TASK BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
     if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
         # Extensible SDK uses some additional variables
         sdkvars += " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL SDK_EXT_TYPE SDK_RECRDEP_TASKS SDK_INCLUDE_PKGDATA SDK_INCLUDE_TOOLCHAIN"
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 1e54035084..1974b33943 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -167,7 +167,7 @@ USE_NLS = "${SDKUSE_NLS}"
 # and not any particular tune that is enabled.
 TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
 
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${SDK_SYS}"
+PKGDATA_DIR = "${PKGDATA_DIR_SDK}"
 # If MLPREFIX is set by multilib code, shlibs
 # points to the wrong place so force it
 SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs2"
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7f2692c51a..d2a3f0bec9 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -31,7 +31,7 @@ PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
 DEPENDS_append = " chrpath-replacement-native"
 EXTRANATIVEPATH += "chrpath-native"
 
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${SDK_SYS}"
+PKGDATA_DIR = "${PKGDATA_DIR_SDK}"
 
 HOST_ARCH = "${SDK_ARCH}"
 HOST_VENDOR = "${SDK_VENDOR}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6ada0099eb..a4b00c0448 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -414,6 +414,7 @@ DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
+PKGDATA_DIR_SDK = "${TMPDIR}/pkgdata/${SDK_SYS}"
 
 ##################################################################
 # SDK variables.
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b0660411ea..aec1feedfd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -535,7 +535,7 @@ class PackageManager(object, metaclass=ABCMeta):
         # TODO don't have sdk here but have a property on the superclass
         # (and respect in install_complementary)
         if sdk:
-            pkgdatadir = self.d.expand("${TMPDIR}/pkgdata/${SDK_SYS}")
+            pkgdatadir = self.d.getVar("PKGDATA_DIR_SDK")
         else:
             pkgdatadir = self.d.getVar("PKGDATA_DIR")
 
-- 
2.17.1


