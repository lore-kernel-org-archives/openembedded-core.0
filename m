Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TyG2R-0003ty-HT
	for Openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 07:12:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2013 21:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,527,1355126400"; d="scan'208";a="251573118"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2013 21:56:12 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, meta-intel@yoctoproject.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 23 Jan 2013 21:56:11 -0800
Message-Id: <16ea9e29e011b988bd6a1c6c5196dd48070fce82.1359005591.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <5d5324f0b338872221a92884543df7e46bae012c.1359005591.git.nitin.a.kamble@intel.com>
References: <5d5324f0b338872221a92884543df7e46bae012c.1359005591.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1359005591.git.nitin.a.kamble@intel.com>
References: <cover.1359005591.git.nitin.a.kamble@intel.com>
Subject: [RFC 3/3] core-image: Add hwcodecs IMAGE_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 06:12:18 -0000
X-List-Received-Date: Thu, 24 Jan 2013 06:12:18 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently hardware codecs are being injected in rather ugly ways and end up
either in no or all images. This adds a dedicated IMAGE_FEATURE for them based
on the MACHINE_HWCODECS variable. We may need to refine this in due course
but this patch at least illustrates the concept.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/core-image.bbclass                |    4 ++++
 meta/recipes-extended/images/core-image-lsb.bb |    2 +-
 meta/recipes-sato/images/core-image-sato.bb    |    2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index e0f6dbb..657d5f2 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -23,6 +23,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
 # - qt4-pkgs            - Qt4/X11 and demo applications
+# - hwcodecs            - Install hardware acceleration codecs
 # - package-management  - installs package management tools and preserves the package manager database
 # - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
@@ -41,6 +42,7 @@ PACKAGE_GROUP_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
 PACKAGE_GROUP_ssh-server-openssh = "packagegroup-core-ssh-openssh"
 PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
 PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demoapps"
+PACKAGE_GROUP_hwcodecs = "${MACHINE_HWCODECS}"
 
 
 # IMAGE_FEATURES_REPLACES_foo = 'bar1 bar2'
@@ -50,6 +52,8 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
 
+MACHINE_HWCODECS ??= ""
+
 python __anonymous() {
     # Ensure we still have a splash screen for existing images
     if base_contains("IMAGE_FEATURES", "apps-console-core", "1", "", d) == "1":
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index 2c47dc6..a5f2643 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A foundational basic image without support for X that can be \
 reasonably used for customization and is suitable for implementations that \
 conform to Linux Standard Base (LSB)."
 
-IMAGE_FEATURES += "splash ssh-server-openssh"
+IMAGE_FEATURES += "splash ssh-server-openssh hwcodecs"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index f52a1a5..e3246d2 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
 mobile devices. The image supports X11 with a Sato theme, Pimlico \
 applications, and contains terminal, editor, and file manager."
 
-IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbear"
+IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbear hwcodecs"
 
 LICENSE = "MIT"
 
-- 
1.7.3.4



