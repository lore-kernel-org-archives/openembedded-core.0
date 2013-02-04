Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1U2LTv-0003Wp-ET
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 13:49:08 +0100
Received: by mail-bk0-f41.google.com with SMTP id q16so2722802bkw.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 04:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=SkS0j9g44geNZ1Fx4ZpSioLdee3pJnK2B4hCwNJpEvg=;
	b=fEz7Z8PutfHDn8nqDfL7pc4YKMYsnmLIm0tTKsXLYFQ5aN6j9O+yOcePVOQpKynjdQ
	LRhHK3PfnDKoFrLHgIz/mP+Md6bSGh5JPKotJbEcTlnWQcn9FmhxE8PDBg+C3ZKQdKKr
	n/B0hy7mBVxTDay7vfK7WF9kG5egJ6xzL8Hep4qOr3y/+ANP9dzV4MEwZtdxBHfhnmR0
	jD+jSKqHay0tX9VYkiy0X0yC0gango4KTCs7iNXgfd26HGsbA3fwgyX0mjGcGHUESJaF
	fikwCUqBAnEQ1Ht5nhuG2aDbTVdHQ29pxD5FOREUk0uaVG2dMdDYb9lNdRDxpaRpteNa
	r2Cw==
X-Received: by 10.204.147.139 with SMTP id l11mr5641771bkv.46.1359981199072;
	Mon, 04 Feb 2013 04:33:19 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id s10sm5236767bkt.10.2013.02.04.04.33.17
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 04:33:18 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id E16E34074D2; Mon,  4 Feb 2013 13:32:58 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 13:32:51 +0100
Message-Id: <1359981171-13511-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] Python improvements for create-recipe.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 12:49:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1. Added ability to parse .zip files.
2. Added optional automatic dependency resolving for python
   recipes(easy_install wrapper).
3. Fixed a few name/version bugs.

Give it a whirl by:
create-recipe -r https://launchpad.net/nova/folsom/2012.2.3/+download/nova-2012.2.3.tar.gz

Saves me some time unwinding python dependencies, and creating template recipes.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 scripts/create-recipe |  156 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 124 insertions(+), 32 deletions(-)

diff --git a/scripts/create-recipe b/scripts/create-recipe
index a556e39..1b10e1b 100755
--- a/scripts/create-recipe
+++ b/scripts/create-recipe
@@ -37,11 +37,14 @@ use File::Basename qw(basename dirname);
 my $name = "";
 my $predef_version = "TO BE FILLED IN";
 my $version = $predef_version;
+my $pversion = $predef_version;
 my $description = "";
 my $summary = "";
 my $url = "";
-my $homepage;
+my $homepage = "";
+my @depends;
 my @rdepends;
+my @rawpythondeps;
 my $configure = "";
 my $localename = "";
 my @sources;
@@ -59,6 +62,7 @@ my $builder = "";
 
 
 my $oscmode = 0;
+my $python = 0;
 
 my @banned_pkgconfig;
 my %failed_commands;
@@ -74,7 +78,7 @@ my %failed_headers;
 # We store the sha1sum of common COPYING files in an associative array
 # %licenses. 
 #
-# For all matching sha1's in the tarbal, we then push the result
+# For all matching sha1's in the tarball, we then push the result
 # in the @license array (which we'll dedupe at the time of printing).
 # 
 
@@ -135,6 +139,18 @@ sub guess_license_from_file {
 	}
 
 	#
+	# if file is found, and licence of python
+	# package is already aquired, add file.
+        #
+	if ($python == 1 && @license != 0) {
+	        my $md5output = `md5sum $copying`;
+	        $md5output =~ /^([a-zA-Z0-9]*) /;
+	        my $md5 = $1;
+	        chomp($md5);
+	        $lic_files{$copying} = $md5
+	}
+
+	#
 	# We also must make sure that the COPYING/etc files
 	# end up in the main package as %doc..
 	#
@@ -1539,10 +1555,14 @@ sub guess_name_from_url {
 	}
 	my $tarfile = $spliturl[0];
 	
+	# Ensure correct name resolution from .zip&tgz archives
+	$tarfile =~ s/\.zip/\.tar/;
+	$tarfile =~ s/\.tgz/\.tar/;
+	$tarfile =~ s/\_/\-/g;
 	if ($tarfile =~ /(.*?)\-([0-9\.\-\~]+.*?)\.tar/) {
 		$name = $1;
 		$version = $2;
-                $version =~ s/\-/\_/g;
+		$version =~ s/\-/\_/g;
 	}
 }
 
