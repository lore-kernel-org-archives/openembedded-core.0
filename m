Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEE671E63
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:10:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0I8A5Bu007340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 18 Jan 2016 00:10:06 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 00:10:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 18 Jan 2016 03:09:59 -0500
Message-ID: <ecf9f892112a4b3a8a5b79e1ab9aac3f411773ed.1453104253.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453104253.git.hongxu.jia@windriver.com>
References: <cover.1453104253.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/2] ghostscript: 9.16 -> 9.18
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
X-List-Received-Date: Mon, 18 Jan 2016 08:10:08 -0000
Content-Type: text/plain

- Backport patches to fix build failure caused by
  '--without-jbig2dec' and '--without-jbig2dec'.
  ...
  |make[1]: *** No rule to make target `obj/sjbig2_.dev',
  needed by `obj/sjbig2.dev'.  Stop.
  ...
  http://bugs.ghostscript.com/show_bug.cgi?id=696497

- Previously, it did not build the whole local libpng
  source in ghostscript, only picked up specific files
  and compile them. But on ghostscript 9.18, when the
  arm's FPU has been set to NEON (-mfpu=neon * with GCC),
  the selected file "libpng/pngrutil.c" needs to link
  'png_init_filter_functions_neon' which should be
  compiled by a non-selected file "libpng/arm/arm_init.c".
  ...
  |./obj/pngrutil.o: In function `png_init_filter_functions':
  |armv7a-neon-poky-linux-gnueabi/ghostscript/9.18-r0/build/../
  ghostscript-9.18/libpng/pngrutil.c:3921: undefined reference to
  `png_init_filter_functions_neon'
  ...
  So do not compile local libpng source in ghostscript,
  use shared libpng to instead.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...Fix-support-for-building-with-no-jbig2-de.patch | 81 ++++++++++++++++++++++
 ...part-2-fix-support-for-building-with-a-JP.patch | 48 +++++++++++++
 .../files/do-not-check-local-libpng-source.patch   | 38 ++++++++++
 .../{ghostscript_9.16.bb => ghostscript_9.18.bb}   | 11 +--
 4 files changed, 174 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.16.bb => ghostscript_9.18.bb} (87%)

