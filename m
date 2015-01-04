Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2783C7267D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 02:11:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t042BDCS022823
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 18:11:13 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 3 Jan 2015 18:11:13 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 10:11:24 +0800
Message-ID: <93f18e70aa0b4c650c24fca6159c9170cdfeddc1.1420337434.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420337434.git.Qi.Chen@windriver.com>
References: <cover.1420337434.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] util-linux: upgrade to 2.25.2
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
X-List-Received-Date: Sun, 04 Jan 2015 02:11:14 -0000
Content-Type: text/plain

fix-configure.patch is removed as it's not appropriate, and the new
version of util-linux has solved the problem this patch is trying to solve.

util-linux-ensure-the-existence-of-directory-for-PAT.patch is removed as
the new version of util-linux has solved the problem this patch is trying
to solve.

util-linux-native.patch is rebased.

util-linux-ng-replace-siginterrupt.patch is rebased.

Add PACKAGECONFIG for 'pylibmount' to build out python bindings for libmount
optionally. util-linux-pylibmount is added to PACKAGES if PACKAGECONFIG has
'pylibmount' in it.

Fix PACAGECONFIG for 'systemd' as the new version has changed things related
to systemd. Now util-linux would have a dependency on systemd if 'systemd' is
in PACKAGECONFIG.

Fix SYSTEMD_PACKAGES, SYSTEMD_SERVICE and SYSTEMD_AUTO_ENABLE variable to match
the new version.

Four lines in do_compile task are deleted because they caused do_compile failure
and nowhere in util-linux are they used. Corresponding files are also removed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |  31 +--
 meta/recipes-core/util-linux/util-linux/MCONFIG    | 223 ---------------------
 meta/recipes-core/util-linux/util-linux/defines.h  |  10 -
 .../util-linux/util-linux/fix-configure.patch      |  20 --
 .../util-linux/util-linux/make_include             |  17 --
 meta/recipes-core/util-linux/util-linux/swapargs.h |   3 -
 ...ensure-the-existence-of-directory-for-PAT.patch |  34 ----
 .../util-linux/util-linux/util-linux-native.patch  |  54 ++---
 .../util-linux-ng-replace-siginterrupt.patch       |  24 ++-
 .../{util-linux_2.24.2.bb => util-linux_2.25.2.bb} |   8 +-
 10 files changed, 53 insertions(+), 371 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/MCONFIG
 delete mode 100644 meta/recipes-core/util-linux/util-linux/defines.h
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fix-configure.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/make_include
 delete mode 100644 meta/recipes-core/util-linux/util-linux/swapargs.h
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch
 rename meta/recipes-core/util-linux/{util-linux_2.24.2.bb => util-linux_2.25.2.bb} (76%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e6c00e4..af30887 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,16 +17,12 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
-inherit autotools gettext pkgconfig systemd
+inherit autotools gettext pkgconfig systemd update-alternatives python-dir
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
-           file://MCONFIG \
-           file://defines.h \
-           file://make_include \
-           file://swapargs.h \
            "
 
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
@@ -38,6 +34,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx ${PN}-bash-completion util-linux-hwclock \
              util-linux-findfs util-linux-getopt"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -56,14 +53,20 @@ PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'p
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 
 # Respect the systemd feature for uuidd
-PACKAGECONFIG[systemd] = "--enable-socket-activation --with-systemdsystemunitdir=${systemd_unitdir}/system/, --disable-socket-activation --without-systemdsystemunitdir"
+PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/, --without-systemd --without-systemdsystemunitdir,systemd"
 
 # Build setpriv requires libcap-ng
 PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
 
+# Build python bindings for libmount
+PACKAGECONFIG[pylibmount] = "--with-python --enable-pylibmount,--without-python --disable-pylibmount,python"
+
 FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
+FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.la"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/.debug/"
+
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
 FILES_util-linux-fstrim = "${base_sbindir}/fstrim"
@@ -85,6 +88,8 @@ FILES_util-linux-getopt = "${bindir}/getopt.${BPN}"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
+FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
+                               ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
 FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
@@ -94,7 +99,6 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
-
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
@@ -113,15 +117,14 @@ RDEPENDS_${PN}_class-nativesdk = ""
 
 RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
 
-SYSTEMD_PACKAGES = "${PN}-uuidd"
-SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.service"
+SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
+SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.socket uuidd.service"
+SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
+SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
+SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
 
 do_compile () {
 	set -e
-	install ${WORKDIR}/MCONFIG ${S}/MCONFIG
-	install ${WORKDIR}/make_include ${S}/make_include
-	install ${WORKDIR}/swapargs.h ${S}/mount-deprecated/swapargs.h
-	install ${WORKDIR}/defines.h ${S}/defines.h
 	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}' 
 }
 
