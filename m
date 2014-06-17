Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDB566FF86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 11:03:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5HB3Krf029775
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 04:03:20 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Jun 2014 04:03:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 19:03:02 +0800
Message-ID: <81700b24af81941d2e03a26087f8449e54de97f2.1403000537.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1403000534.git.hongxu.jia@windriver.com>
References: <cover.1403000534.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] ghostscript: upgrade to 9.14
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
X-List-Received-Date: Tue, 17 Jun 2014 11:03:27 -0000
Content-Type: text/plain

- The LICENSE added AGPL for the font files (in Resource/Font);

- Rebase ghostscript-9.02-parallel-make.patch to 9.14

- Rebase ghostscript-native-fix-disable-system-libtiff.patch
  since base/configure.ac has been moved to configure.ac.
  http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=f1488c5aff54f37ee67759827d4298592af5dbc8

- Obsolete ghostscript-9.05-NOT-check-endian.patch, and add option
  '--enable-little-endian'/'--enable-big-endian' conditionally to
  intead.
  http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=e76dc46756e89a14a3348bce12a633d32e4fa831

- Add base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
  for native, since the upstream replace all fopen calls with
  gp_fopen and add a preprocessor define so that any unintential
  calls directly to fopen will cause an error. This patch add a
  preprocessor define to allow fopen calling in base/genht.c as
  exceptions.
  http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=773c69e46e70bdd5482676437dafd2ca83397643

