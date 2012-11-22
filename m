Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TbYpU-0001cg-VE
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 16:36:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2012 07:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="251104048"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2012 07:22:12 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2012 17:22:10 +0200
Message-Id: <1353597730-11208-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] perl: use the exported LDDLFLAGS in generate_config_sh script
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
X-List-Received-Date: Thu, 22 Nov 2012 15:36:41 -0000

The perl shared libraries did not have RPATHs set and that made
autoreconf fail when using the SDK. The LDDLFLAGS environment variable
was already exported in the recipe but was not used when generating the
config.sh.

[YOCTO #3338]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../perl/perl-5.14.2/generate-sh.patch             |   16 ++++++++++++----
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/generate-sh.patch b/meta/recipes-devtools/perl/perl-5.14.2/generate-sh.patch
index 47f91c5..27f6e69 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/generate-sh.patch
+++ b/meta/recipes-devtools/perl/perl-5.14.2/generate-sh.patch
@@ -3,10 +3,10 @@ Upstream-Status:Inappropriate [embedded specific]
 Use the ld flags from the supplied configuration file. For sh we need the
 flags that specify to build PIC code so that the shared libraries work.
 
-Index: perl-5.8.8/Cross/generate_config_sh
+Index: perl-5.14.2/Cross/generate_config_sh
 ===================================================================
---- perl-5.8.8.orig/Cross/generate_config_sh	2003-09-05 18:31:08.000000000 +1000
-+++ perl-5.8.8/Cross/generate_config_sh	2007-05-30 09:12:50.000000000 +1000
+--- perl-5.14.2.orig/Cross/generate_config_sh	2010-12-30 04:07:14.000000000 +0200
++++ perl-5.14.2/Cross/generate_config_sh	2012-11-22 15:58:49.852852805 +0200
 @@ -19,10 +19,10 @@
  $callbacks->{'ar'} = [\&simple_process, ["AR", "arm-linux-ar"]];
  $callbacks->{'archname'} = [\&simple_process, ["SYS", "armv4l-linux"]];
@@ -22,7 +22,15 @@ Index: perl-5.8.8/Cross/generate_config_sh
  $callbacks->{'ccname'} = [\&simple_process, ["CC", "arm-linux-gcc"]];
  $callbacks->{'cpp'} = [\&simple_process, ["CCP", "arm-linux-cpp"]];
  $callbacks->{'cppflags'} = [\&simple_process, ["CCPFLAGS", "-fno-strict-aliasing"]];
-@@ -105,6 +105,23 @@
+@@ -30,6 +30,7 @@
+ $callbacks->{'cppstdin'} = [\&simple_process_append, ["CC", "arm-linux-gcc -E", "-E"]];
+ $callbacks->{'full_ar'} = [\&backtick, ["AR", "which $ENV{AR}", "/usr/local/arm/2.95.3/bin/arm-linux-ar"]];
+ $callbacks->{'ld'} = [\&simple_process, ["LD", "arm-linux-ld"]];
++$callbacks->{'lddlflags'} = [\&simple_process, ["LDDLFLAGS", ""]];
+ $callbacks->{'ldflags'} = [\&simple_process, ["LDFLAGS", ""]];
+ $callbacks->{'ldflags_uselargefiles'} = [\&simple_process, ["LDFLAGS", ""]];
+ $callbacks->{'myarchname'} = [\&simple_process, ["SYS", "armv4l-linux"]];
+@@ -105,6 +106,23 @@
  
  }
  
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index bfc34d5..4dac5ce 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r14"
+PR = "r15"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
-- 
1.7.9.5



