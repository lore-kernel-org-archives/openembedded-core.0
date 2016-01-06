Return-Path: <marex@denx.de>
X-Greylist: delayed 331 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jan 2016 02:18:10 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EE126731E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 02:18:10 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pZvNP71LZz3hj6s;
	Wed,  6 Jan 2016 03:12:37 +0100 (CET)
X-Auth-Info: mltkgXGo9VWoHn0nIwnZn5bDBM+SgknTJjk07lO9mVA=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3pZvNP4kLrzvdWV;
	Wed,  6 Jan 2016 03:12:37 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 03:12:27 +0100
Message-Id: <1452046347-7231-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] strace: 4.10 -> 4.11
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
X-List-Received-Date: Wed, 06 Jan 2016 02:18:13 -0000

Update strace to 4.11 and remove patches which are now mainline.

New patches:
 0001-arc-metag-nios2-or1k-tile-fix-build.patch
  - backport from mainline to prevent build breakage on multiple arches.

Updated patches:
 Makefile-ptest.patch
 strace-add-configure-options.patch

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Robert Yang <liezhi.yang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Add-linux-aarch64-arch_regs.h.patch       |  25 -----
 .../0001-arc-metag-nios2-or1k-tile-fix-build.patch | 116 +++++++++++++++++++++
 .../Include-linux-ioctl.h-for-_IOC_-macros.patch   |  69 ------------
 .../strace/Include-sys-stat.h-for-S_I-macros.patch |  52 ---------
 .../strace/strace/Makefile-ptest.patch             |  12 +--
 .../strace/strace-add-configure-options.patch      |   6 +-
 meta/recipes-devtools/strace/strace_4.10.bb        |  52 ---------
 meta/recipes-devtools/strace/strace_4.11.bb        |  50 +++++++++
 8 files changed, 175 insertions(+), 207 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
 delete mode 100644 meta/recipes-devtools/strace/strace_4.10.bb
 create mode 100644 meta/recipes-devtools/strace/strace_4.11.bb