@@ -1678,11 +1698,29 @@ sub write_yaml
 
 sub write_bbfile
 {
+	my $curdir = `pwd`;
+	chomp($curdir);
+
+	if ($python == 1) {
+	    $name =~ s/python-//;
+    	    $name = lc("python-" . $name);	    
+	}
+	
+	if (-e "$curdir/${name}_$version.bb") {
+	    print "Wont overwrite file:";
+	    print "$curdir/${name}_$version.bb, exiting\n";
+	    return;
+	}
 	open(BBFILE, ">${name}_$version.bb");
+	
 	print BBFILE "SUMMARY = \"$summary\"\n";
 	print BBFILE "DESCRIPTION = \"$description\"\n";
 	print BBFILE "HOMEPAGE = \"$homepage\"\n";
 
+	if ($python == 1) {
+	    print BBFILE "SRCNAME = \"$summary\"\n";
+	}
+
 	print BBFILE "LICENSE = \"@license\"\n";
 	print BBFILE "LIC_FILES_CHKSUM = \"";
 	foreach (keys %lic_files) {
@@ -1702,10 +1740,18 @@ sub write_bbfile
 	};
 
 	if (@rdepends > 0) {
-	    print BBFILE "RDEPENDS_\$\{PN\} += \"@rdepends\"\n";
+	    print BBFILE "RDEPENDS_\$\{PN\} += \"";
+	    foreach (@rdepends) {
+		print BBFILE "$_ \\\n\t";
+	    }
+	    print BBFILE "\"\n";
+	}
+
+	print BBFILE 'PR = "r0"' . "\n";
+	if ($python == 1) {
+	    print BBFILE "PV = \"$pversion\"\n\n";
 	}
 
-	print BBFILE 'PR = "r0"' . "\n\n";
 	print BBFILE "SRC_URI = \"";
 	foreach (@sources) {
 		print BBFILE "$_ \\\n";
@@ -1713,18 +1759,19 @@ sub write_bbfile
 	print BBFILE "\"\n\n";
 	print BBFILE "SRC_URI[md5sum] = \"$md5sum\"\n";
 	print BBFILE "SRC_URI[sha256sum] = \"$sha256sum\"\n\n";
+	if ($python == 1) {
+	    print BBFILE "S = \"\${WORKDIR}/\${SRCNAME}-\${PV}\"\n";
+	}
 
 	if (@inherits) {
 		print BBFILE "inherit ";
 		foreach (@inherits) {
 			print BBFILE "$_ ";
 		}
+		print BBFILE "\n";
 	}
 
-	close(BBFILE);
-
-	my $curdir = `pwd`;
-	chomp($curdir);
+	close(BBFILE);	
 	print "Create bb file: $curdir/${name}_$version.bb\n";
 }
 
@@ -1748,10 +1795,18 @@ sub calculate_sums
 #
 
 if ( @ARGV < 1 ) {
-    print "Usage: $0 <url-of-source-tarballs>\n";
+    print "Usage: $0 [-r] <url-of-source-tarballs>\n";
     exit(1);
 }
 
+# Recusive parsing of python dependencies using
+# easy_install
+my $recurse_python = 0;
+if ($ARGV[0] eq "-r") {
+    $recurse_python = 1;
+    shift @ARGV;
+}
+
 if (@ARGV > 1) {
         my $i = 1;
         while ($i < @ARGV) {
@@ -1809,7 +1864,7 @@ foreach (@tgzfiles) {
 # this is a step backwards in time that is just silly.
 #
 
-my @sourcetars = <$orgdir/$outputdir/*\.tar\.bz2 $orgdir/$outputdir/*\.tar\.gz>;
+my @sourcetars = <$orgdir/$outputdir/*\.tar\.bz2 $orgdir/$outputdir/*\.tar\.gz $orgdir/$outputdir/*\.zip>;
 if ( length @sourcetars == 0) {
 	print "Can NOT find source tarball. Exiting...\n";
 	exit (1);
@@ -1818,6 +1873,8 @@ if (defined($sourcetars[0]) and $sourcetars[0] =~ ".*\.tar\.bz2") {
 	system("cd $tmpdir; tar -jxf $sourcetars[0] &>/dev/null");
 } elsif (defined($sourcetars[0]) and $sourcetars[0] =~ ".*\.tar\.gz") {
 	system("cd $tmpdir; tar -zxf $sourcetars[0] &>/dev/null");
+} elsif (defined($sourcetars[0]) and $sourcetars[0] =~ ".*\.zip") {
+        system("cd $tmpdir; unzip $sourcetars[0] &>/dev/null");
 }
 
 print "Parsing content    ....\n";
@@ -1830,34 +1887,64 @@ $fulldir = $dir;
 
 if ( -e "$dir/setup.py" ) {
        	$python = 1;
-	push(@inherits, "distutils");
-	
-	system("cd $dir ; python setup.py build sdist &> /dev/null");	
+	$tmp_stools = `grep -r setuptools $dir/setup.py`;
+	if (length($tmp_stools) > 2) {
+	    push(@inherits, "setuptools");
+	} else {
+	    push(@inherits, "distutils");
+	}	
 
-        $templic = `sed '/^License: */!d; s///;q' $dir/*.egg-info/PKG-INFO`;
-	chomp($templic);
+	$templic = `cd $dir; python setup.py --license;`;
+	$templic =~ s/[\r\n]+//g;
 	push(@license, $templic);
-	$summary = `sed '/^Name: */!d; s///;q' $dir/*.egg-info/PKG-INFO`;
-	chomp($summary);
-	$description = `sed '/^Summary: */!d; s///;q' $dir/*.egg-info/PKG-INFO`;
-	chomp($description);
-	$homepage = `sed '/^Home-page: */!d; s///;q' $dir/*.egg-info/PKG-INFO`;
-	chomp($homepage);
+	$summary = `cd $dir; python setup.py --name`;
+	$summary =~ s/[\r\n]+//g;
+	$description = `cd $dir; python setup.py --description`;
+	$description =~ s/[\r\n]+//g;
+	$homepage = `cd $dir; python setup.py --url`;
+	$homepage =~ s/[\r\n]+//g;
+	$pversion = `cd $dir; python setup.py -V`;
+	$pversion =~ s/[\r\n]+//g;
+#	$findoutput = `cd $dir; python setup.py --requires`;
+#	if (length($findoutput) < 3) {
 	$findoutput = `find $dir/*.egg-info/ -name "requires.txt" 2>/dev/null`;
+#	}
 	@findlist = split(/\n/, $findoutput);
 	foreach (@findlist) {
-	    # Adding dependency do buildreqs should be removed when
-	    # distutils is unbroken, i.e. blocks setup.py install from 
-	    # downloading and installing dependencies.
-	    push(@buildreqs, `sed 's/[^a-zA-Z]//g' $dir/*.egg-info/requires.txt`);
-	    chomp(@buildreqs);	    
-	    foreach $item (@buildreqs) {
-		$item = "python-" . $item
-	    }
-	    push(@rdepends, `sed 's/[^a-zA-Z]//g' $dir/*.egg-info/requires.txt`);
+	    push(@rawpythondeps, `sed -e '/^\$/d' "$_" | sed '/^\\[/d'`);
+	    chomp(@rawpythondeps);
+	    push(@rdepends, `sed -e 's/python-//g' "$_" | sed '/^\\[/d'`);
 	    chomp(@rdepends);
+	    if ($recurse_python == 1) {
+		foreach (@rawpythondeps) {
+		    my $ptempdir = tempdir();
+		    $purl = `easy_install -eb $ptempdir "$_" 2>/dev/null`;
+		    $purl =~ s/#.*//;
+		    @purllist = $purl =~ m/Downloading (http:\/\/.*\n)/g;
+		    chomp(@purllist);
+		    
+		    # Remove empty lines
+		    @purllist = grep(/\S/, @purllist);
+
+		    # Recursively create recipes for dependencies
+		    if (@purllist != 0) {
+			if (fork) {
+			    # Parent, do nothing
+			} else {
+			    # child, execute 
+			    print "Recursively creating recipe for: $purllist[0]\n";
+			    exec("cd .. ; create-recipe -r $purllist[0]");
+			}
+		    }
+		}
+		wait;
+	    }
+
 	    foreach $item (@rdepends) {
-		$item = "python-" . $item
+		@pyclean = split(/(\=|\<|\>).*/, $item);
+		if (defined($pyclean[0])) {
+		    $item = lc("python-" . $pyclean[0]);
+		}
 	    }
 	}
 }
@@ -1920,6 +2007,11 @@ if ($uses_configure == 0) {
 	$configure = "none"; 
 }
 
+@files = <$dir/docs/license.txt>;
+foreach (@files) {
+	guess_license_from_file("$_");
+}
+
 @files = <$dir/COPY*>;
 foreach (@files) {
 	guess_license_from_file("$_");
-- 
1.7.9.5



