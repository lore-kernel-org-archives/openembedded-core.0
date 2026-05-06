Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B837CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 21:29:02 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31794.1778102939418253853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 14:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=by8gVbSI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026050621285629750d16bd0002075f-zp2chh@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026050621285629750d16bd0002075f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 06 May 2026 23:28:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xm9mYnSdGzQdODedWkARCjiAPwipKflVZcFsfzpYae0=;
 b=by8gVbSI/GWj47fVj8HlkFL/BheccmemXelMSIL8lJdIPSFY+tDSdSlSrVKhls85En1GZd
 8Oe1tvYjNtYw7ZDWIjcOlHAPguXSGhnSdDqYKsyLJUgOGquCEuLf2o5RcC/TPFr4ojRzDVFS
 I5fmDDUl/BQDJkWp4lbWZODwHJrCMHAJamMdgQLuQnkhdEijbt7oofqb0ADibuvB2zVALVU0
 Oa1Sz5gB/w+mNMXnWKybOtz/qHN33qJZNB5xu9vWS22hNeqrHB+D882SztAKtin1ZvKCJuFp
 3eOGvWno20pdg1OtVVqMQ5fFa5P9oUuGhl1m8G+g9iSzUypGdwz9w1WA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] ffmpeg: upgrade 8.0.1 -> 8.1.1
Date: Wed,  6 May 2026 23:28:40 +0200
Message-ID: <20260506212840.902139-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236553

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-12343, CVE-2025-69693 and CVE-2026-40962.

Remove patches included in this release and refresh remaining patch.