diff --git a/meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch b/meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
new file mode 100644
index 0000000..d586a1d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
@@ -0,0 +1,81 @@
+From 1d19998091154f89b8294e4594a05986b4c2f822 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 13 Jan 2016 02:08:42 -0500
+Subject: [PATCH 1/2] Bug 696497: Fix support for building with no jbig2
+ decoder
+
+Author: Chris Liddell <chris.liddell@artifex.com>
+
+Upstream-Status: Backport
+http://bugs.ghostscript.com/show_bug.cgi?id=696497
+http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=b0f5a975
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/lib.mak |  9 +++++++++
+ psi/int.mak  | 23 ++++++++++++++++++-----
+ 2 files changed, 27 insertions(+), 5 deletions(-)
+
+diff --git a/base/lib.mak b/base/lib.mak
+index 241df2f..daa7056 100644
+--- a/base/lib.mak
++++ b/base/lib.mak
+@@ -1732,6 +1732,10 @@ $(GLD)sjbig2_jbig2dec.dev : $(LIB_MAK) $(ECHOGS_XE) \
+ 	$(SETMOD) $(GLD)sjbig2_jbig2dec $(sjbig2_jbig2dec)
+ 	$(ADDMOD) $(GLD)sjbig2_jbig2dec -include $(GLD)jbig2dec.dev
+ 
++$(GLD)sjbig2_.dev : $(LIB_MAK) $(ECHOGS_XE) \
++  $(LIB_MAK) $(MAKEDIRS)
++	$(SETMOD) $(GLD)sjbig2_
++
+ # jbig2dec.dev is defined in jbig2.mak
+ 
+ $(GLOBJ)sjbig2.$(OBJ) : $(GLSRC)sjbig2.c $(AK) \
+@@ -1739,6 +1743,11 @@ $(GLOBJ)sjbig2.$(OBJ) : $(GLSRC)sjbig2.c $(AK) \
+  $(sjbig2_h) $(strimpl_h) $(MAKEDIRS)
+ 	$(GLJBIG2CC) $(GLO_)sjbig2.$(OBJ) $(C_) $(GLSRC)sjbig2.c
+ 
++$(GLOBJ)snojbig2.$(OBJ) : $(GLSRC)snojbig2.c $(AK) \
++ $(stdint__h) $(memory__h) $(stdio__h) $(gserrors_h) $(gdebug_h) \
++ $(strimpl_h) $(LIB_MAK) $(MAKEDIRS)
++	$(GLJBIG2CC) $(GLO_)snojbig2.$(OBJ) $(C_) $(GLSRC)snojbig2.c
++
+ # luratech version
+ sjbig2_luratech=$(GLOBJ)sjbig2_luratech.$(OBJ)
+ 
+diff --git a/psi/int.mak b/psi/int.mak
+index 6149a3b..f9d667d 100644
+--- a/psi/int.mak
++++ b/psi/int.mak
+@@ -1254,11 +1254,24 @@ $(PSOBJ)zfaes.$(OBJ) : $(PSSRC)zfaes.c $(OP) $(memory__h)\
+ # this can be turned on and off with a FEATURE_DEV
+ 
+ fjbig2_=$(PSOBJ)zfjbig2_$(JBIG2_LIB).$(OBJ)
+-$(PSD)jbig2.dev : $(INT_MAK) $(ECHOGS_XE) $(fjbig2_) $(GLD)sjbig2.dev\
+- $(MAKEDIRS)
+-	$(SETMOD) $(PSD)jbig2 $(fjbig2_)
+-	$(ADDMOD) $(PSD)jbig2 -include $(GLD)sjbig2
+-	$(ADDMOD) $(PSD)jbig2 -oper zfjbig2
++
++$(PSD)jbig2_jbig2dec.dev : $(ECHOGS_XE) $(fjbig2_) $(GLD)sjbig2.dev\
++ $(INT_MAK) $(MAKEDIRS)
++	$(SETMOD) $(PSD)jbig2_jbig2dec $(fjbig2_)
++	$(ADDMOD) $(PSD)jbig2_jbig2dec -include $(GLD)sjbig2
++	$(ADDMOD) $(PSD)jbig2_jbig2dec -oper zfjbig2
++
++$(PSD)jbig2_luratech.dev : $(ECHOGS_XE) $(fjbig2_) $(GLD)sjbig2.dev\
++ $(INT_MAK) $(MAKEDIRS)
++	$(SETMOD) $(PSD)jbig2_luratech $(fjbig2_)
++	$(ADDMOD) $(PSD)jbig2_luratech -include $(GLD)sjbig2
++	$(ADDMOD) $(PSD)jbig2_luratech -oper zfjbig2
++
++$(PSD)jbig2_.dev : $(ECHOGS_XE) $(INT_MAK) $(MAKEDIRS)
++	$(SETMOD) $(PSD)jbig2_ 
++
++$(PSD)jbig2.dev : $(PSD)jbig2_$(JBIG2_LIB).dev $(INT_MAK) $(MAKEDIRS)
++	$(CP_) $(PSD)jbig2_$(JBIG2_LIB).dev $(PSD)jbig2.dev
+ 
+ $(PSOBJ)zfjbig2_jbig2dec.$(OBJ) : $(PSSRC)zfjbig2.c $(OP) $(memory__h)\
+  $(gsstruct_h) $(gstypes_h) $(ialloc_h) $(idict_h) $(ifilter_h)\
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch b/meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
new file mode 100644
index 0000000..fcfc479
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
@@ -0,0 +1,48 @@
+From 3b43f93ec02611c4d554612953f5b64765b8683b Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 13 Jan 2016 02:14:55 -0500
+Subject: [PATCH 2/2] Bug 696497 (part 2): fix support for building with a JPX
+ decoder
+
+Author: Chris Liddell <chris.liddell@artifex.com>
+
+Upstream-Status: Backport
+http://bugs.ghostscript.com/show_bug.cgi?id=696497
+http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=b0f5a975
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/lib.mak | 3 +++
+ psi/int.mak  | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/base/lib.mak b/base/lib.mak
+index daa7056..8853dd5 100644
+--- a/base/lib.mak
++++ b/base/lib.mak
+@@ -1774,6 +1774,9 @@ $(GLOBJ)sjpx.$(OBJ) : $(GLSRC)sjpx.c $(AK) \
+  $(gdebug_h) $(strimpl_h) $(sjpx_h) $(MAKEDIRS)
+ 	$(GLJASCC) $(GLO_)sjpx.$(OBJ) $(C_) $(GLSRC)sjpx.c
+ 
++$(GLD)sjpx_.dev : $(LIB_MAK) $(ECHOGS_XE) $(LIB_MAK) $(MAKEDIRS)
++	$(SETMOD) $(GLD)sjpx_
++
+ # luratech version
+ sjpx_luratech=$(GLOBJ)sjpx_luratech.$(OBJ)
+ $(GLD)sjpx_luratech.dev : $(LIB_MAK) $(ECHOGS_XE) \
+diff --git a/psi/int.mak b/psi/int.mak
+index f9d667d..db01b65 100644
+--- a/psi/int.mak
++++ b/psi/int.mak
+@@ -1290,6 +1290,9 @@ $(PSD)jpx.dev : $(INT_MAK) $(ECHOGS_XE) $(PSD)jpx_$(JPX_LIB).dev\
+  $(MAKEDIRS)
+ 	$(CP_) $(PSD)jpx_$(JPX_LIB).dev $(PSD)jpx.dev
+ 
++$(PSD)jpx_.dev : $(ECHOGS_XE) $(INT_MAK) $(MAKEDIRS)
++	$(SETMOD) $(PSD)jpx_
++
+ fjpx_luratech=$(PSOBJ)zfjpx_luratech.$(OBJ)
+ 
+ $(PSOBJ)zfjpx.$(OBJ) : $(PSSRC)zfjpx.c $(OP) $(memory__h)\
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
new file mode 100644
index 0000000..b445a6c
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
@@ -0,0 +1,38 @@
+From 5ef8b85bc98f3bd9a15d5f47e24d3e23ae27c265 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 18 Jan 2016 01:00:30 -0500
+Subject: [PATCH] configure.ac: do not check local png source
+
+In oe-core, it did not need to compile local libpng
+source in ghostscript, so do not check local png
+source, and directly check the existance of shared
+libpng library.
+
+Upstream-Status: Inappropriate [OE-Core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ab30a97..b762fd7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -955,11 +955,11 @@ AC_SUBST(ZLIBDIR)
+ AC_SUBST(FT_SYS_ZLIB)
+ 
+ dnl png for the png output device; it also requires zlib
+-LIBPNGDIR=src
++LIBPNGDIR=$srcdir/libpng
+ PNGDEVS=''
+ PNGDEVS_ALL='png48 png16m pnggray pngmono png256 png16 pngalpha'
+ AC_MSG_CHECKING([for local png library source])
+-if test -f $srcdir/libpng/pngread.c; then
++if false; then
+         AC_MSG_RESULT([yes])
+         SHARE_LIBPNG=0
+         LIBPNGDIR=$srcdir/libpng
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
similarity index 87%
rename from meta/recipes-extended/ghostscript/ghostscript_9.16.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.18.bb
index d584c49..d4222c7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
@@ -13,13 +13,16 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b17cea54743435ab2a581c237bea294a"
 
-DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
-DEPENDS_class-native = ""
+DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
+DEPENDS_class-native = "libpng-native"
 
 SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
+                file://0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch \
+                file://0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch \
+                file://do-not-check-local-libpng-source.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
@@ -34,8 +37,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "829319325bbdb83f5c81379a8f86f38f"
-SRC_URI[sha256sum] = "746d77280cca8afdd3d4c2c1389e332ed9b0605bd107bcaae1d761b061d1a68d"
+SRC_URI[md5sum] = "33a47567d7a591c00a253caddd12a88a"
+SRC_URI[sha256sum] = "5fc93079749a250be5404c465943850e3ed5ffbc0d5c07e10c7c5ee8afbbdb1b"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
-- 
1.9.1


