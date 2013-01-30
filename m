Received: from mail-lb0-f174.google.com ([209.85.217.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1U0VYD-0007P9-5O
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 12:09:57 +0100
Received: by mail-lb0-f174.google.com with SMTP id l12so1933131lbo.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 02:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=vdlzAS1X2giyJ5cL7/QmAtRWrqjq3/Mpd1JxVtK0SqQ=;
	b=vUzlLBTKEjE4QqWcxxAWLIN8mVtOcNYRJdaZ7o/SjbZBy/lhcxDd6rp4yXec66bGDh
	VgbtUvxHxf8QdbHqtg+vnf0NaPVTal+P7hns2CqcKfQD8+k3KoLPP37V3du1kdj6mQVw
	wEwFyTcHqCqxK67ax3VOFXHpAUw8Hcq6KQFxwZ7XeOdhNy/KoGsGg5uG9j+xzzoS36C4
	84fV7xKJbhVrq1X5Rrc60LLWEx3ldkyv7ph1MRf5pa7QvLZ0/WmJ5DS1OrI5jwUZAdm7
	7DXLZ3dEOs7NCQZd8vz+RZXaB74MwmOXO0KmQUDLx/V/p8k7hSIWL9LoOrmYpiqRR7ep
	0Kvw==
X-Received: by 10.152.147.202 with SMTP id tm10mr4120740lab.56.1359543256054; 
	Wed, 30 Jan 2013 02:54:16 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id z4sm406553lbn.17.2013.01.30.02.54.14
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 02:54:15 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id C7E084001F4; Wed, 30 Jan 2013 11:54:07 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 11:53:53 +0100
Message-Id: <1359543233-9663-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC][PATCH] Lets face it, adding python dependencies is really a painful manual process, due to setuptools/distutils, ignoring anything other than python dependencies.
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
X-List-Received-Date: Wed, 30 Jan 2013 11:09:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sending this as an RFC, since I believe that alot of this work can be
automated, or at least semi-automated. Perhaps I'm way out of line here,
please let me know if there are any existing tools in this area.

Ponder this:
1. Write you top level python recipe.
2. Instantiate tool X(?bitbake?), instantiating the hacked python installer.
3. hacked installer created template recipes for all dependencies of
   correct version dependencies. (All you need to extract is the URL).
4. Do manual verification on output of licenses, non-python dependencies et.c.
5. Include generated recipes in build.
6. Build normally

This patch refines the python package parsing capabilities of create-recipe.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 scripts/create-recipe |   64 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/scripts/create-recipe b/scripts/create-recipe
index a556e39..779ba03 100755
--- a/scripts/create-recipe
+++ b/scripts/create-recipe
@@ -37,10 +37,12 @@ use File::Basename qw(basename dirname);
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
 my $configure = "";
 my $localename = "";
@@ -59,6 +61,7 @@ my $builder = "";
 
 
 my $oscmode = 0;
+my $python = 0;
 
 my @banned_pkgconfig;
 my %failed_commands;
@@ -1539,7 +1542,7 @@ sub guess_name_from_url {
 	}
 	my $tarfile = $spliturl[0];
 	
-	if ($tarfile =~ /(.*?)\-([0-9\.\-\~]+.*?)\.tar/) {
+	if ($tarfile =~ /(.*?)\-([0-9\.\-\~]+)[-\.].*?\.tar/) {	    
 		$name = $1;
 		$version = $2;
                 $version =~ s/\-/\_/g;
@@ -1678,11 +1681,19 @@ sub write_yaml
 
 sub write_bbfile
 {
+        if ($python == 1) {
+    	    $name = lc("python-" . $name);	    
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
@@ -1705,20 +1716,30 @@ sub write_bbfile
 	    print BBFILE "RDEPENDS_\$\{PN\} += \"@rdepends\"\n";
 	}
 
-	print BBFILE 'PR = "r0"' . "\n\n";
+	print BBFILE 'PR = "r0"' . "\n";
+	if ($python == 1) {
+	    print BBFILE "PV = \"$pversion\"\n\n";
+	}
+
 	print BBFILE "SRC_URI = \"";
 	foreach (@sources) {
 		print BBFILE "$_ \\\n";
 	}
+
 	print BBFILE "\"\n\n";
+	
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
 
 	close(BBFILE);
@@ -1830,34 +1851,34 @@ $fulldir = $dir;
 
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
+        $templic = `cd $dir; python setup.py --license;`;
 	chomp($templic);
 	push(@license, $templic);
-	$summary = `sed '/^Name: */!d; s///;q' $dir/*.egg-info/PKG-INFO`;
+	$summary = `cd $dir; python setup.py --name`;
 	chomp($summary);
-	$description = `sed '/^Summary: */!d; s///;q' $dir/*.egg-info/PKG-INFO`;
+	$description = `cd $dir; python setup.py --description`;
 	chomp($description);
-	$homepage = `sed '/^Home-page: */!d; s///;q' $dir/*.egg-info/PKG-INFO`;
+	$homepage = `cd $dir; python setup.py --url`;
 	chomp($homepage);
-	$findoutput = `find $dir/*.egg-info/ -name "requires.txt" 2>/dev/null`;
+	$pversion = `cd $dir; python setup.py -V`;
+	chomp($pversion);
+#	$findoutput = `cd $dir; python setup.py --requires`;
+#	if (length($findoutput) < 3) {
+	    $findoutput = `find $dir/*.egg-info/ -name "requires.txt" 2>/dev/null`;
+#	}
 	@findlist = split(/\n/, $findoutput);
-	foreach (@findlist) {
-	    # Adding dependency do buildreqs should be removed when
-	    # distutils is unbroken, i.e. blocks setup.py install from 
-	    # downloading and installing dependencies.
-	    push(@buildreqs, `sed 's/[^a-zA-Z]//g' $dir/*.egg-info/requires.txt`);
-	    chomp(@buildreqs);	    
-	    foreach $item (@buildreqs) {
-		$item = "python-" . $item
-	    }
+	foreach (@findlist) {	    
 	    push(@rdepends, `sed 's/[^a-zA-Z]//g' $dir/*.egg-info/requires.txt`);
 	    chomp(@rdepends);
 	    foreach $item (@rdepends) {
-		$item = "python-" . $item
+		$item = lc("python-" . $item);
 	    }
 	}
 }
@@ -1911,6 +1932,7 @@ if (length($configure) > 2) {
 }
 
 
+
 @files = <$dir/configure>;
 foreach (@files) {
 	process_configure("$_");
-- 
1.7.9.5



