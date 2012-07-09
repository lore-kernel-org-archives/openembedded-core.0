Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGys-00041S-Rr
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108533"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:29 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:04 -0700
Message-Id: <7e14d3d1191f2179b9989191bad511de28c4c8dd.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 03/15] gnutls: Fix build with automake 1.12.1
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added new patches:
   avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
   gnutls_fix_for_automake_1.12.1.patch

more details in patch headers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   51 ++++++++++++++++++++
 .../gnutls_fix_for_automake_1.12.1.patch           |   43 ++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.19.bb      |    4 +-
 3 files changed, 97 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/gnutls_fix_for_automake_1.12.1.patch

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
new file mode 100644
index 0000000..dde683f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.19/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
@@ -0,0 +1,51 @@
+Upsteam-Status: Inappropriate 
+
+automake 1.12.x has depricated AM_PROG_MKDIR_P , and throws a warning for that,
+and the warnings are treated as errors becuase of the -Werror parameter.
+
+These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not 
+eliminated these depricated macros yet. So disable the treatment of warnings
+as errors until gettext is updeated to remove the depricated macros.
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/09
+
+Index: gnutls-2.12.19/configure.ac
+===================================================================
+--- gnutls-2.12.19.orig/configure.ac
++++ gnutls-2.12.19/configure.ac
+@@ -26,7 +26,7 @@ AC_INIT([GnuTLS], [2.12.19], [bug-gnutls
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Werror -Wno-override])
++AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ AM_CONFIG_HEADER(config.h)
+ 
+Index: gnutls-2.12.19/lib/configure.ac
+===================================================================
+--- gnutls-2.12.19.orig/lib/configure.ac
++++ gnutls-2.12.19/lib/configure.ac
+@@ -26,7 +26,7 @@ AC_INIT([libgnutls], [2.12.19], [bug-gnu
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
++AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ AM_CONFIG_HEADER(config.h)
+ 
+Index: gnutls-2.12.19/libextra/configure.ac
+===================================================================
+--- gnutls-2.12.19.orig/libextra/configure.ac
++++ gnutls-2.12.19/libextra/configure.ac
+@@ -26,7 +26,7 @@ AC_INIT([libgnutls-extra], [2.12.19], [b
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
++AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ AM_CONFIG_HEADER(config.h)
+ 
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls_fix_for_automake_1.12.1.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls_fix_for_automake_1.12.1.patch
new file mode 100644
index 0000000..1625255
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls_fix_for_automake_1.12.1.patch
@@ -0,0 +1,43 @@
+Upsteam-Status: Pending
+
+Avoids these kind of warnings:
+Warning: 'libgnutls.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/07/09
+Index: gnutls-2.12.19/configure.ac
+===================================================================
+--- gnutls-2.12.19.orig/configure.ac
++++ gnutls-2.12.19/configure.ac
+@@ -28,6 +28,7 @@ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+ AM_CONFIG_HEADER(config.h)
+ 
+ AC_MSG_RESULT([***
+Index: gnutls-2.12.19/lib/configure.ac
+===================================================================
+--- gnutls-2.12.19.orig/lib/configure.ac
++++ gnutls-2.12.19/lib/configure.ac
+@@ -28,6 +28,7 @@ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+ AM_CONFIG_HEADER(config.h)
+ 
+ AC_PROG_CC
+Index: gnutls-2.12.19/libextra/configure.ac
+===================================================================
+--- gnutls-2.12.19.orig/libextra/configure.ac
++++ gnutls-2.12.19/libextra/configure.ac
+@@ -28,6 +28,7 @@ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+ AM_CONFIG_HEADER(config.h)
+ 
+ AC_PROG_CC
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.19.bb b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
index 7d76510..ff70c07 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.19.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
@@ -1,10 +1,12 @@
 require gnutls.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
+            file://gnutls_fix_for_automake_1.12.1.patch \
+            file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
            "
 
 SRC_URI[md5sum] = "14228b34e3d8ed176a617df40693b441"
-- 
1.7.3.4



