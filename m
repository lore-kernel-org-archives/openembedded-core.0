Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOG-000867-4c
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115424"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:54 -0700
Message-Id: <f6f5ffe78ec538c7ef1d28e284bf18de80ea474f.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 15/45] shadow shadow-native: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:52:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../files/shadow_fix_for_automake-1.12.patch       |   23 ++++++++++++++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    6 +++-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    6 +++-
 3 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch b/meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..6a27ed3
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
@@ -0,0 +1,23 @@
+Upstream-Status: pending
+
+Automake 1.12 has deprecated automatic de-ANSI-fication support
+
+This patch avoids this issue with automake 1.12:
+
+| configure.in:22: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: shadow-4.1.4.3/configure.in
+===================================================================
+--- shadow-4.1.4.3.orig/configure.in
++++ shadow-4.1.4.3/configure.in
+@@ -19,7 +19,6 @@ AC_PROG_CC
+ AC_ISC_POSIX
+ AC_PROG_LN_S
+ AC_PROG_YACC
+-AM_C_PROTOTYPES
+ AM_PROG_LIBTOOL
+ 
+ dnl Checks for libraries.
diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 38bb922..61fccba 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
@@ -15,7 +15,9 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
            file://add_root_cmd_options.patch \
            file://disable-syslog.patch \
-           file://useradd.patch"
+           file://useradd.patch \
+           file://shadow_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778" 
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 60fb78b..098b0b0 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -19,7 +19,9 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
            file://shadow-4.1.4.2-groupmod-pam-check.patch \
            file://shadow-4.1.4.2-su_no_sanitize_env.patch \
-           file://shadow-update-pam-conf.patch"
+           file://shadow-update-pam-conf.patch \
+           file://shadow_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
-- 
1.7.7.6



