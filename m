Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20B4575CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:13:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t638DtQ1011876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 01:13:55 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 3 Jul 2015 01:13:54 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 16:08:45 +0800
Message-ID: <1435910925-27865-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gettext-minimal-native: use MKIDR_P in Makefile.in.in
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
X-List-Received-Date: Fri, 03 Jul 2015 08:13:58 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The Makefile.in.in provided by gettext-minimal-native will be copied
to many packages that need gettext to produce multi-lingual messages.

Replace mkdir_p with MKDIR_P to fix below errors from those packages'
install logs:

  /bin/sh: 6: @mkdir_p@: not found
  /usr/bin/install: cannot create regular file 'xxx'

As automake manual:

From Automake 1.8 to 1.9.6 AM_PROG_MKDIR_P used to define the output
variable mkdir_p to one of mkdir -p, install-sh -d, or mkinstalldirs.

Nowadays Autoconf provides a similar functionality with AC_PROG_MKDIR_P,
it will set output variable MKDIR_P.

Automake manual advises to switch ASAP to the more modern Autoconf-provided
interface instead; both the macro and the variable have been removed from
Automake 1.12.1 and later releases.

Signe-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../gettext/gettext-minimal-0.19.4/Makefile.in.in      | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
index 65184f6..8906ba0 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
@@ -33,17 +33,7 @@ gettextsrcdir = $(datadir)/gettext/po
 INSTALL = @INSTALL@
 INSTALL_DATA = @INSTALL_DATA@
 
-# We use $(mkdir_p).
-# In automake <= 1.9.x, $(mkdir_p) is defined either as "mkdir -p --" or as
-# "$(mkinstalldirs)" or as "$(install_sh) -d". For these automake versions,
-# @install_sh@ does not start with $(SHELL), so we add it.
-# In automake >= 1.10, @mkdir_p@ is derived from ${MKDIR_P}, which is defined
-# either as "/path/to/mkdir -p" or ".../install-sh -c -d". For these automake
-# versions, $(mkinstalldirs) and $(install_sh) are unused.
-mkinstalldirs = $(SHELL) @install_sh@ -d
-install_sh = $(SHELL) @install_sh@
 MKDIR_P = @MKDIR_P@
-mkdir_p = @mkdir_p@
 
 GMSGFMT_ = @GMSGFMT@
 GMSGFMT_no = @GMSGFMT@
@@ -242,7 +232,7 @@ install: install-exec install-data
 install-exec:
 install-data: install-data-@USE_NLS@
 	if test "$(PACKAGE)" = "gettext-tools"; then \
-	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+	  $(MKDIR_P) $(DESTDIR)$(gettextsrcdir); \
 	  for file in $(DISTFILES.common) Makevars.template; do \
 	    $(INSTALL_DATA) $(srcdir)/$$file \
 			    $(DESTDIR)$(gettextsrcdir)/$$file; \
@@ -260,7 +250,7 @@ install-data-yes: all
 	  cat=`basename $$cat`; \
 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
-	  $(mkdir_p) $(DESTDIR)$$dir; \
+	  $(MKDIR_P) $(DESTDIR)$$dir; \
 	  if test -r $$cat; then realcat=$$cat; else realcat=$(srcdir)/$$cat; fi; \
 	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
 	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
@@ -300,7 +290,7 @@ installdirs: installdirs-exec installdirs-data
 installdirs-exec:
 installdirs-data: installdirs-data-@USE_NLS@
 	if test "$(PACKAGE)" = "gettext-tools"; then \
-	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+	  $(MKDIR_P) $(DESTDIR)$(gettextsrcdir); \
 	else \
 	  : ; \
 	fi
@@ -311,7 +301,7 @@ installdirs-data-yes:
 	  cat=`basename $$cat`; \
 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
-	  $(mkdir_p) $(DESTDIR)$$dir; \
+	  $(MKDIR_P) $(DESTDIR)$$dir; \
 	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
 	    if test -n "$$lc"; then \
 	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
-- 
1.9.1


