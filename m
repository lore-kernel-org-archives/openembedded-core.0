Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED13072FC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:31:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 10:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132982304"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.120])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 10:31:28 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 12:34:51 -0600
Message-Id: <1487702092-9174-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] perl: Upgrade to 5.24.1
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
X-List-Received-Date: Tue, 21 Feb 2017 18:31:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade config.sh to match new version.

Removed CVE patches already in upstream:

- perl-fix-CVE-2016-1238.patch
- perl-fix-CVE-2016-6185.patch

Update customized.dat patch to match new hashes.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 ...perl-native_5.24.0.bb => perl-native_5.24.1.bb} |   4 +-
 ...depends_5.24.0.inc => perl-rdepends_5.24.1.inc} |   0
 meta/recipes-devtools/perl/perl/config.sh          |  60 ++--
 .../perl/perl/perl-fix-CVE-2016-1238.patch         | 352 ---------------------
 .../perl/perl/perl-fix-CVE-2016-6185.patch         | 128 --------
 .../perl/perl/perl-test-customized.patch           |  86 +++--
 .../perl/{perl_5.24.0.bb => perl_5.24.1.bb}        |   6 +-
 7 files changed, 88 insertions(+), 548 deletions(-)
 rename meta/recipes-devtools/perl/{perl-native_5.24.0.bb => perl-native_5.24.1.bb} (96%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.24.0.inc => perl-rdepends_5.24.1.inc} (100%)
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch
 rename meta/recipes-devtools/perl/{perl_5.24.0.bb => perl_5.24.1.bb} (98%)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
similarity index 96%
rename from meta/recipes-devtools/perl/perl-native_5.24.0.bb
rename to meta/recipes-devtools/perl/perl-native_5.24.1.bb
index 4216257..d111bcd 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
@@ -13,8 +13,8 @@ SRC_URI += "\
            file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
           "
 
-SRC_URI[md5sum] = "59456ae4bd4b06cb6e57cb19a3b2d349"
-SRC_URI[sha256sum] = "a9a37c0860380ecd7b23aa06d61c20fc5bc6d95198029f3684c44a9d7e2952f2"
+SRC_URI[md5sum] = "af6a84c7c3e2b8b269c105a5db2f6d53"
+SRC_URI[sha256sum] = "03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f"
 
 inherit native
 
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.24.0.inc b/meta/recipes-devtools/perl/perl-rdepends_5.24.1.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rdepends_5.24.0.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.24.1.inc
diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index 6666e6f..4657673 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -14,7 +14,7 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.24.0 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.24.1 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
 config_argc=28
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
@@ -26,7 +26,7 @@ config_arg7='-Dinstallprefix=@EXECPREFIX@'
 config_arg8='-Dprefix=@EXECPREFIX@'
 config_arg9='-Dvendorprefix=@EXECPREFIX@'
 config_arg10='-Dsiteprefix=@EXECPREFIX@'
-config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.24.0'
+config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.24.1'
 config_arg12='-Duseshrplib'
 config_arg13='-Dusethreads'
 config_arg14='-Duseithreads'
@@ -64,13 +64,13 @@ alignbytes='8'
 ansi2knr=''
 aphostname=''
 api_revision='5'
-api_subversion='0'
+api_subversion='1'
 api_version='24'
-api_versionstring='5.24.0'
+api_versionstring='5.24.1'
 ar='ar'
-archlib='@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
-archlib_exp='@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
+archlib='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
+archlib_exp='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -88,7 +88,7 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi/CORE'
+ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi/CORE'
 ccflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
@@ -838,7 +838,7 @@ inc_version_list_init='0'
 incpath=''
 inews=''
 initialinstalllocation='@USRBIN@'
-installarchlib='@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
+installarchlib='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
 installbin='@USRBIN@'
 installhtml1dir=''
 installhtml3dir=''
@@ -846,23 +846,23 @@ installman1dir=''
 installman3dir=''
 installprefix='@EXECPREFIX@'
 installprefixexp='@EXECPREFIX@'
-installprivlib='@LIBDIR@/perl/5.24.0'
+installprivlib='@LIBDIR@/perl/5.24.1'
 installscript='@USRBIN@'
-installsitearch='@LIBDIR@/perl/site_perl/5.24.0/@ARCH@-thread-multi'
+installsitearch='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
 installsitebin='@USRBIN@'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@LIBDIR@/perl/site_perl/5.24.0'
+installsitelib='@LIBDIR@/perl/site_perl/5.24.1'
 installsiteman1dir=''
 installsiteman3dir=''
 installsitescript='@USRBIN@'
 installstyle='lib/perl'
 installusrbinperl='define'
