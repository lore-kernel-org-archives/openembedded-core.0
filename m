Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qckmo-00065k-A5
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 22:58:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2011 13:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,460,1304319600"; d="scan'208";a="20686849"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2011 13:54:16 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 13:54:13 -0700
Message-Id: <bb46259b00ec3b6f048dba65960b9e6f77bb91bb.1309553576.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1309553576.git.nitin.a.kamble@intel.com>
References: <cover.1309553576.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] perl: Fix package qa rpath warnings.
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
X-List-Received-Date: Fri, 01 Jul 2011 20:58:02 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fix these kinds of Package QA warnings before they are converted into fetal errors:

WARNING: QA Issue: package perl-module-compress contains bad RPATH /build_disk/poky_build/build0/tmp/sysroots/qemux86/usr/lib in file /build_disk/poky_build/build0/tmp/work/i586-poky-linux/perl-5.12.3-r1/packages-split/perl-module-compress/usr/lib/perl/5.12.3/auto/Compress/Raw/Zlib/Zlib.so

This fixes this warning for perl recipe as well as libxml-parser-perl recipe.
It is a fix to MakeMaker within perl, so all such perl recipes will get
fixed with this perl fix.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../perl/perl-5.12.3/fix_bad_rpath.patch           |   25 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    6 +++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/fix_bad_rpath.patch

diff --git a/meta/recipes-devtools/perl/perl-5.12.3/fix_bad_rpath.patch b/meta/recipes-devtools/perl/perl-5.12.3/fix_bad_rpath.patch
new file mode 100644
index 0000000..7b99857
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.12.3/fix_bad_rpath.patch
@@ -0,0 +1,25 @@
+Upstream-Status:Inappropriate [embedded specific]
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/07/01
+
+Fix these Package QA warnings before they are converted into fetal errors:
+
+WARNING: QA Issue: package perl-module-compress contains bad RPATH /build_disk/poky_build/build0/tmp/sysroots/qemux86/usr/lib in file /build_disk/poky_build/build0/tmp/work/i586-poky-linux/perl-5.12.3-r1/packages-split/perl-module-compress/usr/lib/perl/5.12.3/auto/Compress/Raw/Zlib/Zlib.so
+
+This fixes this warning for perl recipe as well as libxml-parser-perl recipe. 
+It is a fix to MakeMaker within perl, so all such perl recipes will get 
+fixed with this perl fix.
+
+Index: perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+===================================================================
+--- perl-5.12.3.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
++++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+@@ -54,7 +54,7 @@ sub _unix_os2_ext {
+     my($found) = 0;
+ 
+     # Debian-specific: don't use LD_RUN_PATH for standard dirs
+-    $ld_run_path_seen{$_}++ for qw(/lib /usr/lib /usr/X11R6/lib);
++    $ld_run_path_seen{$_}++ for qw(/lib /usr/lib /usr/X11R6/lib SYSROOTLIB);
+ 
+     foreach my $thislib (split ' ', $potential_libs) {
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index b053482..850eef2 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -8,7 +8,7 @@ PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r1"
+PR = "r2"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -68,6 +68,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
         file://native-perlinc.patch \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
+	file://fix_bad_rpath.patch \
 	\
         file://config.sh \
         file://config.sh-32 \
@@ -178,7 +179,8 @@ do_configure() {
 do_compile() {
         sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' ext/Errno/Errno_pm.PL
         sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' cpan/Compress-Raw-Zlib/config.in
-        sed -i -e 's|/usr/lib|${STAGING_LIBDIR}|g' cpan/Compress-Raw-Zlib/config.in
+        sed -i -e 's|/usr/lib|""|g' cpan/Compress-Raw-Zlib/config.in
+        sed -i -e 's|SYSROOTLIB|${STAGING_LIBDIR}|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 
         cd Cross
         oe_runmake perl LD="${CCLD}"
-- 
1.7.4.4



