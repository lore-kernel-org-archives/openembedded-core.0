Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6956065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:04:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 30 May 2013 01:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,769,1363158000"; d="scan'208";a="342409109"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.40])
	by fmsmga001.fm.intel.com with ESMTP; 30 May 2013 01:04:26 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 11:05:02 +0300
Message-Id: <1369901102-26752-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] linuxdoc-tools-native : upgrade to 0.9.69
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
X-List-Received-Date: Thu, 30 May 2013 08:04:17 -0000

upgrade from 0.9.66 -> 0.9.69

- COPYING file contains now more detailed information.
- reworked a patch because it didn't apply.

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../linuxdoc-tools-native/disable_sgml2rtf.patch   |   47 ++++++++++++--------
 ...e_0.9.66.bb => linuxdoc-tools-native_0.9.69.bb} |   10 ++---
 2 files changed, 34 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native_0.9.66.bb => linuxdoc-tools-native_0.9.69.bb} (70%)

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
index 424410d..50c8a8f 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
@@ -1,39 +1,47 @@
-The build of sgml2rtf is problematic due to the way it wants to
-link to a shared library version of flex. Flex only ships with a
-static lib. Rather than diverging from upstream flex, simply skip
-building this un-needed utility.
+From 756f20e70a97ee2dea9b32c0955eabfc27f29be1 Mon Sep 17 00:00:00 2001
+From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+Date: Wed, 29 May 2013 16:50:17 +0300
+Subject: [PATCH] The build of sgml2rtf is problematic due to the way it wants
+ to link to a shared library version of flex. Flex only
+ ships with a static lib. Rather than diverging from
+ upstream flex, simply skip building this un-needed utility.
 
 Upstream-Status: Inappropriate [Other]
 Workaround which disables a feature.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+---
+ Makefile.in |   12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
-diff -urN linuxdoc-tools-0.9.66.orig//Makefile.in linuxdoc-tools-0.9.66/Makefile.in
---- linuxdoc-tools-0.9.66.orig//Makefile.in	2009-11-09 11:58:25.000000000 -0800
-+++ linuxdoc-tools-0.9.66/Makefile.in	2011-02-24 15:37:46.556937051 -0800
-@@ -40,7 +40,7 @@
+diff --git a/Makefile.in b/Makefile.in
+index 359f14e..fc04020 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -40,7 +40,7 @@ perl5lib_ddir      = $(DESTDIR)$(perl5libdir)
  pkgdata_ddir       = $(DESTDIR)$(pkgdatadir)
  tex_ddir           = $(DESTDIR)$(texdir)
  
 -progs    := sgml2html sgml2info sgml2latex sgml2lyx sgml2rtf sgml2txt sgmlcheck
 +progs    := sgml2html sgml2info sgml2latex sgml2lyx sgml2txt sgmlcheck
  
- OPTIMIZE  = -O
- 
-@@ -64,9 +64,9 @@
- 	@echo "Compiling preprocessor (in sgmlpre/)..."
+ PROFILE  =
+ INCLUDE  =
+@@ -71,9 +71,9 @@ endif
  	( cd sgmlpre ; \
- 	  $(MAKE) CFLAGS="$(OPTIMIZE)" LEX=flex sgmlpre || exit -1 )
+ 	  $(MAKE)  CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" LEX=flex sgmlpre || exit -1 )
+ 
 -	@echo "Compiling RTF conversion tools (in rtf-fix/)..."
 -	( cd rtf-fix ; \
--	  $(MAKE) CFLAGS="$(OPTIMIZE)" || exit -1 )
+-	  $(MAKE) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" || exit -1 )
 +#	@echo "Compiling RTF conversion tools (in rtf-fix/)..."
 +#	( cd rtf-fix ; \
-+#	  $(MAKE) CFLAGS="$(OPTIMIZE)" || exit -1 )
++#	  $(MAKE) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" || exit -1 )
+ 
  	@echo "making man pages in genman ..."
  	if [ ! -d genman ]; then mkdir genman ; fi
- 	for ii in man/* ; do \
-@@ -109,7 +109,7 @@
+@@ -117,7 +117,7 @@ endif
  
  #    -- Install auxiliary programs
  	mkdir -p $(auxbin_ddir)
@@ -42,7 +50,7 @@ diff -urN linuxdoc-tools-0.9.66.orig//Makefile.in linuxdoc-tools-0.9.66/Makefile
  	  bn=`basename $$ii`; \
  	  $(INSTALL_PROGRAM) $$ii $(auxbin_ddir)/$$bn; \
  	done
-@@ -198,7 +198,7 @@
+@@ -206,7 +206,7 @@ bin/linuxdoc:: Makefile bin/linuxdoc.in
  
  clean::
  	-rm -f *~ bin/*~ bin/linuxdoc
@@ -51,3 +59,6 @@ diff -urN linuxdoc-tools-0.9.66.orig//Makefile.in linuxdoc-tools-0.9.66/Makefile
  	(cd sgmlpre ; rm -f sgmlpre.o sgmlpre)
  	-rm -rf genman/
  
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
similarity index 70%
rename from meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
rename to meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index 5c9dd6f..b744ccd 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -2,20 +2,20 @@ SUMMARY = "Convert LinuxDoc SGML source into other formats"
 DESCRIPTION = "Convert LinuxDoc SGML source into other formats"
 HOMEPAGE = "http://packages.debian.org/linuxdoc-tools"
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5fbccc46cff2379505ca4e09c7d6ccfe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931"
 
 DEPENDS = "groff-native openjade-native"
 
-PR = "r3"
+PR = "r0"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.gz \
            file://disable_sgml2rtf.patch \
            file://disable_txt_doc.patch \
            file://disable_tex_doc.patch \
            file://disable_dvips_doc.patch"
 
-SRC_URI[md5sum] = "f214e79b0dd084689cd04f18722bd563"
-SRC_URI[sha256sum] = "128cabb52ef8fb2f370ee488ea92bf4d8e49859200c7c8cae807abfe860a62ec"
+SRC_URI[md5sum] = "1d13d500918a7a145b0edc2f16f61dd1"
+SRC_URI[sha256sum] = "7103facee18a2ea97186ca459d743d22f7f89ad4b5cd1dfd1c34f83d6bfd4101"
 
 FILESPATH = "${FILE_DIRNAME}/linuxdoc-tools-native/"
 
-- 
1.7.9.5


