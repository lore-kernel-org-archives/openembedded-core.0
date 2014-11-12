Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96D2B65D4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 09:09:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAC9901G023223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 01:09:00 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 01:08:59 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 17:08:55 +0800
Message-ID: <927df612b93e9a701dfbac9d3f1cb1ff4633c1da.1415782610.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415782610.git.hongxu.jia@windriver.com>
References: <cover.1415782610.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: upgrade to 9.15
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
X-List-Received-Date: Wed, 12 Nov 2014 09:09:07 -0000
Content-Type: text/plain

Rebase cups-no-gcrypt.patch and ghostscript-9.02-parallel-make.patch to 9.15

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ghostscript/ghostscript/cups-no-gcrypt.patch   | 19 +++--
 .../ghostscript-9.02-parallel-make.patch           | 99 +++++++++++-----------
 .../{ghostscript_9.14.bb => ghostscript_9.15.bb}   |  4 +-
 3 files changed, 64 insertions(+), 58 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.14.bb => ghostscript_9.15.bb} (96%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch b/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
index 1c0a6d5..a1c9368 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
@@ -7,22 +7,25 @@ This addresses the cryto dependency seen during build.
 Upstream-Status: Backport
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Rebase the patch to ghostscript-9.15
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  cups/libs/cups/http-private.h | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/cups/libs/cups/http-private.h b/cups/libs/cups/http-private.h
-index 9c88281..94a9817 100644
+index 99a85c3..a674852 100644
 --- a/cups/libs/cups/http-private.h
 +++ b/cups/libs/cups/http-private.h
-@@ -98,7 +98,6 @@ extern BIO_METHOD *_httpBIOMethods(void);
-  * The GNU TLS library is more of a "bare metal" SSL/TLS library...
-  */
+@@ -80,7 +80,6 @@ typedef int socklen_t;
+ #  elif defined HAVE_GNUTLS
  #    include <gnutls/gnutls.h>
+ #    include <gnutls/x509.h>
 -#    include <gcrypt.h>
- 
- typedef struct
- {
+ #  elif defined(HAVE_CDSASSL)
+ #    include <CoreFoundation/CoreFoundation.h>
+ #    include <Security/Security.h>
 -- 
-2.0.0
+1.9.1
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
index 601f5f1..ae9da6e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
@@ -12,6 +12,9 @@ RP: Extended || true to all CP_ operations, they all can race e.g.:
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
+Rebase the patch to ghostscript-9.15
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 diff --git a/base/expat.mak b/base/expat.mak
 index 4ee9c8c..2e16a9d 100644
 --- a/base/expat.mak
@@ -39,10 +42,10 @@ index 16f2b95..409f75b 100644
  # Define the shared version.
  $(FTGEN)freetype_1.dev : $(TOP_MAKEFILES) $(FT_MAK) $(ECHOGS_XE)
 diff --git a/base/gs.mak b/base/gs.mak
-index 7d75fb0..2a9596c 100644
+index 3fc67df..1fc3e26 100644
 --- a/base/gs.mak
 +++ b/base/gs.mak
-@@ -433,7 +433,7 @@ $(gconfxx_h) : $(ld_tr)
+@@ -434,7 +434,7 @@ $(gconfxx_h) : $(ld_tr)
  
  $(gconfig_h) : $(gconfxx_h)
  	$(RM_) $(gconfig_h)
@@ -78,7 +81,7 @@ index bb74630..44617a0 100644
  # dev file for shared (separately built) jbig2dec library
  $(JBIG2GEN)jbig2dec_1.dev : $(TOP_MAKEFILES) $(JBIG2_MAK) $(ECHOGS_XE)
 diff --git a/base/jpeg.mak b/base/jpeg.mak
-index 5310a20..43cee63 100644
+index e300a04..9fdad5a 100644
 --- a/base/jpeg.mak
 +++ b/base/jpeg.mak
 @@ -96,7 +96,7 @@ jconfig_h=$(GLGEN)jconfig.h
@@ -148,7 +151,7 @@ index 5310a20..43cee63 100644
  
  # In order to avoid having to keep the dependency lists for the IJG code
  # accurate, we simply make all of them depend on the only files that
-@@ -174,40 +174,40 @@ $(JGEN)jpegc0.dev : $(JPEG_MAK) $(ECHOGS_XE) $(jpegc0_)
+@@ -181,40 +181,40 @@ $(JGEN)jpegc0.dev : $(JPEG_MAK) $(ECHOGS_XE) $(jpegc0_)
  	$(SETMOD) $(JGEN)jpegc0 $(jpegc0_)
  
  $(JOBJ)jcomapi.$(OBJ) : $(JSRC)jcomapi.c $(JDEP)
@@ -196,7 +199,7 @@ index 5310a20..43cee63 100644
  
  jpege6=$(JOBJ)jcapimin.$(OBJ) $(JOBJ)jcapistd.$(OBJ) $(JOBJ)jcinit.$(OBJ)
  
-@@ -223,90 +223,90 @@ $(JGEN)jpege6.dev : $(JPEG_MAK) $(ECHOGS_XE) $(JGEN)jpegc0.dev $(jpege6) $(jpege
+@@ -230,90 +230,90 @@ $(JGEN)jpege6.dev : $(JPEG_MAK) $(ECHOGS_XE) $(JGEN)jpegc0.dev $(jpege6) $(jpege
  	$(ADDMOD) $(JGEN)jpege6 -obj $(jpege_3)
  
  $(JOBJ)jcapimin.$(OBJ) : $(JSRC)jcapimin.c $(JDEP)
@@ -304,7 +307,7 @@ index 5310a20..43cee63 100644
  
  jpegd6=$(JOBJ)jdapimin.$(OBJ) $(JOBJ)jdapistd.$(OBJ) $(JOBJ)jdinput.$(OBJ) $(JOBJ)jdhuff.$(OBJ)
  
-@@ -322,76 +322,76 @@ $(JGEN)jpegd6.dev : $(JPEG_MAK) $(ECHOGS_XE) $(JGEN)jpegc0.dev $(jpegd6) $(jpegd
+@@ -329,76 +329,76 @@ $(JGEN)jpegd6.dev : $(JPEG_MAK) $(ECHOGS_XE) $(JGEN)jpegc0.dev $(jpegd6) $(jpegd
  	$(ADDMOD) $(JGEN)jpegd6 -obj $(jpegd_3)
  
  $(JOBJ)jdapimin.$(OBJ) : $(JSRC)jdapimin.c $(JDEP)
@@ -436,10 +439,10 @@ index 52f750c..33a9c16 100644
  # dev file for shared (separately built) lcms library
  $(LCMS2GEN)lcms2_1.dev : $(TOP_MAKEFILES) $(LCMS2_MAK) $(ECHOGS_XE)
 diff --git a/base/lcups.mak b/base/lcups.mak
-index 0bfb3ac..fcdb170 100644
+index 7504c44..7b9b979 100644
 --- a/base/lcups.mak
 +++ b/base/lcups.mak
-@@ -114,7 +114,7 @@ libcups.config-clean :
+@@ -116,7 +116,7 @@ libcups.config-clean :
  
  # instantiate the requested build option (shared or compiled in)
  $(LIBCUPSGEN)lcups.dev : $(TOP_MAKEFILES) $(LIBCUPSGEN)lcups_$(SHARE_LCUPS).dev
@@ -448,7 +451,7 @@ index 0bfb3ac..fcdb170 100644
  
  # Define the shared version.
  $(LIBCUPSGEN)lcups_1.dev : $(TOP_MAKEFILES) $(LCUPS_MAK) $(ECHOGS_XE)
-@@ -131,7 +131,7 @@ $(LIBCUPSGEN)lcups_0.dev : $(TOP_MAKEFILES) $(LCUPS_MAK) $(ECHOGS_XE) \
+@@ -133,7 +133,7 @@ $(LIBCUPSGEN)lcups_0.dev : $(TOP_MAKEFILES) $(LCUPS_MAK) $(ECHOGS_XE) \
  # for simplicity we have every source file depend on all headers
  
  $(LIBCUPSGEN)$(D)cups$(D)config.h : $(LCUPSSRCDIR)$(D)libs$(D)config$(LCUPSBUILDTYPE).h
@@ -457,7 +460,7 @@ index 0bfb3ac..fcdb170 100644
  
  $(LIBCUPSOBJ)adminutil.$(OBJ) : $(LIBCUPSSRC)adminutil.c $(LIBSCUPSHEADERS) $(LIBCUPSGEN)$(D)cups$(D)config.h
  	$(LCUPS_CC) $(LCUPSO_)adminutil.$(OBJ) $(C_) $(LIBCUPSSRC)adminutil.c
-@@ -218,7 +218,7 @@ $(LIBCUPSOBJ)mark.$(OBJ) : $(LIBCUPSSRC)mark.c $(LIBSCUPSHEADERS)
+@@ -220,7 +220,7 @@ $(LIBCUPSOBJ)mark.$(OBJ) : $(LIBCUPSSRC)mark.c $(LIBSCUPSHEADERS)
  	$(LCUPS_CC) $(LCUPSO_)mark.$(OBJ) $(C_) $(LIBCUPSSRC)mark.c
  
  $(LIBCUPSOBJ)cups_md5.$(OBJ) : $(LIBCUPSSRC)md5.c $(LIBSCUPSHEADERS)
@@ -466,7 +469,7 @@ index 0bfb3ac..fcdb170 100644
  	$(LCUPS_CC) $(LCUPSO_)cups_md5.$(OBJ) $(C_) $(LIBCUPSGEN)cups_md5.c
  
  $(LIBCUPSOBJ)md5passwd.$(OBJ) : $(LIBCUPSSRC)md5passwd.c $(LIBSCUPSHEADERS)
-@@ -255,7 +255,7 @@ $(LIBCUPSOBJ)snmp.$(OBJ) : $(LIBCUPSSRC)snmp.c $(LIBSCUPSHEADERS)
+@@ -257,7 +257,7 @@ $(LIBCUPSOBJ)snmp.$(OBJ) : $(LIBCUPSSRC)snmp.c $(LIBSCUPSHEADERS)
  	$(LCUPS_CC) $(LCUPSO_)snmp.$(OBJ) $(C_) $(LIBCUPSSRC)snmp.c
  
  $(LIBCUPSOBJ)cups_snpf.$(OBJ) : $(LIBCUPSSRC)snprintf.c $(LIBSCUPSHEADERS)
@@ -475,18 +478,18 @@ index 0bfb3ac..fcdb170 100644
  	$(LCUPS_CC) $(LCUPSO_)cups_snpf.$(OBJ) $(C_) $(LIBCUPSGEN)cups_snpf.c
  
  $(LIBCUPSOBJ)string.$(OBJ) : $(LIBCUPSSRC)string.c $(LIBSCUPSHEADERS)
-@@ -271,5 +271,5 @@ $(LIBCUPSOBJ)usersys.$(OBJ) : $(LIBCUPSSRC)usersys.c $(LIBSCUPSHEADERS)
- 	$(LCUPS_CC) $(LCUPSO_)usersys.$(OBJ) $(C_) $(LIBCUPSSRC)usersys.c
+@@ -279,5 +279,5 @@ $(LIBCUPSOBJ)thread.$(OBJ) : $(LIBCUPSSRC)thread.c $(LIBSCUPSHEADERS)
+ 	$(LCUPS_CC) $(LCUPSO_)thread.$(OBJ) $(C_) $(LIBCUPSSRC)thread.c
  
  $(LIBCUPSOBJ)cups_util.$(OBJ) : $(LIBCUPSSRC)util.c $(LIBSCUPSHEADERS)
 -	$(CP_) $(LIBCUPSSRC)util.c $(LIBCUPSGEN)cups_util.c
 +	$(CP_) $(LIBCUPSSRC)util.c $(LIBCUPSGEN)cups_util.c || true
  	$(LCUPS_CC) $(LCUPSO_)cups_util.$(OBJ) $(C_) $(LIBCUPSGEN)cups_util.c
 diff --git a/base/lcupsi.mak b/base/lcupsi.mak
-index ea4047f..0102d93 100644
+index da47da5..fa7d74c 100644
 --- a/base/lcupsi.mak
 +++ b/base/lcupsi.mak
-@@ -73,7 +73,7 @@ libcupsi.config-clean :
+@@ -59,7 +59,7 @@ libcupsi.config-clean :
  
  # instantiate the requested build option (shared or compiled in)
  $(LIBCUPSIGEN)lcupsi.dev : $(TOP_MAKEFILES) $(LIBCUPSIGEN)lcupsi_$(SHARE_LCUPSI).dev
@@ -509,10 +512,10 @@ index 3f50892..97c76a0 100644
  # external link .dev
  $(LDF_JB2_GEN)ldf_jb2_1.dev : $(TOP_MAKEFILES) $(LDF_JB2_MAK) $(ECHOGS_XE)
 diff --git a/base/lib.mak b/base/lib.mak
-index 3ad7db3..87b4f01 100644
+index 90c9249..fb11aba 100644
 --- a/base/lib.mak
 +++ b/base/lib.mak
-@@ -343,7 +343,7 @@ md5_=$(GLOBJ)md5.$(OBJ)
+@@ -350,7 +350,7 @@ md5_=$(GLOBJ)md5.$(OBJ)
  $(GLOBJ)md5.$(OBJ) : $(GLSRC)md5.c $(AK) $(md5_h) $(std_h) $(MAKEDIRS) $(EXP)$(ECHOGS_XE)
  	$(EXP)$(ECHOGS_XE) -w $(GLGEN)md5.h -x 23 include -x 2022 memory_.h -x 22
  	$(EXP)$(ECHOGS_XE) -a $(GLGEN)md5.h -+R $(GLSRC)md5.h
@@ -521,7 +524,7 @@ index 3ad7db3..87b4f01 100644
  	$(GLCC) $(GLO_)md5.$(OBJ) $(C_) $(GLGEN)md5.c
  	$(RM_) $(GLGEN)md5.c $(GLGEN)md5.h
  
-@@ -624,19 +624,19 @@ $(GLOBJ)gconfig.$(OBJ) : $(gconfig_h) $(GLSRC)gconf.c $(AK) $(gx_h)\
+@@ -631,19 +631,19 @@ $(GLOBJ)gconfig.$(OBJ) : $(gconfig_h) $(GLSRC)gconf.c $(AK) $(gx_h)\
   $(gxdevice_h) $(gxiclass_h) $(gxiodev_h) $(gxiparam_h) $(TOP_MAKEFILES)\
   $(MAKEDDIRS)
  	$(RM_) $(GLGEN)gconfig.c
@@ -544,7 +547,7 @@ index 3ad7db3..87b4f01 100644
  	$(GLCCAUX) $(C_) $(AUXO_)gscdefs.$(OBJ) $(AUX)gscdefs.c
  
  $(GLOBJ)gxacpath.$(OBJ) : $(GLSRC)gxacpath.c $(AK) $(gx_h)\
-@@ -1527,7 +1527,7 @@ $(GLOBJ)sjpegc_0.$(OBJ) : $(GLSRC)sjpegc.c $(AK) $(stdio__h) $(string__h)\
+@@ -1535,7 +1535,7 @@ $(GLOBJ)sjpegc_0.$(OBJ) : $(GLSRC)sjpegc.c $(AK) $(stdio__h) $(string__h)\
  	$(GLJCC) $(GLO_)sjpegc_0.$(OBJ) $(C_) $(GLSRC)sjpegc.c
  
  $(GLOBJ)sjpegc.$(OBJ) : $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ)
@@ -553,7 +556,7 @@ index 3ad7db3..87b4f01 100644
  
  # sdcparam is used by the filter operator and the PS/PDF writer.
  # It is not included automatically in sdcte/d.
-@@ -1555,7 +1555,7 @@ $(GLOBJ)sdcte_0.$(OBJ) : $(GLSRC)sdcte.c $(AK)\
+@@ -1563,7 +1563,7 @@ $(GLOBJ)sdcte_0.$(OBJ) : $(GLSRC)sdcte.c $(AK)\
  	$(GLJCC) $(GLO_)sdcte_0.$(OBJ) $(C_) $(GLSRC)sdcte.c
  
  $(GLOBJ)sdcte.$(OBJ) : $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -562,7 +565,7 @@ index 3ad7db3..87b4f01 100644
  
  
  $(GLOBJ)sjpege_1.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
-@@ -1571,7 +1571,7 @@ $(GLOBJ)sjpege_0.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
+@@ -1579,7 +1579,7 @@ $(GLOBJ)sjpege_0.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
  	$(GLJCC) $(GLO_)sjpege_0.$(OBJ) $(C_) $(GLSRC)sjpege.c
  
  $(GLOBJ)sjpege.$(OBJ) : $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -571,7 +574,7 @@ index 3ad7db3..87b4f01 100644
  
  # sdeparam is used by the filter operator and the PS/PDF writer.
  # It is not included automatically in sdcte.
-@@ -1603,7 +1603,7 @@ $(GLOBJ)sdctd_0.$(OBJ) : $(GLSRC)sdctd.c $(AK)\
+@@ -1611,7 +1611,7 @@ $(GLOBJ)sdctd_0.$(OBJ) : $(GLSRC)sdctd.c $(AK)\
  	$(GLJCC) $(GLO_)sdctd_0.$(OBJ) $(C_) $(GLSRC)sdctd.c
  
  $(GLOBJ)sdctd.$(OBJ) : $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -580,7 +583,7 @@ index 3ad7db3..87b4f01 100644
  
  
  $(GLOBJ)sjpegd_1.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
-@@ -1620,7 +1620,7 @@ $(GLOBJ)sjpegd_0.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
+@@ -1628,7 +1628,7 @@ $(GLOBJ)sjpegd_0.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
  
  
  $(GLOBJ)sjpegd.$(OBJ) : $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
@@ -589,7 +592,7 @@ index 3ad7db3..87b4f01 100644
  
  # sddparam is used by the filter operator.
  # It is not included automatically in sdctd.
-@@ -1643,7 +1643,7 @@ $(GLD)lzwe.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwe_)
+@@ -1651,7 +1651,7 @@ $(GLD)lzwe.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwe_)
  
  # We need slzwe.dev as a synonym for lzwe.dev for BAND_LIST_STORAGE = memory.
  $(GLD)slzwe.dev : $(GLD)lzwe.dev
@@ -598,7 +601,7 @@ index 3ad7db3..87b4f01 100644
  
  $(GLOBJ)slzwe.$(OBJ) : $(GLSRC)slzwe.c $(AK) $(stdio__h) $(gdebug_h)\
   $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
-@@ -1659,7 +1659,7 @@ $(GLD)lzwd.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwd_)
+@@ -1667,7 +1667,7 @@ $(GLD)lzwd.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwd_)
  
  # We need slzwd.dev as a synonym for lzwd.dev for BAND_LIST_STORAGE = memory.
  $(GLD)slzwd.dev : $(GLD)lzwd.dev
@@ -607,7 +610,7 @@ index 3ad7db3..87b4f01 100644
  
  $(GLOBJ)slzwd.$(OBJ) : $(GLSRC)slzwd.c $(AK) $(stdio__h) $(gdebug_h)\
   $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
-@@ -1709,7 +1709,7 @@ $(GLOBJ)saes.$(OBJ) : $(GLSRC)saes.c $(AK) $(memory__h)\
+@@ -1717,7 +1717,7 @@ $(GLOBJ)saes.$(OBJ) : $(GLSRC)saes.c $(AK) $(memory__h)\
  # ---------------- JBIG2 compression filter ---------------- #
  
  $(GLD)sjbig2.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjbig2_$(JBIG2_LIB).dev
@@ -616,7 +619,7 @@ index 3ad7db3..87b4f01 100644
  
  # jbig2dec version
  sjbig2_jbig2dec=$(GLOBJ)sjbig2.$(OBJ)
-@@ -1745,7 +1745,7 @@ $(GLOBJ)sjbig2_luratech.$(OBJ) : $(GLSRC)sjbig2_luratech.c $(AK) \
+@@ -1753,7 +1753,7 @@ $(GLOBJ)sjbig2_luratech.$(OBJ) : $(GLSRC)sjbig2_luratech.c $(AK) \
  # ---------------- JPEG 2000 compression filter ---------------- #
  
  $(GLD)sjpx.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjpx_$(JPX_LIB).dev
@@ -625,7 +628,7 @@ index 3ad7db3..87b4f01 100644
  
  $(GLOBJ)sjpx.$(OBJ) : $(GLSRC)sjpx.c $(AK) \
   $(memory__h) $(gsmalloc_h) \
-@@ -1874,7 +1874,7 @@ $(GLOBJ)szlibc_0.$(OBJ) : $(GLSRC)szlibc.c $(AK) $(std_h)\
+@@ -1882,7 +1882,7 @@ $(GLOBJ)szlibc_0.$(OBJ) : $(GLSRC)szlibc.c $(AK) $(std_h)\
  	$(GLZCC) $(GLO_)szlibc_0.$(OBJ) $(C_) $(GLSRC)szlibc.c
  
  $(GLOBJ)szlibc.$(OBJ) : $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
@@ -634,7 +637,7 @@ index 3ad7db3..87b4f01 100644
  
  szlibe_=$(szlibc_) $(GLOBJ)szlibe.$(OBJ)
  $(GLD)szlibe.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibe.dev $(szlibe_)
-@@ -1890,7 +1890,7 @@ $(GLOBJ)szlibe_0.$(OBJ) : $(GLSRC)szlibe.c $(AK) $(std_h)\
+@@ -1898,7 +1898,7 @@ $(GLOBJ)szlibe_0.$(OBJ) : $(GLSRC)szlibe.c $(AK) $(std_h)\
  	$(GLZCC) $(GLO_)szlibe_0.$(OBJ) $(C_) $(GLSRC)szlibe.c
  
  $(GLOBJ)szlibe.$(OBJ) : $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ)  $(MAKEDIRS)
