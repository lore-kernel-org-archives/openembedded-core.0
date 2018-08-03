Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D13378E1C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 02:25:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w732PuQj025131
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2018 19:25:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 2 Aug 2018 19:25:55 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 3 Aug 2018 09:49:46 +0800
Message-ID: <20180803014947.23598-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803014947.23598-1-kai.kang@windriver.com>
References: <20180803014947.23598-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] remove allarch from recipes which rdepends on TUNE_PKGARCH packages
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
X-List-Received-Date: Fri, 03 Aug 2018 02:25:57 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following allarch packages rdepends on TUNE_PKGARCH packages. So
remove allarch from these recipes.

ca-certificates -> openssl
docbook-xsl-stylesheets -> perl
font-alias -> font-util
initramfs-module-setup-live -> udev-extraconf
initramfs-framework -> ${VIRTUAL-RUNTIME_base-utils} (busybox by default)
ppp-dialin -> ppp
resolvconf -> bash
weston-init -> weston kbd
xorg-minimal-fonts -> font-alias

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb          | 2 +-
 meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb         | 2 --
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb      | 2 --
 .../initrdscripts/initramfs-module-setup-live_1.0.bb            | 2 --
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb               | 1 -
 meta/recipes-graphics/wayland/weston-init.bb                    | 2 +-
 meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb             | 2 --
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb           | 2 +-
 .../recipes-support/ca-certificates/ca-certificates_20180409.bb | 2 --
 9 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index b5f68951d7..eee6ef6518 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 SRC_URI = "file://host-peer \
            file://ppp-dialin"
 
-inherit allarch useradd
+inherit useradd
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
index 8550177288..0fdd479e1c 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
@@ -23,8 +23,6 @@ SRC_URI[sha256sum] = "8e2843cd4162b706f0481b3c281657728cbc2822e50a64fff79b79bd8a
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
 
-inherit allarch
-
 do_compile () {
 	:
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6337b998ac..6d1dbdd2b8 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -5,8 +5,6 @@ RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
 PR = "r4"
 
-inherit allarch
-
 SRC_URI = "file://init \
            file://exec \
            file://nfsrootfs \
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index 4d2fe9dd2b..26468c1b5d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -5,8 +5,6 @@ RDEPENDS_${PN} = "initramfs-framework-base udev-extraconf"
 
 PR = "r4"
 
-inherit allarch
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
 SRC_URI = "file://setup-live"
 
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 07d32ce979..c1bcc1743c 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+(?!\.0)\.\d+)/"
 
 S = "${WORKDIR}/docbook-xsl-${PV}"
 
-inherit allarch
 BBCLASSEXTEND = "native"
 
 do_configure (){
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 22ba5f3fb3..f3b4398295 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -18,7 +18,7 @@ do_install() {
 	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
 }
 
-inherit allarch update-rc.d distro_features_check systemd
+inherit update-rc.d distro_features_check systemd
 
 # rdepends on weston which depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
index 15e101596a..de1c8ead38 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
@@ -15,8 +15,6 @@ DEPENDS = "util-macros-native font-util-native"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
-inherit allarch
-
 PE = "1"
 PR = "${INC_PR}.3"
 
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 9bcd1b2fa6..9740df45f6 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -13,7 +13,7 @@ SRC_URI = "file://misc"
 PE = "1"
 PR = "r2"
 
-inherit allarch distro_features_check
+inherit distro_features_check
 
 # The font-alias requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
index 0d57083c52..3297b23507 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
@@ -27,8 +27,6 @@ SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
 
 S = "${WORKDIR}/git"
 
-inherit allarch
-
 EXTRA_OEMAKE = "\
     'CERTSDIR=${datadir}/ca-certificates' \
     'SBINDIR=${sbindir}' \
-- 
2.17.1


