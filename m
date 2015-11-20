Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CC7FF6212F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904269"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:49 +0200
Message-Id: <beb70e245e31692a88003180cb06449849d81afd.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/9] package_regex.inc: split Debian-related entries into their own recipes
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc              | 17 -----------------
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb                  |  4 ++++
 meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb |  4 ++++
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb     |  4 ++++
 meta/recipes-devtools/apt/apt.inc                       |  4 ++++
 meta/recipes-extended/blktool/blktool_4-7.bb            |  4 ++++
 meta/recipes-extended/mailx/mailx_12.5-5.bb             |  4 ++++
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb    |  8 ++++++++
 8 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 2eaaca4..d55f5c8 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -185,20 +185,3 @@ REGEX_URI_pn-cdrtools = "http://sourceforge.net/projects/cdrtools/files/alpha/"
 # Keep old gcc versions at their major versions
 REGEX_pn-gcc-source-4.9.3 = "gcc-(?P<pver>4\.9\.\d+).tar"
 REGEX_pn-gcc-source-4.8.4 = "gcc-(?P<pver>4\.8\.\d+).tar"
-
-# these packages are taken from snapshots.debian.org; that source is static and goes stale
-# so we check the latest upstream from a directory that does get updated
-REGEX_URI_pn-apt = "${DEBIAN_MIRROR}/main/a/apt/"
-REGEX_URI_pn-resolvconf = "${DEBIAN_MIRROR}/main/r/resolvconf/"
-REGEX_URI_pn-net-tools = "${DEBIAN_MIRROR}/main/n/net-tools/"
-
-# same for packages from launchpad
-REGEX_URI_pn-base-passwd = "${DEBIAN_MIRROR}/main/b/base-passwd/"
-
-# for these packages we're mostly interested in tracking debian patches,
-# and not in the upstream version where all development has effectively stopped
-DEBIAN_PATCH_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
-REGEX_pn-net-tools = "${DEBIAN_PATCH_REGEX}"
-REGEX_pn-apmd = "${DEBIAN_PATCH_REGEX}"
-REGEX_pn-blktool = "${DEBIAN_PATCH_REGEX}"
-REGEX_pn-mailx = "${DEBIAN_PATCH_REGEX}"
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index ea10526..511d209 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -22,6 +22,10 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "b1e6309e8331e0f4e6efd311c2d97fa8"
 SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5c75a2dbb52332d"
 
+# for this package we're mostly interested in tracking debian patches,
+# and not in the upstream version where all development has effectively stopped
+REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+
 S = "${WORKDIR}/apmd-3.2.2.orig"
 
 inherit update-rc.d systemd
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
index 916b9f2..564354f 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
@@ -19,6 +19,10 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20150511T214718Z/pool/main/
 SRC_URI[md5sum] = "7362d766e47bfc253500f42b30330d9f"
 SRC_URI[sha256sum] = "5a6e21e8ba6822a5f93075c8c8fe7977e34780ba551af51930d0b31fdd99ab56"
 
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+REGEX_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
+
 inherit allarch
 
 do_compile () {
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index ac9bd81..26495ba 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -17,6 +17,10 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
 SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
 
+# the package is taken from launchpad; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+REGEX_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/"
+
 inherit autotools
 
 SSTATEPOSTINSTFUNCS += "base_passwd_sstate_postinst"
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 3248b9a..0bec5b4 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -16,6 +16,10 @@ SRC_URI[md5sum] = "6505c4297b338adb2087ce87bbc4a276"
 SRC_URI[sha256sum] = "3fb1de9598363c416591d49e3c285458e095b035e6c06d5b944a54e15fc9b543"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+REGEX_URI = "${DEBIAN_MIRROR}/main/a/apt/"
+
 inherit autotools gettext
 
 EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.bb
index 679196b..751a3ce 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.bb
@@ -18,6 +18,10 @@ SRC_URI = "${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
 SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
 
+# for this package we're mostly interested in tracking debian patches,
+# and not in the upstream version where all development has effectively stopped
+REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+
 S = "${WORKDIR}/${BPN}-4.orig"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-extended/mailx/mailx_12.5-5.bb b/meta/recipes-extended/mailx/mailx_12.5-5.bb
index ffa9049..49aa3a7 100644
--- a/meta/recipes-extended/mailx/mailx_12.5-5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5-5.bb
@@ -26,6 +26,10 @@ SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_12.5.orig.tar.g
 SRC_URI[archive.md5sum] = "29a6033ef1412824d02eb9d9213cb1f2"
 SRC_URI[archive.sha256sum] = "015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad"
 
+# for this package we're mostly interested in tracking debian patches,
+# and not in the upstream version where all development has effectively stopped
+REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+
 S = "${WORKDIR}/heirloom-mailx-12.5"
 
 inherit autotools-brokensep
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index aefc1e6..7f0c72b 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -13,6 +13,10 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
            file://ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch \
 	   "
 
+# for this package we're mostly interested in tracking debian patches,
+# and not in the upstream version where all development has effectively stopped
+REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+
 S = "${WORKDIR}/net-tools-1.60"
 
 SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
@@ -21,6 +25,10 @@ SRC_URI[tarball.sha256sum] = "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c
 SRC_URI[patch.md5sum] = "ea3592f49ac8380962bc4d9b66c7e7e9"
 SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e46585022fc76c"
 
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+REGEX_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
+
 inherit gettext
 
 # The Makefile is lame, no parallel build
-- 
2.6.2


