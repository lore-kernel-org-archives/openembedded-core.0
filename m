Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BB11465D7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:49:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2014 08:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,959,1389772800"; d="scan'208";a="523845884"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2014 08:39:45 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 18:39:32 +0300
Message-Id: <c82c47d18e3cbfba0ae0e86ef1bfe5adf5084d48.1398871949.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398871949.git.valentin.popa@intel.com>
References: <cover.1398871949.git.valentin.popa@intel.com>
In-Reply-To: <cover.1398871949.git.valentin.popa@intel.com>
References: <cover.1398871949.git.valentin.popa@intel.com>
Subject: [PATCH 2/3] gnutls: update to 3.2.13
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
X-List-Received-Date: Wed, 30 Apr 2014 15:49:36 -0000

Removes not needed or already merged patches.

Removes unused configure flags.
Tells gnutls to use the included libopts.

Removes libextra (not needed since 3.0.5).

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc             |  28 +-
 .../gnutls/gnutls/25_updatedgdocfrommaster.diff    | 636 ---------------------
 .../CVE-2014-0092-corrected-return-codes.patch     | 106 ----
 ...14-1959-rejection-of-v1-intermediate-cert.patch |  33 --
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |  51 --
 .../gnutls/gnutls/configure-fix.patch              |  65 ---
 .../correct_rpl_gettimeofday_signature.patch       |  36 +-
 .../gnutls/gnutls/fix-gettext-version.patch        |  46 --
 .../gnutls/gnutls/gnutls-openssl.patch             | 126 ----
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |  16 -
 meta/recipes-support/gnutls/gnutls_3.2.13.bb       |   7 +
 11 files changed, 42 insertions(+), 1108 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/configure-fix.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.23.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.2.13.bb

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 25ec3a6..b77b3e5 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,46 +1,42 @@
 SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
-
-INC_PR = "r8"
+DEPENDS = "zlib nettle"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
 LICENSE_${PN}-xx = "LGPLv2.1+"
 LICENSE_${PN}-bin = "GPLv3+"
-LICENSE_${PN}-extra = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://lib/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://libextra/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+                    file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
 inherit autotools-brokensep binconfig pkgconfig gettext lib_package
 
-EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
-              --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-libgcrypt --with-libgcrypt-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
+EXTRA_OECONF="--disable-rpath \
+              --with-included-libtasn1 \
+              --enable-local-libopts \
               --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libz-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-lzo --disable-guile \
+              --disable-guile \
               --without-p11-kit \
               "
+
 do_configure_prepend() {
-	for dir in . lib libextra; do
+	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
 }
 
-PACKAGES =+ "${PN}-openssl ${PN}-extra ${PN}-xx"
+PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
-FILES_${PN}-extra = "${libdir}/libgnutls-extra.so.*"
 FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
 
