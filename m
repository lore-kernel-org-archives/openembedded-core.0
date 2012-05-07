Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRULy-0004jL-Dw
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 22:16:18 +0200
Received: by wibhj13 with SMTP id hj13so3389853wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mHoO7NW6sw5spxl/84YFx8qcVHEbpzCiZr3hyLV/ov4=;
	b=ooL8xXAO4BXNGDOVFp4zogZrp+PryxYeziwhmVFrTdDk+7IyCnQrKWPML/Q78IFUhu
	RROWzo9U46HzTGwGEpk9npjfutOtuRPf5TJ/ZKYNMwQ2+rwjr6BeB/guImlN2/mMYs9L
	2/rY7MKXjrXTQooY7xdfgeKBEc7J8QqGAmk0+oSJpfYc8HZn5NgMMFfFzp6v6IA18PlZ
	GS3TKTT2F4v4mQgCZGZv930HFSJc43G5AuuCjPZX+uOcCPrfAJnJ9bYtwMhMVOOUDCsW
	9bRguMIkvjYSMeNyEm1GiIrAYSMoNUZS8ibvP6G37eHi/hr83HaaoOt6hCAGlA5D3LkO
	CYxQ==
Received: by 10.216.200.22 with SMTP id y22mr1546147wen.118.1336421187814;
	Mon, 07 May 2012 13:06:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e8sm23960539wiy.3.2012.05.07.13.06.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:06:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 22:06:01 +0200
Message-Id: <1afaf2360597100bb0ddd72016d1b139596fb8e8.1336417061.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] evolution-data-server: delete unused patch parallelmake.patch
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
X-List-Received-Date: Mon, 07 May 2012 20:16:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../eds/evolution-data-server/parallelmake.patch   |  203 --------------------
 1 files changed, 0 insertions(+), 203 deletions(-)
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/parallelmake.patch

