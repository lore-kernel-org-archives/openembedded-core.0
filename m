Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SbcTk-0003t0-VO
	for Openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 20:58:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q54Ilkra001712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 4 Jun 2012 11:47:47 -0700 (PDT)
Received: from ord-jrw.wrs.com (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 4 Jun 2012 11:47:46 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2012 13:47:44 -0500
Message-ID: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
Subject: [PATCH v2] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Mon, 04 Jun 2012 18:58:13 -0000
Content-Type: text/plain

If any directory in leading up to your tmp directory has the name "t"
perl will fail to build with a very cryptic error shown below:

pod/buildtoc: no pods at pod/buildtoc line 305.
make[1]: *** [pod/perltoc.pod] Error 255

This is a result of the perl file checking making an assumption
that it is only looking at files and directories with in the perl
source directory.  This assumption fails with the way bitbake
sets up perl to properly cross compile.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../perl/perl-5.14.2/perl-build-in-t-dir.patch     |   42 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    5 ++-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    3 +-
 3 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
new file mode 100644
index 0000000..16064ed
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
@@ -0,0 +1,42 @@
+Upstream-Status:Pending
+
+Perl cannot cross build in a path containing a directory that has the
+name of "t".  As an example, you can make the perl build fail with
+"mkdir -p /tmp/build/t", go to the directory, unpack the sources,
+configure and cross build.
+
+You get an error like the following:
+    pod/buildtoc: no pods at pod/buildtoc line 305.
+    make[1]: *** [pod/perltoc.pod] Error 255
+
+The fix is to strip off the top directory that you are building in and
+then execute all the same logic as before against the path relative to
+the build directory.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+---
+ pod/buildtoc |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/pod/buildtoc
++++ b/pod/buildtoc
+@@ -274,8 +274,10 @@ if ($Build{toc}) {
+   find \&getpods => abs_from_top('lib/');
+ 
+   sub getpods {
++    my $Top = $FindBin::Bin;
+     if (/\.p(od|m)$/) {
+       my $file = $File::Find::name;
++      $file =~ s!^$Top!!;
+       return if $file =~ qr!/lib/Pod/Functions.pm\z!; # Used only by pod itself
+       return if $file =~ m!(?:^|/)t/!;
+       return if $file =~ m!lib/Attribute/Handlers/demo/!;
+@@ -283,7 +285,7 @@ if ($Build{toc}) {
+       return if $file =~ m!lib/Math/BigInt/t/!;
+       return if $file =~ m!/Devel/PPPort/[Hh]arness|lib/Devel/Harness!i;
+       return if $file =~ m!XS/(?:APItest|Typemap)!;
+-      my $pod = $file;
++      my $pod = $file = $File::Find::name;
+       return if $pod =~ s/pm$/pod/ && -e $pod;
+       unless (open my $f, '<', $_) {
+ 	warn "$0: bogus <$file>: $!";
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
index c904c37..df8f058 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -14,7 +14,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://perl-configpm-switch.patch \
            file://native-nopacklist.patch \
            file://native-perlinc.patch \
-           file://MM_Unix.pm.patch"
+           file://MM_Unix.pm.patch \
+           file://perl-build-in-t-dir.patch"
 
 SRC_URI[md5sum] = "3306fbaf976dcebdcd49b2ac0be00eb9"
 SRC_URI[sha256sum] = "6488359573bd7d41761bf935f66f827dc220fb3df961ef9b775d51fbd66548d3"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 809fc72..2452a44 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r6"
+PR = "r7"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -65,6 +65,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
 	file://fix_bad_rpath.patch \
+	file://perl-build-in-t-dir.patch \
 	\
         file://config.sh \
         file://config.sh-32 \
-- 
1.7.10



