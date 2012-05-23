Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDG-0006MK-CD
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507175"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:35 -0700
Message-Id: <c4a8e41a9a785c0bb0167145f941aaf9703dfc5b.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 20/30] gnutls: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gnutls_fix_for_automake-1.12.patch             |   53 ++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.19.bb      |    3 +-
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
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.19.bb b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
index 7d76510..261668c 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.19.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
@@ -1,10 +1,11 @@
 require gnutls.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
+            file://gnutls_fix_for_automake-1.12.patch \
            "
 
 SRC_URI[md5sum] = "14228b34e3d8ed176a617df40693b441"
-- 
1.7.7



