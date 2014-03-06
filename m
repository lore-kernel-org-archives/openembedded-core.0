Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F0FBC6EAEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:16:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 02:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="495058007"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 02:15:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 10:15:24 +0000
Message-Id: <411d48abfa41cfec35779962b0ab2058325fcf11.1394100856.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394100856.git.paul.eggleton@linux.intel.com>
References: <cover.1394100856.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394100856.git.paul.eggleton@linux.intel.com>
References: <cover.1394100856.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/1] gnutls: fix failure during do_compile
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
X-List-Received-Date: Thu, 06 Mar 2014 10:16:05 -0000

Add a Debian patch to fix a load of errors building the documentation
within do_compile e.g.:

| ./x509-api.texi:15: misplaced {
| ./x509-api.texi:15: misplaced }

(From OE-Core master rev: b09a9a5f298596795f17243e5ffcf7dab295a8e6)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gnutls/gnutls/25_updatedgdocfrommaster.diff    | 636 +++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   1 +
 2 files changed, 637 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff

diff --git a/meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff b/meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
new file mode 100644
index 0000000..76108a0
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
@@ -0,0 +1,636 @@
+Description: Update gdoc script from gnutls master.
+ This includes bef38b98c0536d81c0e4b2e78a9182e1df1d451c among other fixes:
+ .
+ [PATCH] Avoid depending on hash order in gdoc.
+ .
+ Previously, gdoc had a hash of regexp replacements for each output
+ format, and applied the replacements in the order that "keys" returned
+ for the hash. However, not all orders are safe -- and now that Perl 5.18
+ randomises hash order per-process, it only worked sometimes!
+
+Bug-Debian: http://bugs.debian.org/724167
+
+Upstream-Status: Backport
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- gnutls26-2.12.23.orig/doc/scripts/gdoc
++++ gnutls26-2.12.23/doc/scripts/gdoc
+@@ -1,4 +1,6 @@
+-#!/usr/bin/perl
++eval '(exit $?0)' && eval 'exec perl "$0" ${1+"$@"}'
++  & eval 'exec perl "$0" $argv:q'
++    if 0;
+ 
+ ## Copyright (c) 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 Simon Josefsson
+ ##                    added -texinfo, -listfunc, -pkg-name
+@@ -7,6 +9,8 @@
+ ## Copyright (c) 2001, 2002 Nikos Mavrogiannopoulos
+ ##                    added -tex
+ ## Copyright (c) 1998 Michael Zucchi
++## Copyright (c) 2013 Adam Sampson
++##                    made highlighting not depend on hash order, for Perl 5.18
+ 
+ # This program is free software: you can redistribute it and/or modify
+ # it under the terms of the GNU General Public License as published by
+@@ -132,57 +136,59 @@
+ use POSIX qw(strftime);
+ 
+ # match expressions used to find embedded type information
+-$type_constant = "((?<!\")\\\%(\\w+))";
+-$type_func = "(\\w+\\(\\))";
+-$type_param = "\\\@(\\w+)";
+-$type_struct = "\\\#(\\w+)";
+-$type_env = "(\\\$\\w+)";
++$type_constant = "\\\%([A-Za-z0-9_]+)";
++$type_func = "([A-Za-z0-9_]+\\(\\))";
++$type_param = '\@([A-Za-z0-9_]+)\s*';
++$type_struct = "\\\#([A-Za-z0-9_]+)";
++$type_env = "(\\\$[A-Za-z0-9_]+)";
+ 
+ 
+ # Output conversion substitutions.
+ #  One for each output format
+ 
+ # these work fairly well
+-%highlights_html = ( $type_constant, "<i>\$2</i>",
+-		     $type_func, "<b>\$1</b>",
+-		     $type_struct, "<i>\$1</i>",
+-		     $type_param, "<tt><b>\$1</b></tt>" );
++@highlights_html = ( [$type_constant, '"<i>$1</i>"'],
++		     [$type_func, '"<b>$1</b>"'],
++		     [$type_struct, '"<i>$1</i>"'],
++		     [$type_param, '" <tt><b>$1</b></tt> "'] );
+ $blankline_html = "<p>";
+ 
+-%highlights_texinfo = ( $type_constant, "\\\@code{\$2}",
+-			$type_func, "\\\@code{\$1}",
+-			$type_struct, "\\\@code{\$1}",
+-			$type_param, "\\\@code{\$1}" );
++@highlights_texinfo = ( [$type_param, '" \@code{$1} "'],
++			[$type_constant, '"\@code{$1} "'],
++			[$type_func, '"\@code{$1} "'],
++			[$type_struct, '"\@code{$1} "'],
++			 );
+ $blankline_texinfo = "";
+ 
+-%highlights_tex = ( $type_constant, "{\\\\it \$2}",
+-		     $type_func, "{\\\\bf \$1}",
+-		     $type_struct, "{\\\\it \$1}",
+-		     $type_param, "{\\\\bf \$1}" );
++@highlights_tex = ( [$type_param, '" {\\\bf $1} "'],
++		[$type_constant, '"{\\\it $1}"'],
++		[$type_func, '"{\\\bf $1}"'],
++		[$type_struct, '"{\\\it $1}"'],
++		      );
+ $blankline_tex = "\\\\";
+ 
+ # sgml, docbook format
+-%highlights_sgml = ( $type_constant, "<replaceable class=\"option\">\$2</replaceable>",
+-		     $type_func, "<function>\$1</function>",
+-		     $type_struct, "<structname>\$1</structname>",
+-		     $type_env, "<envar>\$1</envar>",
+-		     $type_param, "<parameter>\$1</parameter>" );
++@highlights_sgml = ( [$type_constant, '"<replaceable class=\"option\">$1</replaceable>"'],
++		     [$type_func, '"<function>$1</function>"'],
++		     [$type_struct, '"<structname>$1</structname>"'],
++		     [$type_env, '"<envar>$1</envar>"'],
++		     [$type_param, '" <parameter>$1</parameter> "'] );
+ $blankline_sgml = "</para><para>\n";
+ 
+ # these are pretty rough
+-%highlights_man = ( $type_constant, "\\\\fB\$2\\\\fP",
+-		    $type_func, "\\\\fB\$1\\\\fP",
+-		    $type_struct, "\\\\fB\$1\\\\fP",
+-		    $type_param, "\\\\fI\$1\\\\fP" );
++@highlights_man = ( [$type_constant, '"\\\fB$1\\\fP"'],
++		    [$type_func, '"\\\fB$1\\\fP"'],
++		    [$type_struct, '"\\\fB$1\\\fP"'],
++		    [$type_param, '" \\\fI$1\\\fP "'] );
+ $blankline_man = "";
+ 
+ # text-mode
+-%highlights_text = ( $type_constant, "\$2",
+-		     $type_func, "\$1",
+-		     $type_struct, "\$1",
+-		     $type_param, "\$1" );
++@highlights_text = ( [$type_constant, '"$1"'],
++		     [$type_func, '"$1"'],
++		     [$type_struct, '"$1"'],
++		     [$type_param, '"$1 "'] );
+ $blankline_text = "";
+-
++my $lineprefix = "";
+ 
+ sub usage {
+     print "Usage: $0 [ -v ] [ -docbook | -html | -text | -man | -tex | -texinfo  -listfunc ]\n";
+@@ -201,7 +207,7 @@ if ($#ARGV==-1) {
+ 
+ $verbose = 0;
+ $output_mode = "man";
+-%highlights = %highlights_man;
++@highlights = @highlights_man;
+ $blankline = $blankline_man;
+ $modulename = "API Documentation";
+ $sourceversion = strftime "%Y-%m-%d", localtime;
+@@ -210,27 +216,27 @@ while ($ARGV[0] =~ m/^-(.*)/) {
+     $cmd = shift @ARGV;
+     if ($cmd eq "-html") {
+ 	$output_mode = "html";
+-	%highlights = %highlights_html;
++	@highlights = @highlights_html;
+ 	$blankline = $blankline_html;
+     } elsif ($cmd eq "-man") {
+ 	$output_mode = "man";
+-	%highlights = %highlights_man;
++	@highlights = @highlights_man;
+ 	$blankline = $blankline_man;
+     } elsif ($cmd eq "-tex") {
+ 	$output_mode = "tex";
+-	%highlights = %highlights_tex;
++	@highlights = @highlights_tex;
+ 	$blankline = $blankline_tex;
+     } elsif ($cmd eq "-texinfo") {
+ 	$output_mode = "texinfo";
+-	%highlights = %highlights_texinfo;
++	@highlights = @highlights_texinfo;
+ 	$blankline = $blankline_texinfo;
+     } elsif ($cmd eq "-text") {
+ 	$output_mode = "text";
+-	%highlights = %highlights_text;
++	@highlights = @highlights_text;
+ 	$blankline = $blankline_text;
+     } elsif ($cmd eq "-docbook") {
+ 	$output_mode = "sgml";
+-	%highlights = %highlights_sgml;
++	@highlights = @highlights_sgml;
+ 	$blankline = $blankline_sgml;
+     } elsif ($cmd eq "-listfunc") {
+ 	$output_mode = "listfunc";
+@@ -270,6 +276,8 @@ sub dump_section {
+     my $name = shift @_;
+     my $contents = join "\n", @_;
+ 
++    $name = " $name";
++
+     if ($name =~ m/$type_constant/) {
+ 	$name = $1;
+ #	print STDERR "constant section '$1' = '$contents'\n";
+@@ -280,6 +288,7 @@ sub dump_section {
+ 	$parameters{$name} = $contents;
+     } else {
+ #	print STDERR "other section '$name' = '$contents'\n";
++	$name =~ tr/ //d;
+ 	$sections{$name} = $contents;
+ 	push @sectionlist, $name;
+     }
+@@ -296,35 +305,15 @@ sub dump_section {
+ #  sections => %descriont descriptions
+ #  
+ 
+-sub repstr {
+-    $pattern = shift;
+-    $repl = shift;
+-    $match1 = shift;
+-    $match2 = shift;
+-    $match3 = shift;
+-    $match4 = shift;
+-
+-    $output = $repl;
+-    $output =~ s,\$1,$match1,g;
+-    $output =~ s,\$2,$match2,g;
+-    $output =~ s,\$3,$match3,g;
+-    $output =~ s,\$4,$match4,g;
+-
+-    eval "\$return = qq/$output/";
+-
+-#    print "pattern $pattern matched 1=$match1 2=$match2 3=$match3 4=$match4 replace $repl yielded $output interpolated $return\n";
+-
+-    $return;
+-}
+-
+ sub just_highlight {
+     my $contents = join "\n", @_;
+     my $line;
+     my $ret = "";
+ 
+-    foreach $pattern (keys %highlights) {
+-#	print "scanning pattern $pattern ($highlights{$pattern})\n";
+-	$contents =~ s:$pattern:repstr($pattern, $highlights{$pattern}, $1, $2, $3, $4):gse;
++    foreach $highlight (@highlights) {
++	my ($pattern, $replace) = @$highlight;
++	#print "scanning pattern $pattern ($replace)\n";
++	$contents =~ s/$pattern/$replace/gees;
+     }
+     foreach $line (split "\n", $contents) {
+ 	if ($line eq ""){
+@@ -370,13 +359,45 @@ sub output_texinfo {
+ 	}
+     }
+     foreach $section (@{$args{'sectionlist'}}) {
++	$section =~ s/\@//g;
+ 	print "\n\@strong{$section:} " if $section ne $section_default;
+-	$args{'sections'}{$section} =~ s:([{}]):\@\1:gs;
++	$args{'sections'}{$section} =~ s:([{}]):\@$1:gs;
+ 	output_highlight($args{'sections'}{$section});
+     }
+     print "\@end deftypefun\n\n";
+ }
+ 
++sub output_enum_texinfo {
++    my %args = %{$_[0]};
++    my ($parameter, $section);
++    my $count;
++    my $name = $args{'enum'};
++    my $param;
++    my $param2;
++    my $sec;
++    my $check;
++    my $type;
++
++    print "\n\@c $name\n";
++    print "\@table \@code\n";
++
++    $check=0;
++    foreach $parameter (@{$args{'parameterlist'}}) {
++        $param1 = $parameter;
++	$param1 =~ s/_/_\@-/g;
++
++	$check = 1;
++	print "\@item ".$param1."\n";
++#	print "\n";
++
++        $param2 = $args{'parameters'}{$parameter};
++	$out = just_highlight($param2);
++	chomp $out;
++	print $out . "\n";
++    }
++    print "\@end table\n";
++}
++
+ # output in html
+ sub output_html {
+     my %args = %{$_[0]};
+@@ -428,7 +449,9 @@ sub output_tex {
+ 
+     $func =~ s/_/\\_/g;
+ 
+-    print "\n\n\\subsection{". $func . "}\n\\label{" . $args{'function'} . "}\n";
++    print "\n\n\\begin{function}\n";
++    print "\\functionTitle{". $func . "}\n";
++    print "\\index{". $func . "}\n";
+ 
+     $type = $args{'functiontype'};
+     $type =~ s/_/\\_/g;
+@@ -451,9 +474,8 @@ sub output_tex {
+     }
+     print ")\n";
+ 
+-    print "\n{\\large{Arguments}}\n";
++    print "\n\\begin{functionArguments}\n";
+ 
+-    print "\\begin{itemize}\n";
+     $check=0;
+     foreach $parameter (@{$args{'parameterlist'}}) {
+         $param1 = $args{'parametertypes'}{$parameter};
+@@ -462,11 +484,12 @@ sub output_tex {
+ 	$param2 =~ s/_/\\_/g;
+ 
+ 	$check = 1;
+-	print "\\item {\\it ".$param1."} {\\bf ".$param2."}: \n";
++	print "\\functionArgument {\\it ".$param1."} {\\bf ".$param2."}: \n";
+ #	print "\n";
+ 
+ 	$param3 = $args{'parameters'}{$parameter};
+-	$param3 =~ s/#([a-zA-Z\_]+)/{\\it \1}/g;
++	$param3 =~ s/\#([a-zA-Z\_]+)/{\\it $1}/g;
++	$param3 =~ s/\%([a-zA-Z\_]+)/{\\bf $1}/g;
+ 
+ 	$out = just_highlight($param3);
+ 	$out =~ s/_/\\_/g;
+@@ -475,31 +498,72 @@ sub output_tex {
+     if ($check==0) {
+ 	print "\\item void\n";
+     }
+-    print "\\end{itemize}\n";
++    print "\\end{functionArguments}\n";
+ 
+     foreach $section (@{$args{'sectionlist'}}) {
+ 	$sec = $section;
+ 	$sec =~ s/_/\\_/g;
+-	$sec =~ s/#([a-zA-Z\_]+)/{\\it \1}/g;
++	$sec =~ s/#([a-zA-Z\_]+)/{\\it $1}/g;
+ 
+-	print "\n{\\large{$sec}}\\\\\n";
+-	print "\\begin{rmfamily}\n";
++	print "\n\\begin{function${sec}}\n";
++	$out = $args{'sections'}{$section};
+ 
+-	$sec = $args{'sections'}{$section};
+-	$sec =~ s/\\:/:/g;
+-	$sec =~ s/#([a-zA-Z\_]+)/{\\it \1}/g;
+-	$sec =~ s/->/\$\\rightarrow\$/g;
+-	$sec =~ s/([0-9]+)\^([0-9]+)/\$\{\1\}\^\{\2\}\$/g;
+-
+-	$out = just_highlight($sec);
+-	$out =~ s/_/\\_/g;
++	$out =~ s/\#([a-zA-Z\_]+)/{\\it $1}/g;
++	$out =~ s/\%([a-zA-Z\_]+)/{\\bf $1}/g;
++	$out =~ s/\@([a-zA-Z\_]+)/{\\bf $1}/g;
++	$out =~ s/_/\\_\\-/g;
++        $out =~ s/\$/\\\$/g;
++	$out =~ s/#/\\#/g;
++	$out =~ s/\n\n/\n/g;
++	$out =~ s/\\:/:/g;
++	$out =~ s/\-\>/\$\\rightarrow\$/g;
++	$out =~ s/([0-9]+)\^([0-9]+)/\$\{$1\}\^\{$2\}\$/g;
+ 
+ 	print $out;
+-	print "\\end{rmfamily}\n";
++	print "\\end{function${sec}}\n";
+     }
+-    print "\n";
++    print "\\end{function}\n\n";
+ }
+ 
++sub output_enum_tex {
++    my %args = %{$_[0]};
++    my ($parameter, $section);
++    my $count;
++    my $name = $args{'enum'};
++    my $param;
++    my $param2;
++    my $sec;
++    my $check;
++    my $type;
++
++    print "\n\n\\begin{enum}\n";
++    $name =~ s/_/\\_/g;
++    print "\\enumTitle{". $name . "}\n";
++    print "\\index{". $name . "}\n";
++
++    print "\n\\begin{enumList}\n";
++
++    $check=0;
++    foreach $parameter (@{$args{'parameterlist'}}) {
++        $param1 = $parameter;
++	$param1 =~ s/_/\\_\\-/g;
++
++	$check = 1;
++	print "\\enumElement{".$param1."}{";
++#	print "\n";
++
++        $param2 = $args{'parameters'}{$parameter};
++	$param2 =~ s/\#([a-zA-Z\_]+)/{\\it $1}/g;
++	$param2 =~ s/\%([a-zA-Z\_]+)/{\\bf $1}/g;
++	$out = just_highlight($param2);
++	$out =~ s/_/\\_/g;
++	chomp $out;
++	print $out . "}\n";
++    }
++    print "\\end{enumList}\n";
++
++    print "\\end{enum}\n\n";
++}
+ 
+ # output in sgml DocBook
+ sub output_sgml {
+@@ -639,11 +703,14 @@ sub output_man {
+     if ($args{'bugsto'}) {
+ 	print ".SH \"REPORTING BUGS\"\n";
+ 	print "Report bugs to <". $args{'bugsto'} . ">.\n";
++        print ".br\n";
++	print "General guidelines for reporting bugs: http://www.gnu.org/gethelp/\n";
++        print ".br\n";
+ 	if ($args{'pkgname'}) {
+ 	    print $args{'pkgname'} . " home page: " .
+ 		"http://www.gnu.org/software/" . $args{'module'} . "/\n";
+ 	}
+-	print "General help using GNU software: http://www.gnu.org/gethelp/\n";
++	print "\n";
+     }
+ 
+     if ($args{'copyright'}) {
+@@ -670,6 +737,10 @@ sub output_man {
+ 	print ".B info " . $args{'seeinfo'} . "\n";
+ 	print ".PP\n";
+ 	print "should give you access to the complete manual.\n";
++	print "As an alternative you may obtain the manual from:\n";
++	print ".IP\n";
++	print ".B http://www.gnu.org/software/" . $args{'module'} . "/manual/\n";
++	print ".PP\n";
+     }
+ }
+ 
+@@ -705,6 +776,10 @@ sub output_function {
+     eval "output_".$output_mode."(\@_);";
+ }
+ 
++sub output_enum {
++    eval "output_enum_".$output_mode."(\@_);";
++}
++
+ 
+ ##
+ # takes a function prototype and spits out all the details
+@@ -744,7 +819,7 @@ sub dump_function {
+ #	    print STDERR " :> @args\n";
+ 	    $type = join " ", @args;
+ 
+-	    if ($parameters{$param} eq "" && $param != "void") {
++	    if ((!defined($parameters{$param}) || $parameters{$param} eq "") && $param ne "void") {
+ 		$parameters{$param} = "-- undescribed --";
+ 		print STDERR "warning: $lineno: Function parameter '$param' not described in '$function_name'\n";
+ 	    }
+@@ -781,6 +856,56 @@ sub dump_function {
+     }
+ }
+ 
++sub dump_enum {
++    my $prototype = shift @_;
++
++    if (($prototype =~ m/^\s*typedef\s+enum\s*[a-zA-Z0-9_~:]*\s*\{([\-a-zA-Z0-9_~=,:\s\(\)\<]+)\s*\}\s*([a-zA-Z0-9_]+);.*/)) {
++#        || $prototype =~ m/^\s*enum\s+([a-zA-Z0-9_~:]+).*/) {
++        $args = $1;
++	$name = $2;
++
++	foreach $arg (split ',', $args) {
++	    # strip leading/trailing spaces
++	    $arg =~ s/^\s*//;
++	    $arg =~ s/\s*$//;
++	    $arg =~ s/([A-Za-z0-9_]+)\s*=.*/$1/g;
++#	    print STDERR "SCAN ARG: '$arg'\n";
++
++            next if $arg eq '';
++	    if ((!defined($parameters{$arg}) || $parameters{$arg} eq "")) {
++		$parameters{$arg} = "-- undescribed --";
++		print STDERR "warning: $lineno: Enumeration parameter '$arg' not described in '$name'\n";
++	    }
++
++	    push @parameterlist, $arg;
++
++#	    print STDERR "param = '$arg'\n";
++	}
++    } else {
++#	print STDERR "warning: $lineno: Cannot understand enumeration: '$prototype'\n";
++	return;
++    }
++
++    output_enum({'enum' => $name,
++			 'module' => $modulename,
++			 'sourceversion' => $sourceversion,
++			 'include' => $include,
++			 'includefuncprefix' => $includefuncprefix,
++			 'bugsto' => $bugsto,
++			 'pkgname' => $pkgname,
++			 'copyright' => $copyright,
++			 'verbatimcopying' => $verbatimcopying,
++			 'seeinfo' => $seeinfo,
++			 'functiontype' => $return_type,
++			 'parameterlist' => \@parameterlist,
++			 'parameters' => \%parameters,
++			 'parametertypes' => \%parametertypes,
++			 'sectionlist' => \@sectionlist,
++			 'sections' => \%sections,
++			 'purpose' => $function_purpose
++			 });
++}
++
+ ######################################################################
+ # main
+ # states
+@@ -797,7 +922,7 @@ $doc_start = "^/\\*\\*\$";
+ $doc_end = "\\*/";
+ $doc_com = "\\s*\\*\\s*";
+ $doc_func = $doc_com."(\\w+):?";
+-$doc_sect = $doc_com."([".$doc_special."[:upper:]][\\w ]+):\\s*(.*)";
++$doc_sect = $doc_com."([".$doc_special."[:upper:]][\\w]+):\\s*(.*)";
+ $doc_content = $doc_com."(.*)";
+ 
+ %constants = ();
+@@ -809,6 +934,7 @@ $doc_content = $doc_com."(.*)";
+ $contents = "";
+ $section_default = "Description";	# default section
+ $section = $section_default;
++$enum = 0;
+ 
+ $lineno = 0;
+ foreach $file (@ARGV) {
+@@ -816,18 +942,21 @@ foreach $file (@ARGV) {
+ 	print STDERR "Error: Cannot open file $file\n";
+ 	next;
+     }
+-    while (<IN>) {
++    while ($line = <IN>) {
+ 	$lineno++;
+ 
+ 	if ($state == 0) {
+-	    if (/$doc_start/o) {
++	    if ($line =~ /$doc_start/o) {
+ 		$state = 1;		# next line is always the function name
++#	    print STDERR "XXX: start of doc comment\n";
+ 	    }
+ 	} elsif ($state == 1) {	# this line is the function name (always)
+-	    if (/$doc_func/o) {
++	    if ($line =~ /$doc_func/o) {
+ 		$function = $1;
+ 		$state = 2;
+-		if (/-\s*(.*)/) {
++#	    print STDERR "XXX: start of doc comment, looking for prototype\n";
++
++		if ($line =~ /-\s*(.*)/) {
+ 		    $function_purpose = $1;
+ 		} else {
+ 		    $function_purpose = "";
+@@ -841,11 +970,11 @@ foreach $file (@ARGV) {
+ 		$state = 0;
+ 	    }
+ 	} elsif ($state == 2) {	# look for head: lines, and include content
+-	    if (/$doc_sect/o) {
++	    if ($line =~ /$doc_sect/o) {
+ 		$newsection = $1;
+ 		$newcontents = $2;
+ 
+-		if ($contents ne "") {
++		if ($contents ne '') {
+ 		    dump_section($section, $contents);
+ 		    $section = $section_default;
+ 		}
+@@ -855,7 +984,7 @@ foreach $file (@ARGV) {
+ 		    $contents .= "\n";
+ 		}
+ 		$section = $newsection;
+-	    } elsif (/$doc_end/) {
++	    } elsif ($line =~ /$doc_end/) {
+ 
+ 		if ($contents ne "") {
+ 		    dump_section($section, $contents);
+@@ -863,13 +992,12 @@ foreach $file (@ARGV) {
+ 		    $contents = "";
+ 		}
+ 
+-#	    print STDERR "end of doc comment, looking for prototype\n";
+ 		$prototype = "";
+ 		$state = 3;
+-	    } elsif (/$doc_content/) {
++	    } elsif ($line =~ /$doc_content/) {
+ 		# miguel-style comment kludge, look for blank lines after
+ 		# @parameter line to signify start of description
+-		if ($1 eq "" && $section =~ m/^@/) {
++		if ($1 eq '' && $section =~ m/^@/) {
+ 		    dump_section($section, $contents);
+ 		    $section = $section_default;
+ 		    $contents = "";
+@@ -881,13 +1009,16 @@ foreach $file (@ARGV) {
+ 		print STDERR "warning: $lineno: Bad line: $_";
+ 	    }
+ 	} elsif ($state == 3) {	# scanning for function { (end of prototype)
+-	    if (m#\s*/\*\s+MACDOC\s*#io) {
++	    if ($line =~ m#\s*/\*\s+MACDOC\s*#io) {
+ 	      # do nothing
+ 	    }
+-	    elsif (/([^\{]*)/) {
++	    elsif ($enum == 1 && $line =~ /(^\s*\{).*/) {
++		$prototype .= "{";
++	    }
++	    elsif ($line =~ /([^\{]*)/) {
+ 		$prototype .= $1;
+ 	    }
+-	    if (/\{/) {
++	    if ($enum == 0 && $line =~ /\{/) {
+ 		$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
+ 		$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
+ 		$prototype =~ s@^ +@@gos; # strip leading spaces
+@@ -901,9 +1032,32 @@ foreach $file (@ARGV) {
+ 		%sections = ();
+ 		@sectionlist = ();
+ 		$prototype = "";
++		$enum = 0;
+ 
+ 		$state = 0;
+ 	    }
++	    elsif ($enum == 1 && $line =~ /\}/) {
++		$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
++		$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
++		$prototype =~ s@^ +@@gos; # strip leading spaces
++		dump_enum($prototype);
++
++		$function = "";
++		%constants = ();
++		%parameters = ();
++		%parametertypes = ();
++		@parameterlist = ();
++		%sections = ();
++		@sectionlist = ();
++		$prototype = "";
++		$enum = 0;
++
++		$state = 0;
++	    }
++	    elsif ($line =~ /([a-zA-Z\s]+)enum(.*)$/) {
++	        $enum = 1;
++	    }
++    
+ 	}
+     }
+ }
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.23.bb b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
index 04605dd..2218242 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.23.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
             file://CVE-2014-1959-rejection-of-v1-intermediate-cert.patch \
             file://CVE-2014-0092-corrected-return-codes.patch \
+            file://25_updatedgdocfrommaster.diff \
             ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
            "
 
-- 
1.8.5.3


