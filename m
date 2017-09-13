Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 296EA78523
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:46:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so828679wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=06htZiqjhzNIGxGe0k+mvuGBIEd6IywVUdPZghUrVG4=;
	b=rF2PA5mKCNOEv+VhKUvwtTbigY7ESMDgFMpOXgmPBDeMUzkcJwW3CiqJAJBT8+5OiG
	QIe/0Lw+6/BhiwuvAluH+5asfoRCQJdqQS3M7CDzwhR2E5ejth136qlrl9zDjLHNRdxa
	4Q6IFbayjLMp04RoAD+hAYGW/CH22FKCTZ3kwKg4f1n54EYej/RfILR44Eu9STvv+Dhj
	dWQmsOzm3d/NAvdTpMClAvoD5lERvQQ3Q07akujuSpPNpQQEojvX2lfB5T7QN32/021V
	7yugRLEBWF+R26uaWOBIEUL+OburDaAFXfk9t/EUVJUl2zPAkJfv98U19LWDsLwT9oTJ
	w0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=06htZiqjhzNIGxGe0k+mvuGBIEd6IywVUdPZghUrVG4=;
	b=uZ9OrZfg8NBU2QmwHDENTq7Zhcp9Gr03dyb4xUkPu8xcrbxh6q2XiPsP0Phg9ax4CZ
	aavGgIzu62HiXYso17lP1porgSrqrAQ5V7QsDebCTZ7AsJEKLj+bD169NxgkfyGNSL1M
	e80UutRFbgGdgoAQLXzARykhjEkjjCE1oOInhqPiy0+Jl2vIL612jlnZHZTol9Kk01g/
	D0A9ulpFsM7XooNn6l5SCeg1hVieDIRUsHy1cfqRsdDU389Q3xseyjCoFOQRXkTrDuTx
	QeOXKYIYwHO0rfJIj0u8CPXLEuqyGKvfMQK1owR8JFTxz+3Bh2pE4QusYcT9p6205NdV
	8opQ==
X-Gm-Message-State: AHPjjUg4msp0MOi7MEf2ghdjQGzC7BuCg61xVTsDFSwps4CtpY4oRdsC
	yPW/GV/0AbEhNuvR
X-Google-Smtp-Source: AOwi7QDHJINacy2U1goH7XpnglwvBFpzv5cQi7dApB7uLo9+P4r0cIEiVwUKXgmmTX/32RZ8UeJOtw==
X-Received: by 10.28.147.199 with SMTP id v190mr2566353wmd.24.1505313995448;
	Wed, 13 Sep 2017 07:46:35 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id w6sm8470294wra.45.2017.09.13.07.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 07:46:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 16:48:51 +0200
Message-Id: <20170913144851.18729-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [RFC][PATCH] recipes: replace runtime dependency on bash with VIRTUAL-RUNTIME_bash
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
X-List-Received-Date: Wed, 13 Sep 2017 14:46:35 -0000

* this allows to reliably replace bash with e.g. busybox
* without this change the QA check can find bash as the provider
  for /bin/bash if you build bash before some other recipe using
  bash and then QA issue like this is shown:
  ERROR: QA Issue: foo rdepends on bash, but it isn't a build dependency
  , missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
  even when the distro has bash enabled in busybox defconfig and
  busybox RPROVIDES bash as well as /bin/bash, this is because the QA
  check (and to some extend also the package-manager) doesn't know which
  provider is prefered, so if bash isn't built at all in sysroot, it
  will happily accept busybox as the provider, but when both are built
  in sysroot, then bash is found first and QA error is shown.
