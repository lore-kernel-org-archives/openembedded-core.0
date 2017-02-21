Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 41B0072FBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:49:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875892"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:49:05 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:54 +0200
Message-Id: <f8e8978a504b59dd430201d34a2a0fbd0741811a.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 37/39] run-postinsts: simplify the logic of whether to install it to images
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
X-List-Received-Date: Tue, 21 Feb 2017 14:49:05 -0000

The logic is scattered all over the place, but amounts to
"install, unless the rootfs is read only". Let's express that directly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/recipes-test/images/oe-selftest-image.bb | 2 +-
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
 meta/classes/image.bbclass                             | 2 +-
 meta/classes/rootfs_deb.bbclass                        | 1 -
 meta/classes/rootfs_ipk.bbclass                        | 1 -
 meta/classes/rootfs_rpm.bbclass                        | 1 -
 meta/lib/oe/manifest.py                                | 2 +-
 meta/recipes-core/images/core-image-minimal.bb         | 2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                    | 2 +-
 meta/recipes-devtools/opkg/opkg_0.3.4.bb               | 2 +-
 10 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta-selftest/recipes-test/images/oe-selftest-image.bb b/meta-selftest/recipes-test/images/oe-selftest-image.bb
index f17094c5d08..5d4d10eef69 100644
--- a/meta-selftest/recipes-test/images/oe-selftest-image.bb
+++ b/meta-selftest/recipes-test/images/oe-selftest-image.bb
@@ -1,6 +1,6 @@
 SUMMARY = "An image used during oe-selftest tests"
 
-IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} dropbear"
+IMAGE_INSTALL = "packagegroup-core-boot dropbear"
 IMAGE_FEATURES = "debug-tweaks"
 
 IMAGE_LINGUAS = " "
diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 9e93b8e1a95..c8196fa1837 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -2,7 +2,7 @@ SUMMARY = "An example of partitioned image."
 
 SRC_URI = "file://${FILE_DIRNAME}/${BPN}.wks"
 
-IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
+IMAGE_INSTALL = "packagegroup-core-boot"
 
 IMAGE_FSTYPES = "wic"
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 127e62d5d95..405fd73c043 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -29,7 +29,7 @@ IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password
 IMAGE_GEN_DEBUGFS ?= "0"
 
 # rootfs bootstrap install
-ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
+ROOTFS_BOOTSTRAP_INSTALL = "run-postinsts"
 
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index e8facd43687..10af4b5ff0f 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -3,7 +3,6 @@
 #
 
 ROOTFS_PKGMANAGE = "dpkg apt"
-ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 6b60c466386..a57b1d34f7b 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -7,7 +7,6 @@
 
 EXTRAOPKGCONFIG ?= ""
 ROOTFS_PKGMANAGE = "opkg ${EXTRAOPKGCONFIG}"
-ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 65881a60a7b..af0f23877ac 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -3,7 +3,6 @@
 #
 
 ROOTFS_PKGMANAGE = "rpm dnf"
-ROOTFS_PKGMANAGE_BOOTSTRAP = "run-postinsts"
 
 # dnf is using our custom distutils, and so will fail without these
 export STAGING_INCDIR
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 6ec9b1af8bc..60c49be0e99 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -104,7 +104,7 @@ class Manifest(object, metaclass=ABCMeta):
             pkg_list['lgp'] = \
                 "locale-base-en-us locale-base-en-gb"
         elif image_rootfs.find("core-image-minimal") > 0:
-            pkg_list[self.PKG_TYPE_MUST_INSTALL] = "run-postinsts packagegroup-core-boot"
+            pkg_list[self.PKG_TYPE_MUST_INSTALL] = "packagegroup-core-boot"
 
         with open(self.initial_manifest, "w+") as manifest:
             manifest.write(self.initial_manifest_file_header)
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 8dd77b3472e..4630026aa9d 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A small image just capable of allowing a device to boot."
 
-IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
+IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
 
 IMAGE_LINGUAS = " "
 
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index ff883183dca..7830b1f3847 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz perl"
 RDEPENDS_${PN}_class-native = "xz-native"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.4.bb b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
index 6ac94382683..24151899098 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
@@ -59,7 +59,7 @@ do_install_append () {
 	fi
 }
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config run-postinsts libarchive"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
-- 
2.11.0


