Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iJ-0003pg-EP
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440639"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:33:56 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:15 +0200
Message-Id: <f5a4b61d03aa2038437c71d03723834af4ebbf56.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 03/15] gnome-doc-utils: upgrade to 0.20.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 08:48:58 -0000

sysrooted-pkg-config.patch: adapt to the new version
use-usr-bin-env-for-python-in-xml2po.patch: adapt to the new version
xsltproc_nonet.patch: adapt to the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../gnome-doc-utils/sysrooted-pkg-config.patch     | 12 ++---
 .../use-usr-bin-env-for-python-in-xml2po.patch     | 25 +++++-----
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     | 57 ++++++++++------------
 ...-utils_0.20.6.bb => gnome-doc-utils_0.20.10.bb} | 10 ++--
 4 files changed, 48 insertions(+), 56 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.6.bb => gnome-doc-utils_0.20.10.bb} (51%)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
index e17e8b4..416d698 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
@@ -9,26 +9,24 @@ This should work ok with non sysrooted builds too since in those cases PKG_CONFI
 will be empty
 
 Upstream-Status: Pending
-
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: gnome-doc-utils-0.20.6/tools/gnome-doc-utils.make
+Index: gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
 ===================================================================
---- gnome-doc-utils-0.20.6.orig/tools/gnome-doc-utils.make	2011-09-23 22:22:26.000000000 -0700
-+++ gnome-doc-utils-0.20.6/tools/gnome-doc-utils.make	2011-09-23 22:30:03.479787196 -0700
-@@ -133,12 +133,12 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
+--- gnome-doc-utils-0.20.10.orig/tools/gnome-doc-utils.make
++++ gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
+@@ -133,11 +133,11 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
  _xml2po ?= `which xml2po`
  _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
  
 -_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
 -_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