@@ -643,7 +646,7 @@ index 3ad7db3..87b4f01 100644
  
  szlibd_=$(szlibc_) $(GLOBJ)szlibd.$(OBJ)
  $(GLD)szlibd.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibd.dev $(szlibd_)
-@@ -1906,7 +1906,7 @@ $(GLOBJ)szlibd_0.$(OBJ) : $(GLSRC)szlibd.c $(AK) $(std_h) $(memory__h)\
+@@ -1914,7 +1914,7 @@ $(GLOBJ)szlibd_0.$(OBJ) : $(GLSRC)szlibd.c $(AK) $(std_h) $(memory__h)\
  	$(GLZCC) $(GLO_)szlibd_0.$(OBJ) $(C_) $(GLSRC)szlibd.c
  
  $(GLOBJ)szlibd.$(OBJ) : $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
@@ -652,7 +655,7 @@ index 3ad7db3..87b4f01 100644
  
  # ---------------- Page devices ---------------- #
  # We include this here, rather than in devs.mak, because it is more like
-@@ -2796,7 +2796,7 @@ $(GLOBJ)gsicc_lcms_0.$(OBJ) : $(GLSRC)gsicc_lcms.c\
+@@ -2804,7 +2804,7 @@ $(GLOBJ)gsicc_lcms_0.$(OBJ) : $(GLSRC)gsicc_lcms.c\
  	$(GLLCMSCC) $(GLO_)gsicc_lcms_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms.c
  
  $(GLOBJ)gsicc_lcms.$(OBJ) : $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(gp_h)
