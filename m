Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlLZL-0001OM-JF
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 15:51:40 +0200
Received: by rex (Postfix, from userid 1000)
	id 852192065A; Mon, 25 Jul 2011 14:47:22 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 14:47:17 +0100
Message-Id: <ec019a276e8c9b59f26bd492d9a37e3b8241aee3.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
References: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] Fix recipe multilib header conflicts
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
X-List-Received-Date: Mon, 25 Jul 2011 13:51:40 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Fix the issue where the generated header differs based on the bitsize of the
target at the time of building.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc        |    4 +++-
 .../linux-libc-headers-yocto_git.bb                |    5 ++++-
 .../linux-libc-headers_2.6.37.2.bb                 |    5 ++++-
 .../linux-libc-headers_2.6.39.bb                   |    5 +++++
 meta/recipes-support/apr/apr_1.4.2.bb              |    8 ++++++--
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    8 ++++++--
 6 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 9a6b9c8..58fee85 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -13,7 +13,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "flex-native bison-native zlib-native"
 
-inherit autotools gettext
+inherit autotools gettext multilib_header
 
 PACKAGES += "${PN}-symlinks"
 
@@ -116,6 +116,8 @@ do_install () {
 	done
 
 	rm ${D}${bindir}/ar ${D}${bindir}/strings
+
+	oe_multilib_header bfd.h
 }
 
 do_install_virtclass-native () {
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
index a9b041f..1c709cb 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
@@ -10,7 +10,7 @@ RPROVIDES_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dbg = "linux-libc-headers-dbg"
 SRCREV = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
 PV = "2.6.37+git-${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRCREV_FORMAT = "meta_machine"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
@@ -47,6 +47,9 @@ do_compile () {
 do_install() {
 	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+
+        # The ..install.cmd conflicts between various configure runs
+        find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
index 51c4926..55d7527 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI += " file://connector-msg-size-fix.patch"
 
@@ -43,6 +43,9 @@ do_install() {
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 	# Kernel should not be exporting this header
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
index 65c19ec..14f5e8a 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d4
 
 S = "${WORKDIR}/linux-${PV}"
 
+PR = "r2"
+
 set_arch() {
 	case ${TARGET_ARCH} in
 		alpha*)   ARCH=alpha ;;
@@ -44,6 +46,9 @@ do_install() {
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 	# Kernel should not be exporting this header
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+
+        # The ..install.cmd conflicts between various configure runs
+        find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-support/apr/apr_1.4.2.bb b/meta/recipes-support/apr/apr_1.4.2.bb
index 89bdadf..b37001d 100644
--- a/meta/recipes-support/apr/apr_1.4.2.bb
+++ b/meta/recipes-support/apr/apr_1.4.2.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
                     file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
            file://configure_fixes.patch;patch=1 \
@@ -17,7 +17,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
 SRC_URI[md5sum] = "4b00e8f70c067893d075577962656b35"
 SRC_URI[sha256sum] = "2017ca700694d09d2b0b21dd7c4d195e43a48735aac88526160c6195ee8f5391"
 
-inherit autotools lib_package binconfig
+inherit autotools lib_package binconfig multilib_header
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
@@ -34,6 +34,10 @@ do_configure_append() {
 	sed -i -e 's/LIBTOOL=\(.*\)top_build/LIBTOOL=\1apr_build/' build/apr_rules.mk
 }
 
+do_install_append() {
+	oe_multilib_header apr.h
+}
+
 SYSROOT_PREPROCESS_FUNCS += "apr_sysroot_preprocess"
 
 apr_sysroot_preprocess () {
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index f660641..2913b46 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -17,11 +17,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
 
 DEPENDS = "icu"
 
-PR = "r0"
+PR = "r1"
 
-inherit autotools
+inherit autotools multilib_header
 acpaths=""
 
+do_install_append() {
+	oe_multilib_header beecrypt/gnu.h
+}
+
 EXTRA_OECONF="--without-python --enable-shared --enable-static --disable-openmp"
 
 FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
-- 
1.7.4.1