Remove obsolete CVE_STATUS assigments for CVEs no longer reported as
unpatched with this new version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...k-Consolidate-pattern-rules-for-comp.patch | 106 ------------------
 ...s-Fix-double-build-by-disabling-.d-f.patch |  78 -------------
 ...ak-ensure-target-directories-are-cre.patch |   2 +-
 .../{ffmpeg_8.0.1.bb => ffmpeg_8.1.1.bb}      |   9 +-
 4 files changed, 2 insertions(+), 193 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_8.0.1.bb => ffmpeg_8.1.1.bb} (93%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
deleted file mode 100644
index 6af9254d95..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 95f1f05409fceb8b3615fa618554667a238f99a5 Mon Sep 17 00:00:00 2001
-From: softworkz <softworkz@hotmail.com>
-Date: Tue, 27 May 2025 23:24:20 +0200
-Subject: [PATCH] ffbuild/commonmak: Consolidate pattern rules for compression
-
-This commit simplifies and consolidates all the rules around
-ptx and resource file compression.
-
-Signed-off-by: softworkz <softworkz@hotmail.com>
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/a125f5db03b86c03fffb9598bd6e2026ba2c7a97]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ffbuild/common.mak | 43 +++++++++++++++++--------------------------
- 1 file changed, 17 insertions(+), 26 deletions(-)
-
-diff --git a/ffbuild/common.mak b/ffbuild/common.mak
-index 81e8a46..0a60d01 100644
---- a/ffbuild/common.mak
-+++ b/ffbuild/common.mak
-@@ -115,6 +115,12 @@ COMPILE_LASX = $(call COMPILE,CC,LASXFLAGS)
- $(BIN2CEXE): ffbuild/bin2c_host.o
- 	$(HOSTLD) $(HOSTLDFLAGS) $(HOSTLD_O) $^ $(HOSTEXTRALIBS)
- 
-+RUN_BIN2C = $(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
-+RUN_GZIP  = $(M)gzip -nc9 $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) >$@
-+RUN_MINIFY = $(M)sed 's!/\\*.*\\*/!!g' $< | tr '\n' ' ' | tr -s ' ' | sed 's/^ //; s/ $$//' > $@
-+%.gz: TAG = GZIP
-+%.min: TAG = MINIFY
-+
- %.metal.air: %.metal
- 	$(METALCC) $< -o $@
- 
-@@ -122,61 +128,46 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
- 	$(METALLIB) --split-module-without-linking $< -o $@
- 
- %.metallib.c: %.metallib $(BIN2CEXE)
--	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
-+	$(RUN_BIN2C)
- 
- %.ptx: %.cu $(SRC_PATH)/compat/cuda/cuda_runtime.h
- 	$(COMPILE_NVCC)
- 
- ifdef CONFIG_PTX_COMPRESSION
--%.ptx.gz: TAG = GZIP
- %.ptx.gz: %.ptx
--	$(M)gzip -nc9 $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) >$@
-+	$(RUN_GZIP)
- 
- %.ptx.c: %.ptx.gz $(BIN2CEXE)
--	$(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
-+	$(RUN_BIN2C)
- else
- %.ptx.c: %.ptx $(BIN2CEXE)
--	$(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
-+	$(RUN_BIN2C)
- endif
- 
--# 1) Preprocess CSS to a minified version
--%.css.min: TAG = SED
- %.css.min: %.css
--	$(M)sed 's!/\\*.*\\*/!!g' $< \
--	| tr '\n' ' ' \
--	| tr -s ' ' \
--	| sed 's/^ //; s/ $$//' \
--	> $@
-+	$(RUN_MINIFY)
- 
- ifdef CONFIG_RESOURCE_COMPRESSION
- 
--# 2) Gzip the minified CSS
--%.css.min.gz: TAG = GZIP
- %.css.min.gz: %.css.min
--	$(M)gzip -nc9 $< > $@
-+	$(RUN_GZIP)
- 
--# 3) Convert the gzipped CSS to a .c array
- %.css.c: %.css.min.gz $(BIN2CEXE)
--	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
-+	$(RUN_BIN2C)
- 
--# 4) Gzip the HTML file (no minification needed)
--%.html.gz: TAG = GZIP
- %.html.gz: %.html
--	$(M)gzip -nc9 $< > $@
-+	$(RUN_GZIP)
- 
--# 5) Convert the gzipped HTML to a .c array
- %.html.c: %.html.gz $(BIN2CEXE)
--	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
-+	$(RUN_BIN2C)
- 
- else   # NO COMPRESSION
- 
--# 2) Convert the minified CSS to a .c array
- %.css.c: %.css.min $(BIN2CEXE)
--	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
-+	$(RUN_BIN2C)
- 
--# 3) Convert the plain HTML to a .c array
- %.html.c: %.html $(BIN2CEXE)
--	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
-+	$(RUN_BIN2C)
- endif
- 
- clean::
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
deleted file mode 100644
index 20009c1022..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From a789ffae9de93eb70c355a81f9dd2ebf5d6b17a7 Mon Sep 17 00:00:00 2001
-From: softworkz <softworkz@hotmail.com>
-Date: Mon, 23 Jun 2025 14:56:19 +0200
-Subject: [PATCH] fftools/resources: Fix double-build by disabling .d file
- generation
-
-Signed-off-by: softworkz <softworkz@hotmail.com>
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/f52d9dd8693bc4628520258f18f89b4a3bf85533]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ffbuild/common.mak         |  6 ++----
- fftools/Makefile           |  1 +
- fftools/resources/Makefile | 12 +++++++++---
- 3 files changed, 12 insertions(+), 7 deletions(-)
-
-diff --git a/ffbuild/common.mak b/ffbuild/common.mak
-index ddf4892..81e8a46 100644
---- a/ffbuild/common.mak
-+++ b/ffbuild/common.mak
-@@ -229,11 +229,9 @@ SKIPHEADERS += $(ARCH_HEADERS:%=$(ARCH)/%) $(SKIPHEADERS-)
- SKIPHEADERS := $(SKIPHEADERS:%=$(SUBDIR)%)
- HOBJS        = $(filter-out $(SKIPHEADERS:.h=.h.o),$(ALLHEADERS:.h=.h.o))
- PTXOBJS      = $(filter %.ptx.o,$(OBJS))
--RESOURCEOBJS = $(filter %.css.o %.html.o,$(OBJS))
- $(HOBJS):     CCFLAGS += $(CFLAGS_HEADERS)
- checkheaders: $(HOBJS)
--.SECONDARY:   $(HOBJS:.o=.c) $(PTXOBJS:.o=.c) $(PTXOBJS:.o=.gz) $(PTXOBJS:.o=) $(RESOURCEOBJS:.o=.c) $(RESOURCEOBJS:%.css.o=%.css.min) $(RESOURCEOBJS:%.css.o=%.css.min.gz) $(RESOURCEOBJS:%.html.o=%.html.gz) $(RESOURCEOBJS:.o=)
--
-+.SECONDARY:   $(HOBJS:.o=.c) $(PTXOBJS:.o=.c) $(PTXOBJS:.o=.gz) $(PTXOBJS:.o=)
- alltools: $(TOOLS)
- 
- $(HOSTOBJS): %.o: %.c
-@@ -252,7 +250,7 @@ $(TOOLOBJS): | tools
- 
- OUTDIRS := $(OUTDIRS) $(dir $(OBJS) $(HOBJS) $(HOSTOBJS) $(SHLIBOBJS) $(STLIBOBJS) $(TESTOBJS))
- 
--CLEANSUFFIXES     = *.d *.gcda *.gcno *.h.c *.ho *.map *.o *.objs *.pc *.ptx *.ptx.gz *.ptx.c *.ver *.version *.html.gz *.html.c *.css.gz *.css.c  *$(DEFAULT_X86ASMD).asm *~ *.ilk *.pdb
-+CLEANSUFFIXES     = *.d *.gcda *.gcno *.h.c *.ho *.map *.o *.objs *.pc *.ptx *.ptx.gz *.ptx.c *.ver *.version *.html.gz *.html.c *.css.min.gz *.css.min *.css.c  *$(DEFAULT_X86ASMD).asm *~ *.ilk *.pdb
- LIBSUFFIXES       = *.a *.lib *.so *.so.* *.dylib *.dll *.def *.dll.a
- 
- define RULES
-diff --git a/fftools/Makefile b/fftools/Makefile
-index b3c08ae..bdb44fc 100644
---- a/fftools/Makefile
-+++ b/fftools/Makefile
-@@ -36,6 +36,7 @@ OBJS-ffmpeg +=                  \
-     fftools/textformat/tw_buffer.o    \
-     fftools/textformat/tw_stdout.o    \
-     $(OBJS-resman)                    \
-+    $(RESOBJS)                        \
- 
- OBJS-ffprobe +=                       \
-     fftools/textformat/avtextformat.o \
-diff --git a/fftools/resources/Makefile b/fftools/resources/Makefile
-index 8579a52..3c93648 100644
---- a/fftools/resources/Makefile
-+++ b/fftools/resources/Makefile
-@@ -4,10 +4,16 @@ clean::
- vpath %.html $(SRC_PATH)
- vpath %.css  $(SRC_PATH)
- 
--# Uncomment to prevent deletion during build
--#.PRECIOUS: %.css.c %.css.min %.css.gz %.css.min.gz %.html.gz %.html.c
--
- OBJS-resman +=                     \
-     fftools/resources/resman.o     \
-+
-+
-+RESOBJS +=                         \
-     fftools/resources/graph.html.o \
-     fftools/resources/graph.css.o  \
-+
-+
-+$(RESOBJS): CCDEP       =
-+$(RESOBJS): CC_DEPFLAGS =
-+
-+.SECONDARY: $(RESOBJS:.o=.gz) $(RESOBJS:.o=.c) $(RESOBJS:%.css.o=%.css.min) $(RESOBJS:%.css.o=%.css.min.gz) $(RESOBJS:%.html.o=%.html.gz) $(RESOBJS:.o=)
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
index a27e30f710..2e26078f0f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
@@ -30,7 +30,7 @@ diff --git a/ffbuild/common.mak b/ffbuild/common.mak
 index 0a60d01..346bb0a 100644
 --- a/ffbuild/common.mak
 +++ b/ffbuild/common.mak
-@@ -116,8 +116,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
+@@ -126,8 +126,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
  	$(HOSTLD) $(HOSTLDFLAGS) $(HOSTLD_O) $^ $(HOSTEXTRALIBS)
  
  RUN_BIN2C = $(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
similarity index 93%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
index b6d3ceb6dc..bfa35882ea 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
@@ -23,12 +23,10 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch \
-           file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
-SRC_URI[sha256sum] = "05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41"
+SRC_URI[sha256sum] = "b6863adde98898f42602017462871b5f6333e65aec803fdd7a6308639c52edf3"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
@@ -172,14 +170,9 @@ FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
 CVE_PRODUCT = "ffmpeg libswresample libavcodec"
 
-CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
-CVE_STATUS_WRONG_CPE = "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
-CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used version"
-
 CVE_STATUS[CVE-2022-2566] = "fixed-version: these CVEs are fixed since v5.1.1"
 CVE_STATUS[CVE-2025-9951] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
-CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"

