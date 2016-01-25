Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id D6EFF731E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:42 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id b35so115307136qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ukdsuVIBE/xQ0U6HR0f/PJT4mEzn7rK2TNffwTPc9dE=;
	b=r6yLS/I8p3OlzjrGPnEYJITultZrUKfkR8oQbWoxAb5a5Otqi9NRGRaCkIPv3elU0H
	AUbYYYRkxzBdvgar4yjdBPIU8kx6XkOAIGG43iaJWCtTmprN0sK2/oNKwmpNcXt8g1tv
	JoXf0YQnLHm9TLJCN9s4f0veEGI4gKuQChvzJhRfZER8LVxync+yT01lyhtFdPGMb7Lf
	sgbc9bTNzOIs1LviKDjRQ7Xb8+FE133xY9wtwOD3B4TeZOlB2txWnHzVOyyP50Mkkl2j
	FI7lq44oJMpJRVFT53eWpcWYE0FpH6pmVnn09TWaZPYrLI9RE/4niWIIf459Z40T1qDX
	MQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ukdsuVIBE/xQ0U6HR0f/PJT4mEzn7rK2TNffwTPc9dE=;
	b=f7IfRFr9uesdrjPMjK+cF85r2e6bEXTvyDkwTuNc3xpIwja/JPLrIYLqRCj9BqDGpe
	4cMqyEwZ/lrmuRlX2kZRVyIPSvUtGDSI8F8eBPFthGZDSKdH0xYVBoMTZxaUZ9zWvPMM
	2O2CWwCTp+oZbwUHijgz62iH8F/wyNTyXo3kFCtQ35QaK0R3NsSiy9QpOvHKnFFHq3hR
	zsJI9xtcMhDIa/p8nDZUqQmfhoFb/acClyxhgZt5Te27lnrWxOh0dM6QwbE1F8Vt+z7e
	xeC5gt+co2QBdCiPs1vppVIv/8VnFf8Wrt6R5Zk68nUR8ksRC3LWtjz1BNw40WKNK3mP
	vQ2g==
X-Gm-Message-State: AG10YOSUIZksHGdtYu5tu59Z7JZB1q6gniCIfhO3jnL01ks2GjI7cMvipgF7RC0ab31bUA==
X-Received: by 10.140.19.231 with SMTP id 94mr23374454qgh.32.1453746762902;
	Mon, 25 Jan 2016 10:32:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:18 +0000
Message-Id: <c8b6c58c6a42381f980b7f5eb388323ffd83836b.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 02/11] grub: Backport fix for largefile detection/use
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:43 -0000

This is inspired by musl porting, where grub's configure is enabling
largefile support based on glibc versions, instead an upstream patch
turns it into autoconf check

Update git version recipe

arm platforms use this recipe to provide grub and it needed fixes from
upstream so upgrade to latest tip of git and forward port patches as
well as drop the ones already applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ct-_llseek-code-and-require-long-filesyst.patch | 81 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |  2 +
 ...-mfpmath-sse-as-well-when-SSE-is-disabled.patch | 46 ++++++++++++
 ...1-grub.d-10_linux.in-add-oe-s-kernel-name.patch | 56 +++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |  2 +
 meta/recipes-bsp/grub/grub_git.bb                  | 13 ++--
 7 files changed, 196 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
 create mode 100644 meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
 create mode 100644 meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch b/meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
