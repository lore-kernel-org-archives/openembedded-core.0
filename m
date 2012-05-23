Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SX3t9-0008Tl-N3
	for Openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 07:13:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4N53OTc024597
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 22:03:24 -0700 (PDT)
Received: from localhost.localdomain (128.224.60.100) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 22 May 2012 22:03:23 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2012 00:03:21 -0500
Message-ID: <1337749401-27198-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.6.6.2
MIME-Version: 1.0
Subject: [PATCH] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Wed, 23 May 2012 05:13:36 -0000
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
 .../perl/perl-5.14.2/perl-build-in-t-dir.patch     |   35 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    3 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    1 +
 3 files changed, 38 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
new file mode 100644
index 0000000..cd36ec5
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
@@ -0,0 +1,35 @@
+Upstream-Status:Pending
+
+Perl cannot cross build in a path containing a directory that
+has the name of "t".
+
+You get an error like:
+
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
index c904c37..429a029 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
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
index 809fc72..2149b30 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -65,6 +65,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
 	file://fix_bad_rpath.patch \
+	file://perl-build-in-t-dir.patch \
 	\
         file://config.sh \
         file://config.sh-32 \
-- 
1.6.6.2



