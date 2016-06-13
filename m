Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41BF46FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D9Gfmb026853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 02:16:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:27 -0400
Message-ID: <15f62fb6763b2cfe6314f5d171b1c265fe50bc50.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] ghostscript: upgrade to 9.19
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:41 -0000
Content-Type: text/plain

- Ghostscript and GhostPDL releases from version 9.19 have been moved to GitHub
  hosting, tweak download site

- Drop 0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch, and
  0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch, ghostscript
  9.19 has fixed them.

- Fix QA Warning unrecognised options: --enable-little-endian. It use AC_C_BIGENDIAN
  to detect big/little endian.
  http://www.delorie.com/gnu/docs/autoconf/autoconf_64.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...Fix-support-for-building-with-no-jbig2-de.patch |  81 ----------------
 ...part-2-fix-support-for-building-with-a-JP.patch |  48 ----------
 .../files/do-not-check-local-libpng-source.patch   |   8 +-
 .../ghostscript-9.02-prevent_recompiling.patch     | 105 ++++++++++-----------
 .../ghostscript/ghostscript/png_mak.patch          |  27 ++++--
 .../{ghostscript_9.18.bb => ghostscript_9.19.bb}   |   9 +-
 6 files changed, 78 insertions(+), 200 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.18.bb => ghostscript_9.19.bb} (86%)

