Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE8960CC9
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:07 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id z12so2535079pgl.4
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i/Icngzo9E3yVrDEmGvUdyGDmwcnTVqKwGmBKSxurL8=;
	b=rajpqf61RvkPlJCY6iKip/9ElA5JyI0ODbqs/vLD4aYKWB7TWxNwsFcfTy+qpSNPYO
	ThCK0GTX5kH0Q5gakJ7unlC0U9UAnYwWqMIJoTcSdd62m+vHL6HOFzpFHbRsQoZO61Hc
	S9x/H5RO4eQ0Bm6nm5R7WJHqPKSfFuzDovbNQya/HLkf3WOqefgF+8+kfgyeZReGMv9W
	wYuBsmRQEaFA01EmPvls4IZ3DpOKJKNdX05p8p3n3rtcpYSbRWz2xAqQQs3o5MVuqqOr
	NyPoiVrqq2a5n2sA3E7VDnu2J6L3PNJR+fxZ0EmUUXg29iDVcR34nxO1C6bs2gRfnk7G
	p3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i/Icngzo9E3yVrDEmGvUdyGDmwcnTVqKwGmBKSxurL8=;
	b=aEzXvdgDFR9z9cN+ABgbcn2YimEwoHc7rqMet0r5cugNlnYrbDKRG2bKJfG6UIvMop
	wJB141QXl2wXfygij89smD+bQu26ia+zRg6p0C/hjmLPBSY0EBP4wFGiI8nIMRlUTFd6
	eh/PIfSxpDcJunFU0mb0dwpjvmMsbAmB8X0/S7GYPPSTMEcL11HfUkdJK5zAFG9TbXgk
	vvpHDMggvLIE4zCHiJPAlDr2ImV039qtFyJPly9WGEQ3gejvMBqyVbnHne4RRVKYksD7
	gcVoNVvKR1Zhh7SESzWwwj9fs1f22ZWtbIbN7FBzt70pM5TTt/zuf/vFvYGCmblVZVhp
	jFwQ==
X-Gm-Message-State: APjAAAUx4Am3aIaHh0sM+Znn6ar8/6BsVi2Ra0/fA/h2aw1R1UXOxKYs
	tjKV5WwevGDJ1J4b4LgKfNAmZ8CR
X-Google-Smtp-Source: APXvYqyxxSf4Xq74lnamghPadR9X21hlRQCzXIHiMW7wgYrTrNyljBguBLK5NFbmO+Nffj3BPedtNA==
X-Received: by 2002:a63:6c09:: with SMTP id h9mr9670272pgc.34.1581264608405;
	Sun, 09 Feb 2020 08:10:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.07
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:34 -0800
Message-Id: <a7f2302b76fa8944800bfcfa31827f43a5c8e0c1.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 06/29] gcc-9.2: fix bug #91102 'aarch64 ICE on Linux kernel with -Os'
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:07 -0000

From: Taras Kondratiuk via Openembedded-core <openembedded-core@lists.openembedded.org>

Linux kernel compilation for aarch64 triggers ICE if
CONFIG_CC_OPTIMIZE_FOR_SIZE=y.

The rootcause is GCC bug #91102 'aarch64 ICE on Linux kernel with -Os'.
Apply the fix to 9.2.

(From OE-Core rev: 14f34d32bfdaa752f5043e62750d2e7b92c4b419)

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-9.2.inc         |  1 +
 ...02-aarch64-ICE-on-Linux-kernel-with-.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
index c6395998d5..4f068231f3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
@@ -68,6 +68,7 @@ SRC_URI = "\
 	   file://CVE-2019-15847_1.patch \
 	   file://CVE-2019-15847_2.patch \
 	   file://CVE-2019-15847_3.patch \
+           file://re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
new file mode 100644
index 0000000000..c37e0bb9dd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
@@ -0,0 +1,95 @@
+From efb0ee06f5c0186c2d1442ecd4dbbd55dbd97b44 Mon Sep 17 00:00:00 2001
+From: Vladimir Makarov <vmakarov@redhat.com>
+Date: Wed, 10 Jul 2019 16:07:10 +0000
+Subject: [PATCH] re PR target/91102 (aarch64 ICE on Linux kernel with -Os
+ starting with r270266)
+
+2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
+
+	PR target/91102
+	* lra-constraints.c (process_alt_operands): Don't match user
+	defined regs only if they are early clobbers.
+
+2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
+
+	PR target/91102
+	* gcc.target/aarch64/pr91102.c: New test.
+
+From-SVN: r273357
+Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/613caed2feb9cfc8158308670b59df3d031ec629]
+[takondra: dropped conflicting ChangeLog changes]
+Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
+---
+ gcc/lra-constraints.c                      | 17 ++++++++++----
+ gcc/testsuite/gcc.target/aarch64/pr91102.c | 26 ++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 4 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/pr91102.c
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index cf33da8013e4..6382dbf852b6 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -2172,8 +2172,9 @@ process_alt_operands (int only_alternative)
+ 		    else
+ 		      {
+ 			/* Operands don't match.  If the operands are
+-			   different user defined explicit hard registers,
+-			   then we cannot make them match.  */
++			   different user defined explicit hard
++			   registers, then we cannot make them match
++			   when one is early clobber operand.  */
+ 			if ((REG_P (*curr_id->operand_loc[nop])
+ 			     || SUBREG_P (*curr_id->operand_loc[nop]))
+ 			    && (REG_P (*curr_id->operand_loc[m])
+@@ -2192,9 +2193,17 @@ process_alt_operands (int only_alternative)
+ 				&& REG_P (m_reg)
+ 				&& HARD_REGISTER_P (m_reg)
+ 				&& REG_USERVAR_P (m_reg))
+-			      break;
++			      {
++				int i;
++				
++				for (i = 0; i < early_clobbered_regs_num; i++)
++				  if (m == early_clobbered_nops[i])
++				    break;
++				if (i < early_clobbered_regs_num
++				    || early_clobber_p)
++				  break;
++			      }
+ 			  }
+-
+ 			/* Both operands must allow a reload register,
+ 			   otherwise we cannot make them match.  */
+ 			if (curr_alt[m] == NO_REGS)
+diff --git a/gcc/testsuite/gcc.target/aarch64/pr91102.c b/gcc/testsuite/gcc.target/aarch64/pr91102.c
+new file mode 100644
+index 000000000000..70b99045a48e
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/aarch64/pr91102.c
+@@ -0,0 +1,26 @@
++/* PR target/91102 */
++/* { dg-do compile } */
++/* { dg-options "-O2" } */
++
++int
++foo (long d, long l)
++{
++  register long e asm ("x1") = d;
++  register long f asm("x2") = l;
++  asm ("" : : "r" (e), "r" (f));
++  return 3;
++}
++
++struct T { int i; int j; };
++union S { long h; struct T t; };
++
++void
++bar (union S b)
++{
++  while (1)
++    {
++      union S c = b;
++      c.t.j++;
++      b.h = foo (b.h, c.h);
++    }
++}
-- 
2.17.1