new file mode 100644
index 0000000..9eabce9
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
@@ -0,0 +1,81 @@
+From 3bac4caa2bc64db313aaee54fffb90383e118517 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Thu, 22 Jan 2015 19:54:36 +0100
+Subject: [PATCH] Remove direct _llseek code and require long filesystem libc.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport
+ configure.ac                    |  8 ++++++++
+ grub-core/osdep/unix/hostdisk.c | 24 ------------------------
+ 4 files changed, 13 insertions(+), 24 deletions(-)
+
+Index: grub-2.00/configure.ac
+===================================================================
+--- grub-2.00.orig/configure.ac
++++ grub-2.00/configure.ac
+@@ -306,6 +306,14 @@ if test x$grub_cv_apple_cc = xyes ; then
+   HOST_LDFLAGS="$HOST_LDFLAGS -Wl,-allow_stack_execute"
+ fi
+ 
++case "$host_os" in
++  cygwin | windows* | mingw32* | aros*)
++     ;;
++  *)
++     AC_CHECK_SIZEOF(off_t)
++     test x"$ac_cv_sizeof_off_t" = x8 || AC_MSG_ERROR([Large file support is required]);;
++esac
++
+ if test x$USE_NLS = xno; then
+   HOST_CFLAGS="$HOST_CFLAGS -fno-builtin-gettext"
+ fi
+Index: grub-2.00/grub-core/kern/emu/hostdisk.c
+===================================================================
+--- grub-2.00.orig/grub-core/kern/emu/hostdisk.c
++++ grub-2.00/grub-core/kern/emu/hostdisk.c
+@@ -44,11 +44,6 @@
+ #ifdef __linux__
+ # include <sys/ioctl.h>         /* ioctl */
+ # include <sys/mount.h>
+-# if !defined(__GLIBC__) || \
+-        ((__GLIBC__ < 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ < 1)))
+-/* Maybe libc doesn't have large file support.  */
+-#  include <linux/unistd.h>     /* _llseek */
+-# endif /* (GLIBC < 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR < 1)) */
+ # ifndef BLKFLSBUF
+ #  define BLKFLSBUF     _IO (0x12,97)   /* flush buffer cache */
+ # endif /* ! BLKFLSBUF */
+@@ -761,25 +756,6 @@ linux_find_partition (char *dev, grub_di
+ }
+ #endif /* __linux__ */
+ 
+-#if defined(__linux__) && (!defined(__GLIBC__) || \
+-        ((__GLIBC__ < 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ < 1))))
+-  /* Maybe libc doesn't have large file support.  */
+-grub_err_t
+-grub_util_fd_seek (int fd, const char *name, grub_uint64_t off)
+-{
+-  loff_t offset, result;
+-  static int _llseek (uint filedes, ulong hi, ulong lo,
+-		      loff_t *res, uint wh);
+-  _syscall5 (int, _llseek, uint, filedes, ulong, hi, ulong, lo,
+-	     loff_t *, res, uint, wh);
+-
+-  offset = (loff_t) off;
+-  if (_llseek (fd, offset >> 32, offset & 0xffffffff, &result, SEEK_SET))
+-    return grub_error (GRUB_ERR_BAD_DEVICE, N_("cannot seek `%s': %s"),
+-		       name, strerror (errno));
+-  return GRUB_ERR_NONE;
+-}
+-#else
+ grub_err_t
+ grub_util_fd_seek (int fd, const char *name, grub_uint64_t off)
+ {
+@@ -790,7 +766,6 @@ grub_util_fd_seek (int fd, const char *n
+ 		       name, strerror (errno));
+   return 0;
+ }
+-#endif
+ 
+ static void
+ flush_initial_buffer (const char *os_dev __attribute__ ((unused)))
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index ecc6c9a..4e80e18 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -33,6 +33,8 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --enable-efiemu=no --program-prefix='' \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
+
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
diff --git a/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch b/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
new file mode 100644
index 0000000..87ec29e
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
@@ -0,0 +1,46 @@
+From fb7b827a56b1f92f882d0f5ef130acc968b23293 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jan 2016 19:17:31 +0000
+Subject: [PATCH] Disable -mfpmath=sse as well when SSE is disabled
+
+Fixes
+
+configure:20574: i586-poky-linux-gcc  -m32    -march=core2 -msse3
+-mtune=generic -mfpmath=sse
+--sysroot=/usr/local/dev/yocto/grubtest2/build/tmp/sysroots/emenlow -o
+conftest -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow
+-Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g
+-falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse
+-mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector
+-mno-stack-arg-probe -Werror -nostdlib -Wl,--defsym,___main=0x8100
+-Wall -W -I$(top_srcdir)/include -I$(top_builddir)/include
+-DGRUB_MACHINE_PCBIOS=1 -DGRUB_MACHINE=I386_PC -Wl,-O1
+-Wl,--hash-style=gnu -Wl,--as-needed conftest.c  >&5
+conftest.c:1:0: error: SSE instruction set disabled, using 387
+arithmetics [-Werror]
+cc1: all warnings being treated as errors
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 26d2f33..9ce56de 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -783,7 +783,7 @@ fi
+ if ( test "x$target_cpu" = xi386 || test "x$target_cpu" = xx86_64 ) && test "x$platform" != xemu; then
+   # Some toolchains enable these features by default, but they need
+   # registers that aren't set up properly in GRUB.
+-  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-sse3 -mno-3dnow"
++  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-sse3 -mno-3dnow -mfpmath=387"
+ fi
+ 
+ # GRUB doesn't use float or doubles at all. Yet some toolchains may decide
+-- 
+2.7.0
+
diff --git a/meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch b/meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
new file mode 100644
index 0000000..d5bfaa1
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
@@ -0,0 +1,56 @@
+From b512c77222a8b133d7dd71a0dcef081a921d97d4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jan 2016 19:28:00 +0000
+Subject: [PATCH] grub.d/10_linux.in: add oe's kernel name
+
+Our kernel's name is bzImage, we need add it to grub.d/10_linux.in so
+that the grub-mkconfig and grub-install can work correctly.
+
+We only need add the bzImage to util/grub.d/10_linux.in, but also add it
+to util/grub.d/20_linux_xen.in to keep compatibility.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Inappropriate [OE specific]
+
+ util/grub.d/10_linux.in     | 6 +++---
+ util/grub.d/20_linux_xen.in | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
+index 859b608..946be5d 100644
+--- a/util/grub.d/10_linux.in
++++ b/util/grub.d/10_linux.in
+@@ -148,12 +148,12 @@ machine=`uname -m`
+ case "x$machine" in
+     xi?86 | xx86_64)
+ 	list=
+-	for i in /boot/vmlinuz-* /vmlinuz-* /boot/kernel-* ; do
++	for i in /boot/bzImage-* /bzImage-* /boot/vmlinuz-* /vmlinuz-* /boot/kernel-* ; do
+ 	    if grub_file_is_not_garbage "$i" ; then list="$list $i" ; fi
+ 	done ;;
+-    *) 
++    *)
+ 	list=
+-	for i in /boot/vmlinuz-* /boot/vmlinux-* /vmlinuz-* /vmlinux-* /boot/kernel-* ; do
++	for i in /boot/bzImage-* /boot/vmlinuz-* /boot/vmlinux-* /bzImage-* /vmlinuz-* /vmlinux-* /boot/kernel-* ; do
+                   if grub_file_is_not_garbage "$i" ; then list="$list $i" ; fi
+ 	done ;;
+ esac
+diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
+index f532fb9..1994244 100644
+--- a/util/grub.d/20_linux_xen.in
++++ b/util/grub.d/20_linux_xen.in
+@@ -138,7 +138,7 @@ EOF
+ }
+ 
+ linux_list=
+-for i in /boot/vmlinu[xz]-* /vmlinu[xz]-* /boot/kernel-*; do
++for i in /boot/bzImage[xz]-* /bzImage[xz]-* /boot/vmlinu[xz]-* /vmlinu[xz]-* /boot/kernel-*; do
+     if grub_file_is_not_garbage "$i"; then
+     	basename=$(basename $i)
+ 	version=$(echo $basename | sed -e "s,^[^0-9]*-,,g")
+-- 
+2.7.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a8c41f8..84a4727 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -28,6 +28,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
            file://grub2-fix-initrd-size-bug.patch \
            file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
+           file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
             "
 
 DEPENDS = "flex-native bison-native xz"
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index c1be133..addc1b2 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -6,6 +6,8 @@ PR = "r1"
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
+
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
 }
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 6a0e3ee..3ebab7f 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -5,13 +5,14 @@ DEPENDS += "autogen-native"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm = "1"
 
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/grub-git:"
+
 PV = "2.00+${SRCPV}"
-SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
+SRCREV = "b95e92678882f56056c64ae29092bc9cf129905f"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
-           file://grub-2.00-fpmath-sse-387-fix.patch \
+           file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
-           file://grub-2.00-add-oe-kernel.patch \
-           file://0001-Fix-build-with-glibc-2.20.patch \
+           file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -30,6 +31,8 @@ GRUBPLATFORM ??= "pc"
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
+
 do_configure_prepend() {
     ( cd ${S}
       ${S}/autogen.sh )
@@ -37,7 +40,7 @@ do_configure_prepend() {
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
- 
+    rm -rf ${D}${libdir}/charset.alias
 }
 
 # debugedit chokes on bare metal binaries
-- 
2.7.0


