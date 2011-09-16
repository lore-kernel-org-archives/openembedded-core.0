Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R4hEh-00010W-VG
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 00:50:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Sep 2011 15:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,395,1312182000"; d="scan'208";a="17959840"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.15.15])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Sep 2011 15:45:04 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:44:57 -0700
Message-Id: <8d884d0a19e30abe7d79514bb7997ce465a71c4d.1316212888.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316212888.git.josh@linux.intel.com>
References: <cover.1316212888.git.josh@linux.intel.com>
In-Reply-To: <cover.1316212888.git.josh@linux.intel.com>
References: <cover.1316212888.git.josh@linux.intel.com>
Subject: [PATCH 1/1] texinfo: several changes to build without zlib and ncurses headers on host
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
X-List-Received-Date: Fri, 16 Sep 2011 22:50:21 -0000

Texinfo very cleverly detects cross-compilation and builds host versions
of the texinfo binaries it requires to bootstrap the build, however this
was causing the host to require ncurses and zlib libraries and headers.

Instead, since we require texinfo to be installed on the host, remove this
feature from the texinfo configure.ac (disable-native-tools.patch).

Further, fix texinfo to link with newer binutils (link-zip.patch) and to
generate translations with newer gettext (Makefile.in.in).

With this patch I am able to build texinfo on Fedora without ncurses-devel
and zlib-devel installed.

