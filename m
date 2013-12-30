Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F37A3617AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:00:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU20N8G017606
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 18:00:23 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 29 Dec 2013 18:00:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 18:02:26 +0800
Message-ID: <94ecd4d774ae289a3d3f38fb517553acf485e8a9.1388397582.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388397582.git.liezhi.yang@windriver.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] autoconf: remove path_prog_fixes.patch
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
X-List-Received-Date: Mon, 30 Dec 2013 02:00:23 -0000
Content-Type: text/plain

The path_prog_fixes.patch was used for fixing the perl path, but the
do_install_append() can do it, so remove this patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../autoconf/autoconf/path_prog_fixes.patch        | 128 ---------------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 -
 2 files changed, 129 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch b/meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch
deleted file mode 100644
index cb57dfd..0000000
--- a/meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: autoconf-2.59/bin/autoheader.in
-===================================================================
---- autoconf-2.59.orig/bin/autoheader.in	2005-03-09 16:27:17.933878952 -0500
-+++ autoconf-2.59/bin/autoheader.in	2005-03-09 16:29:57.360642400 -0500
-@@ -1,8 +1,8 @@
--#! @PERL@
-+#! @bindir@/env perl
- # -*- Perl -*-
- # @configure_input@
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @bindir@/env perl -S "$0" "$@";; esac'
-     if 0;
- 
- # autoheader -- create `config.h.in' from `configure.ac'
-Index: autoconf-2.59/bin/autom4te.in
-===================================================================
---- autoconf-2.59.orig/bin/autom4te.in	2003-10-28 03:48:36.000000000 -0500
-+++ autoconf-2.59/bin/autom4te.in	2005-03-09 16:30:14.957967200 -0500
-@@ -1,8 +1,10 @@
--#! @PERL@ -w
-+#! @bindir@/env perl
- # -*- perl -*-
- # @configure_input@
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+use warnings;
-+
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-     if 0;
- 
- # autom4te - Wrapper around M4 libraries.
-@@ -87,7 +89,7 @@
- my $freeze = 0;
- 
- # $M4.
--my $m4 = $ENV{"M4"} || '@M4@';
-+my $m4 = $ENV{"M4"} || '@bindir@/env m4';
- # Some non-GNU m4's don't reject the --help option, so give them /dev/null.
- fatal "need GNU m4 1.4 or later: $m4"
-   if system "$m4 --help </dev/null 2>&1 | grep reload-state >/dev/null";
-Index: autoconf-2.59/bin/autoreconf.in
-===================================================================
---- autoconf-2.59.orig/bin/autoreconf.in	2005-03-09 16:27:17.354966960 -0500
-+++ autoconf-2.59/bin/autoreconf.in	2005-03-09 16:31:19.572144352 -0500
-@@ -1,8 +1,10 @@
--#! @PERL@ -w
-+#! @bindir@/env perl
- # -*- perl -*-
- # @configure_input@
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+use warnings;
-+
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-     if 0;
- 
- # autoreconf - install the GNU Build System in a directory tree
-Index: autoconf-2.59/bin/autoscan.in
-===================================================================
---- autoconf-2.59.orig/bin/autoscan.in	2003-09-26 08:57:49.000000000 -0400
-+++ autoconf-2.59/bin/autoscan.in	2005-03-09 16:30:18.136483992 -0500
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @bindir@/env perl
- # -*- perl -*-
- # autoscan - Create configure.scan (a preliminary configure.ac) for a package.
- # Copyright (C) 1994, 1999, 2000, 2001, 2002, 2003
-@@ -21,7 +21,9 @@
- 
- # Written by David MacKenzie <djm@gnu.ai.mit.edu>.
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+use warnings;
-+
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-     if 0;
- 
- BEGIN
-Index: autoconf-2.59/bin/autoupdate.in
-===================================================================
---- autoconf-2.59.orig/bin/autoupdate.in	2003-08-27 07:26:32.000000000 -0400
-+++ autoconf-2.59/bin/autoupdate.in	2005-03-09 16:30:19.912214040 -0500
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @bindir@/env perl
- # -*- perl -*-
- # autoupdate - modernize an Autoconf file.
- # Copyright (C) 1994, 1999, 2000, 2001, 2002, 2003
-@@ -22,7 +22,9 @@
- # Originally written by David MacKenzie <djm@gnu.ai.mit.edu>.
- # Rewritten by Akim Demaille <akim@freefriends.org>.
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+use warnings;
-+
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-     if 0;
- 
- BEGIN
-@@ -54,7 +56,7 @@
- my @include = ('@datadir@');
- my $force = 0;
- # m4.
--my $m4 = $ENV{"M4"} || '@M4@';
-+my $m4 = $ENV{"M4"} || '@bindir@/env m4';
- 
- 
- # $HELP
-Index: autoconf-2.59/bin/ifnames.in
-===================================================================
---- autoconf-2.59.orig/bin/ifnames.in	2003-10-10 09:52:56.000000000 -0400
-+++ autoconf-2.59/bin/ifnames.in	2005-03-09 16:30:22.656796800 -0500
-@@ -1,8 +1,10 @@
--#! @PERL@ -w
-+#! @bindir@/env perl
- # -*- perl -*-
- # @configure_input@
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+use warnings;
-+
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-     if 0;
- 
- # ifnames - print the identifiers used in C preprocessor conditionals
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 1522729..b67155b 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -13,7 +13,6 @@ SRC_URI += "file://autoreconf-include.patch \
 	    file://autoreconf-foreign.patch \
 	    file://autoreconf-gnuconfigize.patch \
 	    file://autoheader-nonfatal-warnings.patch \
-	    ${@['file://path_prog_fixes.patch', ''][bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d)]} \
             file://config_site.patch \
             file://remove-usr-local-lib-from-m4.patch \
             file://preferbash.patch \
-- 
1.8.3.1