@@ -661,16 +664,16 @@ index 3ad7db3..87b4f01 100644
  
  
  $(GLOBJ)gsicc_lcms2_1.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
-@@ -2808,7 +2808,7 @@ $(GLOBJ)gsicc_lcms2_0.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
- 	$(GLLCMS2CC) $(GLO_)gsicc_lcms2_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms2.c
+@@ -2817,7 +2817,7 @@ $(GLOBJ)gsicc_lcms2_0.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
  
- $(GLOBJ)gsicc_lcms2.$(OBJ) : $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(gp_h)
+ $(GLOBJ)gsicc_lcms2.$(OBJ) : $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(gp_h) \
+  $(gxsync_h)
 -	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ)
 +	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ) || true
  
  # Note that gsicc_create requires compile with lcms to obtain icc34.h
  # header file that is used for creating ICC structures from PS objects.
-@@ -2828,7 +2828,7 @@ $(GLOBJ)gsicc_create_0.$(OBJ) : $(GLSRC)gsicc_create.c $(AK) $(string__h)\
+@@ -2837,7 +2837,7 @@ $(GLOBJ)gsicc_create_0.$(OBJ) : $(GLSRC)gsicc_create.c $(AK) $(string__h)\
  	$(GLLCMSCC) $(GLO_)gsicc_create_0.$(OBJ) $(C_) $(GLSRC)gsicc_create.c
  
  $(GLOBJ)gsicc_create.$(OBJ) : $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(MAKEDIRS)
