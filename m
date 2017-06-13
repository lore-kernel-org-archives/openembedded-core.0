Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 734B1782B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 19:50:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5DJoR0p027968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 12:50:28 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Jun 2017 12:50:27 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Jun 2017 12:50:25 -0700
Message-ID: <1497383427-31099-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [v3][PATCH 1/3] ghostscript: move to version 9.21
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
X-List-Received-Date: Tue, 13 Jun 2017 19:50:27 -0000
Content-Type: text/plain

Eliminate CVE patches that are now in source.  Add CVE-2017-7975
patch.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ghostscript/ghostscript/CVE-2016-10219.patch   | 49 -------------------
 .../ghostscript/ghostscript/CVE-2016-10220.patch   | 55 ----------------------
 .../ghostscript/ghostscript/CVE-2016-8602.patch    | 47 ------------------
 .../ghostscript/ghostscript/CVE-2017-7975.patch    | 23 ++++-----
 ...t-9.21-native-fix-disable-system-libtiff.patch} | 22 ++++-----
 ... => ghostscript-9.21-prevent_recompiling.patch} | 25 +++++-----
 .../{ghostscript_9.20.bb => ghostscript_9.21.bb}   | 13 ++---
 7 files changed, 39 insertions(+), 195 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-native-fix-disable-system-libtiff.patch => ghostscript-9.21-native-fix-disable-system-libtiff.patch} (67%)
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-9.02-prevent_recompiling.patch => ghostscript-9.21-prevent_recompiling.patch} (81%)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.20.bb => ghostscript_9.21.bb} (89%)

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
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
index d0886c9..e406086 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
@@ -1,6 +1,7 @@
-From 5e57e483298dae8b8d4ec9aab37a526736ac2e97 Mon Sep 17 00:00:00 2001
-From: Shailesh Mistry <shailesh.mistry@hotmail.co.uk>
-Date: Wed, 26 Apr 2017 22:12:14 +0100
+From b39be1019b4acc1aa50c6026463c543332e95a31 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Mon, 8 May 2017 16:18:14 +0300
+
 Subject: [PATCH] Bug 697693: Prevent SEGV due to integer overflow.
 
 While building a Huffman table, the start and end points were susceptible
@@ -12,15 +13,17 @@ Upstream-Status: Backport
 CVE: CVE-2017-7975
 
 Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- jbig2dec/jbig2_huffman.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/jbig2dec/jbig2_huffman.c b/jbig2dec/jbig2_huffman.c
-index 511e461..b4189a1 100644
+Contents of this patch were extracted from a larger patch which addressed
+two CVE's.  The context (location of {) was also modified to apply to
+ghostscript 9.21.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
 --- a/jbig2dec/jbig2_huffman.c
 +++ b/jbig2dec/jbig2_huffman.c
-@@ -421,8 +421,8 @@ jbig2_build_huffman_table(Jbig2Ctx *ctx, const Jbig2HuffmanParams *params)
+@@ -421,8 +421,8 @@ jbig2_build_huffman_table(Jbig2Ctx *ctx,
  
              if (PREFLEN == CURLEN) {
                  int RANGELEN = lines[CURTEMP].RANGELEN;
@@ -31,6 +34,4 @@ index 511e461..b4189a1 100644
                  byte eflags = 0;
  
                  if (end_j > max_j) {
--- 
-2.10.2
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
similarity index 67%
rename from meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
rename to meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
index 9158117..bff3e61 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
@@ -5,23 +5,26 @@ ghostscrip could work while system-libtiff is
 disabled.
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Updated to apply to ghostscript 9.21.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
 Upstream-Status: Pending
----
- configure.ac | 5 +++++
- 1 file changed, 5 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
+
+
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1055,6 +1055,7 @@ Disabling tiff output devices.])
+@@ -1259,6 +1259,7 @@ case "x$with_system_libtiff" in
  esac
  
- if test $SHARE_LIBTIFF -eq 0; then
+ if test x"$SHARE_LIBTIFF" = x"0" ; then
 +    if test -e $LIBTIFFDIR/configure; then
-       echo
        echo "Running libtiff configure script..."
        olddir=`pwd`
-@@ -1069,6 +1070,10 @@ if test $SHARE_LIBTIFF -eq 0; then
+       if ! test -d "$LIBTIFFCONFDIR" ; then
+@@ -1272,6 +1273,10 @@ if test x"$SHARE_LIBTIFF" = x"0" ; then
        cd "$olddir"
        echo
        echo "Continuing with Ghostscript configuration..."
@@ -32,6 +35,3 @@ diff --git a/configure.ac b/configure.ac
  fi
  
  AC_SUBST(SHARE_LIBTIFF)
--- 
-1.8.1.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
similarity index 81%
rename from meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
rename to meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
index e709195..f2c6d04 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
@@ -9,15 +9,13 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 9.19
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/unix-aux.mak | 64 +++++++++++++++++++++++++++----------------------------
- 1 file changed, 32 insertions(+), 32 deletions(-)
 
-diff --git a/base/unix-aux.mak b/base/unix-aux.mak
-index 0110667..e2eb1a1 100644
+Rebase to 9.21
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
 --- a/base/unix-aux.mak
 +++ b/base/unix-aux.mak
-@@ -71,44 +71,44 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
+@@ -66,45 +66,45 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.
  
  # -------------------------- Auxiliary programs --------------------------- #
  
@@ -61,14 +59,14 @@ index 0110667..e2eb1a1 100644
 - $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
 -
 -$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
+-	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
 -
 +#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
 +# $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
 +# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
 +#
 +#$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
++#	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
 +#
  # .... and one using the zlib library linked via the command line
 -MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
@@ -77,23 +75,22 @@ index 0110667..e2eb1a1 100644
 - $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
 -
 -$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
+-	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
 -
 -$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
+-
 +#MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
 +# $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
 +# $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
 +# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
 +#
 +#$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
-+#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
++#	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
 +#
 +#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
- 
++#
  # Query the environment to construct gconfig_.h.
  # These are all defined conditionally (except the JasPER one), so that
--- 
-2.8.1
-
+ # they can be overridden by settings from the configure script.
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
similarity index 89%
rename from meta/recipes-extended/ghostscript/ghostscript_9.20.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index 2e6feff..9a2e107 100644
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
@@ -27,15 +27,12 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-           file://ghostscript-9.02-prevent_recompiling.patch \
+           file://ghostscript-9.21-prevent_recompiling.patch \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
            file://CVE-2017-7207.patch \
-           file://CVE-2016-10219.patch \
-           file://CVE-2016-10220.patch \
            file://CVE-2017-5951.patch \
-           file://CVE-2016-8602.patch \
            file://CVE-2017-7975.patch \
            file://CVE-2016-7977.patch \
            file://CVE-2016-7978.patch \
@@ -44,12 +41,12 @@ SRC_URI = "${SRC_URI_BASE} \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-                        file://ghostscript-native-fix-disable-system-libtiff.patch \
+                        file://ghostscript-9.21-native-fix-disable-system-libtiff.patch \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "93c5987cd3ab341108be1ebbaadc24fe"
-SRC_URI[sha256sum] = "949b64b46ecf8906db54a94ecf83ab97534ebf946f770d3c3f283cb469cb6e14"
+SRC_URI[md5sum] = "5f213281761d2750fcf27476c404d17f"
+SRC_URI[sha256sum] = "02bceadbc4dddeb6f2eec9c8b1623d945d355ca11b8b4df035332b217d58ce85"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
-- 
2.7.4