-installvendorarch='@LIBDIR@/perl/vendor_perl/5.24.0/@ARCH@-thread-multi'
+installvendorarch='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
 installvendorbin='@USRBIN@'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@LIBDIR@/perl/vendor_perl/5.24.0'
+installvendorlib='@LIBDIR@/perl/vendor_perl/5.24.1'
 installvendorman1dir=''
 installvendorman3dir=''
 installvendorscript='@USRBIN@'
@@ -965,7 +965,7 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='3.19.5-yocto-standard'
-otherlibdirs='@LIBDIR@/perl/5.24.0'
+otherlibdirs='@LIBDIR@/perl/5.24.1'
 package='perl'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
@@ -986,8 +986,8 @@ pmake=''
 pr=''
 prefix='@EXECPREFIX@'
 prefixexp='@EXECPREFIX@'
-privlib='@LIBDIR@/perl/5.24.0'
-privlibexp='@LIBDIR@/perl/5.24.0'
+privlib='@LIBDIR@/perl/5.24.1'
+privlibexp='@LIBDIR@/perl/5.24.1'
 procselfexe='"/proc/self/exe"'
 prototype='define'
 ptrsize='8'
@@ -1053,17 +1053,17 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='@LIBDIR@/perl/site_perl/5.24.0/@ARCH@-thread-multi'
-sitearchexp='@LIBDIR@/perl/site_perl/5.24.0/@ARCH@-thread-multi'
+sitearch='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
+sitearchexp='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
 sitebin='@USRBIN@'
 sitebinexp='@USRBIN@'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='@LIBDIR@/perl/site_perl/5.24.0'
+sitelib='@LIBDIR@/perl/site_perl/5.24.1'
 sitelib_stem='@LIBDIR@/perl/site_perl'
-sitelibexp='@LIBDIR@/perl/site_perl/5.24.0'
+sitelibexp='@LIBDIR@/perl/site_perl/5.24.1'
 siteman1dir=''
 siteman1direxp=''
 siteman3dir=''
@@ -1102,7 +1102,7 @@ stdio_stream_array=''
 strerror_r_proto='REENTRANT_PROTO_B_IBW'
 strings='@INCLUDEDIR@/string.h'
 submit=''
-subversion='0'
+subversion='1'
 sysman='@EXECPREFIX@/share/man/man1'
 sysroot=''
 tail=''
@@ -1182,17 +1182,17 @@ uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='@LIBDIR@/perl/vendor_perl/5.24.0/@ARCH@-thread-multi'
-vendorarchexp='@LIBDIR@/perl/vendor_perl/5.24.0/@ARCH@-thread-multi'
+vendorarch='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
+vendorarchexp='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
 vendorbin='@USRBIN@'
 vendorbinexp='@USRBIN@'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='@LIBDIR@/perl/vendor_perl/5.24.0'
+vendorlib='@LIBDIR@/perl/vendor_perl/5.24.1'
 vendorlib_stem='@LIBDIR@/perl/vendor_perl'
-vendorlibexp='@LIBDIR@/perl/vendor_perl/5.24.0'
+vendorlibexp='@LIBDIR@/perl/vendor_perl/5.24.1'
 vendorman1dir=' '
 vendorman1direxp=''
 vendorman3dir=' '
@@ -1201,8 +1201,8 @@ vendorprefix='@EXECPREFIX@'
 vendorprefixexp='@EXECPREFIX@'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
-version='5.24.0'
-version_patchlevel_string='version 24 subversion 0'
+version='5.24.1'
+version_patchlevel_string='version 24 subversion 1'
 versiononly='undef'
 vi=''
 xlibpth='@LIBDIR@/386 @BASELIBDIR@386'
@@ -1212,10 +1212,10 @@ zcat=''
 zip='zip'
 PERL_REVISION=5
 PERL_VERSION=24
-PERL_SUBVERSION=0
+PERL_SUBVERSION=1
 PERL_API_REVISION=5
 PERL_API_VERSION=24
-PERL_API_SUBVERSION=0
+PERL_API_SUBVERSION=1
 PERL_PATCHLEVEL=''
 PERL_CONFIG_SH=true
 : Variables propagated from previous config.sh file.
diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch
deleted file mode 100644
index 730ef17..0000000
--- a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch
+++ /dev/null
@@ -1,352 +0,0 @@
-From 9987be3d24286d96d9dccec0433253ee8ad894b4 Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 21 Jun 2016 10:02:02 +1000
-Subject: [PATCH] perl: fix CVE-2016-1238
-
-(perl #127834) remove . from the end of @INC if complex modules are loaded
-
-While currently Encode and Storable are know to attempt to load modules
-not included in the core, updates to other modules may lead to those
-also attempting to load new modules, so be safe and remove . for those
-as well.
-
-Backport patch from http://perl5.git.perl.org/perl.git/commitdiff/cee96d52c39b1e7b36e1c62d38bcd8d86e9a41ab
-
-Upstream-Status: Backport
-CVE: CVE-2016-1238
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- cpan/Archive-Tar/bin/ptar                 | 1 +
- cpan/Archive-Tar/bin/ptardiff             | 1 +
- cpan/Archive-Tar/bin/ptargrep             | 1 +
- cpan/CPAN/scripts/cpan                    | 1 +
- cpan/Digest-SHA/shasum                    | 1 +
- cpan/Encode/bin/enc2xs                    | 1 +
- cpan/Encode/bin/encguess                  | 1 +
- cpan/Encode/bin/piconv                    | 1 +
- cpan/Encode/bin/ucmlint                   | 1 +
- cpan/Encode/bin/unidump                   | 1 +
- cpan/ExtUtils-MakeMaker/bin/instmodsh     | 1 +
- cpan/IO-Compress/bin/zipdetails           | 1 +
- cpan/JSON-PP/bin/json_pp                  | 1 +
- cpan/Test-Harness/bin/prove               | 1 +
- dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp | 1 +
- dist/Module-CoreList/corelist             | 1 +
- ext/Pod-Html/bin/pod2html                 | 1 +
- utils/c2ph.PL                             | 1 +
- utils/h2ph.PL                             | 2 ++
- utils/h2xs.PL                             | 2 ++
- utils/libnetcfg.PL                        | 1 +
- utils/perlbug.PL                          | 1 +
- utils/perldoc.PL                          | 5 ++++-
- utils/perlivp.PL                          | 2 ++
- utils/splain.PL                           | 6 ++++++
- 25 files changed, 36 insertions(+), 1 deletion(-)
-
-diff --git a/cpan/Archive-Tar/bin/ptar b/cpan/Archive-Tar/bin/ptar
-index 0eaffa7..9dc6402 100644
---- a/cpan/Archive-Tar/bin/ptar
-+++ b/cpan/Archive-Tar/bin/ptar
-@@ -1,6 +1,7 @@
- #!/usr/bin/perl
- use strict;
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use File::Find;
- use Getopt::Std;
- use Archive::Tar;
-diff --git a/cpan/Archive-Tar/bin/ptardiff b/cpan/Archive-Tar/bin/ptardiff
-index 66bd859..4668fa6 100644
---- a/cpan/Archive-Tar/bin/ptardiff
-+++ b/cpan/Archive-Tar/bin/ptardiff
-@@ -1,5 +1,6 @@
- #!/usr/bin/perl
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use Archive::Tar;
- use Getopt::Std;
-diff --git a/cpan/Archive-Tar/bin/ptargrep b/cpan/Archive-Tar/bin/ptargrep
-index 1a320f1..8dc6b4f 100644
---- a/cpan/Archive-Tar/bin/ptargrep
-+++ b/cpan/Archive-Tar/bin/ptargrep
-@@ -4,6 +4,7 @@
- # archive.  See 'ptargrep --help' for more documentation.
- #
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use warnings;
- 
-diff --git a/cpan/CPAN/scripts/cpan b/cpan/CPAN/scripts/cpan
-index 5f4320e..ccba47e 100644
---- a/cpan/CPAN/scripts/cpan
-+++ b/cpan/CPAN/scripts/cpan
-@@ -1,5 +1,6 @@
- #!/usr/local/bin/perl
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use vars qw($VERSION);
- 
-diff --git a/cpan/Digest-SHA/shasum b/cpan/Digest-SHA/shasum
-index 14ddd60..62a2b0e 100644
---- a/cpan/Digest-SHA/shasum
-+++ b/cpan/Digest-SHA/shasum
-@@ -13,6 +13,7 @@
- 	## "-0" option for reading bit strings, and
- 	## "-p" option for portable digests (to be deprecated).
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use warnings;
- use Fcntl;
-diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
-index 4d64e38..473a15c 100644
---- a/cpan/Encode/bin/enc2xs
-+++ b/cpan/Encode/bin/enc2xs
-@@ -4,6 +4,7 @@ BEGIN {
-     # with $ENV{PERL_CORE} set
-     # In case we need it in future...
-     require Config; import Config;
-+    pop @INC if $INC[-1] eq '.';
- }
- use strict;
- use warnings;
-diff --git a/cpan/Encode/bin/encguess b/cpan/Encode/bin/encguess
-index 5d7ac80..0be5c7c 100644
---- a/cpan/Encode/bin/encguess
-+++ b/cpan/Encode/bin/encguess
-@@ -1,5 +1,6 @@
- #!./perl
- use 5.008001;
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use warnings;
- use Encode;
-diff --git a/cpan/Encode/bin/piconv b/cpan/Encode/bin/piconv
-index c1dad9e..60b2a59 100644
---- a/cpan/Encode/bin/piconv
-+++ b/cpan/Encode/bin/piconv
-@@ -1,6 +1,7 @@
- #!./perl
- # $Id: piconv,v 2.7 2014/05/31 09:48:48 dankogai Exp $
- #
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use 5.8.0;
- use strict;
- use Encode ;
-diff --git a/cpan/Encode/bin/ucmlint b/cpan/Encode/bin/ucmlint
-index 622376d..25e0d67 100644
---- a/cpan/Encode/bin/ucmlint
-+++ b/cpan/Encode/bin/ucmlint
-@@ -3,6 +3,7 @@
- # $Id: ucmlint,v 2.2 2008/03/12 09:51:11 dankogai Exp $
- #
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- our  $VERSION = do { my @r = (q$Revision: 2.2 $ =~ /\d+/g); sprintf "%d."."%02d" x $#r, @r };
- 
-diff --git a/cpan/Encode/bin/unidump b/cpan/Encode/bin/unidump
-index ae0da30..f190827 100644
---- a/cpan/Encode/bin/unidump
-+++ b/cpan/Encode/bin/unidump
-@@ -1,5 +1,6 @@
- #!./perl
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use Encode;
- use Getopt::Std;
-diff --git a/cpan/ExtUtils-MakeMaker/bin/instmodsh b/cpan/ExtUtils-MakeMaker/bin/instmodsh
-index e551434..b3b109f 100644
---- a/cpan/ExtUtils-MakeMaker/bin/instmodsh
-+++ b/cpan/ExtUtils-MakeMaker/bin/instmodsh
-@@ -1,5 +1,6 @@
- #!/usr/bin/perl -w
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use IO::File;
- use ExtUtils::Packlist;
-diff --git a/cpan/IO-Compress/bin/zipdetails b/cpan/IO-Compress/bin/zipdetails
-index 0249850..1b9c70a 100644
---- a/cpan/IO-Compress/bin/zipdetails
-+++ b/cpan/IO-Compress/bin/zipdetails
-@@ -5,6 +5,7 @@
- # Display info on the contents of a Zip file
- #
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use warnings ;
- 
-diff --git a/cpan/JSON-PP/bin/json_pp b/cpan/JSON-PP/bin/json_pp
-index df9d243..896cd2f 100644
---- a/cpan/JSON-PP/bin/json_pp
-+++ b/cpan/JSON-PP/bin/json_pp
-@@ -1,5 +1,6 @@
- #!/usr/bin/perl
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use Getopt::Long;
- 
-diff --git a/cpan/Test-Harness/bin/prove b/cpan/Test-Harness/bin/prove
-index 6637cc4..d71b238 100644
---- a/cpan/Test-Harness/bin/prove
-+++ b/cpan/Test-Harness/bin/prove
-@@ -1,5 +1,6 @@
- #!/usr/bin/perl -w
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use warnings;
- use App::Prove;
-diff --git a/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp b/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp
-index e2ac71a..d596cdf 100644
---- a/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp
-+++ b/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp
-@@ -1,5 +1,6 @@
- #!perl
- use 5.006;
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- eval {
-   require ExtUtils::ParseXS;
-diff --git a/dist/Module-CoreList/corelist b/dist/Module-CoreList/corelist
-index aa4a945..bbe61cc 100644
---- a/dist/Module-CoreList/corelist
-+++ b/dist/Module-CoreList/corelist
-@@ -130,6 +130,7 @@ requested perl versions.
- 
- =cut
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use Module::CoreList;
- use Getopt::Long qw(:config no_ignore_case);
- use Pod::Usage;
-diff --git a/ext/Pod-Html/bin/pod2html b/ext/Pod-Html/bin/pod2html
-index b022859..7d1d232 100644
---- a/ext/Pod-Html/bin/pod2html
-+++ b/ext/Pod-Html/bin/pod2html
-@@ -216,6 +216,7 @@ This program is distributed under the Artistic License.
- 
- =cut
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use Pod::Html;
- 
- pod2html @ARGV;
-diff --git a/utils/c2ph.PL b/utils/c2ph.PL
-index 13389ec..cef0b5c 100644
---- a/utils/c2ph.PL
-+++ b/utils/c2ph.PL
-@@ -280,6 +280,7 @@ Anyway, here it is.  Should run on perl v4 or greater.  Maybe less.
- 
- $RCSID = '$Id: c2ph,v 1.7 95/10/28 10:41:47 tchrist Exp Locker: tchrist $';
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use File::Temp;
- 
- ######################################################################
-diff --git a/utils/h2ph.PL b/utils/h2ph.PL
-index 55c1f72..300b756 100644
---- a/utils/h2ph.PL
-+++ b/utils/h2ph.PL
-@@ -36,6 +36,8 @@ $Config{startperl}
- 
- print OUT <<'!NO!SUBS!';
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
-+
- use strict;
- 
- use Config;
-diff --git a/utils/h2xs.PL b/utils/h2xs.PL
-index 268f680..f95ee0c 100644
---- a/utils/h2xs.PL
-+++ b/utils/h2xs.PL
-@@ -35,6 +35,8 @@ $Config{startperl}
- 
- print OUT <<'!NO!SUBS!';
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
-+
- use warnings;
- 
- =head1 NAME
-diff --git a/utils/libnetcfg.PL b/utils/libnetcfg.PL
-index 59a2de8..26d2f99 100644
---- a/utils/libnetcfg.PL
-+++ b/utils/libnetcfg.PL
-@@ -97,6 +97,7 @@ Jarkko Hietaniemi, conversion into libnetcfg for inclusion into Perl 5.8.
- 
- # $Id: Configure,v 1.8 1997/03/04 09:22:32 gbarr Exp $
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use strict;
- use IO::File;
- use Getopt::Std;
-diff --git a/utils/perlbug.PL b/utils/perlbug.PL
-index 885785a..ae8c343 100644
---- a/utils/perlbug.PL
-+++ b/utils/perlbug.PL
-@@ -57,6 +57,7 @@ print OUT <<'!NO!SUBS!';
- my @patches = Config::local_patches();
- my $patch_tags = join "", map /(\S+)/ ? "+$1 " : (), @patches;
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
- use warnings;
- use strict;
- use Config;
-diff --git a/utils/perldoc.PL b/utils/perldoc.PL
-index e201de9..cd60bd4 100644
---- a/utils/perldoc.PL
-+++ b/utils/perldoc.PL
-@@ -44,7 +44,10 @@ $Config{startperl}
- # This "$file" file was generated by "$0"
- 
- require 5;
--BEGIN { \$^W = 1 if \$ENV{'PERLDOCDEBUG'} }
-+BEGIN {
-+    \$^W = 1 if \$ENV{'PERLDOCDEBUG'};
-+    pop \@INC if \$INC[-1] eq '.';
-+}
- use Pod::Perldoc;
- exit( Pod::Perldoc->run() );
- 
-diff --git a/utils/perlivp.PL b/utils/perlivp.PL
-index cc49f96..696a44e 100644
---- a/utils/perlivp.PL
-+++ b/utils/perlivp.PL
-@@ -39,6 +39,8 @@ print OUT "\n# perlivp $^V\n";
- 
- print OUT <<'!NO!SUBS!';
- 
-+BEGIN { pop @INC if $INC[-1] eq '.' }
-+
- sub usage {
-     warn "@_\n" if @_;
-     print << "    EOUSAGE";
-diff --git a/utils/splain.PL b/utils/splain.PL
-index 9c70b61..cae84a0 100644
---- a/utils/splain.PL
-+++ b/utils/splain.PL
-@@ -38,6 +38,12 @@ $Config{startperl}
- 	if \$running_under_some_shell;
- !GROK!THIS!
- 
-+print <<'!NO!SUBS!';
-+
-+BEGIN { pop @INC if $INC[-1] eq '.' }
-+
-+!NO!SUBS!
-+
- while (<IN>) {
-     print OUT unless /^package diagnostics/;
- }
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch
deleted file mode 100644
index 2722af3..0000000
--- a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 7cedaa8bc2ca9e63369d0e2d4c4c23af9febb93a Mon Sep 17 00:00:00 2001
-From: Father Chrysostomos <sprout@cpan.org>
-Date: Sat, 2 Jul 2016 22:56:51 -0700
-Subject: [PATCH] perl: fix CVE-2016-6185
-MIME-Version: 1.0
-
-Don't let XSLoader load relative paths
-
-[rt.cpan.org #115808]
-
-The logic in XSLoader for determining the library goes like this:
-
-    my $c = () = split(/::/,$caller,-1);
-    $modlibname =~ s,[\\/][^\\/]+$,, while $c--;    # Q&D basename
-    my $file = "$modlibname/auto/$modpname/$modfname.bundle";
-
-(That last line varies by platform.)
-
-$caller is the calling package.  $modlibname is the calling file.  It
-removes as many path segments from $modlibname as there are segments
-in $caller.  So if you have Foo/Bar/XS.pm calling XSLoader from the
-Foo::Bar package, the $modlibname will end up containing the path in
-@INC where XS.pm was found, followed by "/Foo".  Usually the fallback
-to Dynaloader::bootstrap_inherit, which does an @INC search, makes
-things Just Work.
-
-But if our hypothetical Foo/Bar/XS.pm actually calls
-XSLoader::load from inside a string eval, then path ends up being
-"(eval 1)/auto/Foo/Bar/Bar.bundle".
-
-So if someone creates a directory named '(eval 1)' with a naughty
-binary file in it, it will be loaded if a script using Foo::Bar is run
-in the parent directory.
-
-This commit makes XSLoader fall back to Dynaloader's @INC search if
-the calling file has a relative path that is not found in @INC.
-
-Backport patch from http://perl5.git.perl.org/perl.git/commitdiff/08e3451d7
-
-Upstream-Status: Backport
-CVE: CVE-2016-6185
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- dist/XSLoader/XSLoader_pm.PL | 25 +++++++++++++++++++++++++
- dist/XSLoader/t/XSLoader.t   | 27 ++++++++++++++++++++++++++-
- 2 files changed, 51 insertions(+), 1 deletion(-)
-
-diff --git a/dist/XSLoader/XSLoader_pm.PL b/dist/XSLoader/XSLoader_pm.PL
-index 668411d..778e46b 100644
---- a/dist/XSLoader/XSLoader_pm.PL
-+++ b/dist/XSLoader/XSLoader_pm.PL
-@@ -104,6 +104,31 @@ print OUT <<'EOT';
-     my $modpname = join('/',@modparts);
-     my $c = () = split(/::/,$caller,-1);
-     $modlibname =~ s,[\\/][^\\/]+$,, while $c--;    # Q&D basename
-+    # Does this look like a relative path?
-+    if ($modlibname !~ m|^[\\/]|) {
-+        # Someone may have a #line directive that changes the file name, or
-+        # may be calling XSLoader::load from inside a string eval.  We cer-
-+        # tainly do not want to go loading some code that is not in @INC,
-+        # as it could be untrusted.
-+        #
-+        # We could just fall back to DynaLoader here, but then the rest of
-+        # this function would go untested in the perl core, since all @INC
-+        # paths are relative during testing.  That would be a time bomb
-+        # waiting to happen, since bugs could be introduced into the code.
-+        #
-+        # So look through @INC to see if $modlibname is in it.  A rela-
-+        # tive $modlibname is not a common occurrence, so this block is
-+        # not hot code.
-+        FOUND: {
-+            for (@INC) {
-+                if ($_ eq $modlibname) {
-+                    last FOUND;
-+                }
-+            }
-+            # Not found.  Fall back to DynaLoader.
-+            goto \&XSLoader::bootstrap_inherit;
-+        }
-+    }
- EOT
- 
- my $dl_dlext = quotemeta($Config::Config{'dlext'});
-diff --git a/dist/XSLoader/t/XSLoader.t b/dist/XSLoader/t/XSLoader.t
-index 2ff11fe..1e86faa 100644
---- a/dist/XSLoader/t/XSLoader.t
-+++ b/dist/XSLoader/t/XSLoader.t
-@@ -33,7 +33,7 @@ my %modules = (
-     'Time::HiRes'=> q| ::can_ok( 'Time::HiRes' => 'usleep'  ) |,  # 5.7.3
- );
- 
--plan tests => keys(%modules) * 3 + 9;
-+plan tests => keys(%modules) * 3 + 10;
- 
- # Try to load the module
- use_ok( 'XSLoader' );
-@@ -125,3 +125,28 @@ XSLoader::load("Devel::Peek");
- EOS
-     or ::diag $@;
- }
-+
-+SKIP: {
-+  skip "File::Path not available", 1
-+    unless eval { require File::Path };
-+  my $name = "phooo$$";
-+  File::Path::make_path("$name/auto/Foo/Bar");
-+  open my $fh,
-+    ">$name/auto/Foo/Bar/Bar.$Config::Config{'dlext'}";
-+  close $fh;
-+  my $fell_back;
-+  local *XSLoader::bootstrap_inherit = sub {
-+    $fell_back++;
-+    # Break out of the calling subs
-+    goto the_test;
-+  };
-+  eval <<END;
-+#line 1 $name
-+package Foo::Bar;
-+XSLoader::load("Foo::Bar");
-+END
-+ the_test:
-+  ok $fell_back,
-+    'XSLoader will not load relative paths based on (caller)[1]';
-+  File::Path::remove_tree($name);
-+}
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/perl/perl/perl-test-customized.patch b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
index dc4ab00..90e4dcd 100644
--- a/meta/recipes-devtools/perl/perl/perl-test-customized.patch
+++ b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
@@ -14,51 +14,73 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Bill Randle <william.c.randle@intel.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 ---
- t/porting/customized.dat | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ t/porting/customized.dat | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/t/porting/customized.dat b/t/porting/customized.dat
-index f871a32..e11d147 100644
+index defeae1..b5d3c46 100644
 --- a/t/porting/customized.dat
 +++ b/t/porting/customized.dat
-@@ -3,8 +3,8 @@ Encode cpan/Encode/encoding.pm 51c19efc9bfe8467d6ae12a4654f6e7f980715bf
+@@ -18,12 +18,12 @@ Encode cpan/Encode/bin/unidump 715f47c2fcc661268f3c6cd3de0d27c72b745cd2
+ Encode cpan/Encode/Encode.pm e146861ff2e6aaa62defa4887eade68dd7b17c8e
+ Encode cpan/Encode/encoding.pm 51c19efc9bfe8467d6ae12a4654f6e7f980715bf
  ExtUtils::Constant cpan/ExtUtils-Constant/t/Constant.t a0369c919e216fb02767a637666bb4577ad79b02
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm 8d772fbc6a57637ab24d12a02794073ee71b489c
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm 9be9ac3fee6fd6df702469904e02c8b4c6f2502e
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm bb2443c2314c50f09f7eab4aacc03ade8b9907dd
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 830acdc810e2974d7fd4ec408ea1bfa825c75b69
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 224832767ac102e53daf668a4243f9389a753589
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm effd272b3c9224af6fd0f6cae7183f33ec4b1106
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm 5c41b40e33464c6635258061dff4ece018b46bd9
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/bin/instmodsh 5bc04a0173b8b787f465271b6186220326ae8eef
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/bin/instmodsh 2070fe968fa344d89aea1bdc6a8dbb0c467d0612
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command.pm e3a372e07392179711ea9972087c1105a2780fad
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm b72721bd6aa9bf7ec328bda99a8fdb63cac6114d
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm 0e1e4c25eddb999fec6c4dc66593f76db34cfd16
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm bfd2aa00ca4ed251f342e1d1ad704abbaf5a615e
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 5529ae3064365eafd99536621305d52f4ab31b45
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm d593d8fdc5c0ebcb6d3701c70fc6640c50d93455
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm bf9174c70a0e50ff2fee4552c7df89b37d292da1
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm bc88b275af73b8faac6abd59a9aad3f625925810
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 062e5d14a803fbbec8d61803086a3d7997e8a473
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Tutorial.pod a8a9cab7d67922ed3d6883c864e1fe29aaa6ad89
-@@ -14,7 +14,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mkbootstrap.pm 5d5cd55e
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm 23a4b33b974e036d59bf55aa02e025506a408048
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 288df61e9ba7be3505b58b6345091fe1f310a117
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm 8578f2ea4ec9e764a789f6ecf620ea449ddca8c1
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 9f1f6c51fb0337726c99332facc52159c0619fe2
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 0f9eaebf7f93b5de213e60708a0fe257396ee188
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm a0ec076bedfa0c2e52fc2b735fbc75b4c2706bbf
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm 976b10ec76d1fe6f7ee9000b5596e8950434880b
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm bc4b33fa5296ab35bcb1be1c18759b93c4de2598
-@@ -23,7 +23,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_MacOS.pm 83601fa89eb
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm 8185a7db6c4d7e0fdc5001aeaa8c2b612a884a5e
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 2fe66ca8a894d6a2ae340b8bf6f8d69c5e1f7fbe
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm e8a4dbba69a1d551bd581ea6a3f2415bacbc0ae5
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm d666ac424618c3e11b8549755c9646d942bd2d57
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 211d37e5d841e462cf2d0644c43ef01a1366fbee
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm f6581a0e75e45bfc26f343f173d3366c43fb1221
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 1997912b5018970cdeb3dae8fd7e0c24f6e5d567
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm 210a4eda8b081d9986477e3a9762fce6ebea8474
-@@ -32,7 +32,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm f73ef46755d
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 6059d9bb7c4f0c154a61f115aa6b24ba08622b81
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 6347934cbe40da977790cea6c81987816b2fe26b
+@@ -33,7 +33,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mkbootstrap.pm 412e95c3
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm 8559ef191b4371d0c381472464856a8a73825b2a
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 09d579ed9daea95c3bf47de2e0b8fe3aa0ff6447
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm f720c13748293b792f7073aa96e7daecb590b183
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 243649a399d293ae7ad0f26b7eab2668aa864ce8
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm ec39f68802a6fee8daaa914fc7131f40533cfc23
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm b63c90129303b2c17d084fb828aa2c02a2ad85b8
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm cabd1c97eaa427067811d92807e34c17940c7350
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm 6a185d897a600c34615a6073f4de0ac2f54fef3e
+@@ -42,7 +42,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_MacOS.pm 1f5eb772eed
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm de777d7809c0d73e5d4622a29921731c7e5dff48
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 01e8f08a82b5304009574e3ac0892b4066ff7639
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5340052b58557a6764f5ac9f8b807fefec404a06
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 3c3b93f431b0a51b9592b3d69624dbf5409f6f74
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 0d6ed5e4bdcdcd28e968e8629a592fdd0cc84818
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 40397f4cd2d49700b80b4ef490da98add24c5b37
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 147e97fbabb74841f0733dbd5d1b9f3fa51f87c1
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm 3f13ed7045ff3443bcb4dd6c95c98b9bd705820f
+@@ -51,7 +51,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm 48e8a2fe176
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 6fefe99045b64459905d4721f3a494d8d50f7ab9
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 172778ad21c065a89cd270668eb9f99a7364b41c
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/cd.t 0a71fbd646a7be8358b07b6f64f838243cc0aef4
 -ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 37aec8f794c52e037540757eb5b2556f79419ff7
 +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 1a93dd8834e4bb0e5facf08204e782807567b2eb
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/NoXS.pm 371cdff1b2375017907cfbc9c8f4a31f5ad10582
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/prereq.t 53bda2c549fd13a6b6c13a070ca6bc79883081c0
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/vstrings.t 90035a2bdbf45f15b9c3196d072d7cba7e662871
+@@ -165,7 +165,7 @@ bignum cpan/bignum/lib/bigrat.pm 7fccc9df30e43dbbae6e5ea91b26c8046545c9a9
+ bignum cpan/bignum/lib/Math/BigFloat/Trace.pm a6b4b995e18f4083252e6dc72e9bef69671893dd
+ bignum cpan/bignum/lib/Math/BigInt/Trace.pm d9596963673760cae3eeeb752c1eeeec50bb2290
+ libnet cpan/libnet/lib/Net/Cmd.pm a44a10c939a4c35f923c4638054178c32f1d283a
+-libnet cpan/libnet/lib/Net/Config.pm 9bd49bf4de0dc438bceee0ef4baf8ba7a6633327
++libnet cpan/libnet/lib/Net/Config.pm 2873da5efbffed67934dd297ef6f360b3558cb0b
+ libnet cpan/libnet/lib/Net/Domain.pm 1bbed50f70fd1ff3e1cdf087b19a9349cddfaced
+ libnet cpan/libnet/lib/Net/FTP.pm 40dba553c8d44e1530daec2d07a6e50910401f2e
+ libnet cpan/libnet/lib/Net/FTP/A.pm c570b10730b168990034dcf9cb00e305a100f336
+@@ -176,6 +176,6 @@ libnet cpan/libnet/lib/Net/FTP/L.pm ac1599c775faee0474710e4f75051c8949f13df2
+ libnet cpan/libnet/lib/Net/Netrc.pm 009cfc08f8a5bf247257acb64a21e1b6ad8b2c9c
+ libnet cpan/libnet/lib/Net/NNTP.pm 6325fc05fd9ef81dc8d461a77b2a3f56ad1ae114
+ libnet cpan/libnet/lib/Net/POP3.pm 2d8065646df80061dae5a9e3465a36a6557165fd
+-libnet cpan/libnet/lib/Net/SMTP.pm f3ed7a177b49ee0ba65ac1c414de797cdbbe6886
++libnet cpan/libnet/lib/Net/SMTP.pm f1beb42bfbef4333ed24ad63d5dd1aa5c67b20c7
+ libnet cpan/libnet/lib/Net/Time.pm b3df8bbaa3bc253fbf77e8386c59a1b2aae13627
+ version cpan/version/lib/version.pm ff75e2076be10bd4c05133cd979fda0b38ca8653
 -- 
 2.1.4
 
diff --git a/meta/recipes-devtools/perl/perl_5.24.0.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.24.0.bb
rename to meta/recipes-devtools/perl/perl_5.24.1.bb
index 6804341..147e151 100644
--- a/meta/recipes-devtools/perl/perl_5.24.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -65,8 +65,6 @@ SRC_URI += " \
         file://perl-errno-generation-gcc5.patch \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
-        file://perl-fix-CVE-2016-6185.patch \
-        file://perl-fix-CVE-2016-1238.patch \
 "
 
 # Fix test case issues
@@ -75,8 +73,8 @@ SRC_URI_append_class-target = " \
             file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch \
            "
 
-SRC_URI[md5sum] = "59456ae4bd4b06cb6e57cb19a3b2d349"
-SRC_URI[sha256sum] = "a9a37c0860380ecd7b23aa06d61c20fc5bc6d95198029f3684c44a9d7e2952f2"
+SRC_URI[md5sum] = "af6a84c7c3e2b8b269c105a5db2f6d53"
+SRC_URI[sha256sum] = "03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f"
 
 inherit perlnative siteinfo
 
-- 
2.1.4