diff --git a/meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch b/meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
deleted file mode 100644
index d586a1d..0000000
--- a/meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 1d19998091154f89b8294e4594a05986b4c2f822 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Wed, 13 Jan 2016 02:08:42 -0500
-Subject: [PATCH 1/2] Bug 696497: Fix support for building with no jbig2
- decoder
-
-Author: Chris Liddell <chris.liddell@artifex.com>
-
-Upstream-Status: Backport
-http://bugs.ghostscript.com/show_bug.cgi?id=696497
-http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=b0f5a975
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/lib.mak |  9 +++++++++
- psi/int.mak  | 23 ++++++++++++++++++-----
- 2 files changed, 27 insertions(+), 5 deletions(-)
-
-diff --git a/base/lib.mak b/base/lib.mak
-index 241df2f..daa7056 100644
---- a/base/lib.mak
-+++ b/base/lib.mak
-@@ -1732,6 +1732,10 @@ $(GLD)sjbig2_jbig2dec.dev : $(LIB_MAK) $(ECHOGS_XE) \
- 	$(SETMOD) $(GLD)sjbig2_jbig2dec $(sjbig2_jbig2dec)
- 	$(ADDMOD) $(GLD)sjbig2_jbig2dec -include $(GLD)jbig2dec.dev
- 
-+$(GLD)sjbig2_.dev : $(LIB_MAK) $(ECHOGS_XE) \
-+  $(LIB_MAK) $(MAKEDIRS)
-+	$(SETMOD) $(GLD)sjbig2_
-+
- # jbig2dec.dev is defined in jbig2.mak
- 
- $(GLOBJ)sjbig2.$(OBJ) : $(GLSRC)sjbig2.c $(AK) \
-@@ -1739,6 +1743,11 @@ $(GLOBJ)sjbig2.$(OBJ) : $(GLSRC)sjbig2.c $(AK) \
-  $(sjbig2_h) $(strimpl_h) $(MAKEDIRS)
- 	$(GLJBIG2CC) $(GLO_)sjbig2.$(OBJ) $(C_) $(GLSRC)sjbig2.c
- 
-+$(GLOBJ)snojbig2.$(OBJ) : $(GLSRC)snojbig2.c $(AK) \
-+ $(stdint__h) $(memory__h) $(stdio__h) $(gserrors_h) $(gdebug_h) \
-+ $(strimpl_h) $(LIB_MAK) $(MAKEDIRS)
-+	$(GLJBIG2CC) $(GLO_)snojbig2.$(OBJ) $(C_) $(GLSRC)snojbig2.c
-+
- # luratech version
- sjbig2_luratech=$(GLOBJ)sjbig2_luratech.$(OBJ)
- 
-diff --git a/psi/int.mak b/psi/int.mak
-index 6149a3b..f9d667d 100644
---- a/psi/int.mak
-+++ b/psi/int.mak
-@@ -1254,11 +1254,24 @@ $(PSOBJ)zfaes.$(OBJ) : $(PSSRC)zfaes.c $(OP) $(memory__h)\
- # this can be turned on and off with a FEATURE_DEV
- 
- fjbig2_=$(PSOBJ)zfjbig2_$(JBIG2_LIB).$(OBJ)
--$(PSD)jbig2.dev : $(INT_MAK) $(ECHOGS_XE) $(fjbig2_) $(GLD)sjbig2.dev\
-- $(MAKEDIRS)
--	$(SETMOD) $(PSD)jbig2 $(fjbig2_)
--	$(ADDMOD) $(PSD)jbig2 -include $(GLD)sjbig2
--	$(ADDMOD) $(PSD)jbig2 -oper zfjbig2
-+
-+$(PSD)jbig2_jbig2dec.dev : $(ECHOGS_XE) $(fjbig2_) $(GLD)sjbig2.dev\
-+ $(INT_MAK) $(MAKEDIRS)
-+	$(SETMOD) $(PSD)jbig2_jbig2dec $(fjbig2_)
-+	$(ADDMOD) $(PSD)jbig2_jbig2dec -include $(GLD)sjbig2
-+	$(ADDMOD) $(PSD)jbig2_jbig2dec -oper zfjbig2
-+
-+$(PSD)jbig2_luratech.dev : $(ECHOGS_XE) $(fjbig2_) $(GLD)sjbig2.dev\
-+ $(INT_MAK) $(MAKEDIRS)
-+	$(SETMOD) $(PSD)jbig2_luratech $(fjbig2_)
-+	$(ADDMOD) $(PSD)jbig2_luratech -include $(GLD)sjbig2
-+	$(ADDMOD) $(PSD)jbig2_luratech -oper zfjbig2
-+
-+$(PSD)jbig2_.dev : $(ECHOGS_XE) $(INT_MAK) $(MAKEDIRS)
-+	$(SETMOD) $(PSD)jbig2_ 
-+
-+$(PSD)jbig2.dev : $(PSD)jbig2_$(JBIG2_LIB).dev $(INT_MAK) $(MAKEDIRS)
-+	$(CP_) $(PSD)jbig2_$(JBIG2_LIB).dev $(PSD)jbig2.dev
- 
- $(PSOBJ)zfjbig2_jbig2dec.$(OBJ) : $(PSSRC)zfjbig2.c $(OP) $(memory__h)\
-  $(gsstruct_h) $(gstypes_h) $(ialloc_h) $(idict_h) $(ifilter_h)\
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch b/meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
deleted file mode 100644
index fcfc479..0000000
--- a/meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3b43f93ec02611c4d554612953f5b64765b8683b Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Wed, 13 Jan 2016 02:14:55 -0500
-Subject: [PATCH 2/2] Bug 696497 (part 2): fix support for building with a JPX
- decoder
-
-Author: Chris Liddell <chris.liddell@artifex.com>
-
-Upstream-Status: Backport
-http://bugs.ghostscript.com/show_bug.cgi?id=696497
-http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=b0f5a975
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/lib.mak | 3 +++
- psi/int.mak  | 3 +++
- 2 files changed, 6 insertions(+)
-
-diff --git a/base/lib.mak b/base/lib.mak
-index daa7056..8853dd5 100644
---- a/base/lib.mak
-+++ b/base/lib.mak
-@@ -1774,6 +1774,9 @@ $(GLOBJ)sjpx.$(OBJ) : $(GLSRC)sjpx.c $(AK) \
-  $(gdebug_h) $(strimpl_h) $(sjpx_h) $(MAKEDIRS)
- 	$(GLJASCC) $(GLO_)sjpx.$(OBJ) $(C_) $(GLSRC)sjpx.c
- 
-+$(GLD)sjpx_.dev : $(LIB_MAK) $(ECHOGS_XE) $(LIB_MAK) $(MAKEDIRS)
-+	$(SETMOD) $(GLD)sjpx_
-+
- # luratech version
- sjpx_luratech=$(GLOBJ)sjpx_luratech.$(OBJ)
- $(GLD)sjpx_luratech.dev : $(LIB_MAK) $(ECHOGS_XE) \
-diff --git a/psi/int.mak b/psi/int.mak
-index f9d667d..db01b65 100644
---- a/psi/int.mak
-+++ b/psi/int.mak
-@@ -1290,6 +1290,9 @@ $(PSD)jpx.dev : $(INT_MAK) $(ECHOGS_XE) $(PSD)jpx_$(JPX_LIB).dev\
-  $(MAKEDIRS)
- 	$(CP_) $(PSD)jpx_$(JPX_LIB).dev $(PSD)jpx.dev
- 
-+$(PSD)jpx_.dev : $(ECHOGS_XE) $(INT_MAK) $(MAKEDIRS)
-+	$(SETMOD) $(PSD)jpx_
-+
- fjpx_luratech=$(PSOBJ)zfjpx_luratech.$(OBJ)
- 
- $(PSOBJ)zfjpx.$(OBJ) : $(PSSRC)zfjpx.c $(OP) $(memory__h)\
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
index b445a6c..c3e44fe 100644
--- a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
+++ b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
@@ -16,17 +16,17 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ab30a97..b762fd7 100644
+index bf6d3f5..01df03f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -955,11 +955,11 @@ AC_SUBST(ZLIBDIR)
+@@ -930,11 +930,11 @@ AC_SUBST(ZLIBDIR)
  AC_SUBST(FT_SYS_ZLIB)
  
  dnl png for the png output device; it also requires zlib
 -LIBPNGDIR=src
 +LIBPNGDIR=$srcdir/libpng
  PNGDEVS=''
