Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA3278695
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 01:53:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBK1rNC3006642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:53:24 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 19 Dec 2017 17:53:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Dec 2017 09:53:13 +0800
Message-ID: <effbd3d25e0509d870f5a658dd24c93c27924cba.1513734733.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513734733.git.liezhi.yang@windriver.com>
References: <cover.1513734733.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd: inherit distro_features_check
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
X-List-Received-Date: Wed, 20 Dec 2017 01:53:23 -0000
Content-Type: text/plain

Use distro_features_check so that we can have a uniform controller.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 10 ++++------
 meta/recipes-core/systemd/systemd_234.bb         | 13 +++++--------
 meta/recipes-core/udev/eudev_3.2.2.bb            |  9 +++------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index d934716..d67a3c9 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -11,6 +11,10 @@ SRC_URI = "file://serial-getty@.service"
 
 S = "${WORKDIR}"
 
+# As this package is tied to systemd, only build it when we're also building systemd.
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
 		default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
@@ -43,10 +47,4 @@ do_install() {
 FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# As this package is tied to systemd, only build it when we're also building systemd.
-python () {
-    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
-}
-
 ALLOW_EMPTY_${PN} = "1"
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 778b868..58426ca 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -8,7 +8,11 @@ DEPENDS = "kmod intltool-native gperf-native acl readline libcap libcgroup util-
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion manpages
+inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion manpages distro_features_check
+
+# As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
+# that we don't build both udev and systemd in world builds.
+REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://touchscreen.rules \
@@ -633,10 +637,3 @@ pkg_postinst_udev-hwdb () {
 pkg_prerm_udev-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-
-# As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
-# that we don't build both udev and systemd in world builds.
-python () {
-    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
-}
diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb b/meta/recipes-core/udev/eudev_3.2.2.bb
index 70e3568..d011047 100644
--- a/meta/recipes-core/udev/eudev_3.2.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.2.bb
@@ -23,7 +23,9 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "41e19b70462692fefd072a3f38818b6e"
 SRC_URI[sha256sum] = "3e4c56ec2fc1854afd0a31f3affa48f922c62d40ee12a0c1a4b4f152ef5b0f63"
 
-inherit autotools update-rc.d qemu pkgconfig
+inherit autotools update-rc.d qemu pkgconfig distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "systemd"
 
 EXTRA_OECONF = " \
     --sbindir=${base_sbindir} \
@@ -75,11 +77,6 @@ RDEPENDS_eudev-hwdb += "eudev"
 RPROVIDES_${PN} = "hotplug udev"
 RPROVIDES_eudev-hwdb += "udev-hwdb"
 
-python () {
-    if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-        raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
-}
-
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_eudev-hwdb () {
     if test -n "$D"; then
-- 
2.7.4


