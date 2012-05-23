Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDO-0006MK-4A
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507188"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:44 -0700
Message-Id: <d4754648bcecd00177c9785c9275e2d00ae1206b.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 29/30] findutils-4.2.31: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:12 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../findutils_fix_for_automake-1.12.patch          |   23 ++++++++++++++++++++
 .../recipes-extended/findutils/findutils_4.2.31.bb |    6 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch b/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..2d0ddb4
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.in:75: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: findutils-4.2.31/configure.in
+===================================================================
+--- findutils-4.2.31.orig/configure.in
++++ findutils-4.2.31/configure.in
+@@ -72,7 +72,6 @@ dnl gl_EARLY calls AC_GNU_SOURCE anyway.
+ 
+ 
+ AC_ISC_POSIX
+-AM_C_PROTOTYPES
+ 
+ AC_PROG_INSTALL
+ AC_PROG_RANLIB
diff --git a/meta/recipes-extended/findutils/findutils_4.2.31.bb b/meta/recipes-extended/findutils/findutils_4.2.31.bb
index 0c37836..37da0ce 100644
--- a/meta/recipes-extended/findutils/findutils_4.2.31.bb
+++ b/meta/recipes-extended/findutils/findutils_4.2.31.bb
@@ -8,10 +8,12 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz \
-           file://gnulib-extension.patch"
+           file://gnulib-extension.patch \
+           file://findutils_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "a0e31a0f18a49709bf5a449867c8049a"
 SRC_URI[sha256sum] = "e0d34b8faca0b3cca0703f6c6b498afbe72f0ba16c35980c10ec9ef7724d6204"
-- 
1.7.7