@@ -679,7 +682,7 @@ index 3ad7db3..87b4f01 100644
  
  
  #include "icc34.h"   /* Note this header is needed even if lcms is not compiled as default CMS */
-@@ -3132,7 +3132,7 @@ $(GLGEN)gsromfs1_1.c : $(MKROMFS_XE) $(PS_ROMFS_DEPS) $(MAKEDIRS)
+@@ -3141,7 +3141,7 @@ $(GLGEN)gsromfs1_1.c : $(MKROMFS_XE) $(PS_ROMFS_DEPS) $(MAKEDIRS)
  	$(PS_ROMFS_ARGS) $(GL_ROMFS_ARGS)
  
  $(GLGEN)gsromfs1.c : $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(MAKEDIRS)
@@ -688,7 +691,7 @@ index 3ad7db3..87b4f01 100644
  
  # the following module is only included if the romfs.dev FEATURE is enabled
  $(GLOBJ)gsiorom_1.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
-@@ -3148,7 +3148,7 @@ $(GLOBJ)gsiorom_0.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
+@@ -3157,7 +3157,7 @@ $(GLOBJ)gsiorom_0.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
  	$(GLCC) $(GLO_)gsiorom_0.$(OBJ) $(I_)$(ZI_)$(_I) $(C_) $(GLSRC)gsiorom.c
  
  $(GLOBJ)gsiorom.$(OBJ) : $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
