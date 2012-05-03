Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iQ-0001ng-RD
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065366"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:26 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:17 -0700
Message-Id: <4f9a0751b1c32e88e04408ecf998047f46b31922.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 23/28] lighttpd: fix build with automake 1.12
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
X-List-Received-Date: Thu, 03 May 2012 18:25:24 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../files/lighttpd_fix_for_automake-1.12.patch     |   37 ++++++++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    5 ++-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch b/meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..42451b8
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| configure.ac:42: error: automatic de-ANSI-fication support has been removed
+...
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'liblightcomp.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: lighttpd-1.4.30/configure.ac
+===================================================================
+--- lighttpd-1.4.30.orig/configure.ac
++++ lighttpd-1.4.30/configure.ac
+@@ -24,6 +24,11 @@ dnl AC_PROG_CXX
+ AC_PROG_LN_S
+ AC_PROG_MAKE_SET
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
++
+ dnl check environment
+ AC_AIX
+ AC_ISC_POSIX
+@@ -39,7 +44,6 @@ AM_CONDITIONAL(NO_RDYNAMIC, test x$NO_RD
+ AC_EXEEXT
+ 
+ dnl more automake stuff
+-AM_C_PROTOTYPES
+ 
+ dnl libtool
+ AC_DISABLE_STATIC
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
index 3ae3867..161c0d9 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
@@ -16,13 +16,14 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
-"
+        file://lighttpd_fix_for_automake-1.12.patch \
+        "
 
 SRC_URI[md5sum] = "63f9df52dcae0ab5689a95c99c54e48a"
 SRC_URI[sha256sum] = "0d795597e4666dbf6ffe44b4a42f388ddb44736ddfab0b1ac091e5bb35212c2d"
-- 
1.7.7



