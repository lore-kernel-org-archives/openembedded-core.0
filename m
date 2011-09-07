Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Lrk-0001UH-6A
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 19:24:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2011 10:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="48975149"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2011 10:19:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 10:19:34 -0700
Message-Id: <ebc08824e0f440526c40294f873e62b99daa7e1c.1315415799.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315415799.git.sgw@linux.intel.com>
References: <cover.1315415799.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315415799.git.sgw@linux.intel.com>
References: <cover.1315415799.git.sgw@linux.intel.com>
Subject: [PULL v3 1/1] gcc: add patch for ice 50099, which caused lttng-ust not to build
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
X-List-Received-Date: Wed, 07 Sep 2011 17:24:48 -0000

[YOCTO #1381]

This patch came from from GCC Bugzilla via Khem

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   49 ++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 380f9f7..f7bcf30 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r9"
+PR = "r10"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -67,6 +67,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
            file://volatile_access_backport.patch \
            file://use-defaults.h-and-t-oe-in-B.patch \
 	   file://powerpc-e5500.patch \
+           file://fix-for-ice-50099.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch b/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch
new file mode 100644
index 0000000..57b03d2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch
@@ -0,0 +1,49 @@
+
+This patch address an issue with the compiler generating an ICE
+during compliation of lttng-ust.
+
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50099
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@gmail.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: gcc/config/arm/arm.md
+===================================================================
+--- gcc-4.6.0/gcc/config/arm/arm.md	(revision 178135)
++++ gcc-4.6.0/gcc/config/arm/arm.md	(working copy)
+@@ -4217,6 +4217,7 @@ (define_split
+   "TARGET_32BIT"
+   [(set (match_dup 0) (ashiftrt:SI (match_dup 1) (const_int 31)))]
+ {
++  rtx srcop = operands[1];
+   rtx lo_part = gen_lowpart (SImode, operands[0]);
+   enum machine_mode src_mode = GET_MODE (operands[1]);
+ 
+@@ -4224,14 +4225,21 @@ (define_split
+       && !reg_overlap_mentioned_p (operands[0], operands[1]))
+     emit_clobber (operands[0]);
+ 
++  if (TARGET_ARM && src_mode == QImode
++      && !arm_reg_or_extendqisi_mem_op (srcop, QImode))
++    {
++      rtx dest = gen_lowpart (QImode, lo_part);
++      emit_move_insn (dest, srcop);
++      srcop = dest;
++    }
+   if (!REG_P (lo_part) || src_mode != SImode
+-      || !rtx_equal_p (lo_part, operands[1]))
++      || !rtx_equal_p (lo_part, srcop))
+     {
+       if (src_mode == SImode)
+-        emit_move_insn (lo_part, operands[1]);
++        emit_move_insn (lo_part, srcop);
+       else
+         emit_insn (gen_rtx_SET (VOIDmode, lo_part,
+-				gen_rtx_SIGN_EXTEND (SImode, operands[1])));
++				gen_rtx_SIGN_EXTEND (SImode, srcop)));
+       operands[1] = lo_part;
+     }
+   operands[0] = gen_highpart (SImode, operands[0]);
+
-- 
1.7.6



