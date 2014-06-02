Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10C4860017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 20:05:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s52K5EKH021323 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:05:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Qu14QH9NX38s
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:05:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s52K57ve021319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:05:09 +0100
Message-ID: <1401739499.12440.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jun 2014 21:04:59 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: recipes: Add missing pkgconfig class inherits
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
X-List-Received-Date: Mon, 02 Jun 2014 20:05:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These recipes all use pkg-config in some way but were missing
dependencies on the tool, this patch adds them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index 80df2b6..7fc908e 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "gnu-efi util-linux"
 
-inherit autotools
+inherit autotools pkgconfig
 inherit deploy
 
 PV = "43+git${SRCPV}"
diff --git a/meta/recipes-bsp/usbutils/usbutils_007.bb b/meta/recipes-bsp/usbutils/usbutils_007.bb
index a65672e..b93b2bd 100644
--- a/meta/recipes-bsp/usbutils/usbutils_007.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_007.bb
@@ -17,7 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
 SRC_URI[md5sum] = "be6c42294be5c940f208190d3479d50c"
 SRC_URI[sha256sum] = "e65c234cadf7c81b6b1567c440e3b9b31b44f51c27df3e45741b88848d8b37d3"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 do_install_append() {
 	# We only need the compressed copy, remove the uncompressed version
diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 321fddb..11c9616 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -24,7 +24,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = "\
   --disable-gstreamer \
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index f121ea3..6688739 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep gtk-icon-cache
+inherit autotools-brokensep gtk-icon-cache pkgconfig
 
 RDEPENDS_${PN} = "connman"
 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 73cfa6b..048b0e5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -44,7 +44,7 @@ INITSCRIPT_PARAMS = "defaults"
 INITSCRIPT_NAME_${PN}-client = "nfscommon"
 INITSCRIPT_PARAMS_${PN}-client = "defaults 19 21"
 
-inherit autotools-brokensep update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd pkgconfig
 
 SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service"
 SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index fdb19ba..691dc86 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -14,4 +14,4 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta/recipes-core/kbd/kbd_2.0.1.bb b/meta/recipes-core/kbd/kbd_2.0.1.bb
index 265b906..9c6eabb 100644
--- a/meta/recipes-core/kbd/kbd_2.0.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a5fcc36121d93e1f69d96a313078c8b5"
 DEPENDS = "libcheck"
 
-inherit autotools gettext ptest
+inherit autotools gettext ptest pkgconfig
 
 RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index c597111..d19460a 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -28,7 +28,7 @@ SRC_URI[md5sum] = "03f1bce1a4983076d955003472306a13"
 SRC_URI[sha256sum] = "aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c69103e2"
 
 
-inherit autotools gettext texinfo
+inherit autotools gettext pkgconfig texinfo
 BBCLASSEXTEND = "native"
 
 DEPENDS = "libunistring bdwgc gmp libtool libffi"
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 61f81b0..ac25326 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -12,7 +12,7 @@ SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
 
 DEPENDS = "readline libxml2"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGES =+ "${PN}-lenses lib${BPN} lib${BPN}-dev lib${BPN}-staticdev lib${BPN}-dbg"
 
diff --git a/meta/recipes-extended/blktool/blktool_4-6.1.bb b/meta/recipes-extended/blktool/blktool_4-6.1.bb
index 8bd1bae..69f2261 100644
--- a/meta/recipes-extended/blktool/blktool_4-6.1.bb
+++ b/meta/recipes-extended/blktool/blktool_4-6.1.bb
@@ -21,4 +21,4 @@ SRC_URI[patch.sha256sum] = "d7923527e1a00984620ab307c9047a653d7ae2856cd20a82de8a
 
 S = "${WORKDIR}/${BPN}-4.orig"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index c0290b1..790c981 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
 SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
 
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index 02bb843..dc17d57 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
 SRC_URI[sha256sum] = "52004c68021da9a599feed27f65defcfb22128f7da2c0531c0f75de0f479d3e0"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
                "
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index c73ed35..3e6cdb4 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -34,6 +34,6 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
 SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e"
 
-inherit autotools-brokensep lib_package
+inherit autotools-brokensep lib_package pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/libuser/libuser_0.60.bb b/meta/recipes-extended/libuser/libuser_0.60.bb
index ca608c7..e6316ef 100644
--- a/meta/recipes-extended/libuser/libuser_0.60.bb
+++ b/meta/recipes-extended/libuser/libuser_0.60.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "b1f73408ebfee79eb01a47c5879a2cdef6a00b75ee24870de7df1b816f
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
 
-inherit autotools gettext pythonnative python-dir
+inherit autotools gettext pythonnative python-dir pkgconfig
 
 EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}"
 
