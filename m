Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 633BA6AC33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 22:55:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JMm4RC029534
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 17:48:04 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JMm3gv027112
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 17:48:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Mar 2015 17:48:02 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2JMlxrH028937;	Thu, 19 Mar 2015 17:48:02 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2015 18:47:55 -0400
Message-ID: <1426805275-4766-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426805275-4766-1-git-send-email-sam.nelson@ti.com>
References: <1426805275-4766-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk: Add patch to avoid build issue with linaro toolchain 4.7
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
X-List-Received-Date: Thu, 19 Mar 2015 22:55:01 -0000
Content-Type: text/plain

- "-fuse-ld=bfd" is only supported in the linaro toolchain verion 4.8
- This is work around to support the 4.7 version

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../openjdk-7-25b30/icedtea-crosscompile-fix.patch |    9 +++++----
 .../openjdk-7-25b30/icedtea-zero-hotspotfix.patch  |    8 +++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
index 0c6aac4..61b7d8c 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
@@ -319,7 +319,7 @@ index 53d31f3..183c063 100644
  endif # 32
  endif # !macosx
  endif # solaris
-@@ -337,15 +321,11 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
+@@ -337,15 +321,12 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
  WRAPPER_GENERATOR_CLASS=$(WRAPPER_GENERATOR_TEMPDIR)/WrapperGenerator.class 
  XLIBTYPES=$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
  
@@ -332,11 +332,12 @@ index 53d31f3..183c063 100644
  $(SIZERS): $(SIZERS_C) 
  	$(prep-target)
 -	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
++	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c || \
++	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -o $@ $(SIZER)$(suffix $@).c
  
  $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
  	$(prep-target)
-@@ -358,6 +334,16 @@ $(SIZERS_C): $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
+@@ -358,6 +335,16 @@ $(SIZERS_C): $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
  	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
  
  $(SIZES): $(SIZERS)
@@ -353,7 +354,7 @@ index 53d31f3..183c063 100644
  	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
  	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
  	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-@@ -366,6 +352,7 @@ $(SIZES): $(SIZERS)
+@@ -366,6 +353,7 @@ $(SIZES): $(SIZERS)
  	    $(ECHO) GENERATING $@; \
  	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
  	fi
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
index 784f2de..baa7395 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
@@ -2,7 +2,7 @@ diff --git openjdk/hotspot/make/linux/makefiles/zeroshark.make openjdk/hotspot/m
 index c2a1484..156bdd0 100644
 --- openjdk/hotspot/make/linux/makefiles/zeroshark.make
 +++ openjdk/hotspot/make/linux/makefiles/zeroshark.make
-@@ -32,26 +32,28 @@ Obj_Files += cppInterpreter_arm.o
+@@ -32,26 +32,30 @@ Obj_Files += cppInterpreter_arm.o
  Obj_Files += thumb2.o
  
  CFLAGS += -DHOTSPOT_ASM
@@ -25,13 +25,15 @@ index c2a1484..156bdd0 100644
  mkbc:	$(GAMMADIR)/tools/mkbc.c
  	@echo Compiling mkbc tool
 -	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE) || \
++	$(CC_COMPILE) -static -o $@ $< $(COMPILE_DONE)
  
  mkoffsets:	asm_helper.cpp
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE) || \
++	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -static -o $@ $< $(COMPILE_DONE)
  
  endif
  
-- 
1.7.9.5