diff --git a/meta/recipes-sato/eds/evolution-data-server/parallelmake.patch b/meta/recipes-sato/eds/evolution-data-server/parallelmake.patch
deleted file mode 100644
index ee004a9..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/parallelmake.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-Update git.mk to the version from Pango which has parallel make fixes.
-http://git.gnome.org/browse/pango/log/git.mk
-commit 6118d5891fee776a087855c335a73c79fdaf036c
-
-RP 16/3/10
-
-Upstream-Status: Pending
-
-Index: git/git.mk
-===================================================================
---- git.orig/git.mk	2010-02-05 14:57:15.000000000 +0000
-+++ git/git.mk	2010-03-16 11:30:23.000000000 +0000
-@@ -82,97 +82,106 @@
- ### .gitignore generation
- 
- $(srcdir)/.gitignore: Makefile.am $(top_srcdir)/git.mk
--	@echo Generating $@; \
--	GTKDOCGITIGNOREFILES=; \
--	test "x$(DOC_MODULE)" = x -o "x$(DOC_MAIN_SGML_FILE)" = x || \
--	GTKDOCGITIGNOREFILES=" \
--		$(DOC_MODULE)-decl-list.txt \
--		$(DOC_MODULE)-decl.txt \
--		tmpl/$(DOC_MODULE)-unused.sgml \
--		tmpl/*.bak \
--		xml html \
--		"; \
--	GNOMEDOCUTILSGITIGNOREFILES=; \
--	test "x$(DOC_MODULE)" = x -o "x$(DOC_LINGUAS)" = x || \
--	GNOMEDOCUTILSGITIGNOREFILES=" \
--		$(_DOC_C_DOCS) \
--		$(_DOC_LC_DOCS) \
--		$(_DOC_OMF_ALL) \
--		$(_DOC_DSK_ALL) \
--		$(_DOC_HTML_ALL) \
--		$(_DOC_POFILES) \
--		*/.xml2po.mo \
--		*/*.omf.out \
--		"; \
--	INTLTOOLGITIGNOREFILES=; test -f $(srcdir)/po/Makefile.in.in && \
--	INTLTOOLGITIGNOREFILES=" \
--		po/Makefile.in.in \
--		po/Makefile.in \
--		po/Makefile \
--		po/*.gmo \
--		po/*.mo \
--		po/POTFILES \
--		po/stamp-it \
--		po/.intltool-merge-cache \
--		intltool-extract.in \
--		intltool-merge.in \
--		intltool-update.in \
--		"; \
--	AUTOCONFGITIGNOREFILES=; test -f $(srcdir)/configure && \
--	AUTOCONFGITIGNOREFILES=" \
--		autom4te.cache \
--		configure \
--		config.h \
--		stamp-h1 \
--		libtool \
--		config.lt \
--		"; \
--	for x in \
--		.gitignore \
--		$$GTKDOCGITIGNOREFILES \
--		$$GNOMEDOCUTILSGITIGNOREFILES \
--		$$INTLTOOLGITIGNOREFILES \
--		$$AUTOCONFGITIGNOREFILES \
--		$(GITIGNOREFILES) \
--		$(CLEANFILES) \
--		$(PROGRAMS) \
--		$(EXTRA_PROGRAMS) \
--		$(LTLIBRARIES) \
--		so_locations \
--		.libs _libs \
--		$(MOSTLYCLEANFILES) \
--		"*.$(OBJEXT)" \
--		"*.lo" \
--		$(DISTCLEANFILES) \
--		$(am__CONFIG_DISTCLEAN_FILES) \
--		$(CONFIG_CLEAN_FILES) \
--		TAGS ID GTAGS GRTAGS GSYMS GPATH tags \
--		"*.tab.c" \
--		$(MAINTAINERCLEANFILES) \
--		$(BUILT_SOURCES) \
--		$(DEPDIR) \
--		Makefile \
--		Makefile.in \
--		"*.orig" \
--		"*.rej" \
--		"*.bak" \
--		"*~" \
--		".*.sw[nop]" \
--	; do echo /$$x; done | \
-+	$(AM_V_GEN) \
-+	{ \
-+		if test "x$(DOC_MODULE)" = x -o "x$(DOC_MAIN_SGML_FILE)" = x; then :; else \
-+			for x in \
-+				$(DOC_MODULE)-decl-list.txt \
-+				$(DOC_MODULE)-decl.txt \
-+				tmpl/$(DOC_MODULE)-unused.sgml \
-+				"tmpl/*.bak" \
-+				xml html \
-+			; do echo /$$x; done; \
-+		fi; \
-+		if test "x$(DOC_MODULE)" = x -o "x$(DOC_LINGUAS)" = x; then :; else \
-+			for x in \
-+				$(_DOC_C_DOCS) \
-+				$(_DOC_LC_DOCS) \
-+				$(_DOC_OMF_ALL) \
-+				$(_DOC_DSK_ALL) \
-+				$(_DOC_HTML_ALL) \
-+				$(_DOC_POFILES) \
-+				"*/.xml2po.mo" \
-+				"*/*.omf.out" \
-+			; do echo /$$x; done; \
-+		fi; \
-+		if test -f $(srcdir)/po/Makefile.in.in; then \
-+			for x in \
-+				po/Makefile.in.in \
-+				po/Makefile.in \
-+				po/Makefile \
-+				po/POTFILES \
-+				po/stamp-it \
-+				po/.intltool-merge-cache \
-+				"po/*.gmo" \
-+				"po/*.mo" \
-+				po/$(GETTEXT_PACKAGE).pot \
-+				intltool-extract.in \
-+				intltool-merge.in \
-+				intltool-update.in \
-+			; do echo /$$x; done; \
-+		fi; \
-+		if test -f $(srcdir)/configure; then \
-+			for x in \
-+				autom4te.cache \
-+				configure \
-+				config.h \
-+				stamp-h1 \
-+				libtool \
-+				config.lt \
-+			; do echo /$$x; done; \
-+		fi; \
-+		for x in \
-+			.gitignore \
-+			$(GITIGNOREFILES) \
-+			$(CLEANFILES) \
-+			$(PROGRAMS) \
-+			$(check_PROGRAMS) \
-+			$(EXTRA_PROGRAMS) \
-+			$(LTLIBRARIES) \
-+			so_locations \
-+			.libs _libs \
-+			$(MOSTLYCLEANFILES) \
-+			"*.$(OBJEXT)" \
-+			"*.lo" \
-+			$(DISTCLEANFILES) \
-+			$(am__CONFIG_DISTCLEAN_FILES) \
-+			$(CONFIG_CLEAN_FILES) \
-+			TAGS ID GTAGS GRTAGS GSYMS GPATH tags \
-+			"*.tab.c" \
-+			$(MAINTAINERCLEANFILES) \
-+			$(BUILT_SOURCES) \
-+			$(DEPDIR) \
-+			Makefile \
-+			Makefile.in \
-+			"*.orig" \
-+			"*.rej" \
-+			"*.bak" \
-+			"*~" \
-+			".*.sw[nop]" \
-+		; do echo /$$x; done; \
-+	} | \
- 	sed "s@^/`echo "$(srcdir)" | sed 's/\(.\)/[\1]/g'`/@/@" | \
- 	sed 's@/[.]/@/@g' | \
--	LANG=C sort | uniq > $@.tmp && \
-+	LC_ALL=C sort | uniq > $@.tmp && \
- 	mv $@.tmp $@;
- 
--all: $(srcdir)/.gitignore gitignore-recurse
--gitignore-recurse:
-+all: $(srcdir)/.gitignore gitignore-recurse-maybe
-+gitignore-recurse-maybe:
- 	@if test "x$(SUBDIRS)" = "x$(DIST_SUBDIRS)"; then :; else \
--		list='$(DIST_SUBDIRS)'; for subdir in $$list; do \
--		  test "$$subdir" = . || (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) .gitignore); \
--		done; \
-+		$(MAKE) $(AM_MAKEFLAGS) gitignore-recurse; \
- 	fi;
-+gitignore-recurse:
-+	@for subdir in $(DIST_SUBDIRS); do \
-+	  case " $(SUBDIRS) " in \
-+	    *" $$subdir "*) :;; \
-+	    *) test "$$subdir" = . || (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) .gitignore gitignore-recurse || echo "Skipping $$subdir");; \
-+	  esac; \
-+	done
-+gitignore: $(srcdir)/.gitignore gitignore-recurse
-+
- maintainer-clean: gitignore-clean
- gitignore-clean:
- 	-rm -f $(srcdir)/.gitignore
--.PHONY: gitignore-clean gitignore-recurse
- 
-+.PHONY: gitignore-clean gitignore gitignore-recurse gitignore-recurse-maybe
-- 
1.7.8.6