@@ -711,7 +714,7 @@ index ca1b7cc..ad6446d 100644
  # external link .dev
  $(LWF_JP2_GEN)lwf_jp2_1.dev : $(TOP_MAKEFILES) $(LWF_JP2_MAK) $(ECHOGS_XE)
 diff --git a/base/macos-mcp.mak b/base/macos-mcp.mak
-index 4ded7f3..3599ed9 100644
+index 38a2937..2ab7cae 100644
 --- a/base/macos-mcp.mak
 +++ b/base/macos-mcp.mak
 @@ -383,11 +383,11 @@ CWPROJ_XML=./ghostscript.mcp.xml
@@ -731,7 +734,7 @@ index 4ded7f3..3599ed9 100644
  
  $(GS_XE): $(ld_tr) $(ECHOGS_XE) $(XE_ALL) $(CWPROJ_XML) $(PSOBJ)gsromfs$(COMPILE_INITS).$(OBJ)
 diff --git a/base/openjpeg.mak b/base/openjpeg.mak
-index 32be240..4a6b429 100644
+index b194709..dac7901 100644
 --- a/base/openjpeg.mak
 +++ b/base/openjpeg.mak
 @@ -99,7 +99,7 @@ open_jpeg_HDRS = \
@@ -744,7 +747,7 @@ index 32be240..4a6b429 100644
  # external link .dev
  $(OPEN_JPEG_GEN)openjpeg_1.dev : $(TOP_MAKEFILES) $(OPEN_JPEG_MAK) $(ECHOGS_XE)
 diff --git a/base/openvms.mak b/base/openvms.mak
