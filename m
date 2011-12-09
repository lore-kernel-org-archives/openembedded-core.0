Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZ5Db-000497-Vr
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 19:30:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 10:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100564249"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 10:23:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  9 Dec 2011 10:23:43 -0800
Message-Id: <b4d2702c8a59102a5a66a43b28bb3c606823fa48.1323454935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/15] pax: fix compilation with x32 toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 18:30:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

off_t is 8byte for x32.  We need to check both _FILE_OFFSET_BITS and
size of off_t to see if file offset is 64bit.  This patch adds
AC_CHECK_SIZEOF(off_t) and checks SIZEOF_OFF_T == 8.

Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../pax/pax/pax-3.4_fix_for_x32.patch              |  185 ++++++++++++++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |    5 +-
 2 files changed, 188 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch

diff --git a/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch b/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
new file mode 100644
index 0000000..11dfa0f
--- /dev/null
+++ b/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
@@ -0,0 +1,185 @@
+UpstreamStatus: Pending
+
+Author: H.J. Lu <hjl.tools@gmail.com>
+Date:   Tue Dec 6 10:34:53 2011 -0800
+
+    Fix pax-3.4 build for x32
+    
+    off_t is 8byte for x32.  We need to check both _FILE_OFFSET_BITS and
+    size of off_t to see if file offset is 64bit.  This patch adds
+    AC_CHECK_SIZEOF(off_t) and checks SIZEOF_OFF_T == 8.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/06
+
+Index: pax-3.4/configure.in
+===================================================================
+--- pax-3.4.orig/configure.in
++++ pax-3.4/configure.in
+@@ -33,4 +33,7 @@ dnl Checks for header files.
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+ 
++AC_CHECK_SIZEOF(off_t)
++AC_CHECK_SIZEOF(long)
++
+ AC_OUTPUT([Makefile lib/Makefile src/Makefile])
+Index: pax-3.4/src/ar_io.c
+===================================================================
+--- pax-3.4.orig/src/ar_io.c
++++ pax-3.4/src/ar_io.c
+@@ -378,7 +378,8 @@ ar_close(void)
+ 	 * could have written anything yet.
+ 	 */
+ 	if (frmt == NULL) {
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+ 		(void)fprintf(listf, "%s: unknown format, %qu bytes skipped.\n",
+ #else
+ 		(void)fprintf(listf, "%s: unknown format, %lu bytes skipped.\n",
+@@ -391,7 +392,8 @@ ar_close(void)
+ 
+ 	if (strcmp(NM_CPIO, argv0) == 0)
+ 		(void)fprintf(listf,
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+ 		    "%qu blocks\n",
+ #else
+ 		    "%lu blocks\n",
+@@ -399,7 +401,8 @@ ar_close(void)
+ 			(rdcnt ? rdcnt : wrcnt) / 5120);
+ 	else if (strcmp(NM_TAR, argv0) != 0)
+ 		(void)fprintf(listf,
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+ 		    "%s: %s vol %d, %lu files, %qu bytes read, %qu bytes written.\n",
+ #else
+ 		    "%s: %s vol %d, %lu files, %lu bytes read, %lu bytes written.\n",
+Index: pax-3.4/src/cpio.c
+===================================================================
+--- pax-3.4.orig/src/cpio.c
++++ pax-3.4/src/cpio.c
+@@ -218,7 +218,8 @@ rd_ln_nm (ARCHD *arcn)
+ 	 */
+ 	if ((arcn->sb.st_size == 0) ||
+ 	    (arcn->sb.st_size >= (off_t) sizeof(arcn->ln_name))) {
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+ 		paxwarn (1, "Cpio link name length is invalid: %qu",
+ 			 arcn->sb.st_size);
+ #else
+Index: pax-3.4/src/gen_subs.c
+===================================================================
+--- pax-3.4.orig/src/gen_subs.c
++++ pax-3.4/src/gen_subs.c
+@@ -133,7 +133,8 @@ ls_list (ARCHD *arcn, time_t now, FILE *
+    * print device id's for devices, or sizes for other nodes
+    */
+   if ((arcn->type == PAX_CHR) || (arcn->type == PAX_BLK))
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+     (void) fprintf (fp, "%4lu,%4lu ", (unsigned long) MAJOR (sbp->st_rdev),
+ 		    (unsigned long) MINOR (sbp->st_rdev));
+ #else
+@@ -142,7 +143,8 @@ ls_list (ARCHD *arcn, time_t now, FILE *
+ #endif
+   else
+     {
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+       (void) fprintf (fp, "%9qu ", sbp->st_size);
+ #else
+       (void) fprintf (fp, "%9lu ", sbp->st_size);
+@@ -334,7 +336,8 @@ ul_asc (u_long val, char *str, int len, 
+   return (0);
+ }
+ 
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+ /*
+  * asc_uqd()
+  *	convert hex/octal character string into a u_quad_t. We do not have to
+Index: pax-3.4/src/options.c
+===================================================================
+--- pax-3.4.orig/src/options.c
++++ pax-3.4/src/options.c
+@@ -1545,7 +1545,8 @@ str_offt (char *val)
+   char *expr;
+   off_t num, t;
+ 
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+   num = strtoq (val, &expr, 0);
+   if ((num == LONG_LONG_MAX) || (num <= 0) || (expr == val))
+ #else
+Index: pax-3.4/src/tar.c
+===================================================================
+--- pax-3.4.orig/src/tar.c
++++ pax-3.4/src/tar.c
+@@ -58,7 +58,8 @@
+ static unsigned long tar_chksm (char *, int);
+ static char *name_split (char *, int);
+ static int ul_oct (u_long, char *, int, int);
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+ static int uqd_oct (u_quad_t, char *, int, int);
+ #endif
+ 
+@@ -196,7 +197,8 @@ ul_oct (u_long val, register char *str, 
+   return (0);
+ }
+ 
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+ /*
+  * uqd_oct()
+  *	convert an u_quad_t to an octal string. one of many oddball field
+@@ -427,7 +429,8 @@ tar_rd (ARCHD *arcn, char *buf)
+ 			       0xfff);
+   arcn->sb.st_uid = (uid_t) asc_ul (hd->uid, sizeof (hd->uid), OCT);
+   arcn->sb.st_gid = (gid_t) asc_ul (hd->gid, sizeof (hd->gid), OCT);
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+   arcn->sb.st_size = (off_t) asc_uqd (hd->size, sizeof (hd->size), OCT);
+ #else
+   arcn->sb.st_size = (off_t) asc_ul (hd->size, sizeof (hd->size), OCT);
+@@ -659,7 +662,8 @@ tar_wr (register ARCHD * arcn)
+        * data follows this file, so set the pad
+        */
+       hd->linkflag = AREGTYPE;
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+       if (uqd_oct ((u_quad_t) arcn->sb.st_size, hd->size,
+ 		   sizeof (hd->size), 1))
+ #else
+@@ -834,7 +838,8 @@ ustar_rd (ARCHD *arcn, char *buf)
+    */
+   arcn->sb.st_mode = (mode_t) (asc_ul (hd->mode, sizeof (hd->mode), OCT) &
+ 			       0xfff);
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+   arcn->sb.st_size = (off_t) asc_uqd (hd->size, sizeof (hd->size), OCT);
+ #else
+   arcn->sb.st_size = (off_t) asc_ul (hd->size, sizeof (hd->size), OCT);
+@@ -1081,7 +1086,8 @@ ustar_wr (register ARCHD * arcn)
+       else
+ 	hd->typeflag = REGTYPE;
+       arcn->pad = TAR_PAD (arcn->sb.st_size);
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#if (SIZEOF_LONG == 4 && SIZEOF_OFF_T == 8) \
++    || (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64)
+       if (uqd_oct ((u_quad_t) arcn->sb.st_size, hd->size,
+ 		   sizeof (hd->size), 3))
+ 	{
diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index e9c70d6..0c10688 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b0b674dfdc56daa3832d4069b820ea0 \
                     file://lib/vis.h;endline=40;md5=b283f759abd4a5ad7e014b80f51fc053"
 
 SECTION = "base"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.suse.com/pub/people/kukuk/pax/pax-${PV}.tar.bz2 \
-	file://fix_for_compile_with_gcc-4.6.0.patch"
+	file://fix_for_compile_with_gcc-4.6.0.patch \
+	file://pax-3.4_fix_for_x32.patch"
 
 SRC_URI[md5sum] = "fbd9023b590b45ac3ade95870702a0d6"
 SRC_URI[sha256sum] = "ac3c06048e02828077cf7757d3d142241429238893b91d529af29a2e8cc5623b"
-- 
1.7.6.4



