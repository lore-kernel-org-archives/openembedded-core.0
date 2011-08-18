Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hl-0006Z6-9a
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980221"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:25 -0700
Message-Id: <c7813ddb78370daa8f4331c1c280298b52d61122.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/32] perl-native: Update find_perl to find the perl wrapper
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:46 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

[YOCTO #1157] [YOCTO #829]

This is a common issue to the packages which using 'MakeMaker.pm' to
generate their Makefiles. The function 'find_perl()' in 'MM_Unix.pm'
will be used to figure out the path/link of 'PERL/FULLPERL', but it
always find the 'perl.real' instead of perl wrapper.

Just update it to find the perl wrapper correctly.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../perl/perl-5.12.3/MM_Unix.pm.patch              |   22 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    5 ++-
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch

diff --git a/meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch b/meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch
new file mode 100644
index 0000000..eb92ccb
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch
@@ -0,0 +1,22 @@
+Upstream-Status:Pending
+
+The perl-native should be relocatable while re-use sstate-cache from
+another build, especially the original build was renamed/removed.
+
+To get the MakeMaker.pm works in this case, we need perl wrapper here
+instead of real perl binary.
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+===================================================================
+--- perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm.orig	2011-08-12 16:07:30.000000000 +0800
++++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2011-08-12 16:08:56.000000000 +0800
+@@ -1019,6 +1019,9 @@
+     }
+ 
+     foreach my $name (@$names){
++        # Getting MakeMaker.pm use perl wrapper instead of 'perl.real' directly
++        $name =~ s/perl\.real/perl/ if ($name =~ /perl\.real/);
++
+         foreach my $dir (@$dirs){
+             next unless defined $dir; # $self->{PERL_SRC} may be undefined
+             my ($abs, $val);
diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
index 945ebd4..a8e2346 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r4"
+PR = "r5"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -19,7 +19,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://parallel_build_fix_5.patch \
            file://parallel_build_fix_6.patch \
            file://native-nopacklist.patch \
-           file://native-perlinc.patch"
+           file://native-perlinc.patch \
+           file://MM_Unix.pm.patch"
 
 SRC_URI[md5sum] = "29975a69dce54e47fcd6331c085c6c99"
 SRC_URI[sha256sum] = "5678bfd5c2cd59253a26171bf3e681235433b00c730eea8a8046e1b225c11d2f"
-- 
1.7.6



