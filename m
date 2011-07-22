Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABm-0008Sl-J2
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084143"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:25:58 -0700
Message-Id: <cccd66f90cceb3f625cd5060c927bdaa9a8dda83.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/16] strace: Define own sigmask macro if not defined already in signal.h
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:26 -0000

From: Khem Raj <raj.khem@gmail.com>

This is required especially on uclibc systems where BSD compatible
obsolete functions are disabled by kconfig. Therefore we check
if the macro is undefined then we define it. Therefore eglibc/glibc
builds should work as they use to.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/strace-4.5.20/sigmask.patch             |   22 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.5.20.bb      |    6 +++-
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch

diff --git a/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch b/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
new file mode 100644
index 0000000..9bca528
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
@@ -0,0 +1,22 @@
+sigmask is a macro which is dropped if BSD compatibility is
+not enabled. So we check if the macro does not exist then
+we define it to __sigmask
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: strace-4.5.20/signal.c
+===================================================================
+--- strace-4.5.20.orig/signal.c	2010-02-23 13:26:16.000000000 -0800
++++ strace-4.5.20/signal.c	2011-07-20 23:06:35.842339197 -0700
+@@ -140,6 +140,11 @@
+ #endif
+ #endif /* LINUX */
+ 
++#if !defined (sigmask) && defined (__sigmask)
++/* Compute mask for signal SIG.  */
++#define sigmask(sig)   __sigmask(sig)
++#endif /* sigmask */
++
+ const char *const signalent0[] = {
+ #include "signalent.h"
+ };
diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
index 3dba59f..391669f 100644
--- a/meta/recipes-devtools/strace/strace_4.5.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
+           file://sigmask.patch \
+          "
 
 SRC_URI[md5sum] = "64dfe10d9db0c1e34030891695ffca4b"
 SRC_URI[sha256sum] = "ea8c059369eaa5ad90b246f34eab247d0ee48bfdee2670c7196320a4669ccabd"
-- 
1.7.3.4



