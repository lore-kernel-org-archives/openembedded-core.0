Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZfFJ-0006iq-DX
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:35:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2013 03:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="333783965"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga002.fm.intel.com with ESMTP; 07 May 2013 03:17:15 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:20:53 +0300
Message-Id: <1367922053-4678-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libmpc: upgraded to 1.0.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 10:35:48 -0000

License changed from LGPLv2 to LGPLv3.
The automake patch was integrated upstream in a different form.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-support/libmpc/libmpc.inc             |    2 +-
 .../libmpc/libmpc_fix_for_automake-1.12.patch      |   26 --------------------
 meta/recipes-support/libmpc/libmpc_0.8.2.bb        |   16 ------------
 meta/recipes-support/libmpc/libmpc_1.0.1.bb        |   13 ++++++++++
 4 files changed, 14 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-support/libmpc/libmpc_0.8.2.bb
 create mode 100644 meta/recipes-support/libmpc/libmpc_1.0.1.bb

diff --git a/meta/recipes-support/libmpc/libmpc.inc b/meta/recipes-support/libmpc/libmpc.inc
index 6e18e58..0788dc2 100644
--- a/meta/recipes-support/libmpc/libmpc.inc
+++ b/meta/recipes-support/libmpc/libmpc.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Mpc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result. It is built upon and follows the same principles as Mpfr"
 HOMEPAGE = "http://www.multiprecision.org/"
-LICENSE = "LGPLv2"
+LICENSE = "LGPLv3"
 SECTION = "libs"
 
 inherit autotools
diff --git a/meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch b/meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
deleted file mode 100644
index 75fa28e..0000000
--- a/meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-this fix avoids this error with automake 1.12
-
-| automake: warnings are treated as errors
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libmpc.la': linking libtool libraries using a non-POSIX
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-Index: mpc-0.8.2/configure.ac
-===================================================================
---- mpc-0.8.2.orig/configure.ac
-+++ mpc-0.8.2/configure.ac
-@@ -86,6 +86,10 @@ AC_PROG_EGREP
- AC_PROG_SED
- AC_LANG(C)
- 
-+# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
-+m4_pattern_allow([AM_PROG_AR])
-+AM_PROG_AR
-+
- dnl Check for GMP CFLAGS in gmp.h
- if test -z "$user_redefine_cc" ; then
-    MPC_GMP_CC_CFLAGS
diff --git a/meta/recipes-support/libmpc/libmpc_0.8.2.bb b/meta/recipes-support/libmpc/libmpc_0.8.2.bb
deleted file mode 100644
index 7a372ba..0000000
--- a/meta/recipes-support/libmpc/libmpc_0.8.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require libmpc.inc
-
-DEPENDS = "gmp mpfr"
-
-PR = "r1"
-LICENSE="LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
-SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz \
-           file://libmpc_fix_for_automake-1.12.patch"
-
-SRC_URI[md5sum] = "e98267ebd5648a39f881d66797122fb6"
-SRC_URI[sha256sum] = "ae79f8d41d8a86456b68607e9ca398d00f8b7342d1d83bcf4428178ac45380c7"
-
-S = "${WORKDIR}/mpc-${PV}"
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta/recipes-support/libmpc/libmpc_1.0.1.bb b/meta/recipes-support/libmpc/libmpc_1.0.1.bb
new file mode 100644
index 0000000..0b4766c
--- /dev/null
+++ b/meta/recipes-support/libmpc/libmpc_1.0.1.bb
@@ -0,0 +1,13 @@
+require libmpc.inc
+
+DEPENDS = "gmp mpfr"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
+SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b32a2e1a3daa392372fbd586d1ed3679"
+SRC_URI[sha256sum] = "ed5a815cfea525dc778df0cb37468b9c1b554aaf30d9328b1431ca705b7400ff"
+
+S = "${WORKDIR}/mpc-${PV}"
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.7.10.4



