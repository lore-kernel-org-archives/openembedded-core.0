Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U8GAq-00058o-Oh
	for Openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 21:21:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1KK5etm007945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 12:05:40 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 20 Feb 2013 12:05:39 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 14:05:38 -0600
Message-ID: <1361390738-62451-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] util-linux: Add ability to compile with nativesdk
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
X-List-Received-Date: Wed, 20 Feb 2013 20:21:53 -0000
Content-Type: text/plain

Some of the tools in the util-linux are used for disk and text file
operations in the nativesdk so as to get around different versions
that may exist on the host system.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |   90 +++++++++++----------
 meta/recipes-core/util-linux/util-linux_2.22.2.bb |    3 +-
 2 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 10439c0..8955430 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,6 +20,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
+DEPENDS_append_class-nativesdk = " lzo-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
@@ -28,12 +29,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://swapargs.h \
            "
 
-PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
-             util-linux-swaponoff util-linux-losetup util-linux-umount \
-             util-linux-mount util-linux-readprofile util-linux-libblkid \
-             util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-             util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie util-linux-reset"
+PACKAGES =+ "${PN}-agetty ${PN}-fdisk ${PN}-cfdisk ${PN}-sfdisk \
+             ${PN}-swaponoff ${PN}-losetup ${PN}-umount \
+             ${PN}-mount ${PN}-readprofile ${PN}-libblkid \
+             ${PN}-libblkid-dev ${PN}-libuuid ${PN}-libuuid-dev \
+             ${PN}-uuidgen ${PN}-lscpu ${PN}-fsck ${PN}-blkid \
+             ${PN}-mkfs ${PN}-mcookie ${PN}-reset"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
@@ -46,44 +47,47 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
 "
 
 EXTRA_OECONF_append_class-native = " --disable-login --disable-su"
+EXTRA_OECONF_append_class-nativesdk = " --disable-login --disable-su"
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
-FILES_util-linux-agetty = "${base_sbindir}/agetty"
-FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
-FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
-FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
-FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${base_sbindir}/swapoff.${BPN}"
-FILES_util-linux-losetup = "${base_sbindir}/losetup.${BPN}"
-FILES_util-linux-mount = "${base_bindir}/mount.${BPN}"
-FILES_util-linux-mcookie = "${bindir}/mcookie"
-FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
-FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${BPN}"
-FILES_util-linux-uuidgen = "${bindir}/uuidgen"
-FILES_util-linux-reset = "${base_bindir}/reset"
-
-FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
-FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
-FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
-FILES_util-linux-lscpu = "${bindir}/lscpu"
-
-FILES_util-linux-fsck = "${base_sbindir}/fsck*"
-FILES_util-linux-mkfs = "${sbindir}/mkfs"
+FILES_${PN}-agetty = "${base_sbindir}/agetty"
+FILES_${PN}-fdisk = "${base_sbindir}/fdisk.${BPN}"
+FILES_${PN}-cfdisk = "${base_sbindir}/cfdisk"
+FILES_${PN}-sfdisk = "${sbindir}/sfdisk"
+FILES_${PN}-swaponoff = "${base_sbindir}/swapon.${BPN} ${base_sbindir}/swapoff.${BPN}"
+FILES_${PN}-losetup = "${base_sbindir}/losetup.${BPN}"
+FILES_${PN}-mount = "${base_bindir}/mount.${BPN}"
+FILES_${PN}-mcookie = "${bindir}/mcookie"
+FILES_${PN}-umount = "${base_bindir}/umount.${BPN}"
+FILES_${PN}-readprofile = "${base_sbindir}/readprofile.${BPN}"
+FILES_${PN}-uuidgen = "${bindir}/uuidgen"
+FILES_${PN}-reset = "${base_bindir}/reset"
+
+FILES_${PN}-libblkid = "${base_libdir}/libblkid.so.*"
+FILES_${PN}-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
+FILES_${PN}-libuuid = "${base_libdir}/libuuid.so.*"
+FILES_${PN}-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
+FILES_${PN}-lscpu = "${bindir}/lscpu"
+
+FILES_${PN}-fsck = "${base_sbindir}/fsck*"
+FILES_${PN}-mkfs = "${sbindir}/mkfs"
 
 # Util-linux' blkid replaces the e2fsprogs one
-FILES_util-linux-blkid = "${base_sbindir}/blkid*"
-RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
-RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
+FILES_${PN}-blkid = "${base_sbindir}/blkid*"
+RCONFLICTS_${PN}-blkid = "e2fsprogs-blkid"
+RREPLACES_${PN}-blkid = "e2fsprogs-blkid"
 
 # reset calls 'tput'
-RDEPENDS_util-linux-reset += "ncurses"
+RDEPENDS_${PN}-reset += "ncurses"
 
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
+RDEPENDS_${PN} = "${PN}-umount ${PN}-swaponoff ${PN}-losetup"
+RRECOMMENDS_${PN} = "${PN}-fdisk ${PN}-cfdisk ${PN}-sfdisk ${PN}-mount ${PN}-readprofile ${PN}-mkfs "
 
 RRECOMMENDS_${PN}_class-native = ""
+RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 
 
 do_compile () {
@@ -159,35 +163,35 @@ ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_PRIORITY[hwclock] = "10"
 ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 
-ALTERNATIVE_util-linux-fdisk = "fdisk"
+ALTERNATIVE_${PN}-fdisk = "fdisk"
 ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
 
-ALTERNATIVE_util-linux-agetty = "getty"
+ALTERNATIVE_${PN}-agetty = "getty"
 ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
 ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 
-ALTERNATIVE_util-linux-mount = "mount"
+ALTERNATIVE_${PN}-mount = "mount"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 
-ALTERNATIVE_util-linux-umount = "umount"
+ALTERNATIVE_${PN}-umount = "umount"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
-ALTERNATIVE_util-linux-losetup = "losetup"
+ALTERNATIVE_${PN}-losetup = "losetup"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 
-ALTERNATIVE_util-linux-swaponoff = "swapoff swapon"
+ALTERNATIVE_${PN}-swaponoff = "swapoff swapon"
 ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
 ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
 
-ALTERNATIVE_util-linux-fsck = "fsck.minix fsck"
+ALTERNATIVE_${PN}-fsck = "fsck.minix fsck"
 ALTERNATIVE_LINK_NAME[fsck.minix] = "${base_sbindir}/fsck.minix"
 ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
-ALTERNATIVE_util-linux-blkid = "blkid"
+ALTERNATIVE_${PN}-blkid = "blkid"
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
-ALTERNATIVE_util-linux-reset = "reset"
+ALTERNATIVE_${PN}-reset = "reset"
 ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
 ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
index dd95573..f2d4782 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -41,3 +41,4 @@ addtask remove_lscpu before do_configure after do_patch
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
+EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
-- 
1.7.1



