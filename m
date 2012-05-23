Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDD-0006Lx-Qf
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507162"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:25 -0700
Message-Id: <1d626b4f7d59eb0174cd28721ffc402eb88eb764.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 10/30] libmpc: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libmpc/libmpc_fix_for_automake-1.12.patch      |   26 ++++++++++++++++++++
 meta/recipes-support/libmpc/libmpc_0.8.2.bb        |    5 ++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch b/meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..75fa28e
--- /dev/null
+++ b/meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+this fix avoids this error with automake 1.12
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libmpc.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: mpc-0.8.2/configure.ac
+===================================================================
+--- mpc-0.8.2.orig/configure.ac
++++ mpc-0.8.2/configure.ac
+@@ -86,6 +86,10 @@ AC_PROG_EGREP
+ AC_PROG_SED
+ AC_LANG(C)
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ dnl Check for GMP CFLAGS in gmp.h
+ if test -z "$user_redefine_cc" ; then
+    MPC_GMP_CC_CFLAGS
diff --git a/meta/recipes-support/libmpc/libmpc_0.8.2.bb b/meta/recipes-support/libmpc/libmpc_0.8.2.bb
index f991a8e..7a372ba 100644
--- a/meta/recipes-support/libmpc/libmpc_0.8.2.bb
+++ b/meta/recipes-support/libmpc/libmpc_0.8.2.bb
@@ -2,10 +2,11 @@ require libmpc.inc
 
 DEPENDS = "gmp mpfr"
 
-PR = "r0"
+PR = "r1"
 LICENSE="LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
-SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
+SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz \
+           file://libmpc_fix_for_automake-1.12.patch"
 
 SRC_URI[md5sum] = "e98267ebd5648a39f881d66797122fb6"
 SRC_URI[sha256sum] = "ae79f8d41d8a86456b68607e9ca398d00f8b7342d1d83bcf4428178ac45380c7"
-- 
1.7.7



