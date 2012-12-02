Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfGe1-0003c5-Ft
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 22:00:09 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1220094pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 12:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ctV8K8xKbmxXiimR6b60LdyEJRizbZ3iv5R/v/jjFj4=;
	b=0dt14tjDJai5qdlmEAeM2fpnHWVB5qk22kdmwRqrxSrqyMVs4E24zDf40kXHpNtXHd
	Ixeu6ZseDd8Kic2KO5Pb/uRxsHC+y2hnFGmFPFdLf1vs1gt5i0LhoCue0H1ehNyw3Bcm
	uk/4JVP2EfGcRVXauyiFMzMjpzjtP000+NrMDcPDVHYyYtV4oCEzx5+rvXsFMGY6GApP
	TrhTGs7cggqyrALEZeUH+IGHU+0ZxZijDP2nepAQXCg2h8AGRozcm84IUIup/cgN07n9
	CI34TqWGGEE1lnWrah/NZarsve60MV8HpClgHaZdKYWI7+fGkj6KiwWhZqsdTZb0L+jS
	QixA==
Received: by 10.68.237.167 with SMTP id vd7mr23516925pbc.161.1354481151149;
	Sun, 02 Dec 2012 12:45:51 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vx2sm5128699pbc.33.2012.12.02.12.45.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Dec 2012 12:45:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2012 12:45:06 -0800
Message-Id: <778e45862ea1d877e03abf4b29468fddbe388107.1354480962.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
References: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
In-Reply-To: <cover.1354480962.git.raj.khem@gmail.com>
References: <cover.1354480962.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] util-linux: Update from 2.21 -> 2.22
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
X-List-Received-Date: Sun, 02 Dec 2012 21:00:09 -0000

2.21 has some linking issues with gold on uclibc where mount
program does not work. Its some sort of underlinking.

2.22 did not solve that problem completely either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |   18 +++++++++++-------
 .../util-linux/add-aarch64-support.patch           |    4 ++--
 .../util-linux/uclibc-__progname-conflict.patch    |   14 +++++++-------
 .../util-linux-ng-replace-siginterrupt.patch       |   14 +++++++-------
 .../{util-linux_2.21.2.bb => util-linux_2.22.bb}   |    8 +++-----
 5 files changed, 30 insertions(+), 28 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.21.2.bb => util-linux_2.22.bb} (88%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f2f9a04..00b332a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -8,16 +8,16 @@ SECTION = "base"
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f \
-                    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://Documentation/licenses/COPYING.GPLv2;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://Documentation/licenses/COPYING.LGPLv2.1;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://Documentation/licenses/COPYING.BSD-3;md5=58dcd8452651fc8b07d1f65ce07ca8af \
-                    file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
-                    file://getopt/COPYING;md5=c3a41733416fb80af7ba1b7e1f712551"
+                    file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262"
 
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
+DEPENDS_append_class-target = " libpam"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
@@ -31,7 +31,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie"
+             util-linux-mkfs util-linux-mcookie util-linux-systemd"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
@@ -42,6 +42,8 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
 		usrsbin_execdir='${sbindir}' \
 "
 
+EXTRA_OECONF_append_class-native = " --disable-login --disable-su"
+
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
@@ -70,6 +72,8 @@ FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
+FILES_${PN}-systemd = "${systemd_unitdir}/system/"
+
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 
@@ -80,7 +84,7 @@ do_compile () {
 	set -e
 	install ${WORKDIR}/MCONFIG ${S}/MCONFIG
 	install ${WORKDIR}/make_include ${S}/make_include
-	install ${WORKDIR}/swapargs.h ${S}/mount/swapargs.h
+	install ${WORKDIR}/swapargs.h ${S}/mount-deprecated/swapargs.h
 	install ${WORKDIR}/defines.h ${S}/defines.h
 	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}' 
 }
diff --git a/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch b/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
index 4480f13..a3c72c9 100644
--- a/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
+++ b/meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
@@ -2,8 +2,8 @@
  fdisk/fdiskbsdlabel.h |    1 +
  1 file changed, 1 insertion(+)
 
