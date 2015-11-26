Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8B56011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 16:40:57 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so103019655lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 08:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lbYS62zuihKc2VjblCqMeX1wdVwlddAxySsQ2AQeB7E=;
	b=x1/qcJu5gALBQk9xyjv4NDif5hJ2H8zW9D9f2celGh0dfiXKDZauc6WeOKEhrg5mdl
	+MGDkvP2JOv3jeXbPTF9TRIiLNDhU/BnrjJoWHvMqaXBCn3d7rMZl3Iqv7YLBx4RYQq5
	LmKsVURF9IlZrT3iEjLhIXQdFBOKoEAE/CceczPMOqUlifFx24/VWqOD7r3h5LVEEMo0
	AHDbdwksNvXxnlOKvYhApjfjLDOJEuwlVD4toyJjBI66sUaRQwRv/dCWz3bQ6J9spaDj
	y+gQOOYP5OZVSlJPoJGtiHFFrc04Y+Apa8WcIN0nAhjYvlui1bFm0ZFBkWwDa0ECskcT
	7y0g==
X-Received: by 10.25.162.144 with SMTP id l138mr18146983lfe.30.1448556057407; 
	Thu, 26 Nov 2015 08:40:57 -0800 (PST)
Received: from umbar.auriga.ru ([81.95.26.90])
	by smtp.gmail.com with ESMTPSA id
	k14sm4235798lfb.49.2015.11.26.08.40.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Nov 2015 08:40:56 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 19:40:52 +0300
Message-Id: <1448556053-15960-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 1/2] gcc-5.2: import patch fixing compilation in thumb mode
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
X-List-Received-Date: Thu, 26 Nov 2015 16:40:59 -0000

Import patch fixing a bug that caused ICE when compiling some packages
(e.g. ICU) in Thumb-1 model.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.2.inc              |  1 +
 .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/gcc/gcc-5.2.inc
index a6b385a..e5e92e9 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0040-nativesdk-gcc-support.patch \
            file://0041-handle-target-sysroot-multilib.patch \
            file://0042-cxxflags-for-build.patch \
+           file://0043-fix-arm-thumb.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch b/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
new file mode 100644
index 0000000..2f262e3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Accepted
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+
+2015-11-25  Vladimir Makarov  <vmakarov@redhat.com>
+
+	PR rtl-optimization/67954
+	* lra-constraints.c (curr_insn_transform): Add check on scratch
+	pseudo when change class to NO_REGS.  Add an assert.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@230894 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index 4670e81..c62bf6a 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -3725,7 +3725,8 @@ curr_insn_transform (bool check_only_p)
+ 		 assigment pass and the scratch pseudo will be
+ 		 spilled.  Spilled scratch pseudos are transformed
+ 		 back to scratches at the LRA end.  */
+-	      && lra_former_scratch_operand_p (curr_insn, i))
++	      && lra_former_scratch_operand_p (curr_insn, i)
++	      && lra_former_scratch_p (REGNO (op)))
+ 	    {
+ 	      int regno = REGNO (op);
+ 	      lra_change_class (regno, NO_REGS, "      Change to", true);
+@@ -3734,6 +3735,8 @@ curr_insn_transform (bool check_only_p)
+ 		   spilled pseudo as there is only one such insn, the
+ 		   current one.  */
+ 		reg_renumber[regno] = -1;
++	      lra_assert (bitmap_single_bit_set_p
++			  (&lra_reg_info[REGNO (op)].insn_bitmap));
+ 	    }
+ 	  /* We can do an optional reload.  If the pseudo got a hard
+ 	     reg, we might improve the code through inheritance.  If
-- 
2.6.2


