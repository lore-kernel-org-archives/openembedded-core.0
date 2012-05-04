Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQEy-0000V8-Tx
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486024"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:18 -0700
Message-Id: <d530237f21b166878b54829d3607e6ca593eda0e.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 12/40] libcheck: fix build with automake 1.12
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
 .../libcheck/libcheck_fix_for_automake-1.12.patch  |   26 ++++++++++++++++++++
 meta/recipes-support/libcheck/libcheck_0.9.8.bb    |    6 +++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch b/meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..263f6d6
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libcompat.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: check-0.9.8/configure.ac
+===================================================================
+--- check-0.9.8.orig/configure.ac
++++ check-0.9.8/configure.ac
+@@ -103,6 +103,10 @@ AC_PROG_INSTALL
+ AC_PROG_LN_S
+ AC_PROG_LIBTOOL
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ # add these options to CFLAGS if the compiler supports them
+ AC_DEFUN([AX_CFLAGS_ADD],[AX_C_CHECK_FLAG($1, , , CFLAGS="$CFLAGS $1")])
+ AX_CFLAGS_WARN_ALL_ANSI
diff --git a/meta/recipes-support/libcheck/libcheck_0.9.8.bb b/meta/recipes-support/libcheck/libcheck_0.9.8.bb
index d5b9930..e988d47 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.8.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.8.bb
@@ -5,9 +5,11 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
+           file://libcheck_fix_for_automake-1.12.patch \
+          "
 
 SRC_URI[md5sum] = "5d75e9a6027cde79d2c339ef261e7470"
 SRC_URI[sha256sum] = "82acf956bb07584ffea2bf04d5989fe939c3e74ecf93133a21037fd0f7996a7f"
-- 
1.7.7



