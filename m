Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TTkys-0005P1-3y
	for Openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 03:58:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA12iPxp017025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 19:44:25 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 31 Oct 2012 19:44:23 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 1 Nov 2012 10:44:56 +0800
Message-ID: <a45d21827b947f4ddc535b1a3e2892a20267a064.1351676013.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1351676013.git.kai.kang@windriver.com>
References: <cover.1351676013.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/1] create-recipe: update re pattern and output
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
X-List-Received-Date: Thu, 01 Nov 2012 02:58:06 -0000
Content-Type: text/plain

In the URL, there may be more than just digits in the version section,
something like xz 5.1.2alpha. Update RE pattern to catch all the string
after package name and before '.tar' in URL as package version.

And error message which has been sent to /dev/null still shows on Ubuntu
12.10 with perl 5.14. Update the way to find source tar file to eraser
the error message.

configure files may rewrite the version section, and that is not necessary.
Test when version section has been set, omit the version value from
configure files.

And tweak for output to bb file.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/create-recipe |   29 +++++++++++++++++++----------
 1 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/scripts/create-recipe b/scripts/create-recipe
index aba9ac3..776c91d 100755
--- a/scripts/create-recipe
+++ b/scripts/create-recipe
@@ -35,7 +35,8 @@ use File::Basename qw(basename dirname);
 
 
 my $name = "";
-my $version = "TO BE FILLED IN";
+my $predef_version = "TO BE FILLED IN";
+my $version = $predef_version;
 my $description = "";
 my $summary = "";
 my $url = "";
@@ -809,7 +810,7 @@ sub process_configure_ac
 #					$name = $1;
 				}
 			}
-			if (defined($acinit[1])) {
+			if (defined($acinit[1]) and $version eq $predef_version) {
 				my $ver = $acinit[1];
 				$ver =~ s/\[//g;
 				$ver =~ s/\]//g;
@@ -835,7 +836,7 @@ sub process_configure_ac
 #					$name = $1;
 				}
 			}
-			if (defined($acinit[1])) {
+			if (defined($acinit[1]) and $version eq $predef_version) {
 				my $ver = $acinit[1];
 				$ver =~ s/\[//g;
 				$ver =~ s/\]//g;
@@ -1536,7 +1537,7 @@ sub guess_name_from_url {
 	}
 	my $tarfile = $spliturl[0];
 	
-	if ($tarfile =~ /(.*?)\-([0-9\.\-\~]+)[-\.].*?\.tar/) {
+	if ($tarfile =~ /(.*?)\-([0-9\.\-\~]+.*?)\.tar/) {
 		$name = $1;
 		$version = $2;
                 $version =~ s/\-/\_/g;
@@ -1687,8 +1688,8 @@ sub write_bbfile
 	print BBFILE "\"\n\n";
 
 	if (@license <= 0) {
-		print "Can NOT get license from package itself.\n";
-		print "Please update the license and license file manually.\n";
+		print "Can NOT get license from package source files.\n";
+		print "Please update the LICENSE and LIC_FILES_CHKSUM manually.\n";
 	}
 
 	if (@buildreqs > 0) {
@@ -1704,7 +1705,7 @@ sub write_bbfile
 	}
 	print BBFILE "\"\n\n";
 	print BBFILE "SRC_URI[md5sum] = \"$md5sum\"\n";
-	print BBFILE "SRC_URI[sha256sum] = \"$sha256sum\"\n";
+	print BBFILE "SRC_URI[sha256sum] = \"$sha256sum\"\n\n";
 
 	if (@inherits) {
 		print BBFILE "inherit ";
@@ -1800,9 +1801,17 @@ foreach (@tgzfiles) {
 # this is a step backwards in time that is just silly.
 #
 
+my @sourcetars = <$orgdir/$outputdir/*\.tar\.bz2 $orgdir/$outputdir/*\.tar\.gz>;
+if ( length @sourcetars == 0) {
+	print "Can NOT find source tarball. Exiting...\n";
+	exit (1);
+}
+if (defined($sourcetars[0]) and $sourcetars[0] =~ ".*\.tar\.bz2") {
+	system("cd $tmpdir; tar -jxf $sourcetars[0] &>/dev/null");
+} elsif (defined($sourcetars[0]) and $sourcetars[0] =~ ".*\.tar\.gz") {
+	system("cd $tmpdir; tar -zxf $sourcetars[0] &>/dev/null");
+}
 
-system("cd $tmpdir; tar -jxf $orgdir/$outputdir/*\.tar\.bz2 &>/dev/null");
-system("cd $tmpdir; tar -zxf $orgdir/$outputdir/*\.tar\.gz &>/dev/null");
 print "Parsing content    ....\n";
 my @dirs = <$tmpdir/*>;
 foreach (@dirs) {
@@ -1827,7 +1836,7 @@ if ( -e "$dir/configure" ) {
 	$configure = "";
 }
 
-my @files = <$dir/configure.*>;
+my @files = <$dir/configure\.*>;
 
 my $findoutput = `find $dir -name "configure.ac" 2>/dev/null`;
 my @findlist = split(/\n/, $findoutput);
-- 
1.7.5.4



