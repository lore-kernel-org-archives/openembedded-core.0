Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF026D44C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 05:38:14 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id r10so87700pdi.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 21:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LZszpwNDIJSz27A2zLm0ngebIQx9Q7K/XY0B0VsAwhg=;
	b=XdNq+G7EyvSALM9gFTKzcBb6WRdtAN0gZvyAXp/xH+gQ1XGmw9unNG/N5C7GMartW0
	p7GbFX7xZ07W5lt0kFgOOjrmtOXeB3Cui95i2ciByZuaoQ0ymhri8vSd2sOeNTH63aWS
	+5B/Ykhpfkryjuq82J4+hLo2T+mugQnG9UkYoNtQjgZ9O0B8LgVOD8bcb4ZOnpr0NNa+
	JIQFLqEIgqsf7X81IpESyLgocG/d1dLsjU7zlO5bKILH1+qzcfXiqRDhWyiENM41qP8Y
	if9Umg63U96md/5YXGY9yElN/q9pOggT7ahDDVSBth8RKbCaD9Y0JWqT7KB/IARPw87L
	Bcmw==
X-Received: by 10.68.211.233 with SMTP id nf9mr7077035pbc.85.1383802696080;
	Wed, 06 Nov 2013 21:38:16 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id ry4sm3205337pab.4.2013.11.06.21.38.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Nov 2013 21:38:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 21:35:01 -0800
Message-Id: <1383802501-10099-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1383802501-10099-1-git-send-email-raj.khem@gmail.com>
References: <1383802501-10099-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH] systemd: Upgrade 206 -> 208
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
X-List-Received-Date: Thu, 07 Nov 2013 05:38:14 -0000

Remove patches accepted upstream
Forward-port uclibc patches
Create additional packages to bundle zsh
and pam.d files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-use-CAP_MKNOD-ConditionCapability.patch   |  32 --
 .../systemd/systemd/systemd-pam-fix-msformat.patch | 137 +++++----
 meta/recipes-core/systemd/systemd_206.bb           | 327 --------------------
 meta/recipes-core/systemd/systemd_208.bb           | 330 +++++++++++++++++++++
 4 files changed, 398 insertions(+), 428 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
 delete mode 100644 meta/recipes-core/systemd/systemd_206.bb
 create mode 100644 meta/recipes-core/systemd/systemd_208.bb

diff --git a/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch b/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
deleted file mode 100644
index 4a35c23..0000000
--- a/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted
-
-From cfdd1eb76dced87c73bac8ec22d3a10244c9bbf6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Aug 2013 20:25:19 -0700
-Subject: [PATCH] use CAP_MKNOD ConditionCapability
-
-Fixes errors seen when booting VMs on QEMU like
-
-systemd[1]: kmod-static-nodes.service: main process exited, code=exited, status=203/EXEC
-systemd[1]: Failed to start Create list of required static device nodes for the current kernel.
-systemd[1]: Unit kmod-static-nodes.service entered failed state.
-
-Make sure that mknod capability is available
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- units/kmod-static-nodes.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: systemd-206/units/kmod-static-nodes.service.in
-===================================================================
---- systemd-206.orig/units/kmod-static-nodes.service.in	2013-08-21 19:13:02.000000000 -0700
-+++ systemd-206/units/kmod-static-nodes.service.in	2013-08-21 20:39:13.310689871 -0700
-@@ -9,6 +9,7 @@
- Description=Create list of required static device nodes for the current kernel
- DefaultDependencies=no
- Before=sysinit.target systemd-tmpfiles-setup-dev.service
-+ConditionCapability=CAP_MKNOD
- 
- [Service]
- Type=oneshot
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
index 77bb305..e8a9144 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: systemd-204/src/fsck/fsck.c
+Index: systemd-208/src/fsck/fsck.c
 ===================================================================
---- systemd-204.orig/src/fsck/fsck.c	2013-04-02 05:48:49.000000000 -0700
-+++ systemd-204/src/fsck/fsck.c	2013-05-23 11:26:51.776345015 -0700
+--- systemd-208.orig/src/fsck/fsck.c	2013-08-13 13:02:46.000000000 -0700
++++ systemd-208/src/fsck/fsck.c	2013-11-05 22:01:26.776490078 -0800
 @@ -37,6 +37,8 @@
  #include "virt.h"
  #include "fileio.h"