- PNGDEVS_ALL='png48 png16m pnggray pngmono png256 png16 pngalpha'
+ PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16 pngalpha'
  AC_MSG_CHECKING([for local png library source])
 -if test -f $srcdir/libpng/pngread.c; then
 +if false; then
@@ -34,5 +34,5 @@ index ab30a97..b762fd7 100644
          SHARE_LIBPNG=0
          LIBPNGDIR=$srcdir/libpng
 -- 
-1.9.1
+2.8.1
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
index bc29be5..e709195 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
@@ -1,4 +1,4 @@
-ust use commands provided by ghostscript-native, preventing recompile them when
+Just use commands provided by ghostscript-native, preventing recompile them when
 compile ghostscript.
 Way to enable cross compile.
 
@@ -7,94 +7,93 @@ Upstream-Status: Pending
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
+Rebase to 9.19
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/unix-aux.mak | 64 +++++++++++++++++++++++++++----------------------------
+ 1 file changed, 32 insertions(+), 32 deletions(-)
+
 diff --git a/base/unix-aux.mak b/base/unix-aux.mak
-index a91fb26..c991d11 100644
+index 0110667..e2eb1a1 100644
 --- a/base/unix-aux.mak
 +++ b/base/unix-aux.mak
-@@ -69,46 +69,46 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
-  $(MAKEDIRS)
- 	$(GLCC) $(GLO_)gp_sysv.$(OBJ) $(C_) $(GLSRC)gp_sysv.c
+@@ -71,44 +71,44 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
  
--# -------------------------- Auxiliary programs --------------------------- #
--
--$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(MAKEDIRS)
+ # -------------------------- Auxiliary programs --------------------------- #
+ 
+-$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
 -
--# On the RS/6000 (at least), compiling genarch.c with gcc with -O
--# produces a buggy executable.
--$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(MAKEDIRS)
++#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
++#
+ # On the RS/6000 (at least), compiling genarch.c with gcc with -O
+ # produces a buggy executable.
+-$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
 -
--$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(MAKEDIRS)
+-$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
 -
--$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(MAKEDIRS)
+-$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
 -
--$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(MAKEDIRS)
+-$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 -	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
 -
--# To get GS to use the system zlib, you remove/hide the gs/zlib directory
--# which means that the mkromfs build can't find the zlib source it needs.
--# So it's split into two targets, one using the zlib source directly.....
--MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-- $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
--
--$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
--
--# .... and one using the zlib library linked via the command line
--MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
-- $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-- $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
--
--$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
--
--$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(MAKEDIRS)
--	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
-+## -------------------------- Auxiliary programs --------------------------- #
-+#
-+#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(MAKEDIRS)
-+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
-+#
-+## On the RS/6000 (at least), compiling genarch.c with gcc with -O
-+## produces a buggy executable.
-+#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(MAKEDIRS)
++#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
 +#
