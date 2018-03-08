Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 43C8578A01
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054019"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:53 +0200
Message-Id: <20180308181804.31261-31-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 31/42] automake: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...tion-in-shebangs-with-modern-use-warnings.patch | 41 ++++++++++------------
 .../automake/automake/buildtest.patch              | 32 +++++++++--------
 2 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
index 64eb253a6ea..96b5a3d6b2a 100644
--- a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
+++ b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
@@ -22,10 +22,10 @@ Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
  t/wrap/automake.in | 3 ++-
  4 files changed, 8 insertions(+), 4 deletions(-)
 
-diff --git a/bin/aclocal.in b/bin/aclocal.in
-index 349f24a..50cb8d3 100644
---- a/bin/aclocal.in
-+++ b/bin/aclocal.in
+Index: automake-1.15.1/bin/aclocal.in
+===================================================================
+--- automake-1.15.1.orig/bin/aclocal.in
++++ automake-1.15.1/bin/aclocal.in
 @@ -1,4 +1,4 @@
 -#!@PERL@ -w
 +#!@PERL@
@@ -40,17 +40,17 @@ index 349f24a..50cb8d3 100644
  
  use Automake::Config;
  use Automake::General;
-diff --git a/bin/automake.in b/bin/automake.in
-index eedc8bc..e0a01cf 100644
---- a/bin/automake.in
-+++ b/bin/automake.in
+Index: automake-1.15.1/bin/automake.in
+===================================================================
+--- automake-1.15.1.orig/bin/automake.in
++++ automake-1.15.1/bin/automake.in
 @@ -1,4 +1,4 @@
 -#!@PERL@ -w
 +#!@PERL@
  # -*- perl -*-
  # @configure_input@
  
-@@ -28,6 +28,7 @@ eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
+@@ -28,6 +28,7 @@ eval 'case $# in 0) exec @PERL@ -S "$0";
  package Automake;
  
  use strict;
@@ -58,16 +58,16 @@ index eedc8bc..e0a01cf 100644
  
  BEGIN
  {
-diff --git a/t/wrap/aclocal.in b/t/wrap/aclocal.in
-index e64b546..9996899 100644
---- a/t/wrap/aclocal.in
-+++ b/t/wrap/aclocal.in
+Index: automake-1.15.1/t/wrap/aclocal.in
+===================================================================
+--- automake-1.15.1.orig/t/wrap/aclocal.in
++++ automake-1.15.1/t/wrap/aclocal.in
 @@ -1,4 +1,4 @@
 -#!@PERL@ -w
 +#!@PERL@
  # @configure_input@
  
- # Copyright (C) 2012-2014 Free Software Foundation, Inc.
+ # Copyright (C) 2012-2017 Free Software Foundation, Inc.
 @@ -19,6 +19,7 @@
  BEGIN
  {
@@ -76,16 +76,16 @@ index e64b546..9996899 100644
    @Aclocal::perl_libdirs = ('@abs_top_srcdir@/lib');
    unshift @Aclocal::perl_libdirs, '@abs_top_builddir@/lib'
      if '@srcdir@' ne '.';
-diff --git a/t/wrap/automake.in b/t/wrap/automake.in
-index 8b943b1..be61226 100644
---- a/t/wrap/automake.in
-+++ b/t/wrap/automake.in
+Index: automake-1.15.1/t/wrap/automake.in
+===================================================================
+--- automake-1.15.1.orig/t/wrap/automake.in
++++ automake-1.15.1/t/wrap/automake.in
 @@ -1,4 +1,4 @@
 -#!@PERL@ -w
 +#!@PERL@
  # @configure_input@
  
- # Copyright (C) 2012-2014 Free Software Foundation, Inc.
+ # Copyright (C) 2012-2017 Free Software Foundation, Inc.
 @@ -19,6 +19,7 @@
  BEGIN
  {
@@ -94,6 +94,3 @@ index 8b943b1..be61226 100644
    @Automake::perl_libdirs = ('@abs_top_srcdir@/lib');
    unshift @Automake::perl_libdirs, '@abs_top_builddir@/lib'
      if '@srcdir@' ne '.';
--- 
-2.3.0
-
diff --git a/meta/recipes-devtools/automake/automake/buildtest.patch b/meta/recipes-devtools/automake/automake/buildtest.patch
index 1dd5337849f..c32cd1fb11e 100644
--- a/meta/recipes-devtools/automake/automake/buildtest.patch
+++ b/meta/recipes-devtools/automake/automake/buildtest.patch
@@ -4,21 +4,23 @@ be run separately.
 Signed-off-by: Björn Stenberg <bjst@enea.com>
 Upstream-Status: Pending
 
---- a/lib/am/check.am	2012-11-14 13:46:16.335475995 +0100
-+++ b/lib/am/check.am	2012-08-13 18:40:12.000000000 +0200
-@@ -44,7 +44,7 @@
- am__tty_colors = $(am__tty_colors_dummy)
- endif !%?COLOR%
-
+Index: automake-1.15.1/lib/am/check.am
+===================================================================
+--- automake-1.15.1.orig/lib/am/check.am
++++ automake-1.15.1/lib/am/check.am
+@@ -41,7 +41,7 @@ am__tty_colors = { \
+   fi; \
+ }
+ 
 -.PHONY: check-TESTS
 +.PHONY: check-TESTS buildtest-TESTS runtest-TESTS
-
- if %?PARALLEL_TESTS%
-
-@@ -465,7 +465,14 @@
-
- else !%?PARALLEL_TESTS%
-
+ 
+ if !%?SERIAL_TESTS%
+ 
+@@ -466,7 +466,14 @@ else %?SERIAL_TESTS%
+ 
+ ## Obsolescent serial testsuite driver.
+ 
 -check-TESTS: $(TESTS)
 +AM_RECURSIVE_TARGETS += buildtest runtest
 +
@@ -28,6 +30,6 @@ Upstream-Status: Pending
 +	$(MAKE) $(AM_MAKEFLAGS) runtest-TESTS
 +
 +runtest-TESTS:
-	@failed=0; all=0; xfail=0; xpass=0; skip=0; \
-	srcdir=$(srcdir); export srcdir; \
+ 	@failed=0; all=0; xfail=0; xpass=0; skip=0; \
+ 	srcdir=$(srcdir); export srcdir; \
  ## Make sure Solaris VPATH-expands all members of this list, even
-- 
2.16.1


