Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D31AA73430
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8Ff8G020959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:41 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:36 -0800
Message-ID: <d7340e48cc0538b5d5ab946a202985eb117daf41.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] meta: enable parallel build for several recipes
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:41 -0000
Content-Type: text/plain

I used a for loop to build these packages more than 520 times, these
recipes never failed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../nfs-utils/nfs-utils_1.3.1.bb                   |    2 --
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |    3 ---
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 --
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 --
 meta/recipes-devtools/json-c/json-c_0.12.bb        |    2 --
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    2 --
 .../python/python-pygobject_2.28.3.bb              |    2 --
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |    1 -
 meta/recipes-extended/bash/bash.inc                |    2 --
 meta/recipes-extended/mailx/mailx_12.5.bb          |    1 -
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 --
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 --
 .../xorg-lib/libpthread-stubs_0.3.bb               |    1 -
 meta/recipes-graphics/xorg-lib/xcb-util.inc        |    2 --
 meta/recipes-kernel/perf/perf.bb                   |    1 -
 meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    2 --
 meta/recipes-support/icu/icu.inc                   |    1 -
 meta/recipes-support/libpcre/libpcre_8.36.bb       |    2 --
 18 files changed, 32 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index d312349..e4655d9 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -34,8 +34,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
 SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
 SRC_URI[sha256sum] = "ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
 
-PARALLEL_MAKE = ""
-
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
 
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 69f8566..52ba1d76 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -17,9 +17,6 @@ SRC_URI[sha256sum] = "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706
 
 EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
 
-# http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg21444.html
-PARALLEL_MAKE = ""
-
 PACKAGES =+ "cgroups-pam-plugin"
 FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 41a17d2..809007f 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -2,8 +2,6 @@ require autoconf.inc
 
 PR = "r11"
 
-PARALLEL_MAKE = ""
-
 LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 5515666..eb47dad 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -11,8 +11,6 @@ RDEPENDS_${PN}_class-native = "xz-native"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-PARALLEL_MAKE = ""
-
 inherit autotools gettext perlnative pkgconfig systemd
 
 python () {
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
index 79cf6dc..e9c5b31 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -11,8 +11,6 @@ SRC_URI[sha256sum] = "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c1707
 
 RPROVIDES_${PN} = "libjson"
 
-PARALLEL_MAKE = ""
-
 inherit autotools
 
 do_configure_prepend() {
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 52297c6..267d1e9 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -29,6 +29,4 @@ FILES_mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/j
 FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
 FILES_mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
 
-PARALLEL_MAKE = ""
-
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
index 45a0603..e7f17ff 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
@@ -18,8 +18,6 @@ S = "${WORKDIR}/pygobject-${PV}"
 
 EXTRA_OECONF += "--disable-introspection"
 
-PARALLEL_MAKEINST = ""
-
 inherit autotools distutils-base pkgconfig
 
 # necessary to let the call for python-config succeed
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index 543c8a6..7d02b9f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -36,7 +36,6 @@ inherit autotools ptest
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
 EXTRA_OEMAKE = "-w"
-PARALLEL_MAKE = ""
 
 do_install_append () {
     install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 0fd5af9..d7b28cf 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -6,8 +6,6 @@ DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext texinfo update-alternatives ptest
 
-PARALLEL_MAKE = ""
-
 EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF = "--enable-job-control"
 
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index cc0b6bf..f2899d5 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -29,4 +29,3 @@ inherit autotools-brokensep
 CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
 EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail"
 
-PARALLEL_MAKE = ""
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index e544b60..266bd42 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -53,8 +53,6 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 
-PARALLEL_MAKE = ""
-
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
 do_configure_prepend() {
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
index 38304a9..197f962 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
@@ -42,8 +42,6 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 
-PARALLEL_MAKE = ""
-
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
 do_configure_prepend() {
diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
index 3e7ef27..5514c7f 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
@@ -7,7 +7,6 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
 
-PARALLEL_MAKE = ""
 #DEPENDS = "xcb-proto xproto libxau libxslt-native"
 # DEPENDS += "xsltproc-native gperf-native"
 
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util.inc b/meta/recipes-graphics/xorg-lib/xcb-util.inc
index 7dad545..d15cf9f 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util.inc
+++ b/meta/recipes-graphics/xorg-lib/xcb-util.inc
@@ -16,8 +16,6 @@ SECTION = "x11/libs"
 DEPENDS = "libxcb"
 DEPENDS += "gperf-native"
 
-PARALLEL_MAKE = ""
-
 SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index fcfd0ad..f69d177 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -98,7 +98,6 @@ EXTRA_OEMAKE += "\
     'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
-PARALLEL_MAKE = ""
 
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
index 9fd88a3..5ff50b7 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
@@ -14,8 +14,6 @@ SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
 SRC_URI[md5sum] = "c4438b22c08e5811ff10e2b06ee9b9ae"
 SRC_URI[sha256sum] = "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6"
 
-PARALLEL_MAKE = ""
-
 inherit autotools pkgconfig lib_package
 
 EXTRA_OECONF = " --enable-fixed-point --with-ogg-libraries=${STAGING_LIBDIR} \
diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 26994bb..f192b95 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -10,7 +10,6 @@ S = "${WORKDIR}/icu/source"
 SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
-PARALLEL_MAKE = ""
 CPPFLAGS_append_libc-uclibc = " -DU_TIMEZONE=0"
 
 BINCONFIG = "${bindir}/icu-config"
diff --git a/meta/recipes-support/libpcre/libpcre_8.36.bb b/meta/recipes-support/libpcre/libpcre_8.36.bb
index 6aa0237..a4b7f6d 100644
--- a/meta/recipes-support/libpcre/libpcre_8.36.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.36.bb
@@ -28,8 +28,6 @@ BINCONFIG = "${bindir}/pcre-config"
 
 inherit autotools binconfig-disabled ptest
 
-PARALLEL_MAKE = ""
-
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
     --enable-rebuild-chartables \
-- 
1.7.9.5


