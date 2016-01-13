Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D0CE4731E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:30:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0D8UdY6024775
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jan 2016 00:30:39 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jan 2016 00:30:38 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 13 Jan 2016 03:30:30 -0500
Message-ID: <05d17c12cd03aa3b60ac1f864383e89623d9521e.1452673538.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452673538.git.hongxu.jia@windriver.com>
References: <cover.1452673538.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 6/9] ghostscript: 9.16 -> 9.18
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
X-List-Received-Date: Wed, 13 Jan 2016 08:30:45 -0000
Content-Type: text/plain

Backport patches to fix build failure caused by
'--without-jbig2dec' and '--without-jbig2dec'.
...
|make[1]: *** No rule to make target `obj/sjbig2_.dev',
needed by `obj/sjbig2.dev'.  Stop.
...

http://bugs.ghostscript.com/show_bug.cgi?id=696497

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...Fix-support-for-building-with-no-jbig2-de.patch | 81 ++++++++++++++++++++++
 ...part-2-fix-support-for-building-with-a-JP.patch | 48 +++++++++++++
 .../{ghostscript_9.16.bb => ghostscript_9.18.bb}   |  6 +-
 3 files changed, 133 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.16.bb => ghostscript_9.18.bb} (91%)

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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
similarity index 91%
rename from meta/recipes-extended/ghostscript/ghostscript_9.16.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.18.bb
index d584c49..e3617c3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
@@ -20,6 +20,8 @@ SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
+                file://0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch \
+                file://0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
@@ -34,8 +36,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
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


