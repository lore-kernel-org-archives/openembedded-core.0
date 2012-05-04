Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF4-0000YR-Nf
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486041"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:34 -0700
Message-Id: <b12f1b0ba9425de4f4191da7a7736990c1f46191.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 28/40] gnutls: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gnutls_fix_for_automake-1.12.patch             |   53 ++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.18.bb      |    3 +-
 2 files changed, 55 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/gnutls_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls_fix_for_automake-1.12.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..87603cb
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls_fix_for_automake-1.12.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Pending
+
+This patch fixes following kind of issue with automake 1.12
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libgnutls.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: gnutls-2.12.18/configure.ac
+===================================================================
+--- gnutls-2.12.18.orig/configure.ac
++++ gnutls-2.12.18/configure.ac
+@@ -36,6 +36,9 @@ AC_MSG_RESULT([***
+ 
+ dnl Checks for programs.
+ AC_PROG_CC
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
+ AC_PROG_LN_S
+ GTK_DOC_CHECK(1.1)
+ AC_PATH_PROG([GAA], [gaa])
+Index: gnutls-2.12.18/lib/configure.ac
+===================================================================
+--- gnutls-2.12.18.orig/lib/configure.ac
++++ gnutls-2.12.18/lib/configure.ac
+@@ -31,6 +31,9 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_R
+ AM_CONFIG_HEADER(config.h)
+ 
+ AC_PROG_CC
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
+ lgl_EARLY
+ 
+ AC_LIBTOOL_WIN32_DLL
+Index: gnutls-2.12.18/libextra/configure.ac
+===================================================================
+--- gnutls-2.12.18.orig/libextra/configure.ac
++++ gnutls-2.12.18/libextra/configure.ac
+@@ -31,6 +31,9 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_R
+ AM_CONFIG_HEADER(config.h)
+ 
+ AC_PROG_CC
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
+ xgl_EARLY
+ 
+ AC_LIBTOOL_WIN32_DLL
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.18.bb b/meta/recipes-support/gnutls/gnutls_2.12.18.bb
index 7355855..b0b0f8c 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.18.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.18.bb
@@ -1,10 +1,11 @@
 require gnutls.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
+            file://gnutls_fix_for_automake-1.12.patch \
            "
 
 SRC_URI[md5sum] = "e9215d00d2930e09bc8f23f02b54f2d1"
-- 
1.7.7



