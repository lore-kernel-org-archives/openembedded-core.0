Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B41E273193
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498203"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:24 +0300
Message-Id: <b9e614d4bc0f3a3b43216e2f940f15546bc0a7a7.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 35/45] gnome-doc-utils: remove recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:54:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nothing in oe-core actually requires it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |  1 -
 .../gnome-desktop/gnome-desktop3_3.18.2.bb         |  2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       | 29 -------
 .../gnome-doc-utils/sysrooted-pkg-config.patch     | 35 --------
 .../use-usr-bin-env-for-python-in-xml2po.patch     | 30 -------
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     | 95 ----------------------
 .../recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb | 12 ---
 7 files changed, 1 insertion(+), 203 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils.inc
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
index 869569c..f0582ac 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
@@ -16,7 +16,6 @@ SRC_URI[archive.sha256sum] = "be699d484371111abae754e669187215df73e21533f461e513
 EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
 
 do_configure_prepend() {
-    touch ${S}/gnome-doc-utils.make
     sed -i -e s:help::g ${S}/Makefile.am
 }
 
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
index 75a99a6..7f00bc6 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
@@ -10,7 +10,7 @@ inherit gnome pkgconfig upstream-version-is-even gobject-introspection
 SRC_URI[archive.md5sum] = "9a5875247abdb99bad93f1c4230d1d6d"
 SRC_URI[archive.sha256sum] = "ddd46d022de137543a71f50c7392b32f9b98d5d3f2b53040b35f5802de2e7b56"
 
-DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils startup-notification xkeyboard-config iso-codes"
+DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
deleted file mode 100644
index 0d212c7..0000000
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "A collection of documentation utilities for the Gnome project"
-DESCRIPTION = "The GNOME Documentation Build Utilities (gnome-doc- \
-utils) were created to make it easier for application developers to \
-include and create documentation in their releases. They include the \
-xml2po tool which makes it easier to translate and keep up to date \
-translations of documentation."
-LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "intltool-native libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
-
-inherit gnomebase gettext python-dir pythonnative autotools-brokensep
-
-CLEANBROKEN = "1"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-do_install_append() {
-	chown -R root:root ${D}
-}
-
-do_install_append_class-native () {
-	sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/xml2po
-}
-
-FILES_${PN} += "${datadir}/xml* ${PYTHON_SITEPACKAGES_DIR}/*"
-
-RDEPENDS_${PN} = "bash"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
deleted file mode 100644
index 416d698..0000000
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-In cross environment we have to prepend the sysroot to the path found by
-pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
-it ends up using the files from host system. Now usually people have gnome installed
-so the build succeeds but if you dont have gnome installed on build host then
-it wont find the files on host system and packages using gnome-doc-utils wont
-compile.
-
-This should work ok with non sysrooted builds too since in those cases PKG_CONFIG_SYSROOT_DIR
-will be empty
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
-===================================================================
---- gnome-doc-utils-0.20.10.orig/tools/gnome-doc-utils.make
-+++ gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
-@@ -133,11 +133,11 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
- _xml2po ?= `which xml2po`
- _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
- 
--_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
--_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
--_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
--_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
--_ids ?= $(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
-+_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
-+_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
-+_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
-+_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
-+_ids ?= ${PKG_CONFIG_SYSROOT_DIR}$(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
- 
- if ENABLE_SK
- _ENABLE_SK = true
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
deleted file mode 100644
index 0e196c0..0000000
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-We can't use #!/full/path/to/python -u as this can be longer than shebang
-allows for.  In order to be appropraite for upstream more work would be
-needed to make sure that the main xml2po code doesn't rely on python
-being invoked with -u (force stdin/out/err to be used raw).
-
-Upstream-Status: Inappropriate [Would break behavior on Windows]
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: gnome-doc-utils-0.20.10/xml2po/xml2po/Makefile.am
-===================================================================
---- gnome-doc-utils-0.20.10.orig/xml2po/xml2po/Makefile.am
-+++ gnome-doc-utils-0.20.10/xml2po/xml2po/Makefile.am
-@@ -7,7 +7,6 @@ CLEANFILES = xml2po
- 
- xml2po: xml2po.py.in
- 	$(AM_V_GEN)sed -e "s/^VERSION =.*/VERSION = \"@VERSION@\"/" \
--	    -e "s+^#!.*python.*+#!$(PYTHON)+" \
- 	  < $(srcdir)/xml2po.py.in > xml2po
- 	$(AM_V_at)chmod +x xml2po
- 
-Index: gnome-doc-utils-0.20.10/xml2po/xml2po/xml2po.py.in
-===================================================================
---- gnome-doc-utils-0.20.10.orig/xml2po/xml2po/xml2po.py.in
-+++ gnome-doc-utils-0.20.10/xml2po/xml2po/xml2po.py.in
-@@ -1,4 +1,4 @@
--#!/usr/bin/python -u
-+#!/usr/bin/env python
- # -*- encoding: utf-8 -*-
- # Copyright (c) 2004, 2005, 2006 Danilo Šegan <danilo@gnome.org>.
- # Copyright (c) 2009 Claude Paroz <claude@2xlibre.net>.
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
deleted file mode 100644
index 9346494..0000000
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-This adds the -nonet option to xsltproc invocations, which fixes
-compile errors when building the gnome-doc-utils docs.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: gnome-doc-utils-0.20.10/doc/xslt/Makefile.am
-===================================================================
---- gnome-doc-utils-0.20.10.orig/doc/xslt/Makefile.am
-+++ gnome-doc-utils-0.20.10/doc/xslt/Makefile.am
-@@ -21,14 +21,14 @@ all: $(xsldoc_docs) $(xsldoc_xmls)
- 
- $(xsldoc_docs): $(xsldoc_xsls) xsldoc.awk xsldoc-fill.xsl
- 	$(AM_V_GEN)$(GDU_AWK) -f "$(srcdir)/xsldoc.awk" "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
--	| xsltproc -o "$@" \
-+	| xsltproc -nonet -o "$@" \
- 	--stringparam basename "$(basename $(notdir $@))" \
- 	--stringparam xsl_file "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
- 	"$(srcdir)/xsldoc-fill.xsl" -
- 
- $(xsldoc_xmls): xsldoc-docbook.xsl
- $(xsldoc_xmls): C/%.xml : C/%.xsldoc
--	$(AM_V_GEN)xsltproc -o "$@" \
-+	$(AM_V_GEN)xsltproc -nonet -o "$@" \
- 	--stringparam basename "$(basename $(notdir $@))" \
- 	--stringparam xsl_file "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
- 	"$(srcdir)/xsldoc-docbook.xsl" "$<"
-@@ -62,7 +62,7 @@ gnome-doc-xslt-check-includes:
- gnome-doc-xslt-check-xsldoc: $(xsldoc_docs)
- 	@echo "Running xsldoc checks";
- 	@(echo "<xsldoc>"; cat $(xsldoc_docs); echo "</xsldoc>") \
--	| xsltproc "$(srcdir)/xsldoc-check.xsl" - 1> /dev/null
-+	| xsltproc -nonet "$(srcdir)/xsldoc-check.xsl" - 1> /dev/null
- 
- .PHONY: clean-xsldoc
- clean-local: clean_xsldoc
-Index: gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
-===================================================================
---- gnome-doc-utils-0.20.10.orig/tools/gnome-doc-utils.make
-+++ gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
-@@ -37,7 +37,7 @@ $(DOC_H_FILE): $(DOC_H_DOCS);
- 	list='$(DOC_H_DOCS)'; for doc in $$list; do \
- 	  xmlpath="`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`:$(srcdir)/`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`"; \
- 	  if ! test -f "$$doc"; then doc="$(srcdir)/$$doc"; fi; \
--	  xsltproc --path "$$xmlpath" $(_credits) $$doc; \
-+	  xsltproc -nonet --path "$$xmlpath" $(_credits) $$doc; \
- 	done | sort | uniq \
- 	  | awk 'BEGIN{s=""}{n=split($$0,w,"<");if(s!=""&&s!=substr(w[1],1,length(w[1])-1)){print s};if(n>1){print $$0;s=""}else{s=$$0}};END{if(s!=""){print s}}' \
- 	  | sed -e 's/\\/\\\\/' -e 's/"/\\"/' -e 's/\(.*\)/\t"\1",/' >> $@.tmp
-@@ -50,7 +50,7 @@ $(DOC_H_FILE): $(DOC_H_DOCS);
- 	  docid=`echo "$$doc" | sed -e 's/.*\/\([^/]*\)\.xml/\1/' \
- 	    | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`; \
- 	  echo $$xmlpath; \
--	  ids=`xsltproc --xinclude --path "$$xmlpath" $(_ids) $$doc`; \
-+	  ids=`xsltproc -nonet --xinclude --path "$$xmlpath" $(_ids) $$doc`; \
- 	  for id in $$ids; do \
- 	    echo '#define HELP_'`echo $$docid`'_'`echo $$id \
- 	      | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`' "'$$id'"' >> $@.tmp; \
-@@ -197,7 +197,7 @@ $(_DOC_OMF_DB) : $(DOC_MODULE)-%.omf : %
- 	  echo "The file '$(_skcontentslist)' does not exist." >&2;		\
- 	  echo "Please check your ScrollKeeper installation." >&2;		\
- 	  exit 1; }
--	$(GDU_V_DB2OMF)xsltproc -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
-+	$(GDU_V_DB2OMF)xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
- 
- ## @ _DOC_OMF_HTML
- ## The OMF files for HTML output
-@@ -212,7 +212,7 @@ if ENABLE_SK
- 	  echo "Please check your ScrollKeeper installation." >&2;		\
- 	  exit 1; }
- endif
--	$(GDU_V_DB2OMF)xsltproc -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
-+	$(GDU_V_DB2OMF)xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
- 
- ## @ _DOC_OMF_ALL
- ## All OMF output files to be built
-@@ -267,7 +267,7 @@ _DOC_C_FIGURES = $(if $(DOC_FIGURES),
- ## All HTML documentation in the C locale
- # FIXME: probably have to shell escape to determine the file names
- _DOC_C_HTML = $(foreach f,						\
--	$(shell xsltproc --xinclude 					\
-+	$(shell xsltproc -nonet --xinclude 					\
- 	  --stringparam db.chunk.basename "$(DOC_MODULE)"		\
- 	  $(_chunks) "C/$(DOC_MODULE).xml"),				\
- 	C/$(f).xhtml)
-@@ -393,7 +393,7 @@ _DOC_HTML_ALL = $(if $(filter html HTML,
- _DOC_HTML_TOPS = $(foreach lc,C $(_DOC_REAL_LINGUAS),$(lc)/$(DOC_MODULE).xhtml)
- 
- $(_DOC_HTML_TOPS): $(_DOC_C_DOCS) $(_DOC_LC_DOCS)
--	$(GDU_V_DB2HTM)xsltproc -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
-+	$(GDU_V_DB2HTM)xsltproc -nonet -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
- 
- 
- ################################################################################
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
deleted file mode 100644
index ed01ea7..0000000
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require gnome-doc-utils.inc
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
-		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI += "file://xsltproc_nonet.patch \
-            file://use-usr-bin-env-for-python-in-xml2po.patch \
-            file://sysrooted-pkg-config.patch \
-            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
-           "
-
-SRC_URI[archive.md5sum] = "3c64ad7bacd617b04999e4a168afaac5"
-SRC_URI[archive.sha256sum] = "cb0639ffa9550b6ddf3b62f3b1add92fb92ab4690d351f2353cffe668be8c4a6"
-- 
2.8.1


