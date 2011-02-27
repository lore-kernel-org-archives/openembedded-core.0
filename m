Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyB-0007Da-Of
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:15 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:53 -0800 (PST)
Received: by 10.216.48.211 with SMTP id v61mr3810508web.35.1298798993192;
	Sun, 27 Feb 2011 01:29:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m6sm1283526wej.34.2011.02.27.01.29.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:27 +0100
Message-Id: <48abaf8f5bd3ff536ea624a75212a8dcabe2f205.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 20/50] linuxdoc-tools-native: new recipe v0.99.6
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:15 -0000

From: Scott Garman <scott.a.garman@intel.com>

This package includes utilities such as sgml2html and sgml2txt,
which are used by other packages (e.g, libuser) for building
documentation.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../linuxdoc-tools-native/disable_sgml2rtf.patch   |   49 ++++++++++++++++++++
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb |   21 ++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
new file mode 100644
index 0000000..0fcaceb
--- /dev/null
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
@@ -0,0 +1,49 @@
+The build of sgml2rtf is problematic due to the way it wants to
+link to a shared library version of flex. Flex only ships with a
+static lib. Rather than diverging from upstream flex, simply skip
+building this un-needed utility.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+diff -urN linuxdoc-tools-0.9.66.orig//Makefile.in linuxdoc-tools-0.9.66/Makefile.in
+--- linuxdoc-tools-0.9.66.orig//Makefile.in	2009-11-09 11:58:25.000000000 -0800
++++ linuxdoc-tools-0.9.66/Makefile.in	2011-02-24 15:37:46.556937051 -0800
+@@ -40,7 +40,7 @@
+ pkgdata_ddir       = $(DESTDIR)$(pkgdatadir)
+ tex_ddir           = $(DESTDIR)$(texdir)
+ 
+-progs    := sgml2html sgml2info sgml2latex sgml2lyx sgml2rtf sgml2txt sgmlcheck
++progs    := sgml2html sgml2info sgml2latex sgml2lyx sgml2txt sgmlcheck
+ 
+ OPTIMIZE  = -O
+ 
+@@ -64,9 +64,9 @@
+ 	@echo "Compiling preprocessor (in sgmlpre/)..."
+ 	( cd sgmlpre ; \
+ 	  $(MAKE) CFLAGS="$(OPTIMIZE)" LEX=flex sgmlpre || exit -1 )
+-	@echo "Compiling RTF conversion tools (in rtf-fix/)..."
+-	( cd rtf-fix ; \
+-	  $(MAKE) CFLAGS="$(OPTIMIZE)" || exit -1 )
++#	@echo "Compiling RTF conversion tools (in rtf-fix/)..."
++#	( cd rtf-fix ; \
++#	  $(MAKE) CFLAGS="$(OPTIMIZE)" || exit -1 )
+ 	@echo "making man pages in genman ..."
+ 	if [ ! -d genman ]; then mkdir genman ; fi
+ 	for ii in man/* ; do \
+@@ -109,7 +109,7 @@
+ 
+ #    -- Install auxiliary programs
+ 	mkdir -p $(auxbin_ddir)
+-	for ii in sgmlpre/sgmlpre rtf-fix/rtf2rtf; do \
++	for ii in sgmlpre/sgmlpre; do \
+ 	  bn=`basename $$ii`; \
+ 	  $(INSTALL_PROGRAM) $$ii $(auxbin_ddir)/$$bn; \
+ 	done
+@@ -198,7 +198,7 @@
+ 
+ clean::
+ 	-rm -f *~ bin/*~ bin/linuxdoc
+-	for d in $(DDIRS) $(MDIRS) rtf-fix; do $(MAKE) -C $$d clean; done
++	for d in $(DDIRS) $(MDIRS); do $(MAKE) -C $$d clean; done
+ 	(cd sgmlpre ; rm -f sgmlpre.o sgmlpre)
+ 	-rm -rf genman/
+ 
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
new file mode 100644
index 0000000..f3cd195
--- /dev/null
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Convert LinuxDoc SGML source into other formats"
+DESCRIPTION = "Convert LinuxDoc SGML source into other formats"
+HOMEPAGE = "http://packages.debian.org/linuxdoc-tools"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5fbccc46cff2379505ca4e09c7d6ccfe"
+
+DEPENDS = "openjade-native"
+
+PR = "r0"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.tar.gz \
+           file://disable_sgml2rtf.patch"
+
+SRC_URI[md5sum] = "f214e79b0dd084689cd04f18722bd563"
+SRC_URI[sha256sum] = "128cabb52ef8fb2f370ee488ea92bf4d8e49859200c7c8cae807abfe860a62ec"
+
+inherit autotools native
+
+do_configure () {
+	oe_runconf
+}
-- 
1.6.6.1



