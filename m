Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5V-0004XN-JY
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736832"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:43:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:47 -0700
Message-Id: <8ff009be81d9291ff68a4b29d3ecc0d9c27b3615.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/18] eglibc: Fix build for e500 cores
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:26 -0000

From: Khem Raj <raj.khem@gmail.com>

e500 support needed to be updared to match eglibc 2.16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../eglibc/eglibc-2.16/e500-math_private.patch     |   31 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch b/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
new file mode 100644
index 0000000..9dbb26e
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
@@ -0,0 +1,31 @@
+Match with the latest math_private restructuring in glibc
+
+as done here
+
+http://sourceware.org/ml/libc-alpha/2012-03/msg00302.html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h
+===================================================================
+--- libc.orig/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h	2012-07-17 22:58:20.340405923 -0700
++++ libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h	2012-07-17 22:58:21.120405923 -0700
+@@ -1 +1 @@
+-#include <math/math_private.h>
++#include_next <sysdeps/generic/math_private.h>
+Index: libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c
+===================================================================
+--- libc.orig/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c	2012-07-17 23:15:15.872405939 -0700
++++ libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c	2012-07-17 23:18:42.760405602 -0700
+@@ -23,7 +23,7 @@
+ 
+ #undef feraiseexcept
+ 
+-#define __FERAISEEXCEPT_INTERNAL feraiseexcept
++#define __FERAISEEXCEPT_INTERNAL __feraiseexcept
+ #include "../spe-raise.c"
+ 
+-libm_hidden_def (feraiseexcept)
++libm_hidden_ver (__feraiseexcept, feraiseexcept)
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 09f5dbb..23a4130 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "19383"
 
 DEPENDS += "gperf-native"
-PR = "r0"
+PR = "r1"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -22,6 +22,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://eglibc_fix_findidx_parameters.patch \
            file://ppc_slow_ieee754_sqrt.patch \
            file://rpc-bootstrap.patch \
+           file://e500-math_private.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.7.6



