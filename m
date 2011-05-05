Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTk-0002yt-H2
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2011 00:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="918293027"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2011 00:57:30 -0700
Message-Id: <3a34a8ef854bc1d75b2ea6079ccf7f0f91c880a0.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 21:23:35 -0700
Date: Thu, 05 May 2011  0:57:30 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 22/26] gnome-doc-utils: Add -nonet option to xsltproc
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
X-List-Received-Date: Thu, 05 May 2011 08:00:09 -0000

From: Scott Garman <scott.a.garman@intel.com>

This adds the -nonet option to xsltproc invocations, which fixes
compile errors when building gnome-doc-xslt-de.omf.

Also add intltool-native to DEPENDS, which was discovered to be
needed when building this recipe.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |   34 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb |    4 ++-
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 30cff36..903d080 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPL LGPL"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native"
-DEPENDS_virtclass-native = "libxml2-native libxslt-native"
+DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native"
 
 inherit gnome gettext
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
new file mode 100644
index 0000000..73d22bf
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
@@ -0,0 +1,34 @@
+This adds the -nonet option to xsltproc invocations, which fixes
+compile errors when building gnome-doc-xslt-de.omf.
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+diff -urN gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am gnome-doc-utils-0.20.5/doc/xslt/Makefile.am
+--- gnome-doc-utils-0.20.5.orig//doc/xslt/Makefile.am	2011-03-22 06:56:17.000000000 -0700
++++ gnome-doc-utils-0.20.5/doc/xslt/Makefile.am	2011-05-04 21:03:29.382491164 -0700
+@@ -21,14 +21,14 @@
+ 
+ $(xsldoc_docs): $(xsldoc_xsls) xsldoc.awk xsldoc-fill.xsl
+ 	$(GDU_AWK) -f "$(srcdir)/xsldoc.awk" "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
+-	| xsltproc -o "$@" \
++	| xsltproc -nonet -o "$@" \
+ 	--stringparam basename "$(basename $(notdir $@))" \
+ 	--stringparam xsl_file "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
+ 	"$(srcdir)/xsldoc-fill.xsl" -
+ 
+ $(xsldoc_xmls): xsldoc-docbook.xsl
+ $(xsldoc_xmls): C/%.xml : C/%.xsldoc
+-	xsltproc -o "$@" \
++	xsltproc -nonet -o "$@" \
+ 	--stringparam basename "$(basename $(notdir $@))" \
+ 	--stringparam xsl_file "$(filter %/$(basename $(notdir $@)).xsl,$(xsldoc_xsls))" \
+ 	"$(srcdir)/xsldoc-docbook.xsl" "$<"
+@@ -75,4 +75,4 @@
+ DOC_MODULE = gnome-doc-xslt
+ DOC_INCLUDES = legal.xml translating.xml $(patsubst %,%.xml,$(xsldoc_base))
+ 
+-DOC_LINGUAS = de
+\ No newline at end of file
++DOC_LINGUAS = de
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
index 94b5aec..1c864b2 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
@@ -1,7 +1,9 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r0"
+PR = "r1"
+
+SRC_URI += "file://xsltproc_nonet.patch"
 
 SRC_URI[archive.md5sum] = "3aa1f651834714090cdbf898ec090a98"
 SRC_URI[archive.sha256sum] = "08d99b8ab813fadd3407873e4a30282debce92e22eb1b45430a8bb9c120e2130"
-- 
1.7.1.1



