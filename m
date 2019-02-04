Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 219B37C214
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:06:10 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id f9so10671498eds.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=APC7mLfCq9OnUaxOo331bSZ3kPVWEiVKWYOLymMU5Bs=;
	b=GWkvbXNQpaDw6Yvf+xLw3P3nvpxJIl2qLngRipZgQ85xq3N24ew1rkN/ingYrSJ2/K
	mvv2wIfzC/0sXJxqKxbbKCoFaxb7UUG71ts83nrlNHvu4rN9zFLWveqoS09H8vB1wnBe
	Q+vHITBzrbZbSmge8FR2KNdiA4dZc5UEeplx6wyviEX28GyKJxGiQUxegQna/uyO5TtC
	Gn0qtdhwINZIcgviWM+z8JI6O9v8kk9ocyn940nfRBd1UEkb8nHtNf+Z4L/sapfKOxNy
	z6VJJ3lFq8gb5hRFeBmAa9Ed2nJKniFFal8JKJQ0irN5K98eQs4c76n6Ka0E/pDIxsul
	DYlQ==
X-Gm-Message-State: AJcUukfqFO2j7saKfpXZrJgTZGlLW6Pt5KP+NbDgNWV+Jb7jLAXTH3aN
	kt40rr3b4zLji67d27E3ck1qvvER
X-Google-Smtp-Source: ALg8bN55bPiMR5C+LehFlqfrt69VczZO6wZ/Z2WUfku9a0A6brwAtL6i1lRQ9f3B4yj3aLStdlOkGQ==
X-Received: by 2002:a17:906:35d9:: with SMTP id
	p25mr38847651ejb.98.1549274770259; 
	Mon, 04 Feb 2019 02:06:10 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.06.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:06:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:52 +0000
Message-Id: <20190204100552.25880-12-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204100552.25880-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190204100552.25880-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 11/11] util-linux: final cleanup
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
X-List-Received-Date: Mon, 04 Feb 2019 10:06:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

* use ${PN} instead of util-linux
* use PACKAGESPLITFUNCS for creating util-linux-lib* packages
  rather than an _append OVERRIDE
* sort ALTERNATIVE_LINK_NAME alphabetically
* Fix handling of escape characters in regexs and hence fix python
  Deprecation warnings which will be problematic in python 3.8.
* use systemd_system_unitdir instead of open-coding
* inherit manpages so as to benefit from man-db processing (note
  that manpages are not generated here, we just want the
  automatic update of the package index caches
* use EXTRA_OEMAKE instead of duplicating command line arguments

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v5: * fix subject line typo
v3: * use PACKAGESPLITFUNCS =+ rather than PACKAGESPLITFUNCS_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use systemd_system_unitdir instead of open-coding
    * inherit manpages
    * use EXTRA_OEMAKE instead of duplicating command line arguments
    * also sort ALTERNATIVE_LINK_NAME for man pages
---
 meta/recipes-core/util-linux/util-linux.inc | 156 ++++++++------------
 1 file changed, 65 insertions(+), 91 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 78a4d6151c..c122b04865 100644
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
@@ -74,7 +74,16 @@ python util_linux_binpackages () {
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
 PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
 
-PACKAGES_DYNAMIC = "^util-linux-.*"
+python util_linux_libpackages() {
+    do_split_packages(d, root='${base_libdir}', file_regex=r'^lib(.*)\.so\..*$',
+                      output_pattern='${PN}-lib%s',
+                      description='${PN} lib%s',
+                      extra_depends='', prepend=True, allow_links=True)
+}
+
+PACKAGESPLITFUNCS =+ "util_linux_libpackages"
+
+PACKAGES_DYNAMIC = "^${PN}-.*"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -88,47 +97,44 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
 "
 
 EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
+EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
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
 
@@ -138,17 +144,11 @@ SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
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
@@ -202,38 +202,67 @@ do_install_append_class-native () {
 
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
@@ -241,67 +270,12 @@ ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
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
-    do_split_packages(d, '${base_libdir}', r'^lib(.*)\.so\..*$',
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


