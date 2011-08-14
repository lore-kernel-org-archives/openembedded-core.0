Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QsakN-0002Sw-NU
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Aug 2011 15:29:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Aug 2011 06:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,369,1309762800"; d="scan'208";a="38296621"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by azsmga001.ch.intel.com with ESMTP; 14 Aug 2011 06:24:22 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 21:32:27 +0800
Message-Id: <fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313328487.git.ke.yu@intel.com>
References: <cover.1313328487.git.ke.yu@intel.com>
Subject: [PATCH 1/1] gcc-cross-intermediate: revise the 64bithack.patch for multilib case
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
X-List-Received-Date: Sun, 14 Aug 2011 13:29:00 -0000

current gcc-cross-intermediate has build failure in qemux86-64 lib64
multilib case. the reason is that it still use lib instead of lib64
while do_install use the libdir i.e. lib64

so this patch fix this issue by making gcc honour the libdir.

CC: Kumar Gala <galak@kernel.crashing.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 0a148b4..ff8ca24 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r7"
+PR = "r8"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
index 4b846bb..c1129ca 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
@@ -5,18 +5,20 @@ By default gcc places 64 bit libs in a lib64 directory. This makes it use
 
 RP 25/7/10
 
+revise it to honour base_libdir
+
+Yu Ke <ke.yu@intel.com> Aug 13, 2011
+
 Index: gcc-4.6.0/gcc/config/i386/t-linux64
 ===================================================================
 --- gcc-4.6.0.orig/gcc/config/i386/t-linux64
 +++ gcc-4.6.0/gcc/config/i386/t-linux64
-@@ -24,8 +24,8 @@
- # MULTILIB_OSDIRNAMES according to what is found on the target.
- 
+@@ -25,7 +25,7 @@
+
  MULTILIB_OPTIONS = m64/m32
--MULTILIB_DIRNAMES = 64 32 
+ MULTILIB_DIRNAMES = 64 32 
 -MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
-+MULTILIB_DIRNAMES = . 32
-+MULTILIB_OSDIRNAMES = . $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
- 
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
+
  LIBGCC = stmp-multilib
  INSTALL_LIBGCC = install-multilib
-- 
1.7.0.4



