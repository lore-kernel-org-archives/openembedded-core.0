Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QxBdG-0004AD-BS
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 07:40:38 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7R5ZmQ4013522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:35:48 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7R5ZmsY006742
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:35:48 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7R5ZmY6002249
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:35:48 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 27 Aug 2011 00:35:47 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7R5Zgol019032;	Sat, 27 Aug 2011 00:35:48 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Aug 2011 00:26:20 -0500
Message-ID: <1314422782-11863-3-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314422782-11863-1-git-send-email-joelagnel@ti.com>
References: <1314422782-11863-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: k-kooi@ti.com
Subject: [PATCH v3 meta-oe 2/4] gtksourceview: Imported from OE classic
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
X-List-Received-Date: Sat, 27 Aug 2011 05:40:38 -0000
Content-Type: text/plain

* Added LIC_FILES_CHKSUM
* Added virtual/gettext to DEPENDS

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../recipes-gnome/gtksourceview/files/acinclude.m4 |   90 ++++++++++
 .../recipes-gnome/gtksourceview/files/gtk-doc.m4   |   53 ++++++
 .../recipes-gnome/gtksourceview/files/gtk-doc.make |  173 ++++++++++++++++++++
 .../gtksourceview/gtksourceview2_2.10.0.bb         |   29 ++++
 4 files changed, 345 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/files/acinclude.m4
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.m4
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.make
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.0.bb

