Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nP-00015s-61
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4vav018160
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:57 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:35 +0800
Message-ID: <48f870021234353b2532f737ab75d3236ab99bf9.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/17] generate-sh.patch:fix autoreconf run failed on gmae-toolchain
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
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
Content-Type: text/plain

The perl shared libraries did not have RPATHs set and that made
autoreconf fail when using the SDK. The LDDLFLAGS environment variable
was already exported in the recipe but was not used when generating the
config.sh.

Cherry-pick commit df1a1dcb6d95a4aa558019530445373537c4efdd

[YOCTO #3338]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/perl-5.14.2/generate-sh.patch                 |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

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
  
-- 
1.7.10.4



