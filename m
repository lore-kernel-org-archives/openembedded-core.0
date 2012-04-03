Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SFCoQ-0005q2-7X
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:06:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 15:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125036679"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 15:57:43 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 15:57:41 -0700
Message-Id: <3c9f0f3047f80b6290ea2ceb4fcecdb7b286c1d5.1333493785.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1333493785.git.nitin.a.kamble@intel.com>
References: <cover.1333493785.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] gcc-cross-intermediate: fix do_install for x32
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
X-List-Received-Date: Tue, 03 Apr 2012 23:06:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This Fixes [Ycoto #2223] bug.

The gcc osdir is obtained in the do_install by invocation of
command "gcc -print-multi-os-directory". For x32 it returns gcc
osdir for the default abi which is x86_64. Fix this by adding
target abi parameter to the gcc command line to get correct gcc
osdir with invocation of command "gcc -mx32 -print-multi-os-directory"

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gcc/gcc-cross-intermediate.inc                 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index 316a764..1995725 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -35,9 +35,10 @@ do_compile () {
 }
 
 do_install () {
+	set -x
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${target_base_libdir}/
-	osdir=`${D}${STAGING_BINDIR_TOOLCHAIN}.${PN}/${TARGET_PREFIX}gcc -print-multi-os-directory`
+	osdir=`${D}${STAGING_BINDIR_TOOLCHAIN}.${PN}/${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} -print-multi-os-directory`
 	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/$osdir/* ${D}${target_base_libdir}/
 
 	# We don't really need this (here shares/ contains man/, info/, locale/).
-- 
1.7.7.6



