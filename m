Return-Path: <abeltran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CBEC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 00:34:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.19122.1633394091083368354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 17:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=khlnVgGK;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: abeltran@linux.microsoft.com)
Received: from
 abeltran-ubuntu18-dev.memva0x40hnu5lyn52qddymqwe.xx.internal.cloudapp.net
 (unknown [20.94.235.175])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6C21420B861E;
	Mon,  4 Oct 2021 17:34:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6C21420B861E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633394090;
	bh=uSz6PAr2f6HLGkdGBF6qOGRLRaG1GsPAdMKAC2DYq2A=;
	h=From:To:Cc:Subject:Date:From;
	b=khlnVgGKs+wl37NTsyKgJmm8fIBK7penUK7zlM+Ejb2ED10ir0ur0y1GsY4N6BxrR
	 XQba+rG5f7ZMoKY7Qtv4bGLV44La2psgaL8fmzWJgsH5A/niqofsFwKrWS+iHMTeCa
	 pSV0wYTRR7N4SnvE8PvCcjSGkwZyb7AAcqpuHUfA=
From: Andres Beltran <abeltran@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: [PATCH v2] buildhistory: Fix package output files for SDKs
Date: Tue,  5 Oct 2021 00:34:15 +0000
Message-Id: <20211005003415.2212-1-abeltran@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 00:34:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156636

Currently, installed packages are listed for images in image-info.txt, but
not for SDKs in sdk-info.txt. Add TOOLCHAIN_HOST_TASK and
TOOLCHAIN_TARGET_TASK to the output variables in sdk-info.txt.

Moreover, package output files for the SDK host are empty because
PKGDATA_DIR defaults to the target directory. Fix this bug and create a new
variable called PKGDATA_DIR_SDK which stores the correct path for the SDK
host package data.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
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
2.17.1