diff --git a/meta/recipes-extended/minicom/minicom_2.7.bb b/meta/recipes-extended/minicom/minicom_2.7.bb
index 8b20ece..c002bc8 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 do_install() {
 	for d in doc extras man lib src; do make -C $d DESTDIR=${D} install; done
diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.32.bb b/meta/recipes-extended/msmtp/msmtp_1.4.32.bb
index 1ef8547..4b7024b 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.32.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.32.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.
 SRC_URI[md5sum] = "aa60e22211118f222470439cea60f795"
 SRC_URI[sha256sum] = "2bf0c5c7e78f9905f48de235a75111a1a88238793043bbeae00360b22f1a5f88"
 
-inherit gettext autotools update-alternatives
+inherit gettext autotools update-alternatives pkgconfig
 
 EXTRA_OECONF += "--without-gnome-keyring --without-libidn"
 
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
index 23219e0..89e567b 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
@@ -26,7 +26,7 @@ UCLIBCPATCHES ?= ""
 SRC_URI[md5sum] = "0a5f9c2142af814c55d957aaab3bcc68"
 SRC_URI[sha256sum] = "da169ff877a5a07581fad50a9a808ac6e96f0c277a3df49a7ef005778428496e"
 
-inherit autotools update-rc.d systemd
+inherit autotools update-rc.d systemd pkgconfig
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index b870b79..d97d1d6 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -22,4 +22,4 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 6b4c756..6057596 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
 
 S = "${WORKDIR}/DirectFB-examples-${PV}"
 
-inherit autotools
+inherit autotools pkgconfig
 
 SRC_URI[md5sum] = "8b60c867af295481c32a8c7fc5802307"
 SRC_URI[sha256sum] = "9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a"
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 2f5a872..57ff9f6 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac
 
 S = "${WORKDIR}/git/tests"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/glew/glew_1.10.0.bb b/meta/recipes-graphics/glew/glew_1.10.0.bb
index de25069..94f1bc1 100644
--- a/meta/recipes-graphics/glew/glew_1.10.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.10.0.bb
@@ -18,4 +18,4 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
 SRC_URI[md5sum] = "2f09e5e6cb1b9f3611bcac79bc9c2d5d"
 SRC_URI[sha256sum] = "99c41320b63f6860869b5fb9af9a1854b15582796c64ee3dfd7096dc0c89f307"
 
-inherit autotools lib_package
+inherit autotools lib_package pkgconfig
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 95abfce..562434f 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxi"
 PV = "0.7.5+git${SRCPV}"
 PR = "r6"
 
-inherit autotools
+inherit autotools pkgconfig
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index 9600d09..20d66be 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -19,4 +19,4 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.
 SRC_URI[md5sum] = "d8a54596cbaf037e62b80c4585a3ca9b"
 SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb b/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
index e6ccd04..7e01775 100644
--- a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
+++ b/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GPE_MIRROR}/xtscal-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "9bcab80b474d5454477d1ca166a68c34"
 SRC_URI[sha256sum] = "27b9dc2203de9b1706ca39fa6ca80ecab8807909ec901c4a345b8e41178800a1"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install_append() {
     install -d ${D}${sysconfdir}/X11/Xsession.d/
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
index 542491b..a8ea4cb 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
-inherit autotools
+inherit autotools pkgconfig
 
 DEPENDS = "glib-2.0 util-linux popt"
 
diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index e431071..ccf9f9f 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -22,7 +22,7 @@ SRC_URI = "file://opstart.patch \
            file://oprofile-root.patch \
            file://acinclude.m4"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
diff --git a/meta/recipes-kernel/powertop/powertop_2.5.bb b/meta/recipes-kernel/powertop/powertop_2.5.bb
index f37d7a7..86a7f60 100644
--- a/meta/recipes-kernel/powertop/powertop_2.5.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.t
 SRC_URI[md5sum] = "806bbcbd44fcea1f807c9582fc1f7d3e"
 SRC_URI[sha256sum] = "8b2c08a555d79e1c428863470c41cb023971d74ba4801d80a05e35adeec23c0b"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 # we need to explicitly link with libintl in uClibc systems
 LDFLAGS += "${EXTRA_LDFLAGS}"
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 73e617f..ef1e270 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -17,4 +17,4 @@ SRC_URI_append_mips64 = " file://rmb-mips.patch"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index 2edacc1..123926a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "02bfac39092f3b68d743c23ad3d688d6c5aa8df69f2ccd692c5b8282ed
 EXTRA_OECONF = "--disable-xmlto"
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
-inherit autotools-brokensep gettext
+inherit autotools-brokensep gettext pkgconfig
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
 # ipk depends on them.
diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index 2192f3f..d0e8872 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
 SRC_URI[md5sum] = "84835b313d4a8b68f5349816d33e07ce"
 SRC_URI[sha256sum] = "24346b4158e4af3bd9f2e194bb23eb473c75fb7377011523353196b19b9a23ff"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGES += "libmp3lame libmp3lame-dev"
 FILES_${PN} = "${bindir}/lame"
diff --git a/meta/recipes-multimedia/sbc/sbc_1.2.bb b/meta/recipes-multimedia/sbc/sbc_1.2.bb
index c9811e7..9cdf01b 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.2.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.2.bb
@@ -13,4 +13,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 SRC_URI[md5sum] = "ec65c444ad4c32aa85702641045b19e9"
 SRC_URI[sha256sum] = "c2f01ea54f7473704825113a9cdd46a23e67c650eff575f0670c3d9d66c4a5dc"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/recipes-multimedia/tremor/tremor_20120314.bb
index 145316c..afc78ac 100644
--- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20120314.bb
@@ -15,7 +15,7 @@ SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http \
 
 S = "${WORKDIR}/Tremor"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-shared"
 
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
index dac5ab4..db6dc90 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "3b5467c9f169812bc36a4245355b7deedea0a62eb22153df96ced88dcd
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
diff --git a/meta/recipes-support/atk/at-spi2-core_2.12.0.bb b/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
index bdda15a..31e133f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "db550edd98e53b4252521459c2dcaf0f3b060a9bad52489b9dbadbaeda
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-inherit autotools gtk-doc
+inherit autotools gtk-doc pkgconfig
 
 EXTRA_OECONF = "--disable-introspection --disable-xevie"
 
diff --git a/meta/recipes-support/gnupg/gnupg_2.0.22.bb b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
index 2746578..0b00362 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
@@ -8,7 +8,7 @@ DEPENDS = "${PTH} libassuan libksba zlib bzip2 readline libgcrypt"
 PTH = "pth"
 PTH_libc-uclibc = "npth"
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo pkgconfig
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://pkgconfig.patch"
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index fafd20f..ef08d4f 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm"
 
 BINCONFIG = "${bindir}/gpgme-config"
 
-inherit autotools texinfo binconfig-disabled
+inherit autotools texinfo binconfig-disabled pkgconfig
 
 PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"