-+#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(MAKEDIRS)
++#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
 +#
-+#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(MAKEDIRS)
++#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
 +#
-+#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(MAKEDIRS)
++#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
 +#
-+## To get GS to use the system zlib, you remove/hide the gs/zlib directory
-+## which means that the mkromfs build can't find the zlib source it needs.
-+## So it's split into two targets, one using the zlib source directly.....
+ # To get GS to use the system zlib, you remove/hide the gs/zlib directory
+ # which means that the mkromfs build can't find the zlib source it needs.
+ # So it's split into two targets, one using the zlib source directly.....
+-MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
+- $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
+- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
+-
+-$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
+-	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
+-
 +#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
 +# $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
 +# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
 +#
-+#$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(MAKEDIRS)
++#$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
 +#
-+## .... and one using the zlib library linked via the command line
+ # .... and one using the zlib library linked via the command line
+-MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
+- $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
+- $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
+- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
+-
+-$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
+-	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
+-
+-$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
+-	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
 +#MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
 +# $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
 +# $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
 +# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
 +#
-+#$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(MAKEDIRS)
++#$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
 +#
-+#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(MAKEDIRS)
++#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
 +#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
  
  # Query the environment to construct gconfig_.h.
  # These are all defined conditionally (except the JasPER one), so that
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch b/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
index da900ea..8b84986 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
@@ -1,21 +1,32 @@
 ghostscript: add dependency for pnglibconf.h
-    
+
 When using parallel make jobs, we need to be sure that
 pnglibconf.h is created before we try to reference it,
 so add a rule to png.mak.
 
 Upstream-Status: Pending
-    
+
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
+Rebase to 9.19
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/png.mak | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/base/png.mak b/base/png.mak
+index fe5c6e2..8abb53a 100644
 --- a/base/png.mak
 +++ b/base/png.mak
-@@ -81,6 +81,8 @@ png.config-clean :
- $(pnglibconf_h) : $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt
- 	$(CP_)  $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt $(pnglibconf_h)
+@@ -74,6 +74,8 @@ png.clean-not-config-clean :
+ 
+ pnglibconf_h=$(PNGGENDIR)$(D)pnglibconf.h
  
 +$(MAKEDIRS) : $(pnglibconf_h)
 +
- PDEP=$(AK) $(pnglibconf_h) $(MAKEDIRS)
- 
- png_1=$(PNGOBJ)png.$(OBJ) $(PNGOBJ)pngmem.$(OBJ) $(PNGOBJ)pngerror.$(OBJ) $(PNGOBJ)pngset.$(OBJ)
+ png.config-clean :
+ 	$(RM_) $(pnglibconf_h)
+ 	$(RM_) $(PNGGEN)lpg*.dev
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb b/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
similarity index 86%
rename from meta/recipes-extended/ghostscript/ghostscript_9.18.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.19.bb
index eddf18d..fe2016b 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
@@ -18,12 +18,10 @@ DEPENDS_class-native = "libpng-native"
 
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 
-SRC_URI_BASE = "http://downloads.ghostscript.com/public/old-gs-releases/ghostscript-${PV}.tar.gz \
+SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919/${BPN}-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
-                file://0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch \
-                file://0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch \
                 file://do-not-check-local-libpng-source.patch \
 "
 
@@ -39,14 +37,13 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "33a47567d7a591c00a253caddd12a88a"
-SRC_URI[sha256sum] = "5fc93079749a250be5404c465943850e3ed5ffbc0d5c07e10c7c5ee8afbbdb1b"
+SRC_URI[md5sum] = "c9682ce6b852f9197c69905a43928907"
+SRC_URI[sha256sum] = "cf3c0dce67db1557a87366969945f9c5235887989c0b585e037af366dc035989"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
                 --with-cups-datadir=${datadir}/cups \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--enable-little-endian', '--enable-big-endian', d)} \
                 "
 
 EXTRA_OECONF_append_mips = " --with-large_color_index=0"
-- 
2.8.1


