Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVL-0001Xh-04
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; 
   d="scan'208";a="163190"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2011 22:26:21 -0700
Message-Id: <8a2451340224cb09e0acba67339a7a18432c1b1b.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 9 May 2011 09:41:10 -0700
Date: Mon, 09 May 2011 22:26:21 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 16/30] gnome-doc-utils: Add additional missing -nonet options to xsltproc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 05:29:11 -0000

From: Scott Garman <scott.a.garman@intel.com>

I missed some instances of xsltproc when adding -nonet in my
previous commit. This should take care of them all to fix
the compilation errors.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |   70 +++++++++++++++++++-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb |    2 +-
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
index 73d22bf..ad81c2f 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
@@ -1,5 +1,5 @@
 This adds the -nonet option to xsltproc invocations, which fixes
-compile errors when building gnome-doc-xslt-de.omf.
+compile errors when building the gnome-doc-utils docs.
 
 Upstream-Status: Pending
 
@@ -7,7 +7,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 diff -urN gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am gnome-doc-utils-0.20.5/doc/xslt/Makefile.am
 --- gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am	2011-03-22 06:56:17.000000000 -0700
-+++ gnome-doc-utils-0.20.5/doc/xslt/Makefile.am	2011-05-04 21:03:29.382491164 -0700
++++ gnome-doc-utils-0.20.5/doc/xslt/Makefile.am	2011-05-09 09:35:04.946138220 -0700
 @@ -21,14 +21,14 @@
  
  $(xsldoc_docs): $(xsldoc_xsls) xsldoc.awk xsldoc-fill.xsl
@@ -25,6 +25,15 @@ diff -urN gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am gnome-doc-utils-0.20
  	--stringparam basename "$(basename $(notdir $@))" \
  	--stringparam xsl_file "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
  	"$(srcdir)/xsldoc-docbook.xsl" "$<"
+@@ -62,7 +62,7 @@
+ gnome-doc-xslt-check-xsldoc: $(xsldoc_docs)
+ 	@echo "Running xsldoc checks";
+ 	@(echo "<xsldoc>"; cat $(xsldoc_docs); echo "</xsldoc>") \
+-	| xsltproc "$(srcdir)/xsldoc-check.xsl" - 1> /dev/null
++	| xsltproc -nonet "$(srcdir)/xsldoc-check.xsl" - 1> /dev/null
+ 
+ .PHONY: clean-xsldoc
+ clean-local: clean_xsldoc
 @@ -75,4 +75,4 @@
  DOC_MODULE = gnome-doc-xslt
  DOC_INCLUDES = legal.xml translating.xml $(patsubst %,%.xml,$(xsldoc_base))
@@ -32,3 +41,60 @@ diff -urN gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am gnome-doc-utils-0.20
 -DOC_LINGUAS = de
 \ No newline at end of file
 +DOC_LINGUAS = de
+diff -urN gnome-doc-utils-0.20.5.orig//tools/gnome-doc-utils.make gnome-doc-utils-0.20.5/tools/gnome-doc-utils.make
+--- gnome-doc-utils-0.20.5.orig//tools/gnome-doc-utils.make	2011-03-22 06:56:17.000000000 -0700
++++ gnome-doc-utils-0.20.5/tools/gnome-doc-utils.make	2011-05-09 09:34:03.278985782 -0700
+@@ -37,7 +37,7 @@
+ 	list='$(DOC_H_DOCS)'; for doc in $$list; do \
+ 	  xmlpath="`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`:$(srcdir)/`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`"; \
+ 	  if ! test -f "$$doc"; then doc="$(srcdir)/$$doc"; fi; \
+-	  xsltproc --path "$$xmlpath" $(_credits) $$doc; \
++	  xsltproc -nonet --path "$$xmlpath" $(_credits) $$doc; \
+ 	done | sort | uniq \
+ 	  | awk 'BEGIN{s=""}{n=split($$0,w,"<");if(s!=""&&s!=substr(w[1],1,length(w[1])-1)){print s};if(n>1){print $$0;s=""}else{s=$$0}};END{if(s!=""){print s}}' \
+ 	  | sed -e 's/\\/\\\\/' -e 's/"/\\"/' -e 's/\(.*\)/\t"\1",/' >> $@.tmp
+@@ -50,7 +50,7 @@
+ 	  docid=`echo "$$doc" | sed -e 's/.*\/\([^/]*\)\.xml/\1/' \
+ 	    | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`; \
+ 	  echo $$xmlpath; \
+-	  ids=`xsltproc --xinclude --path "$$xmlpath" $(_ids) $$doc`; \
++	  ids=`xsltproc -nonet --xinclude --path "$$xmlpath" $(_ids) $$doc`; \
+ 	  for id in $$ids; do \
+ 	    echo '#define HELP_'`echo $$docid`'_'`echo $$id \
+ 	      | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`' "'$$id'"' >> $@.tmp; \
+@@ -180,7 +180,7 @@
+ 	  echo "The file '$(_skcontentslist)' does not exist." >&2;		\
+ 	  echo "Please check your ScrollKeeper installation." >&2;		\
+ 	  exit 1; }
+-	xsltproc -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
++	xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
+ 
+ ## @ _DOC_OMF_HTML
+ ## The OMF files for HTML output
+@@ -195,7 +195,7 @@
+ 	  echo "Please check your ScrollKeeper installation." >&2;		\
+ 	  exit 1; }
+ endif
+-	xsltproc -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
++	xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
+ 
+ ## @ _DOC_OMF_ALL
+ ## All OMF output files to be built
+@@ -250,7 +250,7 @@
+ ## All HTML documentation in the C locale
+ # FIXME: probably have to shell escape to determine the file names
+ _DOC_C_HTML = $(foreach f,						\
+-	$(shell xsltproc --xinclude 					\
++	$(shell xsltproc -nonet --xinclude 					\
+ 	  --stringparam db.chunk.basename "$(DOC_MODULE)"		\
+ 	  $(_chunks) "C/$(DOC_MODULE).xml"),				\
+ 	C/$(f).xhtml)
+@@ -379,7 +379,7 @@
+ _DOC_HTML_TOPS = $(foreach lc,C $(_DOC_REAL_LINGUAS),$(lc)/$(DOC_MODULE).xhtml)
+ 
+ $(_DOC_HTML_TOPS): $(_DOC_C_DOCS) $(_DOC_LC_DOCS)
+-	xsltproc -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
++	xsltproc -nonet -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
+ 
+ 
+ ################################################################################
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
index 1c864b2..115eb4d 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://xsltproc_nonet.patch"
 
-- 
1.7.1.1



