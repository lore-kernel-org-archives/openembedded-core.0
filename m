Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeEGV-0007iy-95
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 01:15:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2012 16:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,188,1355126400"; d="scan'208";a="224515823"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2012 16:00:47 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 16:00:42 -0800
Message-Id: <1354233643-3385-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
References: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/4] util-linux: Update to 2.22.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 00:15:36 -0000

Fix the configure-sbindir test, which was not working correctly
add a patch to configure to correctly test if the prefixes are
conatined in libdir so they don't duplicate.

Removed aarch64 patch since it been merged into this version

Rebased util-linux-ng-replace-siginterrupt.patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc         | 21 ++++++++++++---------
 .../util-linux/util-linux/add-aarch64-support.patch | 18 ------------------
 .../util-linux/util-linux/configure-sbindir.patch   | 15 ++++++++++-----
 .../util-linux/util-linux/fix-configure.patch       | 20 ++++++++++++++++++++
 .../util-linux/uclibc-__progname-conflict.patch     | 14 +++++++-------
 .../util-linux-ng-replace-siginterrupt.patch        | 15 ++++++++-------
 .../{util-linux_2.21.2.bb => util-linux_2.22.1.bb}  | 10 +++++-----
 7 files changed, 62 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/fix-configure.patch
 rename meta/recipes-core/util-linux/{util-linux_2.21.2.bb => util-linux_2.22.1.bb} (85%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f2f9a04..058f06f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -8,12 +8,14 @@ SECTION = "base"
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f \
-                    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://Documentation/licenses/COPYING.GPLv2;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://Documentation/licenses/COPYING.LGPLv2.1;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://Documentation/licenses/COPYING.BSD-3;md5=58dcd8452651fc8b07d1f65ce07ca8af \
                     file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
-                    file://getopt/COPYING;md5=c3a41733416fb80af7ba1b7e1f712551"
+                    file://libuuid/COPYING;md5=aa3ac5b4a5bcb707f714f78794011b80 \
+                    file://libmount/COPYING;md5=152f98bc301a5ea649769ede7203ac82 \
+                    file://libblkid/COPYING;md5=152f98bc301a5ea649769ede7203ac82"
 
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
@@ -21,7 +23,6 @@ DEPENDS_append_class-native = " lzo-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
-           file://swapargs.h \
            file://defines.h \
            file://make_include \
            "
@@ -36,12 +37,15 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
                 --enable-kill --enable-last --enable-mesg --enable-partx \
-                --enable-raw --enable-rdev --enable-reset --disable-login-utils \
+                --enable-raw --enable-rdev --enable-reset --disable-login \
+                --disable-vipw --disable-newgrp --disable-chfn-chsh --disable-su \
                 --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
                 --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
 		usrsbin_execdir='${sbindir}' \
 "
 
+EXTRA_OECONF_class-native += "--disable-login --disable-su"
+
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
@@ -80,7 +84,6 @@ do_compile () {
 	set -e
 	install ${WORKDIR}/MCONFIG ${S}/MCONFIG
 	install ${WORKDIR}/make_include ${S}/make_include
-	install ${WORKDIR}/swapargs.h ${S}/mount/swapargs.h
 	install ${WORKDIR}/defines.h ${S}/defines.h
 	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}' 
 }
