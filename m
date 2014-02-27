Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB476F39E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:01:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1RI1rNl022622 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:01:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SevukY-ObTTt
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:01:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1RI1pau022607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:01:53 GMT
Message-ID: <1393524104.31769.148.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2014 18:01:44 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] autotools-brokensep: Mark recipes with broken separate build dir support
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
X-List-Received-Date: Thu, 27 Feb 2014 18:02:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch goes through the OE-Core recipes and marks those which use autotools
but don't support a separate build directory (${S} != ${B}). A new class,
autotools-brokensep is used for this purpose.

This doesn't introduce any change in behaviour in its own right.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools-brokensep.bbclass b/meta/classes/autotools-brokensep.bbclass
new file mode 100644
index 0000000..71cf97a
--- /dev/null
+++ b/meta/classes/autotools-brokensep.bbclass
@@ -0,0 +1,5 @@
+# Autotools class for recipes where separate build dir doesn't work
+# Ideally we should fix software so it does work. Standard autotools supports
+# this.
+inherit autotools
+B = "${S}"
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 8f112ed..65d6068 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2.0"
 LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356ae81f50f4e4dfd99"
 PR = "r3"
 
-inherit autotools
+inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
            file://add_stdlib.patch \
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 19a9f05..e12bb39 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -33,7 +33,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
                "
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 INITSCRIPT_NAME = "bind"
 INITSCRIPT_PARAMS = "defaults"
diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 73c2b75..0827005 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -24,7 +24,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "\
   --disable-gstreamer \
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e08dff4..2b832ef 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -19,7 +19,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools pkgconfig systemd
+inherit autotools-brokensep pkgconfig systemd
 
 EXTRA_OECONF = "\
   --enable-tools \
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index f69d78c..f121ea3 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-icon-cache
+inherit autotools-brokensep gtk-icon-cache
 
 RDEPENDS_${PN} = "connman"
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 84d8d1d..b3147c9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -66,7 +66,7 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools-brokensep pkgconfig systemd update-rc.d
 
 do_configure_append () {
 	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index 7f216ac..7403dc9 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67
 
 export SYS_INCLUDES="-I${STAGING_INCDIR}"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 INITSCRIPT_NAME = "irattach"
 INITSCRIPT_PARAMS = "defaults 20"
diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 7cccbdc..1dde1da 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools-brokensep pkgconfig systemd update-rc.d
 
 EXTRA_OECONF += "--enable-tools"
 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
index 45eacd9..da37160 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
@@ -44,7 +44,7 @@ INITSCRIPT_PARAMS = "defaults"
 INITSCRIPT_NAME_${PN}-client = "nfscommon"
 INITSCRIPT_PARAMS_${PN}-client = "defaults 19 21"
 
-inherit autotools update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd
 
 SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service"
 SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index b5e84d4..236714d 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -49,7 +49,7 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
 
-inherit autotools
+inherit autotools-brokensep
 
 # LFS support:
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 52bab4f..15ee3ff 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -37,7 +37,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
 SRC_URI[md5sum] = "4621bc56167b6953ec4071043fe0ec57"
 SRC_URI[sha256sum] = "43317afec9299f9920b96f840414c977f0385410202d48e56d2fdb8230003505"
 
-inherit autotools
+inherit autotools-brokensep
 
 TARGET_CC_ARCH += " ${LDFLAGS}"
 EXTRA_OEMAKE = "STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}${includedir} LIBDIR=${D}${libdir}/pppd/${PV} BINDIR=${D}${sbindir}"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
index fbd8ba2..e05620d 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/t
 SRC_URI[md5sum] = "736ae9d71028d8e6d95017433c07fa06"
 SRC_URI[sha256sum] = "edc3c7265c291343d5d7d47c20add4d426e894068c66c79696795502a4e1c1d0"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools-brokensep pkgconfig pythonnative
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f76f68b..1d5303f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
            file://cmake-2.8.11.2-FindFreetype.patch \
            "
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure () {
 	./configure --prefix=${prefix}
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index ed55fa5..037aaaa 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
 DEPENDS += "tcl"
 RDEPENDS_${PN} = "tcl"
 
-inherit autotools
+inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-configure.in.patch \
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index a0da027..5d02343 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -13,7 +13,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-tcltk \
 "
 
-inherit autotools perlnative
+inherit autotools-brokensep perlnative
 
 EXTRA_OEMAKE = "NO_PYTHON=1 RUNTIME_PREFIX=1"
 
diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index 79d5a4e..18e7fc0 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
 SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
 SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
 
-inherit autotools allarch perlnative
+inherit autotools-brokensep allarch perlnative
 
 do_configure_append() {
 	# Make sure we use our nativeperl wrapper.
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index ea0ffcb..fce4178 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "7103facee18a2ea97186ca459d743d22f7f89ad4b5cd1dfd1c34f83d6b
 
 FILESPATH = "${FILE_DIRNAME}/linuxdoc-tools-native/"
 
-inherit autotools native
+inherit autotools-brokensep native
 
 do_configure () {
 	oe_runconf
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index baa8f45..bcf68a8 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -20,7 +20,7 @@ CFLAGS += "-fno-stack-protector"
 CACHED_CONFIGUREVARS += "HOST_CC='${BUILD_CC}'"
 EXTRA_OEMAKE += "HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_install_append() {
 	rmdir ${D}${datadir}/mkelfImage/elf32-i386
diff --git a/meta/recipes-devtools/nasm/nasm_2.11.bb b/meta/recipes-devtools/nasm/nasm_2.11.bb
index 859cd21..5f4b953 100644
--- a/meta/recipes-devtools/nasm/nasm_2.11.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.11.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
 SRC_URI[md5sum] = "4cd558047ea5ed51fc2c7c94e249c7b8"
 SRC_URI[sha256sum] = "1ce7e897c67255a195367a60c739a90a0b33a4a73f058f7cda3253bcf975642b"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure_prepend () {
 	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index ad03334..ccce421 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
 SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
 
-inherit autotools native
+inherit autotools-brokensep native
 
 EXTRA_OECONF = "--enable-spincludedir=${STAGING_INCDIR}/OpenSP \
                 --enable-splibdir=${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 5a07665..90079a2 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "726457e11cb153adc3f428aaf1901fc561a374c30e5e7da6742c0742a3
 
 PYTHON_MAJMIN = "2.7"
 
-inherit autotools
+inherit autotools-brokensep
 
 PYTHONLSBOPTS = "--with-wctype-functions"
 PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1702321..7eef705 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
 RDEPENDS_${PN}_class-target += "bash python"
 
 require qemu-targets.inc
-inherit autotools
+inherit autotools-brokensep
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-devtools/quilt/quilt-0.61.inc
index 19966c8..4d915bf 100644
--- a/meta/recipes-devtools/quilt/quilt-0.61.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
@@ -13,7 +13,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
 SRC_URI[md5sum] = "24417eba5961592b64103bdda001ebf4"
 SRC_URI[sha256sum] = "1eec0a270ac4d41eea0fd5823603c9d2a35ab6b8ab73a90dd92ce1291b2a9fc3"
 
-inherit autotools ptest
+inherit autotools-brokensep ptest
 
 EXTRA_OECONF_darwin += "--without-date \
                         --without-getopt \
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index aa169f8..75c8182 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -12,7 +12,7 @@ INC_PR = "r1"
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "--disable-vapigen"
 
diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extended/at/at_3.1.14.bb
index 5207a0f..1b87d4a 100644
--- a/meta/recipes-extended/at/at_3.1.14.bb
+++ b/meta/recipes-extended/at/at_3.1.14.bb
@@ -39,7 +39,7 @@ EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-atspool=/var/spool/at/spool \
                  ac_cv_header_security_pam_appl_h=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} "
 
-inherit autotools systemd
+inherit autotools-brokensep systemd
 
 SYSTEMD_SERVICE_${PN} = "atd.service"
 
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 9ccb390..2bb2df9 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -4,7 +4,7 @@ SECTION = "base/shell"
 
 DEPENDS = "ncurses bison-native"
 
-inherit autotools gettext update-alternatives ptest
+inherit autotools-brokensep gettext update-alternatives ptest
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
index 0550318..89d8bee 100644
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ b/meta/recipes-extended/bc/bc_1.06.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
 SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
 SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
 
-inherit autotools update-alternatives
+inherit autotools-brokensep update-alternatives
 
 ALTERNATIVE_${PN} = "dc"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
index b4354a4..d70e76f 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
 SRC_URI[md5sum] = "90536219c520add2ceb3c26f0d7da404"
 SRC_URI[sha256sum] = "408905c2539a97dc8cbbb6d7cd2046cb5647a345b4bda399220d9471be16d156"
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 7a18500..e4771f7 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -12,7 +12,7 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
 
 LEAD_SONAME = "libcupsdriver.so"
 
-inherit autotools binconfig
+inherit autotools-brokensep binconfig
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.07.bb b/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
index 3ce9f12..64dc6f2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
@@ -54,7 +54,7 @@ EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
 CFLAGS += "-DHAVE_SYS_TIME_H=1"
 BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure_prepend () {
 	mkdir -p obj
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index ffe0b2e..2556dc8 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -31,6 +31,6 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
 SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e"
 
-inherit autotools lib_package
+inherit autotools-brokensep lib_package
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 2ab1d50..361eccb 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools-brokensep
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index 1245a11..b4521f5 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -24,7 +24,7 @@ SRC_URI[patch.sha256sum] = "aaf2a4bbf145e5ca9cdeb0843091ec8cc01df6c9568c997207a5
 
 S = "${WORKDIR}/heirloom-mailx-${PV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
 
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.bb b/meta/recipes-extended/mdadm/mdadm_3.3.bb
index 596b04d..5ef418e 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "9c07e518bdf3392ebac8874eb686258e10ea3ae0ff7a8acb6d014718a9
 
 CFLAGS += "-fno-strict-aliasing"
 
-inherit autotools
+inherit autotools-brokensep
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
index ee8206e..65bcf40 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
@@ -32,7 +32,7 @@ S = "${WORKDIR}/newt-${PV}"
 
 EXTRA_OECONF = "--without-tcl --without-python"
 
-inherit autotools
+inherit autotools-brokensep
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
diff --git a/meta/recipes-extended/procps/procps.inc b/meta/recipes-extended/procps/procps.inc
index 20d5fc2..da91da2 100644
--- a/meta/recipes-extended/procps/procps.inc
+++ b/meta/recipes-extended/procps/procps.inc
@@ -13,7 +13,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz \
            file://install.patch"
 
-inherit autotools update-alternatives
+inherit autotools-brokensep update-alternatives
 
 do_install_append() {
 	mv ${D}${bindir}/watch ${D}${bindir}/watch.${BPN}
diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index d62834f..82f7899 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/quota-tools"
 
 DEPENDS = "gettext-native e2fsprogs"
 
-inherit autotools gettext pkgconfig
+inherit autotools-brokensep gettext pkgconfig
 
 EXTRA_OEMAKE += 'STRIP=""'
 
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index db5c633..90ed2d0 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
            file://sprintf-bug-concerning-8-bit-characters.patch \
           "
 
-inherit autotools
+inherit autotools-brokensep
 
 SRC_URI[md5sum] = "7fcfd447e378f07dd0c0bae671fe6487"
 SRC_URI[sha256sum] = "9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a01d5db"
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index af1fa0c..09a5d28 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -8,7 +8,7 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
            file://99_sysstat \
           "
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 EXTRA_OECONF += "--disable-sensors"
 EXTRA_OEMAKE += 'LFLAGS=""'
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
index f988b96..7969879 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
@@ -21,6 +21,6 @@ SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
 SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
 
-inherit autotools
+inherit autotools-brokensep
 
 RDEPENDS_${PN} += "xprop"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 9dbd6f7..0cc0ee5 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
 DEPENDS_class-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
 
-inherit gnome gettext python-dir pythonnative
+inherit gnome gettext python-dir pythonnative autotools-brokensep
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index ba0c27f..4441e04 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
 SECTION = "unknown"
-inherit gnomebase allarch
+inherit gnomebase allarch autotools-brokensep
 
 PR = "r1"
 
diff --git a/meta/recipes-graphics/freetype/freetype_2.5.2.bb b/meta/recipes-graphics/freetype/freetype_2.5.2.bb
index 2521b5e..b93453a 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.2.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "4ff4bd393aa01071ec7b849d035508a505a78f88b2bcf25ff11e58e43c
 
 S = "${WORKDIR}/freetype-${PV}"
 
-inherit autotools pkgconfig binconfig
+inherit autotools-brokensep pkgconfig binconfig
 
 LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
index 0b02c10..ee7f186 100644
--- a/meta/recipes-graphics/mx/mx.inc
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Clutter based UI widget library"
 LICENSE = "LGPLv2.1"
 
-inherit clutter
+inherit clutter autotools-brokensep
 
 DEPENDS = "clutter-1.0 dbus-glib gdk-pixbuf"
 
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 162c2dd..9785a16 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a
 
 DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 783bcd7..3f97e19 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF += "--with-gui=x11"
 
 do_install_append() {
     install -d ${D}${bindir}
-    install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+    install -m 0755 ${S}/scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
 
     install -d ${D}${sysconfdir}/X11/Xsession.d/
     install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
diff --git a/meta/recipes-graphics/xorg-proto/presentproto_git.bb b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
index bd6c60a..7fca51d 100644
--- a/meta/recipes-graphics/xorg-proto/presentproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
@@ -17,4 +17,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/presentproto"
 S = "${WORKDIR}/git"
 
+inherit autotools-brokensep
+
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index de375d7..3eca25f 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -4,7 +4,7 @@ SECTION = "bootloader"
 LICENSE = "GPLv2 | BSD"
 DEPENDS = "flex-native bison-native"
 
-inherit autotools
+inherit autotools-brokensep
 
 SRC_URI = "git://www.jdl.com/software/dtc.git \
            file://make_install.patch \
diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 5a9c515..50b448c 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -10,7 +10,7 @@ DEPENDS = "zlib xz"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
 
-inherit autotools
+inherit autotools-brokensep
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|freebsd.*)'
 
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
index e0ce564..ee59a46 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.3 \
 
 S = "${WORKDIR}/git"
 
-inherit autotools ptest
+inherit autotools-brokensep ptest
 
 export KERNELDIR="${STAGING_KERNEL_DIR}"
 
diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 2619eab..080219e 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -26,7 +26,7 @@ SRC_URI = "file://opstart.patch \
            file://oprofile-root.patch \
            file://acinclude.m4"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 5b0f6ae..6321b78 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "805526ea5d6c40e1f2c94cee86141230"
 SRC_URI[sha256sum] = "553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e733841"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index 3384453..056fca2 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "02bfac39092f3b68d743c23ad3d688d6c5aa8df69f2ccd692c5b8282ed
 EXTRA_OECONF = "--disable-xmlto"
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
 # ipk depends on them.
diff --git a/meta/recipes-multimedia/flac/flac_1.3.0.bb b/meta/recipes-multimedia/flac/flac_1.3.0.bb
index aa04cac..ab37cbe 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.0.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
 SRC_URI[md5sum] = "13b5c214cee8373464d3d65dee362cdd"
 SRC_URI[sha256sum] = "fa2d64aac1f77e31dfbb270aeb08f5b32e27036a52ad15e69a77e309528010dc"
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 EXTRA_OECONF = "--disable-oggtest \
                 --with-ogg-libraries=${STAGING_LIBDIR} \
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
index 6457fee..4e37ff2 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
@@ -14,7 +14,7 @@ FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*.la"
 FILES_${PN}-dbg += " ${libdir}/gtk-2.0/*/engines/.debug"
 FILES_gtk-theme-sato = "${datadir}/icons ${datadir}/themes"
 
-inherit autotools  pkgconfig
+inherit autotools-brokensep pkgconfig
 
 do_configure_prepend() {
 	for i in `ls gtk-common`; do
diff --git a/meta/recipes-sato/puzzles/puzzles_r10116.bb b/meta/recipes-sato/puzzles/puzzles_r10116.bb
index 842c648..ef5392b 100644
--- a/meta/recipes-sato/puzzles/puzzles_r10116.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r10116.bb
@@ -11,7 +11,7 @@ SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
 
 S = "${WORKDIR}/${BPN}"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure_prepend () {
     ./mkfiles.pl
diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-support/apr/apr-util_1.5.2.bb
index 65f26b3..4546b97 100644
--- a/meta/recipes-support/apr/apr-util_1.5.2.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.2.bb
@@ -28,7 +28,7 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
 
-inherit autotools lib_package binconfig
+inherit autotools-brokensep lib_package binconfig
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
diff --git a/meta/recipes-support/apr/apr_1.4.8.bb b/meta/recipes-support/apr/apr_1.4.8.bb
index 4af2a6b..4d36585 100644
--- a/meta/recipes-support/apr/apr_1.4.8.bb
+++ b/meta/recipes-support/apr/apr_1.4.8.bb
@@ -19,7 +19,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ce2ab01a0c3cdb71cf0a6326b8654f41"
 SRC_URI[sha256sum] = "61b8d2f8d321c6365ee3d71d0bb41f3a89c44da6124cc5b407a3b8319d660421"
 
-inherit autotools lib_package binconfig multilib_header ptest
+inherit autotools-brokensep lib_package binconfig multilib_header ptest
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 86fcc93..8ac8809 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -23,4 +23,4 @@ FILES_libpspell = "${libdir}/libpspell.so.*"
 FILES_libpspell-dev = "${libdir}/libpspell* ${bindir}/pspell-config ${includedir}/pspell"
 
 ARM_INSTRUCTION_SET = "arm"
-inherit autotools gettext
+inherit autotools-brokensep gettext
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index bcc7acc..785ce0c 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -3,7 +3,7 @@
 SRC_URI += "file://relative-libdir.patch;striplevel=0 \
            "
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 # the package comes with a custom config.h.in, it cannot be
 # overwritten by autoheader
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
index 30ca808..146a02a 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[journald] = "--with-systemd-journal,--without-systemd-journal,systemd,systemd"
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 18c91eb..39aaec1 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -19,7 +19,7 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 
 SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.bz2"
 
-inherit autotools binconfig pkgconfig gettext lib_package
+inherit autotools-brokensep binconfig pkgconfig gettext lib_package
 
 EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
index 78da0bd..e320504 100644
--- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
+++ b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/js/src"
 
 # use local autoconf script to generate a usable jsautocfg.h
 # don't bother with automake
-inherit autotools
+inherit autotools-brokensep
 
 do_configure_prepend() {
 	cp -f ${WORKDIR}/configure.ac ${S}
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 61cd818..385665f 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -13,7 +13,7 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--enable-Bsymbolic=auto"
 PR = "r1"
 
-inherit autotools pkgconfig gnomebase
+inherit autotools-brokensep pkgconfig gnomebase
 
 GNOME_COMPRESS_TYPE = "xz"
 
diff --git a/meta/recipes-support/libfm/libfm_1.1.2.2.bb b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
index 581ab8c..ea6323a 100644
--- a/meta/recipes-support/libfm/libfm_1.1.2.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
 SRC_URI[md5sum] = "ea3d09b23ef4c37cb84ae57ea16b8f08"
 SRC_URI[sha256sum] = "158e2b6974350d2dab15932b496bb4d448553e60bbf7cdfe4d6e9bd99d19d682"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 PACKAGES += "${PN}-mime"
 FILES_${PN}-mime = "${datadir}/mime/"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 249939d..e7fcc62 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch"
 
-inherit autotools binconfig pkgconfig
+inherit autotools-brokensep binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-asm --with-capabilities"
 
diff --git a/meta/recipes-support/libnl/libnl_3.2.22.bb b/meta/recipes-support/libnl/libnl_3.2.22.bb
index 73b10c5..a299bfb 100644
--- a/meta/recipes-support/libnl/libnl_3.2.22.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.22.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
 SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
 SRC_URI[sha256sum] = "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 FILES_${PN} = "${libdir}/libnl-3.so.* \
                ${libdir}/libnl.so.* \
diff --git a/meta/recipes-support/nspr/nspr_4.10.3.bb b/meta/recipes-support/nspr/nspr_4.10.3.bb
index 4792b65..0adfe3b 100644
--- a/meta/recipes-support/nspr/nspr_4.10.3.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.3.bb
@@ -138,7 +138,7 @@ TESTS = "runtests.pl \
     xnotify \
     zerolen"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure() {
 	gnu-configize --force



