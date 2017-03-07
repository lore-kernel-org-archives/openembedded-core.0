Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F14E71CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 04:58:53 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 25so21761203pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 20:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UBXXsQD1iHZ6nThgrZK6oUNY624c85okPIIwIm/nZTw=;
	b=ZpCS/lvDbeppwkeT3JNybnMrTeL7DxDrpFvKgJeGnWNVJ0YAYao27Tsy7l5+6W+ozN
	NzUAosu8kxE47Z98orPxw8PTS9RYCPJRXNguTBFxoreZ8b0z0csEADuKHq4ECy9MzuPN
	upSftt/VELgi0vA7zeznfd/wQGv+O3vs11TU2XuTLOKrU0bOuG0oOrVHeOmoEnzY7PtS
	rQxter2mf7UxgPYs5In2feOd4l0J5K5T/h3oCpSYTruO61Xt2YmC0oWe2vGZhDH8HbpH
	pmJx5ApLkE2YRh34leT2ZY+HDOrUVbdXCGRpSub6DT1yzyG4t2SlNgjpbNKS7P6avD9i
	qjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UBXXsQD1iHZ6nThgrZK6oUNY624c85okPIIwIm/nZTw=;
	b=eg0dLzDGJ/F0YhLVer7uFIiRS4B4hYQZXxU96h7VsrHsJSSUdS2qhUF+wQ1msIASpg
	LS3HWxPymFIpi3PTvyTYDF4CifJKgRhaK6JR9dUmeMbA2CED9B5v/ad7gOD+XtKP3yPX
	3EODBhGqZVC5BPxbJ8fujwWFXJbw85C0pOinZta9a+ow97Za8GtTsyk8mzP5rb4etq2a
	AtYHDoBzuCJZLzC3uQhmu6rafeLyyM7ikglO36djYPj45tU9wjifPoskq2D85UBlvLFO
	JQTw68MEr4vn+DfX7itK2BWtkI16CgmaFpWzn/nD30jSr2FK5pTkX+clZc/SQG1FTLB4
	oyaQ==
X-Gm-Message-State: AMke39myY/ErRo+H4pqdZfzkzqy0RCpN3yUf/xU/Cx1JklHoD//vvyJu2zlCGPnwitaE0w==
X-Received: by 10.98.79.90 with SMTP id d87mr6430242pfb.126.1488862735292;
	Mon, 06 Mar 2017 20:58:55 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c11sm42577841pfe.68.2017.03.06.20.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 20:58:54 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 20:58:47 -0800
Message-Id: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Tue, 07 Mar 2017 04:58:54 -0000

The largefile distro feature has been enabled by default in oe-core
for a long time and, more recently, also in poky-tiny. Building
without the largefile distro feature receives little or no testing.
Many packages now enable LFS without exposing a configure option, so
there should be very little expectation that disabling the distro
feature will result in a distro which globally disables LFS.

Respecting the distro feature adds a maintenance over-head and may be
the source of configurations oddities (e.g. dbus-native currently
builds with LFS disabled for no clear reason - fixed by this commit).

Ignore the largefile distro feature more widely, as a first step
towards deprecating and eventually removing it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb               |  6 +++---
 meta/recipes-bsp/grub/grub_2.00.bb                   |  6 +++---
 meta/recipes-bsp/grub/grub_git.bb                    |  6 +++---
 meta/recipes-core/dbus/dbus_1.10.14.bb               |  4 ++--
 meta/recipes-devtools/cmake/cmake_3.7.2.bb           |  2 +-
 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb  |  2 +-
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb   |  2 +-
 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb   |  7 ++++---
 meta/recipes-devtools/perl/perl_5.24.1.bb            | 13 -------------
 meta/recipes-extended/libarchive/libarchive_3.2.2.bb |  7 +++----
 meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb    |  5 +++--
 11 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index e050301..e12f1d7 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -31,9 +31,9 @@ inherit deploy
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
 EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --enable-efiemu=no --program-prefix='' \
