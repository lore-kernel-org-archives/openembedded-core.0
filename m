Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qbkpv-0006gp-QU
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 04:49:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2011 19:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,441,1304319600"; d="scan'208";a="20078656"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2011 19:45:15 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 10:59:36 +0800
Message-Id: <10db281d69f5c4d10be28c18c66e4e155aaba326.1309315723.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309315723.git.dongxiao.xu@intel.com>
References: <cover.1309315723.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1309315723.git.dongxiao.xu@intel.com>
References: <cover.1309315723.git.dongxiao.xu@intel.com>
Subject: [PATCH 6/6] task-base: add 3G into DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2011 02:49:08 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    2 +-
 meta/recipes-core/tasks/task-base.bb            |   16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 2cde46c..2f36f59 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -17,7 +17,7 @@ DISTRO_FEATURES_LIBC ?= "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-t
 					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
 					libc-posix-wchar-io"
 
-DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci 3g ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index a2a8925..3ff57ff 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r70"
+PR = "r71"
 
 inherit task
 
@@ -35,6 +35,7 @@ PACKAGES = ' \
 	    \
             ${@base_contains("DISTRO_FEATURES", "bluetooth", "task-base-bluetooth", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "wifi", "task-base-wifi", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "3g", "task-base-3g", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "cramfs", "task-base-cramfs", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "ipsec", "task-base-ipsec", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "ipv6", "task-base-ipv6", "", d)} \
@@ -95,6 +96,7 @@ RDEPENDS_task-base = "\
     ${@base_contains('COMBINED_FEATURES', 'usbhost', 'task-base-usbhost', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'task-base-bluetooth', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'wifi', 'task-base-wifi', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', '3g', 'task-base-3g', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'uboot', 'task-base-uboot', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'redboot', 'task-base-redboot', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'apex', 'task-base-apex', '',d)} \
@@ -114,10 +116,12 @@ RDEPENDS_task-base-extended = "\
     task-base \
     ${ADD_WIFI} \
     ${ADD_BT} \
+    ${ADD_3G} \
     "
 
 ADD_WIFI = ""
 ADD_BT = ""
+ADD_3G = ""
 
 python __anonymous () {
     # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (one of them)
@@ -133,6 +137,9 @@ python __anonymous () {
 
     if "wifi" in distro_features and not "wifi" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
 	bb.data.setVar("ADD_WIFI", "task-base-wifi", d)
+
+    if "3g" in distro_features and not "3g" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
+	bb.data.setVar("ADD_3G", "task-base-3g", d)
 }
 
 #
@@ -339,6 +346,13 @@ RRECOMMENDS_task-base-wifi = "\
     kernel-module-aes-generic \
     kernel-module-aes"
 
+RDEPENDS_task-base-3g = "\
+    ofono"
+
+RRECOMMENDS_task-base-3g = "\
+    kernel-module-cdc-acm \
+    kernel-module-cdc-wdm"
+
 RRECOMMENDS_task-base-smbfs = "\
     kernel-module-cifs \
     kernel-module-smbfs"
-- 
1.7.1



