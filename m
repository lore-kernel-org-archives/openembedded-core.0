Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCFAD6014F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:04:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q64SJH017658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 23:04:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Sep 2016 23:04:28 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 14:00:42 +0800
Message-ID: <1474869642-20900-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] perl: fix CVE-2016-1238
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
X-List-Received-Date: Mon, 26 Sep 2016 06:04:28 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Backport patch to fix CVE-2016-1238 from perl upstream:
http://perl5.git.perl.org/perl.git/commitdiff/cee96d52c39b1e7b36e1c62d38bcd8d86e9a41ab

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/perl/perl-fix-CVE-2016-1238.patch         | 352 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   1 +
 2 files changed, 353 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch
new file mode 100644
index 0000000..730ef17
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-1238.patch
@@ -0,0 +1,352 @@
+From 9987be3d24286d96d9dccec0433253ee8ad894b4 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 21 Jun 2016 10:02:02 +1000
+Subject: [PATCH] perl: fix CVE-2016-1238
+
+(perl #127834) remove . from the end of @INC if complex modules are loaded
+
+While currently Encode and Storable are know to attempt to load modules
+not included in the core, updates to other modules may lead to those
+also attempting to load new modules, so be safe and remove . for those
+as well.
+
+Backport patch from http://perl5.git.perl.org/perl.git/commitdiff/cee96d52c39b1e7b36e1c62d38bcd8d86e9a41ab
+
+Upstream-Status: Backport
+CVE: CVE-2016-1238
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ cpan/Archive-Tar/bin/ptar                 | 1 +
+ cpan/Archive-Tar/bin/ptardiff             | 1 +
+ cpan/Archive-Tar/bin/ptargrep             | 1 +
+ cpan/CPAN/scripts/cpan                    | 1 +
+ cpan/Digest-SHA/shasum                    | 1 +
+ cpan/Encode/bin/enc2xs                    | 1 +
+ cpan/Encode/bin/encguess                  | 1 +
+ cpan/Encode/bin/piconv                    | 1 +
+ cpan/Encode/bin/ucmlint                   | 1 +
+ cpan/Encode/bin/unidump                   | 1 +
+ cpan/ExtUtils-MakeMaker/bin/instmodsh     | 1 +
+ cpan/IO-Compress/bin/zipdetails           | 1 +
+ cpan/JSON-PP/bin/json_pp                  | 1 +
+ cpan/Test-Harness/bin/prove               | 1 +
+ dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp | 1 +
+ dist/Module-CoreList/corelist             | 1 +
+ ext/Pod-Html/bin/pod2html                 | 1 +
+ utils/c2ph.PL                             | 1 +
+ utils/h2ph.PL                             | 2 ++
+ utils/h2xs.PL                             | 2 ++
+ utils/libnetcfg.PL                        | 1 +
+ utils/perlbug.PL                          | 1 +
+ utils/perldoc.PL                          | 5 ++++-
+ utils/perlivp.PL                          | 2 ++
+ utils/splain.PL                           | 6 ++++++
+ 25 files changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/cpan/Archive-Tar/bin/ptar b/cpan/Archive-Tar/bin/ptar
+index 0eaffa7..9dc6402 100644
+--- a/cpan/Archive-Tar/bin/ptar
++++ b/cpan/Archive-Tar/bin/ptar
+@@ -1,6 +1,7 @@
+ #!/usr/bin/perl
+ use strict;
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use File::Find;
+ use Getopt::Std;
+ use Archive::Tar;
+diff --git a/cpan/Archive-Tar/bin/ptardiff b/cpan/Archive-Tar/bin/ptardiff
+index 66bd859..4668fa6 100644
+--- a/cpan/Archive-Tar/bin/ptardiff
++++ b/cpan/Archive-Tar/bin/ptardiff
+@@ -1,5 +1,6 @@
+ #!/usr/bin/perl
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use Archive::Tar;
+ use Getopt::Std;
+diff --git a/cpan/Archive-Tar/bin/ptargrep b/cpan/Archive-Tar/bin/ptargrep
+index 1a320f1..8dc6b4f 100644
+--- a/cpan/Archive-Tar/bin/ptargrep
++++ b/cpan/Archive-Tar/bin/ptargrep
+@@ -4,6 +4,7 @@
+ # archive.  See 'ptargrep --help' for more documentation.
+ #
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use warnings;
+ 
+diff --git a/cpan/CPAN/scripts/cpan b/cpan/CPAN/scripts/cpan
+index 5f4320e..ccba47e 100644
+--- a/cpan/CPAN/scripts/cpan
++++ b/cpan/CPAN/scripts/cpan
+@@ -1,5 +1,6 @@
+ #!/usr/local/bin/perl
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use vars qw($VERSION);
+ 
+diff --git a/cpan/Digest-SHA/shasum b/cpan/Digest-SHA/shasum
+index 14ddd60..62a2b0e 100644
+--- a/cpan/Digest-SHA/shasum
++++ b/cpan/Digest-SHA/shasum
+@@ -13,6 +13,7 @@
+ 	## "-0" option for reading bit strings, and
+ 	## "-p" option for portable digests (to be deprecated).
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use warnings;
+ use Fcntl;
+diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
+index 4d64e38..473a15c 100644
+--- a/cpan/Encode/bin/enc2xs
++++ b/cpan/Encode/bin/enc2xs
+@@ -4,6 +4,7 @@ BEGIN {
+     # with $ENV{PERL_CORE} set
+     # In case we need it in future...
+     require Config; import Config;
++    pop @INC if $INC[-1] eq '.';
+ }
+ use strict;
+ use warnings;
+diff --git a/cpan/Encode/bin/encguess b/cpan/Encode/bin/encguess
+index 5d7ac80..0be5c7c 100644
+--- a/cpan/Encode/bin/encguess
++++ b/cpan/Encode/bin/encguess
+@@ -1,5 +1,6 @@
+ #!./perl
+ use 5.008001;
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use warnings;
+ use Encode;
+diff --git a/cpan/Encode/bin/piconv b/cpan/Encode/bin/piconv
+index c1dad9e..60b2a59 100644
+--- a/cpan/Encode/bin/piconv
++++ b/cpan/Encode/bin/piconv
+@@ -1,6 +1,7 @@
+ #!./perl
+ # $Id: piconv,v 2.7 2014/05/31 09:48:48 dankogai Exp $
+ #
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use 5.8.0;
+ use strict;
+ use Encode ;
+diff --git a/cpan/Encode/bin/ucmlint b/cpan/Encode/bin/ucmlint
+index 622376d..25e0d67 100644
+--- a/cpan/Encode/bin/ucmlint
++++ b/cpan/Encode/bin/ucmlint
+@@ -3,6 +3,7 @@
+ # $Id: ucmlint,v 2.2 2008/03/12 09:51:11 dankogai Exp $
+ #
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ our  $VERSION = do { my @r = (q$Revision: 2.2 $ =~ /\d+/g); sprintf "%d."."%02d" x $#r, @r };
+ 
+diff --git a/cpan/Encode/bin/unidump b/cpan/Encode/bin/unidump
+index ae0da30..f190827 100644
+--- a/cpan/Encode/bin/unidump
++++ b/cpan/Encode/bin/unidump
+@@ -1,5 +1,6 @@
+ #!./perl
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use Encode;
+ use Getopt::Std;
+diff --git a/cpan/ExtUtils-MakeMaker/bin/instmodsh b/cpan/ExtUtils-MakeMaker/bin/instmodsh
+index e551434..b3b109f 100644
+--- a/cpan/ExtUtils-MakeMaker/bin/instmodsh
++++ b/cpan/ExtUtils-MakeMaker/bin/instmodsh
+@@ -1,5 +1,6 @@
+ #!/usr/bin/perl -w
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use IO::File;
+ use ExtUtils::Packlist;
+diff --git a/cpan/IO-Compress/bin/zipdetails b/cpan/IO-Compress/bin/zipdetails
+index 0249850..1b9c70a 100644
+--- a/cpan/IO-Compress/bin/zipdetails
++++ b/cpan/IO-Compress/bin/zipdetails
+@@ -5,6 +5,7 @@
+ # Display info on the contents of a Zip file
+ #
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use warnings ;
+ 
+diff --git a/cpan/JSON-PP/bin/json_pp b/cpan/JSON-PP/bin/json_pp
+index df9d243..896cd2f 100644
+--- a/cpan/JSON-PP/bin/json_pp
++++ b/cpan/JSON-PP/bin/json_pp
+@@ -1,5 +1,6 @@
+ #!/usr/bin/perl
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use Getopt::Long;
+ 
+diff --git a/cpan/Test-Harness/bin/prove b/cpan/Test-Harness/bin/prove
+index 6637cc4..d71b238 100644
+--- a/cpan/Test-Harness/bin/prove
++++ b/cpan/Test-Harness/bin/prove
+@@ -1,5 +1,6 @@
+ #!/usr/bin/perl -w
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use warnings;
+ use App::Prove;
+diff --git a/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp b/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp
+index e2ac71a..d596cdf 100644
+--- a/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp
++++ b/dist/ExtUtils-ParseXS/lib/ExtUtils/xsubpp
+@@ -1,5 +1,6 @@
+ #!perl
+ use 5.006;
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ eval {
+   require ExtUtils::ParseXS;
+diff --git a/dist/Module-CoreList/corelist b/dist/Module-CoreList/corelist
+index aa4a945..bbe61cc 100644
+--- a/dist/Module-CoreList/corelist
++++ b/dist/Module-CoreList/corelist
+@@ -130,6 +130,7 @@ requested perl versions.
+ 
+ =cut
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use Module::CoreList;
+ use Getopt::Long qw(:config no_ignore_case);
+ use Pod::Usage;
+diff --git a/ext/Pod-Html/bin/pod2html b/ext/Pod-Html/bin/pod2html
+index b022859..7d1d232 100644
+--- a/ext/Pod-Html/bin/pod2html
++++ b/ext/Pod-Html/bin/pod2html
+@@ -216,6 +216,7 @@ This program is distributed under the Artistic License.
+ 
+ =cut
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use Pod::Html;
+ 
+ pod2html @ARGV;
+diff --git a/utils/c2ph.PL b/utils/c2ph.PL
+index 13389ec..cef0b5c 100644
+--- a/utils/c2ph.PL
++++ b/utils/c2ph.PL
+@@ -280,6 +280,7 @@ Anyway, here it is.  Should run on perl v4 or greater.  Maybe less.
+ 
+ $RCSID = '$Id: c2ph,v 1.7 95/10/28 10:41:47 tchrist Exp Locker: tchrist $';
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use File::Temp;
+ 
+ ######################################################################
+diff --git a/utils/h2ph.PL b/utils/h2ph.PL
+index 55c1f72..300b756 100644
+--- a/utils/h2ph.PL
++++ b/utils/h2ph.PL
+@@ -36,6 +36,8 @@ $Config{startperl}
+ 
+ print OUT <<'!NO!SUBS!';
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
++
+ use strict;
+ 
+ use Config;
+diff --git a/utils/h2xs.PL b/utils/h2xs.PL
+index 268f680..f95ee0c 100644
+--- a/utils/h2xs.PL
++++ b/utils/h2xs.PL
+@@ -35,6 +35,8 @@ $Config{startperl}
+ 
+ print OUT <<'!NO!SUBS!';
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
++
+ use warnings;
+ 
+ =head1 NAME
+diff --git a/utils/libnetcfg.PL b/utils/libnetcfg.PL
+index 59a2de8..26d2f99 100644
+--- a/utils/libnetcfg.PL
++++ b/utils/libnetcfg.PL
+@@ -97,6 +97,7 @@ Jarkko Hietaniemi, conversion into libnetcfg for inclusion into Perl 5.8.
+ 
+ # $Id: Configure,v 1.8 1997/03/04 09:22:32 gbarr Exp $
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use strict;
+ use IO::File;
+ use Getopt::Std;
+diff --git a/utils/perlbug.PL b/utils/perlbug.PL
+index 885785a..ae8c343 100644
+--- a/utils/perlbug.PL
++++ b/utils/perlbug.PL
+@@ -57,6 +57,7 @@ print OUT <<'!NO!SUBS!';
+ my @patches = Config::local_patches();
+ my $patch_tags = join "", map /(\S+)/ ? "+$1 " : (), @patches;
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
+ use warnings;
+ use strict;
+ use Config;
+diff --git a/utils/perldoc.PL b/utils/perldoc.PL
+index e201de9..cd60bd4 100644
+--- a/utils/perldoc.PL
++++ b/utils/perldoc.PL
+@@ -44,7 +44,10 @@ $Config{startperl}
+ # This "$file" file was generated by "$0"
+ 
+ require 5;
+-BEGIN { \$^W = 1 if \$ENV{'PERLDOCDEBUG'} }
++BEGIN {
++    \$^W = 1 if \$ENV{'PERLDOCDEBUG'};
++    pop \@INC if \$INC[-1] eq '.';
++}
+ use Pod::Perldoc;
+ exit( Pod::Perldoc->run() );
+ 
+diff --git a/utils/perlivp.PL b/utils/perlivp.PL
+index cc49f96..696a44e 100644
+--- a/utils/perlivp.PL
++++ b/utils/perlivp.PL
+@@ -39,6 +39,8 @@ print OUT "\n# perlivp $^V\n";
+ 
+ print OUT <<'!NO!SUBS!';
+ 
++BEGIN { pop @INC if $INC[-1] eq '.' }
++
+ sub usage {
+     warn "@_\n" if @_;
+     print << "    EOUSAGE";
+diff --git a/utils/splain.PL b/utils/splain.PL
+index 9c70b61..cae84a0 100644
+--- a/utils/splain.PL
++++ b/utils/splain.PL
+@@ -38,6 +38,12 @@ $Config{startperl}
+ 	if \$running_under_some_shell;
+ !GROK!THIS!
+ 
++print <<'!NO!SUBS!';
++
++BEGIN { pop @INC if $INC[-1] eq '.' }
++
++!NO!SUBS!
++
+ while (<IN>) {
+     print OUT unless /^package diagnostics/;
+ }
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index b904674..792a65b 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -68,6 +68,7 @@ SRC_URI += " \
         file://perl-fix-CVE-2016-2381.patch \
         file://perl-fix-CVE-2016-6185.patch \
         file://perl-fix-CVE-2015-8607.patch \
+        file://perl-fix-CVE-2016-1238.patch \
 "
 
 # Fix test case issues
-- 
2.8.1