diff --git a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
deleted file mode 100644
index 0853959..0000000
--- a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f85854131c8265f2eb59c714dcea5c4b3dc09bed Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Wed, 15 Apr 2015 14:29:37 +0200
-Subject: [PATCH] Add linux/aarch64/arch_regs.h
-
-It is missing from the tarball, but it is present in git for v4.10
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-Status: Pending
----
- linux/aarch64/arch_regs.h | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 linux/aarch64/arch_regs.h
-
-diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
-new file mode 100644
-index 0000000..9a5e33e
---- /dev/null
-+++ b/linux/aarch64/arch_regs.h
-@@ -0,0 +1,2 @@
-+extern uint64_t *const aarch64_sp_ptr;
-+extern uint32_t *const arm_sp_ptr;
--- 
-1.9.3
-
diff --git a/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch b/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
new file mode 100644
index 0000000..8a2d178
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
@@ -0,0 +1,116 @@
+From dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Thu, 24 Dec 2015 15:40:55 +0000
+Subject: [PATCH] arc, metag, nios2, or1k, tile: fix build
+
+Fix build regression introduced by commit
+34683e3926d8c2daa368afb805da422ee7043396.
+
+* linux/32/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap.
+* linux/arc/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap_pgoff.
+* linux/nios2/syscallent.h: Likewise.
+* linux/or1k/syscallent.h: Likewise.
+* linux/tile/syscallent1.h: Add sys_ prefix to ARCH_mmap and sys_mmap_4koff.
+* pathtrace.c (pathtrace_match): Handle SEN_ARCH_mmap.
+* NEWS: Mention this build fix.
+
+Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
+Upstream-Status: Backport
+---
+ NEWS                     | 3 +++
+ linux/32/syscallent.h    | 6 +++---
+ linux/arc/syscallent.h   | 2 +-
+ linux/nios2/syscallent.h | 2 +-
+ linux/or1k/syscallent.h  | 2 +-
+ linux/tile/syscallent1.h | 2 +-
+ pathtrace.c              | 1 +
+ 7 files changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index fe40ca4..09263eb 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,9 @@
++Noteworthy changes in release ?.?? (????-??-??)
++===============================================
++
++* Bug fixes
++  * Fixed build on arc, metag, nios2, or1k, and tile architectures.
++
+ Noteworthy changes in release 4.11 (2015-12-21)
+ ===============================================
+ 
+diff --git a/linux/32/syscallent.h b/linux/32/syscallent.h
+index 5f997e7..e6f895c 100644
+--- a/linux/32/syscallent.h
++++ b/linux/32/syscallent.h
+@@ -1,5 +1,5 @@
+-#ifndef ARCH_mmap
+-# define ARCH_mmap mmap
++#ifndef sys_ARCH_mmap
++# define sys_ARCH_mmap sys_mmap
+ #endif
+ [  0] = { 2,	0,		SEN(io_setup),			"io_setup"		},
+ [  1] = { 1,	0,		SEN(io_destroy),		"io_destroy"		},
+@@ -276,5 +276,5 @@
+ [283] = { 2,	0,		SEN(membarrier),		"membarrier",		},
+ [284] = { 3,	TM,		SEN(mlock2),			"mlock2"		},
+ 
+-#undef ARCH_mmap
++#undef sys_ARCH_mmap
+ #undef ARCH_WANT_SYNC_FILE_RANGE2
+diff --git a/linux/arc/syscallent.h b/linux/arc/syscallent.h
+index 5847dc4..1100008 100644
+--- a/linux/arc/syscallent.h
++++ b/linux/arc/syscallent.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_pgoff
++#define sys_ARCH_mmap sys_mmap_pgoff
+ #include "32/syscallent.h"
+ [244] = { 3,	0,	SEN(printargs),	"arc_cacheflush"},
+ [245] = { 1,	0,	SEN(printargs),	"arc_settls"	},
+diff --git a/linux/nios2/syscallent.h b/linux/nios2/syscallent.h
+index 8a4b70e..01efe3a 100644
+--- a/linux/nios2/syscallent.h
++++ b/linux/nios2/syscallent.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_pgoff
++#define sys_ARCH_mmap sys_mmap_pgoff
+ #include "32/syscallent.h"
+ [244] = {4,    0,	SEN(cacheflush), "cacheflush"},
+ [245 ... 259] = { },
+diff --git a/linux/or1k/syscallent.h b/linux/or1k/syscallent.h
+index ed84b3b..351fe25 100644
+--- a/linux/or1k/syscallent.h
++++ b/linux/or1k/syscallent.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_pgoff
++#define sys_ARCH_mmap sys_mmap_pgoff
+ #include "32/syscallent.h"
+ [244] = { 3,	NF,	SEN(or1k_atomic),	"or1k_atomic"	},
+ [245 ... 259] = { },
+diff --git a/linux/tile/syscallent1.h b/linux/tile/syscallent1.h
+index c86f059..28dbab4 100644
+--- a/linux/tile/syscallent1.h
++++ b/linux/tile/syscallent1.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_4koff
++#define sys_ARCH_mmap sys_mmap_4koff
+ #define ARCH_WANT_SYNC_FILE_RANGE2 1
+ #include "32/syscallent.h"
+ [244] = { 1,	0,	SEN(printargs),	"cmpxchg_badaddr"	},
+diff --git a/pathtrace.c b/pathtrace.c
+index d530ec2..e72cdf7 100644
+--- a/pathtrace.c
++++ b/pathtrace.c
+@@ -216,6 +216,7 @@ pathtrace_match(struct tcb *tcp)
+ 	case SEN_mmap:
+ 	case SEN_mmap_4koff:
+ 	case SEN_mmap_pgoff:
++	case SEN_ARCH_mmap:
+ 		/* x, x, x, x, fd */
+ 		return fdmatch(tcp, tcp->u_arg[4]);
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch b/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
deleted file mode 100644
index d9346a8..0000000
--- a/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport
-
-  http://sourceforge.net/p/strace/code/ci/3460dc486d333231998de0f19918204aacee9ae3
-
-Expected to be released officially as part of strace 4.11
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-From 3460dc486d333231998de0f19918204aacee9ae3 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 28 Mar 2015 18:40:13 +0100
-Subject: [PATCH] Include <linux/ioctl.h> for _IOC_* macros
-
-Fix a compilation failure with musl libc.
-
-* evdev.c: Include <linux/ioctl.h>.
-* ioctl.c: Include <linux/ioctl.h> instead of <asm/ioctl.h>.
-* ioctlsort.c: Likewise.
-
-Reported-by: Dima Krasner <dima@dimakrasner.com>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
----
- evdev.c     | 2 ++
- ioctl.c     | 2 +-
- ioctlsort.c | 2 +-
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/evdev.c b/evdev.c
-index 9a7430d..e06f9c1 100644
---- a/evdev.c
-+++ b/evdev.c
-@@ -28,6 +28,8 @@
- 
- #include "defs.h"
- 
-+#include <linux/ioctl.h>
-+
- #ifdef HAVE_LINUX_INPUT_H
- #include <linux/input.h>
- #include "xlat/evdev_abs.h"
-diff --git a/ioctl.c b/ioctl.c
-index 46f8334..c67d048 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -29,7 +29,7 @@
-  */
- 
- #include "defs.h"
--#include <asm/ioctl.h>
-+#include <linux/ioctl.h>
- #include "xlat/ioctl_dirs.h"
- 
- #ifdef HAVE_LINUX_INPUT_H
-diff --git a/ioctlsort.c b/ioctlsort.c
-index 333556c..9c31691 100644
---- a/ioctlsort.c
-+++ b/ioctlsort.c
-@@ -33,7 +33,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <asm/ioctl.h>
-+#include <linux/ioctl.h>
- 
- struct ioctlent {
- 	const char *info;
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch b/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
deleted file mode 100644
index 0b072fe..0000000
--- a/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Backport
-
-  http://sourceforge.net/p/strace/code/ci/d34e00b293942b1012ddc49ed3ab379a32337611
-
-Expected to be released officially as part of strace 4.11
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-From d34e00b293942b1012ddc49ed3ab379a32337611 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 28 Mar 2015 18:21:09 +0100
-Subject: [PATCH] Include <sys/stat.h> for S_I* macros
-
-Fix a compilation failure with musl libc.
-
-* mknod.c: Include <sys/stat.h>.
-* printmode.c: Likewise.
-
-Reported-by: Dima Krasner <dima@dimakrasner.com>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
----
- mknod.c     | 1 +
- printmode.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/mknod.c b/mknod.c
-index 07e9a45..1463232 100644
---- a/mknod.c
-+++ b/mknod.c
-@@ -1,6 +1,7 @@
- #include "defs.h"
- 
- #include <fcntl.h>
-+#include <sys/stat.h>
- 
- #ifdef MAJOR_IN_SYSMACROS
- # include <sys/sysmacros.h>
-diff --git a/printmode.c b/printmode.c
-index 4df1b9f..a721936 100644
---- a/printmode.c
-+++ b/printmode.c
-@@ -1,6 +1,7 @@
- #include "defs.h"
- 
- #include <fcntl.h>
-+#include <sys/stat.h>
- 
- #include "xlat/modetypes.h"
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index f360301..e1c07a8 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -13,12 +13,12 @@ diff --git a/configure.ac b/configure.ac
 index e73958c..5f0dfee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6,7 +6,7 @@ AC_INIT([strace],
+@@ -36,7 +36,7 @@ AC_INIT([strace],
  AC_CONFIG_SRCDIR([strace.c])
  AC_CONFIG_AUX_DIR([.])
  AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules parallel-tests])
-+AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules serial-tests])
+-AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules parallel-tests])
++AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules serial-tests])
  AM_MAINTAINER_MODE
  AC_CANONICAL_HOST
  
