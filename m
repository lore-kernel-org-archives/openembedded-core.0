Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQT-0006gd-N5
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772178"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:23 -0700
Message-Id: <e750953e9076e1cef035dd64e112c65ec924f1fe.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/36] create-recipe: base on autospectacle.pl to create recipe file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 02:05:50 -0000

From: Kang Kai <kai.kang@windriver.com>

[Yocto 1656]
create-recipe is based on original autospectacle.pl from project Meego.
Add feature to create a recipe .bb file. It requires a parameter to be
told where to download source package, then download and parse.
Create recipe file according to parse results.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/{autospectacle.pl => create-recipe} |  117 +++++++++++++++++++++++---
 1 files changed, 103 insertions(+), 14 deletions(-)
 rename scripts/{autospectacle.pl => create-recipe} (94%)

diff --git a/scripts/autospectacle.pl b/scripts/create-recipe
similarity index 94%
rename from scripts/autospectacle.pl
rename to scripts/create-recipe
index bb9f8dc..aba9ac3 100755
--- a/scripts/autospectacle.pl
+++ b/scripts/create-recipe
@@ -1,5 +1,7 @@
 #!/usr/bin/perl -w
 
+#      Copyright (C) 2012 Wind River Systems, Inc.
+#
 #      Copyright (C) 2010 Intel Corporation
 #
 #   
@@ -29,6 +31,7 @@
 use File::Temp qw(tempdir);
 use File::Path qw(mkpath rmtree); 
 use File::Spec (); 
+use File::Basename qw(basename dirname);
 
 
 my $name = "";
@@ -42,6 +45,10 @@ my @sources;
 my @mainfiles;
 my @patches;
 
+my $md5sum = "";
+my $sh256sum = "";
+my @inherits;
+
 my $printed_subpackages = 0;
 my $fulldir = "";
 
@@ -70,6 +77,7 @@ my %failed_headers;
 
 my %licenses;
 my @license;