- Remove package ghostscript-cups, since CUPS filters
  gstoraster and gstopxl has been moved to cups-filters
  which is a free software package hosted by OpenPrinting.
  http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=9304a21699a6c17579fae32f44f5c92a37c13e2d
  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...c-add-a-preprocessor-define-to-allow-fope.patch |  36 ++++++
 .../ghostscript-9.02-parallel-make.patch           | 144 ++++++++++-----------
 .../ghostscript-9.05-NOT-check-endian.patch        |  44 -------
 ...tscript-native-fix-disable-system-libtiff.patch |  45 +++----
 .../{ghostscript_9.07.bb => ghostscript_9.14.bb}   |  42 ++----
 5 files changed, 132 insertions(+), 179 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.07.bb => ghostscript_9.14.bb} (70%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch b/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
new file mode 100644
index 0000000..d97d4ec
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
@@ -0,0 +1,36 @@
+base/genht.c: add a preprocessor define to allow fopen calling
+
+The commit in upstream:
+http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=773c69e46e70bdd5482676437dafd2ca83397643
+
+Replace all fopen calls with gp_fopen and add a preprocessor define so
+that any unintential calls directly to fopen will cause an error.
+
+Only exceptions are those in the platform specific code, and mkromfs.c.
+This patch add a preprocessor define to allow fopen calling in base/genht.c.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/genht.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/base/genht.c b/base/genht.c
+index 4b04085..cc82fff 100644
+--- a/base/genht.c
++++ b/base/genht.c
+@@ -16,6 +16,10 @@
+ 
+ /* Generate C code for compiling halftones into ROM. */
+ #include "malloc_.h"
++
++/* prevent gp.h from defining fopen */
++#define fopen fopen
++
+ #include "stdio_.h"
+ #include "string_.h"
+ #include "gscdefs.h"
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
index ec37307..601f5f1 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
@@ -10,6 +10,8 @@ RP: Extended || true to all CP_ operations, they all can race e.g.:
 | cp -f ./obj/gconfxx.h ./obj/gconfig.h
 | cp: cannot create regular file `./obj/gconfig.h': File exists
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 diff --git a/base/expat.mak b/base/expat.mak
 index 4ee9c8c..2e16a9d 100644
 --- a/base/expat.mak
@@ -37,7 +39,7 @@ index 16f2b95..409f75b 100644
  # Define the shared version.
  $(FTGEN)freetype_1.dev : $(TOP_MAKEFILES) $(FT_MAK) $(ECHOGS_XE)
 diff --git a/base/gs.mak b/base/gs.mak
-index b804a3e..a343190 100644
+index 7d75fb0..2a9596c 100644
 --- a/base/gs.mak
 +++ b/base/gs.mak
 @@ -433,7 +433,7 @@ $(gconfxx_h) : $(ld_tr)
@@ -408,7 +410,7 @@ index 0f09a3a..36495dd 100644
  # Define the compiled in target
  $(JPEGXR_GEN)jpegxr_0.dev : $(JPEGXR_MAK) $(ECHOGS_XE) $(jpegxr_objs)
 diff --git a/base/lcms.mak b/base/lcms.mak
-index dc7f9e5..2bccacd 100644
+index 18cfa09..269e7ff 100644
 --- a/base/lcms.mak
 +++ b/base/lcms.mak
 @@ -84,7 +84,7 @@ LCMSO_=$(O_)$(LCMSOBJ)
@@ -421,7 +423,7 @@ index dc7f9e5..2bccacd 100644
  # dev file for shared (separately built) lcms library
  $(LCMSGEN)lcms_1.dev : $(TOP_MAKEFILES) $(LCMS_MAK) $(ECHOGS_XE)
 diff --git a/base/lcms2.mak b/base/lcms2.mak
-index 4e25f2e..be29d06 100644
+index 52f750c..33a9c16 100644
 --- a/base/lcms2.mak
 +++ b/base/lcms2.mak
 @@ -85,7 +85,7 @@ LCMS2O_=$(O_)$(LCMS2OBJ)
@@ -481,7 +483,7 @@ index 0bfb3ac..fcdb170 100644
 +	$(CP_) $(LIBCUPSSRC)util.c $(LIBCUPSGEN)cups_util.c || true
  	$(LCUPS_CC) $(LCUPSO_)cups_util.$(OBJ) $(C_) $(LIBCUPSGEN)cups_util.c
 diff --git a/base/lcupsi.mak b/base/lcupsi.mak
-index ae1ecff..96d4003 100644
+index ea4047f..0102d93 100644
 --- a/base/lcupsi.mak
 +++ b/base/lcupsi.mak
 @@ -73,7 +73,7 @@ libcupsi.config-clean :
@@ -507,10 +509,10 @@ index 3f50892..97c76a0 100644
  # external link .dev
  $(LDF_JB2_GEN)ldf_jb2_1.dev : $(TOP_MAKEFILES) $(LDF_JB2_MAK) $(ECHOGS_XE)
 diff --git a/base/lib.mak b/base/lib.mak
-index 7c1677b..179fed0 100644
+index 3ad7db3..87b4f01 100644
 --- a/base/lib.mak
 +++ b/base/lib.mak
-@@ -328,7 +328,7 @@ md5_=$(GLOBJ)md5.$(OBJ)
+@@ -343,7 +343,7 @@ md5_=$(GLOBJ)md5.$(OBJ)
  $(GLOBJ)md5.$(OBJ) : $(GLSRC)md5.c $(AK) $(md5_h) $(std_h) $(MAKEDIRS) $(EXP)$(ECHOGS_XE)
  	$(EXP)$(ECHOGS_XE) -w $(GLGEN)md5.h -x 23 include -x 2022 memory_.h -x 22
  	$(EXP)$(ECHOGS_XE) -a $(GLGEN)md5.h -+R $(GLSRC)md5.h
@@ -519,7 +521,7 @@ index 7c1677b..179fed0 100644
  	$(GLCC) $(GLO_)md5.$(OBJ) $(C_) $(GLGEN)md5.c
  	$(RM_) $(GLGEN)md5.c $(GLGEN)md5.h
  
-@@ -598,19 +598,19 @@ $(GLOBJ)gconfig.$(OBJ) : $(gconfig_h) $(GLSRC)gconf.c $(AK) $(gx_h)\
+@@ -624,19 +624,19 @@ $(GLOBJ)gconfig.$(OBJ) : $(gconfig_h) $(GLSRC)gconf.c $(AK) $(gx_h)\
   $(gxdevice_h) $(gxiclass_h) $(gxiodev_h) $(gxiparam_h) $(TOP_MAKEFILES)\
   $(MAKEDDIRS)
  	$(RM_) $(GLGEN)gconfig.c
@@ -539,10 +541,10 @@ index 7c1677b..179fed0 100644
  	$(RM_) $(AUX)gscdefs.c
 -	$(CP_) $(GLSRC)gscdef.c $(AUX)gscdefs.c
 +	$(CP_) $(GLSRC)gscdef.c $(AUX)gscdefs.c || true
- 	$(GLCCAUX) $(AUXO_)gscdefs.$(OBJ) $(C_) $(AUX)gscdefs.c
+ 	$(GLCCAUX) $(C_) $(AUXO_)gscdefs.$(OBJ) $(AUX)gscdefs.c
  
  $(GLOBJ)gxacpath.$(OBJ) : $(GLSRC)gxacpath.c $(AK) $(gx_h)\
-@@ -1513,7 +1513,7 @@ $(GLOBJ)sjpegc_0.$(OBJ) : $(GLSRC)sjpegc.c $(AK) $(stdio__h) $(string__h)\
+@@ -1527,7 +1527,7 @@ $(GLOBJ)sjpegc_0.$(OBJ) : $(GLSRC)sjpegc.c $(AK) $(stdio__h) $(string__h)\
  	$(GLJCC) $(GLO_)sjpegc_0.$(OBJ) $(C_) $(GLSRC)sjpegc.c
  
  $(GLOBJ)sjpegc.$(OBJ) : $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ)
@@ -551,7 +553,7 @@ index 7c1677b..179fed0 100644
  
  # sdcparam is used by the filter operator and the PS/PDF writer.
  # It is not included automatically in sdcte/d.
-@@ -1541,7 +1541,7 @@ $(GLOBJ)sdcte_0.$(OBJ) : $(GLSRC)sdcte.c $(AK)\
+@@ -1555,7 +1555,7 @@ $(GLOBJ)sdcte_0.$(OBJ) : $(GLSRC)sdcte.c $(AK)\
  	$(GLJCC) $(GLO_)sdcte_0.$(OBJ) $(C_) $(GLSRC)sdcte.c
  
  $(GLOBJ)sdcte.$(OBJ) : $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -560,7 +562,7 @@ index 7c1677b..179fed0 100644
  
  
  $(GLOBJ)sjpege_1.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
-@@ -1557,7 +1557,7 @@ $(GLOBJ)sjpege_0.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
+@@ -1571,7 +1571,7 @@ $(GLOBJ)sjpege_0.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
  	$(GLJCC) $(GLO_)sjpege_0.$(OBJ) $(C_) $(GLSRC)sjpege.c
  
  $(GLOBJ)sjpege.$(OBJ) : $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -569,7 +571,7 @@ index 7c1677b..179fed0 100644
  
  # sdeparam is used by the filter operator and the PS/PDF writer.
  # It is not included automatically in sdcte.
-@@ -1589,7 +1589,7 @@ $(GLOBJ)sdctd_0.$(OBJ) : $(GLSRC)sdctd.c $(AK)\
+@@ -1603,7 +1603,7 @@ $(GLOBJ)sdctd_0.$(OBJ) : $(GLSRC)sdctd.c $(AK)\
  	$(GLJCC) $(GLO_)sdctd_0.$(OBJ) $(C_) $(GLSRC)sdctd.c
  
  $(GLOBJ)sdctd.$(OBJ) : $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -578,7 +580,7 @@ index 7c1677b..179fed0 100644
  
  
  $(GLOBJ)sjpegd_1.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
-@@ -1606,7 +1606,7 @@ $(GLOBJ)sjpegd_0.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
+@@ -1620,7 +1620,7 @@ $(GLOBJ)sjpegd_0.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
  
  
  $(GLOBJ)sjpegd.$(OBJ) : $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -587,7 +589,7 @@ index 7c1677b..179fed0 100644
  
  # sddparam is used by the filter operator.
  # It is not included automatically in sdctd.
-@@ -1629,7 +1629,7 @@ $(GLD)lzwe.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwe_)
+@@ -1643,7 +1643,7 @@ $(GLD)lzwe.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwe_)
  
  # We need slzwe.dev as a synonym for lzwe.dev for BAND_LIST_STORAGE = memory.
  $(GLD)slzwe.dev : $(GLD)lzwe.dev
@@ -596,7 +598,7 @@ index 7c1677b..179fed0 100644
  
  $(GLOBJ)slzwe.$(OBJ) : $(GLSRC)slzwe.c $(AK) $(stdio__h) $(gdebug_h)\
   $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
-@@ -1645,7 +1645,7 @@ $(GLD)lzwd.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwd_)
+@@ -1659,7 +1659,7 @@ $(GLD)lzwd.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwd_)
  
  # We need slzwd.dev as a synonym for lzwd.dev for BAND_LIST_STORAGE = memory.
  $(GLD)slzwd.dev : $(GLD)lzwd.dev
@@ -605,7 +607,7 @@ index 7c1677b..179fed0 100644
  
  $(GLOBJ)slzwd.$(OBJ) : $(GLSRC)slzwd.c $(AK) $(stdio__h) $(gdebug_h)\
   $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
-@@ -1695,7 +1695,7 @@ $(GLOBJ)saes.$(OBJ) : $(GLSRC)saes.c $(AK) $(memory__h)\
+@@ -1709,7 +1709,7 @@ $(GLOBJ)saes.$(OBJ) : $(GLSRC)saes.c $(AK) $(memory__h)\
  # ---------------- JBIG2 compression filter ---------------- #
  
  $(GLD)sjbig2.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjbig2_$(JBIG2_LIB).dev
@@ -614,7 +616,7 @@ index 7c1677b..179fed0 100644
  
  # jbig2dec version
  sjbig2_jbig2dec=$(GLOBJ)sjbig2.$(OBJ)
-@@ -1731,7 +1731,7 @@ $(GLOBJ)sjbig2_luratech.$(OBJ) : $(GLSRC)sjbig2_luratech.c $(AK) \
+@@ -1745,7 +1745,7 @@ $(GLOBJ)sjbig2_luratech.$(OBJ) : $(GLSRC)sjbig2_luratech.c $(AK) \
  # ---------------- JPEG 2000 compression filter ---------------- #
  
  $(GLD)sjpx.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjpx_$(JPX_LIB).dev
@@ -623,7 +625,7 @@ index 7c1677b..179fed0 100644
  
  $(GLOBJ)sjpx.$(OBJ) : $(GLSRC)sjpx.c $(AK) \
   $(memory__h) $(gsmalloc_h) \
-@@ -1860,7 +1860,7 @@ $(GLOBJ)szlibc_0.$(OBJ) : $(GLSRC)szlibc.c $(AK) $(std_h)\
+@@ -1874,7 +1874,7 @@ $(GLOBJ)szlibc_0.$(OBJ) : $(GLSRC)szlibc.c $(AK) $(std_h)\
  	$(GLZCC) $(GLO_)szlibc_0.$(OBJ) $(C_) $(GLSRC)szlibc.c
  
  $(GLOBJ)szlibc.$(OBJ) : $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
@@ -632,7 +634,7 @@ index 7c1677b..179fed0 100644
  
  szlibe_=$(szlibc_) $(GLOBJ)szlibe.$(OBJ)
  $(GLD)szlibe.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibe.dev $(szlibe_)
-@@ -1876,7 +1876,7 @@ $(GLOBJ)szlibe_0.$(OBJ) : $(GLSRC)szlibe.c $(AK) $(std_h)\
+@@ -1890,7 +1890,7 @@ $(GLOBJ)szlibe_0.$(OBJ) : $(GLSRC)szlibe.c $(AK) $(std_h)\
  	$(GLZCC) $(GLO_)szlibe_0.$(OBJ) $(C_) $(GLSRC)szlibe.c
  
  $(GLOBJ)szlibe.$(OBJ) : $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ)  $(MAKEDIRS)
@@ -641,7 +643,7 @@ index 7c1677b..179fed0 100644
  
  szlibd_=$(szlibc_) $(GLOBJ)szlibd.$(OBJ)
  $(GLD)szlibd.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibd.dev $(szlibd_)
-@@ -1892,7 +1892,7 @@ $(GLOBJ)szlibd_0.$(OBJ) : $(GLSRC)szlibd.c $(AK) $(std_h) $(memory__h)\
+@@ -1906,7 +1906,7 @@ $(GLOBJ)szlibd_0.$(OBJ) : $(GLSRC)szlibd.c $(AK) $(std_h) $(memory__h)\
  	$(GLZCC) $(GLO_)szlibd_0.$(OBJ) $(C_) $(GLSRC)szlibd.c
  
  $(GLOBJ)szlibd.$(OBJ) : $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
@@ -650,25 +652,25 @@ index 7c1677b..179fed0 100644
  
  # ---------------- Page devices ---------------- #
  # We include this here, rather than in devs.mak, because it is more like
-@@ -2843,7 +2843,7 @@ $(GLOBJ)gsicc_lcms_0.$(OBJ) : $(GLSRC)gsicc_lcms.c\
+@@ -2796,7 +2796,7 @@ $(GLOBJ)gsicc_lcms_0.$(OBJ) : $(GLSRC)gsicc_lcms.c\
  	$(GLLCMSCC) $(GLO_)gsicc_lcms_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms.c
  
- $(GLOBJ)gsicc_lcms.$(OBJ) : $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ)
+ $(GLOBJ)gsicc_lcms.$(OBJ) : $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(gp_h)
 -	$(CP_) $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms.$(OBJ)
 +	$(CP_) $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms.$(OBJ) || true
  
  
  $(GLOBJ)gsicc_lcms2_1.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
-@@ -2855,7 +2855,7 @@ $(GLOBJ)gsicc_lcms2_0.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
+@@ -2808,7 +2808,7 @@ $(GLOBJ)gsicc_lcms2_0.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
  	$(GLLCMS2CC) $(GLO_)gsicc_lcms2_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms2.c
  
- $(GLOBJ)gsicc_lcms2.$(OBJ) : $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ)
+ $(GLOBJ)gsicc_lcms2.$(OBJ) : $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(gp_h)
 -	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ)
 +	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ) || true
  
  # Note that gsicc_create requires compile with lcms to obtain icc34.h
  # header file that is used for creating ICC structures from PS objects.
-@@ -2875,7 +2875,7 @@ $(GLOBJ)gsicc_create_0.$(OBJ) : $(GLSRC)gsicc_create.c $(AK) $(string__h)\
+@@ -2828,7 +2828,7 @@ $(GLOBJ)gsicc_create_0.$(OBJ) : $(GLSRC)gsicc_create.c $(AK) $(string__h)\
  	$(GLLCMSCC) $(GLO_)gsicc_create_0.$(OBJ) $(C_) $(GLSRC)gsicc_create.c
  
  $(GLOBJ)gsicc_create.$(OBJ) : $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(MAKEDIRS)
@@ -677,7 +679,7 @@ index 7c1677b..179fed0 100644
  
  
  #include "icc34.h"   /* Note this header is needed even if lcms is not compiled as default CMS */
-@@ -3146,7 +3146,7 @@ $(GLGEN)gsromfs1_1.c : $(MKROMFS_XE) $(PS_ROMFS_DEPS) $(MAKEDIRS)
+@@ -3132,7 +3132,7 @@ $(GLGEN)gsromfs1_1.c : $(MKROMFS_XE) $(PS_ROMFS_DEPS) $(MAKEDIRS)
  	$(PS_ROMFS_ARGS) $(GL_ROMFS_ARGS)
  
  $(GLGEN)gsromfs1.c : $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(MAKEDIRS)
@@ -686,7 +688,7 @@ index 7c1677b..179fed0 100644
  
  # the following module is only included if the romfs.dev FEATURE is enabled
  $(GLOBJ)gsiorom_1.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
-@@ -3162,7 +3162,7 @@ $(GLOBJ)gsiorom_0.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
+@@ -3148,7 +3148,7 @@ $(GLOBJ)gsiorom_0.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
  	$(GLCC) $(GLO_)gsiorom_0.$(OBJ) $(I_)$(ZI_)$(_I) $(C_) $(GLSRC)gsiorom.c
  
  $(GLOBJ)gsiorom.$(OBJ) : $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
@@ -709,10 +711,10 @@ index ca1b7cc..ad6446d 100644
  # external link .dev
  $(LWF_JP2_GEN)lwf_jp2_1.dev : $(TOP_MAKEFILES) $(LWF_JP2_MAK) $(ECHOGS_XE)
 diff --git a/base/macos-mcp.mak b/base/macos-mcp.mak
-index 5387a99..725ec73 100644
+index 4ded7f3..3599ed9 100644
 --- a/base/macos-mcp.mak
 +++ b/base/macos-mcp.mak
-@@ -380,11 +380,11 @@ CWPROJ_XML=./ghostscript.mcp.xml
+@@ -383,11 +383,11 @@ CWPROJ_XML=./ghostscript.mcp.xml
  
  $(CWPROJ_XML): $(gconfigd_h)
  	-mkdir -p obj/sys
@@ -729,15 +731,10 @@ index 5387a99..725ec73 100644
  
  $(GS_XE): $(ld_tr) $(ECHOGS_XE) $(XE_ALL) $(CWPROJ_XML) $(PSOBJ)gsromfs$(COMPILE_INITS).$(OBJ)
 diff --git a/base/openjpeg.mak b/base/openjpeg.mak
-index 489dd3b..60e2015 100644
+index 32be240..4a6b429 100644
 --- a/base/openjpeg.mak
 +++ b/base/openjpeg.mak
-@@ -94,11 +94,11 @@ open_jpeg_HDRS = \
- 	$(OPEN_JPEG_SRC)indexbox_manager.h	\
- 
- $(OPEN_JPEG_CONFIG_H): $(TOP_MAKEFILES) $(JPXSRCDIR)$(D)opj_config.h.in.user
--	$(CP_) $(JPXSRCDIR)$(D)opj_config.h.in.user $(OPEN_JPEG_CONFIG_H)
-+	$(CP_) $(JPXSRCDIR)$(D)opj_config.h.in.user $(OPEN_JPEG_CONFIG_H) || true
+@@ -99,7 +99,7 @@ open_jpeg_HDRS = \
  
  # switch in the selected library .dev
  $(OPEN_JPEG_GEN)openjpeg.dev : $(TOP_MAKEFILES) $(OPEN_JPEG_GEN)openjpeg_$(SHARE_JPX).dev
@@ -747,10 +744,10 @@ index 489dd3b..60e2015 100644
  # external link .dev
  $(OPEN_JPEG_GEN)openjpeg_1.dev : $(TOP_MAKEFILES) $(OPEN_JPEG_MAK) $(ECHOGS_XE)
 diff --git a/base/openvms.mak b/base/openvms.mak
-index 8e4c3dd..117dca4 100644
+index e5ae40b..286ee84 100644
 --- a/base/openvms.mak
 +++ b/base/openvms.mak
-@@ -362,7 +362,7 @@ SH=
+@@ -365,7 +365,7 @@ SH=
  
  # Define generic commands.
  
@@ -760,10 +757,10 @@ index 8e4c3dd..117dca4 100644
  # Define the command for deleting (a) file(s) (including wild cards)
  
 diff --git a/base/png.mak b/base/png.mak
-index 66fc3c8..59535be 100644
+index f01c426..8a89884 100644
 --- a/base/png.mak
 +++ b/base/png.mak
-@@ -77,7 +77,7 @@ png.config-clean :
+@@ -79,7 +79,7 @@ png.config-clean :
  	$(RM_) $(PNGGEN)lpg*.dev
  
  $(pnglibconf_h) : $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt
@@ -772,7 +769,7 @@ index 66fc3c8..59535be 100644
  
  PDEP=$(AK) $(pnglibconf_h)
  
-@@ -132,7 +132,7 @@ $(PNGOBJ)pngget.$(OBJ) : $(PNGSRC)pngget.c $(PDEP)
+@@ -134,7 +134,7 @@ $(PNGOBJ)pngget.$(OBJ) : $(PNGSRC)pngget.c $(PDEP)
  
  # Define the version of libpng.dev that we are actually using.
  $(PNGGEN)libpng.dev : $(TOP_MAKEFILES) $(PNGGEN)libpng_$(SHARE_LIBPNG).dev
@@ -782,33 +779,33 @@ index 66fc3c8..59535be 100644
  # Define the shared version of libpng.
  # Note that it requires libz, which must be searched *after* libpng.
 diff --git a/base/tiff.mak b/base/tiff.mak
-index 22e3906..317fb14 100644
+index 0ea9f9e..80d8926 100644
 --- a/base/tiff.mak
 +++ b/base/tiff.mak
-@@ -49,11 +49,11 @@ tiff_10=$(TIFFOBJ)tif_zip.$(OBJ)
+@@ -53,11 +53,11 @@ tiff_11=$(TIFFOBJ)gstiffio.$(OBJ)
  
  $(TIFFSRC)libtiff$(D)tif_config.unix.h : $(TIFFSRC)libtiff$(D)tif_config.h.in
  	cd $(TIFFSRC) && ./configure
--	$(CP_) $(TIFFSRC)libtiff$(D)tif_config.h $(TIFFSRC)libtiff$(D)tif_config.unix.h
-+	$(CP_) $(TIFFSRC)libtiff$(D)tif_config.h $(TIFFSRC)libtiff$(D)tif_config.unix.h || true
+-	$(CP_) $(TIFFCONF)libtiff$(D)tif_config.h $(TIFFCONF)libtiff$(D)tif_config.unix.h
++	$(CP_) $(TIFFCONF)libtiff$(D)tif_config.h $(TIFFCONF)libtiff$(D)tif_config.unix.h || true
  
  $(TIFFSRC)libtiff$(D)tiffconf.unix.h : $(TIFFSRC)libtiff$(D)tiffconf.h.in
  	cd $(TIFFSRC) && ./configure
--	$(CP_) $(TIFFSRC)libtiff$(D)tiffconf.h $(TIFFSRC)libtiff$(D)tiffconf.unix.h
-+	$(CP_) $(TIFFSRC)libtiff$(D)tiffconf.h $(TIFFSRC)libtiff$(D)tiffconf.unix.h || true
+-	$(CP_) $(TIFFCONF)libtiff$(D)tiffconf.h $(TIFFCONF)libtiff$(D)tiffconf.unix.h
++	$(CP_) $(TIFFCONF)libtiff$(D)tiffconf.h $(TIFFCONF)libtiff$(D)tiffconf.unix.h || true
  
  $(TIFFOBJ)tif_aux.$(OBJ) : $(TIFFSRC)/libtiff/tif_aux.c $(TIFFDEP)
  	$(TIFFCC) $(TIFFO_)tif_aux.$(OBJ) $(C_) $(TIFFSRC)/libtiff/tif_aux.c
-@@ -179,14 +179,14 @@ $(TIFFOBJ)tif_unix.$(OBJ) : $(TIFFSRC)/libtiff/tif_unix.c $(TIFFDEP)
- 	$(TIFFCC) $(TIFFO_)tif_unix.$(OBJ) $(C_) $(TIFFSRC)/libtiff/tif_unix.c
+@@ -189,14 +189,14 @@ $(TIFFOBJ)gstiffio.$(OBJ) : $(GLSRC)gstiffio.c $(gstiffio_h) $(PDEVH) $(stdint__
+ 	$(TIFFCC) $(TIFFO_)gstiffio.$(OBJ) $(D_)SHARE_LIBTIFF=$(SHARE_LIBTIFF) $(C_) $(GLSRC)gstiffio.c
  
- $(TIFFGEN)tif_config.h: $(TIFFCONFIG)
--	$(CP_) $(TIFFCONFIG) $(TIFFGEN)tif_config.h
-+	$(CP_) $(TIFFCONFIG) $(TIFFGEN)tif_config.h || true
+ $(TIFFGEN)tif_config.h: $(TIFFCONFIG_H)
+-	$(CP_) $(TIFFCONFIG_H) $(TIFFGEN)tif_config.h
++	$(CP_) $(TIFFCONFIG_H) $(TIFFGEN)tif_config.h || true
  	
- $(TIFFGEN)tiffconf.h: $(TIFFCONF)
--	$(CP_) $(TIFFCONF) $(TIFFGEN)tiffconf.h
-+	$(CP_) $(TIFFCONF) $(TIFFGEN)tiffconf.h || true
+ $(TIFFGEN)tiffconf.h: $(TIFFCONF_H)
+-	$(CP_) $(TIFFCONF_H) $(TIFFGEN)tiffconf.h
++	$(CP_) $(TIFFCONF_H) $(TIFFGEN)tiffconf.h || true
  	
  # Define the version of libtiff.dev that we are actually using.
  $(TIFFGEN)libtiff.dev : $(TOP_MAKEFILES) $(TIFFGEN)libtiff_$(SHARE_LIBTIFF).dev
@@ -831,10 +828,10 @@ index 1ddad78..6b24422 100644
  # Query the environment to construct gconfig_.h.
  # These are all defined conditionally (except the JasPER one), so that
 diff --git a/base/unixhead.mak b/base/unixhead.mak
-index 67b5434..c4582c1 100644
+index 6aa3599..70a61f8 100644
 --- a/base/unixhead.mak
 +++ b/base/unixhead.mak
-@@ -55,7 +55,7 @@ SH=$(SHELL)
+@@ -53,7 +53,7 @@ SH=$(SHELL)
  
  # Define generic commands.
  
@@ -874,8 +871,21 @@ index 6c50605..7fb8c9b 100644
  
  $(ZGEN)zlibd_1.dev : $(TOP_MAKEFILES) $(ZLIB_MAK) $(ECHOGS_XE)
  	$(SETMOD) $(ZGEN)zlibd_1 -lib $(ZLIB_NAME)
+diff --git a/devices/devs.mak b/devices/devs.mak
+index bc22594..4bd0a11 100644
+--- a/devices/devs.mak
++++ b/devices/devs.mak
+@@ -1555,7 +1555,7 @@ libpng_dev=$(PNGGENDIR)$(D)libpng.dev
+ png_i_=-include $(PNGGENDIR)$(D)libpng
+ 
+ $(DEVOBJ)gdevpng.$(OBJ) : $(DEVSRC)gdevpng.c\
+- $(gdevprn_h) $(gdevpccm_h) $(gscdefs_h) $(png__h)
++ $(gdevprn_h) $(gdevpccm_h) $(gscdefs_h) $(png__h) $(PDEP)
+ 	$(CC_) $(I_)$(DEVI_) $(II)$(PI_)$(_I) $(PCF_) $(GLF_) $(DEVO_)gdevpng.$(OBJ) $(C_) $(DEVSRC)gdevpng.c
+ 
+ $(DD)pngmono.dev : $(DEVS_MAK) $(libpng_dev) $(png_) $(GLD)page.dev $(GDEV)
 diff --git a/psi/int.mak b/psi/int.mak
-index 92f296e..ee6b136 100644
+index 62cba0e..a1e963a 100644
 --- a/psi/int.mak
 +++ b/psi/int.mak
 @@ -274,7 +274,7 @@ $(PSOBJ)iconfig.$(OBJ) : $(gconfig_h) $(PSSRC)iconf.c $(stdio__h)\
@@ -905,7 +915,7 @@ index 92f296e..ee6b136 100644
  
  # We -include dpsand2 first so that geninit will have access to the
  # system name table as soon as possible.
-@@ -1208,7 +1208,7 @@ $(PSOBJ)zfjbig2_luratech.$(OBJ) : $(PSSRC)zfjbig2.c $(OP) $(memory__h)\
+@@ -1193,7 +1193,7 @@ $(PSOBJ)zfjbig2_luratech.$(OBJ) : $(PSSRC)zfjbig2.c $(OP) $(memory__h)\
  # this can be turned on and off with a FEATURE_DEV
  
  $(PSD)jpx.dev : $(INT_MAK) $(ECHOGS_XE) $(PSD)jpx_$(JPX_LIB).dev
@@ -914,16 +924,6 @@ index 92f296e..ee6b136 100644
  
  fjpx_luratech=$(PSOBJ)zfjpx_luratech.$(OBJ)
  
-Index: ghostscript-9.07/base/devs.mak
-===================================================================
---- ghostscript-9.07.orig/base/devs.mak	2013-02-14 07:58:13.000000000 +0000
-+++ ghostscript-9.07/base/devs.mak	2013-09-06 22:50:06.331064815 +0000
-@@ -1511,7 +1511,7 @@
- png_i_=-include $(PNGGENDIR)$(D)libpng
- 
- $(GLOBJ)gdevpng.$(OBJ) : $(GLSRC)gdevpng.c\
-- $(gdevprn_h) $(gdevpccm_h) $(gscdefs_h) $(png__h)
-+ $(gdevprn_h) $(gdevpccm_h) $(gscdefs_h) $(png__h) $(PDEP)
- 	$(CC_) $(I_)$(GLI_) $(II)$(PI_)$(_I) $(PCF_) $(GLF_) $(GLO_)gdevpng.$(OBJ) $(C_) $(GLSRC)gdevpng.c
- 
- $(DD)pngmono.dev : $(DEVS_MAK) $(libpng_dev) $(png_) $(GLD)page.dev $(GDEV)
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
deleted file mode 100644
index 14c036e..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-configure will check endianness of build machine. When cross compile it fails.
-So remove the check for Yocto.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-Signed-off-by: Sen Zhang <sen.zhang@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
---- ghostscript/base/configure.ac.orig	2013-06-24 03:58:26.224723002 -0400
-+++ ghostscript/base/configure.ac	2013-06-24 04:03:29.730807957 -0400
-@@ -255,13 +255,13 @@
- 
- AC_MSG_CHECKING([for big endian])
- 
--AC_RUN_IFELSE(
--  [AC_LANG_PROGRAM([#include <stdio.h>], [
--   static const int one = 1;
--   return (*(char*)&one == 0 ? 0 : 1);
--  ])],
--  [BIGENDIAN=1;AC_MSG_RESULT(big)],
--  [BIGENDIAN=0;AC_MSG_RESULT(little)])
-+#AC_RUN_IFELSE(
-+#  [AC_LANG_PROGRAM([#include <stdio.h>], [
-+#   static const int one = 1;
-+#   return (*(char*)&one == 0 ? 0 : 1);
-+#  ])],
-+#  [BIGENDIAN=1;AC_MSG_RESULT(big)],
-+#  [BIGENDIAN=0;AC_MSG_RESULT(little)])
- 
- 
- 
-@@ -1922,9 +1922,11 @@
- if test "x$BIGENDIAN" != "x0"; then
-   LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$BIGENDIAN"
-   LCMS2_ENDIAN="-DCMS_USE_BIG_ENDIAN=$BIGENDIAN"
-+  AC_MSG_RESULT(big)
- else
-   LCMS_ENDIAN=
-   LCMS2_ENDIAN=
-+  AC_MSG_RESULT(little)
- fi
- 
- AC_SUBST(LCMS_ENDIAN)
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
index 40afd37..9158117 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
@@ -7,44 +7,31 @@ disabled.
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Pending
 ---
-diff --git a/base/configure.ac b/base/configure.ac
-index bb05105..4b817ac 100644
---- a/base/configure.ac
-+++ b/base/configure.ac
-@@ -951,17 +951,22 @@
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -1055,6 +1055,7 @@ Disabling tiff output devices.])
  esac
  
  if test $SHARE_LIBTIFF -eq 0; then
--      echo
--      echo "Running libtiff configure script..."
--      olddir=`pwd`
--      cd "$LIBTIFFDIR" && ./configure --disable-jbig --disable-lzma $SUBCONFIG_OPTS
--      status=$?
--      if test "$status" -ne 0 ; then
--        AC_MSG_ERROR([libtiff configure script failed], $status)
--      fi
--      cd "$olddir"
--      echo
--      echo "Continuing with Ghostscript configuration..."
 +    if test -e $LIBTIFFDIR/configure; then
-+        echo
-+        echo "Running libtiff configure script..."
-+        olddir=`pwd`
-+        cd "$LIBTIFFDIR" && ./configure --disable-jbig --disable-lzma $SUBCONFIG_OPTS
-+        status=$?
-+        if test "$status" -ne 0 ; then
-+            AC_MSG_ERROR([libtiff configure script failed], $status)
-+        fi
-+        cd "$olddir"
-+        echo
-+        echo "Continuing with Ghostscript configuration..."
+       echo
+       echo "Running libtiff configure script..."
+       olddir=`pwd`
+@@ -1069,6 +1070,10 @@ if test $SHARE_LIBTIFF -eq 0; then
+       cd "$olddir"
+       echo
+       echo "Continuing with Ghostscript configuration..."
 +    else
-+        AC_MSG_NOTICE([Could not find local copy of libtiff.
++      AC_MSG_NOTICE([Could not find local copy of libtiff.
 +Disabling tiff output devices.])
 +    fi
  fi
  
  AC_SUBST(SHARE_LIBTIFF)
 -- 
-1.7.10.4
+1.8.1.2
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.07.bb b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
similarity index 70%
rename from meta/recipes-extended/ghostscript/ghostscript_9.07.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.14.bb
index 64dc6f2..73cebbc 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
@@ -13,7 +13,7 @@ HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a5146dadaa8cd9f5f913b7577d49bf19"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aad21ea85123608e6a0a58d54ee23567"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_class-native = ""
@@ -25,19 +25,21 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://ghostscript-9.02-parallel-make.patch \
-           file://ghostscript-9.05-NOT-check-endian.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://ghostscript-native-fix-disable-system-libtiff.patch \
+                        file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "57ebf17c5abcf0fc95a386bfff08c1a4"
-SRC_URI[sha256sum] = "44800d004c53f13192d1b5db413119198ddfc8a11c4d2a030aac2f2fda822ebf"
+SRC_URI[md5sum] = "586494befb443363338c1b6379f13973"
+SRC_URI[sha256sum] = "ab2ba5ce11c8db396c9acf774a497182d7686d04670976cc3e690ada7db9f0d4"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
-                --with-fontpath=${datadir}/fonts --with-install-cups \
-                --without-libidn \
+                --with-fontpath=${datadir}/fonts \
+                --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
+                --with-cups-datadir=${datadir}/cups \
+                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--enable-little-endian', '--enable-big-endian', d)} \
                 "
 
 # Explicity disable libtiff, fontconfig,
@@ -62,13 +64,6 @@ do_configure_prepend () {
 	if [ -e ${WORKDIR}/objarch.h ]; then
 		cp ${WORKDIR}/objarch.h obj/arch.h
 	fi
-	if [ ${SITEINFO_ENDIANNESS} = "le" ]; then
-		export BIGENDIAN="0"
-		export BIGENDIAN="0"
-	else
-		export BIGENDIAN="1"
-		export BIGENDIAN="1"
-	fi
 }
 
 do_configure_append () {
@@ -79,22 +74,12 @@ do_configure_append () {
 			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
 		done
 	fi
-
-	# replace cups paths from sysroots/.../usr/bin/crossscripts/cups-config with target paths
-	# CUPSDATA is compiled into a utility, and CUPSSERVERBIN is used as an install path
-	CUPSSERVERBIN=${exec_prefix}/lib/cups          # /usr/lib NOT libdir
-	CUPSDATA=${datadir}/cups
-
-	sed -e "s#^CUPSSERVERBIN=.*#CUPSSERVERBIN=${CUPSSERVERBIN}#" -i Makefile
-	sed -e "s#^CUPSDATA=.*#CUPSDATA=${CUPSDATA}#" -i Makefile
 }
 
 do_install_append () {
     mkdir -p ${D}${datadir}/ghostscript/${PV}/
     cp -r Resource ${D}${datadir}/ghostscript/${PV}/
     cp -r iccprofiles ${D}${datadir}/ghostscript/${PV}/
-
-    chown -R root:lp ${D}${sysconfdir}/cups
 }
 
 do_compile_class-native () {
@@ -117,14 +102,3 @@ BBCLASSEXTEND = "native"
 # directories during install and parallel make causes problems.
 PARALLEL_MAKEINST=""
 
-PACKAGES =+ "${PN}-cups"
-
-FILES_${PN}-dbg += "${exec_prefix}/lib/cups/filter/.debug"
-
-FILES_${PN}-cups += "${exec_prefix}/lib/cups/filter/gstoraster \
-                     ${exec_prefix}/lib/cups/filter/gstopxl \
-                     ${datadir}/cups \
-                     ${sysconfdir}/cups \
-                     "
-
-RDEPENDS_${PN}-cups = "${PN}"
-- 
1.8.1.2