-                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
-
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
+                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no \
+                --enable-largefile \
+"
 
 # ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
 # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 07e1d10..c382938 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -4,9 +4,9 @@ RDEPENDS_${PN} = "diffutils freetype grub-editenv"
 PR = "r1"
 
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
-               --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
-
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
+                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no \
+                --enable-largefile \
+"
 
 PACKAGES =+ "grub-editenv"
 
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 27a5d1f..0a81e53 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -27,9 +27,9 @@ GRUBPLATFORM_aarch64 = "efi"
 GRUBPLATFORM ??= "pc"
 
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
-                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
-
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
+                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no \
+                --enable-largefile \
+"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
diff --git a/meta/recipes-core/dbus/dbus_1.10.14.bb b/meta/recipes-core/dbus/dbus_1.10.14.bb
index 6354572..e1d7356 100644
--- a/meta/recipes-core/dbus/dbus_1.10.14.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.14.bb
@@ -95,18 +95,18 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
+                --enable-largefile \
                 "
 
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
 
 do_install() {
diff --git a/meta/recipes-devtools/cmake/cmake_3.7.2.bb b/meta/recipes-devtools/cmake/cmake_3.7.2.bb
index 787f33c..f566a48 100644
--- a/meta/recipes-devtools/cmake/cmake_3.7.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.7.2.bb
@@ -30,7 +30,7 @@ EXTRA_OECMAKE=" \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
+    -DKWSYS_LFS_WORKS=1 \
 "
 
 do_install_append_class-nativesdk() {
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index 176504d..dd543b1 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.src.tar.gz/407d4
 SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
 SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
 
-CFLAGS += "-D_GNU_SOURCE ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
+CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 458cf87..69aa81a 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -20,6 +20,6 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 
-CFLAGS += "-D_GNU_SOURCE ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
+CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
index dabb4db..476fa6f 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
@@ -29,9 +29,10 @@ BBCLASSEXTEND = "native"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
-"
+PACKAGECONFIG ??= ""
+
 PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
 PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp, libseccomp"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, pyelftools"
+
+EXTRA_OECONF += "--enable-largefile"
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 147e151..cf7a8e1 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -99,17 +99,6 @@ LDFLAGS_append = " -fstack-protector"
 # We're almost Debian, aren't we?
 CFLAGS += "-DDEBIAN"
 
-do_nolargefile() {
-	sed -i -e "s,\(uselargefiles=\)'define',\1'undef',g" \
-		-e "s,\(d_readdir64_r=\)'define',\1'undef',g" \
-		-e "s,\(readdir64_r_proto=\)'\w+',\1'0',g" \
-		-e "/ccflags_uselargefiles/d" \
-		-e "s/-Duselargefiles//" \
-		-e "s/-D_FILE_OFFSET_BITS=64//" \
-		-e "s/-D_LARGEFILE_SOURCE//" \
-		${S}/Cross/config.sh-${TARGET_ARCH}-${TARGET_OS}
-}
-
 do_configure() {
         # Make hostperl in build directory be the native perl
         ln -sf ${HOSTPERL} hostperl
@@ -182,8 +171,6 @@ do_configure() {
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
-	${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
-
         # Update some paths in the configuration
         sed -i -e 's,@ARCH@-thread-multi,,g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
index 5e9c118..da959a2 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
@@ -11,17 +11,14 @@ PACKAGECONFIG ?= "zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
 	libxml2 \
-	${@bb.utils.filter('DISTRO_FEATURES', 'acl largefile xattr', d)} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
 "
 
-PACKAGECONFIG_append_class-nativesdk = " largefile"
-
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2_class-target = "bzip2"
 
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
 PACKAGECONFIG[bz2] = "--with-bz2lib,--without-bz2lib,${DEPENDS_BZIP2},"
 PACKAGECONFIG[xz] = "--with-lzmadec --with-lzma,--without-lzmadec --without-lzma,xz,"
@@ -32,6 +29,8 @@ PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
 PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
+EXTRA_OECONF += "--enable-largefile"
+
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://non-recursive-extract-and-list.patch \
 	   file://0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch \
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
index 5521851..08dda33 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
@@ -25,10 +25,9 @@ SRC_URI[sha256sum] = "1c97225deea33eefba6d4158c2cef27913d47553263516bbe9d2e2760f
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'lfs', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
-PACKAGECONFIG[lfs] = "--enable-lfs,--disable-lfs"
+
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 PACKAGECONFIG[mmap] = "--enable-mmap,--disable-mmap"
 PACKAGECONFIG[libev] = "--with-libev,--without-libev,libev"
@@ -48,6 +47,8 @@ PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
 PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
 PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
 
+EXTRA_OECONF += "--enable-lfs"
+
 inherit autotools pkgconfig update-rc.d gettext systemd
 
 INITSCRIPT_NAME = "lighttpd"
-- 
1.9.1