@@ -33,10 +33,10 @@ Index: systemd-204/src/fsck/fsck.c
  
                  /* Only show one progress counter at max */
                  if (!locked) {
-Index: systemd-204/src/core/swap.c
+Index: systemd-208/src/core/swap.c
 ===================================================================
---- systemd-204.orig/src/core/swap.c	2013-05-06 12:06:04.000000000 -0700
-+++ systemd-204/src/core/swap.c	2013-05-23 11:26:51.780345015 -0700
+--- systemd-208.orig/src/core/swap.c	2013-09-26 11:20:30.000000000 -0700
++++ systemd-208/src/core/swap.c	2013-11-05 22:01:26.776490078 -0800
 @@ -41,6 +41,8 @@
  #include "path-util.h"
  #include "virt.h"
@@ -46,15 +46,15 @@ Index: systemd-204/src/core/swap.c
  static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
          [SWAP_DEAD] = UNIT_INACTIVE,
          [SWAP_ACTIVATING] = UNIT_ACTIVATING,
-@@ -1055,6 +1057,7 @@
-                 char *dev = NULL, *d;
+@@ -1041,6 +1043,7 @@
+                 _cleanup_free_ char *dev = NULL, *d = NULL;
                  int prio = 0, k;
  
 +#ifdef HAVE_MSFORMAT
                  k = fscanf(m->proc_swaps,
                             "%ms "  /* device/file */
                             "%*s "  /* type of swap */
-@@ -1062,6 +1065,16 @@
+@@ -1048,6 +1051,16 @@
                             "%*s "  /* used */
                             "%i\n", /* priority */
                             &dev, &prio);
@@ -71,10 +71,10 @@ Index: systemd-204/src/core/swap.c
                  if (k != 2) {
                          if (k == EOF)
                                  break;
-Index: systemd-204/src/core/mount-setup.c
+Index: systemd-208/src/core/mount-setup.c
 ===================================================================
---- systemd-204.orig/src/core/mount-setup.c	2013-04-24 06:34:38.000000000 -0700
-+++ systemd-204/src/core/mount-setup.c	2013-05-23 11:26:51.780345015 -0700
+--- systemd-208.orig/src/core/mount-setup.c	2013-08-13 13:02:46.000000000 -0700
++++ systemd-208/src/core/mount-setup.c	2013-11-05 22:01:26.776490078 -0800
 @@ -28,6 +28,7 @@
  #include <assert.h>
  #include <unistd.h>
@@ -107,10 +107,10 @@ Index: systemd-204/src/core/mount-setup.c
                          if (feof(f))
                                  break;
  
-Index: systemd-204/src/core/mount.c
+Index: systemd-208/src/core/mount.c
 ===================================================================
---- systemd-204.orig/src/core/mount.c	2013-05-06 12:06:04.000000000 -0700
-+++ systemd-204/src/core/mount.c	2013-05-23 11:26:51.780345015 -0700
+--- systemd-208.orig/src/core/mount.c	2013-09-26 11:20:30.000000000 -0700
++++ systemd-208/src/core/mount.c	2013-11-05 22:07:43.784497482 -0800
 @@ -43,6 +43,8 @@
  #include "exit-status.h"
  #include "def.h"
@@ -120,52 +120,51 @@ Index: systemd-204/src/core/mount.c
  static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
          [MOUNT_DEAD] = UNIT_INACTIVE,
          [MOUNT_MOUNTING] = UNIT_ACTIVATING,
-@@ -1626,7 +1628,7 @@
+@@ -1559,6 +1561,7 @@
+                 _cleanup_free_ char *device = NULL, *path = NULL, *options = NULL, *options2 = NULL, *fstype = NULL, *d = NULL, *p = NULL, *o = NULL;
                  int k;
  
-                 device = path = options = options2 = fstype = d = p = o = NULL;
--
 +#ifdef HAVE_MSFORMAT
-                 if ((k = fscanf(m->proc_self_mountinfo,
-                                 "%*s "       /* (1) mount id */
-                                 "%*s "       /* (2) parent id */
-@@ -1645,7 +1647,31 @@
-                                 &fstype,
-                                 &device,
-                                 &options2)) != 5) {
+                 k = fscanf(m->proc_self_mountinfo,
+                            "%*s "       /* (1) mount id */
+                            "%*s "       /* (2) parent id */
+@@ -1577,7 +1580,31 @@
+                            &fstype,
+                            &device,
+                            &options2);
 -
 +#else
-+		path = malloc(257);
-+		options = malloc(257);
-+		fstype = malloc(257);
-+		device = malloc(257);
-+		options2 = malloc(257);
-+                if ((k = fscanf(m->proc_self_mountinfo,
-+                                "%*s "       /* (1) mount id */
-+                                "%*s "       /* (2) parent id */
-+                                "%*s "       /* (3) major:minor */
-+                                "%*s "       /* (4) root */
-+                                "%256s "     /* (5) mount point */
-+                                "%256s"      /* (6) mount options */
-+                                "%*[^-]"     /* (7) optional fields */
-+                                "- "         /* (8) separator */
-+                                "%256s "     /* (9) file system type */
-+                                "%256s"      /* (10) mount source */
-+                                "%256s"      /* (11) mount options 2 */
-+                                "%*[^\n]",   /* some rubbish at the end */
-+                                path,
-+                                options,
-+                                fstype,
-+                                device,
-+                                options2)) != 5) {
++                path = malloc(257);
++                options = malloc(257);
++                fstype = malloc(257);
++                device = malloc(257);
++                options2 = malloc(257);
++                k = fscanf(m->proc_self_mountinfo,
++                           "%*s "       /* (1) mount id */
++                           "%*s "       /* (2) parent id */
++                           "%*s "       /* (3) major:minor */
++                           "%*s "       /* (4) root */
++                           "%256s "     /* (5) mount point */
++                           "%256s"      /* (6) mount options */
++                           "%*[^-]"     /* (7) optional fields */
++                           "- "         /* (8) separator */
++                           "%256s "     /* (9) file system type */
++                           "%256s"      /* (10) mount source */
++                           "%256s"      /* (11) mount options 2 */
++                           "%*[^\n]",   /* some rubbish at the end */
++                           path,
++                           options,
++                           fstype,
++                           device,
++                           options2);
 +#endif /* HAVE_MSFORMAT */
-                         if (k == EOF)
-                                 break;
+                 if (k == EOF)
+                         break;
  
-Index: systemd-204/src/core/umount.c
+Index: systemd-208/src/core/umount.c
 ===================================================================
---- systemd-204.orig/src/core/umount.c	2013-04-18 08:14:11.000000000 -0700
-+++ systemd-204/src/core/umount.c	2013-05-23 11:26:51.780345015 -0700
+--- systemd-208.orig/src/core/umount.c	2013-08-13 13:02:46.000000000 -0700
++++ systemd-208/src/core/umount.c	2013-11-05 22:01:26.776490078 -0800
 @@ -36,6 +36,8 @@
  #include "util.h"
  #include "virt.h"
@@ -235,10 +234,10 @@ Index: systemd-204/src/core/umount.c
                          if (k == EOF)
                                  break;
  
-Index: systemd-204/src/shared/socket-util.c
+Index: systemd-208/src/shared/socket-util.c
 ===================================================================
---- systemd-204.orig/src/shared/socket-util.c	2013-04-18 08:14:11.000000000 -0700
-+++ systemd-204/src/shared/socket-util.c	2013-05-23 11:30:53.528348084 -0700
+--- systemd-208.orig/src/shared/socket-util.c	2013-09-26 11:20:30.000000000 -0700
++++ systemd-208/src/shared/socket-util.c	2013-11-05 22:01:26.776490078 -0800
 @@ -40,6 +40,8 @@
  #include "missing.h"
  #include "fileio.h"
@@ -266,28 +265,28 @@ Index: systemd-204/src/shared/socket-util.c
  
          family = netlink_family_from_string(sfamily);
          if (family < 0)
-Index: systemd-204/src/tmpfiles/tmpfiles.c
+Index: systemd-208/src/tmpfiles/tmpfiles.c
 ===================================================================
---- systemd-204.orig/src/tmpfiles/tmpfiles.c	2013-04-24 06:34:38.000000000 -0700
-+++ systemd-204/src/tmpfiles/tmpfiles.c	2013-05-23 11:26:51.784345016 -0700
-@@ -52,6 +52,8 @@
- #include "conf-files.h"
+--- systemd-208.orig/src/tmpfiles/tmpfiles.c	2013-09-17 14:55:37.000000000 -0700
++++ systemd-208/src/tmpfiles/tmpfiles.c	2013-11-05 22:01:26.776490078 -0800
+@@ -53,6 +53,8 @@
  #include "capability.h"
+ #include "specifier.h"
  
 +#include "config.h"
 +
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1029,6 +1031,7 @@
-         if (!i)
-                 return log_oom();
+@@ -1082,6 +1084,7 @@
+         assert(line >= 1);
+         assert(buffer);
  
 +#ifdef HAVE_MSFORMAT
          r = sscanf(buffer,
                     "%c %ms %ms %ms %ms %ms %n",
                     &type,
-@@ -1038,6 +1041,29 @@
+@@ -1091,6 +1094,29 @@
                     &group,
                     &age,
                     &n);
@@ -317,10 +316,10 @@ Index: systemd-204/src/tmpfiles/tmpfiles.c
          if (r < 2) {
                  log_error("[%s:%u] Syntax error.", fname, line);
                  return -EIO;
-Index: systemd-204/src/cryptsetup/cryptsetup-generator.c
+Index: systemd-208/src/cryptsetup/cryptsetup-generator.c
 ===================================================================
---- systemd-204.orig/src/cryptsetup/cryptsetup-generator.c	2013-05-06 12:06:04.000000000 -0700
-+++ systemd-204/src/cryptsetup/cryptsetup-generator.c	2013-05-23 11:26:51.784345016 -0700
+--- systemd-208.orig/src/cryptsetup/cryptsetup-generator.c	2013-09-30 09:57:04.000000000 -0700
++++ systemd-208/src/cryptsetup/cryptsetup-generator.c	2013-11-05 22:01:26.776490078 -0800
 @@ -31,6 +31,8 @@
  #include "strv.h"
  #include "fileio.h"
@@ -330,7 +329,7 @@ Index: systemd-204/src/cryptsetup/cryptsetup-generator.c
  static const char *arg_dest = "/tmp";
  static bool arg_enabled = true;
  static bool arg_read_crypttab = true;
-@@ -398,7 +400,16 @@
+@@ -420,7 +422,16 @@
                          if (*l == '#' || *l == 0)
                                  continue;
  
diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
deleted file mode 100644
index a1a8bd7..0000000
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ /dev/null
@@ -1,327 +0,0 @@
-DESCRIPTION = "Systemd a init replacement"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
-
-LICENSE = "GPLv2 & LGPLv2.1 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
-
-PROVIDES = "udev"
-
-PE = "1"
-
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SECTION = "base/shell"
-
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
-
-SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
-           file://0001-use-CAP_MKNOD-ConditionCapability.patch \
-           file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
-           file://binfmt-install.patch \
-           file://touchscreen.rules \
-           ${UCLIBCPATCHES} \
-           file://00-create-volatile.conf \
-           file://init \
-           file://run-ptest \
-          "
-SRC_URI[md5sum] = "89e36f2d3ba963020b72738549954cbc"
-SRC_URI[sha256sum] = "4c993de071118ea1df7ffc4be26ef0b0d78354ef15b2743a2783d20edfcde9de"
-
-UCLIBCPATCHES = ""
-UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
-                             file://systemd-pam-fix-execvpe.patch \
-                             file://systemd-pam-fix-fallocate.patch \
-                             file://systemd-pam-fix-getty-unit.patch \
-                             file://systemd-pam-fix-mkostemp.patch \
-                             file://systemd-pam-fix-msformat.patch \
-                             file://optional_secure_getenv.patch \
-                             file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
-                            "
-LDFLAGS_libc-uclibc_append = " -lrt"
-
-GTKDOC_DOCDIR = "${S}/docs/"
-
-PACKAGECONFIG ??= "xz tcp-wrappers"
-# Sign the journal for anti-tampering
-PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
-# regardless of PACKAGECONFIG, libgcrypt is always required to expand
-# the AM_PATH_LIBGCRYPT autoconf macro
-DEPENDS += "libgcrypt"
-# Compress the journal
-PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
-PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
-PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
-
-CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
-
-# Helper variables to clarify locations.  This mirrors the logic in systemd's
-# build system.
-rootprefix ?= "${base_prefix}"
-rootlibdir ?= "${base_libdir}"
-rootlibexecdir = "${rootprefix}/lib"
-
-# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
-EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
-                 --with-rootlibdir=${rootlibdir} \
-                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-                 --enable-xz \
-                 --disable-manpages \
-                 --disable-coredump \
-                 --disable-introspection \
-                 --disable-tcpwrap \
-                 --enable-split-usr \
-                 --disable-microhttpd \
-                 --without-python \
-                 --with-sysvrcnd-path=${sysconfdir} \
-                 --with-firmware-path=/lib/firmware \
-                 ac_cv_path_KILL=${base_bindir}/kill \
-               "
-# uclibc does not have NSS
-EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
-
-do_configure_prepend() {
-	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
-	export KMOD="${base_bindir}/kmod"
-	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
-}
-
-do_install() {
-	autotools_do_install
-	install -d ${D}/${base_sbindir}
-	# Provided by a separate recipe
-	rm ${D}${systemd_unitdir}/system/serial-getty* -f
-
-	# Provide support for initramfs
-	ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
-	ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
-
-	# Create dir for journal
-	install -d ${D}${localstatedir}/log/journal
-
-	# Create machine-id
-	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
-	touch ${D}${sysconfdir}/machine-id
-
-	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
-
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-
-	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
-		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
-	fi
-}
-
-do_install_ptest () {
-       install -d ${D}${PTEST_PATH}/test
-       install ${S}/test/* ${D}${PTEST_PATH}/test
-       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
-       install -d ${D}${PTEST_PATH}/build-aux
-       cp -rf ${B}/rules ${D}${PTEST_PATH}/
-       cp ${B}/Makefile ${D}${PTEST_PATH}/
-       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
-       tar -C ${D}${PTEST_PATH}/test -xJf ${S}/test/sys.tar.xz
-       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
-}
-
-python populate_packages_prepend (){
-    systemdlibdir = d.getVar("rootlibdir", True)
-    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
-}
-PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
-
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install ${PN}-rpm-macros ${PN}-binfmt"
-
-SYSTEMD_PACKAGES = "${PN}-binfmt"
-SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
-
-FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-
-FILES_${PN}-initramfs = "/init"
-RDEPENDS_${PN}-initramfs = "${PN}"
-
-FILES_${PN}-gui = "${bindir}/systemadm"
-
-FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
-                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
-                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
-
-FILES_${PN}-kernel-install = "${bindir}/kernel-install \
-                              ${sysconfdir}/kernel/ \
-                              ${exec_prefix}/lib/kernel \
-                             "
-FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
-                         "
-
-FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
-                      ${exec_prefix}/lib/binfmt.d \
-                      ${rootlibexecdir}/systemd/systemd-binfmt \
-                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
-                      ${systemd_unitdir}/system/systemd-binfmt.service"
-RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
-
-RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
-
-CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
-                ${sysconfdir}/systemd/logind.conf \
-                ${sysconfdir}/systemd/system.conf \
-                ${sysconfdir}/systemd/user.conf"
-
-FILES_${PN} = " ${base_bindir}/* \
-                ${datadir}/bash-completion \
-                ${datadir}/dbus-1/services \
-                ${datadir}/dbus-1/system-services \
-                ${datadir}/polkit-1 \
-                ${datadir}/${BPN} \
-                ${sysconfdir}/bash_completion.d/ \
-                ${sysconfdir}/dbus-1/ \
-                ${sysconfdir}/machine-id \
-                ${sysconfdir}/modules-load.d/ \
-                ${sysconfdir}/sysctl.d/ \
-                ${sysconfdir}/systemd/ \
-                ${sysconfdir}/tmpfiles.d/ \
-                ${sysconfdir}/xdg/ \
-                ${sysconfdir}/init.d/README \
-                ${rootlibexecdir}/systemd/* \
-                ${systemd_unitdir}/* \
-                ${base_libdir}/security/*.so \
-                ${libdir}/libnss_myhostname.so.2 \
-                /cgroup \
-                ${bindir}/systemd* \
-                ${bindir}/localectl \
-                ${bindir}/hostnamectl \
-                ${bindir}/timedatectl \
-                ${bindir}/bootctl \
-                ${bindir}/kernel-install \
-                ${exec_prefix}/lib/tmpfiles.d/*.conf \
-                ${exec_prefix}/lib/systemd \
-                ${exec_prefix}/lib/modules-load.d \
-                ${exec_prefix}/lib/sysctl.d \
-                ${localstatedir} \
-                /lib/udev/rules.d/70-uaccess.rules \
-                /lib/udev/rules.d/71-seat.rules \
-                /lib/udev/rules.d/73-seat-late.rules \
-                /lib/udev/rules.d/99-systemd.rules \
-               "
-
-FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
-
-RDEPENDS_${PN} += "kmod dbus util-linux-mount"
-
-RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
-                      util-linux-agetty \
-                      util-linux-fsck e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-"
-
-PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
-
-FILES_udev-dbg += "/lib/udev/.debug"
-
-RDEPENDS_udev += "udev-utils"
-RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-hwdb"
-
-RDEPENDS_udev-hwdb += "udev-utils"
-
-FILES_udev += "${base_sbindir}/udevd \
-               ${rootlibexecdir}/systemd/systemd-udevd \
-               ${rootlibexecdir}/udev/accelerometer \
-               ${rootlibexecdir}/udev/ata_id \
-               ${rootlibexecdir}/udev/cdrom_id \
-               ${rootlibexecdir}/udev/collect \
-               ${rootlibexecdir}/udev/findkeyboards \
-               ${rootlibexecdir}/udev/keyboard-force-release.sh \
-               ${rootlibexecdir}/udev/keymap \
-               ${rootlibexecdir}/udev/mtd_probe \
-               ${rootlibexecdir}/udev/scsi_id \
-               ${rootlibexecdir}/udev/v4l_id \
-               ${rootlibexecdir}/udev/keymaps \
-               ${rootlibexecdir}/udev/rules.d/4*.rules \
-               ${rootlibexecdir}/udev/rules.d/5*.rules \
-               ${rootlibexecdir}/udev/rules.d/6*.rules \
-               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
-               ${rootlibexecdir}/udev/rules.d/75*.rules \
-               ${rootlibexecdir}/udev/rules.d/78*.rules \
-               ${rootlibexecdir}/udev/rules.d/8*.rules \
-               ${rootlibexecdir}/udev/rules.d/95*.rules \
-               ${sysconfdir}/udev \
-               ${sysconfdir}/init.d/systemd-udevd \
-               ${systemd_unitdir}/system/*udev* \
-               ${systemd_unitdir}/system/*.wants/*udev* \
-              "
-
-FILES_udev-utils = "${base_bindir}/udevadm ${datadir}/bash-completion/completions/udevadm"
-
-FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
-
-INITSCRIPT_PACKAGES = "udev"
-INITSCRIPT_NAME_udev = "systemd-udevd"
-INITSCRIPT_PARAMS_udev = "start 03 S ."
-
-python __anonymous() {
-    features = d.getVar("DISTRO_FEATURES", True).split()
-    if "sysvinit" not in features:
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
-# TODO:
-# u-a for runlevel and telinit
-
-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
-
-ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
-ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
-ALTERNATIVE_PRIORITY[init] ?= "300"
-
-ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
-ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
-ALTERNATIVE_PRIORITY[halt] ?= "300"
-
-ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
-ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
-ALTERNATIVE_PRIORITY[reboot] ?= "300"
-
-ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
-ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
-ALTERNATIVE_PRIORITY[shutdown] ?= "300"
-
-ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
-ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
-ALTERNATIVE_PRIORITY[poweroff] ?= "300"
-
-ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
-ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
-ALTERNATIVE_PRIORITY[runlevel] ?= "300"
-
-pkg_postinst_udev-hwdb () {
-	if test -n "$D"; then
-		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
-			--root $D
-	else
-		udevadm hwdb --update
-	fi
-}
-
-pkg_prerm_udev-hwdb () {
-	if test -n "$D"; then
-		exit 1
-	fi
-
-	rm -f ${sysconfdir}/udev/hwdb.bin
-}
-
-# As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
-# building udev and systemd in world builds.
-python () {
-    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
-}
diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
new file mode 100644
index 0000000..35d2874
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -0,0 +1,330 @@
+DESCRIPTION = "Systemd a init replacement"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+PE = "1"
+
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SECTION = "base/shell"
+
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
+
+SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
+           file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
+           file://binfmt-install.patch \
+           file://touchscreen.rules \
+           ${UCLIBCPATCHES} \
+           file://00-create-volatile.conf \
+           file://init \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "df64550d92afbffb4f67a434193ee165"
+SRC_URI[sha256sum] = "aa64fa864466fd5727005c55d61c092828b94b4f857272c0b503695022146390"
+
+UCLIBCPATCHES = ""
+UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
+                             file://systemd-pam-fix-execvpe.patch \
+                             file://systemd-pam-fix-fallocate.patch \
+                             file://systemd-pam-fix-getty-unit.patch \
+                             file://systemd-pam-fix-mkostemp.patch \
+                             file://systemd-pam-fix-msformat.patch \
+                             file://optional_secure_getenv.patch \
+                             file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
+                            "
+LDFLAGS_libc-uclibc_append = " -lrt"
+
+GTKDOC_DOCDIR = "${S}/docs/"
+
+PACKAGECONFIG ??= "xz tcp-wrappers"
+# Sign the journal for anti-tampering
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+# regardless of PACKAGECONFIG, libgcrypt is always required to expand
+# the AM_PATH_LIBGCRYPT autoconf macro
+DEPENDS += "libgcrypt"
+# Compress the journal
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
+PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
+
+CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
+
+# Helper variables to clarify locations.  This mirrors the logic in systemd's
+# build system.
+rootprefix ?= "${base_prefix}"
+rootlibdir ?= "${base_libdir}"
+rootlibexecdir = "${rootprefix}/lib"
+
+# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
+EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
+                 --with-rootlibdir=${rootlibdir} \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+                 --enable-xz \
+                 --disable-manpages \
+                 --disable-coredump \
+                 --disable-introspection \
+                 --disable-tcpwrap \
+                 --enable-split-usr \
+                 --disable-microhttpd \
+                 --without-python \
+                 --with-sysvrcnd-path=${sysconfdir} \
+                 --with-firmware-path=/lib/firmware \
+                 ac_cv_path_KILL=${base_bindir}/kill \
+               "
+# uclibc does not have NSS
+EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
+
+do_configure_prepend() {
+	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+	export KMOD="${base_bindir}/kmod"
+	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
+}
+
+do_install() {
+	autotools_do_install
+	install -d ${D}/${base_sbindir}
+	# Provided by a separate recipe
+	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+
+	# Provide support for initramfs
+	ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
+	ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
+
+	# Create dir for journal
+	install -d ${D}${localstatedir}/log/journal
+
+	# Create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+
+	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
+	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
+		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+	fi
+}
+
+do_install_ptest () {
+       install -d ${D}${PTEST_PATH}/test
+       install ${S}/test/* ${D}${PTEST_PATH}/test
+       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
+       install -d ${D}${PTEST_PATH}/build-aux
+       cp -rf ${B}/rules ${D}${PTEST_PATH}/
+       cp ${B}/Makefile ${D}${PTEST_PATH}/
+       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+       tar -C ${D}${PTEST_PATH}/test -xJf ${S}/test/sys.tar.xz
+       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
+}
+
+python populate_packages_prepend (){
+    systemdlibdir = d.getVar("rootlibdir", True)
+    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+}
+PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
+
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
+             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"
+
+SYSTEMD_PACKAGES = "${PN}-binfmt"
+SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
+
+FILES_${PN}-gui = "${bindir}/systemadm"
+
+FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
+                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+
+FILES_${PN}-kernel-install = "${bindir}/kernel-install \
+                              ${sysconfdir}/kernel/ \
+                              ${exec_prefix}/lib/kernel \
+                             "
+FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
+                         "
+
+FILES_${PN}-pam = "${sysconfdir}/pam.d"
+FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
+
+FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
+                      ${exec_prefix}/lib/binfmt.d \
+                      ${rootlibexecdir}/systemd/systemd-binfmt \
+                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
+                      ${systemd_unitdir}/system/systemd-binfmt.service"
+RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
+
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
+
+CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
+                ${sysconfdir}/systemd/logind.conf \
+                ${sysconfdir}/systemd/system.conf \
+                ${sysconfdir}/systemd/user.conf"
+
+FILES_${PN} = " ${base_bindir}/* \
+                ${datadir}/bash-completion \
+                ${datadir}/dbus-1/services \
+                ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
+                ${datadir}/${BPN} \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
+                ${sysconfdir}/init.d/README \
+                ${rootlibexecdir}/systemd/* \
+                ${systemd_unitdir}/* \
+                ${base_libdir}/security/*.so \
+                ${libdir}/libnss_myhostname.so.2 \
+                /cgroup \
+                ${bindir}/systemd* \
+                ${bindir}/localectl \
+                ${bindir}/hostnamectl \
+                ${bindir}/timedatectl \
+                ${bindir}/bootctl \
+                ${bindir}/kernel-install \
+                ${exec_prefix}/lib/tmpfiles.d/*.conf \
+                ${exec_prefix}/lib/systemd \
+                ${exec_prefix}/lib/modules-load.d \
+                ${exec_prefix}/lib/sysctl.d \
+                ${localstatedir} \
+                /lib/udev/rules.d/70-uaccess.rules \
+                /lib/udev/rules.d/71-seat.rules \
+                /lib/udev/rules.d/73-seat-late.rules \
+                /lib/udev/rules.d/99-systemd.rules \
+               "
+
+FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+
+RDEPENDS_${PN} += "kmod dbus util-linux-mount"
+
+RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
+                      util-linux-agetty \
+                      util-linux-fsck e2fsprogs-e2fsck \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+"
+
+PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
+
+FILES_udev-dbg += "/lib/udev/.debug"
+
+RDEPENDS_udev += "udev-utils"
+RPROVIDES_udev = "hotplug"
+RRECOMMENDS_udev += "udev-hwdb"
+
+RDEPENDS_udev-hwdb += "udev-utils"
+
+FILES_udev += "${base_sbindir}/udevd \
+               ${rootlibexecdir}/systemd/systemd-udevd \
+               ${rootlibexecdir}/udev/accelerometer \
+               ${rootlibexecdir}/udev/ata_id \
+               ${rootlibexecdir}/udev/cdrom_id \
+               ${rootlibexecdir}/udev/collect \
+               ${rootlibexecdir}/udev/findkeyboards \
+               ${rootlibexecdir}/udev/keyboard-force-release.sh \
+               ${rootlibexecdir}/udev/keymap \
+               ${rootlibexecdir}/udev/mtd_probe \
+               ${rootlibexecdir}/udev/scsi_id \
+               ${rootlibexecdir}/udev/v4l_id \
+               ${rootlibexecdir}/udev/keymaps \
+               ${rootlibexecdir}/udev/rules.d/4*.rules \
+               ${rootlibexecdir}/udev/rules.d/5*.rules \
+               ${rootlibexecdir}/udev/rules.d/6*.rules \
+               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
+               ${rootlibexecdir}/udev/rules.d/75*.rules \
+               ${rootlibexecdir}/udev/rules.d/78*.rules \
+               ${rootlibexecdir}/udev/rules.d/8*.rules \
+               ${rootlibexecdir}/udev/rules.d/95*.rules \
+               ${sysconfdir}/udev \
+               ${sysconfdir}/init.d/systemd-udevd \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
+              "
+
+FILES_udev-utils = "${base_bindir}/udevadm ${datadir}/bash-completion/completions/udevadm"
+
+FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
+
+INITSCRIPT_PACKAGES = "udev"
+INITSCRIPT_NAME_udev = "systemd-udevd"
+INITSCRIPT_PARAMS_udev = "start 03 S ."
+
+python __anonymous() {
+    features = d.getVar("DISTRO_FEATURES", True).split()
+    if "sysvinit" not in features:
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
+# TODO:
+# u-a for runlevel and telinit
+
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
+
+ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
+ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
+ALTERNATIVE_PRIORITY[init] ?= "300"
+
+ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
+ALTERNATIVE_PRIORITY[halt] ?= "300"
+
+ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
+ALTERNATIVE_PRIORITY[reboot] ?= "300"
+
+ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
+ALTERNATIVE_PRIORITY[shutdown] ?= "300"
+
+ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
+ALTERNATIVE_PRIORITY[poweroff] ?= "300"
+
+ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
+ALTERNATIVE_PRIORITY[runlevel] ?= "300"
+
+pkg_postinst_udev-hwdb () {
+	if test -n "$D"; then
+		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+			--root $D
+	else
+		udevadm hwdb --update
+	fi
+}
+
+pkg_prerm_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	rm -f ${sysconfdir}/udev/hwdb.bin
+}
+
+# As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
+# building udev and systemd in world builds.
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
+}
-- 
1.8.4.2


