Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4466C753
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 00:09:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8E09DuI021439
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 17:09:13 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 17:09:12 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 19:09:00 -0500
Message-ID: <1379117343-29877-5-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v2 PATCH 4/7] syslinux.bbclass, syslinux: Update to syslinux 6.01
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
X-List-Received-Date: Sat, 14 Sep 2013 00:09:11 -0000
Content-Type: text/plain

A newer version of syslinux is required for an EFI enabled isohybrid.
This is used for the the capability to generate 3 types of ISO images,
all of which can be booted off a USB device or HDD if copied with dd.

1) PC BIOS only ISO
2) EFI only ISO
3) EFI + PC BIOS ISO

The syslinux.bbclass required a minor tweak because ldlinux.c32 is
dynamically loaded and needs to be in the created media as of syslinux
5 and up.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/syslinux.bbclass                      |    1 +
 .../{syslinux_4.07.bb => syslinux_6.01.bb}         |   26 ++++++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/syslinux/{syslinux_4.07.bb => syslinux_6.01.bb} (63%)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 501bc6d..da7f716 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -41,6 +41,7 @@ syslinux_populate() {
 syslinux_iso_populate() {
 	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
 	install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
+	install -m 0644 ${STAGING_DATADIR}/syslinux/ldlinux.c32 ${ISODIR}${ISOLINUXDIR}
 	if [ "${AUTO_SYSLINUXMENU}" = 1 ] ; then
 		install -m 0644 ${STAGING_DATADIR}/syslinux/vesamenu.c32 ${ISODIR}${ISOLINUXDIR}/vesamenu.c32
 		if [ "${SYSLINUX_SPLASH}" != "" ] ; then
diff --git a/meta/recipes-devtools/syslinux/syslinux_4.07.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
similarity index 63%
rename from meta/recipes-devtools/syslinux/syslinux_4.07.bb
rename to meta/recipes-devtools/syslinux/syslinux_6.01.bb
index bba5dda..4438ea8 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.07.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -2,19 +2,21 @@ DESCRIPTION = "A multi-purpose linux bootloader"
 HOMEPAGE = "http://syslinux.zytor.com/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://README;beginline=35;endline=41;md5=f7249a750bc692d1048b2626752aa415"
+                    file://README;beginline=35;endline=41;md5=558f2c71cb1fb9ba511ccd4858e48e8a"
 
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native util-linux"
-PR = "r0"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/4.xx/syslinux-${PV}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "9ff6e1b94efab931fb4717b600d88779"
-SRC_URI[sha256sum] = "1240a4e4219b518bdaef78931b6e901befeff35e6894ac6db785115848a7a05a"
+SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
+SRC_URI[sha256sum] = "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
+# Don't let the sanity checker trip on the 32 bit real mode BIOS binaries
+INSANE_SKIP_${PN}-misc = "arch"
+INSANE_SKIP_${PN}-chain = "arch"
 
 EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
@@ -28,21 +30,25 @@ do_configure() {
 	sed -e 's,win32/\S*,,g' -i Makefile
 
 	# clean installer executables included in source tarball
-	oe_runmake clean
+	oe_runmake clean firmware="efi32" EFIINC="${includedir}"
+	# NOTE: There is a temporary work around above to specify
+	#	the efi32 as the firmware else the pre-built bios
+	#	files get erased contrary to the doc/distib.txt
+	#	In the future this should be "bios" and not "efi32".
 }
 
 do_compile() {
 	# Rebuild only the installer; keep precompiled bootloaders
 	# as per author's request (doc/distrib.txt)
-	oe_runmake CC="${CC} ${CFLAGS}" LDFLAGS="${LDFLAGS}" installer
+	oe_runmake CC="${CC} ${CFLAGS}" LDFLAGS="${LDFLAGS}" firmware="bios" installer
 }
 
 do_install() {
-	oe_runmake install INSTALLROOT="${D}"
+	oe_runmake install INSTALLROOT="${D}" firmware="bios"
 
 	install -d ${D}${datadir}/syslinux/
-	install -m 644 ${S}/core/ldlinux.sys ${D}${datadir}/syslinux/
-	install -m 644 ${S}/core/ldlinux.bss ${D}${datadir}/syslinux/
+	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
+	install -m 644 ${S}/bios/core/ldlinux.bss ${D}${datadir}/syslinux/
 }
 
 PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
-- 
1.7.9.5


