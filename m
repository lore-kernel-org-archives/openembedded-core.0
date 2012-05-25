Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOI-00085Q-2T
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115426"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:56 -0700
Message-Id: <e5d1230855bc3a429550a8822b2ae789781ae1de.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 17/45] systemtap: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../systemtap_fix_for_automake_1.12.patch          |   23 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 3 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch b/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..ef74a09
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending 
+
+Automake 1.12 has deprecated automatic de-ANSI-fication support
+
+Fix this issue with automake 1.12:
+
+| configure.ac:23: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -20,7 +20,6 @@ AC_PROG_CXX
+ AC_PROG_CPP
+ AM_PROG_CC_STDC
+ AM_PROG_CC_C_O
+-AM_C_PROTOTYPES
+ AC_PROG_RANLIB
+ AC_OBJEXT
+ AC_EXEEXT
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 91bccd1..4d340fc 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
-PR = "r3"
+PR = "r4"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 839cec3..9f4feee 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -6,6 +6,7 @@ PV = "1.7+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
+           file://systemtap_fix_for_automake_1.12.patch \
           "
 
 FILESPATH = "${FILE_DIRNAME}/systemtap"
-- 
1.7.7.6



