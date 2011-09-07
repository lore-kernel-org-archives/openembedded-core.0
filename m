Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1KrS-0000HI-OT
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:20:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 09:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="14852903"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 09:15:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 09:15:19 -0700
Message-Id: <ef665bb679acf1fa9293cd5c0a94bfa0a07042d1.1315411996.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315411996.git.sgw@linux.intel.com>
References: <cover.1315411996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315411996.git.sgw@linux.intel.com>
References: <cover.1315411996.git.sgw@linux.intel.com>
Subject: [PULL v2 1/1] gcc: add patch for ice 50099, which caused lttng-ust not to build
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
X-List-Received-Date: Wed, 07 Sep 2011 16:20:27 -0000

[YOCTO #1381]

This patch came from from GCC Bugzilla via Khem

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/fix-for-ice-25202.patch            |   38 +++++++++++++++
 .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   49 ++++++++++++++++++++
 3 files changed, 89 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-25202.patch
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
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-25202.patch b/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-25202.patch
new file mode 100644
index 0000000..4b9f70d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-25202.patch
@@ -0,0 +1,38 @@
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