diff --git a/meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff b/meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
deleted file mode 100644
index 76108a0..0000000
--- a/meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
+++ /dev/null
@@ -1,636 +0,0 @@
-Description: Update gdoc script from gnutls master.
- This includes bef38b98c0536d81c0e4b2e78a9182e1df1d451c among other fixes:
- .
- [PATCH] Avoid depending on hash order in gdoc.
- .
- Previously, gdoc had a hash of regexp replacements for each output
- format, and applied the replacements in the order that "keys" returned
- for the hash. However, not all orders are safe -- and now that Perl 5.18
- randomises hash order per-process, it only worked sometimes!
-
-Bug-Debian: http://bugs.debian.org/724167
-
-Upstream-Status: Backport
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
---- gnutls26-2.12.23.orig/doc/scripts/gdoc
-+++ gnutls26-2.12.23/doc/scripts/gdoc
-@@ -1,4 +1,6 @@
--#!/usr/bin/perl
-+eval '(exit $?0)' && eval 'exec perl "$0" ${1+"$@"}'
-+  & eval 'exec perl "$0" $argv:q'
-+    if 0;
- 
- ## Copyright (c) 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 Simon Josefsson
- ##                    added -texinfo, -listfunc, -pkg-name
-@@ -7,6 +9,8 @@
- ## Copyright (c) 2001, 2002 Nikos Mavrogiannopoulos
- ##                    added -tex
- ## Copyright (c) 1998 Michael Zucchi
-+## Copyright (c) 2013 Adam Sampson
-+##                    made highlighting not depend on hash order, for Perl 5.18
- 
- # This program is free software: you can redistribute it and/or modify
- # it under the terms of the GNU General Public License as published by
-@@ -132,57 +136,59 @@
- use POSIX qw(strftime);
- 
- # match expressions used to find embedded type information
--$type_constant = "((?<!\")\\\%(\\w+))";
--$type_func = "(\\w+\\(\\))";
--$type_param = "\\\@(\\w+)";
--$type_struct = "\\\#(\\w+)";
--$type_env = "(\\\$\\w+)";
-+$type_constant = "\\\%([A-Za-z0-9_]+)";
-+$type_func = "([A-Za-z0-9_]+\\(\\))";
-+$type_param = '\@([A-Za-z0-9_]+)\s*';
-+$type_struct = "\\\#([A-Za-z0-9_]+)";
-+$type_env = "(\\\$[A-Za-z0-9_]+)";
- 
- 
- # Output conversion substitutions.
- #  One for each output format
- 
- # these work fairly well
--%highlights_html = ( $type_constant, "<i>\$2</i>",
--		     $type_func, "<b>\$1</b>",
--		     $type_struct, "<i>\$1</i>",
--		     $type_param, "<tt><b>\$1</b></tt>" );
-+@highlights_html = ( [$type_constant, '"<i>$1</i>"'],
-+		     [$type_func, '"<b>$1</b>"'],
-+		     [$type_struct, '"<i>$1</i>"'],
-+		     [$type_param, '" <tt><b>$1</b></tt> "'] );
- $blankline_html = "<p>";
- 
--%highlights_texinfo = ( $type_constant, "\\\@code{\$2}",
--			$type_func, "\\\@code{\$1}",
--			$type_struct, "\\\@code{\$1}",
--			$type_param, "\\\@code{\$1}" );
-+@highlights_texinfo = ( [$type_param, '" \@code{$1} "'],
-+			[$type_constant, '"\@code{$1} "'],
-+			[$type_func, '"\@code{$1} "'],
-+			[$type_struct, '"\@code{$1} "'],
-+			 );
- $blankline_texinfo = "";
- 
--%highlights_tex = ( $type_constant, "{\\\\it \$2}",
--		     $type_func, "{\\\\bf \$1}",
--		     $type_struct, "{\\\\it \$1}",
--		     $type_param, "{\\\\bf \$1}" );
-+@highlights_tex = ( [$type_param, '" {\\\bf $1} "'],
-+		[$type_constant, '"{\\\it $1}"'],
-+		[$type_func, '"{\\\bf $1}"'],
-+		[$type_struct, '"{\\\it $1}"'],
-+		      );
- $blankline_tex = "\\\\";
- 
- # sgml, docbook format
--%highlights_sgml = ( $type_constant, "<replaceable class=\"option\">\$2</replaceable>",
--		     $type_func, "<function>\$1</function>",
--		     $type_struct, "<structname>\$1</structname>",
--		     $type_env, "<envar>\$1</envar>",
--		     $type_param, "<parameter>\$1</parameter>" );
-+@highlights_sgml = ( [$type_constant, '"<replaceable class=\"option\">$1</replaceable>"'],
-+		     [$type_func, '"<function>$1</function>"'],
-+		     [$type_struct, '"<structname>$1</structname>"'],
-+		     [$type_env, '"<envar>$1</envar>"'],
-+		     [$type_param, '" <parameter>$1</parameter> "'] );
- $blankline_sgml = "</para><para>\n";
- 
- # these are pretty rough
--%highlights_man = ( $type_constant, "\\\\fB\$2\\\\fP",
--		    $type_func, "\\\\fB\$1\\\\fP",
--		    $type_struct, "\\\\fB\$1\\\\fP",
--		    $type_param, "\\\\fI\$1\\\\fP" );
-+@highlights_man = ( [$type_constant, '"\\\fB$1\\\fP"'],
-+		    [$type_func, '"\\\fB$1\\\fP"'],
-+		    [$type_struct, '"\\\fB$1\\\fP"'],
-+		    [$type_param, '" \\\fI$1\\\fP "'] );
- $blankline_man = "";
- 
- # text-mode
--%highlights_text = ( $type_constant, "\$2",
--		     $type_func, "\$1",
--		     $type_struct, "\$1",
--		     $type_param, "\$1" );
-+@highlights_text = ( [$type_constant, '"$1"'],
-+		     [$type_func, '"$1"'],
-+		     [$type_struct, '"$1"'],
-+		     [$type_param, '"$1 "'] );
- $blankline_text = "";
--
-+my $lineprefix = "";
- 
- sub usage {
-     print "Usage: $0 [ -v ] [ -docbook | -html | -text | -man | -tex | -texinfo  -listfunc ]\n";
-@@ -201,7 +207,7 @@ if ($#ARGV==-1) {
- 
- $verbose = 0;
- $output_mode = "man";
--%highlights = %highlights_man;
-+@highlights = @highlights_man;
- $blankline = $blankline_man;
- $modulename = "API Documentation";
- $sourceversion = strftime "%Y-%m-%d", localtime;
-@@ -210,27 +216,27 @@ while ($ARGV[0] =~ m/^-(.*)/) {
-     $cmd = shift @ARGV;
-     if ($cmd eq "-html") {
- 	$output_mode = "html";
--	%highlights = %highlights_html;
-+	@highlights = @highlights_html;
- 	$blankline = $blankline_html;
-     } elsif ($cmd eq "-man") {
- 	$output_mode = "man";
--	%highlights = %highlights_man;
-+	@highlights = @highlights_man;
- 	$blankline = $blankline_man;
-     } elsif ($cmd eq "-tex") {
- 	$output_mode = "tex";
--	%highlights = %highlights_tex;
-+	@highlights = @highlights_tex;
- 	$blankline = $blankline_tex;
-     } elsif ($cmd eq "-texinfo") {
- 	$output_mode = "texinfo";
--	%highlights = %highlights_texinfo;
-+	@highlights = @highlights_texinfo;
- 	$blankline = $blankline_texinfo;
-     } elsif ($cmd eq "-text") {
- 	$output_mode = "text";
--	%highlights = %highlights_text;
-+	@highlights = @highlights_text;
- 	$blankline = $blankline_text;
-     } elsif ($cmd eq "-docbook") {
- 	$output_mode = "sgml";
--	%highlights = %highlights_sgml;
-+	@highlights = @highlights_sgml;
- 	$blankline = $blankline_sgml;
-     } elsif ($cmd eq "-listfunc") {
- 	$output_mode = "listfunc";
-@@ -270,6 +276,8 @@ sub dump_section {
-     my $name = shift @_;
-     my $contents = join "\n", @_;
- 
-+    $name = " $name";
-+
-     if ($name =~ m/$type_constant/) {
- 	$name = $1;
- #	print STDERR "constant section '$1' = '$contents'\n";
-@@ -280,6 +288,7 @@ sub dump_section {
- 	$parameters{$name} = $contents;
-     } else {
- #	print STDERR "other section '$name' = '$contents'\n";
-+	$name =~ tr/ //d;
- 	$sections{$name} = $contents;
- 	push @sectionlist, $name;
-     }
-@@ -296,35 +305,15 @@ sub dump_section {
- #  sections => %descriont descriptions
- #  
- 
--sub repstr {
--    $pattern = shift;
--    $repl = shift;
--    $match1 = shift;
--    $match2 = shift;
--    $match3 = shift;
--    $match4 = shift;
--
--    $output = $repl;
--    $output =~ s,\$1,$match1,g;
--    $output =~ s,\$2,$match2,g;
--    $output =~ s,\$3,$match3,g;
--    $output =~ s,\$4,$match4,g;
--
--    eval "\$return = qq/$output/";
--
--#    print "pattern $pattern matched 1=$match1 2=$match2 3=$match3 4=$match4 replace $repl yielded $output interpolated $return\n";
--
--    $return;
--}
--
- sub just_highlight {
-     my $contents = join "\n", @_;
-     my $line;
-     my $ret = "";
- 
--    foreach $pattern (keys %highlights) {
--#	print "scanning pattern $pattern ($highlights{$pattern})\n";
--	$contents =~ s:$pattern:repstr($pattern, $highlights{$pattern}, $1, $2, $3, $4):gse;
-+    foreach $highlight (@highlights) {
-+	my ($pattern, $replace) = @$highlight;
-+	#print "scanning pattern $pattern ($replace)\n";
-+	$contents =~ s/$pattern/$replace/gees;
-     }
-     foreach $line (split "\n", $contents) {
- 	if ($line eq ""){
-@@ -370,13 +359,45 @@ sub output_texinfo {
- 	}
-     }
-     foreach $section (@{$args{'sectionlist'}}) {
-+	$section =~ s/\@//g;
- 	print "\n\@strong{$section:} " if $section ne $section_default;
--	$args{'sections'}{$section} =~ s:([{}]):\@\1:gs;
-+	$args{'sections'}{$section} =~ s:([{}]):\@$1:gs;
- 	output_highlight($args{'sections'}{$section});
-     }
-     print "\@end deftypefun\n\n";
- }
- 
-+sub output_enum_texinfo {
-+    my %args = %{$_[0]};
-+    my ($parameter, $section);
-+    my $count;
-+    my $name = $args{'enum'};
-+    my $param;
-+    my $param2;
-+    my $sec;
-+    my $check;
-+    my $type;
-+
-+    print "\n\@c $name\n";
-+    print "\@table \@code\n";
-+
-+    $check=0;
-+    foreach $parameter (@{$args{'parameterlist'}}) {
-+        $param1 = $parameter;
-+	$param1 =~ s/_/_\@-/g;
-+
-+	$check = 1;
-+	print "\@item ".$param1."\n";
-+#	print "\n";
-+
-+        $param2 = $args{'parameters'}{$parameter};
-+	$out = just_highlight($param2);
-+	chomp $out;
-+	print $out . "\n";
-+    }
-+    print "\@end table\n";
-+}
-+
- # output in html
- sub output_html {
-     my %args = %{$_[0]};
-@@ -428,7 +449,9 @@ sub output_tex {
- 
-     $func =~ s/_/\\_/g;
- 
--    print "\n\n\\subsection{". $func . "}\n\\label{" . $args{'function'} . "}\n";
-+    print "\n\n\\begin{function}\n";
-+    print "\\functionTitle{". $func . "}\n";
-+    print "\\index{". $func . "}\n";
- 
-     $type = $args{'functiontype'};
-     $type =~ s/_/\\_/g;
-@@ -451,9 +474,8 @@ sub output_tex {
-     }
-     print ")\n";
- 
--    print "\n{\\large{Arguments}}\n";
-+    print "\n\\begin{functionArguments}\n";
- 
--    print "\\begin{itemize}\n";
-     $check=0;
-     foreach $parameter (@{$args{'parameterlist'}}) {
-         $param1 = $args{'parametertypes'}{$parameter};
-@@ -462,11 +484,12 @@ sub output_tex {
- 	$param2 =~ s/_/\\_/g;
- 
- 	$check = 1;
--	print "\\item {\\it ".$param1."} {\\bf ".$param2."}: \n";
-+	print "\\functionArgument {\\it ".$param1."} {\\bf ".$param2."}: \n";
- #	print "\n";
- 
- 	$param3 = $args{'parameters'}{$parameter};
--	$param3 =~ s/#([a-zA-Z\_]+)/{\\it \1}/g;
-+	$param3 =~ s/\#([a-zA-Z\_]+)/{\\it $1}/g;
-+	$param3 =~ s/\%([a-zA-Z\_]+)/{\\bf $1}/g;
- 
- 	$out = just_highlight($param3);
- 	$out =~ s/_/\\_/g;
-@@ -475,31 +498,72 @@ sub output_tex {
-     if ($check==0) {
- 	print "\\item void\n";
-     }
--    print "\\end{itemize}\n";
-+    print "\\end{functionArguments}\n";
- 
-     foreach $section (@{$args{'sectionlist'}}) {
- 	$sec = $section;
- 	$sec =~ s/_/\\_/g;
--	$sec =~ s/#([a-zA-Z\_]+)/{\\it \1}/g;
-+	$sec =~ s/#([a-zA-Z\_]+)/{\\it $1}/g;
- 
--	print "\n{\\large{$sec}}\\\\\n";
--	print "\\begin{rmfamily}\n";
-+	print "\n\\begin{function${sec}}\n";
-+	$out = $args{'sections'}{$section};
- 
--	$sec = $args{'sections'}{$section};
--	$sec =~ s/\\:/:/g;
--	$sec =~ s/#([a-zA-Z\_]+)/{\\it \1}/g;
--	$sec =~ s/->/\$\\rightarrow\$/g;
--	$sec =~ s/([0-9]+)\^([0-9]+)/\$\{\1\}\^\{\2\}\$/g;
--
--	$out = just_highlight($sec);
--	$out =~ s/_/\\_/g;
-+	$out =~ s/\#([a-zA-Z\_]+)/{\\it $1}/g;
-+	$out =~ s/\%([a-zA-Z\_]+)/{\\bf $1}/g;
-+	$out =~ s/\@([a-zA-Z\_]+)/{\\bf $1}/g;
-+	$out =~ s/_/\\_\\-/g;
-+        $out =~ s/\$/\\\$/g;
-+	$out =~ s/#/\\#/g;
-+	$out =~ s/\n\n/\n/g;
-+	$out =~ s/\\:/:/g;
-+	$out =~ s/\-\>/\$\\rightarrow\$/g;
-+	$out =~ s/([0-9]+)\^([0-9]+)/\$\{$1\}\^\{$2\}\$/g;
- 
- 	print $out;
--	print "\\end{rmfamily}\n";
-+	print "\\end{function${sec}}\n";
-     }
--    print "\n";
-+    print "\\end{function}\n\n";
- }
- 
-+sub output_enum_tex {
-+    my %args = %{$_[0]};
-+    my ($parameter, $section);
-+    my $count;
-+    my $name = $args{'enum'};
-+    my $param;
-+    my $param2;
-+    my $sec;
-+    my $check;
-+    my $type;
-+
-+    print "\n\n\\begin{enum}\n";
-+    $name =~ s/_/\\_/g;
-+    print "\\enumTitle{". $name . "}\n";
-+    print "\\index{". $name . "}\n";
-+
-+    print "\n\\begin{enumList}\n";
-+
-+    $check=0;
-+    foreach $parameter (@{$args{'parameterlist'}}) {
-+        $param1 = $parameter;
-+	$param1 =~ s/_/\\_\\-/g;
-+
-+	$check = 1;
-+	print "\\enumElement{".$param1."}{";
-+#	print "\n";
-+
-+        $param2 = $args{'parameters'}{$parameter};
-+	$param2 =~ s/\#([a-zA-Z\_]+)/{\\it $1}/g;
-+	$param2 =~ s/\%([a-zA-Z\_]+)/{\\bf $1}/g;
-+	$out = just_highlight($param2);
-+	$out =~ s/_/\\_/g;
-+	chomp $out;
-+	print $out . "}\n";
-+    }
-+    print "\\end{enumList}\n";
-+
-+    print "\\end{enum}\n\n";
-+}
- 
- # output in sgml DocBook
- sub output_sgml {
-@@ -639,11 +703,14 @@ sub output_man {
-     if ($args{'bugsto'}) {
- 	print ".SH \"REPORTING BUGS\"\n";
- 	print "Report bugs to <". $args{'bugsto'} . ">.\n";
-+        print ".br\n";
-+	print "General guidelines for reporting bugs: http://www.gnu.org/gethelp/\n";
-+        print ".br\n";
- 	if ($args{'pkgname'}) {
- 	    print $args{'pkgname'} . " home page: " .
- 		"http://www.gnu.org/software/" . $args{'module'} . "/\n";
- 	}
--	print "General help using GNU software: http://www.gnu.org/gethelp/\n";
-+	print "\n";
-     }
- 
-     if ($args{'copyright'}) {
-@@ -670,6 +737,10 @@ sub output_man {
- 	print ".B info " . $args{'seeinfo'} . "\n";
- 	print ".PP\n";
- 	print "should give you access to the complete manual.\n";
-+	print "As an alternative you may obtain the manual from:\n";
-+	print ".IP\n";
-+	print ".B http://www.gnu.org/software/" . $args{'module'} . "/manual/\n";
-+	print ".PP\n";
-     }
- }
- 
-@@ -705,6 +776,10 @@ sub output_function {
-     eval "output_".$output_mode."(\@_);";
- }
- 
-+sub output_enum {
-+    eval "output_enum_".$output_mode."(\@_);";
-+}
-+
- 
- ##
- # takes a function prototype and spits out all the details
-@@ -744,7 +819,7 @@ sub dump_function {
- #	    print STDERR " :> @args\n";
- 	    $type = join " ", @args;
- 
--	    if ($parameters{$param} eq "" && $param != "void") {
-+	    if ((!defined($parameters{$param}) || $parameters{$param} eq "") && $param ne "void") {
- 		$parameters{$param} = "-- undescribed --";
- 		print STDERR "warning: $lineno: Function parameter '$param' not described in '$function_name'\n";
- 	    }
-@@ -781,6 +856,56 @@ sub dump_function {
-     }
- }
- 
-+sub dump_enum {
-+    my $prototype = shift @_;
-+
-+    if (($prototype =~ m/^\s*typedef\s+enum\s*[a-zA-Z0-9_~:]*\s*\{([\-a-zA-Z0-9_~=,:\s\(\)\<]+)\s*\}\s*([a-zA-Z0-9_]+);.*/)) {
-+#        || $prototype =~ m/^\s*enum\s+([a-zA-Z0-9_~:]+).*/) {
-+        $args = $1;
-+	$name = $2;
-+
-+	foreach $arg (split ',', $args) {
-+	    # strip leading/trailing spaces
-+	    $arg =~ s/^\s*//;
-+	    $arg =~ s/\s*$//;
-+	    $arg =~ s/([A-Za-z0-9_]+)\s*=.*/$1/g;
-+#	    print STDERR "SCAN ARG: '$arg'\n";
-+
-+            next if $arg eq '';
-+	    if ((!defined($parameters{$arg}) || $parameters{$arg} eq "")) {
-+		$parameters{$arg} = "-- undescribed --";
-+		print STDERR "warning: $lineno: Enumeration parameter '$arg' not described in '$name'\n";
-+	    }
-+
-+	    push @parameterlist, $arg;
-+
-+#	    print STDERR "param = '$arg'\n";
-+	}
-+    } else {
-+#	print STDERR "warning: $lineno: Cannot understand enumeration: '$prototype'\n";
-+	return;
-+    }
-+
-+    output_enum({'enum' => $name,
-+			 'module' => $modulename,
-+			 'sourceversion' => $sourceversion,
-+			 'include' => $include,
-+			 'includefuncprefix' => $includefuncprefix,
-+			 'bugsto' => $bugsto,
-+			 'pkgname' => $pkgname,
-+			 'copyright' => $copyright,
-+			 'verbatimcopying' => $verbatimcopying,
-+			 'seeinfo' => $seeinfo,
-+			 'functiontype' => $return_type,
-+			 'parameterlist' => \@parameterlist,
-+			 'parameters' => \%parameters,
-+			 'parametertypes' => \%parametertypes,
-+			 'sectionlist' => \@sectionlist,
-+			 'sections' => \%sections,
-+			 'purpose' => $function_purpose
-+			 });
-+}
-+
- ######################################################################
- # main
- # states
-@@ -797,7 +922,7 @@ $doc_start = "^/\\*\\*\$";
- $doc_end = "\\*/";
- $doc_com = "\\s*\\*\\s*";
- $doc_func = $doc_com."(\\w+):?";
--$doc_sect = $doc_com."([".$doc_special."[:upper:]][\\w ]+):\\s*(.*)";
-+$doc_sect = $doc_com."([".$doc_special."[:upper:]][\\w]+):\\s*(.*)";
- $doc_content = $doc_com."(.*)";
- 
- %constants = ();
-@@ -809,6 +934,7 @@ $doc_content = $doc_com."(.*)";
- $contents = "";
- $section_default = "Description";	# default section
- $section = $section_default;
-+$enum = 0;
- 
- $lineno = 0;
- foreach $file (@ARGV) {
-@@ -816,18 +942,21 @@ foreach $file (@ARGV) {
- 	print STDERR "Error: Cannot open file $file\n";
- 	next;
-     }
--    while (<IN>) {
-+    while ($line = <IN>) {
- 	$lineno++;
- 
- 	if ($state == 0) {
--	    if (/$doc_start/o) {
-+	    if ($line =~ /$doc_start/o) {
- 		$state = 1;		# next line is always the function name
-+#	    print STDERR "XXX: start of doc comment\n";
- 	    }
- 	} elsif ($state == 1) {	# this line is the function name (always)
--	    if (/$doc_func/o) {
-+	    if ($line =~ /$doc_func/o) {
- 		$function = $1;
- 		$state = 2;
--		if (/-\s*(.*)/) {
-+#	    print STDERR "XXX: start of doc comment, looking for prototype\n";
-+
-+		if ($line =~ /-\s*(.*)/) {
- 		    $function_purpose = $1;
- 		} else {
- 		    $function_purpose = "";
-@@ -841,11 +970,11 @@ foreach $file (@ARGV) {
- 		$state = 0;
- 	    }
- 	} elsif ($state == 2) {	# look for head: lines, and include content
--	    if (/$doc_sect/o) {
-+	    if ($line =~ /$doc_sect/o) {
- 		$newsection = $1;
- 		$newcontents = $2;
- 
--		if ($contents ne "") {
-+		if ($contents ne '') {
- 		    dump_section($section, $contents);
- 		    $section = $section_default;
- 		}
-@@ -855,7 +984,7 @@ foreach $file (@ARGV) {
- 		    $contents .= "\n";
- 		}
- 		$section = $newsection;
--	    } elsif (/$doc_end/) {
-+	    } elsif ($line =~ /$doc_end/) {
- 
- 		if ($contents ne "") {
- 		    dump_section($section, $contents);
-@@ -863,13 +992,12 @@ foreach $file (@ARGV) {
- 		    $contents = "";
- 		}
- 
--#	    print STDERR "end of doc comment, looking for prototype\n";
- 		$prototype = "";
- 		$state = 3;
--	    } elsif (/$doc_content/) {
-+	    } elsif ($line =~ /$doc_content/) {
- 		# miguel-style comment kludge, look for blank lines after
- 		# @parameter line to signify start of description
--		if ($1 eq "" && $section =~ m/^@/) {
-+		if ($1 eq '' && $section =~ m/^@/) {
- 		    dump_section($section, $contents);
- 		    $section = $section_default;
- 		    $contents = "";
-@@ -881,13 +1009,16 @@ foreach $file (@ARGV) {
- 		print STDERR "warning: $lineno: Bad line: $_";
- 	    }
- 	} elsif ($state == 3) {	# scanning for function { (end of prototype)
--	    if (m#\s*/\*\s+MACDOC\s*#io) {
-+	    if ($line =~ m#\s*/\*\s+MACDOC\s*#io) {
- 	      # do nothing
- 	    }
--	    elsif (/([^\{]*)/) {
-+	    elsif ($enum == 1 && $line =~ /(^\s*\{).*/) {
-+		$prototype .= "{";
-+	    }
-+	    elsif ($line =~ /([^\{]*)/) {
- 		$prototype .= $1;
- 	    }
--	    if (/\{/) {
-+	    if ($enum == 0 && $line =~ /\{/) {
- 		$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
- 		$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
- 		$prototype =~ s@^ +@@gos; # strip leading spaces
-@@ -901,9 +1032,32 @@ foreach $file (@ARGV) {
- 		%sections = ();
- 		@sectionlist = ();
- 		$prototype = "";
-+		$enum = 0;
- 
- 		$state = 0;
- 	    }
-+	    elsif ($enum == 1 && $line =~ /\}/) {
-+		$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
-+		$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
-+		$prototype =~ s@^ +@@gos; # strip leading spaces
-+		dump_enum($prototype);
-+
-+		$function = "";
-+		%constants = ();
-+		%parameters = ();
-+		%parametertypes = ();
-+		@parameterlist = ();
-+		%sections = ();
-+		@sectionlist = ();
-+		$prototype = "";
-+		$enum = 0;
-+
-+		$state = 0;
-+	    }
-+	    elsif ($line =~ /([a-zA-Z\s]+)enum(.*)$/) {
-+	        $enum = 1;
-+	    }
-+    
- 	}
-     }
- }
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch b/meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
deleted file mode 100644
index 68ee5bc..0000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 6aa26f78150ccbdf0aec1878a41c17c41d358a3b Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
-Date: Thu, 27 Feb 2014 19:42:26 +0100
-Subject: [PATCH 1/3] corrected return codes
-
-Upstream-Status: Backport
-
-Signed-off-by: Karl Hiramoto <karl@hiramoto.org>
-
----
- lib/x509/verify.c | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/lib/x509/verify.c b/lib/x509/verify.c
-index c9a6b0d..eef85a8 100644
---- a/lib/x509/verify.c
-+++ b/lib/x509/verify.c
-@@ -141,7 +141,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
-   if (result < 0)
-     {
-       gnutls_assert ();
--      goto cleanup;
-+      goto fail;
-     }
- 
-   result =
-@@ -150,7 +150,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
-   if (result < 0)
-     {
-       gnutls_assert ();
--      goto cleanup;
-+      goto fail;
-     }
- 
-   result =
-@@ -158,7 +158,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
-   if (result < 0)
-     {
-       gnutls_assert ();
--      goto cleanup;
-+      goto fail;
-     }
- 
-   result =
-@@ -166,7 +166,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
-   if (result < 0)
-     {
-       gnutls_assert ();
--      goto cleanup;
-+      goto fail;
-     }
- 
-   /* If the subject certificate is the same as the issuer
-@@ -206,6 +206,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
-   else
-     gnutls_assert ();
- 
-+fail:
-   result = 0;
- 
- cleanup:
-@@ -330,7 +331,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
-   gnutls_datum_t cert_signed_data = { NULL, 0 };
-   gnutls_datum_t cert_signature = { NULL, 0 };
-   gnutls_x509_crt_t issuer = NULL;
--  int issuer_version, result;
-+  int issuer_version, result = 0;
- 
-   if (output)
-     *output = 0;
-@@ -363,7 +364,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
-   if (issuer_version < 0)
-     {
-       gnutls_assert ();
--      return issuer_version;
-+      return 0;
-     }
- 
-   if (!(flags & GNUTLS_VERIFY_DISABLE_CA_SIGN) &&
-@@ -385,6 +386,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
-   if (result < 0)
-     {
-       gnutls_assert ();
-+      result = 0;
-       goto cleanup;
-     }
- 
-@@ -393,6 +395,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
-   if (result < 0)
-     {
-       gnutls_assert ();
-+      result = 0;
-       goto cleanup;
-     }
- 
-@@ -410,6 +413,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
-   else if (result < 0)
-     {
-       gnutls_assert();
-+      result = 0;
-       goto cleanup;
-     }
- 
--- 
-1.8.3.2
-
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch b/meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch
deleted file mode 100644
index 6567257..0000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 467478d8ff08a3cb4be3034ff04c9d08a0ceba3e Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@redhat.com>
-Date: Wed, 12 Feb 2014 16:41:33 +0100
-Subject: [PATCH 1/5] Fixed bug that prevented the rejection of v1 intermediate
- CA certificates.
-
-Upstream-Status: Backport
-
-Signed-off-by: Karl Hiramoto <karl@hiramoto.org>
-
----
- lib/x509/verify.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/x509/verify.c b/lib/x509/verify.c
-index 2efcebf..c9a6b0d 100644
---- a/lib/x509/verify.c
-+++ b/lib/x509/verify.c
-@@ -645,7 +645,10 @@ _gnutls_x509_verify_certificate (const gnutls_x509_crt_t * certificate_list,
-        * certificates can exist in a supplied chain.
-        */
-       if (!(flags & GNUTLS_VERIFY_ALLOW_ANY_X509_V1_CA_CRT))
--        flags &= ~(GNUTLS_VERIFY_ALLOW_X509_V1_CA_CRT);
-+        {
-+          flags &= ~(GNUTLS_VERIFY_ALLOW_X509_V1_CA_CRT);
-+          flags |= GNUTLS_VERIFY_DO_NOT_ALLOW_X509_V1_CA_CRT;
-+        }
-       if ((ret =
-            _gnutls_verify_certificate2 (certificate_list[i - 1],
-                                         &certificate_list[i], 1, flags,
--- 
-1.8.3.2
-
diff --git a/meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
deleted file mode 100644
index 479596e..0000000
--- a/meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Upstream-Status: Inappropriate 
-
-automake 1.12.x has deprecated AM_PROG_MKDIR_P , and throws a warning for that,
-and the warnings are treated as errors because of the -Werror parameter.
-
-These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not 
-eliminated these deprecated macros yet. So disable the treatment of warnings
-as errors until gettext is updated to remove the deprecated macros.
-
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/09
-
-Index: gnutls-2.12.19/configure.ac
-===================================================================
---- gnutls-2.12.19.orig/configure.ac
-+++ gnutls-2.12.19/configure.ac
-@@ -26,7 +26,7 @@ AC_INIT([GnuTLS], [2.12.19], [bug-gnutls
- AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
- 
--AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Werror -Wno-override])
-+AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- AM_CONFIG_HEADER(config.h)
- 
-Index: gnutls-2.12.19/lib/configure.ac
-===================================================================
---- gnutls-2.12.19.orig/lib/configure.ac
-+++ gnutls-2.12.19/lib/configure.ac
-@@ -26,7 +26,7 @@ AC_INIT([libgnutls], [2.12.19], [bug-gnu
- AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
- 
--AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
-+AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- AM_CONFIG_HEADER(config.h)
- 
-Index: gnutls-2.12.19/libextra/configure.ac
-===================================================================
---- gnutls-2.12.19.orig/libextra/configure.ac
-+++ gnutls-2.12.19/libextra/configure.ac
-@@ -26,7 +26,7 @@ AC_INIT([libgnutls-extra], [2.12.19], [b
- AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
- 
--AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
-+AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- AM_CONFIG_HEADER(config.h)
- 
diff --git a/meta/recipes-support/gnutls/gnutls/configure-fix.patch b/meta/recipes-support/gnutls/gnutls/configure-fix.patch
deleted file mode 100644
index 14f87e0..0000000
--- a/meta/recipes-support/gnutls/gnutls/configure-fix.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-rebased from original configure_madness.patch
-
-libtasn1 provides an .pc file in upstream,
-and a libgcrypt.pc is added in libgcrypt recipe,
-so use Requires.private for these two.
-
-against 2.8.6
-
-07/02/2010 - qhe
-
----
-Index: gnutls-2.12.11/lib/configure.ac
-===================================================================
---- gnutls-2.12.11.orig/lib/configure.ac
-+++ gnutls-2.12.11/lib/configure.ac
-@@ -126,8 +126,8 @@ lgl_INIT
- AC_CHECK_FUNCS(getrusage,,)
- AC_LIB_HAVE_LINKFLAGS(pthread,, [#include <pthread.h>], [pthread_mutex_lock (0);])
- 
--LIBGNUTLS_LIBS="-L${libdir} -lgnutls $LIBS"
--LIBGNUTLS_CFLAGS="-I${includedir}"
-+LIBGNUTLS_LIBS="-lgnutls $LIBS"
-+LIBGNUTLS_CFLAGS=""
- AC_SUBST(LIBGNUTLS_LIBS)
- AC_SUBST(LIBGNUTLS_CFLAGS)
- 
-Index: gnutls-2.12.11/lib/gnutls.pc.in
-===================================================================
---- gnutls-2.12.11.orig/lib/gnutls.pc.in
-+++ gnutls-2.12.11/lib/gnutls.pc.in
-@@ -20,6 +20,4 @@ Description: Transport Security Layer im
- URL: http://www.gnu.org/software/gnutls/
- Version: @VERSION@
- Libs: -L${libdir} -lgnutls
--Libs.private: @LTLIBGCRYPT@ @LTLIBNETTLE@ @NETTLE_LIBS@ @GNUTLS_ZLIB_LIBS_PRIVATE@
--@GNUTLS_REQUIRES_PRIVATE@
- Cflags: -I${includedir}
-Index: gnutls-2.12.11/libextra/configure.ac
-===================================================================
---- gnutls-2.12.11.orig/libextra/configure.ac
-+++ gnutls-2.12.11/libextra/configure.ac
-@@ -41,8 +41,8 @@ LIBGNUTLS_EXTRA_HOOKS
- 
- xgl_INIT
- 
--LIBGNUTLS_EXTRA_LIBS="-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
--LIBGNUTLS_EXTRA_CFLAGS="-I${includedir}"
-+LIBGNUTLS_EXTRA_LIBS="-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
-+LIBGNUTLS_EXTRA_CFLAGS=""
- AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
- AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
- 
-Index: gnutls-2.12.11/libextra/gnutls-extra.pc.in
-===================================================================
---- gnutls-2.12.11.orig/libextra/gnutls-extra.pc.in
-+++ gnutls-2.12.11/libextra/gnutls-extra.pc.in
-@@ -22,5 +22,5 @@ URL: http://www.gnu.org/software/gnutls/
- Requires: gnutls
- Version: @VERSION@
- Libs: -L${libdir} -lgnutls-extra
--Libs.private: @LIBGNUTLS_EXTRA_LIBS@
-+Libs.private: -llzo2
- Cflags: -I${includedir}
diff --git a/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
index b8f0d72..5e452c5 100644
--- a/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
+++ b/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
@@ -1,3 +1,8 @@
+From ae3370788ed3447bba16969d9eb1bf1b9631e1b7 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Fri, 25 Apr 2014 13:58:55 +0300
+Subject: [PATCH] Correct rpl_gettimeofday signature
+
 Currently we fail on uclibc like below
 
 | In file included from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
@@ -14,7 +19,6 @@ Currently we fail on uclibc like below
 | make[4]: *** [ex-cxx.o] Error 1
 | make[4]: *** Waiting for unfinished jobs....
 
-
 GCC detects that we call 'restrict' as param name in function
 signatures and complains since both params are called 'restrict'
 therefore we use __restrict to denote the C99 keywork
@@ -25,14 +29,17 @@ eglibc otherwise we will have same issue there too
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
+---
+ gl/sys_time.in.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: gnutls-2.12.14/gl/sys_time.in.h
-===================================================================
---- gnutls-2.12.14.orig/gl/sys_time.in.h	2012-01-15 10:54:39.517285351 -0800
-+++ gnutls-2.12.14/gl/sys_time.in.h	2012-01-15 10:59:23.773299108 -0800
-@@ -82,20 +82,20 @@
- #    define gettimeofday rpl_gettimeofday
- #   endif
+diff --git a/gl/sys_time.in.h b/gl/sys_time.in.h
+index 84a17c9..6ceadc3 100644
+--- a/gl/sys_time.in.h
++++ b/gl/sys_time.in.h
+@@ -93,20 +93,20 @@ struct timeval
+ #   define gettimeofday rpl_gettimeofday
+ #  endif
  _GL_FUNCDECL_RPL (gettimeofday, int,
 -                  (struct timeval *restrict, void *restrict)
 +                  (struct timeval *__restrict, void *__restrict)
@@ -40,18 +47,21 @@ Index: gnutls-2.12.14/gl/sys_time.in.h
  _GL_CXXALIAS_RPL (gettimeofday, int,
 -                  (struct timeval *restrict, void *restrict));
 +                  (struct timeval *__restrict, void *__restrict));
- #  else
- #   if !@HAVE_GETTIMEOFDAY@
+ # else
+ #  if !@HAVE_GETTIMEOFDAY@
  _GL_FUNCDECL_SYS (gettimeofday, int,
 -                  (struct timeval *restrict, void *restrict)
 +                  (struct timeval *__restrict, void *__restrict)
                    _GL_ARG_NONNULL ((1)));
- #   endif
+ #  endif
  /* Need to cast, because on glibc systems, by default, the second argument is
                                                    struct timezone *.  */
  _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
 -                       (struct timeval *restrict, void *restrict));
 +                       (struct timeval *__restrict, void *__restrict));
- #  endif
+ # endif
  _GL_CXXALIASWARN (gettimeofday);
- # elif defined GNULIB_POSIXCHECK
+ #elif defined GNULIB_POSIXCHECK
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch
deleted file mode 100644
index 4c9137a..0000000
--- a/meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: gnutls-2.12.14/lib/po/Makefile.in.in
-===================================================================
---- gnutls-2.12.14.orig/lib/po/Makefile.in.in
-+++ gnutls-2.12.14/lib/po/Makefile.in.in
-@@ -8,8 +8,8 @@
- # Please note that the actual code of GNU gettext is covered by the GNU
- # General Public License and is *not* in the public domain.
- #
--# Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+# Origin: gettext-0.18
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
-Index: gnutls-2.12.14/lib/m4/po.m4
-===================================================================
---- gnutls-2.12.14.orig/lib/m4/po.m4
-+++ gnutls-2.12.14/lib/m4/po.m4
-@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
- 
-   dnl Release version of the gettext macros. This is used to ensure that
-   dnl the gettext macros and po/Makefile.in.in are in sync.
--  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
-+  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
- 
-   dnl Perform the following tests also if --disable-nls has been given,
-   dnl because they are needed for "make dist" to work.
-Index: gnutls-2.12.14/lib/configure.ac
-===================================================================
---- gnutls-2.12.14.orig/lib/configure.ac
-+++ gnutls-2.12.14/lib/configure.ac
-@@ -39,7 +39,7 @@ AC_PROG_LIBTOOL
- LIBGNUTLS_HOOKS
- 
- AM_GNU_GETTEXT([external])
--AM_GNU_GETTEXT_VERSION([0.17])
-+AM_GNU_GETTEXT_VERSION([0.18])
- 
- AC_C_BIGENDIAN
- 
diff --git a/meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch
deleted file mode 100644
index ef70674..0000000
--- a/meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-Upstream-Status: Backport
-
-Index: gnutls-1.6.0/libextra/gnutls_openssl.c
-===================================================================
---- gnutls-1.6.0.orig/libextra/gnutls_openssl.c	2006-08-13 22:34:09.000000000 +0200
-+++ gnutls-1.6.0/libextra/gnutls_openssl.c	2006-12-12 15:07:59.002227000 +0100
-@@ -256,12 +256,17 @@
-   ssl->rfd = (gnutls_transport_ptr_t) - 1;
-   ssl->wfd = (gnutls_transport_ptr_t) - 1;
- 
-+  ssl->ssl_peek_buffer = NULL;
-+  ssl->ssl_peek_buffer_size = ssl->ssl_peek_avail = 0;
-+
-   return ssl;
- }
- 
- void
- SSL_free (SSL * ssl)
- {
-+  if (ssl->ssl_peek_buffer)
-+    free(ssl->ssl_peek_buffer);
-   gnutls_certificate_free_credentials (ssl->gnutls_cred);
-   gnutls_deinit (ssl->gnutls_state);
-   free (ssl);
-@@ -285,6 +290,7 @@
- SSL_set_fd (SSL * ssl, int fd)
- {
-   gnutls_transport_set_ptr (ssl->gnutls_state, GNUTLS_INT_TO_POINTER (fd));
-+  ssl->rfd = ssl->wfd = fd;
-   return 1;
- }
- 
-@@ -310,6 +316,17 @@
-   return 1;
- }
- 
-+int SSL_get_rfd(SSL *ssl)
-+{
-+  return ssl->rfd;
-+}
-+
-+int SSL_get_wfd(SSL *ssl)
-+{
-+  return ssl->wfd;
-+}
-+
-+
- void
- SSL_set_bio (SSL * ssl, BIO * rbio, BIO * wbio)
- {
-@@ -325,6 +342,8 @@
- int
- SSL_pending (SSL * ssl)
- {
-+  if (ssl->ssl_peek_avail)
-+    return ssl->ssl_peek_avail;
-   return gnutls_record_check_pending (ssl->gnutls_state);
- }
- 
-@@ -480,11 +499,50 @@
-   return 1;
- }
- 
-+int SSL_peek(SSL *ssl, void *buf, int len)
-+{
-+  if (len > ssl->ssl_peek_buffer_size) {
-+    ssl->ssl_peek_buffer = realloc (ssl->ssl_peek_buffer, len);
-+    ssl->ssl_peek_buffer_size = len;
-+  }
-+
-+  if (ssl->ssl_peek_avail == 0) {
-+
-+    int ret;
-+    
-+    ret = gnutls_record_recv(ssl->gnutls_state, ssl->ssl_peek_buffer, len);
-+    ssl->last_error = ret;
-+    
-+    if (ret > 0)
-+      ssl->ssl_peek_avail += ret;
-+  }
-+
-+  if (len > ssl->ssl_peek_avail)
-+    len = ssl->ssl_peek_avail;
-+
-+  memcpy (buf, ssl->ssl_peek_buffer, len);
-+
-+  return len;
-+}
-+
- int
- SSL_read (SSL * ssl, void *buf, int len)
- {
-   int ret;
- 
-+  if (ssl->ssl_peek_avail) {
-+    int n = (ssl->ssl_peek_avail > len) ? len : ssl->ssl_peek_avail;
-+
-+    memcpy (buf, ssl->ssl_peek_buffer, n);
-+
-+    if (ssl->ssl_peek_avail > n)
-+      memmove (ssl->ssl_peek_buffer, ssl->ssl_peek_buffer + n, ssl->ssl_peek_avail - n);
-+
-+    ssl->ssl_peek_avail -= n;
-+
-+    return n;
-+  }
-+
-   ret = gnutls_record_recv (ssl->gnutls_state, buf, len);
-   ssl->last_error = ret;
- 
-Index: gnutls-1.6.0/includes/gnutls/openssl.h
-===================================================================
---- gnutls-1.6.0.orig/libextra/includes/gnutls/openssl.h	2006-03-08 11:44:58.000000000 +0100
-+++ gnutls-1.6.0/libextra/includes/gnutls/openssl.h	2006-12-12 15:07:26.032227000 +0100
-@@ -164,6 +164,11 @@
- 
-     gnutls_transport_ptr_t rfd;
-     gnutls_transport_ptr_t wfd;
-+
-+    char *ssl_peek_buffer;
-+    size_t ssl_peek_buffer_size;
-+    size_t ssl_peek_avail;
-+
-   };
- 
- #define rbio gnutls_state
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.23.bb b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
deleted file mode 100644
index 2218242..0000000
--- a/meta/recipes-support/gnutls/gnutls_2.12.23.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require gnutls.inc
-
-PR = "${INC_PR}.4"
-
-SRC_URI += "file://gnutls-openssl.patch \
-            file://correct_rpl_gettimeofday_signature.patch \
-            file://configure-fix.patch \
-            file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
-            file://CVE-2014-1959-rejection-of-v1-intermediate-cert.patch \
-            file://CVE-2014-0092-corrected-return-codes.patch \
-            file://25_updatedgdocfrommaster.diff \
-            ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
-           "
-
-SRC_URI[md5sum] = "f3c1d34bd5f113395c4be0d5dfc2b7fe"
-SRC_URI[sha256sum] = "dfa67a7e40727eb0913e75f3c44911d5d8cd58d1ead5acfe73dd933fc0d17ed2"
diff --git a/meta/recipes-support/gnutls/gnutls_3.2.13.bb b/meta/recipes-support/gnutls/gnutls_3.2.13.bb
new file mode 100644
index 0000000..97e2df2
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_3.2.13.bb
@@ -0,0 +1,7 @@
+require gnutls.inc
+
+SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
+           "
+
+SRC_URI[md5sum] = "300e5f413054e2f4719c1c3b5179a611"
+SRC_URI[sha256sum] = "e83676218ba80c4d577d7027b5b087692280347a9b06f90a452403ba70faa604"
-- 
1.9.1


