Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3377578498
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 02:32:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA82WVZw025845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Nov 2017 18:32:31 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 7 Nov 2017 18:32:30 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Nov 2017 10:33:52 +0800
Message-ID: <3046a8f95f1c449bc4a4f908ed66b39b61e764be.1510108243.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1510108243.git.Qi.Chen@windriver.com>
References: <cover.1510108243.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc: backport patch to fix miscompilation on mips64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 02:32:31 -0000
Content-Type: text/plain

Backport a patch to fix miscompilation on mips64.

We've observed strange behaviour of `systemctl status <xxx> on qemumips64.
The output of the command is like `systemctl show <xxx>', which is incorrect.

The problem is due to the miscompilation of gcc for mips64 platform, thus
backporting patch from upstream to fix this problem.

[YOCTO #12266]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../gcc-7.2/0001-PR-rtl-optimization-81803.patch   | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 5883bc6..ebed5b9 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            ${BACKPORTS} \
 "
 BACKPORTS = "\
+           file://0001-PR-rtl-optimization-81803.patch \
 "
 SRC_URI[md5sum] = "ff370482573133a7fcdd96cd2f552292"
 SRC_URI[sha256sum] = "1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a"
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch b/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
new file mode 100644
index 0000000..292e734
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
@@ -0,0 +1,52 @@
+From 5cbb8e6b1122092b3eaabd4270b2f316aa40407c Mon Sep 17 00:00:00 2001
+From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 31 Oct 2017 18:27:52 +0000
+Subject: [PATCH] 	PR rtl-optimization/81803 	* lra-constraints.c
+ (curr_insn_transform): Also reload the whole 	register for a strict subreg
+ no wider than a word if this is for 	a WORD_REGISTER_OPERATIONS target.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@254275 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+
+This patch removes changes to Changelog from the original patch upstream. This is
+because we are backporting a patch to a stable version, making changes to Changelog,
+especially up '* GCC 7.2.0 released.', feels a little weird.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ gcc/lra-constraints.c | 11 ++++++++---
+ 2 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index a423f069836..3758409bb9c 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -4207,8 +4207,9 @@ curr_insn_transform (bool check_only_p)
+ 	      reg = SUBREG_REG (*loc);
+ 	      byte = SUBREG_BYTE (*loc);
+ 	      if (REG_P (reg)
+-		  /* Strict_low_part requires reload the register not
+-		     the sub-register.	*/
++		  /* Strict_low_part requires reloading the register and not
++		     just the subreg.  Likewise for a strict subreg no wider
++		     than a word for WORD_REGISTER_OPERATIONS targets.  */
+ 		  && (curr_static_id->operand[i].strict_low
+ 		      || (!paradoxical_subreg_p (mode, GET_MODE (reg))
+ 			  && (hard_regno
+@@ -4219,7 +4220,11 @@ curr_insn_transform (bool check_only_p)
+ 			  && (goal_alt[i] == NO_REGS
+ 			      || (simplify_subreg_regno
+ 				  (ira_class_hard_regs[goal_alt[i]][0],
+-				   GET_MODE (reg), byte, mode) >= 0)))))
++				   GET_MODE (reg), byte, mode) >= 0)))
++		      || (GET_MODE_PRECISION (mode)
++			  < GET_MODE_PRECISION (GET_MODE (reg))
++			  && GET_MODE_SIZE (GET_MODE (reg)) <= UNITS_PER_WORD
++			  && WORD_REGISTER_OPERATIONS)))
+ 		{
+ 		  /* An OP_INOUT is required when reloading a subreg of a
+ 		     mode wider than a word to ensure that data beyond the
+-- 
+2.13.0
+
-- 
1.9.1


