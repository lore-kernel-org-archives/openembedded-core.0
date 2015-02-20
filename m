Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB81733AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 04:25:01 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so5177530ieb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 20:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5ga6G70y9vAfakfe3PiB5XoaSTw5ufS3MXvKvvesBXg=;
	b=gvt0MitqR/0PXwOV4KW8QJKDJZtkQlytaqZFoVGgVv/YgVTRS9N3HefHTGKlwBWglu
	4HM6P6hPqbWztVU116keGBZ/TmSddqn2dATnYwqKUFSwwDvcAJYMlRExg6BP2lKMeSPi
	Y7oBgyoZ+ehT5IgefSJplheAgJ/yZQdHuRfRcSRH/8GZSLbOAedAUzipkc5SnBhICM23
	H73DMIcHqA2V/LqDOZEcgrBrjO3LCqlAjo66UvsHdTx1HNjlYnIB+LGpkhBqg0LnA3bc
	wSsncQ6DHV9T/GqFRfOK/uYXmMHFZyNTn6VzovGw/Nx23ahfVHdJtsQLycSN5TG0sV72
	Eb4Q==
X-Received: by 10.107.12.13 with SMTP id w13mr10920832ioi.28.1424406302989;
	Thu, 19 Feb 2015 20:25:02 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	f12sm15642652ioi.21.2015.02.19.20.25.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Feb 2015 20:25:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 04:24:33 +0000
Message-Id: <f2524b85ea338525d78147b4bd90d2a1f3f3790d.1424405852.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
In-Reply-To: <cover.1424405852.git.raj.khem@gmail.com>
References: <cover.1424405852.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] util-linux, util-linux-libs: Build and package util-linux libs separately
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
X-List-Received-Date: Fri, 20 Feb 2015 04:25:03 -0000

We have a catch-22 where systemd->libmount(util-linux) ->
libssytemd(systemd)

This patch breaks the dependency loop by building and packaging libraries from
util-linux package in a separate package.

Adjust dependencies accordingly

Backport patches to make util-linux compile happy on musl