---- util-linux-2.21.2.orig/fdisk/fdiskbsdlabel.h
-+++ util-linux-2.21.2/fdisk/fdiskbsdlabel.h
+--- util-linux-2.21.2.orig/fdisks/fdiskbsdlabel.h
++++ util-linux-2.21.2/fdisks/fdiskbsdlabel.h
 @@ -46,10 +46,11 @@
  
  #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
diff --git a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
index 45826b1..d4aeb0c 100644
--- a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
+++ b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
@@ -16,16 +16,16 @@ make[3]: *** [cache.lo] Error 1
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-Index: util-linux-2.19.1/configure.ac
+Index: util-linux-2.22/configure.ac
 ===================================================================
---- util-linux-2.19.1.orig/configure.ac
-+++ util-linux-2.19.1/configure.ac
-@@ -250,7 +250,7 @@ esac
+--- util-linux-2.22.orig/configure.ac	2012-09-04 05:57:00.000000000 -0700
++++ util-linux-2.22/configure.ac	2012-09-22 22:50:50.816612998 -0700
+@@ -377,7 +377,7 @@
  
  
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
index ef56048..a192334 100644
--- a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
-Index: util-linux-2.21/login-utils/login.c
+Index: util-linux-2.22/login-utils/login.c
 ===================================================================
---- util-linux-2.21.orig/login-utils/login.c
-+++ util-linux-2.21/login-utils/login.c
-@@ -1216,6 +1216,8 @@ int main(int argc, char **argv)
+--- util-linux-2.22.orig/login-utils/login.c	2012-07-23 14:21:56.000000000 -0700
++++ util-linux-2.22/login-utils/login.c	2012-09-22 22:48:24.836621168 -0700
+@@ -1231,6 +1231,8 @@
  	char *buff;
  	int childArgc = 0;
  	int retcode;
@@ -13,14 +13,14 @@ Index: util-linux-2.21/login-utils/login.c
  
  	char *pwdbuf = NULL;
  	struct passwd *pwd = NULL, _pwd;
-@@ -1229,7 +1231,9 @@ int main(int argc, char **argv)
- 	timeout = getlogindefs_num("LOGIN_TIMEOUT", LOGIN_TIMEOUT);
+@@ -1244,7 +1246,9 @@
+ 	timeout = (unsigned int)getlogindefs_num("LOGIN_TIMEOUT", LOGIN_TIMEOUT);
  
  	signal(SIGALRM, timedout);
 -	siginterrupt(SIGALRM, 1);	/* we have to interrupt syscalls like ioclt() */
 +	(void) sigaction(SIGALRM, NULL, &act);
 +	act.sa_flags &= ~SA_RESTART;
 +	sigaction(SIGALRM, &act, NULL);
- 	alarm((unsigned int)timeout);
+ 	alarm(timeout);
  	signal(SIGQUIT, SIG_IGN);
  	signal(SIGINT, SIG_IGN);
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.bb
similarity index 88%
rename from meta/recipes-core/util-linux/util-linux_2.21.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.22.bb
index 24bed27..5c26303 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.bb
@@ -1,5 +1,4 @@
-MAJOR_VERSION = "2.21"
-PR = "r6"
+MAJOR_VERSION = "2.22"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -11,9 +10,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
 	    file://configure-sbindir.patch \
 	    file://add-aarch64-support.patch \
 "
-
-SRC_URI[md5sum] = "b75b3cfecb943f74338382fde693c2c3"
-SRC_URI[sha256sum] = "066f9d8e51bfabd809d266edcd54eefba1cdca57725b95c074fd47fe6fba3d30"
+SRC_URI[md5sum] = "dff0d1a9e54fdfe72ab0b1beb9972a77"
+SRC_URI[sha256sum] = "ecfc889dd8cbdb7c82ba56747ae7a394682b4b8623c4e6205a8da2d93fd08aec"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
-- 
1.7.9.5



