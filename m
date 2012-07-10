Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sod5X-0006tq-3c
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:14:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2012 09:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120803503"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 09:03:41 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 09:02:18 -0700
Message-Id: <2da74a0c44518adf1d0716f49a93f97df9f0087c.1341935782.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
References: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341935782.git.nitin.a.kamble@intel.com>
References: <cover.1341935782.git.nitin.a.kamble@intel.com>
Subject: [PATCH 18/19] webgit-gtk: fix build with automake 1.12.1
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
X-List-Received-Date: Tue, 10 Jul 2012 16:15:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a new patch:
  webgit-gtk_fix_build_with_automake_1.12.patch

More comments in the patch header.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../webgit-gtk_fix_build_with_automake_1.12.patch  |   62 ++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    1 +
 2 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch

diff --git a/meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch b/meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
new file mode 100644
index 0000000..ad7c55f
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Pending
+
+automake 1.12 has deprecated use of mkdir_p, and it recommends
+use of MKDIR_P instead. Changed the code to avoid these kind 
+of warning-errors.
+
+./.deps/DerivedSources
+make[1]: ./.deps/DerivedSources: Command not found
+make[1]: *** [all-local] Error 127
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/10
+
+Index: webkit-gtk-1.7.2+svnr101488-r6/GNUmakefile.am
+===================================================================
+--- webkit-gtk-1.7.2+svnr101488-r6.orig/GNUmakefile.am
++++ webkit-gtk-1.7.2+svnr101488-r6/GNUmakefile.am
+@@ -255,7 +255,7 @@ MAINTAINERCLEANFILES += \
+ # Older automake versions (1.7) place Plo files in a different place so we need
+ # to create the output directory manually.
+ all-local: stamp-po
+-	$(mkdir_p) $(top_builddir)/$(DEPDIR)/DerivedSources
++	$(MKDIR_P) $(top_builddir)/$(DEPDIR)/DerivedSources
+ 
+ # remove built sources and program directories
+ clean-local:
+Index: webkit-gtk-1.7.2+svnr101488-r6/Source/WebKit/gtk/po/GNUmakefile.am
+===================================================================
+--- webkit-gtk-1.7.2+svnr101488-r6.orig/Source/WebKit/gtk/po/GNUmakefile.am
++++ webkit-gtk-1.7.2+svnr101488-r6/Source/WebKit/gtk/po/GNUmakefile.am
+@@ -132,13 +132,13 @@ DISTCLEANFILES += \
+ 	$(top_builddir)/Source/WebKit/gtk/po/$(DOMAIN).pot
+ 
+ po-install-data-local: all
+-	$(mkdir_p) $(DESTDIR)$(datadir)
++	$(MKDIR_P) $(DESTDIR)$(datadir)
+ 	@catalogs='$(MOFILES)'; \
+ 	for cat in $$catalogs; do \
+ 	  cat=`basename $$cat`; \
+ 	  lang=`echo $$cat | sed -e 's/\.mo$$//'`; \
+ 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
+-	  $(mkdir_p) $(DESTDIR)$$dir; \
++	  $(MKDIR_P) $(DESTDIR)$$dir; \
+ 	  if test -r Source/WebKit/gtk/po/$$cat; then realcat=Source/WebKit/gtk/po/$$cat; else realcat=$(srcdir)/$$cat; fi; \
+ 	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
+ 	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
+@@ -173,13 +173,13 @@ po-install-data-local: all
+ 	done
+ 
+ po-installdirs-data-local:
+-	$(mkdir_p) $(DESTDIR)$(datadir)
++	$(MKDIR_P) $(DESTDIR)$(datadir)
+ 	@catalogs='$(MOFILES)'; \
+ 	for cat in $$catalogs; do \
+ 	  cat=`basename $$cat`; \
+ 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
+ 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
+-	  $(mkdir_p) $(DESTDIR)$$dir; \
++	  $(MKDIR_P) $(DESTDIR)$$dir; \
+ 	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
+ 	    if test -n "$$lc"; then \
+ 	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 7d0aae9..f42ced9 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -33,6 +33,7 @@ SRC_URI = "\
   file://gtk-doc.make \
   file://nodolt.patch \
   file://function-scope.patch \
+  file://webgit-gtk_fix_build_with_automake_1.12.patch \
  "
 
 S = "${WORKDIR}/"
-- 
1.7.3.4



