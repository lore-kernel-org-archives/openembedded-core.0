Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xL-0006YD-3s
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775249"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:05:09 -0700
Message-Id: <edc9af5d6c8e0a0d3960b58c0983f5f382a477fb.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/12] gcc: Fix volatile access issue for ARM
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:39 -0000

[YOCTO #1130]

This patch brings in a patch from gcc for the following issue:

http://gcc.gnu.org/ml/gcc-patches/2011-03/msg01477.html

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    4 ++-
 .../gcc/gcc-4.6.0/volatile_access_backport.patch   |   28 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/volatile_access_backport.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
index fb5c70d..cb9eb8e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
@@ -7,7 +7,7 @@ require gcc-common.inc
 
 require gcc-4_6-branch-backports.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS =+ "mpfr gmp libmpc"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
@@ -53,7 +53,9 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://gcc-poison-parameters.patch \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
+           file://volatile_access_backport.patch \
 	  "
+
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
 
 SRC_URI[md5sum] = "93d1c436bf991564524701259b6285a2"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/volatile_access_backport.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/volatile_access_backport.patch
new file mode 100644
index 0000000..9c86817
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/volatile_access_backport.patch
@@ -0,0 +1,28 @@
+Pulled from http://gcc.gnu.org/ml/gcc-patches/2011-03/msg01477.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+    gcc/
+    * expr.c (expand_expr_real_1): Only use BLKmode for volatile
+    accesses which are not naturally aligned.
+
+Index: gcc-4.6.0/gcc/expr.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/expr.c	2011-06-01 15:28:55.000000000 -0700
++++ gcc-4.6.0/gcc/expr.c	2011-06-01 15:41:17.154848182 -0700
+@@ -9178,8 +9178,11 @@
+ 		&& modifier != EXPAND_CONST_ADDRESS
+ 		&& modifier != EXPAND_INITIALIZER)
+ 	    /* If the field is volatile, we always want an aligned
+-	       access.  */
+-	    || (volatilep && flag_strict_volatile_bitfields > 0)
++	       access.  Only do this if the access is not already naturally
++	       aligned, otherwise "normal" (non-bitfield) volatile fields
++	       become non-addressable.  */
++	    || (volatilep && flag_strict_volatile_bitfields > 0
++		&& (bitpos % GET_MODE_ALIGNMENT (mode) != 0))
+ 	    /* If the field isn't aligned enough to fetch as a memref,
+ 	       fetch it as a bit field.  */
+ 	    || (mode1 != BLKmode
-- 
1.7.3.4