* more information in:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                     | 3 ++-
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb          | 3 ++-
 meta/recipes-connectivity/openssl/openssl_1.1.0f.bb             | 3 ++-
 meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb         | 3 ++-
 meta/recipes-core/console-tools/console-tools_0.3.2.bb          | 3 ++-
 meta/recipes-core/dbus/dbus-test_1.10.20.bb                     | 3 ++-
 meta/recipes-core/glibc/glibc-scripts.inc                       | 3 ++-
 meta/recipes-core/systemd/systemd_234.bb                        | 5 +++--
 meta/recipes-core/util-linux/util-linux.inc                     | 3 ++-
 meta/recipes-devtools/apt/apt_1.2.24.bb                         | 3 ++-
 meta/recipes-devtools/build-compare/build-compare_git.bb        | 3 ++-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb             | 3 ++-
 meta/recipes-devtools/flex/flex_2.6.0.bb                        | 3 ++-
 meta/recipes-devtools/go/go-dep_0.3.0.bb                        | 3 ++-
 meta/recipes-devtools/go/go-target.inc                          | 3 ++-
 meta/recipes-devtools/libtool/libtool_2.4.6.bb                  | 3 ++-
 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb              | 3 ++-
 meta/recipes-devtools/qemu/qemu.inc                             | 3 ++-
 meta/recipes-devtools/qemu/qemu_2.10.0.bb                       | 3 ++-
 meta/recipes-devtools/quilt/quilt.inc                           | 5 +++--
 meta/recipes-devtools/rpm/rpm_git.bb                            | 3 ++-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb                | 3 ++-
 meta/recipes-extended/hdparm/hdparm_9.52.bb                     | 3 ++-
 meta/recipes-extended/mdadm/mdadm_4.0.bb                        | 3 ++-
 meta/recipes-extended/parted/parted_3.2.bb                      | 3 ++-
 meta/recipes-kernel/dtc/dtc.inc                                 | 3 ++-
 meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb                  | 3 ++-
 meta/recipes-kernel/perf/perf.bb                                | 9 +++++----
 meta/recipes-kernel/systemtap/systemtap_git.bb                  | 3 ++-
 meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb        | 3 ++-
 meta/recipes-support/apr/apr_1.6.2.bb                           | 3 ++-
 meta/recipes-support/attr/acl_2.2.52.bb                         | 3 ++-
 meta/recipes-support/source-highlight/source-highlight_3.1.8.bb | 3 ++-
 33 files changed, 71 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index cac09101c4..d9dcde1aff 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -17,7 +17,8 @@ inherit pkgconfig autotools manpages
 
 PACKAGECONFIG[manpages] = "--enable-doc, --disable-doc, libxslt-native xmlto-native"
 
-RDEPENDS_${PN} = "grep bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "grep ${VIRTUAL-RUNTIME_bash}"
 
 do_configure_prepend () {
 	( cd ${S}; autoreconf -f -i -s )
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
index d917c4d713..b0237a72a0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
 DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3 libtirpc"
-RDEPENDS_${PN} = "${PN}-client bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "${PN}-client ${VIRTUAL-RUNTIME_bash}"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 inherit useradd
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
index 711a95985a..4661d99992 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
@@ -146,7 +146,8 @@ do_install_ptest() {
         sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
-RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions ${VIRTUAL-RUNTIME_bash} python"
 
 FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
 
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
index 8550177288..6fbe8885f4 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
@@ -9,7 +9,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
-RDEPENDS_${PN} = "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_bash}"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160520T044340Z/pool/main/r/${BPN}/${BPN}_1.79.tar.xz \
            file://fix-path-for-busybox.patch \
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 286c2a4753..bb4633123d 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -42,4 +42,5 @@ ALTERNATIVE_PRIORITY = "30"
 bindir_progs = "chvt deallocvt fgconsole openvt"
 ALTERNATIVE_${PN} = "${bindir_progs}"
 
-RDEPENDS_${PN} = "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_bash}"
diff --git a/meta/recipes-core/dbus/dbus-test_1.10.20.bb b/meta/recipes-core/dbus/dbus-test_1.10.20.bb
index eeadb7d35b..ae8a861739 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.20.bb
@@ -55,4 +55,5 @@ do_install_ptest() {
 	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
 }
-RDEPENDS_${PN}-ptest += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest += "${VIRTUAL-RUNTIME_bash}"
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index 2a2b41507e..7793892fc0 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -2,7 +2,8 @@ require glibc-collateral.inc
 
 SUMMARY = "utility scripts provided by glibc"
 DESCRIPTION = "utility scripts provided by glibc"
-RDEPENDS_${PN} = "bash glibc-mtrace"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_bash} glibc-mtrace"
 
 SRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
 
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 2736f385cc..bb7ae61726 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -325,7 +325,8 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
-RDEPENDS_${PN}-ptest += "gawk make perl bash xz \
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest += "gawk make perl ${VIRTUAL-RUNTIME_bash} xz \
                          tzdata tzdata-americas tzdata-asia \
                          tzdata-europe tzdata-africa tzdata-antarctica \
                          tzdata-arctic tzdata-atlantic tzdata-australia \
@@ -339,7 +340,7 @@ FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
                               ${systemd_unitdir}/system/systemd-vconsole-setup.service \
                               ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
 
-RDEPENDS_${PN}-kernel-install += "bash"
+RDEPENDS_${PN}-kernel-install += "${VIRTUAL-RUNTIME_bash}"
 FILES_${PN}-kernel-install = "${bindir}/kernel-install \
                               ${sysconfdir}/kernel/ \
                               ${exec_prefix}/lib/kernel \
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ba5d320321..c415a514ee 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -302,7 +302,8 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest = "${VIRTUAL-RUNTIME_bash} grep coreutils"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
diff --git a/meta/recipes-devtools/apt/apt_1.2.24.bb b/meta/recipes-devtools/apt/apt_1.2.24.bb
index ae0bce933d..0948a76b4f 100644
--- a/meta/recipes-devtools/apt/apt_1.2.24.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.24.bb
@@ -1,5 +1,6 @@
 DEPENDS = "curl db zlib"
-RDEPENDS_${PN} = "dpkg bash debianutils"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "dpkg ${VIRTUAL-RUNTIME_bash} debianutils"
 require apt.inc
 
 require apt-package.inc
diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 84d04cfa0d..874a2d6d54 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -36,4 +36,5 @@ do_install() {
     install -m 755 srpm-check.sh ${D}/${bindir}
 }
 
-RDEPENDS_${PN} += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_bash}"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
index fb02d796a7..446685604a 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
@@ -98,7 +98,8 @@ ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
 ALTERNATIVE_${PN}-doc = "fsck.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 
-RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps ${VIRTUAL-RUNTIME_bash}"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index a906fe8dc6..644157b982 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -44,7 +44,8 @@ do_install_append_class-nativesdk() {
 }
 
 RDEPENDS_${PN} += "m4"
-RDEPENDS_${PN}-ptest += "bash gawk"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest += "${VIRTUAL-RUNTIME_bash} gawk"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests -f ${B}/tests/Makefile top_builddir=${B} INCLUDES=-I${S}/src buildtests
diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
index 5e4544a104..e26568ca51 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
@@ -15,4 +15,5 @@ GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
 INSANE_SKIP_${PN} += "ldflags"
 
-RDEPENDS_${PN}-dev += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-dev += "${VIRTUAL-RUNTIME_bash}"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 0d80bf0d97..83acf4ff34 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -48,7 +48,8 @@ do_install() {
 PACKAGES = "${PN} ${PN}-dev"
 FILES_${PN} = "${libdir}/go/bin ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
 FILES_${PN}-dev = "${libdir}/go"
-RDEPENDS_${PN}-dev = "perl bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-dev = "perl ${VIRTUAL-RUNTIME_bash}"
 INSANE_SKIP_${PN} = "ldflags"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index b02620b4b4..44ad9115b8 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -1,6 +1,7 @@
 require libtool-${PV}.inc
 
-RDEPENDS_${PN} += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_bash}"
 
 #
 # We want the results of libtool-cross preserved - don't stage anything ourselves.
diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
index c6c49e9b2d..e56fe7e680 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
@@ -15,7 +15,8 @@ SRC_URI[sha256sum] = "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f5622
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/p/pax-utils/"
 UPSTREAM_CHECK_REGEX = "pax-utils_(?P<pver>\d+(\.\d+)+)\.orig\.tar"
 
-RDEPENDS_${PN} += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_bash}"
 
 export GNULIB_OVERRIDES_WINT_T = "0"
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 57c121b0cd..64685103fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -2,7 +2,8 @@ SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib pixman"
-RDEPENDS_${PN}_class-target += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}_class-target += "${VIRTUAL-RUNTIME_bash}"
 
 require qemu-targets.inc
 inherit autotools pkgconfig bluetooth
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index 835577a603..462c287457 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -2,7 +2,8 @@ require qemu.inc
 
 inherit ptest
 
-RDEPENDS_${PN}-ptest = "bash make"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest = "${VIRTUAL-RUNTIME_bash} make"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index c7bb741b4c..ecf90e485c 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -29,7 +29,8 @@ FILES_guards = "${bindir}/guards"
 FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
 
-RDEPENDS_${PN} = "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_bash}"
 
 EXTRA_OE_MAKE_ARGS_darwin ?= ""
 EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
@@ -73,5 +74,5 @@ RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
                         perl-module-text-parsewords perl-module-overloading \
-                        bash util-linux-getopt \
+                        ${VIRTUAL-RUNTIME_bash} util-linux-getopt \
                        "
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index ea894a3470..f11f16ada3 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -126,4 +126,5 @@ FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 # rpm 5.x was packaging the rpm build tools separately
 RPROVIDES_${PN} += "rpm-build"
 
-RDEPENDS_${PN} = "bash perl python3-core"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_bash} perl python3-core"
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 9db26dccc7..625cda0507 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -19,7 +19,8 @@ SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent;branch=1.4_ne
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 DEPENDS = "util-linux openssl"
-RDEPENDS_${PN} = "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_bash}"
 
 S = "${WORKDIR}/git/agent"
 
