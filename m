Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 148BC600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 05:32:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9F5V0r2015540
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 22:31:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 14 Oct 2018 22:30:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2018 13:30:57 +0800
Message-ID: <1539581457-120937-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] freetype: remove compile of windows resource files
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
X-List-Received-Date: Mon, 15 Oct 2018 05:32:32 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

remove compile of windows resource file to fix compile
fail problem of freetype when build windows sdk.

when build windows sdk, include meta-mingw layer, and
SDKMACHINE set to i686-mingw32, meta-mingw have
export variable RC, and from freetype 3.29, it add better
support to  build FreeType  as  a DLL  on Windows  using
Visual C, but we don't need this. so remove it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-remove-compile-of-windows-resource-files.patch | 71 ++++++++++++++++++++++
 meta/recipes-graphics/freetype/freetype_2.9.1.bb   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch

diff --git a/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch b/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
new file mode 100644
index 0000000..2daba28
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
@@ -0,0 +1,71 @@
+From b6c1c1c96006452873132db1b15e2d0b9576a7fb Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 15 Oct 2018 11:25:23 +0800
+Subject: [PATCH] freetype: remove compile of windows resource files
+
+remove compile of windows resource file to fix compile
+fail problem of freetype when build windows sdk.
+
+when build windows sdk, include meta-mingw, and
+SDKMACHINE set to i686-mingw32, meta-mingw have
+export variable RC, and from freetype 3.29, it add better
+support to  build FreeType  as  a DLL  on Windows  using
+Visual C, but we don't need this. so remove it.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ builds/freetype.mk     | 17 -----------------
+ builds/unix/unix-cc.in |  7 -------
+ 2 files changed, 24 deletions(-)
+
+diff --git a/builds/freetype.mk b/builds/freetype.mk
+index 6f68a0f..4287869 100644
+--- a/builds/freetype.mk
++++ b/builds/freetype.mk
+@@ -247,23 +247,6 @@ OBJECTS_LIST += $(FTINIT_OBJ)
+ $(FTINIT_OBJ): $(FTINIT_SRC) $(FREETYPE_H)
+ 	$(FT_COMPILE) $T$(subst /,$(COMPILER_SEP),$@ $<)
+ 
+-
+-# ftver component
+-#
+-#  The VERSIONINFO resource `ftver.rc' contains version and copyright
+-#  to be compiled by windres and tagged into DLL usually.
+-#
+-ifneq ($(RC),)
+-  FTVER_SRC := $(BASE_DIR)/ftver.rc
+-  FTVER_OBJ := $(OBJ_DIR)/ftver.$O
+-
+-  OBJECTS_LIST += $(FTVER_OBJ)
+-
+-  $(FTVER_OBJ): $(FTVER_SRC)
+-	$(RC) -o $@ $<
+-endif
+-
+-
+ # All FreeType library objects.
+ #
+ OBJ_M := $(BASE_OBJ_M) $(BASE_EXT_OBJ) $(DRV_OBJS_M)
+diff --git a/builds/unix/unix-cc.in b/builds/unix/unix-cc.in
+index b24c408..603897c 100644
+--- a/builds/unix/unix-cc.in
++++ b/builds/unix/unix-cc.in
+@@ -90,13 +90,6 @@ ANSIFLAGS := @XX_ANSIFLAGS@
+ CCraw := $(CC)
+ CC    := $(LIBTOOL) --mode=compile $(CCraw)
+ 
+-# Resource compiler to use on Cygwin/MinGW, usually windres.
+-#
+-RCraw := @RC@
+-ifneq ($(RCraw),)
+-  RC := $(LIBTOOL) --tag=RC --mode=compile $(RCraw)
+-endif
+-
+ # Linker flags.
+ #
+ LDFLAGS           := @LDFLAGS@
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.9.1.bb b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
index 1e6f66e..b7d090d 100644
--- a/meta/recipes-graphics/freetype/freetype_2.9.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://use-right-libtool.patch \
+           file://0001-freetype-remove-compile-of-windows-resource-files.patch \
           "
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
-- 
2.7.4