diff --git a/meta-gnome/recipes-gnome/gtksourceview/files/acinclude.m4 b/meta-gnome/recipes-gnome/gtksourceview/files/acinclude.m4
new file mode 100644
index 0000000..53518fb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/files/acinclude.m4
@@ -0,0 +1,90 @@
+## this one is commonly used with AM_PATH_PYTHONDIR ...
+dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND [,ACTION-IF-NOT-FOUND]]])
+dnl Check if a module containing a given symbol is visible to python.
+AC_DEFUN(AM_CHECK_PYMOD,
+[AC_REQUIRE([AM_PATH_PYTHON])
+py_mod_var=`echo $1['_']$2 | sed 'y%./+-%__p_%'`
+AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)
+AC_CACHE_VAL(py_cv_mod_$py_mod_var, [
+ifelse([$2],[], [prog="
+import sys
+try:
+        import $1
+except ImportError:
+        sys.exit(1)
+except:
+        sys.exit(0)
+sys.exit(0)"], [prog="
+import $1
+$1.$2"])
+if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC
+  then
+    eval "py_cv_mod_$py_mod_var=yes"
+  else
+    eval "py_cv_mod_$py_mod_var=no"
+  fi
+])
+py_val=`eval "echo \`echo '$py_cv_mod_'$py_mod_var\`"`
+if test "x$py_val" != xno; then
+  AC_MSG_RESULT(yes)
+  ifelse([$3], [],, [$3
+])dnl
+else
+  AC_MSG_RESULT(no)
+  ifelse([$4], [],, [$4
+])dnl
+fi
+])
+
+dnl a macro to check for ability to create python extensions
+dnl  AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE], [ACTION-IF-NOT-POSSIBLE])
+dnl function also defines PYTHON_INCLUDES
+AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
+[AC_REQUIRE([AM_PATH_PYTHON])
+AC_MSG_CHECKING(for headers required to compile python extensions)
+dnl deduce PYTHON_INCLUDES
+AC_ARG_WITH(python-includes,
+	[  --with-python-includes=DIR  path to Python includes], py_exec_prefix=$withval)
+if test x$py_exec_prefix != x; then
+PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
+else
+py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
+py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
+PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
+if test "$py_prefix" != "$py_exec_prefix"; then
+  PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
+fi
+fi
+AC_SUBST(PYTHON_INCLUDES)
+dnl check if the headers exist:
+save_CPPFLAGS="$CPPFLAGS"
+CPPFLAGS="$CPPFLAGS $PYTHON_INCLUDES"
+AC_TRY_CPP([#include <Python.h>],dnl
+[AC_MSG_RESULT(found)
+$1],dnl
+[AC_MSG_RESULT(not found)
+$2])
+CPPFLAGS="$save_CPPFLAGS"
+])
+
+dnl
+dnl JH_ADD_CFLAG(FLAG)
+dnl checks whether the C compiler supports the given flag, and if so, adds
+dnl it to $CFLAGS.  If the flag is already present in the list, then the
+dnl check is not performed.
+AC_DEFUN([JH_ADD_CFLAG],
+[
+case " $CFLAGS " in
+*@<:@\	\ @:>@$1@<:@\	\ @:>@*)
+  ;;
+*)
+  save_CFLAGS="$CFLAGS"
+  CFLAGS="$CFLAGS $1"
+  AC_MSG_CHECKING([whether [$]CC understands $1])
+  AC_TRY_COMPILE([], [], [jh_has_option=yes], [jh_has_option=no])
+  AC_MSG_RESULT($jh_has_option)
+  if test $jh_has_option = no; then
+    CFLAGS="$save_CFLAGS"
+  fi
+  ;;
+esac])
diff --git a/meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.m4 b/meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.m4
new file mode 100644
index 0000000..3ec4166
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.m4
@@ -0,0 +1,53 @@
+dnl -*- mode: autoconf -*-
+
+# serial 1
+
+dnl Usage:
+dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
+AC_DEFUN([GTK_DOC_CHECK],
+[
+  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
+  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
+  dnl for overriding the documentation installation directory
+  AC_ARG_WITH(html-dir,
+    AC_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
+    [with_html_dir='${datadir}/gtk-doc/html'])
+  HTML_DIR="$with_html_dir"
+  AC_SUBST(HTML_DIR)
+
+  dnl enable/disable documentation building
+  AC_ARG_ENABLE(gtk-doc,
+    AC_HELP_STRING([--enable-gtk-doc],
+                   [use gtk-doc to build documentation [default=no]]),,
+    enable_gtk_doc=no)
+
+  have_gtk_doc=no
+  if test -z "$PKG_CONFIG"; then
+    AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
+  fi
+  if test "$PKG_CONFIG" != "no" && $PKG_CONFIG --exists gtk-doc; then
+    have_gtk_doc=yes
+  fi
+
+  dnl do we want to do a version check?
+ifelse([$1],[],,
+  [gtk_doc_min_version=$1
+  if test "$have_gtk_doc" = yes; then
+    AC_MSG_CHECKING([gtk-doc version >= $gtk_doc_min_version])
+    if $PKG_CONFIG --atleast-version $gtk_doc_min_version gtk-doc; then
+      AC_MSG_RESULT(yes)
+    else
+      AC_MSG_RESULT(no)
+      have_gtk_doc=no
+    fi
+  fi
+])
+  if test x$enable_gtk_doc = xyes; then
+    if test "$have_gtk_doc" != yes; then
+      enable_gtk_doc=no
+    fi
+  fi
+
+  AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
+  AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
+])
diff --git a/meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.make b/meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.make
new file mode 100644
index 0000000..354ffb7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.make
@@ -0,0 +1,173 @@
+# -*- mode: makefile -*-
+
+####################################
+# Everything below here is generic #
+####################################
+
+if GTK_DOC_USE_LIBTOOL
+GTKDOC_CC = $(LIBTOOL) --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+GTKDOC_LD = $(LIBTOOL) --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+else
+GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+endif
+
+# We set GPATH here; this gives us semantics for GNU make
+# which are more like other make's VPATH, when it comes to
+# whether a source that is a target of one rule is then
+# searched for in VPATH/GPATH.
+#
+GPATH = $(srcdir)
+
+TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
+
+EXTRA_DIST = 				\
+	$(content_files)		\
+	$(HTML_IMAGES)			\
+	$(DOC_MAIN_SGML_FILE)		\
+	$(DOC_MODULE)-sections.txt	\
+	$(DOC_MODULE)-overrides.txt
+
+DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp html-build.stamp \
+	   $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp
+
+SCANOBJ_FILES = 		 \
+	$(DOC_MODULE).args 	 \
+	$(DOC_MODULE).hierarchy  \
+	$(DOC_MODULE).interfaces \
+	$(DOC_MODULE).prerequisites \
+	$(DOC_MODULE).signals
+
+REPORT_FILES = \
+	$(DOC_MODULE)-undocumented.txt \
+	$(DOC_MODULE)-undeclared.txt \
+	$(DOC_MODULE)-unused.txt
+
+CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
+
+if ENABLE_GTK_DOC
+all-local: html-build.stamp
+else
+all-local:
+endif
+
+docs: html-build.stamp
+
+#### scan ####
+
+scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
+	@echo 'gtk-doc: Scanning header files'
+	@-chmod -R u+w $(srcdir)
+	cd $(srcdir) && \
+	  gtkdoc-scan --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --ignore-headers="$(IGNORE_HFILES)" $(SCAN_OPTIONS) $(EXTRA_HFILES)
+	if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
+	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" CFLAGS="$(GTKDOC_CFLAGS)" LDFLAGS="$(GTKDOC_LIBS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
+	else \
+	    cd $(srcdir) ; \
+	    for i in $(SCANOBJ_FILES) ; do \
+               test -f $$i || touch $$i ; \
+	    done \
+	fi
+	touch scan-build.stamp
+
+$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
+	@true
+
+#### templates ####
+
+tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
+	@echo 'gtk-doc: Rebuilding template files'
+	@-chmod -R u+w $(srcdir)
+	cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
+	touch tmpl-build.stamp
+
+tmpl.stamp: tmpl-build.stamp
+	@true
+
+tmpl/*.sgml:
+	@true
+
+
+#### xml ####
+
+sgml-build.stamp: tmpl.stamp $(HFILE_GLOB) $(CFILE_GLOB) $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
+	@echo 'gtk-doc: Building XML'
+	@-chmod -R u+w $(srcdir)
+	cd $(srcdir) && \
+	gtkdoc-mkdb --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $(MKDB_OPTIONS)
+	touch sgml-build.stamp
+
+sgml.stamp: sgml-build.stamp
+	@true
+
+#### html ####
+
+html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
+	@echo 'gtk-doc: Building HTML'
+	@-chmod -R u+w $(srcdir)
+	rm -rf $(srcdir)/html
+	mkdir $(srcdir)/html
+	cd $(srcdir)/html && gtkdoc-mkhtml $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
+	test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
+	@echo 'gtk-doc: Fixing cross-references'
+	cd $(srcdir) && gtkdoc-fixxref --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
+	touch html-build.stamp
+
+##############
+
+clean-local:
+	rm -f *~ *.bak
+	rm -rf .libs
+
+distclean-local:
+	cd $(srcdir) && \
+	  rm -rf xml $(REPORT_FILES) \
+	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
+
+maintainer-clean-local: clean
+	cd $(srcdir) && rm -rf xml html
+
+install-data-local:
+	-installfiles=`echo $(srcdir)/html/*`; \
+	if test "$$installfiles" = '$(srcdir)/html/*'; \
+	then echo '-- Nothing to install' ; \
+	else \
+	  $(mkinstalldirs) $(DESTDIR)$(TARGET_DIR); \
+	  for i in $$installfiles; do \
+	    echo '-- Installing '$$i ; \
+	    $(INSTALL_DATA) $$i $(DESTDIR)$(TARGET_DIR); \
+	  done; \
+	  echo '-- Installing $(srcdir)/html/index.sgml' ; \
+	  $(INSTALL_DATA) $(srcdir)/html/index.sgml $(DESTDIR)$(TARGET_DIR) || :; \
+	  which gtkdoc-rebase >/dev/null && \
+	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
+	fi
+	
+
+uninstall-local:
+	rm -f $(DESTDIR)$(TARGET_DIR)/*
+
+#
+# Require gtk-doc when making dist
+#
+if ENABLE_GTK_DOC
+dist-check-gtkdoc:
+else
+dist-check-gtkdoc:
+	@echo "*** gtk-doc must be installed and enabled in order to make dist"
+	@false
+endif
+
+dist-hook: dist-check-gtkdoc dist-hook-local
+	mkdir $(distdir)/tmpl
+	mkdir $(distdir)/xml
+	mkdir $(distdir)/html
+	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
+	-cp $(srcdir)/xml/*.xml $(distdir)/xml
+	cp $(srcdir)/html/* $(distdir)/html
+	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
+	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
+	cd $(distdir) && rm -f $(DISTCLEANFILES)
+	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
+
+.PHONY : dist-hook-local docs
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.0.bb
new file mode 100644
index 0000000..3b2226f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.0.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Portable C library for multiline text editing"
+HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
+LICENSE = "GPLv2"
+DEPENDS = "gtk+ libgnomeprint virtual/gettext"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PNAME = "gtksourceview"
+
+S = "${WORKDIR}/${PNAME}-${PV}"
+
+inherit gnome lib_package
+
+# overrule SRC_URI from gnome.conf
+SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2;name=archive"
+SRC_URI[archive.md5sum] = "04279db5d4fda41a35bf3d9aafa3a6c1"
+SRC_URI[archive.sha256sum] = "a72484ff661d3515130911b59f78a88afc1344421431e05e99e9dab791be948f"
+
+SRC_URI += " \
+           file://gtk-doc.make \
+"
+
+do_configure_prepend() {
+    cp ${WORKDIR}/gtk-doc.make ${S}/
+    sed -i -e s:docs::g ${S}/Makefile.am
+    echo "EXTRA_DIST = version.xml" > gnome-doc-utils.make
+}
+
+FILES_${PN} += " ${datadir}/gtksourceview-2.0"
-- 
1.7.0.4



