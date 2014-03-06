Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BACDD6F4EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:46:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Mar 2014 08:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487311062"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 08:46:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 16:46:09 +0000
Message-Id: <02dee7a002e57154c0b8759eb763ab570a3cbe4f.1394124256.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] classes/image: support package-management in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 06 Mar 2014 16:46:26 -0000

Previously the "package-management" feature was only fully supported
when inheriting core-image.bbclass, which is not really ideal given that
this is the standard way of adding runtime packaging to an image in
OE-Core.

Part of the fix for [YOCTO #5424].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass | 1 -
 meta/classes/image.bbclass      | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 9ccc128..0958702 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -43,7 +43,6 @@ PACKAGE_GROUP_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sd
 PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
 PACKAGE_GROUP_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
 PACKAGE_GROUP_ssh-server-openssh = "packagegroup-core-ssh-openssh"
-PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
 PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demoapps"
 PACKAGE_GROUP_hwcodecs = "${MACHINE_HWCODECS}"
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 64f4359..7529212 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs package-management"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
 
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
@@ -32,6 +32,7 @@ FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_v
 FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 
 # Define some very basic feature package groups
+PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
 SPLASH ?= "psplash"
 PACKAGE_GROUP_splash = "${SPLASH}"
 
-- 
1.8.5.3