This fixes [YOCTO #1483]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../texinfo/texinfo-4.13a/Makefile.in.in           |  444 ++++++++++++++++++++
 .../texinfo-4.13a/disable-native-tools.patch       |   43 ++
 .../texinfo/texinfo-4.13a/link-zip.patch           |   16 +
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   26 +-
 4 files changed, 519 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/Makefile.in.in
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch

diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/Makefile.in.in b/meta/recipes-extended/texinfo/texinfo-4.13a/Makefile.in.in
new file mode 100644
index 0000000..83d8838
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/Makefile.in.in
@@ -0,0 +1,444 @@
+# Makefile for PO directory in any package using GNU gettext.
+# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
+#
+# This file can be copied and used freely without restrictions.  It can
+# be used in projects which are not available under the GNU General Public
+# License but which still want to provide support for the GNU gettext
+# functionality.
+# Please note that the actual code of GNU gettext is covered by the GNU
+# General Public License and is *not* in the public domain.
+#
+# Origin: gettext-0.18
+GETTEXT_MACRO_VERSION = 0.18
+
+PACKAGE = @PACKAGE@
+VERSION = @VERSION@
+PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
+
+SHELL = /bin/sh
+@SET_MAKE@
+
+srcdir = @srcdir@
+top_srcdir = @top_srcdir@
+VPATH = @srcdir@
+
+prefix = @prefix@
+exec_prefix = @exec_prefix@
+datarootdir = @datarootdir@
+datadir = @datadir@
+localedir = @localedir@
+gettextsrcdir = $(datadir)/gettext/po
+
+INSTALL = @INSTALL@
+INSTALL_DATA = @INSTALL_DATA@
+
+# We use $(mkdir_p).
+# In automake <= 1.9.x, $(mkdir_p) is defined either as "mkdir -p --" or as
+# "$(mkinstalldirs)" or as "$(install_sh) -d". For these automake versions,
+# @install_sh@ does not start with $(SHELL), so we add it.
+# In automake >= 1.10, @mkdir_p@ is derived from ${MKDIR_P}, which is defined
+# either as "/path/to/mkdir -p" or ".../install-sh -c -d". For these automake
+# versions, $(mkinstalldirs) and $(install_sh) are unused.
+mkinstalldirs = $(SHELL) @install_sh@ -d
+install_sh = $(SHELL) @install_sh@
+MKDIR_P = @MKDIR_P@
+mkdir_p = @mkdir_p@
+
+GMSGFMT_ = @GMSGFMT@
+GMSGFMT_no = @GMSGFMT@
+GMSGFMT_yes = @GMSGFMT_015@
+GMSGFMT = $(GMSGFMT_$(USE_MSGCTXT))
+MSGFMT_ = @MSGFMT@
+MSGFMT_no = @MSGFMT@
+MSGFMT_yes = @MSGFMT_015@
+MSGFMT = $(MSGFMT_$(USE_MSGCTXT))
+XGETTEXT_ = @XGETTEXT@
+XGETTEXT_no = @XGETTEXT@
+XGETTEXT_yes = @XGETTEXT_015@
+XGETTEXT = $(XGETTEXT_$(USE_MSGCTXT))
+MSGMERGE = msgmerge
+MSGMERGE_UPDATE = @MSGMERGE@ --update
+MSGINIT = msginit
+MSGCONV = msgconv
+MSGFILTER = msgfilter
+
+POFILES = @POFILES@
+GMOFILES = @GMOFILES@
+UPDATEPOFILES = @UPDATEPOFILES@
+DUMMYPOFILES = @DUMMYPOFILES@
+DISTFILES.common = Makefile.in.in remove-potcdate.sin \
+$(DISTFILES.common.extra1) $(DISTFILES.common.extra2) $(DISTFILES.common.extra3)
+DISTFILES = $(DISTFILES.common) Makevars POTFILES.in \
+$(POFILES) $(GMOFILES) \
+$(DISTFILES.extra1) $(DISTFILES.extra2) $(DISTFILES.extra3)
+
+POTFILES = \
+
+CATALOGS = @CATALOGS@
+
+# Makevars gets inserted here. (Don't remove this line!)
+
+.SUFFIXES:
+.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update
+
+.po.mo:
+	@echo "$(MSGFMT) -c -o $@ $<"; \
+	$(MSGFMT) -c -o t-$@ $< && mv t-$@ $@
+
+.po.gmo:
+	@lang=`echo $* | sed -e 's,.*/,,'`; \
+	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.po"; \
+	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
+
+.sin.sed:
+	sed -e '/^#/d' $< > t-$@
+	mv t-$@ $@
+
+
+all: check-macro-version all-@USE_NLS@
+
+all-yes: stamp-po
+all-no:
+
+# Ensure that the gettext macros and this Makefile.in.in are in sync.
+check-macro-version:
+	@test "$(GETTEXT_MACRO_VERSION)" = "@GETTEXT_MACRO_VERSION@" \
+	  || { echo "*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version $(GETTEXT_MACRO_VERSION) but the autoconf macros are from gettext version @GETTEXT_MACRO_VERSION@" 1>&2; \
+	       exit 1; \
+	     }
+
+# $(srcdir)/$(DOMAIN).pot is only created when needed. When xgettext finds no
+# internationalized messages, no $(srcdir)/$(DOMAIN).pot is created (because
+# we don't want to bother translators with empty POT files). We assume that
+# LINGUAS is empty in this case, i.e. $(POFILES) and $(GMOFILES) are empty.
+# In this case, stamp-po is a nop (i.e. a phony target).
+
+# stamp-po is a timestamp denoting the last time at which the CATALOGS have
+# been loosely updated. Its purpose is that when a developer or translator
+# checks out the package via CVS, and the $(DOMAIN).pot file is not in CVS,
+# "make" will update the $(DOMAIN).pot and the $(CATALOGS), but subsequent
+# invocations of "make" will do nothing. This timestamp would not be necessary
+# if updating the $(CATALOGS) would always touch them; however, the rule for
+# $(POFILES) has been designed to not touch files that don't need to be
+# changed.
+stamp-po: $(srcdir)/$(DOMAIN).pot
+	test ! -f $(srcdir)/$(DOMAIN).pot || \
+	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
+	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
+	  echo "touch stamp-po" && \
+	  echo timestamp > stamp-poT && \
+	  mv stamp-poT stamp-po; \
+	}
+
+# Note: Target 'all' must not depend on target '$(DOMAIN).pot-update',
+# otherwise packages like GCC can not be built if only parts of the source
+# have been downloaded.
+
+# This target rebuilds $(DOMAIN).pot; it is an expensive operation.
+# Note that $(DOMAIN).pot is not touched if it doesn't need to be changed.
+$(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
+	if LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null | grep -v 'libtool:' >/dev/null; then \
+	  package_gnu='GNU '; \
+	else \
+	  package_gnu=''; \
+	fi; \
+	if test -n '$(MSGID_BUGS_ADDRESS)' || test '$(PACKAGE_BUGREPORT)' = '@'PACKAGE_BUGREPORT'@'; then \
+	  msgid_bugs_address='$(MSGID_BUGS_ADDRESS)'; \
+	else \
+	  msgid_bugs_address='$(PACKAGE_BUGREPORT)'; \
+	fi; \
+	case `$(XGETTEXT) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
+	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+	      --files-from=$(srcdir)/POTFILES.in \
+	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+	      --msgid-bugs-address="$$msgid_bugs_address" \
+	    ;; \
+	  *) \
+	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+	      --files-from=$(srcdir)/POTFILES.in \
+	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+	      --package-name="$${package_gnu}@PACKAGE@" \
+	      --package-version='@VERSION@' \
+	      --msgid-bugs-address="$$msgid_bugs_address" \
+	    ;; \
+	esac
+	test ! -f $(DOMAIN).po || { \
+	  if test -f $(srcdir)/$(DOMAIN).pot; then \
+	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
+	    sed -f remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
+	    if cmp $(DOMAIN).1po $(DOMAIN).2po >/dev/null 2>&1; then \
+	      rm -f $(DOMAIN).1po $(DOMAIN).2po $(DOMAIN).po; \
+	    else \
+	      rm -f $(DOMAIN).1po $(DOMAIN).2po $(srcdir)/$(DOMAIN).pot && \
+	      mv $(DOMAIN).po $(srcdir)/$(DOMAIN).pot; \
+	    fi; \
+	  else \
+	    mv $(DOMAIN).po $(srcdir)/$(DOMAIN).pot; \
+	  fi; \
+	}
+
+# This rule has no dependencies: we don't need to update $(DOMAIN).pot at
+# every "make" invocation, only create it when it is missing.
+# Only "make $(DOMAIN).pot-update" or "make dist" will force an update.
+$(srcdir)/$(DOMAIN).pot:
+	$(MAKE) $(DOMAIN).pot-update
+
+# This target rebuilds a PO file if $(DOMAIN).pot has changed.
+# Note that a PO file is not touched if it doesn't need to be changed.
+$(POFILES): $(srcdir)/$(DOMAIN).pot
+	@lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
+	if test -f "$(srcdir)/$${lang}.po"; then \
+	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
+	  cd $(srcdir) \
+	    && { case `$(MSGMERGE_UPDATE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN).pot;; \
+	           *) \
+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot;; \
+	         esac; \
+	       }; \
+	else \
+	  $(MAKE) $${lang}.po-create; \
+	fi
+
+
+install: install-exec install-data
+install-exec:
+install-data: install-data-@USE_NLS@
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+	  for file in $(DISTFILES.common) Makevars.template; do \
+	    $(INSTALL_DATA) $(srcdir)/$$file \
+			    $(DESTDIR)$(gettextsrcdir)/$$file; \
+	  done; \
+	  for file in Makevars; do \
+	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+	  done; \
+	else \
+	  : ; \
+	fi
+install-data-no: all
+install-data-yes: all
+	@catalogs='$(CATALOGS)'; \
+	for cat in $$catalogs; do \
+	  cat=`basename $$cat`; \
+	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
+	  dir=$(localedir)/$$lang/LC_MESSAGES; \
+	  $(mkdir_p) $(DESTDIR)$$dir; \
+	  if test -r $$cat; then realcat=$$cat; else realcat=$(srcdir)/$$cat; fi; \
+	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
+	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
+	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
+	    if test -n "$$lc"; then \
+	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
+	        link=`cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc | sed -e 's/^.* -> //'`; \
+	        mv $(DESTDIR)$(localedir)/$$lang/$$lc $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	        mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        (cd $(DESTDIR)$(localedir)/$$lang/$$lc.old && \
+	         for file in *; do \
+	           if test -f $$file; then \
+	             ln -s ../$$link/$$file $(DESTDIR)$(localedir)/$$lang/$$lc/$$file; \
+	           fi; \
+	         done); \
+	        rm -f $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	      else \
+	        if test -d $(DESTDIR)$(localedir)/$$lang/$$lc; then \
+	          :; \
+	        else \
+	          rm -f $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	          mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        fi; \
+	      fi; \
+	      rm -f $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo; \
+	      ln -s ../LC_MESSAGES/$(DOMAIN).mo $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo 2>/dev/null || \
+	      ln $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(DOMAIN).mo $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo 2>/dev/null || \
+	      cp -p $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(DOMAIN).mo $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo; \
+	      echo "installing $$realcat link as $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo"; \
+	    fi; \
+	  done; \
+	done
+
+install-strip: install
+
+installdirs: installdirs-exec installdirs-data
+installdirs-exec:
+installdirs-data: installdirs-data-@USE_NLS@
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+	else \
+	  : ; \
+	fi
+installdirs-data-no:
+installdirs-data-yes:
+	@catalogs='$(CATALOGS)'; \
+	for cat in $$catalogs; do \
+	  cat=`basename $$cat`; \
+	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
+	  dir=$(localedir)/$$lang/LC_MESSAGES; \
+	  $(mkdir_p) $(DESTDIR)$$dir; \
+	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
+	    if test -n "$$lc"; then \
+	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
+	        link=`cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc | sed -e 's/^.* -> //'`; \
+	        mv $(DESTDIR)$(localedir)/$$lang/$$lc $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	        mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        (cd $(DESTDIR)$(localedir)/$$lang/$$lc.old && \
+	         for file in *; do \
+	           if test -f $$file; then \
+	             ln -s ../$$link/$$file $(DESTDIR)$(localedir)/$$lang/$$lc/$$file; \
+	           fi; \
+	         done); \
+	        rm -f $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	      else \
+	        if test -d $(DESTDIR)$(localedir)/$$lang/$$lc; then \
+	          :; \
+	        else \
+	          rm -f $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	          mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        fi; \
+	      fi; \
+	    fi; \
+	  done; \
+	done
+
+# Define this as empty until I found a useful application.
+installcheck:
+
+uninstall: uninstall-exec uninstall-data
+uninstall-exec:
+uninstall-data: uninstall-data-@USE_NLS@
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  for file in $(DISTFILES.common) Makevars.template; do \
+	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+	  done; \
+	else \
+	  : ; \
+	fi
+uninstall-data-no:
+uninstall-data-yes:
+	catalogs='$(CATALOGS)'; \
+	for cat in $$catalogs; do \
+	  cat=`basename $$cat`; \
+	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
+	  for lc in LC_MESSAGES $(EXTRA_LOCALE_CATEGORIES); do \
+	    rm -f $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo; \
+	  done; \
+	done
+
+check: all
+
+info dvi ps pdf html tags TAGS ctags CTAGS ID:
+
+mostlyclean:
+	rm -f remove-potcdate.sed
+	rm -f stamp-poT
+	rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.new.po
+	rm -fr *.o
+
+clean: mostlyclean
+
+distclean: clean
+	rm -f Makefile Makefile.in POTFILES *.mo
+
+maintainer-clean: distclean
+	@echo "This command is intended for maintainers to use;"
+	@echo "it deletes files that may require special tools to rebuild."
+	rm -f stamp-po $(GMOFILES)
+
+distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
+dist distdir:
+	$(MAKE) update-po
+	@$(MAKE) dist2
+# This is a separate target because 'update-po' must be executed before.
+dist2: stamp-po $(DISTFILES)
+	dists="$(DISTFILES)"; \
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  dists="$$dists Makevars.template"; \
+	fi; \
+	if test -f $(srcdir)/$(DOMAIN).pot; then \
+	  dists="$$dists $(DOMAIN).pot stamp-po"; \
+	fi; \
+	if test -f $(srcdir)/ChangeLog; then \
+	  dists="$$dists ChangeLog"; \
+	fi; \
+	for i in 0 1 2 3 4 5 6 7 8 9; do \
+	  if test -f $(srcdir)/ChangeLog.$$i; then \
+	    dists="$$dists ChangeLog.$$i"; \
+	  fi; \
+	done; \
+	if test -f $(srcdir)/LINGUAS; then dists="$$dists LINGUAS"; fi; \
+	for file in $$dists; do \
+	  if test -f $$file; then \
+	    cp -p $$file $(distdir) || exit 1; \
+	  else \
+	    cp -p $(srcdir)/$$file $(distdir) || exit 1; \
+	  fi; \
+	done
+
+update-po: Makefile
+	$(MAKE) $(DOMAIN).pot-update
+	test -z "$(UPDATEPOFILES)" || $(MAKE) $(UPDATEPOFILES)
+	$(MAKE) update-gmo
+
+# General rule for creating PO files.
+
+.nop.po-create:
+	@lang=`echo $@ | sed -e 's/\.po-create$$//'`; \
+	echo "File $$lang.po does not exist. If you are a translator, you can create it through 'msginit'." 1>&2; \
+	exit 1
+
+# General rule for updating PO files.
+
+.nop.po-update:
+	@lang=`echo $@ | sed -e 's/\.po-update$$//'`; \
+	if test "$(PACKAGE)" = "gettext-tools"; then PATH=`pwd`/../src:$$PATH; fi; \
+	tmpdir=`pwd`; \
+	echo "$$lang:"; \
+	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
+	cd $(srcdir); \
+	if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+	       *) \
+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+	     esac; \
+	   }; then \
+	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
+	    rm -f $$tmpdir/$$lang.new.po; \
+	  else \
+	    if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
+	      :; \
+	    else \
+	      echo "msgmerge for $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
+	      exit 1; \
+	    fi; \
+	  fi; \
+	else \
+	  echo "msgmerge for $$lang.po failed!" 1>&2; \
+	  rm -f $$tmpdir/$$lang.new.po; \
+	fi
+
+$(DUMMYPOFILES):
+
+update-gmo: Makefile $(GMOFILES)
+	@:
+
+# Recreate Makefile by invoking config.status. Explicitly invoke the shell,
+# because execution permission bits may not work on the current file system.
+# Use @SHELL@, which is the shell determined by autoconf for the use by its
+# scripts, not $(SHELL) which is hardwired to /bin/sh and may be deficient.
+Makefile: Makefile.in.in Makevars $(top_builddir)/config.status @POMAKEFILEDEPS@
+	cd $(top_builddir) \
+	  && @SHELL@ ./config.status $(subdir)/$@.in po-directories
+
+force:
+
+# Tell versions [3.59,3.63) of GNU make not to export all variables.
+# Otherwise a system limit (for SysV at least) may be exceeded.
+.NOEXPORT:
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
new file mode 100644
index 0000000..ab6f165
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/disable-native-tools.patch
@@ -0,0 +1,43 @@
+We already DEPEND on the native texinfo being present before building so
+there isn't any need to try and build the required native texinfo binaries
+before cross-compiling. This simplifies the recipe somewhat!
+
+Upstream-Status: Inappropriate oe specific
+
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Index: texinfo-4.13/configure.ac
+===================================================================
+--- texinfo-4.13.orig/configure.ac
++++ texinfo-4.13/configure.ac
+@@ -100,29 +100,7 @@ AC_CANONICAL_BUILD
+ # $native_tools is also added to SUBDIRS in the main Makefile.am,
+ # so that make compiles the native tools first.
+ #
+-if test "$cross_compiling" = no; then
+-  native_tools=
+-else
+-  native_tools=tools
+-  test -d "$native_tools" || mkdir "$native_tools"
+-  confdir=`(cd "$srcdir";pwd)`
+-  # Make sure the secondary configure won't fail with
+-  # "error: source directory already configured".
+-  rm -f config.status
+-  AC_MSG_NOTICE([[Doing configure of native tools (${build}).]])
+-  cd "$native_tools" || exit 1
+-  # Run secondary configure in alternate environment or
+-  # it gets the wrong CC etc.
+-  # env -i gives this build host configure a clean environment;
+-  # consequently, we have to re-initialize $PATH.
+-  env -i CC="$BUILD_CC" AR="$BUILD_AR" RANLIB="$BUILD_RANLIB" \
+-      PATH="$PATH" \
+-      tools_only=1 \
+-    ${confdir}/configure --build=${build} --host=${build} \
+-                         --disable-rpath --disable-nls
+-  cd .. || exit 1
+-  AC_MSG_NOTICE([[Continuing with main configure (${host}).]])
+-fi
++native_tools=
+ AC_SUBST(native_tools)
+ AM_CONDITIONAL(TOOLS_ONLY, [[test "x$tools_only" = x1]])
+ 
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch
new file mode 100644
index 0000000..629d329
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/link-zip.patch
@@ -0,0 +1,16 @@
+install-info uses symbols from zlib so must link against it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Index: texinfo-4.13/install-info/Makefile.am
+===================================================================
+--- texinfo-4.13.orig/install-info/Makefile.am
++++ texinfo-4.13/install-info/Makefile.am
+@@ -28,4 +28,4 @@ AM_CPPFLAGS = 					\
+   -I$(top_srcdir)/gnulib/lib			\
+   -I$(top_builddir)/gnulib/lib			\
+   -DLOCALEDIR=\"$(localedir)\"
+-LDADD = ../lib/libtxi.a $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL)
++LDADD = ../lib/libtxi.a $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL) -lz
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index 450a623..7a25b92 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -8,14 +8,18 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
 PR = "r1"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib ncurses texinfo-native"
