Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQEy-0000S7-Ol
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486023"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:17 -0700
Message-Id: <28b6e77cd369159304e35bcc54980ff3ec311bd5.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 11/40] libmpc: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:41 -0000

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