@@ -26,10 +26,10 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index ff5e136..984bdb6 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -101,3 +101,21 @@ EXTRA_DIST = init.sh run.sh \
- 	     $(TESTS)
+@@ -332,3 +332,21 @@ EXTRA_DIST = init.sh run.sh \
  
- CLEANFILES = $(TESTS:=.tmp)
+ BUILT_SOURCES = ksysent.h
+ CLEANFILES = ksysent.h $(TESTS:=.tmp)
 +
 +buildtest-TESTS: $(check_PROGRAMS) $(TESTS)
 +
diff --git a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
index e48e4b3..a6f4504 100644
--- a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
+++ b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index e73958c..9099370 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -270,6 +270,18 @@ AC_CHECK_HEADERS(m4_normalize([
+@@ -341,6 +341,18 @@ AC_CHECK_HEADERS(m4_normalize([
  	sys/vfs.h
  	sys/xattr.h
  ]))
@@ -28,10 +28,10 @@ index e73958c..9099370 100644
 +	esac]
 +)
 +
+ AC_CHECK_HEADERS([linux/mqueue.h],,, [#include <linux/types.h>])
  AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
                   [], [], [#include <stddef.h>
- #include <sys/socket.h>
-@@ -745,6 +757,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes; then
+@@ -845,6 +857,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes; then
  fi
  AC_SUBST(dl_LIBS)
  
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
deleted file mode 100644
index 20b7e3d..0000000
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-SUMMARY = "System call tracing tool"
-HOMEPAGE = "http://strace.sourceforge.net"
-SECTION = "console/utils"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
-           file://0001-Add-linux-aarch64-arch_regs.h.patch \
-           file://git-version-gen \
-           file://strace-add-configure-options.patch \
-           file://Makefile-ptest.patch \
-           file://run-ptest \
-           file://Include-sys-stat.h-for-S_I-macros.patch \
-           file://Include-linux-ioctl.h-for-_IOC_-macros.patch \
-          "
-
-SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
-SRC_URI[sha256sum] = "e6180d866ef9e76586b96e2ece2bfeeb3aa23f5cc88153f76e9caedd65e40ee2"
-
-inherit autotools ptest bluetooth
-RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
-
-PACKAGECONFIG_class-target ??= "\
-    libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-"
-
-PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
-PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
-PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
-
-TESTDIR = "tests"
-
-do_configure_prepend() {
-	cp ${WORKDIR}/git-version-gen ${S}
-}
-
-do_install_append() {
-	# We don't ship strace-graph here because it needs perl
-	rm ${D}${bindir}/strace-graph
-}
-
-do_compile_ptest() {
-	oe_runmake -C ${TESTDIR} buildtest-TESTS OS=linux ARCH="${TARGET_ARCH}"
-}
-
-do_install_ptest() {
-	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
new file mode 100644
index 0000000..4601096
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -0,0 +1,50 @@
+SUMMARY = "System call tracing tool"
+HOMEPAGE = "http://strace.sourceforge.net"
+SECTION = "console/utils"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
+           file://0001-arc-metag-nios2-or1k-tile-fix-build.patch \
+           file://git-version-gen \
+           file://strace-add-configure-options.patch \
+           file://Makefile-ptest.patch \
+           file://run-ptest \
+          "
+
+SRC_URI[md5sum] = "a15d2555a7febb56d00c6e1a51c655dc"
+SRC_URI[sha256sum] = "e86a5f6cd8f941f67f3e4b28f4e60f3d9185c951cf266404533210a2e5cd8152"
+
+inherit autotools ptest bluetooth
+RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
+
+PACKAGECONFIG_class-target ??= "\
+    libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+"
+
+PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
+PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
+PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
+
+TESTDIR = "tests"
+
+do_configure_prepend() {
+	cp ${WORKDIR}/git-version-gen ${S}
+}
+
+do_install_append() {
+	# We don't ship strace-graph here because it needs perl
+	rm ${D}${bindir}/strace-graph
+}
+
+do_compile_ptest() {
+	oe_runmake -C ${TESTDIR} buildtest-TESTS OS=linux ARCH="${TARGET_ARCH}"
+}
+
+do_install_ptest() {
+	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
+}
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


