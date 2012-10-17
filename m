Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOUgc-0001yw-66 for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:33:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HEKBec006609
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:20:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05962-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:20:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HEK10v006588
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:20:02 +0100
Message-ID: <1350483609.2185.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2012 15:20:09 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gettext: Add config.rpath and Makefile.in.in to gettext-minimal-native
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
X-List-Received-Date: Wed, 17 Oct 2012 14:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need gettext-minimal-native to be able to install config.rpath and
Makefile.in.in so that we don't get version mismatch errors when subsequently
using the reconfigured software.

This patch moves the two files to be provided by minimal-native so
that we can better 'gettextize' software without needing the full
gettext-native when using --disable-nls.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makefile.in.in
new file mode 100644
index 0000000..83d8838
--- a/dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makefile.in.in
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
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makevars.template b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makevars.template
new file mode 100644
index 0000000..32692ab
--- a/dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makevars.template
@@ -0,0 +1,41 @@
+# Makefile variables for PO directory in any package using GNU gettext.
+
+# Usually the message domain is the same as the package name.
+DOMAIN = $(PACKAGE)
+
+# These two variables depend on the location of this directory.
+subdir = po
+top_builddir = ..
+
+# These options get passed to xgettext.
+XGETTEXT_OPTIONS = --keyword=_ --keyword=N_
+
+# This is the copyright holder that gets inserted into the header of the
+# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
+# package.  (Note that the msgstr strings, extracted from the package's
+# sources, belong to the copyright holder of the package.)  Translators are
+# expected to transfer the copyright for their translations to this person
+# or entity, or to disclaim their copyright.  The empty string stands for
+# the public domain; in this case the translators are expected to disclaim
+# their copyright.
+COPYRIGHT_HOLDER = Free Software Foundation, Inc.
+
+# This is the email address or URL to which the translators shall report
+# bugs in the untranslated strings:
+# - Strings which are not entire sentences, see the maintainer guidelines
+#   in the GNU gettext documentation, section 'Preparing Strings'.
+# - Strings which use unclear terms or require additional context to be
+#   understood.
+# - Strings which make invalid assumptions about notation of date, time or
+#   money.
+# - Pluralisation problems.
+# - Incorrect English spelling.
+# - Incorrect formatting.
+# It can be your email address, or a mailing list address where translators
+# can write to without being subscribed, or the URL of a web page through
+# which the translators can contact you.
+MSGID_BUGS_ADDRESS =
+
+# This is the list of locale categories, beyond LC_MESSAGES, for which the
+# message catalogs shall be used.  It is usually empty.
+EXTRA_LOCALE_CATEGORIES =
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/config.rpath
new file mode 100755
index 0000000..17298f2
--- a/dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/config.rpath
@@ -0,0 +1,672 @@
+#! /bin/sh
+# Output a system dependent set of variables, describing how to set the
+# run time search path of shared libraries in an executable.
+#
+#   Copyright 1996-2010 Free Software Foundation, Inc.
+#   Taken from GNU libtool, 2001
+#   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
+#
+#   This file is free software; the Free Software Foundation gives
+#   unlimited permission to copy and/or distribute it, with or without
+#   modifications, as long as this notice is preserved.
+#
+# The first argument passed to this file is the canonical host specification,
+#    CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM
+# or
+#    CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM
+# The environment variables CC, GCC, LDFLAGS, LD, with_gnu_ld
+# should be set by the caller.
+#
+# The set of defined variables is at the end of this script.
+
+# Known limitations:
+# - On IRIX 6.5 with CC="cc", the run time search patch must not be longer
+#   than 256 bytes, otherwise the compiler driver will dump core. The only
+#   known workaround is to choose shorter directory names for the build
+#   directory and/or the installation directory.
+
+# All known linkers require a `.a' archive for static linking (except MSVC,
+# which needs '.lib').
+libext=a
+shrext=.so
+
+host="$1"
+host_cpu=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
+host_vendor=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
+host_os=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
+
+# Code taken from libtool.m4's _LT_CC_BASENAME.
+
+for cc_temp in $CC""; do
+  case $cc_temp in
+    compile | *[\\/]compile | ccache | *[\\/]ccache ) ;;
+    distcc | *[\\/]distcc | purify | *[\\/]purify ) ;;
+    \-*) ;;
+    *) break;;
+  esac
+done
+cc_basename=`echo "$cc_temp" | sed -e 's%^.*/%%'`
+
+# Code taken from libtool.m4's _LT_COMPILER_PIC.
+
+wl=
+if test "$GCC" = yes; then
+  wl='-Wl,'
+else
+  case "$host_os" in
+    aix*)
+      wl='-Wl,'
+      ;;
+    darwin*)
+      case $cc_basename in
+        xlc*)
+          wl='-Wl,'
+          ;;
+      esac
+      ;;
+    mingw* | cygwin* | pw32* | os2* | cegcc*)
+      ;;
+    hpux9* | hpux10* | hpux11*)
+      wl='-Wl,'
+      ;;
+    irix5* | irix6* | nonstopux*)
+      wl='-Wl,'
+      ;;
+    newsos6)
+      ;;
+    linux* | k*bsd*-gnu)
+      case $cc_basename in
+        ecc*)
+          wl='-Wl,'
+          ;;
+        icc* | ifort*)
+          wl='-Wl,'
+          ;;
+        lf95*)
+          wl='-Wl,'
+          ;;
+        pgcc | pgf77 | pgf90)
+          wl='-Wl,'
+          ;;
+        ccc*)
+          wl='-Wl,'
+          ;;
+        como)
+          wl='-lopt='
+          ;;
+        *)
+          case `$CC -V 2>&1 | sed 5q` in
+            *Sun\ C*)
+              wl='-Wl,'
+              ;;
+          esac
+          ;;
+      esac
+      ;;
+    osf3* | osf4* | osf5*)
+      wl='-Wl,'
+      ;;
+    rdos*)
+      ;;
+    solaris*)
+      wl='-Wl,'
+      ;;
+    sunos4*)
+      wl='-Qoption ld '
+      ;;
+    sysv4 | sysv4.2uw2* | sysv4.3*)
+      wl='-Wl,'
+      ;;
+    sysv4*MP*)
+      ;;
+    sysv5* | unixware* | sco3.2v5* | sco5v6* | OpenUNIX*)
+      wl='-Wl,'
+      ;;
+    unicos*)
+      wl='-Wl,'
+      ;;
+    uts4*)
+      ;;
+  esac
+fi
+
+# Code taken from libtool.m4's _LT_LINKER_SHLIBS.
+
+hardcode_libdir_flag_spec=
+hardcode_libdir_separator=
+hardcode_direct=no
+hardcode_minus_L=no
+
+case "$host_os" in
+  cygwin* | mingw* | pw32* | cegcc*)
+    # FIXME: the MSVC++ port hasn't been tested in a loooong time
+    # When not using gcc, we currently assume that we are using
+    # Microsoft Visual C++.
+    if test "$GCC" != yes; then
+      with_gnu_ld=no
+    fi
+    ;;
+  interix*)
+    # we just hope/assume this is gcc and not c89 (= MSVC++)
+    with_gnu_ld=yes
+    ;;
+  openbsd*)
+    with_gnu_ld=no
+    ;;
+esac
+
+ld_shlibs=yes
+if test "$with_gnu_ld" = yes; then
+  # Set some defaults for GNU ld with shared library support. These
+  # are reset later if shared libraries are not supported. Putting them
+  # here allows them to be overridden if necessary.
+  # Unlike libtool, we use -rpath here, not --rpath, since the documented
+  # option of GNU ld is called -rpath, not --rpath.
+  hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+  case "$host_os" in
+    aix[3-9]*)
+      # On AIX/PPC, the GNU linker is very broken
+      if test "$host_cpu" != ia64; then
+        ld_shlibs=no
+      fi
+      ;;
+    amigaos*)
+      hardcode_libdir_flag_spec='-L$libdir'
+      hardcode_minus_L=yes
+      # Samuel A. Falvo II <kc5tja@dolphin.openprojects.net> reports
+      # that the semantics of dynamic libraries on AmigaOS, at least up
+      # to version 4, is to share data among multiple programs linked
+      # with the same dynamic library.  Since this doesn't match the
+      # behavior of shared libraries on other platforms, we cannot use
+      # them.
+      ld_shlibs=no
+      ;;
+    beos*)
+      if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
+        :
+      else
+        ld_shlibs=no
+      fi
+      ;;
+    cygwin* | mingw* | pw32* | cegcc*)
+      # hardcode_libdir_flag_spec is actually meaningless, as there is
+      # no search path for DLLs.
+      hardcode_libdir_flag_spec='-L$libdir'
+      if $LD --help 2>&1 | grep 'auto-import' > /dev/null; then
+        :
+      else
+        ld_shlibs=no
+      fi
+      ;;
+    interix[3-9]*)
+      hardcode_direct=no
+      hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
+      ;;
+    gnu* | linux* | k*bsd*-gnu)
+      if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
+        :
+      else
+        ld_shlibs=no
+      fi
+      ;;
+    netbsd*)
+      ;;
+    solaris*)
+      if $LD -v 2>&1 | grep 'BFD 2\.8' > /dev/null; then
+        ld_shlibs=no
+      elif $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
+        :
+      else
+        ld_shlibs=no
+      fi
+      ;;
+    sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX*)
+      case `$LD -v 2>&1` in
+        *\ [01].* | *\ 2.[0-9].* | *\ 2.1[0-5].*)
+          ld_shlibs=no
+          ;;
+        *)
+          if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
+            hardcode_libdir_flag_spec='`test -z "$SCOABSPATH" && echo ${wl}-rpath,$libdir`'
+          else
+            ld_shlibs=no
+          fi
+          ;;
+      esac
+      ;;
+    sunos4*)
+      hardcode_direct=yes
+      ;;
+    *)
+      if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
+        :
+      else
+        ld_shlibs=no
+      fi
+      ;;
+  esac
+  if test "$ld_shlibs" = no; then
+    hardcode_libdir_flag_spec=
+  fi
+else
+  case "$host_os" in
+    aix3*)
+      # Note: this linker hardcodes the directories in LIBPATH if there
+      # are no directories specified by -L.
+      hardcode_minus_L=yes
+      if test "$GCC" = yes; then
+        # Neither direct hardcoding nor static linking is supported with a
+        # broken collect2.
+        hardcode_direct=unsupported
+      fi
+      ;;
+    aix[4-9]*)
+      if test "$host_cpu" = ia64; then
+        # On IA64, the linker does run time linking by default, so we don't
+        # have to do anything special.
+        aix_use_runtimelinking=no
+      else
+        aix_use_runtimelinking=no
+        # Test if we are trying to use run time linking or normal
+        # AIX style linking. If -brtl is somewhere in LDFLAGS, we
+        # need to do runtime linking.
+        case $host_os in aix4.[23]|aix4.[23].*|aix[5-9]*)
+          for ld_flag in $LDFLAGS; do
+            if (test $ld_flag = "-brtl" || test $ld_flag = "-Wl,-brtl"); then
+              aix_use_runtimelinking=yes
+              break
+            fi
+          done
+          ;;
+        esac
+      fi
+      hardcode_direct=yes
+      hardcode_libdir_separator=':'
+      if test "$GCC" = yes; then
+        case $host_os in aix4.[012]|aix4.[012].*)
+          collect2name=`${CC} -print-prog-name=collect2`
+          if test -f "$collect2name" && \
+            strings "$collect2name" | grep resolve_lib_name >/dev/null
+          then
+            # We have reworked collect2
+            :
+          else
+            # We have old collect2
+            hardcode_direct=unsupported
+            hardcode_minus_L=yes
+            hardcode_libdir_flag_spec='-L$libdir'
+            hardcode_libdir_separator=
+          fi
+          ;;
+        esac
+      fi
+      # Begin _LT_AC_SYS_LIBPATH_AIX.
+      echo 'int main () { return 0; }' > conftest.c
+      ${CC} ${LDFLAGS} conftest.c -o conftest
+      aix_libpath=`dump -H conftest 2>/dev/null | sed -n -e '/Import File Strings/,/^$/ { /^0/ { s/^0  *\(.*\)$/\1/; p; }
+}'`
+      if test -z "$aix_libpath"; then
+        aix_libpath=`dump -HX64 conftest 2>/dev/null | sed -n -e '/Import File Strings/,/^$/ { /^0/ { s/^0  *\(.*\)$/\1/; p; }
+}'`
+      fi
+      if test -z "$aix_libpath"; then
+        aix_libpath="/usr/lib:/lib"
+      fi
+      rm -f conftest.c conftest
+      # End _LT_AC_SYS_LIBPATH_AIX.
+      if test "$aix_use_runtimelinking" = yes; then
+        hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
+      else
+        if test "$host_cpu" = ia64; then
+          hardcode_libdir_flag_spec='${wl}-R $libdir:/usr/lib:/lib'
+        else
+          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
+        fi
+      fi
+      ;;
+    amigaos*)
+      hardcode_libdir_flag_spec='-L$libdir'
+      hardcode_minus_L=yes
+      # see comment about different semantics on the GNU ld section
+      ld_shlibs=no
+      ;;
+    bsdi[45]*)
+      ;;
+    cygwin* | mingw* | pw32* | cegcc*)
+      # When not using gcc, we currently assume that we are using
+      # Microsoft Visual C++.
+      # hardcode_libdir_flag_spec is actually meaningless, as there is
+      # no search path for DLLs.
+      hardcode_libdir_flag_spec=' '
+      libext=lib
+      ;;
+    darwin* | rhapsody*)
+      hardcode_direct=no
+      if test "$GCC" = yes ; then
+        :
+      else
+        case $cc_basename in
+          xlc*)
+            ;;
+          *)
+            ld_shlibs=no
+            ;;
+        esac
+      fi
+      ;;
+    dgux*)
+      hardcode_libdir_flag_spec='-L$libdir'
+      ;;
+    freebsd1*)
+      ld_shlibs=no
+      ;;
+    freebsd2.2*)
+      hardcode_libdir_flag_spec='-R$libdir'
+      hardcode_direct=yes
+      ;;
+    freebsd2*)
+      hardcode_direct=yes
+      hardcode_minus_L=yes
+      ;;
+    freebsd* | dragonfly*)
+      hardcode_libdir_flag_spec='-R$libdir'
+      hardcode_direct=yes
+      ;;
+    hpux9*)
+      hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
+      hardcode_libdir_separator=:
+      hardcode_direct=yes
+      # hardcode_minus_L: Not really in the search PATH,
+      # but as the default location of the library.
+      hardcode_minus_L=yes
+      ;;
+    hpux10*)
+      if test "$with_gnu_ld" = no; then
+        hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
+        hardcode_libdir_separator=:
+        hardcode_direct=yes
+        # hardcode_minus_L: Not really in the search PATH,
+        # but as the default location of the library.
+        hardcode_minus_L=yes
+      fi
+      ;;
+    hpux11*)
+      if test "$with_gnu_ld" = no; then
+        hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
+        hardcode_libdir_separator=:
+        case $host_cpu in
+          hppa*64*|ia64*)
+            hardcode_direct=no
+            ;;
+          *)
+            hardcode_direct=yes
+            # hardcode_minus_L: Not really in the search PATH,
+            # but as the default location of the library.
+            hardcode_minus_L=yes
+            ;;
+        esac
+      fi
+      ;;
+    irix5* | irix6* | nonstopux*)
+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+      hardcode_libdir_separator=:
+      ;;
+    netbsd*)
+      hardcode_libdir_flag_spec='-R$libdir'
+      hardcode_direct=yes
+      ;;
+    newsos6)
+      hardcode_direct=yes
+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+      hardcode_libdir_separator=:
+      ;;
+    openbsd*)
+      if test -f /usr/libexec/ld.so; then
+        hardcode_direct=yes
+        if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
+          hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
+        else
+          case "$host_os" in
+            openbsd[01].* | openbsd2.[0-7] | openbsd2.[0-7].*)
+              hardcode_libdir_flag_spec='-R$libdir'
+              ;;
+            *)
+              hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
+              ;;
+          esac
+        fi
+      else
+        ld_shlibs=no
+      fi
+      ;;
+    os2*)
+      hardcode_libdir_flag_spec='-L$libdir'
+      hardcode_minus_L=yes
+      ;;
+    osf3*)
+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+      hardcode_libdir_separator=:
+      ;;
+    osf4* | osf5*)
+      if test "$GCC" = yes; then
+        hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+      else
+        # Both cc and cxx compiler support -rpath directly
+        hardcode_libdir_flag_spec='-rpath $libdir'
+      fi
+      hardcode_libdir_separator=:
+      ;;
+    solaris*)
+      hardcode_libdir_flag_spec='-R$libdir'
+      ;;
+    sunos4*)
+      hardcode_libdir_flag_spec='-L$libdir'
+      hardcode_direct=yes
+      hardcode_minus_L=yes
+      ;;
+    sysv4)
+      case $host_vendor in
+        sni)
+          hardcode_direct=yes # is this really true???
+          ;;
+        siemens)
+          hardcode_direct=no
+          ;;
+        motorola)
+          hardcode_direct=no #Motorola manual says yes, but my tests say they lie
+          ;;
+      esac
+      ;;
+    sysv4.3*)
+      ;;
+    sysv4*MP*)
+      if test -d /usr/nec; then
+        ld_shlibs=yes
+      fi
+      ;;
+    sysv4*uw2* | sysv5OpenUNIX* | sysv5UnixWare7.[01].[10]* | unixware7* | sco3.2v5.0.[024]*)
+      ;;
+    sysv5* | sco3.2v5* | sco5v6*)
+      hardcode_libdir_flag_spec='`test -z "$SCOABSPATH" && echo ${wl}-R,$libdir`'
+      hardcode_libdir_separator=':'
+      ;;
+    uts4*)
+      hardcode_libdir_flag_spec='-L$libdir'
+      ;;
+    *)
+      ld_shlibs=no
+      ;;
+  esac
+fi
+
+# Check dynamic linker characteristics
+# Code taken from libtool.m4's _LT_SYS_DYNAMIC_LINKER.
+# Unlike libtool.m4, here we don't care about _all_ names of the library, but
+# only about the one the linker finds when passed -lNAME. This is the last
+# element of library_names_spec in libtool.m4, or possibly two of them if the
+# linker has special search rules.
+library_names_spec=      # the last element of library_names_spec in libtool.m4
+libname_spec='lib$name'
+case "$host_os" in
+  aix3*)
+    library_names_spec='$libname.a'
+    ;;
+  aix[4-9]*)
+    library_names_spec='$libname$shrext'
+    ;;
+  amigaos*)
+    library_names_spec='$libname.a'
+    ;;
+  beos*)
+    library_names_spec='$libname$shrext'
+    ;;
+  bsdi[45]*)
+    library_names_spec='$libname$shrext'
+    ;;
+  cygwin* | mingw* | pw32* | cegcc*)
+    shrext=.dll
+    library_names_spec='$libname.dll.a $libname.lib'
+    ;;
+  darwin* | rhapsody*)
+    shrext=.dylib
+    library_names_spec='$libname$shrext'
+    ;;
+  dgux*)
+    library_names_spec='$libname$shrext'
+    ;;
+  freebsd1*)
+    ;;
+  freebsd* | dragonfly*)
+    case "$host_os" in
+      freebsd[123]*)
+        library_names_spec='$libname$shrext$versuffix' ;;
+      *)
+        library_names_spec='$libname$shrext' ;;
+    esac
+    ;;
+  gnu*)
+    library_names_spec='$libname$shrext'
+    ;;
+  hpux9* | hpux10* | hpux11*)
+    case $host_cpu in
+      ia64*)
+        shrext=.so
+        ;;
+      hppa*64*)
+        shrext=.sl
+        ;;
+      *)
+        shrext=.sl
+        ;;
+    esac
+    library_names_spec='$libname$shrext'
+    ;;
+  interix[3-9]*)
+    library_names_spec='$libname$shrext'
+    ;;
+  irix5* | irix6* | nonstopux*)
+    library_names_spec='$libname$shrext'
+    case "$host_os" in
+      irix5* | nonstopux*)
+        libsuff= shlibsuff=
+        ;;
+      *)
+        case $LD in
+          *-32|*"-32 "|*-melf32bsmip|*"-melf32bsmip ") libsuff= shlibsuff= ;;
+          *-n32|*"-n32 "|*-melf32bmipn32|*"-melf32bmipn32 ") libsuff=32 shlibsuff=N32 ;;
+          *-64|*"-64 "|*-melf64bmip|*"-melf64bmip ") libsuff=64 shlibsuff=64 ;;
+          *) libsuff= shlibsuff= ;;
+        esac
+        ;;
+    esac
+    ;;
+  linux*oldld* | linux*aout* | linux*coff*)
+    ;;
+  linux* | k*bsd*-gnu)
+    library_names_spec='$libname$shrext'
+    ;;
+  knetbsd*-gnu)
+    library_names_spec='$libname$shrext'
+    ;;
+  netbsd*)
+    library_names_spec='$libname$shrext'
+    ;;
+  newsos6)
+    library_names_spec='$libname$shrext'
+    ;;
+  nto-qnx*)
+    library_names_spec='$libname$shrext'
+    ;;
+  openbsd*)
+    library_names_spec='$libname$shrext$versuffix'
+    ;;
+  os2*)
+    libname_spec='$name'
+    shrext=.dll
+    library_names_spec='$libname.a'
+    ;;
+  osf3* | osf4* | osf5*)
+    library_names_spec='$libname$shrext'
+    ;;
+  rdos*)
+    ;;
+  solaris*)
+    library_names_spec='$libname$shrext'
+    ;;
+  sunos4*)
+    library_names_spec='$libname$shrext$versuffix'
+    ;;
+  sysv4 | sysv4.3*)
+    library_names_spec='$libname$shrext'
+    ;;
+  sysv4*MP*)
+    library_names_spec='$libname$shrext'
+    ;;
+  sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX* | sysv4*uw2*)
+    library_names_spec='$libname$shrext'
+    ;;
+  uts4*)
+    library_names_spec='$libname$shrext'
+    ;;
+esac
+
+sed_quote_subst='s/\(["`$\\]\)/\\\1/g'
+escaped_wl=`echo "X$wl" | sed -e 's/^X//' -e "$sed_quote_subst"`
+shlibext=`echo "$shrext" | sed -e 's,^\.,,'`
+escaped_libname_spec=`echo "X$libname_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
+escaped_library_names_spec=`echo "X$library_names_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
+escaped_hardcode_libdir_flag_spec=`echo "X$hardcode_libdir_flag_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
+
+LC_ALL=C sed -e 's/^\([a-zA-Z0-9_]*\)=/acl_cv_\1=/' <<EOF
+
+# How to pass a linker flag through the compiler.
+wl="$escaped_wl"
+
+# Static library suffix (normally "a").
+libext="$libext"
+
+# Shared library suffix (normally "so").
+shlibext="$shlibext"
+
+# Format of library name prefix.
+libname_spec="$escaped_libname_spec"
+
+# Library names that the linker finds when passed -lNAME.
+library_names_spec="$escaped_library_names_spec"
+
+# Flag to hardcode \$libdir into a binary during linking.
+# This must work even if \$libdir does not exist.
+hardcode_libdir_flag_spec="$escaped_hardcode_libdir_flag_spec"
+
+# Whether we need a single -rpath flag with a separated argument.
+hardcode_libdir_separator="$hardcode_libdir_separator"
+
+# Set to yes if using DIR/libNAME.so during linking hardcodes DIR into the
+# resulting binary.
+hardcode_direct="$hardcode_direct"
+
+# Set to yes if using the -LDIR flag during linking hardcodes DIR into the
+# resulting binary.
+hardcode_minus_L="$hardcode_minus_L"
+
+EOF
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
index d10e3f9..a46a40d 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
@@ -1,4 +1,6 @@
 SRC_URI = "file://aclocal.tgz \
+           file://config.rpath \
+           file://Makefile.in.in \
            file://COPYING"
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -9,11 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0854da868a929923087141d9d7aba7d5"
 
 inherit native
 
-PR = "r3"
+PR = "r4"
 
 S = "${WORKDIR}"
 
 do_install () {
 	install -d ${D}${datadir}/aclocal/
 	cp ${WORKDIR}/*.m4 ${D}${datadir}/aclocal/
+	install -d ${D}${datadir}/gettext/po/
+	cp ${WORKDIR}/config.rpath ${D}${datadir}/gettext/
+	cp ${WORKDIR}/Makefile.in.in ${D}${datadir}/gettext/po/
 }
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 96859aa..0f6f068 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -102,6 +102,8 @@ do_install_append() {
 
 do_install_append_virtclass-native () {
 	rm ${D}${datadir}/aclocal/*
+	rm ${D}${datadir}/gettext/config.rpath
+	rm ${D}${datadir}/gettext/po/Makefile.in.in
 }
 
 BBCLASSEXTEND = "native nativesdk"