-index e5ae40b..286ee84 100644
+index 1ea06fe..84378a4 100644
 --- a/base/openvms.mak
 +++ b/base/openvms.mak
 @@ -365,7 +365,7 @@ SH=
@@ -757,7 +760,7 @@ index e5ae40b..286ee84 100644
  # Define the command for deleting (a) file(s) (including wild cards)
  
 diff --git a/base/png.mak b/base/png.mak
-index f01c426..8a89884 100644
+index 1725ddb..0d54b80 100644
 --- a/base/png.mak
 +++ b/base/png.mak
 @@ -79,7 +79,7 @@ png.config-clean :
@@ -772,7 +775,7 @@ index f01c426..8a89884 100644
 @@ -134,7 +134,7 @@ $(PNGOBJ)pngget.$(OBJ) : $(PNGSRC)pngget.c $(PDEP)
  
  # Define the version of libpng.dev that we are actually using.
- $(PNGGEN)libpng.dev : $(TOP_MAKEFILES) $(PNGGEN)libpng_$(SHARE_LIBPNG).dev
+ $(PNGGEN)libpng.dev : $(TOP_MAKEFILES) $(PNGGEN)libpng_$(SHARE_LIBPNG).dev $(MAKEDIRS)
 -	$(CP_) $(PNGGEN)libpng_$(SHARE_LIBPNG).dev $(PNGGEN)libpng.dev
 +	$(CP_) $(PNGGEN)libpng_$(SHARE_LIBPNG).dev $(PNGGEN)libpng.dev || true
  
