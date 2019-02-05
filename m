Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC71A7C0D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:59 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r15so208608eds.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CvXnNKSh3NBAxtNTUCrYpu7En7jZ4B+ivsdrm1Cd58I=;
	b=Cgp4OrqXFI8gQ+Yy1vLhzEJ6Y9OjZSNhIixZQMkbw6Y/LWpWVw0gZ3WcAOSaJXRDs2
	dx/9AuKuDBNR2mowI8hdIgqKxptZW+whzDGMKPwmX8Ce4y1/NR27Ji9mPdkzDdBrwln/
	3+VU1THPac0FeHZnc8BWQgyx3YcwSPLU63bbA03tqdCyKxcfB1WzLyDblmL/OfmnkdWR
	cgan6qJgC9iy1TXq5wUfT84WfERHsq7TwjqDODvtc4IVvq1vOhuy/nefwuKma6BrptzT
	mDUXhkINWMis0F+uiR/D0IstYjuJ0AWijh6LjqU9LkNEuXX1+La6qhiJwhmB1P6OkdFm
	HJtQ==
X-Gm-Message-State: AHQUAuayHf/3QP0DuRpKCmTSfH5yAAwc99tta3lMNZbaoitMY/cZQa8J
	akYpAGYCJItdPCQgqY/VYKX7u8IY
X-Google-Smtp-Source: AHgI3IbLJ9uzVYJZbfnAxXcxkyjcwsuwOtb487cgbBIQNx5AajQo9Qqir8Havdzjoy+qVhEvZbsvGg==
X-Received: by 2002:a17:906:54d8:: with SMTP id
	c24mr1705629ejp.80.1549333979967; 
	Mon, 04 Feb 2019 18:32:59 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:59 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:41 +0000
Message-Id: <20190205023241.29707-14-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 13/13] util-linux: final cleanup
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
X-List-Received-Date: Tue, 05 Feb 2019 02:33:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

* use ${PN} instead of util-linux
* use PACKAGESPLITFUNCS for creating util-linux-lib* packages
  rather than an _append OVERRIDE
* sort ALTERNATIVE_LINK_NAME alphabetically
* use systemd_system_unitdir instead of open-coding
* inherit manpages so as to benefit from man-db processing (note
  that manpages are not generated here, we just want the
  automatic update of the package index caches
* use EXTRA_OEMAKE instead of duplicating command line arguments

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v6: * update commit message (escape characters in regexs has been
      merged long ago)
v5: * fix subject line typo
v3: * use PACKAGESPLITFUNCS =+ rather than PACKAGESPLITFUNCS_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use systemd_system_unitdir instead of open-coding
    * inherit manpages
    * use EXTRA_OEMAKE instead of duplicating command line arguments
    * also sort ALTERNATIVE_LINK_NAME for man pages
---
 meta/recipes-core/util-linux/util-linux.inc | 157 ++++++++------------
 1 file changed, 66 insertions(+), 91 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 93aa3e407c..ea654e193a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion ptest
+inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
 DEPENDS = "zlib ncurses virtual/crypt"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
@@ -28,8 +28,8 @@ MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
-PACKAGES =+ "util-linux-swaponoff"
-PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
+PACKAGES =+ "${PN}-swaponoff"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
 
 python util_linux_binpackages () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
@@ -73,7 +73,16 @@ python util_linux_binpackages () {
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
 PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
 
-PACKAGES_DYNAMIC = "^util-linux-.*"
+python util_linux_libpackages() {
+    do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(.*)\.so\..*$',
+                      output_pattern='${PN}-lib%s',
+                      description='${PN} lib%s',
+                      extra_depends='', prepend=True, allow_links=True)
+}
+
+PACKAGESPLITFUNCS =+ "util_linux_libpackages"
+
+PACKAGES_DYNAMIC = "^${PN}-.*"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 UTIL_LINUX_LIBDIR = "${libdir}"
@@ -97,44 +106,42 @@ EXTRA_OECONF = "\
 
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
-
 # Respect the systemd feature for uuidd
-PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/, --without-systemd --without-systemdsystemunitdir,systemd"
-
+PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
 # Build setpriv requires libcap-ng
 PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
-
 # Build python bindings for libmount
 PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
-
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 
+EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
+
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN} = ""
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
-
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
-
 FILES_${PN}-mount = "${sysconfdir}/default/mountall"
-FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
-FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
-                               ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
-                               ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
+FILES_${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
+FILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
+CONFFILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
+                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
+                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
 
 # Util-linux' blkid replaces the e2fsprogs one
-RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
-RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
+RCONFLICTS_${PN}-blkid = "e2fsprogs-blkid"
+RREPLACES_${PN}-blkid = "e2fsprogs-blkid"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 
-RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
+RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
 
+RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
 RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff = "1"
 
@@ -144,17 +151,11 @@ SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
 SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
 SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
 
-do_compile () {
-	set -e
-	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'
-}
-
 do_install () {
 	# with ccache the timestamps on compiled files may
 	# end up earlier than on their inputs, this allows
 	# for the resultant compilation in the install step.
-	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= \
-		'OPT=${CFLAGS}' 'CC=${CC}' 'LD=${LD}' \
+	oe_runmake 'CC=${CC}' 'LD=${LD}' \
 		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
 
 	mkdir -p ${D}${base_bindir}
@@ -208,38 +209,67 @@ do_install_append_class-native () {
 
 ALTERNATIVE_PRIORITY = "80"
 
-ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
-ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
-ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
-ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
-ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
 ALTERNATIVE_LINK_NAME[chrt] = "${bindir}/chrt"
+ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
+ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
 ALTERNATIVE_LINK_NAME[flock] = "${bindir}/flock"
+ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
+ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
+ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
+ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
+ALTERNATIVE_${PN}-agetty = "getty"
+ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
+ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
+ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
+ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
+ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
 ALTERNATIVE_${PN}-last = "last lastb"
 ALTERNATIVE_LINK_NAME[last] = "${bindir}/last"
 ALTERNATIVE_LINK_NAME[lastb] = "${bindir}/lastb"
 ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
+ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
+ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
+ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
+ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
+ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
+ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
+ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
+ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
+ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
+ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
+ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
+ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[taskset] = "${bindir}/taskset"
+ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
+ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
-ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
-ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
+ALTERNATIVE_${PN}-doc = "blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1"
 ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
 
+ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
+ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
+ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
+ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
+ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
 ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
+ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
+ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
 ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
@@ -247,67 +277,12 @@ ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
 ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
-ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
-ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
-ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
-ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
-ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
-ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
-ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
-ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
-
-ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
-
-ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
-
-ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
-
-ALTERNATIVE_util-linux-agetty = "getty"
-ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
-ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
-
-ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
-ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
-
-ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
-
-ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
-
-ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
-ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
-
-ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
-
-ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
-
-ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
-
-ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-
-ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
-
-ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
-
-ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
+ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
-ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
-
-ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 
 BBCLASSEXTEND = "native nativesdk"
 
-python populate_packages_prepend() {
-    do_split_packages(d, d.getVar('UTIL_LINUX_LIBDIR'), r'^lib(.*)\.so\..*$',
-                      output_pattern='util-linux-lib%s',
-                      description='util-linux lib%s',
-                      extra_depends='', prepend=True, allow_links=True)
-}
-
-RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
-
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
 }
-- 
2.20.1