+DEPENDS_virtclass-native = "zlib-native ncurses-native"
 
 SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
-           file://texinfo-4.12-zlib.patch; \
-           file://texinfo-4.13a-data_types.patch; \
-           file://texinfo-4.13a-mosdo-crash.patch; \
-           file://texinfo-4.13a-powerpc.patch; \
-           file://texinfo-4.13a-help-index-segfault.patch;"
+           file://texinfo-4.12-zlib.patch \
+           file://texinfo-4.13a-data_types.patch \
+           file://texinfo-4.13a-mosdo-crash.patch \
+           file://texinfo-4.13a-powerpc.patch \
+           file://texinfo-4.13a-help-index-segfault.patch \
+           file://disable-native-tools.patch \
+           file://link-zip.patch \
+           file://Makefile.in.in"
 
 SRC_URI[md5sum] = "71ba711519209b5fb583fed2b3d86fcb"
 SRC_URI[sha256sum] = "1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68"
@@ -25,13 +29,15 @@ tex_texinfo = "texmf/tex/texinfo"
 
 inherit gettext autotools
 
-do_configure() {
-	oe_runconf
+# TODO: is there a cleaner way to do this?
+do_configure_prepend() {
+	rm ${S}/po/Makefile.in.in
+	cp ${WORKDIR}/Makefile.in.in ${S}/po/Makefile.in.in
 }
 
-do_compile_prepend(){
+do_compile_prepend() {
 	if [ -d tools ];then
-		make -C tools/gnulib/lib
+		oe_runmake -C tools/gnulib/lib
 	fi
 }
 
-- 
1.7.6