@@ -841,7 +844,7 @@ index 6aa3599..70a61f8 100644
  RMN_=rm -f
  
 diff --git a/base/zlib.mak b/base/zlib.mak
-index 6c50605..7fb8c9b 100644
+index 78d398a..3d48145 100644
 --- a/base/zlib.mak
 +++ b/base/zlib.mak
 @@ -83,7 +83,7 @@ $(ZOBJ)zutil.$(OBJ) : $(ZSRC)zutil.c $(ZDEP)
@@ -865,17 +868,17 @@ index 6c50605..7fb8c9b 100644
 @@ -127,7 +127,7 @@ $(ZOBJ)crc32.$(OBJ) : $(ZSRC)crc32.c $(ZDEP)
  # Decoding (decompression) code.
  
- $(ZGEN)zlibd.dev : $(TOP_MAKEFILES) $(ZGEN)zlibd_$(SHARE_ZLIB).dev
+ $(ZGEN)zlibd.dev : $(TOP_MAKEFILES) $(ZGEN)zlibd_$(SHARE_ZLIB).dev $(MAKEDIRS)
 -	$(CP_) $(ZGEN)zlibd_$(SHARE_ZLIB).dev $(ZGEN)zlibd.dev
 +	$(CP_) $(ZGEN)zlibd_$(SHARE_ZLIB).dev $(ZGEN)zlibd.dev || true
  
  $(ZGEN)zlibd_1.dev : $(TOP_MAKEFILES) $(ZLIB_MAK) $(ECHOGS_XE)
  	$(SETMOD) $(ZGEN)zlibd_1 -lib $(ZLIB_NAME)
 diff --git a/devices/devs.mak b/devices/devs.mak