diff --git a/meta/recipes-extended/hdparm/hdparm_9.52.bb b/meta/recipes-extended/hdparm/hdparm_9.52.bb
index 599cd303ab..784a4fb612 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.52.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.52.bb
@@ -18,7 +18,8 @@ PACKAGES =+ "wiper"
 
 FILES_wiper = "${bindir}/wiper.sh"
 
-RDEPENDS_wiper = "bash gawk stat"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_wiper = "${VIRTUAL-RUNTIME_bash} gawk stat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz"
 
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 506b0bc315..b7ab4ec509 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -64,7 +64,8 @@ do_install_ptest() {
 		install -D -m 755 $prg ${D}${PTEST_PATH}/
 	done
 }
-RDEPENDS_${PN}-ptest += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest += "${VIRTUAL-RUNTIME_bash}"
 RRECOMMENDS_${PN}-ptest += " \
     coreutils \
     util-linux \
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 2bfdfb5f8f..fd040cc1a6 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -46,4 +46,5 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest = "${VIRTUAL-RUNTIME_bash} coreutils perl util-linux-losetup python3"
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 0c409b0c0b..253362c446 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -19,4 +19,5 @@ do_install () {
 PACKAGES =+ "${PN}-misc"
 FILES_${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
 
-RDEPENDS_${PN}-misc += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-misc += "${VIRTUAL-RUNTIME_bash}"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
index 6e92c22bec..9fb53b28ad 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest += "make perl ${VIRTUAL-RUNTIME_bash} gawk ${PN} babeltrace procps"
 # babelstats.pl wants getopt-long
 RDEPENDS_${PN}-ptest += "perl-module-getopt-long"
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index b79b973947..aa8e0efb8a 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -211,11 +211,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
-RDEPENDS_${PN} += "elfutils bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} += "elfutils ${VIRTUAL-RUNTIME_bash}"
 RDEPENDS_${PN}-doc += "man"
-RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python python-modules"
-RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
+RDEPENDS_${PN}-archive =+ "${VIRTUAL-RUNTIME_bash}"
+RDEPENDS_${PN}-python =+ "${VIRTUAL-RUNTIME_bash} python python-modules"
+RDEPENDS_${PN}-perl =+ "${VIRTUAL-RUNTIME_bash} perl perl-modules"
 RDEPENDS_${PN}-tests =+ "python"
 
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 475b2073f1..b42cc14d57 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -5,7 +5,8 @@ require systemtap_git.inc
 
 DEPENDS = "boost elfutils"
 
-RDEPENDS_${PN} += "python3-core bash perl"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} += "python3-core ${VIRTUAL-RUNTIME_bash} perl"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi --without-dyninst \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb
index fef79d9c9c..0ef83f4c12 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb
@@ -6,7 +6,8 @@ PROVIDES = "alsa-utils-alsaconf"
 FILESEXTRAPATHS_prepend := "${THISDIR}/alsa-utils:"
 
 PACKAGES = "${PN}"
-RDEPENDS_${PN} += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_bash}"
 
 FILES_${PN} = "${sbindir}/alsaconf \
                ${sbindir}/alsa-info.sh \
diff --git a/meta/recipes-support/apr/apr_1.6.2.bb b/meta/recipes-support/apr/apr_1.6.2.bb
index e2eed53c9e..ea8aa8720e 100644
--- a/meta/recipes-support/apr/apr_1.6.2.bb
+++ b/meta/recipes-support/apr/apr_1.6.2.bb
@@ -54,7 +54,8 @@ do_configure_prepend() {
 }
 
 FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
-RDEPENDS_${PN}-dev += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-dev += "${VIRTUAL-RUNTIME_bash}"
 
 #for some reason, build/libtool.m4 handled by buildconf still be overwritten
 #when autoconf, so handle it again.
diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 8f3dc45cf7..e9a64d557a 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -50,6 +50,7 @@ do_install_ptest() {
 	    -i ${D}${PTEST_PATH}/include/builddefs
 }
 
-RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_${PN}-ptest = "acl ${VIRTUAL-RUNTIME_bash} coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb b/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
index 85923e4759..d8f7a99fd7 100644
--- a/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
+++ b/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
@@ -25,4 +25,5 @@ do_configure_prepend_class-target () {
         sed -i -e 's,^SRCHILITEEXE = $(top_builddir).*,SRCHILITEEXE = source-highlight,' ${S}/doc/Makefile.am
 }
 
-RDEPENDS_source-highlight += "bash"
+VIRTUAL-RUNTIME_bash ?= "bash"
+RDEPENDS_source-highlight += "${VIRTUAL-RUNTIME_bash}"
-- 
2.14.1


