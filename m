Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDC-0006Ll-O3
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:13:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507158"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:21 -0700
Message-Id: <b31c130bdd467810fe42c98b974d734ae61f4ca4.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 06/30] shadow shadow-native: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:13:59 -0000

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
1.7.7