-index bc22594..4bd0a11 100644
+index 0a668d4..a19082e 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
-@@ -1555,7 +1555,7 @@ libpng_dev=$(PNGGENDIR)$(D)libpng.dev
+@@ -1547,7 +1547,7 @@ libpng_dev=$(PNGGENDIR)$(D)libpng.dev
  png_i_=-include $(PNGGENDIR)$(D)libpng
  
  $(DEVOBJ)gdevpng.$(OBJ) : $(DEVSRC)gdevpng.c\
@@ -885,7 +888,7 @@ index bc22594..4bd0a11 100644
  
  $(DD)pngmono.dev : $(DEVS_MAK) $(libpng_dev) $(png_) $(GLD)page.dev $(GDEV)
 diff --git a/psi/int.mak b/psi/int.mak
-index 62cba0e..a1e963a 100644
+index 7d36e66..71b88f5 100644
 --- a/psi/int.mak
 +++ b/psi/int.mak
 @@ -274,7 +274,7 @@ $(PSOBJ)iconfig.$(OBJ) : $(gconfig_h) $(PSSRC)iconf.c $(stdio__h)\
@@ -925,5 +928,5 @@ index 62cba0e..a1e963a 100644
  fjpx_luratech=$(PSOBJ)zfjpx_luratech.$(OBJ)
  
 -- 
-1.8.1.2
+1.9.1
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
similarity index 96%
rename from meta/recipes-extended/ghostscript/ghostscript_9.14.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.15.bb
index 130dc1c..ee5483c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
@@ -31,8 +31,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "586494befb443363338c1b6379f13973"
-SRC_URI[sha256sum] = "ab2ba5ce11c8db396c9acf774a497182d7686d04670976cc3e690ada7db9f0d4"
+SRC_URI[md5sum] = "5a78ab0990ff6ec3a103576bc8777c46"
+SRC_URI[sha256sum] = "27f11e4fe5b89857ae745687281d1e4daf9681edc858a3f7e8e77ef09609777a"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
-- 
1.9.1


