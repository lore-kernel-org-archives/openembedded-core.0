Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CE6C46A549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 14:33:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jun 2013 07:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,937,1363158000"; d="scan'208";a="322313994"
Received: from unknown (HELO [10.255.13.89]) ([10.255.13.89])
	by azsmga001.ch.intel.com with ESMTP; 25 Jun 2013 07:33:41 -0700
Message-ID: <51C9AA45.1070605@linux.intel.com>
Date: Tue, 25 Jun 2013 07:33:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: wenzong.fan@windriver.com
References: <cover.1372125622.git.wenzong.fan@windriver.com>
	<054079cadbafac454357fbf3dea34942f68428d3.1372125622.git.wenzong.fan@windriver.com>
In-Reply-To: <054079cadbafac454357fbf3dea34942f68428d3.1372125622.git.wenzong.fan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ghostscript: upgrade to 9.07
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
X-List-Received-Date: Tue, 25 Jun 2013 14:33:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/24/2013 07:56 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Remove unuseful patch:
>    * 0001-make-ghostscript-work-with-long-building-directory.patch
>
> Port applicable patches:
>    * ghostscript-9.02-genarch.patch
>    * ghostscript-9.02-parallel-make.patch
>    * ghostscript-9.02-prevent_recompiling.patch
>    * ghostscript-9.05-NOT-check-endian.patch
>    * ghostscript-native-fix-disable-system-libtiff.patch
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   ...tscript-work-with-long-building-directory.patch |   22 -
>   .../ghostscript/ghostscript-9.02-genarch.patch     |    3 +-
>   .../ghostscript-9.02-parallel-make.patch           |  686 ++++++++++----------
>   .../ghostscript-9.02-prevent_recompiling.patch     |   67 +-
>   .../ghostscript-9.05-NOT-check-endian.patch        |   42 +-
>   ...tscript-native-fix-disable-system-libtiff.patch |   13 +-
>   .../{ghostscript_9.05.bb => ghostscript_9.07.bb}   |   17 +-
>   7 files changed, 421 insertions(+), 429 deletions(-)
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
>   rename meta/recipes-extended/ghostscript/{ghostscript_9.05.bb => ghostscript_9.07.bb} (90%)
>

There seems to be a problem with patching:

> ERROR: Command Error: exit status: 1  Output:
> Applying patch ghostscript-9.05-NOT-check-endian.patch
> File configure.ac is not a regular file -- can't patch
> 2 out of 2 hunks ignored -- rejects in file
> Patch ghostscript-9.05-NOT-check-endian.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86-64-lsb/build/build/tmp/work/x86_64-poky-linux/ghostscript/9.07-r0/temp/log.do_patch.19454
> NOTE: recipe ghostscript-9.07-r0: task do_patch: Failed
> ERROR: Task 3742 (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86-64-lsb/build/meta/recipes-extended/ghostscript/ghostscript_9.07.bb, do_patch) failed with exit code '1'

What's interesting is it failed on some. but not all builds.


Sau!


> diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
> deleted file mode 100644
> index 4dbf86f..0000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Accepted
> -
> -Make ghost script work with long building directory
> -
> -This patch has been accepted by upstream and should be removed
> -at the next update of ghostscript.
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
> -Index: base/genconf.c
> -==============================================================
> ---- a/base/genconf.c
> -+++ b/base/genconf.c
> -@@ -682,7 +682,7 @@ read_dev(config_t * pconf, const char *arg)
> -     string_item_t *item;
> -     const char *in;
> -
> --#define MAX_TOKEN 256
> -+#define MAX_TOKEN 512
> -     char *token = malloc(MAX_TOKEN + 1);
> -     char *category = malloc(MAX_TOKEN + 1);
> -     int file_index;
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
> index c18246c..e28a949 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
> +++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
> @@ -5,6 +5,7 @@ to Richard's opinion.
>   Upstream-Status: Pending
>
>   Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>
>   # Author: Chi Xu <chi.xu@windriver.com>
>   # Date: Feb 26 2010
> @@ -14,7 +15,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
>   diff -Nru ghostscript-8.64.orig/base/lib.mak ghostscript-8.64/base/lib.mak
>   --- ghostscript-8.64.orig/base/lib.mak	2010-02-10 10:30:02.000000000 +0800
>   +++ ghostscript-8.64/base/lib.mak	2010-02-10 10:56:21.000000000 +0800
> -@@ -66,8 +66,8 @@
> +@@ -67,8 +67,8 @@
>    stdpre_h=$(GLSRC)stdpre.h $(stdpn_h)
>    stdint__h=$(GLSRC)stdint_.h $(std_h)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
> index 7b72023..f3c0a73 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
> +++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
> @@ -4,222 +4,17 @@ http://bugzilla.pokylinux.org/show_bug.cgi?id=1202
>   Upstream-Status: Pending
>
>   Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>
>   RP: Extended || true to all CP_ operations, they all can race e.g.:
>   | cp -f ./obj/gconfxx.h ./obj/gconfig.h
>   | cp: cannot create regular file `./obj/gconfig.h': File exists
>
> -Index: ghostscript-9.05/base/unixhead.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/unixhead.mak	2012-03-29 08:27:46.458812172 +0000
> -+++ ghostscript-9.05/base/unixhead.mak	2012-03-29 08:27:52.526811946 +0000
> -@@ -54,7 +54,7 @@
> -
> - # Define generic commands.
> -
> --CP_=cp
> -+CP_=cp -f
> - RM_=rm -f
> - RMN_=rm -f
> -
> -Index: ghostscript-9.05/base/lib.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/lib.mak	2012-03-29 08:27:46.470812164 +0000
> -+++ ghostscript-9.05/base/lib.mak	2012-03-29 08:27:52.526811946 +0000
> -@@ -327,7 +327,7 @@
> - $(GLOBJ)md5.$(OBJ) : $(GLSRC)md5.c $(AK) $(md5_h) $(std_h) $(MAKEDIRS) $(EXP)$(ECHOGS_XE)
> - 	$(EXP)$(ECHOGS_XE) -w $(GLGEN)md5.h -x 23 include -x 2022 memory_.h -x 22
> - 	$(EXP)$(ECHOGS_XE) -a $(GLGEN)md5.h -+R $(GLSRC)md5.h
> --	$(CP_) $(GLSRC)md5.c $(GLGEN)md5.c
> -+	$(CP_) $(GLSRC)md5.c $(GLGEN)md5.c || true
> - 	$(GLCC) $(GLO_)md5.$(OBJ) $(C_) $(GLGEN)md5.c
> - 	$(RM_) $(GLGEN)md5.c $(GLGEN)md5.h
> -
> -@@ -593,22 +593,20 @@
> -  $(gscdefs_h) $(gconf_h)\
> -  $(gxdevice_h) $(gxiclass_h) $(gxiodev_h) $(gxiparam_h) $(TOP_MAKEFILES)\
> -  $(MAKEDDIRS)
> --	$(RM_) $(GLGEN)gconfig.c
> --	$(RM_) $(GLGEN)gconfig.h
> --	$(CP_) $(gconfig_h) $(GLGEN)gconfig.h
> --	$(CP_) $(GLSRC)gconf.c $(GLGEN)gconfig.c
> -+	$(CP_) $(gconfig_h) $(GLGEN)gconfig.h || true
> -+	$(CP_) $(GLSRC)gconf.c $(GLGEN)gconfig.c || true
> - 	$(GLCC) $(GLO_)gconfig.$(OBJ) $(C_) $(GLGEN)gconfig.c
> -
> - $(GLOBJ)gscdefs.$(OBJ) : $(GLSRC)gscdef.c\
> -  $(std_h) $(gscdefs_h) $(gconfigd_h) $(TOP_MAKEFILES) $(MAKEDIRS)
> - 	$(RM_) $(GLGEN)gscdefs.c
> --	$(CP_) $(GLSRC)gscdef.c $(GLGEN)gscdefs.c
> -+	$(CP_) $(GLSRC)gscdef.c $(GLGEN)gscdefs.c || true
> - 	$(GLCC) $(GLO_)gscdefs.$(OBJ) $(C_) $(GLGEN)gscdefs.c
> -
> - $(AUX)gscdefs.$(OBJ) : $(GLSRC)gscdef.c\
> -  $(std_h) $(gscdefs_h) $(gconfigd_h) $(TOP_MAKEFILES) $(MAKEDIRS)
> - 	$(RM_) $(AUX)gscdefs.c
> --	$(CP_) $(GLSRC)gscdef.c $(AUX)gscdefs.c
> -+	$(CP_) $(GLSRC)gscdef.c $(AUX)gscdefs.c || true
> - 	$(GLCCAUX) $(AUXO_)gscdefs.$(OBJ) $(C_) $(AUX)gscdefs.c
> -
> - $(GLOBJ)gxacpath.$(OBJ) : $(GLSRC)gxacpath.c $(AK) $(gx_h)\
> -@@ -1428,7 +1426,7 @@
> - 	$(GLJCC) $(GLO_)sjpegc_0.$(OBJ) $(C_) $(GLSRC)sjpegc.c
> -
> - $(GLOBJ)sjpegc.$(OBJ) : $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ)
> --	$(CP_) $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegc.$(OBJ)
> -+	$(CP_) $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegc.$(OBJ) || true
> -
> - # sdcparam is used by the filter operator and the PS/PDF writer.
> - # It is not included automatically in sdcte/d.
> -@@ -1456,7 +1454,7 @@
> - 	$(GLJCC) $(GLO_)sdcte_0.$(OBJ) $(C_) $(GLSRC)sdcte.c
> -
> - $(GLOBJ)sdcte.$(OBJ) : $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdcte.$(OBJ)
> -+	$(CP_) $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdcte.$(OBJ) || true
> -
> -
> - $(GLOBJ)sjpege_1.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
> -@@ -1472,7 +1470,7 @@
> - 	$(GLJCC) $(GLO_)sjpege_0.$(OBJ) $(C_) $(GLSRC)sjpege.c
> -
> - $(GLOBJ)sjpege.$(OBJ) : $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpege.$(OBJ)
> -+	$(CP_) $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpege.$(OBJ) || true
> -
> - # sdeparam is used by the filter operator and the PS/PDF writer.
> - # It is not included automatically in sdcte.
> -@@ -1504,7 +1502,7 @@
> - 	$(GLJCC) $(GLO_)sdctd_0.$(OBJ) $(C_) $(GLSRC)sdctd.c
> -
> - $(GLOBJ)sdctd.$(OBJ) : $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdctd.$(OBJ)
> -+	$(CP_) $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdctd.$(OBJ) || true
> -
> -
> - $(GLOBJ)sjpegd_1.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
> -@@ -1521,7 +1519,7 @@
> -
> -
> - $(GLOBJ)sjpegd.$(OBJ) : $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegd.$(OBJ)
> -+	$(CP_) $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegd.$(OBJ) || true
> -
> - # sddparam is used by the filter operator.
> - # It is not included automatically in sdctd.
> -@@ -1544,7 +1542,7 @@
> -
> - # We need slzwe.dev as a synonym for lzwe.dev for BAND_LIST_STORAGE = memory.
> - $(GLD)slzwe.dev : $(GLD)lzwe.dev
> --	$(CP_) $(GLD)lzwe.dev $(GLD)slzwe.dev
> -+	$(CP_) $(GLD)lzwe.dev $(GLD)slzwe.dev || true
> -
> - $(GLOBJ)slzwe.$(OBJ) : $(GLSRC)slzwe.c $(AK) $(stdio__h) $(gdebug_h)\
> -  $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
> -@@ -1560,7 +1558,7 @@
> -
> - # We need slzwd.dev as a synonym for lzwd.dev for BAND_LIST_STORAGE = memory.
> - $(GLD)slzwd.dev : $(GLD)lzwd.dev
> --	$(CP_) $(GLD)lzwd.dev $(GLD)slzwd.dev
> -+	$(CP_) $(GLD)lzwd.dev $(GLD)slzwd.dev || true
> -
> - $(GLOBJ)slzwd.$(OBJ) : $(GLSRC)slzwd.c $(AK) $(stdio__h) $(gdebug_h)\
> -  $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
> -@@ -1610,7 +1608,7 @@
> - # ---------------- JBIG2 compression filter ---------------- #
> -
> - $(GLD)sjbig2.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjbig2_$(JBIG2_LIB).dev
> --	$(CP_) $(GLD)sjbig2_$(JBIG2_LIB).dev $(GLD)sjbig2.dev
> -+	$(CP_) $(GLD)sjbig2_$(JBIG2_LIB).dev $(GLD)sjbig2.dev || true
> -
> - # jbig2dec version
> - sjbig2_jbig2dec=$(GLOBJ)sjbig2.$(OBJ)
> -@@ -1646,7 +1644,7 @@
> - # ---------------- JPEG 2000 compression filter ---------------- #
> -
> - $(GLD)sjpx.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjpx_$(JPX_LIB).dev
> --	$(CP_) $(GLD)sjpx_$(JPX_LIB).dev $(GLD)sjpx.dev
> -+	$(CP_) $(GLD)sjpx_$(JPX_LIB).dev $(GLD)sjpx.dev || true
> -
> - # jasper version
> - sjpx_jasper=$(GLOBJ)sjpx.$(OBJ)
> -@@ -1784,7 +1782,7 @@
> - 	$(GLZCC) $(GLO_)szlibc_0.$(OBJ) $(C_) $(GLSRC)szlibc.c
> -
> - $(GLOBJ)szlibc.$(OBJ) : $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibc.$(OBJ)
> -+	$(CP_) $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibc.$(OBJ) || true
> -
> - szlibe_=$(szlibc_) $(GLOBJ)szlibe.$(OBJ)
> - $(GLD)szlibe.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibe.dev $(szlibe_)
> -@@ -1800,7 +1798,7 @@
> - 	$(GLZCC) $(GLO_)szlibe_0.$(OBJ) $(C_) $(GLSRC)szlibe.c
> -
> - $(GLOBJ)szlibe.$(OBJ) : $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ)  $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibe.$(OBJ)
> -+	$(CP_) $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibe.$(OBJ) || true
> -
> - szlibd_=$(szlibc_) $(GLOBJ)szlibd.$(OBJ)
> - $(GLD)szlibd.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibd.dev $(szlibd_)
> -@@ -1816,7 +1814,7 @@
> - 	$(GLZCC) $(GLO_)szlibd_0.$(OBJ) $(C_) $(GLSRC)szlibd.c
> -
> - $(GLOBJ)szlibd.$(OBJ) : $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibd.$(OBJ)
> -+	$(CP_) $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibd.$(OBJ) || true
> -
> - # ---------------- Page devices ---------------- #
> - # We include this here, rather than in devs.mak, because it is more like
> -@@ -2757,7 +2755,7 @@
> - 	$(GLLCMSCC) $(GLO_)gsicc_lcms_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms.c
> -
> - $(GLOBJ)gsicc_lcms.$(OBJ) : $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ)
> --	$(CP_) $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms.$(OBJ)
> -+	$(CP_) $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms.$(OBJ) || true
> -
> -
> - $(GLOBJ)gsicc_lcms2_1.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
> -@@ -2769,7 +2767,7 @@
> - 	$(GLLCMS2CC) $(GLO_)gsicc_lcms2_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms2.c
> -
> - $(GLOBJ)gsicc_lcms2.$(OBJ) : $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ)
> --	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ)
> -+	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ) || true
> -
> - # Note that gsicc_create requires compile with lcms to obtain icc34.h
> - # header file that is used for creating ICC structures from PS objects.
> -@@ -2789,7 +2787,7 @@
> - 	$(GLLCMSCC) $(GLO_)gsicc_create_0.$(OBJ) $(C_) $(GLSRC)gsicc_create.c
> -
> - $(GLOBJ)gsicc_create.$(OBJ) : $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_create.$(OBJ)
> -+	$(CP_) $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_create.$(OBJ) || true
> -
> -
> - #include "icc34.h"   /* Note this header is needed even if lcms is not compiled as default CMS */
> -@@ -3060,7 +3058,7 @@
> - 	$(PS_ROMFS_ARGS) $(GL_ROMFS_ARGS)
> -
> - $(GLGEN)gsromfs1.c : $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(MAKEDIRS)
> --	$(CP_) $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(GLGEN)gsromfs1.c
> -+	$(CP_) $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(GLGEN)gsromfs1.c || true
> -
> - # the following module is only included if the romfs.dev FEATURE is enabled
> - $(GLOBJ)gsiorom_1.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
> -@@ -3076,7 +3074,7 @@
> - 	$(GLCC) $(GLO_)gsiorom_0.$(OBJ) $(I_)$(ZI_)$(_I) $(C_) $(GLSRC)gsiorom.c
> -
> - $(GLOBJ)gsiorom.$(OBJ) : $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
> --	$(CP_) $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)gsiorom.$(OBJ)
> -+	$(CP_) $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)gsiorom.$(OBJ) || true
> -
> - $(GLOBJ)gsromfs1.$(OBJ) : $(GLOBJ)gsromfs1.c $(time__h) $(MAKEDIRS)
> - 	$(GLCC) $(GLO_)gsromfs1.$(OBJ) $(C_) $(GLOBJ)gsromfs1.c
> -Index: ghostscript-9.05/base/expat.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/expat.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/expat.mak	2012-03-29 08:27:52.554812021 +0000
> -@@ -81,7 +81,7 @@
> +diff --git a/base/expat.mak b/base/expat.mak
> +index 4ee9c8c..2e16a9d 100644
> +--- a/base/expat.mak
> ++++ b/base/expat.mak
> +@@ -82,7 +82,7 @@ $(EXPATOBJ)xmltok.$(OBJ) : $(EXPATSRC)xmltok.c $(expat_xmltok_hdrs)
>    # Copy the target definition we want
>    $(EXPATGEN)expat.dev : $(TOP_MAKEFILES) $(EXPAT_MAK) \
>     $(EXPATGEN)expat_$(SHARE_EXPAT).dev
> @@ -228,11 +23,11 @@ Index: ghostscript-9.05/base/expat.mak
>
>    # Define the compiled in target
>    $(EXPATGEN)expat_0.dev : $(EXPAT_MAK) $(ECHOGS_XE) $(expat_)
> -Index: ghostscript-9.05/base/freetype.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/freetype.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/freetype.mak	2012-03-29 08:27:52.566812025 +0000
> -@@ -193,7 +193,7 @@
> +diff --git a/base/freetype.mak b/base/freetype.mak
> +index 16f2b95..409f75b 100644
> +--- a/base/freetype.mak
> ++++ b/base/freetype.mak
> +@@ -195,7 +195,7 @@ ft_winfonts=$(FTOBJ)winfnt.$(OBJ)
>
>    # instantiate the requested build option (shared or compiled in)
>    $(FTGEN)freetype.dev : $(TOP_MAKEFILES) $(FTGEN)freetype_$(SHARE_FT).dev
> @@ -241,11 +36,24 @@ Index: ghostscript-9.05/base/freetype.mak
>
>    # Define the shared version.
>    $(FTGEN)freetype_1.dev : $(TOP_MAKEFILES) $(FT_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/ijs.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/ijs.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/ijs.mak	2012-03-29 08:27:52.574812030 +0000
> -@@ -64,7 +64,7 @@
> +diff --git a/base/gs.mak b/base/gs.mak
> +index b804a3e..a343190 100644
> +--- a/base/gs.mak
> ++++ b/base/gs.mak
> +@@ -433,7 +433,7 @@ $(gconfxx_h) : $(ld_tr)
> +
> + $(gconfig_h) : $(gconfxx_h)
> + 	$(RM_) $(gconfig_h)
> +-	$(CP_) $(gconfxx_h) $(gconfig_h)
> ++	$(CP_) $(gconfxx_h) $(gconfig_h) || true
> + 	
> + # The line above is an empty command; don't delete.
> +
> +diff --git a/base/ijs.mak b/base/ijs.mak
> +index bc6d549..0139e1c 100644
> +--- a/base/ijs.mak
> ++++ b/base/ijs.mak
> +@@ -66,7 +66,7 @@ $(IJSGEN)ijslib_1.dev : $(TOP_MAKEFILES) $(IJS_MAK) $(ECHOGS_XE)
>
>
>    $(IJSGEN)ijslib.dev : $(TOP_MAKEFILES) $(IJS_MAK) $(IJSGEN)ijslib_$(SHARE_IJS).dev
> @@ -254,24 +62,11 @@ Index: ghostscript-9.05/base/ijs.mak
>
>
>    ijs_h=$(IJSSRC)ijs.h
> -Index: ghostscript-9.05/base/jasper.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/jasper.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/jasper.mak	2012-03-29 08:27:52.582812027 +0000
> -@@ -164,7 +164,7 @@
> -
> - # switch in the selected .dev
> - $(JASGEN)jasper.dev : $(TOP_MAKEFILES) $(JASGEN)jasper_$(SHARE_JPX).dev
> --	$(CP_) $(JASGEN)jasper_$(SHARE_JPX).dev $(JASGEN)jasper.dev
> -+	$(CP_) $(JASGEN)jasper_$(SHARE_JPX).dev $(JASGEN)jasper.dev || true
> -
> - # external link .dev
> - $(JASGEN)jasper_1.dev : $(TOP_MAKEFILES) $(JASPER_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/jbig2.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/jbig2.mak	2012-02-08 08:48:47.000000000 +0000
> -+++ ghostscript-9.05/base/jbig2.mak	2012-03-29 08:27:52.590812023 +0000
> -@@ -96,7 +96,7 @@
> +diff --git a/base/jbig2.mak b/base/jbig2.mak
> +index bb74630..44617a0 100644
> +--- a/base/jbig2.mak
> ++++ b/base/jbig2.mak
> +@@ -98,7 +98,7 @@ JBIG2O_=$(O_)$(JBIG2OBJ)
>
>    # switch in the version of libjbig2.dev we're actually using
>    $(JBIG2GEN)jbig2dec.dev : $(TOP_MAKEFILES) $(JBIG2GEN)jbig2dec_$(SHARE_JBIG2).dev
> @@ -280,11 +75,11 @@ Index: ghostscript-9.05/base/jbig2.mak
>
>    # dev file for shared (separately built) jbig2dec library
>    $(JBIG2GEN)jbig2dec_1.dev : $(TOP_MAKEFILES) $(JBIG2_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/jpeg.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/jpeg.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/jpeg.mak	2012-03-29 08:27:52.602812026 +0000
> -@@ -94,7 +94,7 @@
> +diff --git a/base/jpeg.mak b/base/jpeg.mak
> +index 5310a20..43cee63 100644
> +--- a/base/jpeg.mak
> ++++ b/base/jpeg.mak
> +@@ -96,7 +96,7 @@ jconfig_h=$(GLGEN)jconfig.h
>    jmorecfg_h=$(GLGEN)jmorecfg.h
>
>    $(GLGEN)jconfig_.h : $(GLGEN)jconfig$(SHARE_JPEG).h $(MAKEFILE) $(MAKEDIRS)
> @@ -293,7 +88,7 @@ Index: ghostscript-9.05/base/jpeg.mak
>
>    $(GLGEN)jconfig0.h : $(ECHOGS_XE) $(GLSRC)gsjconf.h $(stdpre_h) $(MAKEFILE)\
>     $(MAKEDIRS)
> -@@ -106,13 +106,13 @@
> +@@ -108,13 +108,13 @@ $(GLGEN)jconfig1.h : $(ECHOGS_XE) $(JPEG_MAK) $(MAKEDIRS)
>    	$(RMN_) $(GLGEN)jconfig0.h $(GLGEN)jconfig.h
>
>    $(GLGEN)jconfig.h : $(GLGEN)jconfig0.h $(MAKEDIRS)
> @@ -310,7 +105,7 @@ Index: ghostscript-9.05/base/jpeg.mak
>    	$(RM_) $(GLGEN)jmorecf1.h
>
>    $(GLGEN)jmorecf1.h : $(ECHOGS_XE) $(JPEG_MAK) $(MAKEDIRS)
> -@@ -120,10 +120,10 @@
> +@@ -122,10 +122,10 @@ $(GLGEN)jmorecf1.h : $(ECHOGS_XE) $(JPEG_MAK) $(MAKEDIRS)
>    	$(RMN_) $(GLGEN)jmorecf0.h $(GLGEN)jmorecfg.h
>
>    $(GLGEN)jmorecfg.h : $(GLGEN)jmorecf0.h $(MAKEDIRS)
> @@ -323,7 +118,7 @@ Index: ghostscript-9.05/base/jpeg.mak
>
>    # Contrary to what some portability bigots assert as fact, C compilers are
>    # not consistent about where they start searching for #included files:
> -@@ -139,23 +139,23 @@
> +@@ -141,23 +141,23 @@ $(GLGEN)jmcorig.h : $(JSRC)jmorecfg.h $(MAKEDIRS)
>    JHCOPY=$(GLGEN)jinclude.h $(GLGEN)jpeglib.h
>
>    $(GLGEN)jinclude.h : $(JSRC)jinclude.h $(MAKEDIRS)
> @@ -351,7 +146,7 @@ Index: ghostscript-9.05/base/jpeg.mak
>
>    # In order to avoid having to keep the dependency lists for the IJG code
>    # accurate, we simply make all of them depend on the only files that
> -@@ -172,40 +172,40 @@
> +@@ -174,40 +174,40 @@ $(JGEN)jpegc0.dev : $(JPEG_MAK) $(ECHOGS_XE) $(jpegc0_)
>    	$(SETMOD) $(JGEN)jpegc0 $(jpegc0_)
>
>    $(JOBJ)jcomapi.$(OBJ) : $(JSRC)jcomapi.c $(JDEP)
> @@ -399,7 +194,7 @@ Index: ghostscript-9.05/base/jpeg.mak
>
>    jpege6=$(JOBJ)jcapimin.$(OBJ) $(JOBJ)jcapistd.$(OBJ) $(JOBJ)jcinit.$(OBJ)
>
> -@@ -221,90 +221,90 @@
> +@@ -223,90 +223,90 @@ $(JGEN)jpege6.dev : $(JPEG_MAK) $(ECHOGS_XE) $(JGEN)jpegc0.dev $(jpege6) $(jpege
>    	$(ADDMOD) $(JGEN)jpege6 -obj $(jpege_3)
>
>    $(JOBJ)jcapimin.$(OBJ) : $(JSRC)jcapimin.c $(JDEP)
> @@ -507,7 +302,7 @@ Index: ghostscript-9.05/base/jpeg.mak
>
>    jpegd6=$(JOBJ)jdapimin.$(OBJ) $(JOBJ)jdapistd.$(OBJ) $(JOBJ)jdinput.$(OBJ) $(JOBJ)jdhuff.$(OBJ)
>
> -@@ -320,76 +320,76 @@
> +@@ -322,76 +322,76 @@ $(JGEN)jpegd6.dev : $(JPEG_MAK) $(ECHOGS_XE) $(JGEN)jpegc0.dev $(jpegd6) $(jpegd
>    	$(ADDMOD) $(JGEN)jpegd6 -obj $(jpegd_3)
>
>    $(JOBJ)jdapimin.$(OBJ) : $(JSRC)jdapimin.c $(JDEP)
> @@ -599,11 +394,11 @@ Index: ghostscript-9.05/base/jpeg.mak
>   +	$(CP_) $(JSRC)jdarith.c $(GLGEN)jdarith.c || true
>    	$(JCC) $(JO_)jdarith.$(OBJ) $(C_) $(GLGEN)jdarith.c
>    	$(RM_) $(GLGEN)jdarith.c
> -Index: ghostscript-9.05/base/jpegxr.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/jpegxr.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/jpegxr.mak	2012-03-29 08:27:52.606812026 +0000
> -@@ -100,7 +100,7 @@
> +diff --git a/base/jpegxr.mak b/base/jpegxr.mak
> +index 0f09a3a..36495dd 100644
> +--- a/base/jpegxr.mak
> ++++ b/base/jpegxr.mak
> +@@ -103,7 +103,7 @@ $(JPEGXR_OBJ)x_strip.$(OBJ) : $(JPEGXR_SRC)x_strip.c $(jpegxr_hdrs)
>    # Copy the target definition we want
>    $(JPEGXR_GEN)jpegxr.dev : $(TOP_MAKEFILES) $(JPEGXR_MAK) \
>     $(JPEGXR_GEN)jpegxr_$(SHARE_JPEGXR).dev
> @@ -612,11 +407,11 @@ Index: ghostscript-9.05/base/jpegxr.mak
>
>    # Define the compiled in target
>    $(JPEGXR_GEN)jpegxr_0.dev : $(JPEGXR_MAK) $(ECHOGS_XE) $(jpegxr_objs)
> -Index: ghostscript-9.05/base/lcms.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/lcms.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/lcms.mak	2012-03-29 08:27:52.614812023 +0000
> -@@ -83,7 +83,7 @@
> +diff --git a/base/lcms.mak b/base/lcms.mak
> +index dc7f9e5..2bccacd 100644
> +--- a/base/lcms.mak
> ++++ b/base/lcms.mak
> +@@ -84,7 +84,7 @@ LCMSO_=$(O_)$(LCMSOBJ)
>
>    # switch in the version of lcms.dev we're actually using
>    $(LCMSGEN)lcms.dev : $(TOP_MAKEFILES) $(LCMSGEN)lcms_$(SHARE_LCMS).dev
> @@ -625,11 +420,11 @@ Index: ghostscript-9.05/base/lcms.mak
>
>    # dev file for shared (separately built) lcms library
>    $(LCMSGEN)lcms_1.dev : $(TOP_MAKEFILES) $(LCMS_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/lcms2.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/lcms2.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/lcms2.mak	2012-03-29 08:27:52.626812023 +0000
> -@@ -83,7 +83,7 @@
> +diff --git a/base/lcms2.mak b/base/lcms2.mak
> +index 4e25f2e..be29d06 100644
> +--- a/base/lcms2.mak
> ++++ b/base/lcms2.mak
> +@@ -85,7 +85,7 @@ LCMS2O_=$(O_)$(LCMS2OBJ)
>
>    # switch in the version of lcms2.dev we're actually using
>    $(LCMS2GEN)lcms2.dev : $(TOP_MAKEFILES) $(LCMS2GEN)lcms2_$(SHARE_LCMS).dev
> @@ -638,11 +433,11 @@ Index: ghostscript-9.05/base/lcms2.mak
>
>    # dev file for shared (separately built) lcms library
>    $(LCMS2GEN)lcms2_1.dev : $(TOP_MAKEFILES) $(LCMS2_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/lcups.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/lcups.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/lcups.mak	2012-03-29 08:27:52.630812023 +0000
> -@@ -112,7 +112,7 @@
> +diff --git a/base/lcups.mak b/base/lcups.mak
> +index 0bfb3ac..fcdb170 100644
> +--- a/base/lcups.mak
> ++++ b/base/lcups.mak
> +@@ -114,7 +114,7 @@ libcups.config-clean :
>
>    # instantiate the requested build option (shared or compiled in)
>    $(LIBCUPSGEN)lcups.dev : $(TOP_MAKEFILES) $(LIBCUPSGEN)lcups_$(SHARE_LCUPS).dev
> @@ -651,7 +446,7 @@ Index: ghostscript-9.05/base/lcups.mak
>
>    # Define the shared version.
>    $(LIBCUPSGEN)lcups_1.dev : $(TOP_MAKEFILES) $(LCUPS_MAK) $(ECHOGS_XE)
> -@@ -129,7 +129,7 @@
> +@@ -131,7 +131,7 @@ $(LIBCUPSGEN)lcups_0.dev : $(TOP_MAKEFILES) $(LCUPS_MAK) $(ECHOGS_XE) \
>    # for simplicity we have every source file depend on all headers
>
>    $(LIBCUPSGEN)$(D)cups$(D)config.h : $(LCUPSSRCDIR)$(D)libs$(D)config$(LCUPSBUILDTYPE).h
> @@ -660,7 +455,7 @@ Index: ghostscript-9.05/base/lcups.mak
>
>    $(LIBCUPSOBJ)adminutil.$(OBJ) : $(LIBCUPSSRC)adminutil.c $(LIBSCUPSHEADERS) $(LIBCUPSGEN)$(D)cups$(D)config.h
>    	$(LCUPS_CC) $(LCUPSO_)adminutil.$(OBJ) $(C_) $(LIBCUPSSRC)adminutil.c
> -@@ -216,7 +216,7 @@
> +@@ -218,7 +218,7 @@ $(LIBCUPSOBJ)mark.$(OBJ) : $(LIBCUPSSRC)mark.c $(LIBSCUPSHEADERS)
>    	$(LCUPS_CC) $(LCUPSO_)mark.$(OBJ) $(C_) $(LIBCUPSSRC)mark.c
>
>    $(LIBCUPSOBJ)cups_md5.$(OBJ) : $(LIBCUPSSRC)md5.c $(LIBSCUPSHEADERS)
> @@ -669,7 +464,7 @@ Index: ghostscript-9.05/base/lcups.mak
>    	$(LCUPS_CC) $(LCUPSO_)cups_md5.$(OBJ) $(C_) $(LIBCUPSGEN)cups_md5.c
>
>    $(LIBCUPSOBJ)md5passwd.$(OBJ) : $(LIBCUPSSRC)md5passwd.c $(LIBSCUPSHEADERS)
> -@@ -253,7 +253,7 @@
> +@@ -255,7 +255,7 @@ $(LIBCUPSOBJ)snmp.$(OBJ) : $(LIBCUPSSRC)snmp.c $(LIBSCUPSHEADERS)
>    	$(LCUPS_CC) $(LCUPSO_)snmp.$(OBJ) $(C_) $(LIBCUPSSRC)snmp.c
>
>    $(LIBCUPSOBJ)cups_snpf.$(OBJ) : $(LIBCUPSSRC)snprintf.c $(LIBSCUPSHEADERS)
> @@ -678,18 +473,18 @@ Index: ghostscript-9.05/base/lcups.mak
>    	$(LCUPS_CC) $(LCUPSO_)cups_snpf.$(OBJ) $(C_) $(LIBCUPSGEN)cups_snpf.c
>
>    $(LIBCUPSOBJ)string.$(OBJ) : $(LIBCUPSSRC)string.c $(LIBSCUPSHEADERS)
> -@@ -269,5 +269,5 @@
> +@@ -271,5 +271,5 @@ $(LIBCUPSOBJ)usersys.$(OBJ) : $(LIBCUPSSRC)usersys.c $(LIBSCUPSHEADERS)
>    	$(LCUPS_CC) $(LCUPSO_)usersys.$(OBJ) $(C_) $(LIBCUPSSRC)usersys.c
>
>    $(LIBCUPSOBJ)cups_util.$(OBJ) : $(LIBCUPSSRC)util.c $(LIBSCUPSHEADERS)
>   -	$(CP_) $(LIBCUPSSRC)util.c $(LIBCUPSGEN)cups_util.c
>   +	$(CP_) $(LIBCUPSSRC)util.c $(LIBCUPSGEN)cups_util.c || true
>    	$(LCUPS_CC) $(LCUPSO_)cups_util.$(OBJ) $(C_) $(LIBCUPSGEN)cups_util.c
> -Index: ghostscript-9.05/base/lcupsi.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/lcupsi.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/lcupsi.mak	2012-03-29 08:27:52.642812024 +0000
> -@@ -71,7 +71,7 @@
> +diff --git a/base/lcupsi.mak b/base/lcupsi.mak
> +index ae1ecff..96d4003 100644
> +--- a/base/lcupsi.mak
> ++++ b/base/lcupsi.mak
> +@@ -73,7 +73,7 @@ libcupsi.config-clean :
>
>    # instantiate the requested build option (shared or compiled in)
>    $(LIBCUPSIGEN)lcupsi.dev : $(TOP_MAKEFILES) $(LIBCUPSIGEN)lcupsi_$(SHARE_LCUPSI).dev
> @@ -698,11 +493,11 @@ Index: ghostscript-9.05/base/lcupsi.mak
>
>    # Define the shared version.
>    $(LIBCUPSIGEN)lcupsi_1.dev : $(TOP_MAKEFILES) $(LCUPSI_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/ldf_jb2.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/ldf_jb2.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/ldf_jb2.mak	2012-03-29 08:27:52.650812024 +0000
> -@@ -222,7 +222,7 @@
> +diff --git a/base/ldf_jb2.mak b/base/ldf_jb2.mak
> +index 3f50892..97c76a0 100644
> +--- a/base/ldf_jb2.mak
> ++++ b/base/ldf_jb2.mak
> +@@ -223,7 +223,7 @@ ldf_jb2_HDRS=$(ldf_jb2_common_HDRS) $(ldf_jb2_compress_HDRS)
>
>    # switch in the selected library .dev
>    $(LDF_JB2_GEN)ldf_jb2.dev : $(TOP_MAKEFILES) $(LDF_JB2_MAK) $(LDF_JB2_GEN)ldf_jb2_$(SHARE_JBIG2).dev
> @@ -711,11 +506,200 @@ Index: ghostscript-9.05/base/ldf_jb2.mak
>
>    # external link .dev
>    $(LDF_JB2_GEN)ldf_jb2_1.dev : $(TOP_MAKEFILES) $(LDF_JB2_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/lwf_jp2.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/lwf_jp2.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/lwf_jp2.mak	2012-03-29 08:27:52.654812024 +0000
> -@@ -175,7 +175,7 @@
> +diff --git a/base/lib.mak b/base/lib.mak
> +index 7c1677b..179fed0 100644
> +--- a/base/lib.mak
> ++++ b/base/lib.mak
> +@@ -328,7 +328,7 @@ md5_=$(GLOBJ)md5.$(OBJ)
> + $(GLOBJ)md5.$(OBJ) : $(GLSRC)md5.c $(AK) $(md5_h) $(std_h) $(MAKEDIRS) $(EXP)$(ECHOGS_XE)
> + 	$(EXP)$(ECHOGS_XE) -w $(GLGEN)md5.h -x 23 include -x 2022 memory_.h -x 22
> + 	$(EXP)$(ECHOGS_XE) -a $(GLGEN)md5.h -+R $(GLSRC)md5.h
> +-	$(CP_) $(GLSRC)md5.c $(GLGEN)md5.c
> ++	$(CP_) $(GLSRC)md5.c $(GLGEN)md5.c || true
> + 	$(GLCC) $(GLO_)md5.$(OBJ) $(C_) $(GLGEN)md5.c
> + 	$(RM_) $(GLGEN)md5.c $(GLGEN)md5.h
> +
> +@@ -598,19 +598,19 @@ $(GLOBJ)gconfig.$(OBJ) : $(gconfig_h) $(GLSRC)gconf.c $(AK) $(gx_h)\
> +  $(gxdevice_h) $(gxiclass_h) $(gxiodev_h) $(gxiparam_h) $(TOP_MAKEFILES)\
> +  $(MAKEDDIRS)
> + 	$(RM_) $(GLGEN)gconfig.c
> +-	$(CP_) $(GLSRC)gconf.c $(GLGEN)gconfig.c
> ++	$(CP_) $(GLSRC)gconf.c $(GLGEN)gconfig.c || true
> + 	$(GLCC) $(GLO_)gconfig.$(OBJ) $(C_) $(GLGEN)gconfig.c
> +
> + $(GLOBJ)gscdefs.$(OBJ) : $(GLSRC)gscdef.c\
> +  $(std_h) $(gscdefs_h) $(gconfigd_h) $(TOP_MAKEFILES) $(MAKEDIRS)
> + 	$(RM_) $(GLGEN)gscdefs.c
> +-	$(CP_) $(GLSRC)gscdef.c $(GLGEN)gscdefs.c
> ++	$(CP_) $(GLSRC)gscdef.c $(GLGEN)gscdefs.c || true
> + 	$(GLCC) $(GLO_)gscdefs.$(OBJ) $(C_) $(GLGEN)gscdefs.c
> +
> + $(AUX)gscdefs.$(OBJ) : $(GLSRC)gscdef.c\
> +  $(std_h) $(gscdefs_h) $(gconfigd_h) $(TOP_MAKEFILES) $(MAKEDIRS)
> + 	$(RM_) $(AUX)gscdefs.c
> +-	$(CP_) $(GLSRC)gscdef.c $(AUX)gscdefs.c
> ++	$(CP_) $(GLSRC)gscdef.c $(AUX)gscdefs.c || true
> + 	$(GLCCAUX) $(AUXO_)gscdefs.$(OBJ) $(C_) $(AUX)gscdefs.c
> +
> + $(GLOBJ)gxacpath.$(OBJ) : $(GLSRC)gxacpath.c $(AK) $(gx_h)\
> +@@ -1513,7 +1513,7 @@ $(GLOBJ)sjpegc_0.$(OBJ) : $(GLSRC)sjpegc.c $(AK) $(stdio__h) $(string__h)\
> + 	$(GLJCC) $(GLO_)sjpegc_0.$(OBJ) $(C_) $(GLSRC)sjpegc.c
> +
> + $(GLOBJ)sjpegc.$(OBJ) : $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ)
> +-	$(CP_) $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegc.$(OBJ)
> ++	$(CP_) $(GLOBJ)sjpegc_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegc.$(OBJ) || true
> +
> + # sdcparam is used by the filter operator and the PS/PDF writer.
> + # It is not included automatically in sdcte/d.
> +@@ -1541,7 +1541,7 @@ $(GLOBJ)sdcte_0.$(OBJ) : $(GLSRC)sdcte.c $(AK)\
> + 	$(GLJCC) $(GLO_)sdcte_0.$(OBJ) $(C_) $(GLSRC)sdcte.c
> +
> + $(GLOBJ)sdcte.$(OBJ) : $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdcte.$(OBJ)
> ++	$(CP_) $(GLOBJ)sdcte_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdcte.$(OBJ) || true
> +
> +
> + $(GLOBJ)sjpege_1.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
> +@@ -1557,7 +1557,7 @@ $(GLOBJ)sjpege_0.$(OBJ) : $(GLSRC)sjpege.c $(AK)\
> + 	$(GLJCC) $(GLO_)sjpege_0.$(OBJ) $(C_) $(GLSRC)sjpege.c
> +
> + $(GLOBJ)sjpege.$(OBJ) : $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpege.$(OBJ)
> ++	$(CP_) $(GLOBJ)sjpege_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpege.$(OBJ) || true
> +
> + # sdeparam is used by the filter operator and the PS/PDF writer.
> + # It is not included automatically in sdcte.
> +@@ -1589,7 +1589,7 @@ $(GLOBJ)sdctd_0.$(OBJ) : $(GLSRC)sdctd.c $(AK)\
> + 	$(GLJCC) $(GLO_)sdctd_0.$(OBJ) $(C_) $(GLSRC)sdctd.c
> +
> + $(GLOBJ)sdctd.$(OBJ) : $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdctd.$(OBJ)
> ++	$(CP_) $(GLOBJ)sdctd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sdctd.$(OBJ) || true
> +
> +
> + $(GLOBJ)sjpegd_1.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
> +@@ -1606,7 +1606,7 @@ $(GLOBJ)sjpegd_0.$(OBJ) : $(GLSRC)sjpegd.c $(AK)\
> +
> +
> + $(GLOBJ)sjpegd.$(OBJ) : $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegd.$(OBJ)
> ++	$(CP_) $(GLOBJ)sjpegd_$(SHARE_JPEG).$(OBJ) $(GLOBJ)sjpegd.$(OBJ) || true
> +
> + # sddparam is used by the filter operator.
> + # It is not included automatically in sdctd.
> +@@ -1629,7 +1629,7 @@ $(GLD)lzwe.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwe_)
> +
> + # We need slzwe.dev as a synonym for lzwe.dev for BAND_LIST_STORAGE = memory.
> + $(GLD)slzwe.dev : $(GLD)lzwe.dev
> +-	$(CP_) $(GLD)lzwe.dev $(GLD)slzwe.dev
> ++	$(CP_) $(GLD)lzwe.dev $(GLD)slzwe.dev || true
> +
> + $(GLOBJ)slzwe.$(OBJ) : $(GLSRC)slzwe.c $(AK) $(stdio__h) $(gdebug_h)\
> +  $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
> +@@ -1645,7 +1645,7 @@ $(GLD)lzwd.dev : $(LIB_MAK) $(ECHOGS_XE) $(lzwd_)
> +
> + # We need slzwd.dev as a synonym for lzwd.dev for BAND_LIST_STORAGE = memory.
> + $(GLD)slzwd.dev : $(GLD)lzwd.dev
> +-	$(CP_) $(GLD)lzwd.dev $(GLD)slzwd.dev
> ++	$(CP_) $(GLD)lzwd.dev $(GLD)slzwd.dev || true
> +
> + $(GLOBJ)slzwd.$(OBJ) : $(GLSRC)slzwd.c $(AK) $(stdio__h) $(gdebug_h)\
> +  $(slzwx_h) $(strimpl_h) $(MAKEDIRS)
> +@@ -1695,7 +1695,7 @@ $(GLOBJ)saes.$(OBJ) : $(GLSRC)saes.c $(AK) $(memory__h)\
> + # ---------------- JBIG2 compression filter ---------------- #
> +
> + $(GLD)sjbig2.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjbig2_$(JBIG2_LIB).dev
> +-	$(CP_) $(GLD)sjbig2_$(JBIG2_LIB).dev $(GLD)sjbig2.dev
> ++	$(CP_) $(GLD)sjbig2_$(JBIG2_LIB).dev $(GLD)sjbig2.dev || true
> +
> + # jbig2dec version
> + sjbig2_jbig2dec=$(GLOBJ)sjbig2.$(OBJ)
> +@@ -1731,7 +1731,7 @@ $(GLOBJ)sjbig2_luratech.$(OBJ) : $(GLSRC)sjbig2_luratech.c $(AK) \
> + # ---------------- JPEG 2000 compression filter ---------------- #
> +
> + $(GLD)sjpx.dev : $(LIB_MAK) $(ECHOGS_XE) $(GLD)sjpx_$(JPX_LIB).dev
> +-	$(CP_) $(GLD)sjpx_$(JPX_LIB).dev $(GLD)sjpx.dev
> ++	$(CP_) $(GLD)sjpx_$(JPX_LIB).dev $(GLD)sjpx.dev || true
> +
> + $(GLOBJ)sjpx.$(OBJ) : $(GLSRC)sjpx.c $(AK) \
> +  $(memory__h) $(gsmalloc_h) \
> +@@ -1860,7 +1860,7 @@ $(GLOBJ)szlibc_0.$(OBJ) : $(GLSRC)szlibc.c $(AK) $(std_h)\
> + 	$(GLZCC) $(GLO_)szlibc_0.$(OBJ) $(C_) $(GLSRC)szlibc.c
> +
> + $(GLOBJ)szlibc.$(OBJ) : $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibc.$(OBJ)
> ++	$(CP_) $(GLOBJ)szlibc_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibc.$(OBJ) || true
> +
> + szlibe_=$(szlibc_) $(GLOBJ)szlibe.$(OBJ)
> + $(GLD)szlibe.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibe.dev $(szlibe_)
> +@@ -1876,7 +1876,7 @@ $(GLOBJ)szlibe_0.$(OBJ) : $(GLSRC)szlibe.c $(AK) $(std_h)\
> + 	$(GLZCC) $(GLO_)szlibe_0.$(OBJ) $(C_) $(GLSRC)szlibe.c
> +
> + $(GLOBJ)szlibe.$(OBJ) : $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ)  $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibe.$(OBJ)
> ++	$(CP_) $(GLOBJ)szlibe_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibe.$(OBJ) || true
> +
> + szlibd_=$(szlibc_) $(GLOBJ)szlibd.$(OBJ)
> + $(GLD)szlibd.dev : $(LIB_MAK) $(ECHOGS_XE) $(ZGENDIR)$(D)zlibd.dev $(szlibd_)
> +@@ -1892,7 +1892,7 @@ $(GLOBJ)szlibd_0.$(OBJ) : $(GLSRC)szlibd.c $(AK) $(std_h) $(memory__h)\
> + 	$(GLZCC) $(GLO_)szlibd_0.$(OBJ) $(C_) $(GLSRC)szlibd.c
> +
> + $(GLOBJ)szlibd.$(OBJ) : $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibd.$(OBJ)
> ++	$(CP_) $(GLOBJ)szlibd_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)szlibd.$(OBJ) || true
> +
> + # ---------------- Page devices ---------------- #
> + # We include this here, rather than in devs.mak, because it is more like
> +@@ -2843,7 +2843,7 @@ $(GLOBJ)gsicc_lcms_0.$(OBJ) : $(GLSRC)gsicc_lcms.c\
> + 	$(GLLCMSCC) $(GLO_)gsicc_lcms_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms.c
> +
> + $(GLOBJ)gsicc_lcms.$(OBJ) : $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ)
> +-	$(CP_) $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms.$(OBJ)
> ++	$(CP_) $(GLOBJ)gsicc_lcms_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms.$(OBJ) || true
> +
> +
> + $(GLOBJ)gsicc_lcms2_1.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
> +@@ -2855,7 +2855,7 @@ $(GLOBJ)gsicc_lcms2_0.$(OBJ) : $(GLSRC)gsicc_lcms2.c\
> + 	$(GLLCMS2CC) $(GLO_)gsicc_lcms2_0.$(OBJ) $(C_) $(GLSRC)gsicc_lcms2.c
> +
> + $(GLOBJ)gsicc_lcms2.$(OBJ) : $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ)
> +-	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ)
> ++	$(CP_) $(GLOBJ)gsicc_lcms2_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_lcms2.$(OBJ) || true
> +
> + # Note that gsicc_create requires compile with lcms to obtain icc34.h
> + # header file that is used for creating ICC structures from PS objects.
> +@@ -2875,7 +2875,7 @@ $(GLOBJ)gsicc_create_0.$(OBJ) : $(GLSRC)gsicc_create.c $(AK) $(string__h)\
> + 	$(GLLCMSCC) $(GLO_)gsicc_create_0.$(OBJ) $(C_) $(GLSRC)gsicc_create.c
> +
> + $(GLOBJ)gsicc_create.$(OBJ) : $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_create.$(OBJ)
> ++	$(CP_) $(GLOBJ)gsicc_create_$(SHARE_LCMS).$(OBJ) $(GLOBJ)gsicc_create.$(OBJ) || true
> +
> +
> + #include "icc34.h"   /* Note this header is needed even if lcms is not compiled as default CMS */
> +@@ -3146,7 +3146,7 @@ $(GLGEN)gsromfs1_1.c : $(MKROMFS_XE) $(PS_ROMFS_DEPS) $(MAKEDIRS)
> + 	$(PS_ROMFS_ARGS) $(GL_ROMFS_ARGS)
> +
> + $(GLGEN)gsromfs1.c : $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(MAKEDIRS)
> +-	$(CP_) $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(GLGEN)gsromfs1.c
> ++	$(CP_) $(GLGEN)gsromfs1_$(UFST_BRIDGE).c $(GLGEN)gsromfs1.c || true
> +
> + # the following module is only included if the romfs.dev FEATURE is enabled
> + $(GLOBJ)gsiorom_1.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
> +@@ -3162,7 +3162,7 @@ $(GLOBJ)gsiorom_0.$(OBJ) : $(GLSRC)gsiorom.c $(gsiorom_h) \
> + 	$(GLCC) $(GLO_)gsiorom_0.$(OBJ) $(I_)$(ZI_)$(_I) $(C_) $(GLSRC)gsiorom.c
> +
> + $(GLOBJ)gsiorom.$(OBJ) : $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(MAKEDIRS)
> +-	$(CP_) $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)gsiorom.$(OBJ)
> ++	$(CP_) $(GLOBJ)gsiorom_$(SHARE_ZLIB).$(OBJ) $(GLOBJ)gsiorom.$(OBJ) || true
> +
> + $(GLOBJ)gsromfs1.$(OBJ) : $(GLOBJ)gsromfs1.c $(time__h) $(MAKEDIRS)
> + 	$(GLCC) $(GLO_)gsromfs1.$(OBJ) $(C_) $(GLOBJ)gsromfs1.c
> +diff --git a/base/lwf_jp2.mak b/base/lwf_jp2.mak
> +index ca1b7cc..ad6446d 100644
> +--- a/base/lwf_jp2.mak
> ++++ b/base/lwf_jp2.mak
> +@@ -176,7 +176,7 @@ lwf_jp2_HDRS = \
>
>    # switch in the selected library .dev
>    $(LWF_JP2_GEN)lwf_jp2.dev : $(TOP_MAKEFILES) $(LWF_JP2_GEN)lwf_jp2_$(SHARE_JPX).dev
> @@ -724,11 +708,11 @@ Index: ghostscript-9.05/base/lwf_jp2.mak
>
>    # external link .dev
>    $(LWF_JP2_GEN)lwf_jp2_1.dev : $(TOP_MAKEFILES) $(LWF_JP2_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/macos-mcp.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/macos-mcp.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/macos-mcp.mak	2012-03-29 08:27:52.662812024 +0000
> -@@ -384,11 +384,11 @@
> +diff --git a/base/macos-mcp.mak b/base/macos-mcp.mak
> +index 5387a99..725ec73 100644
> +--- a/base/macos-mcp.mak
> ++++ b/base/macos-mcp.mak
> +@@ -380,11 +380,11 @@ CWPROJ_XML=./ghostscript.mcp.xml
>
>    $(CWPROJ_XML): $(gconfigd_h)
>    	-mkdir -p obj/sys
> @@ -744,12 +728,12 @@ Index: ghostscript-9.05/base/macos-mcp.mak
>    	/Developer/Tools/SetFile -c CWIE -t TEXT $(CWPROJ_XML)
>
>    $(GS_XE): $(ld_tr) $(ECHOGS_XE) $(XE_ALL) $(CWPROJ_XML) $(PSOBJ)gsromfs$(COMPILE_INITS).$(OBJ)
> -Index: ghostscript-9.05/base/openjpeg.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/openjpeg.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/openjpeg.mak	2012-03-29 08:27:52.662812024 +0000
> -@@ -86,11 +86,11 @@
> - 	$(OPEN_JPEG_SRC)tgt.h	\
> +diff --git a/base/openjpeg.mak b/base/openjpeg.mak
> +index 489dd3b..60e2015 100644
> +--- a/base/openjpeg.mak
> ++++ b/base/openjpeg.mak
> +@@ -94,11 +94,11 @@ open_jpeg_HDRS = \
> + 	$(OPEN_JPEG_SRC)indexbox_manager.h	\
>
>    $(OPEN_JPEG_CONFIG_H): $(TOP_MAKEFILES) $(JPXSRCDIR)$(D)opj_config.h.in.user
>   -	$(CP_) $(JPXSRCDIR)$(D)opj_config.h.in.user $(OPEN_JPEG_CONFIG_H)
> @@ -762,11 +746,11 @@ Index: ghostscript-9.05/base/openjpeg.mak
>
>    # external link .dev
>    $(OPEN_JPEG_GEN)openjpeg_1.dev : $(TOP_MAKEFILES) $(OPEN_JPEG_MAK) $(ECHOGS_XE)
> -Index: ghostscript-9.05/base/openvms.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/openvms.mak	2012-02-08 08:48:47.000000000 +0000
> -+++ ghostscript-9.05/base/openvms.mak	2012-03-29 08:27:52.674812022 +0000
> -@@ -364,7 +364,7 @@
> +diff --git a/base/openvms.mak b/base/openvms.mak
> +index 8e4c3dd..117dca4 100644
> +--- a/base/openvms.mak
> ++++ b/base/openvms.mak
> +@@ -362,7 +362,7 @@ SH=
>
>    # Define generic commands.
>
> @@ -775,11 +759,20 @@ Index: ghostscript-9.05/base/openvms.mak
>
>    # Define the command for deleting (a) file(s) (including wild cards)
>
> -Index: ghostscript-9.05/base/png.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/png.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/png.mak	2012-03-29 08:27:52.674812022 +0000
> -@@ -123,7 +123,7 @@
> +diff --git a/base/png.mak b/base/png.mak
> +index 66fc3c8..59535be 100644
> +--- a/base/png.mak
> ++++ b/base/png.mak
> +@@ -77,7 +77,7 @@ png.config-clean :
> + 	$(RM_) $(PNGGEN)lpg*.dev
> +
> + $(pnglibconf_h) : $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt
> +-	$(CP_)  $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt $(pnglibconf_h)
> ++	$(CP_)  $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt $(pnglibconf_h) || true
> +
> + PDEP=$(AK) $(pnglibconf_h)
> +
> +@@ -132,7 +132,7 @@ $(PNGOBJ)pngget.$(OBJ) : $(PNGSRC)pngget.c $(PDEP)
>
>    # Define the version of libpng.dev that we are actually using.
>    $(PNGGEN)libpng.dev : $(TOP_MAKEFILES) $(PNGGEN)libpng_$(SHARE_LIBPNG).dev
> @@ -788,11 +781,11 @@ Index: ghostscript-9.05/base/png.mak
>
>    # Define the shared version of libpng.
>    # Note that it requires libz, which must be searched *after* libpng.
> -Index: ghostscript-9.05/base/tiff.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/tiff.mak	2012-02-08 08:48:48.000000000 +0000
> -+++ ghostscript-9.05/base/tiff.mak	2012-03-29 08:27:52.674812022 +0000
> -@@ -48,11 +48,11 @@
> +diff --git a/base/tiff.mak b/base/tiff.mak
> +index 22e3906..317fb14 100644
> +--- a/base/tiff.mak
> ++++ b/base/tiff.mak
> +@@ -49,11 +49,11 @@ tiff_10=$(TIFFOBJ)tif_zip.$(OBJ)
>
>    $(TIFFSRC)libtiff$(D)tif_config.unix.h : $(TIFFSRC)libtiff$(D)tif_config.h.in
>    	cd $(TIFFSRC) && ./configure
> @@ -806,7 +799,7 @@ Index: ghostscript-9.05/base/tiff.mak
>
>    $(TIFFOBJ)tif_aux.$(OBJ) : $(TIFFSRC)/libtiff/tif_aux.c $(TIFFDEP)
>    	$(TIFFCC) $(TIFFO_)tif_aux.$(OBJ) $(C_) $(TIFFSRC)/libtiff/tif_aux.c
> -@@ -178,14 +178,14 @@
> +@@ -179,14 +179,14 @@ $(TIFFOBJ)tif_unix.$(OBJ) : $(TIFFSRC)/libtiff/tif_unix.c $(TIFFDEP)
>    	$(TIFFCC) $(TIFFO_)tif_unix.$(OBJ) $(C_) $(TIFFSRC)/libtiff/tif_unix.c
>
>    $(TIFFGEN)tif_config.h: $(TIFFCONFIG)
> @@ -824,24 +817,37 @@ Index: ghostscript-9.05/base/tiff.mak
>
>
>    # Define the shared version.
> -Index: ghostscript-9.05/base/unix-aux.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/unix-aux.mak	2012-03-21 17:51:12.106037764 +0000
> -+++ ghostscript-9.05/base/unix-aux.mak	2012-03-29 08:27:52.674812022 +0000
> -@@ -105,7 +105,7 @@
> - #	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) -lm $(EXTRALIBS)
> +diff --git a/base/unix-aux.mak b/base/unix-aux.mak
> +index 1ddad78..6b24422 100644
> +--- a/base/unix-aux.mak
> ++++ b/base/unix-aux.mak
> +@@ -105,7 +105,7 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
> + #	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
>    #
>    #$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(MAKEDIRS)
>   -#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
>   +#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE) || true
>
>    # Query the environment to construct gconfig_.h.
> - # The "else true;" is required because Ultrix's implementation of sh -e
> -Index: ghostscript-9.05/base/zlib.mak
> -===================================================================
> ---- ghostscript-9.05.orig/base/zlib.mak	2012-02-08 08:48:47.000000000 +0000
> -+++ ghostscript-9.05/base/zlib.mak	2012-03-29 08:27:52.678812021 +0000
> -@@ -82,7 +82,7 @@
> + # These are all defined conditionally (except the JasPER one), so that
> +diff --git a/base/unixhead.mak b/base/unixhead.mak
> +index 67b5434..c4582c1 100644
> +--- a/base/unixhead.mak
> ++++ b/base/unixhead.mak
> +@@ -55,7 +55,7 @@ SH=$(SHELL)
> +
> + # Define generic commands.
> +
> +-CP_=cp
> ++CP_=cp -f
> + RM_=rm -f
> + RMN_=rm -f
> +
> +diff --git a/base/zlib.mak b/base/zlib.mak
> +index 6c50605..7fb8c9b 100644
> +--- a/base/zlib.mak
> ++++ b/base/zlib.mak
> +@@ -83,7 +83,7 @@ $(ZOBJ)zutil.$(OBJ) : $(ZSRC)zutil.c $(ZDEP)
>    # Encoding (compression) code.
>
>    $(ZGEN)zlibe.dev : $(TOP_MAKEFILES) $(ZGEN)zlibe_$(SHARE_ZLIB).dev
> @@ -850,7 +856,7 @@ Index: ghostscript-9.05/base/zlib.mak
>
>    $(ZGEN)zlibe_1.dev : $(TOP_MAKEFILES) $(ZLIB_MAK) $(ECHOGS_XE)
>    	$(SETMOD) $(ZGEN)zlibe_1 -lib $(ZLIB_NAME)
> -@@ -110,7 +110,7 @@
> +@@ -111,7 +111,7 @@ $(ZOBJ)trees.$(OBJ) : $(ZSRC)trees.c $(ZDEP)
>    # with 0.90 do.
>
>    $(ZGEN)crc32.dev : $(TOP_MAKEFILES) $(ZGEN)crc32_$(SHARE_ZLIB).dev
> @@ -859,7 +865,7 @@ Index: ghostscript-9.05/base/zlib.mak
>
>    $(ZGEN)crc32_1.dev : $(TOP_MAKEFILES) $(ZLIB_MAK) $(ECHOGS_XE)
>    	$(SETMOD) $(ZGEN)crc32_1 -lib $(ZLIB_NAME)
> -@@ -126,7 +126,7 @@
> +@@ -127,7 +127,7 @@ $(ZOBJ)crc32.$(OBJ) : $(ZSRC)crc32.c $(ZDEP)
>    # Decoding (decompression) code.
>
>    $(ZGEN)zlibd.dev : $(TOP_MAKEFILES) $(ZGEN)zlibd_$(SHARE_ZLIB).dev
> @@ -868,22 +874,20 @@ Index: ghostscript-9.05/base/zlib.mak
>
>    $(ZGEN)zlibd_1.dev : $(TOP_MAKEFILES) $(ZLIB_MAK) $(ECHOGS_XE)
>    	$(SETMOD) $(ZGEN)zlibd_1 -lib $(ZLIB_NAME)
> -Index: ghostscript-9.05/psi/int.mak
> -===================================================================
> ---- ghostscript-9.05.orig/psi/int.mak	2012-03-29 08:28:53.942810602 +0000
> -+++ ghostscript-9.05/psi/int.mak	2012-03-29 08:29:05.814797444 +0000
> -@@ -272,8 +272,8 @@
> +diff --git a/psi/int.mak b/psi/int.mak
> +index 92f296e..ee6b136 100644
> +--- a/psi/int.mak
> ++++ b/psi/int.mak
> +@@ -274,7 +274,7 @@ $(PSOBJ)iconfig.$(OBJ) : $(gconfig_h) $(PSSRC)iconf.c $(stdio__h)\
>     $(gconf_h) $(gconfigd_h) $(gsmemory_h) $(gstypes_h)\
>     $(iminst_h) $(iref_h) $(ivmspace_h) $(opdef_h) $(iplugin_h)
>    	$(RM_) $(PSGEN)iconfig.c
> --	$(CP_) $(gconfig_h) $(PSGEN)gconfig.h
>   -	$(CP_) $(PSSRC)iconf.c $(PSGEN)iconfig.c
> -+	$(CP_) $(gconfig_h) $(PSGEN)gconfig.h || true
>   +	$(CP_) $(PSSRC)iconf.c $(PSGEN)iconfig.c || true
>    	$(PSCC) $(PSO_)iconfig.$(OBJ) $(C_) $(PSGEN)iconfig.c
>
>    $(PSOBJ)iinit.$(OBJ) : $(PSSRC)iinit.c $(GH) $(string__h)\
> -@@ -605,7 +605,7 @@
> +@@ -607,7 +607,7 @@ $(PSD)psbase.dev : $(INT_MAK) $(ECHOGS_XE) $(INT_OBJS)\
>
>    # We keep the old name for backward compatibility.
>    $(PSD)level1.dev : $(PSD)psl1.dev
> @@ -892,7 +896,7 @@ Index: ghostscript-9.05/psi/int.mak
>
>    $(PSD)psl1.dev : $(INT_MAK) $(ECHOGS_XE)\
>     $(PSD)psbase.dev $(PSD)bcp.dev $(PSD)path1.dev $(PSD)type1.dev
> -@@ -931,7 +931,7 @@
> +@@ -934,7 +934,7 @@ $(PSOBJ)zfrsd.$(OBJ) : $(PSSRC)zfrsd.c $(OP) $(memory__h)\
>
>    # We keep the old name for backward compatibility.
>    $(PSD)level2.dev : $(PSD)psl2.dev
> @@ -901,12 +905,12 @@ Index: ghostscript-9.05/psi/int.mak
>
>    # We -include dpsand2 first so that geninit will have access to the
>    # system name table as soon as possible.
> -@@ -1205,7 +1205,7 @@
> +@@ -1208,7 +1208,7 @@ $(PSOBJ)zfjbig2_luratech.$(OBJ) : $(PSSRC)zfjbig2.c $(OP) $(memory__h)\
>    # this can be turned on and off with a FEATURE_DEV
>
>    $(PSD)jpx.dev : $(INT_MAK) $(ECHOGS_XE) $(PSD)jpx_$(JPX_LIB).dev
>   -	$(CP_) $(PSD)jpx_$(JPX_LIB).dev $(PSD)jpx.dev
>   +	$(CP_) $(PSD)jpx_$(JPX_LIB).dev $(PSD)jpx.dev || true
>
> - fjpx_jasper=$(PSOBJ)zfjpx.$(OBJ)
> + fjpx_luratech=$(PSOBJ)zfjpx_luratech.$(OBJ)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
> index c37e4c4..db8740a 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
> +++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
> @@ -1,95 +1,96 @@
> -Just use commands provided by ghostscript-native, preventing recompile them when
> +ust use commands provided by ghostscript-native, preventing recompile them when
>   compile ghostscript.
>   Way to enable cross compile.
>
>   Upstream-Status: Pending
>
>   Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>
> ---- a/base/unix-aux.mak.orig	2011-10-17 16:12:20.354167007 +0800
> -+++ a/base/unix-aux.mak	2011-10-17 16:16:26.774167008 +0800
> -@@ -67,45 +67,45 @@
> +diff --git a/base/unix-aux.mak b/base/unix-aux.mak
> +index c032b3f..1ddad78 100644
> +--- a/base/unix-aux.mak
> ++++ b/base/unix-aux.mak
> +@@ -68,44 +68,44 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
>
>    # -------------------------- Auxiliary programs --------------------------- #
>
>   -$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(MAKEDIRS)
> --	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c
> +-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
>   -
>   -# On the RS/6000 (at least), compiling genarch.c with gcc with -O
>   -# produces a buggy executable.
>   -$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(MAKEDIRS)
> --	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c
> +-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
>   -
>   -$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(MAKEDIRS)
> --	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c
> +-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
>   -
>   -$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(MAKEDIRS)
> --	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c
> +-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
>   -
>   -$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(MAKEDIRS)
> --	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c
> +-	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
>   -
>   -# To get GS to use the system zlib, you remove/hide the gs/zlib directory
>   -# which means that the mkromfs build can't find the zlib source it needs.
>   -# So it's split into two targets, one using the zlib source directly.....
> --MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gscdefs.$(OBJ) $(AUX)gsmisc.$(OBJ) \
> -- $(AUX)gpmisc.$(OBJ) $(AUX)gslibctx.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
> -- $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
> +-MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
> +- $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
>   - $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
>   -
>   -$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0)
> --	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) -lm $(EXTRALIBS)
> +-	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
>   -
>   -# .... and one using the zlib library linked via the command line
> --MKROMFS_OBJS_1=$(GLOBJ)gscdefs.$(OBJ) $(GLOBJ)gsmisc.$(OBJ) \
> -- $(GLOBJ)gpmisc.$(OBJ) $(GLOBJ)gslibctx.$(OBJ) $(GLOBJ)gp_getnv.$(OBJ) \
> -- $(GLOBJ)gp_unix.$(OBJ) $(GLOBJ)gp_unifs.$(OBJ) $(GLOBJ)gp_unifn.$(OBJ) \
> -- $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gsutil.$(OBJ)
> +-MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
> +- $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
> +- $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
> +- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
>   -
>   -$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1)
> --	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) -lm $(EXTRALIBS)
> +-	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
>   -
>   -$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(MAKEDIRS)
>   -	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
>   +#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(MAKEDIRS)
> -+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c
> ++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
>   +#
>   +## On the RS/6000 (at least), compiling genarch.c with gcc with -O
>   +## produces a buggy executable.
>   +#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(MAKEDIRS)
> -+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c
> ++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
>   +#
>   +#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(MAKEDIRS)
> -+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c
> ++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
>   +#
>   +#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(MAKEDIRS)
> -+#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c
> ++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
>   +#
>   +#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(MAKEDIRS)
> -+#	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c
> ++#	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
>   +#
>   +## To get GS to use the system zlib, you remove/hide the gs/zlib directory
>   +## which means that the mkromfs build can't find the zlib source it needs.
>   +## So it's split into two targets, one using the zlib source directly.....
> -+#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gscdefs.$(OBJ) $(AUX)gsmisc.$(OBJ) \
> -+# $(AUX)gpmisc.$(OBJ) $(AUX)gslibctx.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
> -+# $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
> ++#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
> ++# $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
>   +# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
>   +#
>   +#$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0)
> -+#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) -lm $(EXTRALIBS)
> ++#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
>   +#
>   +## .... and one using the zlib library linked via the command line
> -+#MKROMFS_OBJS_1=$(GLOBJ)gscdefs.$(OBJ) $(GLOBJ)gsmisc.$(OBJ) \
> -+# $(GLOBJ)gpmisc.$(OBJ) $(GLOBJ)gslibctx.$(OBJ) $(GLOBJ)gp_getnv.$(OBJ) \
> -+# $(GLOBJ)gp_unix.$(OBJ) $(GLOBJ)gp_unifs.$(OBJ) $(GLOBJ)gp_unifn.$(OBJ) \
> -+# $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gsutil.$(OBJ)
> ++#MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
> ++# $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
> ++# $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
> ++# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
>   +#
>   +#$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1)
> -+#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) -lm $(EXTRALIBS)
> ++#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
>   +#
>   +#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(MAKEDIRS)
>   +#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
>
>    # Query the environment to construct gconfig_.h.
> - # The "else true;" is required because Ultrix's implementation of sh -e
> + # These are all defined conditionally (except the JasPER one), so that
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
> index c79063f..f78387d 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
> +++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
> @@ -5,10 +5,11 @@ Upstream-Status: Pending
>
>   Signed-off-by: Kang Kai <kai.kang@windriver.com>
>   Signed-off-by: Sen Zhang <sen.zhang@windriver.com>
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>
> ---- ghostscript-9.05/base/configure.ac.orig     2013-01-06 10:02:08.699479511 +0800
> -+++ ghostscript-9.05/base/configure.ac  2013-01-06 10:01:52.275382106 +0800
> -@@ -1741,13 +1741,13 @@
> +--- base/configure.ac.orig	2013-06-24 03:58:26.224723002 -0400
> ++++ base/configure.ac	2013-06-24 04:03:29.730807957 -0400
> +@@ -255,13 +255,13 @@
>
>    AC_MSG_CHECKING([for big endian])
>
> @@ -17,16 +18,27 @@ Signed-off-by: Sen Zhang <sen.zhang@windriver.com>
>   -   static const int one = 1;
>   -   return (*(char*)&one == 0 ? 0 : 1);
>   -  ])],
> --  [LCMS_BIGENDIAN=1],
> --  [LCMS_BIGENDIAN=0])
> -+dnl AC_RUN_IFELSE(
> -+dnl   [AC_LANG_PROGRAM([#include <stdio.h>], [
> -+dnl    static const int one = 1;
> -+dnl    return (*(char*)&one == 0 ? 0 : 1);
> -+dnl   ])],
> -+dnl   [LCMS_BIGENDIAN=1],
> -+dnl   [LCMS_BIGENDIAN=0])
> +-  [BIGENDIAN=1;AC_MSG_RESULT(big)],
> +-  [BIGENDIAN=0;AC_MSG_RESULT(little)])
> ++#AC_RUN_IFELSE(
> ++#  [AC_LANG_PROGRAM([#include <stdio.h>], [
> ++#   static const int one = 1;
> ++#   return (*(char*)&one == 0 ? 0 : 1);
> ++#  ])],
> ++#  [BIGENDIAN=1;AC_MSG_RESULT(big)],
> ++#  [BIGENDIAN=0;AC_MSG_RESULT(little)])
>
> - if test "x$LCMS_BIGENDIAN" != "x0"; then
> -   LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$LCMS_BIGENDIAN"
> -
> +
> +
> +@@ -1922,9 +1922,11 @@
> + if test "x$BIGENDIAN" != "x0"; then
> +   LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$BIGENDIAN"
> +   LCMS2_ENDIAN="-DCMS_USE_BIG_ENDIAN=$BIGENDIAN"
> ++  AC_MSG_RESULT(big)
> + else
> +   LCMS_ENDIAN=
> +   LCMS2_ENDIAN=
> ++  AC_MSG_RESULT(little)
> + fi
> +
> + AC_SUBST(LCMS_ENDIAN)
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
> index ce254f6..40afd37 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
> +++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
> @@ -11,38 +11,37 @@ diff --git a/base/configure.ac b/base/configure.ac
>   index bb05105..4b817ac 100644
>   --- a/base/configure.ac
>   +++ b/base/configure.ac
> -@@ -814,17 +814,23 @@ Disabling tiff output devices.])
> +@@ -951,17 +951,22 @@
>    esac
>
>    if test $SHARE_LIBTIFF -eq 0; then
>   -      echo
>   -      echo "Running libtiff configure script..."
>   -      olddir=`pwd`
> --      cd $LIBTIFFDIR && ./configure --disable-jbig $SUBCONFIG_OPTS
> +-      cd "$LIBTIFFDIR" && ./configure --disable-jbig --disable-lzma $SUBCONFIG_OPTS
>   -      status=$?
>   -      if test "$status" -ne 0 ; then
>   -        AC_MSG_ERROR([libtiff configure script failed], $status)
>   -      fi
> --      cd $olddir
> +-      cd "$olddir"
>   -      echo
>   -      echo "Continuing with Ghostscript configuration..."
>   +    if test -e $LIBTIFFDIR/configure; then
>   +        echo
>   +        echo "Running libtiff configure script..."
>   +        olddir=`pwd`
> -+        cd $LIBTIFFDIR && ./configure --disable-jbig $SUBCONFIG_OPTS
> ++        cd "$LIBTIFFDIR" && ./configure --disable-jbig --disable-lzma $SUBCONFIG_OPTS
>   +        status=$?
>   +        if test "$status" -ne 0 ; then
> -+          AC_MSG_ERROR([libtiff configure script failed], $status)
> ++            AC_MSG_ERROR([libtiff configure script failed], $status)
>   +        fi
> -+        cd $olddir
> ++        cd "$olddir"
>   +        echo
>   +        echo "Continuing with Ghostscript configuration..."
>   +    else
>   +        AC_MSG_NOTICE([Could not find local copy of libtiff.
>   +Disabling tiff output devices.])
>   +    fi
> -+
>    fi
>
>    AC_SUBST(SHARE_LIBTIFF)
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
> similarity index 90%
> rename from meta/recipes-extended/ghostscript/ghostscript_9.05.bb
> rename to meta/recipes-extended/ghostscript/ghostscript_9.07.bb
> index 9ec5712..bd4dd75 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
> @@ -13,9 +13,7 @@ HOMEPAGE = "http://www.ghostscript.com"
>   SECTION = "console/utils"
>
>   LICENSE = "GPLv3"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
> -
> -PR = "r6"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a5146dadaa8cd9f5f913b7577d49bf19"
>
>   DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
>   DEPENDS_class-native = ""
> @@ -31,12 +29,11 @@ SRC_URI = "${SRC_URI_BASE} \
>              "
>
>   SRC_URI_class-native = "${SRC_URI_BASE} \
> -                        file://0001-make-ghostscript-work-with-long-building-directory.patch \
>                           file://ghostscript-native-fix-disable-system-libtiff.patch \
>                           "
>
> -SRC_URI[md5sum] = "f7c6f0431ca8d44ee132a55d583212c1"
> -SRC_URI[sha256sum] = "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1faaf8f59a15cc207"
> +SRC_URI[md5sum] = "57ebf17c5abcf0fc95a386bfff08c1a4"
> +SRC_URI[sha256sum] = "44800d004c53f13192d1b5db413119198ddfc8a11c4d2a030aac2f2fda822ebf"
>
>   EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper \
>                   --with-fontpath=${datadir}/fonts --with-install-cups --without-libidn"
> @@ -64,11 +61,11 @@ do_configure_prepend () {
>   		cp ${WORKDIR}/objarch.h obj/arch.h
>   	fi
>   	if [ ${SITEINFO_ENDIANNESS} = "le" ]; then
> -		export LCMS_BIGENDIAN="0"
> -		export LCMS2_BIGENDIAN="0"
> +		export BIGENDIAN="0"
> +		export BIGENDIAN="0"
>   	else
> -		export LCMS_BIGENDIAN="1"
> -		export LCMS2_BIGENDIAN="1"
> +		export BIGENDIAN="1"
> +		export BIGENDIAN="1"
>   	fi
>   }
>
>

