Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5192D7817D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 23:58:55 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 1528_395b_2647cc40_930f_41b9_9012_7ad4791ced25;
	Fri, 26 May 2017 08:58:53 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 13EF1AC00C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 08:58:53 +0900 (JST)
Received: from g01jpexchkw34.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	E56D769268E for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 08:58:51 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw34.g01.fujitsu.local (10.0.193.49) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 26 May 2017 08:58:51 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 09:00:06 +0900
Message-ID: <1495756806-1666-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] ghostscript: Upgrade 9.20 to 9.21
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
X-List-Received-Date: Thu, 25 May 2017 23:58:57 -0000
Content-Type: text/plain

1) Upgrade ghostscript from 9.20 to 9.21
2) Delete the unnecessary patch (CVE-2016-10219, CVE-2016-20220, CVE-2016-8602)
   Which has been modified in 9.21
3) Modify the two patch files rebase 9.21

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../ghostscript/ghostscript/CVE-2016-10219.patch   | 49 -----------
 .../ghostscript/ghostscript/CVE-2016-10220.patch   | 55 ------------
 .../ghostscript/ghostscript/CVE-2016-8602.patch    | 47 ----------
 .../ghostscript-9.02-prevent_recompiling.patch     | 99 ----------------------
 ...tscript-native-fix-disable-system-libtiff.patch | 37 --------
 .../{ghostscript_9.20.bb => ghostscript_9.21.bb}   | 13 ++-
 6 files changed, 5 insertions(+), 295 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.20.bb => ghostscript_9.21.bb} (88%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
deleted file mode 100644
index 574abe0..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 4bef1a1d32e29b68855616020dbff574b9cda08f Mon Sep 17 00:00:00 2001
-From: Robin Watts <Robin.Watts@artifex.com>
-Date: Thu, 29 Dec 2016 15:57:43 +0000
-Subject: [PATCH] Bug 697453: Avoid divide by 0 in scan conversion code.
-
-Arithmetic overflow due to extreme values in the scan conversion
-code can cause a division by 0.
-
-Avoid this with a simple extra check.
-
-  dx_old=cf814d81
-  endp->x_next=b0e859b9
-  alp->x_next=8069a73a
-
-leads to dx_den = 0
-
-Upstream-Status: Backport
-CVE: CVE-2016-10219
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- base/gxfill.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/base/gxfill.c b/base/gxfill.c
-index 99196c0..2f81bb0 100644
---- a/base/gxfill.c
-+++ b/base/gxfill.c
-@@ -1741,7 +1741,7 @@ intersect(active_line *endp, active_line *alp, fixed y, fixed y1, fixed *p_y_new
-     fixed dx_old = alp->x_current - endp->x_current;
-     fixed dx_den = dx_old + endp->x_next - alp->x_next;
- 
--    if (dx_den <= dx_old)
-+    if (dx_den <= dx_old || dx_den == 0)
-         return false; /* Intersection isn't possible. */
-     dy = y1 - y;
-     if_debug3('F', "[F]cross: dy=%g, dx_old=%g, dx_new=%g\n",
-@@ -1750,7 +1750,7 @@ intersect(active_line *endp, active_line *alp, fixed y, fixed y1, fixed *p_y_new
-     /* Do the computation in single precision */
-     /* if the values are small enough. */
-     y_new =
--        ((dy | dx_old) < 1L << (size_of(fixed) * 4 - 1) ?
-+        (((ufixed)(dy | dx_old)) < (1L << (size_of(fixed) * 4 - 1)) ?
-          dy * dx_old / dx_den :
-          (INCR_EXPR(mq_cross), fixed_mult_quo(dy, dx_old, dx_den)))
-         + y;
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
deleted file mode 100644
index 5e1e8ba..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From daf85701dab05f17e924a48a81edc9195b4a04e8 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <ken.sharp@artifex.com>
-Date: Wed, 21 Dec 2016 16:54:14 +0000
-Subject: [PATCH] fix crash with bad data supplied to makeimagedevice
-
-Bug #697450 "Null pointer dereference in gx_device_finalize()"
-
-The problem here is that the code to finalise a device unconditionally
-frees the icc_struct member of the device structure. However this
-particular (weird) device is not setup as a normal device, probably
-because its very, very ancient. Its possible for the initialisation
-of the device to abort with an error before calling gs_make_mem_device()
-which is where the icc_struct member gets allocated (or set to NULL).
-
-If that happens, then the cleanup code tries to free the device, which
-calls finalize() which tries to free a garbage pointer.
-
-Setting the device memory to 0x00 after we allocate it means that the
-icc_struct member will be NULL< and our memory manager allows for that
-happily enough, which avoids the problem.
-
-Upstream-Status: Backport
-CVE: CVE-2016-10220
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- base/gsdevmem.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/base/gsdevmem.c b/base/gsdevmem.c
-index 97b9cf4..fe75bcc 100644
---- a/base/gsdevmem.c
-+++ b/base/gsdevmem.c
-@@ -225,6 +225,18 @@ gs_makewordimagedevice(gx_device ** pnew_dev, const gs_matrix * pmat,
- 
-     if (pnew == 0)
-         return_error(gs_error_VMerror);
-+
-+    /* Bug #697450 "Null pointer dereference in gx_device_finalize()"
-+     * If we have incorrect data passed to gs_initialise_wordimagedevice() then the
-+     * initialisation will fail, crucially it will fail *before* it calls
-+     * gs_make_mem_device() which initialises the device. This means that the
-+     * icc_struct member will be uninitialsed, but the device finalise method
-+     * will unconditionally free that memory. Since its a garbage pointer, bad things happen.
-+     * Apparently we do still need makeimagedevice to be available from
-+     * PostScript, so in here just zero the device memory, which means that
-+     * the finalise routine won't have a problem.
-+     */
-+    memset(pnew, 0x00, st_device_memory.ssize);
-     code = gs_initialize_wordimagedevice(pnew, pmat, width, height,
-                                          colors, num_colors, word_oriented,
-                                          page_device, mem);
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
deleted file mode 100644
index e58567c..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f5c7555c30393e64ec1f5ab0dfae5b55b3b3fc78 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Sat, 8 Oct 2016 16:10:27 +0100
-Subject: [PATCH] Bug 697203: check for sufficient params in .sethalftone5
-
-and param types
-
-Upstream-Status: Backport
-CVE: CVE-2016-8602
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- psi/zht2.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/psi/zht2.c b/psi/zht2.c
-index fb4a264..dfa27a4 100644
---- a/psi/zht2.c
-+++ b/psi/zht2.c
-@@ -82,14 +82,22 @@ zsethalftone5(i_ctx_t *i_ctx_p)
-     gs_memory_t *mem;
-     uint edepth = ref_stack_count(&e_stack);
-     int npop = 2;
--    int dict_enum = dict_first(op);
-+    int dict_enum;
-     ref rvalue[2];
-     int cname, colorant_number;
-     byte * pname;
-     uint name_size;
-     int halftonetype, type = 0;
-     gs_gstate *pgs = igs;
--    int space_index = r_space_index(op - 1);
-+    int space_index;
-+
-+    if (ref_stack_count(&o_stack) < 2)
-+        return_error(gs_error_stackunderflow);
-+    check_type(*op, t_dictionary);
-+    check_type(*(op - 1), t_dictionary);
-+
-+    dict_enum = dict_first(op);
-+    space_index = r_space_index(op - 1);
- 
-     mem = (gs_memory_t *) idmemory->spaces_indexed[space_index];
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
deleted file mode 100644
index e709195..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Just use commands provided by ghostscript-native, preventing recompile them when
-compile ghostscript.
-Way to enable cross compile.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
-Rebase to 9.19
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/unix-aux.mak | 64 +++++++++++++++++++++++++++----------------------------
- 1 file changed, 32 insertions(+), 32 deletions(-)
-
-diff --git a/base/unix-aux.mak b/base/unix-aux.mak
-index 0110667..e2eb1a1 100644
---- a/base/unix-aux.mak
-+++ b/base/unix-aux.mak
-@@ -71,44 +71,44 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
- 
- # -------------------------- Auxiliary programs --------------------------- #
- 
--$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
--
-+#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
-+#
- # On the RS/6000 (at least), compiling genarch.c with gcc with -O
- # produces a buggy executable.
--$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
--
--$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
--
--$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
--
--$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
--
-+#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
-+#
-+#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
-+#
-+#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
-+#
-+#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
-+#
- # To get GS to use the system zlib, you remove/hide the gs/zlib directory
- # which means that the mkromfs build can't find the zlib source it needs.
- # So it's split into two targets, one using the zlib source directly.....
--MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-- $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
--
--$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
--
-+#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-+# $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-+# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
-+#
-+#$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
-+#
- # .... and one using the zlib library linked via the command line
--MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
-- $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-- $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
--
--$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
--
--$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
-+#MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
-+# $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-+# $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-+# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
-+#
-+#$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
-+#
-+#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
- 
- # Query the environment to construct gconfig_.h.
- # These are all defined conditionally (except the JasPER one), so that
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
deleted file mode 100644
index 9158117..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-ghostscript-native:fix disable-system-libtiff
-
-Modify configure to add the check to make sure
-ghostscrip could work while system-libtiff is
-disabled.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Pending
----
- configure.ac | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -1055,6 +1055,7 @@ Disabling tiff output devices.])
- esac
- 
- if test $SHARE_LIBTIFF -eq 0; then
-+    if test -e $LIBTIFFDIR/configure; then
-       echo
-       echo "Running libtiff configure script..."
-       olddir=`pwd`
-@@ -1069,6 +1070,10 @@ if test $SHARE_LIBTIFF -eq 0; then
-       cd "$olddir"
-       echo
-       echo "Continuing with Ghostscript configuration..."
-+    else
-+      AC_MSG_NOTICE([Could not find local copy of libtiff.
-+Disabling tiff output devices.])
-+    fi
- fi
- 
- AC_SUBST(SHARE_LIBTIFF)
--- 
-1.8.1.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
similarity index 88%
rename from meta/recipes-extended/ghostscript/ghostscript_9.20.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index 30591c9..4858770 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -19,7 +19,7 @@ DEPENDS_class-native = "libpng-native"
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs920/${BPN}-${PV}.tar.gz \
+SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/${BPN}-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
@@ -27,25 +27,22 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-           file://ghostscript-9.02-prevent_recompiling.patch \
+           file://0001-ghostscript-prevent-recompiling.patch \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
            file://CVE-2017-7207.patch \
-           file://CVE-2016-10219.patch \
-           file://CVE-2016-10220.patch \
            file://CVE-2017-5951.patch \
-           file://CVE-2016-8602.patch \
            file://CVE-2017-7975.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-                        file://ghostscript-native-fix-disable-system-libtiff.patch \
+                        file://0001-ghostscript-native-fix-disable-system-libtiff.patch \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "93c5987cd3ab341108be1ebbaadc24fe"
-SRC_URI[sha256sum] = "949b64b46ecf8906db54a94ecf83ab97534ebf946f770d3c3f283cb469cb6e14"
+SRC_URI[md5sum] = "5f213281761d2750fcf27476c404d17f"
+SRC_URI[sha256sum] = "02bceadbc4dddeb6f2eec9c8b1623d945d355ca11b8b4df035332b217d58ce85"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
-- 
1.9.1