Change-Id: Ibfdf4c9d106f8d90707418e1975932188a6b3036
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ch_root_improve_statfs_f_type_portability.patch | 56 +++++++++++++
 .../files/0002-include_statfs_magic.patch          | 45 +++++++++++
 .../{util-linux => files}/configure-sbindir.patch  |  0
 .../{util-linux => files}/fix-parallel-build.patch |  0
 .../uclibc-__progname-conflict.patch               |  0
 .../util-linux-native-qsort.patch                  |  0
 .../{util-linux => files}/util-linux-native.patch  |  0
 .../util-linux-ng-2.16-mount_lock_path.patch       |  0
 .../util-linux-ng-replace-siginterrupt.patch       |  0
 meta/recipes-core/util-linux/util-linux-libs.inc   | 93 ++++++++++++++++++++++
 .../util-linux/util-linux-libs_2.25.2.bb           | 25 ++++++
 meta/recipes-core/util-linux/util-linux.inc        | 23 ++----
 meta/recipes-core/util-linux/util-linux_2.25.2.bb  |  2 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |  2 +-
 14 files changed, 229 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/files/0001-switch_root_improve_statfs_f_type_portability.patch
 create mode 100644 meta/recipes-core/util-linux/files/0002-include_statfs_magic.patch
 rename meta/recipes-core/util-linux/{util-linux => files}/configure-sbindir.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/fix-parallel-build.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-native-qsort.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-native.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-ng-replace-siginterrupt.patch (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux-libs.inc
 create mode 100644 meta/recipes-core/util-linux/util-linux-libs_2.25.2.bb

diff --git a/meta/recipes-core/util-linux/files/0001-switch_root_improve_statfs_f_type_portability.patch b/meta/recipes-core/util-linux/files/0001-switch_root_improve_statfs_f_type_portability.patch
new file mode 100644
index 0000000..1a0087b
--- /dev/null
+++ b/meta/recipes-core/util-linux/files/0001-switch_root_improve_statfs_f_type_portability.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 8f806bb1ea30f15db7ca36d1cfa79349f8115302 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 6 Nov 2014 12:50:27 +0100
+Subject: [PATCH] switch_root: improve statfs->f_type portability
+
+__SWORD_TYPE is not available everywhere, for example it's not defined
+by musl libc. It also seems that __SWORD_TYPE is not used for f_type
+on some architectures (s390x).
+
+Reported-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ include/statfs_magic.h  | 11 +++++++++++
+ sys-utils/switch_root.c |  4 ++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/include/statfs_magic.h b/include/statfs_magic.h
+index b5fde1a..d27be1c 100644
+--- a/include/statfs_magic.h
++++ b/include/statfs_magic.h
+@@ -1,6 +1,17 @@
+ #ifndef UTIL_LINUX_STATFS_MAGIC_H
+ #define UTIL_LINUX_STATFS_MAGIC_H
+ 
++#include <sys/statfs.h>
++
++/*
++ * If possible then don't depend on internal libc __SWORD_TYPE type.
++ */
++#ifdef __GNUC__
++typedef __typeof__( ((struct statfs *)0)->f_type )	ul_statfs_ftype_t;
++#else
++typedef __SWORD_TYPE	ul_statfs_ftype_t;
++#endif
++
+ /*
+  *  Unfortunately, Linux kernel hedeader file <linux/magic.h> is incomplete
+  *  mess and kernel returns by statfs f_type many numbers that are nowhere
+diff --git a/sys-utils/switch_root.c b/sys-utils/switch_root.c
+index 6822a5d..c6a2eff 100644
+--- a/sys-utils/switch_root.c
++++ b/sys-utils/switch_root.c
+@@ -181,8 +181,8 @@ static int switchroot(const char *newroot)
+ 		if (pid <= 0) {
+ 			struct statfs stfs;
+ 			if (fstatfs(cfd, &stfs) == 0 &&
+-			    (stfs.f_type == (__SWORD_TYPE)STATFS_RAMFS_MAGIC ||
+-			     stfs.f_type == (__SWORD_TYPE)STATFS_TMPFS_MAGIC))
++			    (stfs.f_type == (ul_statfs_ftype_t) STATFS_RAMFS_MAGIC ||
++			     stfs.f_type == (ul_statfs_ftype_t) STATFS_TMPFS_MAGIC))
+ 				recursiveRemove(cfd);
+ 			else
+ 				warn(_("old root filesystem is not an initramfs"));
diff --git a/meta/recipes-core/util-linux/files/0002-include_statfs_magic.patch b/meta/recipes-core/util-linux/files/0002-include_statfs_magic.patch
new file mode 100644
index 0000000..fa0d25c
--- /dev/null
+++ b/meta/recipes-core/util-linux/files/0002-include_statfs_magic.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 64d0cee6c00abb3efa89d53879c0bba15f7eb805 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 10 Nov 2014 11:29:42 +0100
+Subject: [PATCH] include/statfs_magic: use macro rather than type for f_type
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ include/statfs_magic.h  | 4 ++--
+ sys-utils/switch_root.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/statfs_magic.h b/include/statfs_magic.h
+index d27be1c..7397a4e 100644
+--- a/include/statfs_magic.h
++++ b/include/statfs_magic.h
+@@ -7,9 +7,9 @@
+  * If possible then don't depend on internal libc __SWORD_TYPE type.
+  */
+ #ifdef __GNUC__
+-typedef __typeof__( ((struct statfs *)0)->f_type )	ul_statfs_ftype_t;
++#define F_TYPE_EQUAL(a, b) (a == (__typeof__(a)) b)
+ #else
+-typedef __SWORD_TYPE	ul_statfs_ftype_t;
++#define F_TYPE_EQUAL(a, b) (a == (__SWORD_TYPE) b)
+ #endif
+ 
+ /*
+diff --git a/sys-utils/switch_root.c b/sys-utils/switch_root.c
+index c6a2eff..534d44a 100644
+--- a/sys-utils/switch_root.c
++++ b/sys-utils/switch_root.c
+@@ -181,8 +181,8 @@ static int switchroot(const char *newroot)
+ 		if (pid <= 0) {
+ 			struct statfs stfs;
+ 			if (fstatfs(cfd, &stfs) == 0 &&
+-			    (stfs.f_type == (ul_statfs_ftype_t) STATFS_RAMFS_MAGIC ||
+-			     stfs.f_type == (ul_statfs_ftype_t) STATFS_TMPFS_MAGIC))
++			    (F_TYPE_EQUAL(stfs.f_type, STATFS_RAMFS_MAGIC) ||
++			     F_TYPE_EQUAL(stfs.f_type, STATFS_TMPFS_MAGIC)))
+ 				recursiveRemove(cfd);
+ 			else
+ 				warn(_("old root filesystem is not an initramfs"));
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/files/configure-sbindir.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
rename to meta/recipes-core/util-linux/files/configure-sbindir.patch
diff --git a/meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch b/meta/recipes-core/util-linux/files/fix-parallel-build.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
rename to meta/recipes-core/util-linux/files/fix-parallel-build.patch
diff --git a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/files/uclibc-__progname-conflict.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
rename to meta/recipes-core/util-linux/files/uclibc-__progname-conflict.patch
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch b/meta/recipes-core/util-linux/files/util-linux-native-qsort.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
rename to meta/recipes-core/util-linux/files/util-linux-native-qsort.patch
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native.patch b/meta/recipes-core/util-linux/files/util-linux-native.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux/util-linux-native.patch
rename to meta/recipes-core/util-linux/files/util-linux-native.patch
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/files/util-linux-ng-2.16-mount_lock_path.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
rename to meta/recipes-core/util-linux/files/util-linux-ng-2.16-mount_lock_path.patch
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/files/util-linux-ng-replace-siginterrupt.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
rename to meta/recipes-core/util-linux/files/util-linux-ng-replace-siginterrupt.patch
diff --git a/meta/recipes-core/util-linux/util-linux-libs.inc b/meta/recipes-core/util-linux/util-linux-libs.inc
new file mode 100644
index 0000000..39c01b0
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-libs.inc
@@ -0,0 +1,93 @@
+SUMMARY = "A suite of basic system administration utilities"
+DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
+commonly found on most Linux systems.  Some of the more important utilities include \
+disk partitioning, kernel message management, filesystem creation, and system login."
+
+SECTION = "base"
+
+LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
+
+LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://Documentation/licenses/COPYING.BSD-3;md5=58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
+                    file://libuuid/COPYING;md5=b442ffb762cf8d3e9df1b99e0bb4af70 \
+                    file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
+                    file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
+
+inherit autotools gettext pkgconfig update-alternatives python-dir
+DEPENDS = "zlib ncurses"
+DEPENDS_append_class-native = " lzo-native"
+DEPENDS_append_class-nativesdk = " lzo-native"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
+           "
+
+PACKAGES =+ "\
+             util-linux-libblkid \
+             util-linux-libmount \
+             util-linux-pylibmount \
+             util-linux-libuuid \
+             "
+
+SHARED_EXTRA_OECONF = "--disable-use-tty-group \
+                       --disable-makeinstall-chown \
+                       --enable-kill --enable-last --enable-mesg --enable-partx \
+                       --enable-raw --enable-reset --disable-login \
+                       --disable-vipw --disable-newgrp --disable-chfn-chsh \
+                       --enable-write --enable-mount \
+                       --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
+                       usrsbin_execdir='${sbindir}' \
+"
+
+EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
+
+PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+"
+PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
+
+
+# Build setpriv requires libcap-ng
+PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
+
+# Build python bindings for libmount
+PACKAGECONFIG[pylibmount] = "--with-python --enable-pylibmount,--without-python --disable-pylibmount,python"
+
+FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.la"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/.debug/"
+
+FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
+FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
+FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
+                               ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
+FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
+
+RRECOMMENDS_${PN}_class-native = ""
+RRECOMMENDS_${PN}_class-nativesdk = ""
+RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
+
+RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
+
+do_compile () {
+	set -e
+	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'
+}
+
+do_install () {
+	# with ccache the timestamps on compiled files may
+	# end up earlier than on their inputs, this allows
+	# for the resultant compilation in the install step.
+	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= \
+		'OPT=${CFLAGS}' 'CC=${CC}' 'LD=${LD}' \
+		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' \
+		install
+	rm -rf ${D}${base_bindir}
+	rm -rf ${D}${sbindir}
+	rm -rf ${D}${bindir}
+	rm -rf ${D}${datadir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/util-linux/util-linux-libs_2.25.2.bb b/meta/recipes-core/util-linux/util-linux-libs_2.25.2.bb
new file mode 100644
index 0000000..25cfe46
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-libs_2.25.2.bb
@@ -0,0 +1,25 @@
+MAJOR_VERSION = "2.25"
+require util-linux-libs.inc
+
+SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
+            file://util-linux-ng-2.16-mount_lock_path.patch \
+            file://uclibc-__progname-conflict.patch \
+            file://configure-sbindir.patch \
+            file://fix-parallel-build.patch \
+            file://0001-switch_root_improve_statfs_f_type_portability.patch \
+            file://0002-include_statfs_magic.patch \
+"
+
+SRC_URI[md5sum] = "cab3d7be354000f629bc601238b629b3"
+SRC_URI[sha256sum] = "e0457f715b73f4a349e1acb08cb410bf0edc9a74a3f75c357070f31f70e33cd6"
+
+CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
+
+EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
+                             --disable-fallocate --disable-use-tty-group \
+"
+EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF} \
+                                --disable-fallocate --disable-use-tty-group \
+"
+
+S = "${WORKDIR}/util-linux-${PV}"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b4f51e9..3162624 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
 inherit autotools gettext pkgconfig systemd update-alternatives python-dir
-DEPENDS = "zlib ncurses"
+DEPENDS = "zlib ncurses util-linux-libs"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
 
@@ -27,8 +27,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
-             util-linux-mount util-linux-readprofile util-linux-libblkid \
-             util-linux-libmount util-linux-libuuid util-linux-uuidd \
+             util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
@@ -46,7 +45,7 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        usrsbin_execdir='${sbindir}' \
 "
 
-EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
+EXTRA_OECONF = "${SHARED_EXTRA_OECONF}"
 
 PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
@@ -64,9 +63,6 @@ PACKAGECONFIG[pylibmount] = "--with-python --enable-pylibmount,--without-python
 FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
-FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.la"
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/.debug/"
-
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
 FILES_util-linux-fstrim = "${base_sbindir}/fstrim"
@@ -86,11 +82,6 @@ FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${bindir}/getopt.${BPN}"
 
-FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
-FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
-FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
-                               ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
-FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
@@ -115,8 +106,6 @@ RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 
-RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
-
 SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
 SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.socket uuidd.service"
 SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
@@ -125,7 +114,7 @@ SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
 
 do_compile () {
 	set -e
-	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}' 
+	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'
 }
 
 do_install () {
@@ -135,7 +124,9 @@ do_install () {
 	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= \
 		'OPT=${CFLAGS}' 'CC=${CC}' 'LD=${LD}' \
 		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
-
+	rm -rf ${D}${libdir}
+	rm -rf ${D}${base_libdir}/*.so*
+	rm -rf ${D}${includedir}
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
diff --git a/meta/recipes-core/util-linux/util-linux_2.25.2.bb b/meta/recipes-core/util-linux/util-linux_2.25.2.bb
index 697b900..018dcc5 100644
--- a/meta/recipes-core/util-linux/util-linux_2.25.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.25.2.bb
@@ -14,6 +14,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
             file://fix-parallel-build.patch \
+            file://0001-switch_root_improve_statfs_f_type_portability.patch \
+            file://0002-include_statfs_magic.patch \
             ${OLDHOST} \
 "
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index bcd9ba7..d352338 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b48f21d765b875bd10400975d12c1ca2 \
                       file://lib/et/et_name.c;beginline=1;endline=11;md5=ead236447dac7b980dbc5b4804d8c836 \
                       file://lib/ss/ss.h;beginline=1;endline=20;md5=6e89ad47da6e75fecd2b5e0e81e1d4a6"
 SECTION = "base"
-DEPENDS = "util-linux"
+DEPENDS = "util-linux-libs"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
            file://mkdir.patch"
-- 
2.1.4


