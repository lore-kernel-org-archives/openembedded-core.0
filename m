Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B72CD60685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:42:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L5gKTe003086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:42:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 22:42:19 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2016 13:38:54 +0800
Message-ID: <1474436335-8086-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/2] perl: fix CVE-2016-6185
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
X-List-Received-Date: Wed, 21 Sep 2016 05:42:21 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Backport patch to fix CVE-2016-6185 from perl upstream:
http://perl5.git.perl.org/perl.git/commitdiff/08e3451d7

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/perl/perl-fix-CVE-2016-6185.patch         | 127 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch
new file mode 100644
index 0000000..b4acb9b
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch
@@ -0,0 +1,127 @@
+From 7cedaa8bc2ca9e63369d0e2d4c4c23af9febb93a Mon Sep 17 00:00:00 2001
+From: Father Chrysostomos <sprout@cpan.org>
+Date: Sat, 2 Jul 2016 22:56:51 -0700
+Subject: [PATCH] perl: fix CVE-2016-6185
+MIME-Version: 1.0
+
+Don't let XSLoader load relative paths
+
+[rt.cpan.org #115808]
+
+The logic in XSLoader for determining the library goes like this:
+
+    my $c = () = split(/::/,$caller,-1);
+    $modlibname =~ s,[\\/][^\\/]+$,, while $c--;    # Q&D basename
+    my $file = "$modlibname/auto/$modpname/$modfname.bundle";
+
+(That last line varies by platform.)
+
+$caller is the calling package.  $modlibname is the calling file.  It
+removes as many path segments from $modlibname as there are segments
+in $caller.  So if you have Foo/Bar/XS.pm calling XSLoader from the
+Foo::Bar package, the $modlibname will end up containing the path in
+@INC where XS.pm was found, followed by "/Foo".  Usually the fallback
+to Dynaloader::bootstrap_inherit, which does an @INC search, makes
+things Just Work.
+
+But if our hypothetical Foo/Bar/XS.pm actually calls
+XSLoader::load from inside a string eval, then path ends up being
+"(eval 1)/auto/Foo/Bar/Bar.bundle".
+
+So if someone creates a directory named '(eval 1)' with a naughty
+binary file in it, it will be loaded if a script using Foo::Bar is run
+in the parent directory.
+
+This commit makes XSLoader fall back to Dynaloader's @INC search if
+the calling file has a relative path that is not found in @INC.
+
+Backport patch from http://perl5.git.perl.org/perl.git/commitdiff/08e3451d7
+
+Upstream-Status: Backport
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ dist/XSLoader/XSLoader_pm.PL | 25 +++++++++++++++++++++++++
+ dist/XSLoader/t/XSLoader.t   | 27 ++++++++++++++++++++++++++-
+ 2 files changed, 51 insertions(+), 1 deletion(-)
+
+diff --git a/dist/XSLoader/XSLoader_pm.PL b/dist/XSLoader/XSLoader_pm.PL
+index 668411d..778e46b 100644
+--- a/dist/XSLoader/XSLoader_pm.PL
++++ b/dist/XSLoader/XSLoader_pm.PL
+@@ -104,6 +104,31 @@ print OUT <<'EOT';
+     my $modpname = join('/',@modparts);
+     my $c = () = split(/::/,$caller,-1);
+     $modlibname =~ s,[\\/][^\\/]+$,, while $c--;    # Q&D basename
++    # Does this look like a relative path?
++    if ($modlibname !~ m|^[\\/]|) {
++        # Someone may have a #line directive that changes the file name, or
++        # may be calling XSLoader::load from inside a string eval.  We cer-
++        # tainly do not want to go loading some code that is not in @INC,
++        # as it could be untrusted.
++        #
++        # We could just fall back to DynaLoader here, but then the rest of
++        # this function would go untested in the perl core, since all @INC
++        # paths are relative during testing.  That would be a time bomb
++        # waiting to happen, since bugs could be introduced into the code.
++        #
++        # So look through @INC to see if $modlibname is in it.  A rela-
++        # tive $modlibname is not a common occurrence, so this block is
++        # not hot code.
++        FOUND: {
++            for (@INC) {
++                if ($_ eq $modlibname) {
++                    last FOUND;
++                }
++            }
++            # Not found.  Fall back to DynaLoader.
++            goto \&XSLoader::bootstrap_inherit;
++        }
++    }
+ EOT
+ 
+ my $dl_dlext = quotemeta($Config::Config{'dlext'});
+diff --git a/dist/XSLoader/t/XSLoader.t b/dist/XSLoader/t/XSLoader.t
+index 2ff11fe..1e86faa 100644
+--- a/dist/XSLoader/t/XSLoader.t
++++ b/dist/XSLoader/t/XSLoader.t
+@@ -33,7 +33,7 @@ my %modules = (
+     'Time::HiRes'=> q| ::can_ok( 'Time::HiRes' => 'usleep'  ) |,  # 5.7.3
+ );
+ 
+-plan tests => keys(%modules) * 3 + 9;
++plan tests => keys(%modules) * 3 + 10;
+ 
+ # Try to load the module
+ use_ok( 'XSLoader' );
+@@ -125,3 +125,28 @@ XSLoader::load("Devel::Peek");
+ EOS
+     or ::diag $@;
+ }
++
++SKIP: {
++  skip "File::Path not available", 1
++    unless eval { require File::Path };
++  my $name = "phooo$$";
++  File::Path::make_path("$name/auto/Foo/Bar");
++  open my $fh,
++    ">$name/auto/Foo/Bar/Bar.$Config::Config{'dlext'}";
++  close $fh;
++  my $fell_back;
++  local *XSLoader::bootstrap_inherit = sub {
++    $fell_back++;
++    # Break out of the calling subs
++    goto the_test;
++  };
++  eval <<END;
++#line 1 $name
++package Foo::Bar;
++XSLoader::load("Foo::Bar");
++END
++ the_test:
++  ok $fell_back,
++    'XSLoader will not load relative paths based on (caller)[1]';
++  File::Path::remove_tree($name);
++}
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index 04a2b6f..33cad9e 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -66,6 +66,7 @@ SRC_URI += " \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
         file://perl-fix-CVE-2016-2381.patch \
+        file://perl-fix-CVE-2016-6185.patch \
 "
 
 # Fix test case issues
-- 
2.8.1


