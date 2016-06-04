Return-Path: <william.c.randle@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6646477206
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 22:45:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Jun 2016 15:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,419,1459839600"; d="scan'208";a="116139566"
Received: from wcrandle-mobl.amr.corp.intel.com ([10.254.180.184])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2016 15:45:37 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jun 2016 15:45:03 -0700
Message-Id: <1465080303-5506-4-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1465080303-5506-1-git-send-email-william.c.randle@intel.com>
References: <1465080303-5506-1-git-send-email-william.c.randle@intel.com>
Subject: [PATCH 3/3] perl: fix several perl test failures
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
X-List-Received-Date: Sat, 04 Jun 2016 22:45:37 -0000

Several ExtUtils-MakeMaker tests fail when cross-compiled and run on
the target machine. Backport an upstream patch to fix the issues. Also
update the customized.dat hash file for the files modified by this patch
and other existing patches so the porting/customized.t test passes.

[YOCTO #8656]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 ...erl-fix-conflict-between-skip_all-and-END.patch | 181 +++++++++++++++++++++
 .../perl/perl/perl-test-customized.patch           |  61 +++++++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   2 +
 3 files changed, 244 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-test-customized.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch b/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
new file mode 100644
index 0000000..de946db
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
@@ -0,0 +1,181 @@
+Some Perl tests fail when run on a cross-compiled target machine. Apply
+a slightly tweaked upstream patch to fix the problems. Notes:
+    1. as of 2 Jun 2016, the original patch has been applied to the current
+       EUMM releases, but has not made it into perl core yet.
+    2. when the base perl package is upgraded in Yocto, this patch may need
+       to be replaced by the original upstream version to correctly apply
+       to the current version of ExtUtils-MakeMaker at that time.
+
+[YOCTO #8656]
+
+Upstream-Status: Backport
+
+Signed-off-by: Bill Randle <william.c.randle@intel.com>
+
+From 4a07a3bd18363986112cf2b39dec3c2985353ffb Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Mon, 22 Dec 2014 19:04:34 +0100
+Subject: [PATCH] fix conflict between skip_all and END section
+
+since the commit 430de781809a6be3bcd25a349dc40ce54405ab53
+the test suite fails in cross-compil environment (perl-5.21.6 & perl-5.21.7)
+like this :
+
+    $ ./perl harness -v ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
+    ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t ..
+    1..0 # SKIP cross-compiling and make not available
+    ok 1 - chdir updir
+    ok 2 - teardown
+    # Looks like you planned 0 tests but ran 2.
+    skipped: cross-compiling and make not available
+
+this commit restores the implicit call of plan() at import time of Test::More
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t     | 7 ++++---
+ cpan/ExtUtils-MakeMaker/t/PL_FILES.t         | 4 ++--
+ cpan/ExtUtils-MakeMaker/t/basic.t            | 4 ++--
+ cpan/ExtUtils-MakeMaker/t/echo.t             | 6 +++---
+ cpan/ExtUtils-MakeMaker/t/min_perl_version.t | 4 ++--
+ cpan/ExtUtils-MakeMaker/t/pm_to_blib.t       | 4 ++--
+ cpan/ExtUtils-MakeMaker/t/recurs.t           | 4 ++--
+ cpan/ExtUtils-MakeMaker/t/several_authors.t  | 4 ++--
+ 8 files changed, 19 insertions(+), 18 deletions(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t b/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
+index f27b62c..3bbb3a6 100644
+--- a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
++++ b/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
+@@ -15,12 +15,13 @@ $CLEANUP &&= 1; # so always 1 or numerically 0
+ 
+ use MakeMaker::Test::Utils;
+ use MakeMaker::Test::Setup::BFD;
+-use Test::More;
+ use Config;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+-    : (tests => 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP));
++    : ();
++plan tests => 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP);
+ 
+ my $Is_VMS = $^O eq 'VMS';
+ 
+diff --git a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t b/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
+index 0779dbb..85d53a5 100644
+--- a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
++++ b/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
+@@ -11,9 +11,9 @@ use File::Temp qw[tempdir];
+ use MakeMaker::Test::Setup::PL_FILES;
+ use MakeMaker::Test::Utils;
+ use Config;
+-use Test::More;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+     : (tests => 9);
+ 
+diff --git a/cpan/ExtUtils-MakeMaker/t/basic.t b/cpan/ExtUtils-MakeMaker/t/basic.t
+index 3dd66ad..eddf2e9 100644
+--- a/cpan/ExtUtils-MakeMaker/t/basic.t
++++ b/cpan/ExtUtils-MakeMaker/t/basic.t
+@@ -20,9 +20,9 @@ use utf8;
+ use MakeMaker::Test::Utils;
+ use MakeMaker::Test::Setup::BFD;
+ use Config;
+-use Test::More;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+     : (tests => 171);
+ use File::Find;
+diff --git a/cpan/ExtUtils-MakeMaker/t/echo.t b/cpan/ExtUtils-MakeMaker/t/echo.t
+index 789b85f..c43bc47 100644
+--- a/cpan/ExtUtils-MakeMaker/t/echo.t
++++ b/cpan/ExtUtils-MakeMaker/t/echo.t
+@@ -14,11 +14,11 @@ use MakeMaker::Test::Utils;
+ use File::Temp;
+ use Cwd 'abs_path';
+ 
+-use Test::More;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+-    : ();
++    : (tests => 18);
+ 
+ #--------------------- Setup
+ 
+diff --git a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t b/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
+index c5d78d6..2ef118d 100644
+--- a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
++++ b/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
+@@ -13,9 +13,9 @@ use TieOut;
+ use MakeMaker::Test::Utils;
+ use MakeMaker::Test::Setup::MPV;
+ use Config;
+-use Test::More;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+     : (tests => 36);
+ use File::Path;
+diff --git a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t b/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
+index f1e348e..ebfa26c 100644
+--- a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
++++ b/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
+@@ -12,9 +12,9 @@ use ExtUtils::MakeMaker;
+ use MakeMaker::Test::Utils;
+ use MakeMaker::Test::Setup::BFD;
+ use Config;
+-use Test::More;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+     : 'no_plan';
+ 
+diff --git a/cpan/ExtUtils-MakeMaker/t/recurs.t b/cpan/ExtUtils-MakeMaker/t/recurs.t
+index 84c09a2..661e0db 100644
+--- a/cpan/ExtUtils-MakeMaker/t/recurs.t
++++ b/cpan/ExtUtils-MakeMaker/t/recurs.t
+@@ -14,9 +14,9 @@ use File::Temp qw[tempdir];
+ use MakeMaker::Test::Utils;
+ use MakeMaker::Test::Setup::Recurs;
+ use Config;
+-use Test::More;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+     : (tests => 26);
+ 
+diff --git a/cpan/ExtUtils-MakeMaker/t/several_authors.t b/cpan/ExtUtils-MakeMaker/t/several_authors.t
+index 1a75a3e..869e9f0 100644
+--- a/cpan/ExtUtils-MakeMaker/t/several_authors.t
++++ b/cpan/ExtUtils-MakeMaker/t/several_authors.t
+@@ -13,9 +13,9 @@ use TieOut;
+ use MakeMaker::Test::Utils;
+ use MakeMaker::Test::Setup::SAS;
+ use Config;
+-use Test::More;
+ use ExtUtils::MM;
+-plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
++use Test::More
++    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
+     ? (skip_all => "cross-compiling and make not available")
+     : (tests => 20);
+ use File::Path;
diff --git a/meta/recipes-devtools/perl/perl/perl-test-customized.patch b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
new file mode 100644
index 0000000..84b0b88
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
@@ -0,0 +1,61 @@
+The OE core recipies customize some ExtUtils-MakeMaker modules,
+which causes their MD5 sum to mismatch the provided table and the
+corresponding tests to fail. Also, we patch several test files with
+a backported patch. Update list of hashes to reflect the patched files.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Bill Randle <william.c.randle@intel.com>
+
+Index: perl-5.22.1/t/porting/customized.dat
+===================================================================
+--- perl-5.22.1.orig/t/porting/customized.dat	2015-10-31 13:36:16.000000000 +0000
++++ perl-5.22.1/t/porting/customized.dat	2016-06-02 12:50:10.381030204 -0700
+@@ -1,8 +1,8 @@
+ CPAN cpan/CPAN/lib/CPAN.pm ce62c43d72f101c011184dbbc59e21c2790826f0
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm 7f4dfd0fe884bd42412bcf04ca80ef97b39c1d54
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm bef099988b15fb0b2a1f5ac48c01af1f7f36d329
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 8168e18f0e3ce3ece4bb7e7c72d57ec07c67c402
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 7115e97a53559cb3ec061dd6f7f344e522724c4a
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm a08ecf80c8f0a234243817713b2a5ab0dcae3c0a
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 3d7abd674b15ed323f743594ef0bd09db76b1aee
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm f8db8d4245bf0684b8210c811f50d7cfb1a27d78
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 757bffb47857521311f8f3bde43ebe165f8d5191
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Locale.pm 82be06851deb84c6419ad003ce9b6d1957f395f3
+@@ -14,7 +14,7 @@
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm ab80029ab16d38d4f2e41dc88d2ceb9f3790e477
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 453e0abbc4bb38db4c0820ad5c4846f313b66291
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm c1b1babda8f43ae7a2caba1cb4f70f92af5a0e34
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 6f90d94ad3e7aa0045a3b1a10a1bb18391f89f57
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 21bde53290bf1a4da4457290b65bd1b0ca6f1d16
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm cab2b3ce08b71a4ce89aa630f236eb08b852439d
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm 61fced0faf518bf87c265fcb51ed330ba354623f
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm ae0ef51a7b6dd0b05aa61c779df7167dda5f5119
+@@ -23,7 +23,7 @@
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm 433135eecb85b4b1d90d3027432f329436c78447
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 1fbb5605bfb47feee4083feba8aa85e659628f70
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5b66d1f485a6034d96fc24ba1665b1bad9e447f1
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 8cef99a9bd370ecfd07ddb0efbdcbb4101255e45
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 860d520234d7c9036d91f0b143a1dddf2a5e8cb7
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 939572fde3d59ba77c2e677fe2df2bed4bed5898
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 09c2049bfd25b735e2a5bcf56a6cff7b4827f9c8
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm d65d63f8217a55c36f62e249814988974f593c79
+@@ -31,8 +31,16 @@
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm 12df38eacceeed73cab94c423236bfaed0fbbfec
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 22fe9596a0237252f45399a36abc83b7813bc328
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 7fbc42ca2ebc6c677b79ae5fd5647243cf069463
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/basic.t 6cdc7701b50e586bc9c4cfb1616de8eb0b1baf34
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/pm_to_blib.t 71ebcee355691ce374fcad251b12d8b2412462b3
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/basic.t d78fdec7a4512dc8d2a7abd62b8104530af8ecf9
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 9427f4adebbb13b57b4a76fef2972adf63c9bd96
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t ef356c196bb5c3c428ae309d7f989bdd6d79b86d
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t 3e6d4d6eb2eab42e983ac70eb5737a759af0916f
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/INST.t e553fa0d53c894c8d36aafb69edd55b38a9355f8
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/min_perl_version.t e930ec9217de5a1785d0247c30b159e6f7f5673f
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/PL_FILES.t 7e49ab6c4d467826d22023fa03d77b85f935b58e
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/pm_to_blib.t a04c96eecfab17e4094604e0fb998dd93cf93b93
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/recurs.t 94cce3bff875a878ed27816b3f5df2ca4225c714
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/several_authors.t f811d993c0835c66dc501ed55083acb29bf33bf7
+ Text::ParseWords cpan/Text-ParseWords/t/ParseWords.t 9bae51c9b944cd5c0bbabe9d397e573976a2be8e
+ Win32API::File cpan/Win32API-File/buffers.h 02d230ac9ac7091365128161a0ed671898baefae
+ Win32API::File cpan/Win32API-File/cFile.h fca7e383e76979c3ac3adf12d11d1bcd2618e489
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index f955e6f..3bd0a6d 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -63,6 +63,8 @@ SRC_URI += " \
         file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
         file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
         file://perl-errno-generation-gcc5.patch \
+        file://perl-fix-conflict-between-skip_all-and-END.patch \
+        file://perl-test-customized.patch \
 "
 
 # Fix test case issues
-- 
2.5.5


