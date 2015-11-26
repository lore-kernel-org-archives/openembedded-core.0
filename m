Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF296018C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 16:40:58 +0000 (UTC)
Received: by lffu14 with SMTP id u14so103761895lff.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+zgjuYgxSO6wmOAQrnFJY9Ay2OXH87FpvREEBJZkiYo=;
	b=ujQ9E42sEQYjvxxl433dQGq0yLOMrzGMuhkoRMSgmgGEt7FLTd0gK9Yi0fe3F4o7CR
	RnW0yk7nAF3bV7Eo8uDCQ6WpKnyS80PYst0XpGkSSH491HG4gH/wF6DIbNODDQ8unEAJ
	oMuKFoTuAuR9yN++B6Hqh7QNoYLlLeBi+EPanW0r1UH/gfOHakkZP+m1oNdTR3IfBPom
	4koY8KlwugJY863Py6tKkfzte3RrjuZ+aL8OLW0DEq6fTnZ0RgZumYJ/vnTSijlVdZpp
	sePqW6RMOxh0GRM5Ee8KNYTCGSPQMmikb/3+xD+6WRueDsAdr5Ge04nrRDizSaG+oeUd
	Yqww==
X-Received: by 10.25.145.81 with SMTP id t78mr10527854lfd.86.1448556058393;
	Thu, 26 Nov 2015 08:40:58 -0800 (PST)
Received: from umbar.auriga.ru ([81.95.26.90])
	by smtp.gmail.com with ESMTPSA id
	k14sm4235798lfb.49.2015.11.26.08.40.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Nov 2015 08:40:57 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 19:40:53 +0300
Message-Id: <1448556053-15960-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1448556053-15960-1-git-send-email-dbaryshkov@gmail.com>
References: <1448556053-15960-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 2/2] gcc-4.9: import patch fixing compilation in thumb mode
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
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../gcc/gcc-4.9/0067-fix-arm-thumb.patch           | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 6ac3685..d62e801 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -82,6 +82,7 @@ SRC_URI = "\
     file://0064-handle-target-sysroot-multilib.patch \
     file://0065-gcc-483-universal-initializer-no-warning.patch \
     file://0066-cxxflags-for-build.patch \
+    file://0067-fix-arm-thumb.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch b/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
new file mode 100644
index 0000000..2f262e3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
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


