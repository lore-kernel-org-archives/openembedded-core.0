Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJd-0001zk-9f
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2011 16:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="429934739"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2011 16:45:01 -0700
Message-Id: <d54858814ab07ff0ce4982e76433983f8656854d.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 17 Mar 2011 22:40:15 -0700
Date: Tue, 03 May 2011 16:45:01 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 31/33] perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha
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
X-List-Received-Date: Tue, 03 May 2011 23:47:41 -0000

From: Khem Raj <raj.khem@gmail.com>

Ubuntu has moved eglibc to /usr/lib/${arch}-linux-gnu and
/lib/${arch}-linux-gnu so we need that to be added to glibpth in
Configure.

Currently we set LD=ld in environment for recipes inheriting native
class. This overrides the LD settings in the Makefiles of perl and
it tries to link by calling ld which does not work since its using
-l<x> on commandline and ubuntu linker seems not to look into
the new location for these libraries. Its better to use gcc for linking
here anyway

[With tweak from Tom Rini to use CCLD, not LD]
(From OE-Core rev: 8ba700a4c593fd52bd01b6272b4c8285a71964f7)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Further tweaks to Configure-multilib.patch for x86_64 vs x86
from Gary Thomas

Cc: gary@mlbassoc.com
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../perl/files/Configure-multilib.patch            |   15 +++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |   10 +++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/files/Configure-multilib.patch

diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch b/meta/recipes-devtools/perl/files/Configure-multilib.patch
new file mode 100644
index 0000000..545a8b8
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/Configure-multilib.patch
@@ -0,0 +1,15 @@
+Index: perl-5.12.2/Configure
+===================================================================
+--- perl-5.12.2.orig/Configure
++++ perl-5.12.2/Configure
+@@ -1316,8 +1316,9 @@ loclibpth="/usr/local/lib /opt/local/lib
+ loclibpth="$loclibpth /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib"
+ 
+ : general looking path for locating libraries
+-glibpth="/lib /usr/lib $xlibpth"
++glibpth="/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
+ glibpth="$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
++test -f /usr/lib/*-linux-gnu/libc.so && glibpth="/usr/lib/*-linux-gnu $glibpth"
+ test -f /usr/shlib/libc.so && glibpth="/usr/shlib $glibpth"
+ test -f /shlib/libc.so     && glibpth="/shlib $glibpth"
+ test -d /usr/lib64         && glibpth="$glibpth /lib64 /usr/lib64 /usr/local/lib64"
diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
index 0b0c949..0476bdf 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -4,22 +4,22 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
 
 SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
-           file://Configure-multilib.patch;patch=1 \
-           file://perl-configpm-switch.patch;patch=1 \
+           file://Configure-multilib.patch \
+           file://perl-configpm-switch.patch \
            file://parallel_build_fix_1.patch \
            file://parallel_build_fix_2.patch \
            file://parallel_build_fix_3.patch \
            file://parallel_build_fix_4.patch \
            file://parallel_build_fix_5.patch \
            file://parallel_build_fix_6.patch \
-           file://native-nopacklist.patch;patch=1 \
-           file://native-perlinc.patch;patch=1"
+           file://native-nopacklist.patch \
+           file://native-perlinc.patch"
 
 SRC_URI[md5sum] = "29975a69dce54e47fcd6331c085c6c99"
 SRC_URI[sha256sum] = "5678bfd5c2cd59253a26171bf3e681235433b00c730eea8a8046e1b225c11d2f"
-- 
1.7.4.1