@@ -164,8 +167,6 @@ do_install () {
 	rm -f ${D}${bindir}/chkdupexe
 }
 
-inherit update-alternatives
-
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
diff --git a/meta/recipes-core/util-linux/util-linux/MCONFIG b/meta/recipes-core/util-linux/util-linux/MCONFIG
deleted file mode 100644
index 3fea2c0..0000000
--- a/meta/recipes-core/util-linux/util-linux/MCONFIG
+++ /dev/null
@@ -1,223 +0,0 @@
-# MCONFIG -- Configuration stuff for util-linux
-# Created: Sat Feb  4 15:50:30 1995
-# Copyright 1995 Rickard E. Faith (faith@cs.unc.edu)
-
-# For a user-mode install, make (at least) three changes:
-#  - remove the `-o root' part in INSTALLSUID
-#  - set USE_TTY_GROUP=no
-#  - define DESTDIR
-
-# Select for ARCH one of intel, alpha, sparc, arm, m68k, mips
-# Select for CPU i386 if the binaries must be able to run on an intel 386
-# (by default i486 code is generated, see below)
-CPU=$(shell uname -m)
-ARCH=$(shell echo $(CPU) | sed 's/i.86/intel/;s/arm.*/arm/')
-
-# If HAVE_PAM is set to "yes", then login, chfn, chsh, and newgrp
-# will use PAM for authentication. Additionally, passwd will not be
-# installed as it is not PAM aware.
-HAVE_PAM=no
-
-# If HAVE_SHADOW is set to "yes", then login, chfn, chsh, newgrp, passwd,
-# and vipw will not be built or installed from the login-utils
-# subdirectory.  
-HAVE_SHADOW=yes
-
-# If HAVE_PASSWD is set to "yes", then passwd will not be built or
-# installed from the login-utils subdirectory (but login, chfn, chsh,
-# newgrp, and vipw *will* be installed).
-HAVE_PASSWD=no
-
-# If you use chfn and chsh from this package, REQUIRE_PASSWORD will require
-# non-root users to enter the account password before updating /etc/passwd.
-REQUIRE_PASSWORD=yes
-#REQUIRE_PASSWORD=no
-
-# If you use chsh from this package, ONLY_LISTED_SHELLS will require that
-# the selected shell be listed in /etc/shells -- otherwise only a warning is
-# printed.  This prevents someone from setting their shell to /bin/false.
-ONLY_LISTED_SHELLS=yes
-#ONLY_LISTED_SHELLS=no
-
-
-# If HAVE_SYSVINIT is set to "yes", then simpleinit and shutdown will not
-# be built or installed from the login-utils subdirectory.  (The shutdown
-# and halt that come with the SysVinit package should be used with the init
-# found in that package.)
-HAVE_SYSVINIT=no
-
-# If HAVE_SYSVINIT_UTILS is set to "yes", then last, mesg, and wall will
-# not be built or installed from the login-utils subdirectory.  (The
-# shutdown and init from the SysVinit package do not depend on the last,
-# mesg, and wall from that package.)
-HAVE_SYSVINIT_UTILS=no
-
-# If HAVE_WRITE is set to "yes", then write will not be built or
-# installed from the misc-utils subdirectory.
-# (There is a network aware write in netwrite from NetKit 0.16 or later.)
-HAVE_WRITE=no
-
-# If HAVE_GETTY is set to "yes", then agetty will not be built or
-# installed from the login-utils subdirectory.  Note that agetty can
-# co-exist with other gettys, so this option should never be used.
-HAVE_GETTY=no
-
-# If USE_TTY_GROUP is set to "yes", then wall and write will be installed
-# setgid to the "tty" group, and mesg will only set the group write bit.
-# Note that this is only useful if login/xterm/etc. change the group of the
-# user's tty to "tty" [The login in util-linux does this correctly, and
-# xterm will do it correctly if X is compiled with USE_TTY_GROUP set
-# properly.]
-USE_TTY_GROUP=no
-
-# If HAVE_KILL is set to "yes", then kill will not be built or
-# installed from the misc-utils subdirectory.
-# (There is also a kill in the procps package.)
-HAVE_KILL=no
-
-# If ALLOW_VCS_USE is set to "yes", then login will chown /dev/vcsN
-# to the current user, allowing her to make a screendump and do other
-# nifty things on the console, but also allowing him to keep an open
-# file descriptor after logging out to trick the next user.
-ALLOW_VCS_USE=yes
-
-# If HAVE_RESET is set to "yes", then reset won't be installed.  The version
-# of reset that comes with the ncurses package is less aggressive.
-HAVE_RESET=yes
-
-# If HAVE_SLN is set to "yes", then sln won't be installed
-# (but the man page sln.8 will be installed anyway).
-# sln also comes with libc and glibc.
-HAVE_SLN=no
-
-# If HAVE_FDUTILS is set to "yes", then setfdprm won't be installed.
-HAVE_FDUTILS=no
-
-# If SILENT_PG is set to "yes", then pg will not ring the bell
-# when an invalid key is pressed
-SILENT_PG=no
-
-# If configure decides that Native Language Support (NLS) is available,
-# it sets MAY_ENABLE_NLS in defines.h. If you don't want NLS, set
-# DISABLE_NLS to "yes".
-DISABLE_NLS=no
-
-# Different optimizations for different cpus.
-# gcc 3.0 likes options -mcpu=i486 instead of -m486
-ifeq "$(ARCH)" "intel"
-  ifeq "$(HAVE_OLD_GCC)" "yes"
-    CPUHEAD=-m
-  else
-    CPUHEAD=-mcpu=i
-  endif
-  ifeq "$(CPU)" "i386"
-    CPUTAIL=386
-  else
-    CPUTAIL=486
-  endif
-  CPUOPT= $(CPUHEAD)$(CPUTAIL)
-  OPT=          -pipe -O2 $(CPUOPT) -fomit-frame-pointer
-else 
-  ifeq "$(ARCH)" "arm"
-    OPT=	-pipe -O2 -fsigned-char -fomit-frame-pointer
-  else
-    OPT=	-O2 -fomit-frame-pointer
-  endif
-endif
-
-WARNFLAGS = -Wall -Wmissing-prototypes -Wstrict-prototypes
-
-LIB=../lib
-
-ERR_O=$(LIB)/err.o
-
-# Set HAVE_SLANG to yes if you have slang (and prefer to use that for cfdisk)
-# (If neither HAVE_NCURSES nor HAVE_SLANG is defined, cfdisk is not made.)
-# HAVE_SLANG=yes
-# There is a subdirectory /usr/include/slang containing slcurses.h
-# SLANGFLAGS=-I/usr/include/slang
-# No such subdirectory - slcurses.h lives in /usr/include
-#   (no extra definition required).
-LIBSLANG=-lslang
-
-#
-# Paths used for compilation (not all are actually used, see CFLAGS below)
-#
-DEV_DIR=	/dev
-ETC_DIR=	/etc
-SBIN_DIR=	/sbin
-USRSBIN_DIR=	/usr/sbin
-USRLIB_DIR=	/usr/lib
-USRBIN_DIR=	/usr/bin
-USRGAMES_DIR=	/usr/games
-USRSHAREMISC_DIR=/usr/share/misc
-LOCALE_DIR=	/usr/share/locale
-BIN_DIR=        /bin
-VAR_PATH=	/var
-LOG_DIR=	/var/log
-MAN_DIR=	/usr/share/man
-INFO_DIR=	/usr/share/info
-
-#
-# Paths used for install
-#
-DEVDIR=		$(DESTDIR)$(DEV_DIR)
-ETCDIR=		$(DESTDIR)$(ETC_DIR)
-SBINDIR=	$(DESTDIR)$(SBIN_DIR)
-USRSBINDIR=	$(DESTDIR)$(USRSBIN_DIR)
-USRLIBDIR=      $(DESTDIR)$(USRLIB_DIR)
-USRBINDIR=      $(DESTDIR)$(USRBIN_DIR)
-USRGAMESDIR=    $(DESTDIR)$(USRGAMES_DIR)
-USRSHAREMISCDIR=$(DESTDIR)$(USRSHAREMISC_DIR)
-LOCALEDIR=      $(DESTDIR)$(LOCALE_DIR)
-BINDIR=         $(DESTDIR)$(BIN_DIR)
-VARPATH=	$(DESTDIR)$(VAR_PATH)
-LOGDIR=		$(DESTDIR)$(LOG_DIR)
-MANDIR=		$(DESTDIR)$(MAN_DIR)
-MAN1DIR=	$(MANDIR)/man1
-MAN3DIR=	$(MANDIR)/man3
-MAN5DIR=	$(MANDIR)/man5
-MAN6DIR=	$(MANDIR)/man6
-MAN8DIR=	$(MANDIR)/man8
-INFODIR=	$(DESTDIR)$(INFO_DIR)
-
-# Directory for shutdown, halt, reboot, etc.
-SHUTDOWNDIR=	$(SBINDIR)
-
-# Modes
-DIRMODE=	755
-BINMODE=	755
-MANMODE=	644
-DATMODE=	644
-INFOMODE=	644
-SUIDMODE=      4755
-
-CHMOD=		chmod
-INSTALL=	install
-INSTALLDIR=	$(INSTALL) -d -m $(DIRMODE)
-INSTALLBIN=	$(INSTALL) -m $(BINMODE)
-INSTALLMAN=	$(INSTALL) -m $(MANMODE)
-INSTALLDAT=	$(INSTALL) -m $(DATMODE)
-INSTALLSUID=    $(INSTALL) -m $(SUIDMODE)
-
-ifeq "$(DISABLE_NLS)" "yes"
-NLSFLAGS = -DDISABLE_NLS
-endif
-
-CFLAGS := $(OPT) -I$(LIB) $(WARNFLAGS) \
-			$(CURSESFLAGS) $(SLANGFLAGS) $(NLSFLAGS) \
-			-D_FILE_OFFSET_BITS=64 \
-			-DSBINDIR=\"$(SBIN_DIR)\" \
-			-DUSRSBINDIR=\"$(USRSBIN_DIR)\" \
-			-DLOGDIR=\"$(LOG_DIR)\" \
-			-DVARPATH=\"$(VAR_PATH)\" \
-			-DLOCALEDIR=\"$(LOCALE_DIR)\" \
-			$(CFLAGS)
-
-
-%.o: %.c
-	$(CC) -c $(CFLAGS) $< -o $@
-
-%: %.cc
-	$(CXX) $(CFLAGS) $< -o $@
-
diff --git a/meta/recipes-core/util-linux/util-linux/defines.h b/meta/recipes-core/util-linux/util-linux/defines.h
deleted file mode 100644
index 6ce6b86..0000000
--- a/meta/recipes-core/util-linux/util-linux/defines.h
+++ /dev/null
@@ -1,10 +0,0 @@
-#define UTIL_LINUX_VERSION "2.12"
-#define util_linux_version "util-linux-2.12"
-
-#define HAVE_blkpg_h
-#define HAVE_kd_h
-#define HAVE_locale_h
-#define HAVE_langinfo_h
-#define HAVE_sys_user_h
-#define HAVE_asm_types_h
-//#define NEED_tqueue_h
diff --git a/meta/recipes-core/util-linux/util-linux/fix-configure.patch b/meta/recipes-core/util-linux/util-linux/fix-configure.patch
deleted file mode 100644
index cefae97..0000000
--- a/meta/recipes-core/util-linux/util-linux/fix-configure.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-The userlib_execdir was not getting set correctly, the quoting
-was wrong as these quoted items were not getting expanded correctly.
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: util-linux-2.24.1/configure.ac
-===================================================================
---- util-linux-2.24.1.orig/configure.ac
-+++ util-linux-2.24.1/configure.ac
-@@ -76,7 +76,7 @@ fi
- AC_SUBST([usrsbin_execdir])
- 
- AS_CASE([$libdir],
-- ['${exec_prefix}/'* | '${prefix}/'* | /usr/*],
-+ [${exec_prefix}/* | ${prefix}/* | /usr/*],
-    [usrlib_execdir=$libdir],
-  [usrlib_execdir='${exec_prefix}'$libdir]
- )
diff --git a/meta/recipes-core/util-linux/util-linux/make_include b/meta/recipes-core/util-linux/util-linux/make_include
deleted file mode 100644
index e6abcd9..0000000
--- a/meta/recipes-core/util-linux/util-linux/make_include
+++ /dev/null
@@ -1,17 +0,0 @@
-VERSION=2.12
-CC=gcc
-CFLAGS=
-LDFLAGS=
-HAVE_OLD_GCC=yes
-HAVE_RAW_H=yes
-HAVE_NCURSES=yes
-CURSESFLAGS=-DNCH=1
-LIBCURSES=-lncurses
-HAVE_TERMCAP=no
-NEED_LIBCRYPT=yes
-FOREIGN = --foreign-user
-HAVE_XGETTEXT=yes
-HAVE_OPENPTY=yes
-HAVE_PIVOT_ROOT=yes
-HAVE_GOOD_RPC=yes
-HAVE_ZLIB=yes
diff --git a/meta/recipes-core/util-linux/util-linux/swapargs.h b/meta/recipes-core/util-linux/util-linux/swapargs.h
deleted file mode 100644
index e960eef..0000000
--- a/meta/recipes-core/util-linux/util-linux/swapargs.h
+++ /dev/null
@@ -1,3 +0,0 @@
-#define SWAPON_HAS_TWO_ARGS
-#include <asm/page.h>
-#include <sys/swap.h>
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch
deleted file mode 100644
index 8f26451..0000000
--- a/meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-util-linux: ensure the existence of directory for PATHFILES
-
-When compiling util-linux, it's possible to encounter the following error.
-     /bin/sh: line 2:: misc-utils/uuidd.8.tmp: No such file or directory
-
-This is because that the misc-utils directory doesn't exist when trying to write to
-misc-utils/uuidd.8.tmp.
-
-When generating misc-utils/uuidd.8 (or anything in PATHFILES), its directory
-may not have been created yet. So we need to ensure the existence of the directory
-to avoid the compilation error.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.am |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 17f4c33..ca3dc0f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -123,6 +123,7 @@ EXTRA_DIST += $(PATHFILES:=.in)
- 
- $(PATHFILES): Makefile
- 	@ rm -f $@ $@.tmp
-+	@ mkdir -p `dirname $@`
- 	$(AM_V_GEN) srcdir=''; \
- 		test -f ./$@.in || srcdir=$(srcdir)/; \
- 		$(edit_cmd) $${srcdir}$@.in >$@.tmp
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
index afe543c..1f496de 100644
--- a/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
@@ -16,24 +16,29 @@ Patches revert upstream changes in order to support older
 machines.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 1 +
+ include/c.h  | 7 +++++++
+ 2 files changed, 8 insertions(+)
 
-Index: util-linux-2.24.1/configure.ac
-===================================================================
---- util-linux-2.24.1.orig/configure.ac
-+++ util-linux-2.24.1/configure.ac
-@@ -302,6 +302,7 @@ AC_CHECK_FUNCS([ \
+diff --git a/configure.ac b/configure.ac
+index eb3680b..93e015f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -318,6 +318,7 @@ AC_CHECK_FUNCS([ \
  	llseek \
  	lseek64 \
  	mempcpy \
 +	mkostemp \
  	nanosleep \
+ 	open_memstream \
  	personality \
- 	posix_fadvise \
-Index: util-linux-2.24.1/include/c.h
-===================================================================
---- util-linux-2.24.1.orig/include/c.h
-+++ util-linux-2.24.1/include/c.h
-@@ -236,6 +236,13 @@ static inline int dirfd(DIR *d)
+diff --git a/include/c.h b/include/c.h
+index e423e8b..cf33b94 100644
+--- a/include/c.h
++++ b/include/c.h
+@@ -233,6 +233,13 @@ static inline int dirfd(DIR *d)
  #endif
  
  /*
@@ -47,27 +52,6 @@ Index: util-linux-2.24.1/include/c.h
   * MAXHOSTNAMELEN replacement
   */
  static inline size_t get_hostname_max(void)
-Index: util-linux-2.24.1/lib/randutils.c
-===================================================================
---- util-linux-2.24.1.orig/lib/randutils.c
-+++ util-linux-2.24.1/lib/randutils.c
-@@ -16,6 +16,7 @@
- #include <sys/syscall.h>
- 
- #include "randutils.h"
-+#include "c.h"
- 
- #ifdef HAVE_TLS
- #define THREAD_LOCAL static __thread
-Index: util-linux-2.24.1/lib/wholedisk.c
-===================================================================
---- util-linux-2.24.1.orig/lib/wholedisk.c
-+++ util-linux-2.24.1/lib/wholedisk.c
-@@ -10,6 +10,7 @@
- 
- #include "blkdev.h"
- #include "wholedisk.h"
-+#include "c.h"
- 
- int is_whole_disk_fd(int fd, const char *name)
- {
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
index f131b76..6717a75 100644
--- a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
@@ -1,27 +1,33 @@
 Upstream-Status: Pending
 
-Index: util-linux-2.22.1/login-utils/login.c
-===================================================================
---- util-linux-2.22.1.orig/login-utils/login.c
-+++ util-linux-2.22.1/login-utils/login.c
-@@ -1239,6 +1239,8 @@ int main(int argc, char **argv)
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ login-utils/login.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/login-utils/login.c b/login-utils/login.c
+index ebb76f5..38c881b 100644
+--- a/login-utils/login.c
++++ b/login-utils/login.c
+@@ -1110,6 +1110,7 @@ int main(int argc, char **argv)
  	char *buff;
  	int childArgc = 0;
  	int retcode;
 +	struct sigaction act;
-+
  
  	char *pwdbuf = NULL;
  	struct passwd *pwd = NULL, _pwd;
-@@ -1252,7 +1254,10 @@ int main(int argc, char **argv)
+@@ -1123,7 +1124,9 @@ int main(int argc, char **argv)
  	timeout = (unsigned int)getlogindefs_num("LOGIN_TIMEOUT", LOGIN_TIMEOUT);
  
  	signal(SIGALRM, timedout);
--	siginterrupt(SIGALRM, 1);	/* we have to interrupt syscalls like ioclt() */
+-	siginterrupt(SIGALRM, 1);	/* we have to interrupt syscalls like ioctl() */
 +	(void) sigaction(SIGALRM, NULL, &act);
 +	act.sa_flags &= ~SA_RESTART;
 +	sigaction(SIGALRM, &act, NULL);
-+
  	alarm(timeout);
  	signal(SIGQUIT, SIG_IGN);
  	signal(SIGINT, SIG_IGN);
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.24.2.bb b/meta/recipes-core/util-linux/util-linux_2.25.2.bb
similarity index 76%
rename from meta/recipes-core/util-linux/util-linux_2.24.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.25.2.bb
index ed753e4..697b900 100644
--- a/meta/recipes-core/util-linux/util-linux_2.24.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.25.2.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.24"
+MAJOR_VERSION = "2.25"
 require util-linux.inc
 PR = "r1"
 
@@ -13,14 +13,12 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
-            file://fix-configure.patch \
             file://fix-parallel-build.patch \
-            file://util-linux-ensure-the-existence-of-directory-for-PAT.patch \
             ${OLDHOST} \
 "
 
-SRC_URI[md5sum] = "3f191727a0d28f7204b755cf1b6ea0aa"
-SRC_URI[sha256sum] = "1243d6c07f1c5b38aa4c3814c81a71c24cba7dafe08942916bf216a90a460ff0"
+SRC_URI[md5sum] = "cab3d7be354000f629bc601238b629b3"
+SRC_URI[sha256sum] = "e0457f715b73f4a349e1acb08cb410bf0edc9a74a3f75c357070f31f70e33cd6"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


