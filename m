Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC2D6F66D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 03:48:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 09 Mar 2014 20:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,621,1389772800"; d="scan'208";a="488936390"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.212])
	by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2014 20:48:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 20:48:06 -0700
Message-Id: <1394423288-11049-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
References: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/3] util-linux: Update to 2.24.1
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
X-List-Received-Date: Mon, 10 Mar 2014 03:48:40 -0000

rebase native patch to remove sundisklabel as it's deprectated upstream
Update LIC_FILES_CHECKSUM for modified text, no License Changes
remove deprecated elvtune flag
Rebase the fix-configure patch due to change in configure.ac

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |  12 +-
 .../util-linux/util-linux/fix-configure.patch      |  20 +--
 .../util-linux/util-linux/util-linux-native.patch  | 173 +++------------------
 .../{util-linux_2.23.2.bb => util-linux_2.24.1.bb} |   6 +-
 4 files changed, 37 insertions(+), 174 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.23.2.bb => util-linux_2.24.1.bb} (83%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4c80bf2..51c982a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -7,22 +7,22 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=679af3e410ee112a5ec94de6501bf5c3 \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://Documentation/licenses/COPYING.BSD-3;md5=58dcd8452651fc8b07d1f65ce07ca8af \
                     file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
-                    file://libuuid/COPYING;md5=aa3ac5b4a5bcb707f714f78794011b80 \
-                    file://libmount/COPYING;md5=152f98bc301a5ea649769ede7203ac82 \
-                    file://libblkid/COPYING;md5=152f98bc301a5ea649769ede7203ac82"
+                    file://libuuid/COPYING;md5=b442ffb762cf8d3e9df1b99e0bb4af70 \
+                    file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
+                    file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
 inherit autotools gettext pkgconfig systemd
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
            file://MCONFIG \
            file://defines.h \
            file://make_include \
@@ -39,7 +39,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-partx ${PN}-bash-completion"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
-                       --disable-makeinstall-chown --enable-elvtune \
+                       --disable-makeinstall-chown \
                        --enable-kill --enable-last --enable-mesg --enable-partx \
                        --enable-raw --enable-reset --disable-login \
                        --disable-vipw --disable-newgrp --disable-chfn-chsh \
diff --git a/meta/recipes-core/util-linux/util-linux/fix-configure.patch b/meta/recipes-core/util-linux/util-linux/fix-configure.patch
index 0ea2318..cefae97 100644
--- a/meta/recipes-core/util-linux/util-linux/fix-configure.patch
+++ b/meta/recipes-core/util-linux/util-linux/fix-configure.patch
@@ -5,16 +5,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: util-linux-2.22.1/configure.ac
+Index: util-linux-2.24.1/configure.ac
 ===================================================================
---- util-linux-2.22.1.orig/configure.ac
-+++ util-linux-2.22.1/configure.ac
-@@ -79,7 +79,7 @@ fi
+--- util-linux-2.24.1.orig/configure.ac
++++ util-linux-2.24.1/configure.ac
+@@ -76,7 +76,7 @@ fi
  AC_SUBST([usrsbin_execdir])
  
- case $libdir in
-- '${exec_prefix}/'* | '${prefix}/'* | /usr/*)
-+ ${exec_prefix}/* | ${prefix}/* | /usr/*)
-     usrlib_execdir=$libdir ;;
-  *)
-     usrlib_execdir='${exec_prefix}'$libdir ;;
+ AS_CASE([$libdir],
+- ['${exec_prefix}/'* | '${prefix}/'* | /usr/*],
++ [${exec_prefix}/* | ${prefix}/* | /usr/*],
+    [usrlib_execdir=$libdir],
+  [usrlib_execdir='${exec_prefix}'$libdir]
+ )
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
index e8fcd98..afe543c 100644
--- a/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
@@ -17,10 +17,11 @@ machines.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur util-linux-2.23/configure.ac /home/lmhatle/util-linux-2.23-fixed/configure.ac
---- util-linux-2.23/configure.ac	2013-05-29 14:44:35.147853585 -0500
-+++ /home/lmhatle/util-linux-2.23-fixed/configure.ac	2013-05-30 14:56:15.050799650 -0500
-@@ -323,6 +323,7 @@
+Index: util-linux-2.24.1/configure.ac
+===================================================================
+--- util-linux-2.24.1.orig/configure.ac
++++ util-linux-2.24.1/configure.ac
+@@ -302,6 +302,7 @@ AC_CHECK_FUNCS([ \
  	llseek \
  	lseek64 \
  	mempcpy \
@@ -28,10 +29,11 @@ diff -ur util-linux-2.23/configure.ac /home/lmhatle/util-linux-2.23-fixed/config
  	nanosleep \
  	personality \
  	posix_fadvise \
-diff -ur util-linux-2.23/include/c.h /home/lmhatle/util-linux-2.23-fixed/include/c.h
---- util-linux-2.23/include/c.h	2013-04-12 04:25:46.852156874 -0500
-+++ /home/lmhatle/util-linux-2.23-fixed/include/c.h	2013-05-30 14:56:11.310799488 -0500
-@@ -236,6 +236,13 @@
+Index: util-linux-2.24.1/include/c.h
+===================================================================
+--- util-linux-2.24.1.orig/include/c.h
++++ util-linux-2.24.1/include/c.h
+@@ -236,6 +236,13 @@ static inline int dirfd(DIR *d)
  #endif
  
  /*
@@ -45,9 +47,10 @@ diff -ur util-linux-2.23/include/c.h /home/lmhatle/util-linux-2.23-fixed/include
   * MAXHOSTNAMELEN replacement
   */
  static inline size_t get_hostname_max(void)
-diff -ur util-linux-2.23/lib/randutils.c /home/lmhatle/util-linux-2.23-fixed/lib/randutils.c
---- util-linux-2.23/lib/randutils.c	2013-04-12 04:25:46.855156901 -0500
-+++ /home/lmhatle/util-linux-2.23-fixed/lib/randutils.c	2013-05-30 14:55:26.622799644 -0500
+Index: util-linux-2.24.1/lib/randutils.c
+===================================================================
+--- util-linux-2.24.1.orig/lib/randutils.c
++++ util-linux-2.24.1/lib/randutils.c
 @@ -16,6 +16,7 @@
  #include <sys/syscall.h>
  
@@ -56,9 +59,10 @@ diff -ur util-linux-2.23/lib/randutils.c /home/lmhatle/util-linux-2.23-fixed/lib
  
  #ifdef HAVE_TLS
  #define THREAD_LOCAL static __thread
-diff -ur util-linux-2.23/lib/wholedisk.c /home/lmhatle/util-linux-2.23-fixed/lib/wholedisk.c
---- util-linux-2.23/lib/wholedisk.c	2013-04-12 04:25:46.855156901 -0500
-+++ /home/lmhatle/util-linux-2.23-fixed/lib/wholedisk.c	2013-05-30 14:55:31.182799350 -0500
+Index: util-linux-2.24.1/lib/wholedisk.c
+===================================================================
+--- util-linux-2.24.1.orig/lib/wholedisk.c
++++ util-linux-2.24.1/lib/wholedisk.c
 @@ -10,6 +10,7 @@
  
  #include "blkdev.h"
@@ -67,144 +71,3 @@ diff -ur util-linux-2.23/lib/wholedisk.c /home/lmhatle/util-linux-2.23-fixed/lib
  
  int is_whole_disk_fd(int fd, const char *name)
  {
-diff -ur util-linux-2.23/fdisks/fdisksunlabel.c /home/lmhatle/util-linux-2.23-fixed/fdisks/fdisksunlabel.c
---- util-linux-2.23/fdisks/fdisksunlabel.c	2013-04-23 09:14:19.229015244 -0500
-+++ /home/lmhatle/util-linux-2.23-fixed/fdisks/fdisksunlabel.c	2013-05-30 14:54:55.978799735 -0500
-@@ -383,10 +383,10 @@
- 	}
- }
- 
--static int verify_sun_cmp(int *a, int *b, void *data)
--{
--    unsigned int *verify_sun_starts = (unsigned int *) data;
-+static unsigned int *verify_sun_starts;
- 
-+static int verify_sun_cmp(int *a, int *b)
-+{
-     if (*a == -1)
- 	    return 1;
-     if (*b == -1)
-@@ -401,7 +401,6 @@
-     uint32_t starts[SUN_MAXPARTITIONS], lens[SUN_MAXPARTITIONS], start, stop;
-     uint32_t i,j,k,starto,endo;
-     int array[SUN_MAXPARTITIONS];
--    unsigned int *verify_sun_starts;
- 
-     assert(cxt);
-     assert(cxt->label);
-@@ -442,16 +441,14 @@
- 	    }
- 	}
-     }
--
-     for (i = 0; i < SUN_MAXPARTITIONS; i++) {
-         if (lens[i])
-             array[i] = i;
-         else
-             array[i] = -1;
-     }
--    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
--	  (int (*)(const void *,const void *,void *)) verify_sun_cmp,
--	  verify_sun_starts);
-+    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
-+	  (int (*)(const void *,const void *)) verify_sun_cmp);
- 
-     if (array[0] == -1) {
- 	fdisk_info(cxt, _("No partitions defined"));
-@@ -468,6 +465,7 @@
-     start = (starts[array[i]] + lens[array[i]]);
-     if (start < stop)
-         fdisk_warnx(cxt, _("Unused gap - sectors %d-%d"), start, stop);
-+
-     return 0;
- }
- 
-@@ -746,18 +744,12 @@
- 	}
- }
- 
--
- void fdisk_sun_set_alt_cyl(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 0,			/* low */
--			be16_to_cpu(sunlabel->acyl),		/* default */
--			65535,					/* high */
--			_("Number of alternate cylinders"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->acyl = cpu_to_be16(res);
-+	sunlabel->acyl =
-+		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->acyl), 65535, 0,
-+				_("Number of alternate cylinders")));
- }
- 
- void fdisk_sun_set_ncyl(struct fdisk_context *cxt, int cyl)
-@@ -769,54 +761,33 @@
- void fdisk_sun_set_xcyl(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 0,			/* low */
--			be16_to_cpu(sunlabel->apc),		/* default */
--			cxt->geom.sectors,			/* high */
--			_("Extra sectors per cylinder"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->apc = cpu_to_be16(res);
-+	sunlabel->apc =
-+		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->apc), cxt->geom.sectors, 0,
-+				_("Extra sectors per cylinder")));
- }
- 
- void fdisk_sun_set_ilfact(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 1,			/* low */
--			be16_to_cpu(sunlabel->intrlv),		/* default */
--			32,					/* high */
--			_("Interleave factor"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->intrlv = cpu_to_be16(res);
-+	sunlabel->intrlv =
-+		cpu_to_be16(read_int(cxt, 1, be16_to_cpu(sunlabel->intrlv), 32, 0,
-+				_("Interleave factor")));
- }
- 
- void fdisk_sun_set_rspeed(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 1,			/* low */
--			be16_to_cpu(sunlabel->rpm),		/* default */
--			USHRT_MAX,				/* high */
--			_("Rotation speed (rpm)"),		/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->rpm = cpu_to_be16(res);
--
-+	sunlabel->rpm =
-+		 cpu_to_be16(read_int(cxt, 1, be16_to_cpu(sunlabel->rpm), 100000, 0,
-+				_("Rotation speed (rpm)")));
- }
- 
- void fdisk_sun_set_pcylcount(struct fdisk_context *cxt)
- {
- 	struct sun_disklabel *sunlabel = self_disklabel(cxt);
--	uintmax_t res;
--	int rc = fdisk_ask_number(cxt, 0,			/* low */
--			be16_to_cpu(sunlabel->pcyl),		/* default */
--			USHRT_MAX,				/* high */
--			_("Number of physical cylinders"),	/* query */
--			&res);					/* result */
--	if (!rc)
--		sunlabel->pcyl = cpu_to_be16(res);
-+	sunlabel->pcyl =
-+		cpu_to_be16(read_int(cxt, 0, be16_to_cpu(sunlabel->pcyl), 65535, 0,
-+				_("Number of physical cylinders")));
- }
- 
- static int sun_write_disklabel(struct fdisk_context *cxt)
diff --git a/meta/recipes-core/util-linux/util-linux_2.23.2.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
similarity index 83%
rename from meta/recipes-core/util-linux/util-linux_2.23.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.24.1.bb
index f65932c..b08d68d 100644
--- a/meta/recipes-core/util-linux/util-linux_2.23.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.23"
+MAJOR_VERSION = "2.24"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -14,8 +14,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             ${OLDHOST} \
 "
 
-SRC_URI[md5sum] = "39a02ad0b3b37824c394f40930b7aa38"
-SRC_URI[sha256sum] = "6c5be3f7beec91b4893de14bbd722886fa2521be5bfa0fc079b749d0018633b1"
+SRC_URI[md5sum] = "88d46ae23ca599ac5af9cf96b531590f"
+SRC_URI[sha256sum] = "835eb6232cfab0118ef2e4fd649de0ba9f5bd1b8cbf9a7d4d84594541dec8410"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
-- 
1.8.3.1


