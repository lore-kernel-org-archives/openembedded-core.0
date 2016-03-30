Return-Path: <william.c.randle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E735F62136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 23:50:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 30 Mar 2016 16:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,419,1455004800"; d="scan'208";a="76220790"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.4.102])
	by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2016 16:50:58 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 16:50:49 -0700
Message-Id: <1459381849-13495-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCHv4] man: fix several annoying compile/build warnings
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
X-List-Received-Date: Wed, 30 Mar 2016 23:50:58 -0000

Fixed the build error when building man.config.5 (a remnant of a long
ago previous patch). Optimized the manpages Makefile for parallel
builds. Drop a FHS patch that is no longer needed, as the standard
Makefile puts the man pages in the proper location. Also, fix compile 
warnings in a couple other files.

[YOCTO #9341]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
[Note: should be applied after previous man patch "fix src/Makefile
to work with parallel make".] 

v4: redo patch to src/gripes.c

 .../man/man/man-1.5m2-tv_fhs.patch                 |  31 ------- 
 .../man/man/man-1.6g-compile-warnings.patch        | 101 +++++++++++++++++++++
 meta/recipes-extended/man/man_1.6g.bb              |   2 +-
 3 files changed, 102 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-tv_fhs.patch
 create mode 100644 meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch

diff --git a/meta/recipes-extended/man/man/man-1.5m2-tv_fhs.patch b/meta/recipes-extended/man/man/man-1.5m2-tv_fhs.patch
deleted file mode 100644
index fe66d75..0000000
--- a/meta/recipes-extended/man/man/man-1.5m2-tv_fhs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man/Makefile.in	2008-12-21 19:19:33.000000000 +0100
-+++ man/Makefile.in.oden	2008-12-21 19:19:39.000000000 +0100
-@@ -34,6 +34,15 @@
- 	for i in $(MAN8); \
- 		do if test -f $$i.8; then $(INSTALL) $$i.8 $(mandir)/man8/$$i.@man8ext@; fi; done
- 
-+install-l10n: $(ALL)
-+	mkdir -p $(mandir)/$(SLANG)/man1 $(mandir)/$(SLANG)/man5 $(mandir)/$(SLANG)/man8
-+	for i in $(MAN1); \
-+		do $(INSTALL) $$i.1 $(mandir)/$(SLANG)/man1/$$i.@man1ext@; done
-+	for i in $(MAN5); \
-+		do $(INSTALL) $$i.5 $(mandir)/$(SLANG)/man5/$$i.@man5ext@; done
-+	for i in $(MAN8); \
-+		do if test -f $$i.8; then $(INSTALL) $$i.8 $(mandir)/$(SLANG)/man8/$$i.@man8ext@; fi; done
-+
- clean:
- 	rm -f core *.in *.@man1ext@ *.@man5ext@ *.@man8ext@ *~
- 
-@@ -49,7 +58,7 @@
- 	@for i in @languages@; do if test -d $$i; then echo; \
- 		echo "==== Installing the `cat $$i.txt` man pages. ===="; \
- 		cd $$i; SLANG=/$$i; if test $$SLANG = /en; then SLANG= ; fi; \
--		export SLANG; make -f ../Makefile install; cd ..; \
-+		export SLANG; make -f ../Makefile install-l10n; cd ..; \
- 		else echo "==== No $$i man pages found. ===="; fi; done
- 
- cleansubdirs:
diff --git a/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch b/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch
new file mode 100644
index 0000000..4631d2d
--- /dev/null
+++ b/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch
@@ -0,0 +1,105 @@
+Fix a build error when building man.config.5 (a remnant of a long
+ago previous patch). Optimized the manpages Makefile for parallel
+builds. Also, fix compile warnings in a couple other files.
+
+Upstream-Status: Pending
+
+Signed-off-by: Bill Randle <william.c.randle@intel.com>
+
+--- man-1.6g/man/Makefile.in.orig	2016-03-28 17:31:08.723949180 -0700
++++ man-1.6g/man/Makefile.in	2016-03-28 17:46:12.866910386 -0700
+@@ -5,6 +5,13 @@
+ ALL = man.1 whatis.1 apropos.1 man.config.5
+ MAYBE8 = makewhatis
+ 
++SUBDIRS := $(shell echo @languages@)
++
++.PHONY: subdirs $(SUBDIRS)
++
++man.config.man: man.conf.man
++	@cp $< $@
++
+ .SUFFIXES: .man .1 .5 .8
+ 
+ .man.1:
+@@ -19,11 +26,11 @@
+ INSTALL = @INSTALL@ -c -m 644
+ 
+ # Where to put the manual pages.
+-mandir = $(DESTDIR)$(PREFIX)@mandir@$(SLANG)
++mandir := $(DESTDIR)$(PREFIX)@mandir@$(SLANG)
+ 
+ all:	$(ALL)
+ 	for i in $(MAYBE8); \
+-		do if test -f $$i.man; then make -f ../Makefile $$i.8; fi; done
++		do if test -f $$i.man; then $(MAKE) -f ../Makefile $$i.8; fi; done
+ 
+ install: $(ALL)
+ 	mkdir -p $(mandir)/man1 $(mandir)/man5 $(mandir)/man8
+@@ -38,24 +45,27 @@
+ 	rm -f core *.in *.@man1ext@ *.@man5ext@ *.@man8ext@ *~
+ 
+ spotless:
++	rm -f man.config.man
+ 
+ subdirs:
+-	@for i in @languages@; do if test -d $$i; then echo; \
+-		echo "==== Making the `cat $$i.txt` man pages. ===="; \
+-		cd $$i; make -f ../Makefile; cd ..; \
+-		else echo "==== No $$i man pages found. ===="; fi; done
++subdirs: $(SUBDIRS)
++$(SUBDIRS):
++	if test -d $@; then echo; \
++		echo "==== Making the `cat $@.txt` man pages. ===="; \
++		$(MAKE) -C $@ -f ../Makefile all; \
++		else echo "==== No $@ man pages found. ===="; fi
+ 
+ installsubdirs:
+ 	@for i in @languages@; do if test -d $$i; then echo; \
+ 		echo "==== Installing the `cat $$i.txt` man pages. ===="; \
+ 		cd $$i; SLANG=/$$i; if test $$SLANG = /en; then SLANG= ; fi; \
+-		export SLANG; make -f ../Makefile install; cd ..; \
++		export SLANG; $(MAKE) -f ../Makefile install; cd ..; \
+ 		else echo "==== No $$i man pages found. ===="; fi; done
+ 
+ cleansubdirs:
+-	@for i in ??; do cd $$i; make -f ../Makefile clean; cd ..; done
++	@for i in ??; do $(MAKE) -C $$i -f ../Makefile clean; done
+ 	rm -f core *~
+ 
+ spotlesssubdirs:
+-	for i in ??; do cd $$i; make -f ../Makefile spotless; cd ..; done
++	for i in ??; do $(MAKE) -C $$i -f ../Makefile spotless; done
+ 	rm -f Makefile
+
+--- man-1.6g/src/gripes.c.orig	2006-11-21 11:53:44.000000000 -0800
++++ man-1.6g/src/gripes.c	2016-03-30 16:32:31.601103487 -0700
+@@ -7,8 +7,6 @@
+ 
+ extern char *msg[];
+ 
+-static char *mantexts = "man";		/* e.g. /usr/lib/locale/%L/man.cat */
+-
+ #ifdef NONLS
+ 
+ static char *
+@@ -30,6 +28,8 @@
+ #include <nl_types.h>
+ #include "../catopen/catopen.c"
+ 
++static char *mantexts = "man";		/* e.g. /usr/lib/locale/%L/man.cat */
++
+ nl_catd catfd = (nl_catd) -1;
+ int cat_is_open = 0;
+ 
+--- man-1.6g/src/manfile.c.orig	2005-08-20 16:26:06.000000000 -0700
++++ man-1.6g/src/manfile.c	2016-03-29 09:10:21.527841285 -0700
+@@ -299,7 +299,7 @@
+ 	const char *((*tocat)(const char *man_filename, const char *ext,
+ 			      int flags))) {
+      char **sl;
+-     struct manpage *res;
++     struct manpage *res = 0;
+ 
+      standards = (flags & (FHS | FSSTND | DO_HP | DO_IRIX));
+      to_cat_filename = tocat;
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index 9b057b6..efdf565 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -39,7 +39,6 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
            file://man-1.5i2-initial.patch \
            file://man-1.5h1-gencat.patch;striplevel=0 \
            file://man-1.5g-nonrootbuild.patch \
-           file://man-1.5m2-tv_fhs.patch;striplevel=0 \
            file://man-1.5j-i18n.patch \
            file://man-1.6e-whatis2.patch \
            file://man-1.6e-use_i18n_vars_in_a_std_way.patch \
@@ -54,6 +53,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
            file://man-1.6g-whatis3.patch \
            file://configure_sed.patch \
            file://man-1.6g-parallel.patch \
+           file://man-1.6g-compile-warnings.patch \
 "
 
 SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
--
2.5.0