+my %lic_files;
 
 sub setup_licenses
 {
@@ -115,8 +123,14 @@ sub guess_license_from_file {
 	if (defined($licenses{$sha1})) {
 		my $lic = $licenses{$sha1};
 		push(@license, $lic);
+
+		my $md5output = `md5sum $copying`;
+		$md5output =~ /^([a-zA-Z0-9]*) /;
+		my $md5 = $1;
+		chomp($md5);
+		$lic_files{$copying} = $md5
 	}
-	
+
 	#
 	# We also must make sure that the COPYING/etc files
 	# end up in the main package as %doc..
@@ -124,7 +138,7 @@ sub guess_license_from_file {
 	$copying =~ s/$fulldir//g;
 	$copying =~ s/^\///g;
 	$copying = "\"\%doc " . $copying ."\"";
-	
+
 	push(@mainfiles, $copying);
 }
 
@@ -1522,7 +1536,7 @@ sub guess_name_from_url {
 	}
 	my $tarfile = $spliturl[0];
 	
-	if ($tarfile =~ /(.*?)\-([0-9\.\-\~]+)\.tar/) {
+	if ($tarfile =~ /(.*?)\-([0-9\.\-\~]+)[-\.].*?\.tar/) {
 		$name = $1;
 		$version = $2;
                 $version =~ s/\-/\_/g;
@@ -1650,7 +1664,7 @@ sub write_yaml
 	write_makefile();
 	write_changelog();
 
-	system("rm $name.spec");
+	system("rm $name.spec 2>/dev/null");
 	system("specify &> /dev/null");
 	if ($oscmode > 0) {
 	        system("osc addremove");
@@ -1659,6 +1673,65 @@ sub write_yaml
 
 }
 
+sub write_bbfile
+{
+	open(BBFILE, ">${name}_$version.bb");
+	print BBFILE "SUMMARY = \"$summary\"\n";
+	print BBFILE "DESCRIPTION = \"$description\"\n";
+
+	print BBFILE "LICENSE = \"@license\"\n";
+	print BBFILE "LIC_FILES_CHKSUM = \"";
+	foreach (keys %lic_files) {
+		print BBFILE "file://" . basename($_) . ";md5=$lic_files{$_} \\\n";
+	}
+	print BBFILE "\"\n\n";
+
+	if (@license <= 0) {
+		print "Can NOT get license from package itself.\n";
+		print "Please update the license and license file manually.\n";
+	}
+
+	if (@buildreqs > 0) {
+		my %saw;
+		my @out = grep(!$saw{$_}++,@buildreqs);
+		print BBFILE "DEPENDS = \"@out\"\n\n";
+	};
+
+	print BBFILE 'PR = "r0"' . "\n\n";
+	print BBFILE "SRC_URI = \"";
+	foreach (@sources) {
+		print BBFILE "$_ \\\n";
+	}
+	print BBFILE "\"\n\n";
+	print BBFILE "SRC_URI[md5sum] = \"$md5sum\"\n";
+	print BBFILE "SRC_URI[sha256sum] = \"$sha256sum\"\n";
+
+	if (@inherits) {
+		print BBFILE "inherit ";
+		foreach (@inherits) {
+			print BBFILE "$_ ";
+		}
+	}
+
+	close(BBFILE);
+
+	my $curdir = `pwd`;
+	chomp($curdir);
+	print "Create bb file: $curdir/${name}_$version.bb\n";
+}
+
+sub calculate_sums
+{
+    @_ = basename $dir;
+    my $md5output = `md5sum @_`;
+    $md5output =~ /^([a-zA-Z0-9]*) /;
+    $md5sum = $1;
+    chomp($md5sum);
+    my $sha256output = `sha256sum @_`;
+    $sha256output =~ /^([a-zA-Z0-9]*) /;
+    $sha256sum = $1;
+    chomp($sha256sum);
+}
 
 ############################################################################
 #
@@ -1696,33 +1769,40 @@ $dir = $ARGV[0];
 guess_name_from_url($dir);
 push(@sources, $dir);
 
-
 #system("cd $tmpdir; curl -s -O $dir");
 $orgdir = `pwd`;
 chomp($orgdir);
+my $outputdir = $name;
+if (! $name) {
+	$outputdir = basename $dir;
+}
+mkpath($outputdir);
+chdir($outputdir);
 print "Downloading package: $dir\n";
-system("wget --quiet $dir");
+system("wget --quiet $dir") == 0 or die "Download $dir failed.";
+
+calculate_sums($outputdir);
+
 print "Unpacking to       : $tmpdir\n";
 
-my @tgzfiles = <$orgdir/*.tgz>;
+my @tgzfiles = <$orgdir/$outputdir/*.tgz>;
 foreach (@tgzfiles) {
-        my $tgz = $_;
+        my $tgz = basename $_;
         my $tar = $tgz;
         $tar =~ s/tgz/tar\.gz/g;
         $dir =~ s/tgz/tar\.gz/g;
-        system("mv $tgz $tar");
+        system("mv $orgdir/$outputdir/$tgz $orgdir/$outputdir/$tar");
         guess_name_from_url($dir);
 }
 
-
 #
 # I really really hate the fact that meego deleted the -a option from tar.
 # this is a step backwards in time that is just silly.
 #
 
 
-system("cd $tmpdir; tar -jxf $orgdir/*\.tar\.bz2");
-system("cd $tmpdir; tar -zxf $orgdir/*\.tar\.gz");
+system("cd $tmpdir; tar -jxf $orgdir/$outputdir/*\.tar\.bz2 &>/dev/null");
+system("cd $tmpdir; tar -zxf $orgdir/$outputdir/*\.tar\.gz &>/dev/null");
 print "Parsing content    ....\n";
 my @dirs = <$tmpdir/*>;
 foreach (@dirs) {
@@ -1734,11 +1814,13 @@ $fulldir = $dir;
 if ( -e "$dir/autogen.sh" ) {
 	$configure = "autogen";
 	$uses_configure = 1;
+	push(@inherits, "autotools");
 }
 if ( -e "$dir/BUILD-CMAKE" ) {
 	$configure = "cmake";
 	push(@buildreqs, "cmake");
 	$uses_configure = 1;
+	push(@inherits, "cmake");
 }
 
 if ( -e "$dir/configure" ) {
@@ -1747,7 +1829,7 @@ if ( -e "$dir/configure" ) {
 
 my @files = <$dir/configure.*>;
 
-my $findoutput = `find $dir -name "configure.ac"`;
+my $findoutput = `find $dir -name "configure.ac" 2>/dev/null`;
 my @findlist = split(/\n/, $findoutput);
 foreach (@findlist) {
 	push(@files, $_);
@@ -1756,7 +1838,7 @@ foreach (@files) {
 	process_configure_ac("$_");
 }
 
-$findoutput = `find $dir -name "*.pro"`;
+$findoutput = `find $dir -name "*.pro" 2>/dev/null`;
 @findlist = split(/\n/, $findoutput);
 foreach (@findlist) {
 	process_qmake_pro("$_");
@@ -1765,6 +1847,7 @@ foreach (@findlist) {
 if (-e "$dir/$name.pro") {
         $builder = "qmake";
         push_pkgconfig_buildreq("Qt");
+	push(@inherits, "qmake2");
 }
 
 
@@ -1804,6 +1887,12 @@ foreach (@files) {
 
 guess_description($dir);
 
+#
+# Output of bbfile file
+#
+write_bbfile();
+chdir($orgdir);
+exit 0;
 
 #
 # Output of the yaml file
-- 
1.7.7.6



