Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2D960402
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 02:47:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 19:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,386,1534834800"; d="scan'208";a="97751753"
Received: from ylim28-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.249.70.131])
	by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2018 19:47:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2018 10:47:12 +0800
Message-Id: <20181016024712.14871-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] perl: skip tests that are not useful
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
X-List-Received-Date: Tue, 16 Oct 2018 02:47:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Some tests, like the one that compares the hashes for a list of files
against those stored in a .dat file, don't make sense for downstream
distros packaging perl.

Backport a patch from upstream that allows skipping of these tests at
runtime. Also remove the local patch trying to keep hashes up-to-date
for one of those tests.

Fixes [YOCTO #12787]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...tests-if-PERL_BUILD_PACKAGING-is-set.patch | 126 ++++++++++++++++++
 .../perl/perl/perl-test-customized.patch      |  86 ------------
 meta/recipes-devtools/perl/perl/run-ptest     |   2 +-
 meta/recipes-devtools/perl/perl_5.24.4.bb     |   2 +-
 4 files changed, 128 insertions(+), 88 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-test-customized.patch

diff --git a/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch b/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
new file mode 100644
index 0000000000..c5db1b7060
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
@@ -0,0 +1,126 @@
+From ba6733216202523a95b0b7ee2e534b8e30b6d7df Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sat, 14 Oct 2017 16:27:53 +0200
+Subject: [PATCH] Skip various tests if PERL_BUILD_PACKAGING is set
+
+These are tests which tend not to be useful for downstream packagers
+
+t/porting/customized.t change originally from Todd Rinaldo
+
+Upstream-Status: Backport[https://perl5.git.perl.org/perl.git/ba6733216202523a95b0b7ee2e534b8e30b6d7df]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ INSTALL                |  3 ++-
+ MANIFEST               |  1 +
+ PACKAGING              | 30 ++++++++++++++++++++++++++++++
+ regen/lib_cleanup.pl   |  5 +++++
+ t/porting/customized.t |  1 +
+ t/test.pl              |  3 +++
+ 6 files changed, 42 insertions(+), 1 deletion(-)
+ create mode 100644 PACKAGING
+
+diff --git a/INSTALL b/INSTALL
+index 636f4bd52f..1285fc69a2 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -2714,4 +2714,5 @@ This document is part of the Perl package and may be distributed under
+ the same terms as perl itself, with the following additional request:
+ If you are distributing a modified version of perl (perhaps as part of
+ a larger package) please B<do> modify these installation instructions
+-and the contact information to match your distribution.
++and the contact information to match your distribution. Additional
++information for packagers is in F<PACKAGING>.
+diff --git a/MANIFEST b/MANIFEST
+index b3207030a9..32de824ca1 100644
+--- a/MANIFEST
++++ b/MANIFEST
+@@ -4932,6 +4932,7 @@ os2/perlrexx.c			Support perl interpreter embedded in REXX
+ os2/perlrexx.cmd		Test perl interpreter embedded in REXX
+ overload.h			generated overload enum (public)
+ overload.inc			generated overload name table (implementation)
++PACKAGING			notes and best practice for packaging perl 5
+ packsizetables.inc		The generated packprops array used in pp_pack.c
+ pad.c				Scratchpad functions
+ pad.h				Scratchpad headers
+diff --git a/PACKAGING b/PACKAGING
+new file mode 100644
+index 0000000000..0c69b87ba6
+--- /dev/null
++++ b/PACKAGING
+@@ -0,0 +1,30 @@
++If you read this file _as_is_, just ignore the funny characters you
++see.  It is written in the POD format (see pod/perlpod.pod) which is
++specifically designed to be readable as is.
++
++=head1 NAME
++
++PACKAGING - notes and best practice for packaging perl 5
++
++=head1 SYNOPSIS
++
++This document is aimed at anyone who is producing their own version of
++perl for distribution to other users. It is intended as a collection
++of useful tips, advice and best practice, rather than being a complete
++packaging manual. The starting point for installing perl remains
++F<INSTALL>.
++
++=head1 Customizing test running
++
++A small number of porting tests (those in t/porting) are not well suited
++to typical distribution packaging scenarios. For example, they assume
++they are working in a git clone of the upstream Perl repository, or
++enforce rules which are not relevant to downstream packagers. These can
++be skipped by setting the environment variable PERL_BUILD_PACKAGING.
++A complete list of tests which this applied to can be found by searching
++the codebase for this string.
++
++An alternative strategy would be to skip all porting tests, but many of
++them are useful if additional patches might be applied.
++
++=cut
+diff --git a/regen/lib_cleanup.pl b/regen/lib_cleanup.pl
+index 5e40b405a4..6caf74a563 100644
+--- a/regen/lib_cleanup.pl
++++ b/regen/lib_cleanup.pl
+@@ -164,6 +164,11 @@ if ($TAP && !-d '.git' && !-f 'lib/.gitignore') {
+     exit 0;
+ }
+ 
++if ($ENV{'PERL_BUILD_PACKAGING'}) {
++    print "ok # skip explicitly disabled git tests by PERL_BUILD_PACKAGING\n";
++    exit 0;
++}
++
+ $fh = open_new('lib/.gitignore', '>',
+                { by => $0,
+                  from => 'MANIFEST and parsing files in cpan/ dist/ and ext/'});
+diff --git a/t/porting/customized.t b/t/porting/customized.t
+index 45fcafb100..5c3739198c 100644
+--- a/t/porting/customized.t
++++ b/t/porting/customized.t
+@@ -13,6 +13,7 @@ BEGIN {
+     @INC = qw(lib Porting t);
+     require 'test.pl';
+     skip_all("pre-computed SHA1 won't match under EBCDIC") if $::IS_EBCDIC;
++    skip_all("This distro may have modified some files in cpan/. Skipping validation.") if $ENV{'PERL_BUILD_PACKAGING'};
+ }
+ 
+ use strict;
+diff --git a/t/test.pl b/t/test.pl
+index 79e6e25e95..1782dcf73c 100644
+--- a/t/test.pl
++++ b/t/test.pl
+@@ -212,6 +212,9 @@ sub find_git_or_skip {
+     } else {
+ 	$reason = 'not being run from a git checkout';
+     }
++    if ($ENV{'PERL_BUILD_PACKAGING'}) {
++	$reason = 'PERL_BUILD_PACKAGING is set';
++    }
+     skip_all($reason) if $_[0] && $_[0] eq 'all';
+     skip($reason, @_);
+ }
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/perl/perl/perl-test-customized.patch b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
deleted file mode 100644
index 1d9a56d4c1..0000000000
--- a/meta/recipes-devtools/perl/perl/perl-test-customized.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 64df09205b6ccb5a434a4e53e8e0a32377ab634f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Thu, 24 Nov 2016 10:49:55 -0600
-Subject: [PATCH] The OE core recipies customize some ExtUtils-MakeMaker
- modules, which causes their MD5 sum to mismatch the provided table and the
- corresponding tests to fail. Also, we patch several test files with a
- backported patch. Update list of hashes to reflect the patched files.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Bill Randle <william.c.randle@intel.com>
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
----
- t/porting/customized.dat | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/t/porting/customized.dat b/t/porting/customized.dat
-index defeae1..b5d3c46 100644
---- a/t/porting/customized.dat
-+++ b/t/porting/customized.dat
-@@ -18,12 +18,12 @@ Encode cpan/Encode/bin/unidump 715f47c2fcc661268f3c6cd3de0d27c72b745cd2
- Encode cpan/Encode/Encode.pm e146861ff2e6aaa62defa4887eade68dd7b17c8e
- Encode cpan/Encode/encoding.pm 51c19efc9bfe8467d6ae12a4654f6e7f980715bf
- ExtUtils::Constant cpan/ExtUtils-Constant/t/Constant.t a0369c919e216fb02767a637666bb4577ad79b02
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/bin/instmodsh 5bc04a0173b8b787f465271b6186220326ae8eef
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/bin/instmodsh 2070fe968fa344d89aea1bdc6a8dbb0c467d0612
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command.pm e3a372e07392179711ea9972087c1105a2780fad
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm b72721bd6aa9bf7ec328bda99a8fdb63cac6114d
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm 0e1e4c25eddb999fec6c4dc66593f76db34cfd16
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm bfd2aa00ca4ed251f342e1d1ad704abbaf5a615e
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 5529ae3064365eafd99536621305d52f4ab31b45
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm f1ca5ec247eb69ba13a269f34dc205da37b61244
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm bf9174c70a0e50ff2fee4552c7df89b37d292da1
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm bc88b275af73b8faac6abd59a9aad3f625925810
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 062e5d14a803fbbec8d61803086a3d7997e8a473
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Tutorial.pod a8a9cab7d67922ed3d6883c864e1fe29aaa6ad89
-@@ -33,7 +33,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mkbootstrap.pm 412e95c3
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm 8559ef191b4371d0c381472464856a8a73825b2a
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 09d579ed9daea95c3bf47de2e0b8fe3aa0ff6447
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm f720c13748293b792f7073aa96e7daecb590b183
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 243649a399d293ae7ad0f26b7eab2668aa864ce8
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm ec39f68802a6fee8daaa914fc7131f40533cfc23
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm b63c90129303b2c17d084fb828aa2c02a2ad85b8
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm cabd1c97eaa427067811d92807e34c17940c7350
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm 6a185d897a600c34615a6073f4de0ac2f54fef3e
-@@ -42,7 +42,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_MacOS.pm 1f5eb772eed
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm de777d7809c0d73e5d4622a29921731c7e5dff48
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 01e8f08a82b5304009574e3ac0892b4066ff7639
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5340052b58557a6764f5ac9f8b807fefec404a06
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 3c3b93f431b0a51b9592b3d69624dbf5409f6f74
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 0d6ed5e4bdcdcd28e968e8629a592fdd0cc84818
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 40397f4cd2d49700b80b4ef490da98add24c5b37
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 147e97fbabb74841f0733dbd5d1b9f3fa51f87c1
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm 3f13ed7045ff3443bcb4dd6c95c98b9bd705820f
-@@ -51,7 +51,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm 48e8a2fe176
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 6fefe99045b64459905d4721f3a494d8d50f7ab9
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 172778ad21c065a89cd270668eb9f99a7364b41c
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/cd.t 0a71fbd646a7be8358b07b6f64f838243cc0aef4
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 37aec8f794c52e037540757eb5b2556f79419ff7
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 1a93dd8834e4bb0e5facf08204e782807567b2eb
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/NoXS.pm 371cdff1b2375017907cfbc9c8f4a31f5ad10582
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/prereq.t 53bda2c549fd13a6b6c13a070ca6bc79883081c0
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/vstrings.t 90035a2bdbf45f15b9c3196d072d7cba7e662871
-@@ -165,7 +165,7 @@ bignum cpan/bignum/lib/bigrat.pm 7fccc9df30e43dbbae6e5ea91b26c8046545c9a9
- bignum cpan/bignum/lib/Math/BigFloat/Trace.pm a6b4b995e18f4083252e6dc72e9bef69671893dd
- bignum cpan/bignum/lib/Math/BigInt/Trace.pm d9596963673760cae3eeeb752c1eeeec50bb2290
- libnet cpan/libnet/lib/Net/Cmd.pm a44a10c939a4c35f923c4638054178c32f1d283a
--libnet cpan/libnet/lib/Net/Config.pm 9bd49bf4de0dc438bceee0ef4baf8ba7a6633327
-+libnet cpan/libnet/lib/Net/Config.pm 2873da5efbffed67934dd297ef6f360b3558cb0b
- libnet cpan/libnet/lib/Net/Domain.pm 1bbed50f70fd1ff3e1cdf087b19a9349cddfaced
- libnet cpan/libnet/lib/Net/FTP.pm 40dba553c8d44e1530daec2d07a6e50910401f2e
- libnet cpan/libnet/lib/Net/FTP/A.pm c570b10730b168990034dcf9cb00e305a100f336
-@@ -176,6 +176,6 @@ libnet cpan/libnet/lib/Net/FTP/L.pm ac1599c775faee0474710e4f75051c8949f13df2
- libnet cpan/libnet/lib/Net/Netrc.pm 009cfc08f8a5bf247257acb64a21e1b6ad8b2c9c
- libnet cpan/libnet/lib/Net/NNTP.pm 6325fc05fd9ef81dc8d461a77b2a3f56ad1ae114
- libnet cpan/libnet/lib/Net/POP3.pm 2d8065646df80061dae5a9e3465a36a6557165fd
--libnet cpan/libnet/lib/Net/SMTP.pm f3ed7a177b49ee0ba65ac1c414de797cdbbe6886
-+libnet cpan/libnet/lib/Net/SMTP.pm f1beb42bfbef4333ed24ad63d5dd1aa5c67b20c7
- libnet cpan/libnet/lib/Net/Time.pm b3df8bbaa3bc253fbf77e8386c59a1b2aae13627
- version cpan/version/lib/version.pm ff75e2076be10bd4c05133cd979fda0b38ca8653
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/perl/perl/run-ptest b/meta/recipes-devtools/perl/perl/run-ptest
index 1e2dd1b66d..dad4d42916 100644
--- a/meta/recipes-devtools/perl/perl/run-ptest
+++ b/meta/recipes-devtools/perl/perl/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-cd t && ./TEST | sed -u -e 's|\(.*\) .* ok$|PASS: \1|' -e 's|\(.*\) .* skipped|SKIP: \1|' -e 's|\(.*\) \.\(.*\)|FAIL: \1|'
+cd t && PERL_BUILD_PACKAGING=1 ./TEST | sed -u -e 's|\(.*\) .* ok$|PASS: \1|' -e 's|\(.*\) .* skipped|SKIP: \1|' -e 's|\(.*\) \.\(.*\)|FAIL: \1|'
diff --git a/meta/recipes-devtools/perl/perl_5.24.4.bb b/meta/recipes-devtools/perl/perl_5.24.4.bb
index cc5aae9fd0..a644970192 100644
--- a/meta/recipes-devtools/perl/perl_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.4.bb
@@ -62,7 +62,6 @@ SRC_URI += " \
         file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
         file://perl-errno-generation-gcc5.patch \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
-        file://perl-test-customized.patch \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
         file://CVE-2018-12015.patch \
         file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
@@ -72,6 +71,7 @@ SRC_URI += " \
 SRC_URI_append_class-target = " \
             file://test/dist-threads-t-join.t-adjust-ps-option.patch \
             file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch \
+            file://0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch \
            "
 
 SRC_URI[md5sum] = "04622bc4d3941dc7eb571c52b7c02993"
-- 
2.17.1


