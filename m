Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDE-0006Lj-8i
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507163"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:26 -0700
Message-Id: <4ab41272f48bc31f26b8cf697731d6a24f361c25.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 11/30] libcheck: fix build with automake 1.12
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