@@ -97,7 +100,7 @@ do_install () {
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
         sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid blockdev"
-        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt flock"
+        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock"
         binprogs_a="dmesg kill more umount mount login reset"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
@@ -133,7 +136,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more reset mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock hwclock"
+ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
diff --git a/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch b/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
deleted file mode 100644
index 4480f13..0000000
--- a/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
+++ /dev/null
@@ -1,18 +0,0 @@
----
- fdisk/fdiskbsdlabel.h |    1 +
- 1 file changed, 1 insertion(+)
-
---- util-linux-2.21.2.orig/fdisk/fdiskbsdlabel.h
-+++ util-linux-2.21.2/fdisk/fdiskbsdlabel.h
-@@ -46,10 +46,11 @@
- 
- #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
- 
- #if defined (__i386__) || defined (__sparc__) || defined (__arm__) || \
-     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
-+    defined (__aarch64__) || \
-     defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
- #define BSD_LABELSECTOR   1
- #define BSD_LABELOFFSET   0
- #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
- #define BSD_LABELSECTOR   0
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index f1f5ef4..a5b1ff1 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,18 +1,23 @@
 util-linux: take ${sbindir} from the environment if it is set there
+fix the test, the [ ] syntax was getting eaten by autoconf
 
 Signed-off-by: Phil Blundell <pb@pbcl.net>
+Signed-off-by: Saul Wold <sgw@linux.intel.com
 Upstream-Status: Inappropriate [configuration]
 
---- util-linux-2.21.2/configure.ac~	2012-09-22 09:29:12.354215377 +0100
-+++ util-linux-2.21.2/configure.ac	2012-09-22 16:47:14.713628946 +0100
-@@ -67,7 +67,9 @@
+Index: util-linux-2.22.1/configure.ac
+===================================================================
+--- util-linux-2.22.1.orig/configure.ac
++++ util-linux-2.22.1/configure.ac
+@@ -73,7 +73,10 @@ AC_SUBST([localstatedir])
  usrbin_execdir='${exec_prefix}/bin'
  AC_SUBST([usrbin_execdir])
  
 -usrsbin_execdir='${exec_prefix}/sbin'
-+if [ -z "$usrsbin_execdir" ]; then
++if test -z "$usrsbin_execdir" ;
++then
 +   usrsbin_execdir='${exec_prefix}/sbin'
 +fi
  AC_SUBST([usrsbin_execdir])
  
- usrlib_execdir='${exec_prefix}/'$libdirname
+ case $libdir in
diff --git a/meta/recipes-core/util-linux/util-linux/fix-configure.patch b/meta/recipes-core/util-linux/util-linux/fix-configure.patch
new file mode 100644
index 0000000..0ea2318
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/fix-configure.patch
@@ -0,0 +1,20 @@
+The userlib_execdir was not getting set correctly, the quoting
+was wrong as these quoted items were not getting expanded correctly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: util-linux-2.22.1/configure.ac
+===================================================================
+--- util-linux-2.22.1.orig/configure.ac
++++ util-linux-2.22.1/configure.ac
+@@ -79,7 +79,7 @@ fi
+ AC_SUBST([usrsbin_execdir])
+ 
+ case $libdir in
+- '${exec_prefix}/'* | '${prefix}/'* | /usr/*)
++ ${exec_prefix}/* | ${prefix}/* | /usr/*)
+     usrlib_execdir=$libdir ;;
+  *)
+     usrlib_execdir='${exec_prefix}'$libdir ;;
diff --git a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
index 45826b1..5b743cb 100644
--- a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
+++ b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
@@ -16,16 +16,16 @@ make[3]: *** [cache.lo] Error 1
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-Index: util-linux-2.19.1/configure.ac
+Index: util-linux-2.22.1/configure.ac
 ===================================================================
---- util-linux-2.19.1.orig/configure.ac
-+++ util-linux-2.19.1/configure.ac
-@@ -250,7 +250,7 @@ esac
+--- util-linux-2.22.1.orig/configure.ac
++++ util-linux-2.22.1/configure.ac
+@@ -372,7 +372,7 @@ esac
  
  
  AC_MSG_CHECKING(whether program_invocation_short_name is defined)
 -AC_TRY_COMPILE([#include <argp.h>],
 +AC_TRY_COMPILE([#include <errno.h>],
-                [program_invocation_short_name = "test";],
-                AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
-                          [Define if program_invocation_short_name is defined])
+ 	       [program_invocation_short_name = "test";],
+ 	       AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
+ 			 [Define if program_invocation_short_name is defined])
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
index ef56048..f131b76 100644
--- a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
-Index: util-linux-2.21/login-utils/login.c
+Index: util-linux-2.22.1/login-utils/login.c
 ===================================================================
---- util-linux-2.21.orig/login-utils/login.c
-+++ util-linux-2.21/login-utils/login.c
-@@ -1216,6 +1216,8 @@ int main(int argc, char **argv)
+--- util-linux-2.22.1.orig/login-utils/login.c
++++ util-linux-2.22.1/login-utils/login.c
+@@ -1239,6 +1239,8 @@ int main(int argc, char **argv)
  	char *buff;
  	int childArgc = 0;
  	int retcode;
@@ -13,14 +13,15 @@ Index: util-linux-2.21/login-utils/login.c
  
  	char *pwdbuf = NULL;
  	struct passwd *pwd = NULL, _pwd;
-@@ -1229,7 +1231,9 @@ int main(int argc, char **argv)
- 	timeout = getlogindefs_num("LOGIN_TIMEOUT", LOGIN_TIMEOUT);
+@@ -1252,7 +1254,10 @@ int main(int argc, char **argv)
+ 	timeout = (unsigned int)getlogindefs_num("LOGIN_TIMEOUT", LOGIN_TIMEOUT);
  
  	signal(SIGALRM, timedout);
 -	siginterrupt(SIGALRM, 1);	/* we have to interrupt syscalls like ioclt() */
 +	(void) sigaction(SIGALRM, NULL, &act);
 +	act.sa_flags &= ~SA_RESTART;
 +	sigaction(SIGALRM, &act, NULL);
- 	alarm((unsigned int)timeout);
++
+ 	alarm(timeout);
  	signal(SIGQUIT, SIG_IGN);
  	signal(SIGINT, SIG_IGN);
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
similarity index 85%
rename from meta/recipes-core/util-linux/util-linux_2.21.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.22.1.bb
index 24bed27..c72634d 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
@@ -1,5 +1,5 @@
-MAJOR_VERSION = "2.21"
-PR = "r6"
+MAJOR_VERSION = "2.22"
+PR = "r0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -9,11 +9,11 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \
 	    file://configure-sbindir.patch \
-	    file://add-aarch64-support.patch \
+	    file://fix-configure.patch \
 "
 
-SRC_URI[md5sum] = "b75b3cfecb943f74338382fde693c2c3"
-SRC_URI[sha256sum] = "066f9d8e51bfabd809d266edcd54eefba1cdca57725b95c074fd47fe6fba3d30"
+SRC_URI[md5sum] = "cad23c41a014af766d467b86628bd0fd"
+SRC_URI[sha256sum] = "4297ea2a560f8839d7b3cde72a5955d1458dbad38fe0e3d99ccb1fde3df751b2"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
-- 
1.8.0