--_malrng  ?= `$(PKG_CONFIG) --variable malrng gnome-doc-utils`
 -_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
 -_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
 -_ids ?= $(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
 +_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
 +_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
-+_malrng  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable malrng gnome-doc-utils`
 +_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
 +_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
 +_ids ?= ${PKG_CONFIG_SYSROOT_DIR}$(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
index a285ad2..0e196c0 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
@@ -1,30 +1,27 @@
-Upstream-Status="Inappropriate [Would break behavior on Windows]"
-
 We can't use #!/full/path/to/python -u as this can be longer than shebang
 allows for.  In order to be appropraite for upstream more work would be
 needed to make sure that the main xml2po code doesn't rely on python
 being invoked with -u (force stdin/out/err to be used raw).
----
- xml2po/xml2po/Makefile.am  |    1 -
- xml2po/xml2po/xml2po.py.in |    2 +-
- 2 files changed, 1 insertion(+), 2 deletions(-)
 
-Index: gnome-doc-utils-0.20.6/xml2po/xml2po/Makefile.am
+Upstream-Status: Inappropriate [Would break behavior on Windows]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: gnome-doc-utils-0.20.10/xml2po/xml2po/Makefile.am
 ===================================================================
---- gnome-doc-utils-0.20.6.orig/xml2po/xml2po/Makefile.am
-+++ gnome-doc-utils-0.20.6/xml2po/xml2po/Makefile.am
+--- gnome-doc-utils-0.20.10.orig/xml2po/xml2po/Makefile.am
++++ gnome-doc-utils-0.20.10/xml2po/xml2po/Makefile.am
 @@ -7,7 +7,6 @@ CLEANFILES = xml2po
  
  xml2po: xml2po.py.in
- 	sed -e "s/^VERSION =.*/VERSION = \"@VERSION@\"/" \
+ 	$(AM_V_GEN)sed -e "s/^VERSION =.*/VERSION = \"@VERSION@\"/" \
 -	    -e "s+^#!.*python.*+#!$(PYTHON)+" \
  	  < $(srcdir)/xml2po.py.in > xml2po
- 	chmod +x xml2po
+ 	$(AM_V_at)chmod +x xml2po
  
-Index: gnome-doc-utils-0.20.6/xml2po/xml2po/xml2po.py.in
+Index: gnome-doc-utils-0.20.10/xml2po/xml2po/xml2po.py.in
 ===================================================================
---- gnome-doc-utils-0.20.6.orig/xml2po/xml2po/xml2po.py.in
-+++ gnome-doc-utils-0.20.6/xml2po/xml2po/xml2po.py.in
+--- gnome-doc-utils-0.20.10.orig/xml2po/xml2po/xml2po.py.in
++++ gnome-doc-utils-0.20.10/xml2po/xml2po/xml2po.py.in
 @@ -1,4 +1,4 @@
 -#!/usr/bin/python -u
 +#!/usr/bin/env python
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
index 44d18e7..9346494 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
@@ -2,16 +2,17 @@ This adds the -nonet option to xsltproc invocations, which fixes
 compile errors when building the gnome-doc-utils docs.
 
 Upstream-Status: Inappropriate [configuration]
-
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-diff -urN gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am gnome-doc-utils-0.20.5/doc/xslt/Makefile.am
---- gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am	2011-03-22 06:56:17.000000000 -0700
-+++ gnome-doc-utils-0.20.5/doc/xslt/Makefile.am	2011-05-09 09:35:04.946138220 -0700
-@@ -21,14 +21,14 @@
+Index: gnome-doc-utils-0.20.10/doc/xslt/Makefile.am
+===================================================================
+--- gnome-doc-utils-0.20.10.orig/doc/xslt/Makefile.am
++++ gnome-doc-utils-0.20.10/doc/xslt/Makefile.am
+@@ -21,14 +21,14 @@ all: $(xsldoc_docs) $(xsldoc_xmls)
  
  $(xsldoc_docs): $(xsldoc_xsls) xsldoc.awk xsldoc-fill.xsl
- 	$(GDU_AWK) -f "$(srcdir)/xsldoc.awk" "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
+ 	$(AM_V_GEN)$(GDU_AWK) -f "$(srcdir)/xsldoc.awk" "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
 -	| xsltproc -o "$@" \
 +	| xsltproc -nonet -o "$@" \
  	--stringparam basename "$(basename $(notdir $@))" \
@@ -20,12 +21,12 @@ diff -urN gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am gnome-doc-utils-0.20
  
  $(xsldoc_xmls): xsldoc-docbook.xsl
  $(xsldoc_xmls): C/%.xml : C/%.xsldoc
--	xsltproc -o "$@" \
-+	xsltproc -nonet -o "$@" \
+-	$(AM_V_GEN)xsltproc -o "$@" \
++	$(AM_V_GEN)xsltproc -nonet -o "$@" \
  	--stringparam basename "$(basename $(notdir $@))" \
  	--stringparam xsl_file "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
  	"$(srcdir)/xsldoc-docbook.xsl" "$<"
-@@ -62,7 +62,7 @@
+@@ -62,7 +62,7 @@ gnome-doc-xslt-check-includes:
  gnome-doc-xslt-check-xsldoc: $(xsldoc_docs)
  	@echo "Running xsldoc checks";
  	@(echo "<xsldoc>"; cat $(xsldoc_docs); echo "</xsldoc>") \
@@ -34,17 +35,11 @@ diff -urN gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am gnome-doc-utils-0.20
  
  .PHONY: clean-xsldoc
  clean-local: clean_xsldoc
-@@ -75,4 +75,4 @@
- DOC_MODULE = gnome-doc-xslt
- DOC_INCLUDES = legal.xml translating.xml $(patsubst %,%.xml,$(xsldoc_base))
- 
--DOC_LINGUAS = de
-\ No newline at end of file
-+DOC_LINGUAS = de
-diff -urN gnome-doc-utils-0.20.5.orig//tools/gnome-doc-utils.make gnome-doc-utils-0.20.5/tools/gnome-doc-utils.make
---- gnome-doc-utils-0.20.5.orig//tools/gnome-doc-utils.make	2011-03-22 06:56:17.000000000 -0700
-+++ gnome-doc-utils-0.20.5/tools/gnome-doc-utils.make	2011-05-09 09:34:03.278985782 -0700
-@@ -37,7 +37,7 @@
+Index: gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
+===================================================================
+--- gnome-doc-utils-0.20.10.orig/tools/gnome-doc-utils.make
++++ gnome-doc-utils-0.20.10/tools/gnome-doc-utils.make
+@@ -37,7 +37,7 @@ $(DOC_H_FILE): $(DOC_H_DOCS);
  	list='$(DOC_H_DOCS)'; for doc in $$list; do \
  	  xmlpath="`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`:$(srcdir)/`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`"; \
  	  if ! test -f "$$doc"; then doc="$(srcdir)/$$doc"; fi; \
@@ -53,7 +48,7 @@ diff -urN gnome-doc-utils-0.20.5.orig//tools/gnome-doc-utils.make gnome-doc-util
  	done | sort | uniq \
  	  | awk 'BEGIN{s=""}{n=split($$0,w,"<");if(s!=""&&s!=substr(w[1],1,length(w[1])-1)){print s};if(n>1){print $$0;s=""}else{s=$$0}};END{if(s!=""){print s}}' \
  	  | sed -e 's/\\/\\\\/' -e 's/"/\\"/' -e 's/\(.*\)/\t"\1",/' >> $@.tmp
-@@ -50,7 +50,7 @@
+@@ -50,7 +50,7 @@ $(DOC_H_FILE): $(DOC_H_DOCS);
  	  docid=`echo "$$doc" | sed -e 's/.*\/\([^/]*\)\.xml/\1/' \
  	    | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`; \
  	  echo $$xmlpath; \
@@ -62,25 +57,25 @@ diff -urN gnome-doc-utils-0.20.5.orig//tools/gnome-doc-utils.make gnome-doc-util
  	  for id in $$ids; do \
  	    echo '#define HELP_'`echo $$docid`'_'`echo $$id \
  	      | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`' "'$$id'"' >> $@.tmp; \
-@@ -180,7 +180,7 @@
+@@ -197,7 +197,7 @@ $(_DOC_OMF_DB) : $(DOC_MODULE)-%.omf : %
  	  echo "The file '$(_skcontentslist)' does not exist." >&2;		\
  	  echo "Please check your ScrollKeeper installation." >&2;		\
  	  exit 1; }
--	xsltproc -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
-+	xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
+-	$(GDU_V_DB2OMF)xsltproc -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
++	$(GDU_V_DB2OMF)xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
  
  ## @ _DOC_OMF_HTML
  ## The OMF files for HTML output
-@@ -195,7 +195,7 @@
+@@ -212,7 +212,7 @@ if ENABLE_SK
  	  echo "Please check your ScrollKeeper installation." >&2;		\
  	  exit 1; }
  endif
--	xsltproc -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
-+	xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
+-	$(GDU_V_DB2OMF)xsltproc -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
++	$(GDU_V_DB2OMF)xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
  
  ## @ _DOC_OMF_ALL
  ## All OMF output files to be built
-@@ -250,7 +250,7 @@
+@@ -267,7 +267,7 @@ _DOC_C_FIGURES = $(if $(DOC_FIGURES),
  ## All HTML documentation in the C locale
  # FIXME: probably have to shell escape to determine the file names
  _DOC_C_HTML = $(foreach f,						\
@@ -89,12 +84,12 @@ diff -urN gnome-doc-utils-0.20.5.orig//tools/gnome-doc-utils.make gnome-doc-util
  	  --stringparam db.chunk.basename "$(DOC_MODULE)"		\
  	  $(_chunks) "C/$(DOC_MODULE).xml"),				\
  	C/$(f).xhtml)
-@@ -379,7 +379,7 @@
+@@ -393,7 +393,7 @@ _DOC_HTML_ALL = $(if $(filter html HTML,
  _DOC_HTML_TOPS = $(foreach lc,C $(_DOC_REAL_LINGUAS),$(lc)/$(DOC_MODULE).xhtml)
  
  $(_DOC_HTML_TOPS): $(_DOC_C_DOCS) $(_DOC_LC_DOCS)
--	xsltproc -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
-+	xsltproc -nonet -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
+-	$(GDU_V_DB2HTM)xsltproc -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
++	$(GDU_V_DB2HTM)xsltproc -nonet -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
  
  
  ################################################################################
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
similarity index 51%
rename from meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
rename to meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
index e93f584..bde7b89 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
@@ -1,12 +1,14 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r8"
+PR = "r0"
+
+GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI += "file://xsltproc_nonet.patch \
-	    file://use-usr-bin-env-for-python-in-xml2po.patch \
+            file://use-usr-bin-env-for-python-in-xml2po.patch \
             file://sysrooted-pkg-config.patch \
            "
 
-SRC_URI[archive.md5sum] = "8f6e05071599bc073007830ea0a68391"
-SRC_URI[archive.sha256sum] = "091486e370480bf45349ad09dac799211092a02938b26a0d68206172cb6cebbf"
+SRC_URI[archive.md5sum] = "3c64ad7bacd617b04999e4a168afaac5"
+SRC_URI[archive.sha256sum] = "cb0639ffa9550b6ddf3b62f3b1add92fb92ab4690d351f2353cffe668be8c4a6"
-- 
1.7.11.7



