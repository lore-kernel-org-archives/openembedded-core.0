Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDD-0006Ll-Ig
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:13:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507161"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:24 -0700
Message-Id: <6dc66032f448b765d6e96f4921741522f75f607d.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 09/30] systemtap: fix build with automake 1.12
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
1.7.7



